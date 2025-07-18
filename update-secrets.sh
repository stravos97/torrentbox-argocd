#!/bin/bash

# Update TorrentBox secrets from GitHub repository secrets
# This script fetches secrets from GitHub and updates the Kubernetes manifests

echo "🔄 Updating TorrentBox secrets from GitHub repository..."

# Get secrets from GitHub (requires gh CLI)
WIREGUARD_PRIVATE_KEY=$(gh secret list | grep WIREGUARD_PRIVATE_KEY && echo "Available" || echo "Missing")
QBITTORRENT_PASSWORD=$(gh secret list | grep QBITTORRENT_PASSWORD && echo "Available" || echo "Missing")
DISCORD_BOT_TOKEN=$(gh secret list | grep DISCORD_BOT_TOKEN && echo "Available" || echo "Missing")
RADARR_API_KEY=$(gh secret list | grep RADARR_API_KEY && echo "Available" || echo "Missing")
SONARR_API_KEY=$(gh secret list | grep SONARR_API_KEY && echo "Available" || echo "Missing")
PLEX_CLAIM=$(gh secret list | grep PLEX_CLAIM && echo "Available" || echo "Missing")

echo "📊 Secret Status:"
echo "  WIREGUARD_PRIVATE_KEY: $WIREGUARD_PRIVATE_KEY"
echo "  QBITTORRENT_PASSWORD: $QBITTORRENT_PASSWORD"
echo "  DISCORD_BOT_TOKEN: $DISCORD_BOT_TOKEN"
echo "  RADARR_API_KEY: $RADARR_API_KEY"
echo "  SONARR_API_KEY: $SONARR_API_KEY"
echo "  PLEX_CLAIM: $PLEX_CLAIM"

echo ""
echo "ℹ️  To apply secrets to the cluster, use:"
echo "   kubectl apply -f kubernetes/base/secret.yaml"
echo "   kubectl apply -f kubernetes/base/torrentbox-secrets.yaml"
echo ""
echo "🎯 ArgoCD will automatically sync these changes to the cluster!"