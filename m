Return-Path: <linux-renesas-soc+bounces-6534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E220F910244
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 13:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90152283402
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE6A1AAE3A;
	Thu, 20 Jun 2024 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ishOqkLa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04C1AAE31
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882009; cv=none; b=TQ4lFjbmsgUGVFhDUhrUlaZZR3WvXud2UCm+8lKMUMJ0HYwoNBHC4CiRZu5smJc3mHzkLAO35Apfd/4AY/TGZJM4zC/KBe4wgxL089hYLoRr9GQbwNy+iNGBkty6t6M5NaavJ63K0Cbe+Q9F0cP6+u6O03+nYHwCG4iZoP0H5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882009; c=relaxed/simple;
	bh=0+/fvaI1F1j41r++ySRwVX8sWA9jsES+Q1p9A5Ur71Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o628WihkEa3qf2u1xhVV4Tv2hDv13ZePhpizqLZRamIoX5vnTF2FAkP+lclBiqAsnnpQdYDKDbcp6CGeENhQ4YsES7ontCQlWWE5yqhV/m53vlvQ8Wqmk6iDqe/pZhPyQhEiNhJc1bqVL/bA6nL29oRYG9GaRJ1XdRnBfMwf/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ishOqkLa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718882006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UQjmCflZ8NhFeyUYmWh/XM+mJlYs/pUUbwyawTIunnY=;
	b=ishOqkLanzW1G5miIAFEfnbe0uWgaOAltlAuFr1jQAbFjjMcu4djd4FnPWLebXY7UzLQht
	bTpmZVKQ6MIO8PyB2nLIkJgy4szcxC+H3QPemIIFehuJKYatXrq7dYdQ34td+8DCBQVJvS
	DbkjUm5B2ygiEhKYDjzAxjN2qCgte+w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-wAC9r_ewPmqqdimT_x5qDQ-1; Thu, 20 Jun 2024 07:13:25 -0400
X-MC-Unique: wAC9r_ewPmqqdimT_x5qDQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b50790e82bso2801576d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 04:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718882005; x=1719486805;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQjmCflZ8NhFeyUYmWh/XM+mJlYs/pUUbwyawTIunnY=;
        b=ttEl41PeH0zmWXiUiXcvI3RRSoiBZaSW5afQv95ARDPL478SCW0jz3/iHhvPNjV3PM
         FeUSk0aitECqzPAx4vLuV2aegMxXELgFfObucyWixgJDraLvHnrkbSOUVBBe+u5OY65f
         iNUDqUMwue4GoxnGtqwRJ/UxYqrtKraEPHF0Flxp5lSS2UeP7yWJKWsM3kMXGEWf75Sk
         Dr17/LLquqa6DlBc4V9l+6iVFu9+sU0ItMVvyTqm6zS8VytGNV2S2TiO+BOokeOuGO0V
         js5GnxkBe4N5mRm9jqEvf4YvCY7BGIqi1mWQ0MYVHlqJPX370FGZsXo2LBLKh51ytYpp
         q6Fw==
X-Gm-Message-State: AOJu0Yz79lYt9K9Hs8TeargGGmjLwpL0wNd8M73sQ7u2GvCyMwja/j5x
	LrgKG2kWYFlbk/ES1Rfmd7LoBUjyWkfi1NtwrAeqINmCdjbv93ClFcphiARFjPiK0CxjZ4IArHH
	7bQWfOgViBcOg4JV50ASF6OY/mO+fFWnomLNubnxI2AQiFFn/kAH6D4x3A8uK1KQlx2hQ
X-Received: by 2002:ac8:5a4d:0:b0:444:bace:92e1 with SMTP id d75a77b69052e-444bace940dmr5524981cf.5.1718882004737;
        Thu, 20 Jun 2024 04:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrqjaWrlqYnMvIoDdXdQ5Zws/w/cHzrwzrcJ6ibt9i50YYG3iqrT3Ple64jxcoxhjecVZwrg==
X-Received: by 2002:ac8:5a4d:0:b0:444:bace:92e1 with SMTP id d75a77b69052e-444bace940dmr5524761cf.5.1718882004294;
        Thu, 20 Jun 2024 04:13:24 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0b7:b110::f71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d89c7sm73496741cf.20.2024.06.20.04.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:13:23 -0700 (PDT)
Message-ID: <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
From: Paolo Abeni <pabeni@redhat.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,  netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Date: Thu, 20 Jun 2024 13:13:21 +0200
In-Reply-To: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-06-18 at 11:08 +0200, Niklas S=C3=B6derlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
>=20
> The driver supports Rx checksum and offload and hardware timestamps.
>=20
> While full power management and suspend/resume is not yet supported the
> driver enables runtime PM in order to enable the module clock. While
> explicit clock management using clk_enable() would suffice for the
> supported SoC, the module could be reused on SoCs where the module is
> part of a power domain.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

I'm sorry for giving such fundamental feedback this late, but I think
this should be split in series to simplify the review process.

You could e.g. introduce the defines and probe in patch 1, the rx path
in patch 2, and the tx path in patch 3.

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
> +		/* Stop processing descriptors if budget is consumed. */
> +		if (rx_packets >=3D budget)
> +			break;
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

Since the driver uses napi this should be napi_gro_receive().

> +
> +		/* Update statistics. */
> +		priv->stats.rx_packets++;
> +		priv->stats.rx_bytes +=3D pkt_len;
> +
> +		/* Update counters. */
> +		priv->cur_rx++;
> +		rx_packets++;
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
> +			skb =3D napi_alloc_skb(&priv->napi,
> +					     PKT_BUF_SZ + RTSN_ALIGN - 1);

skb allocation is preferred at receive time, so that the sk_buff itself
is hot in the cache. Adapting to such style would likely require a
larger refactor, so feel free to avoid it.

Cheers,

Paolo


