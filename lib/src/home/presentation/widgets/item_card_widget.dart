import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {super.key});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(context),
            const SizedBox(height: 8),
            _buildTitle(theme),
            const SizedBox(height: 4),
            _buildInfoRow(theme),
          ],
        ),
      ),
    );
  }

  /// Builds the image section with proper error and loading handling
  Widget _buildImageSection(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: item.thumbnail.isNotEmpty
            ? Hero(
                tag: 'product_${item.id}',
                child: Image.network(
                  item.thumbnail,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(context);
                  },
                ),
              )
            : _buildPlaceholder(context),
      ),
    );
  }

  /// Builds placeholder when image is unavailable
  Widget _buildPlaceholder(BuildContext context) {
    final initial = item.title.isNotEmpty
        ? item.title.trim()[0].toUpperCase()
        : '?';

    return Center(
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            initial,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the product title with overflow handling
  Widget _buildTitle(ThemeData theme) {
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    );
  }

  /// Builds the rating and price information row
  Widget _buildInfoRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating section
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                size: 14,
                color: Colors.amber[700],
              ),
              const SizedBox(width: 4),
              Text(
                item.rating.toStringAsFixed(1),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Price section
        Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
