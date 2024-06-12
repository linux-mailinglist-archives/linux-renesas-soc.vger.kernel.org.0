Return-Path: <linux-renesas-soc+bounces-6090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C84904938
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 04:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B85D2B20CC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 02:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D172710795;
	Wed, 12 Jun 2024 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2kgRJQN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD682261F;
	Wed, 12 Jun 2024 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718160978; cv=none; b=pIIBi0+IPLrKlBdYJ4Z2wSsE2nb+mlM1NFgMM4zWVb8AllNBx9Hzj0UE5Z7oONrWohQN2j8TkBi4djQPnFcao4bVGYQlscAg1k+g0xmT3is9vsTQWASy3wVozU8LJMepCaHhcKhOiifvgXGuidKSCe6kqKOCVHcdeKaA1MFHoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718160978; c=relaxed/simple;
	bh=vVyurzJ1FX/ixK4FXiHiQFh+EqO7La/SC2W5qgw9/x8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBuTCMHXLVzT2MYsKe7Fmo8E/08zhNHSmZBP2feXgFEbHf+u4C2WyDm4lnEtX6cBWIvd6pi1OLzChNrLp2GEAWjVPKzNEl2ighe7K9BkvP1gIEIkmRkfB0YRs26Gmter8nKU1Iwq97SHC4qniCYQkY/gE1Casi9mpp4UcNgy//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2kgRJQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE019C2BD10;
	Wed, 12 Jun 2024 02:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718160978;
	bh=vVyurzJ1FX/ixK4FXiHiQFh+EqO7La/SC2W5qgw9/x8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D2kgRJQNDfpbSfqiYrh1wv8RFPIK/iVc+QOPaFZBp2nXErDBHocCmAafDkoegFtH2
	 GnISUd99E4RC8TKdRcw83yGCcd6CDuytVZUtyAwam01sb14Kc5HRE+oVEhaesV1UyO
	 c2Xn0pEYd0XW4wgofTmJ1rztTDm6vwiWWP7mhWmOOOp8sHsGnZ1wkNy3+ItRi8RJl5
	 eSJs4NniXILNSw9ylGNIO+eDT1qWvG6FLREsNOnpfVVXn/jmnEx6iS6UZ3QGcnAwDo
	 AKZSVQaCU0UGYAnFsbgTZkymL4t5hI4S9tfkoNyeWzTUC3ebaaYkKRY70ve2tTbnRF
	 It6rLp/H2xpGw==
Date: Tue, 11 Jun 2024 19:56:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v6] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240611195616.2e71c334@kernel.org>
In-Reply-To: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jun 2024 15:59:35 +0200 Niklas S=C3=B6derlund wrote:
> +static int rtsn_rx(struct net_device *ndev, int budget)
> +{
> +	struct rtsn_private *priv =3D netdev_priv(ndev);
> +	unsigned int ndescriptors;
> +	unsigned int rx_packets;
> +	unsigned int i;
> +	bool get_ts;
> +
> +	get_ts =3D priv->ptp_priv->tstamp_rx_ctrl &
> +		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> +
> +	ndescriptors =3D priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
> +	rx_packets =3D 0;
> +	for (i =3D 0; i < ndescriptors; i++) {
> +		const unsigned int entry =3D priv->cur_rx % priv->num_rx_ring;
> +		struct rtsn_ext_ts_desc *desc =3D &priv->rx_ring[entry];
> +		struct sk_buff *skb;
> +		dma_addr_t dma_addr;
> +		u16 pkt_len;
> +
> +		/* Stop processing descriptors on first empty. */
> +		if ((desc->die_dt & DT_MASK) =3D=3D DT_FEMPTY)
> +			break;
> +
> +		dma_rmb();
> +		pkt_len =3D le16_to_cpu(desc->info_ds) & RX_DS;
> +
> +		skb =3D priv->rx_skb[entry];
> +		priv->rx_skb[entry] =3D NULL;
> +		dma_addr =3D le32_to_cpu(desc->dptr);
> +		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
> +				 DMA_FROM_DEVICE);
> +
> +		/* Get timestamp if enabled. */
> +		if (get_ts) {
> +			struct skb_shared_hwtstamps *shhwtstamps;
> +			struct timespec64 ts;
> +
> +			shhwtstamps =3D skb_hwtstamps(skb);
> +			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> +
> +			ts.tv_sec =3D (u64)le32_to_cpu(desc->ts_sec);
> +			ts.tv_nsec =3D le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
> +
> +			shhwtstamps->hwtstamp =3D timespec64_to_ktime(ts);
> +		}
> +
> +		skb_put(skb, pkt_len);
> +		skb->protocol =3D eth_type_trans(skb, ndev);
> +		netif_receive_skb(skb);
> +
> +		/* Update statistics. */
> +		ndev->stats.rx_packets++;
> +		ndev->stats.rx_bytes +=3D pkt_len;
> +
> +		/* Update counters. */
> +		priv->cur_rx++;
> +		rx_packets++;
> +
> +		/* Stop processing descriptors if budget is consumed. */
> +		if (rx_packets >=3D budget)
> +			break;

budget can also be 0 when netpoll calls us to only process tx, don't
process even a single packet in that case. (BTW also double check you
never printk() under the spin lock you take in NAPI)

> +	}
> +
> +	/* Refill the RX ring buffers */
> +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> +		const unsigned int entry =3D priv->dirty_rx % priv->num_rx_ring;
> +		struct rtsn_ext_ts_desc *desc =3D &priv->rx_ring[entry];
> +		struct sk_buff *skb;
> +		dma_addr_t dma_addr;
> +
> +		desc->info_ds =3D cpu_to_le16(PKT_BUF_SZ);
> +
> +		if (!priv->rx_skb[entry]) {
> +			skb =3D netdev_alloc_skb(ndev,
> +					       PKT_BUF_SZ + RTSN_ALIGN - 1);

napi_alloc_skb()

> +			if (!skb)
> +				break;
> +			skb_reserve(skb, NET_IP_ALIGN);
> +			dma_addr =3D dma_map_single(ndev->dev.parent, skb->data,
> +						  le16_to_cpu(desc->info_ds),
> +						  DMA_FROM_DEVICE);
> +			if (dma_mapping_error(ndev->dev.parent, dma_addr))
> +				desc->info_ds =3D cpu_to_le16(0);
> +			desc->dptr =3D cpu_to_le32(dma_addr);
> +			skb_checksum_none_assert(skb);
> +			priv->rx_skb[entry] =3D skb;
> +		}
> +
> +		dma_wmb();
> +		desc->die_dt =3D DT_FEMPTY | D_DIE;
> +	}
> +
> +	priv->rx_ring[priv->num_rx_ring].die_dt =3D DT_LINK;
> +
> +	return rx_packets;
> +}

> +static struct net_device_stats *rtsn_get_stats(struct net_device *ndev)
> +{
> +	return &ndev->stats;
> +}

Please implement your own 64 bit stats:

	struct net_device_stats	stats; /* not used by modern drivers */

> +static int rtsn_do_ioctl(struct net_device *ndev, struct ifreq *ifr, int=
 cmd)
> +{
> +	if (!netif_running(ndev))
> +		return -ENODEV;
> +
> +	switch (cmd) {
> +	case SIOCGHWTSTAMP:
> +		return rtsn_hwstamp_get(ndev, ifr);
> +	case SIOCSHWTSTAMP:
> +		return rtsn_hwstamp_set(ndev, ifr);

please implement ndo_hwtstamp_{g,s}et instead

> +	default:
> +		break;
> +	}
> +
> +	return phy_do_ioctl_running(ndev, ifr, cmd);
> +}

> +static const struct of_device_id rtsn_match_table[] =3D {
> +	{.compatible =3D "renesas,r8a779g0-ethertsn", },

space missing

> +	{ /* Sentinel */ }
> +};

> +	priv->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret =3D -PTR_ERR(priv->reset);

PTR_ERR() should give you negative errno

> +	priv->ptp_priv->addr =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->ptp_priv->addr)) {
> +		ret =3D -PTR_ERR(priv->ptp_priv->addr);

ditto

> +	ret =3D rtsn_get_phy_params(priv);
> +	if (ret)
> +		goto error_alloc;

error_free (please name the labels after target)

> +	netdev_info(ndev, "MAC address %pM\n", ndev->dev_addr);

That's fairly unusual, why print the MAC address to logs?
--=20
pw-bot: cr

