Return-Path: <linux-renesas-soc+bounces-6153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3849070AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 14:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BC12838CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 12:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E149D13D601;
	Thu, 13 Jun 2024 12:29:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D6D13C8E1;
	Thu, 13 Jun 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718281780; cv=none; b=rHdCScRGkiZlvUOiiigLYMbwrd47py5pFRH3YLQppANPzipPjxNcGTIOekIKPGWVo/5U71fib6Tik4tDH5x6I4WEIBhMQjOBNkQScFBRIeoLTu2tT5/eh2yXICs2qA05nhhxh52Jpsd6/CeAMXSgGUUVZYmHR5oF0jhGToOEirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718281780; c=relaxed/simple;
	bh=knw14aYIWcVfc6J0Mr0RHVTVVsB0GgkKbeVUS5R6uyk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LCnDUn1JKQ3bLZoSE75FU460XCos7z81YMd1lW5ps1IXmIchydJKhx+EgdaOs/QNi2BxT5KW3S/0MGchwNBjz7J+5DEPFocAHq4Z5agP1mWD46azIhr1o/+kILmjjZQCQSQ4U0XKM/sbLJEljIdtUV1/bX1oHCSuJLsZDSTVdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,235,1712588400"; 
   d="asc'?scan'208";a="207794453"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jun 2024 21:29:35 +0900
Received: from [10.226.93.204] (unknown [10.226.93.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5A39E4329EB8;
	Thu, 13 Jun 2024 21:29:32 +0900 (JST)
Message-ID: <306484c7-4a8c-45ba-b0c6-74514a522f05@bp.renesas.com>
Date: Thu, 13 Jun 2024 13:29:30 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: Re: [net-next,v8] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-GB
Organization: Renesas Electronics Corporation
In-Reply-To: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2MP6NEUQsVoWKgtKARm0mqGi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2MP6NEUQsVoWKgtKARm0mqGi
Content-Type: multipart/mixed; boundary="------------ZFFVBejAPQY8KvydEKALj2bw";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <306484c7-4a8c-45ba-b0c6-74514a522f05@bp.renesas.com>
Subject: Re: [net-next,v8] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
References: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>

--------------ZFFVBejAPQY8KvydEKALj2bw
Content-Type: multipart/mixed; boundary="------------SEjJMspygJXbzyPxPJF0ZWYm"

--------------SEjJMspygJXbzyPxPJF0ZWYm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13/06/2024 11:41, Niklas S=C3=B6derlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Ca=
r
> V4H. The Ethernet End-station can connect to an Ethernet network using =
a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
>=20
> The driver supports Rx checksum and offload and hardware timestamps.
>=20
> While full power management and suspend/resume is not yet supported the=

> driver enables runtime PM in order to enable the module clock. While
> explicit clock management using clk_enable() would suffice for the
> supported SoC, the module could be reused on SoCs where the module is
> part of a power domain.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
> * Changes since v7
> - Properly handle Rx when netpoll is called with 0 budget. Previously
>    one Rx packet would be processed in this case.
> - Use napi_alloc_skb() instead of netdev_alloc_skb() in Rx.
> - Use device implemented 64 bit stats instead of using stats member in
>    struct net_device.
> - Implement ndo_hwtstamp_{g,s}et instead of acting on SIOC{G,S}HWTSTAMP=

>    in do_ioctl().
> - Fix incorrect error sign when using PTR_ERR().
> - Add missing cosmetic space when creating struct of_device_id.
> - Rename label error_alloc to error_free.
>=20
> * Changes since v6
> - Fix warning added when removing delays depending on phy-mode logic.
>=20
> * Changes since v5
> - Removed delays depending on phy-mode logic. This is only needed on
>    some SoCs (V4H multiple boards), and currently we can't test on them=
=2E
>    As this have been a hot topic in review drop it for now so we can
>    support V4H single boards which we can test and lets work on the del=
ay
>    on-top when we can test it.
>=20
> * Changes since v4
> - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
>=20
> * Changes since v3
> - Add description to commit message why PM operations are used instead
>    of explicit management of the clock.
>=20
> * Changes since v2
> - Drop extra call to ether_setup(), already called by
>    alloc_etherdev_mqs().
> - Remove dependency on MII.
> - Improve error paths when requestion IRQs.
> - Correct the interpretation of which  phy-mode to apply delays for, an=
d
>    mask the phy-mode passed to the PHY if MAC adds delays.
>=20
> * Changes since v1
> - Remove C45 read/write functions, the phy-core can do that for us.
> - Rework the driver to register the MDIO bus at probe time instead of a=
t
>    ndo_open().
> - Rework rtsn_rx() to take advantages of the improved design proposed
>    and upstreamed for R-Car RAVB driver Rx code-path.
> - Use napi_complete_done() instead of napi_complete().
> - Update commit message to list that the driver supports Rx CSUM
>    offload.
> - Drop unneeded __iowmb() left from development as well as a stray ;.
> - Consider all RGMII modes.
> - Move the phy_stop() call to mirror where phy_start() is called.
> - Forward IOCTLS from rtsn_do_ioctl() to PHY using ndo_eth_ioctl()
> - Align variable names to match core for IOCTLS functions.
> - Make sure DMA mask and PTP is registered before registering the ndev.=

> - Document why the RTSN driver needs to be able to apply delays
> - Add checks for which phy-modes the MAC driver can apply delays
> - Use snprintf() instead of sprintf()
>=20
> * Changes since RFC
> - Fix issues in MDIO communication.
> - Use a dedicated OF node for the MDIO bus.
> ---
>   MAINTAINERS                           |    8 +
>   drivers/net/ethernet/renesas/Kconfig  |   10 +
>   drivers/net/ethernet/renesas/Makefile |    2 +
>   drivers/net/ethernet/renesas/rtsn.c   | 1381 ++++++++++++++++++++++++=
+
>   drivers/net/ethernet/renesas/rtsn.h   |  464 +++++++++
>   5 files changed, 1865 insertions(+)
>   create mode 100644 drivers/net/ethernet/renesas/rtsn.c
>   create mode 100644 drivers/net/ethernet/renesas/rtsn.h

[snip]

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
> +			ts.tv_nsec =3D le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff))=
;
> +
> +			shhwtstamps->hwtstamp =3D timespec64_to_ktime(ts);
> +		}
> +
> +		skb_put(skb, pkt_len);
> +		skb->protocol =3D eth_type_trans(skb, ndev);
> +		netif_receive_skb(skb);
> +
> +		/* Update statistics. */
> +		priv->stats.rx_packets++;

I think it's better to do `priv->stats.rx_packets +=3D rx_packets` once a=
t
the end of this function instead of repeatedly incrementing another
variable on the hot path.

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

[snip]

> +static netdev_tx_t rtsn_start_xmit(struct sk_buff *skb, struct net_dev=
ice *ndev)
> +{
> +	struct rtsn_private *priv =3D netdev_priv(ndev);
> +	struct rtsn_ext_desc *desc;
> +	int ret =3D NETDEV_TX_OK;
> +	unsigned long flags;
> +	dma_addr_t dma_addr;
> +	int entry;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +
> +	if (priv->cur_tx - priv->dirty_tx > priv->num_tx_ring) {
> +		netif_stop_subqueue(ndev, 0);
> +		ret =3D NETDEV_TX_BUSY;
> +		goto out;
> +	}
> +
> +	if (skb_put_padto(skb, ETH_ZLEN))
> +		goto out;
> +
> +	dma_addr =3D dma_map_single(ndev->dev.parent, skb->data, skb->len,
> +				  DMA_TO_DEVICE);
> +	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
> +		dev_kfree_skb_any(skb);
> +		goto out;
> +	}
> +
> +	entry =3D priv->cur_tx % priv->num_tx_ring;
> +	priv->tx_skb[entry] =3D skb;
> +	desc =3D &priv->tx_ring[entry];
> +	desc->dptr =3D cpu_to_le32(dma_addr);
> +	desc->info_ds =3D cpu_to_le16(skb->len);

Should we check against the maximum TX frame size supported by the
hardware here?

Whatever we do here, we should also do in the ravb driver as that makes
a similar cpu_to_le16() call to fill the DS field with no check that the
HW actually supports transmitting a frame of the given size.

> +	desc->info1 =3D cpu_to_le64(skb->len);
> +
> +	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
> +		skb_shinfo(skb)->tx_flags |=3D SKBTX_IN_PROGRESS;
> +		priv->ts_tag++;
> +		desc->info_ds |=3D cpu_to_le16(TXC);
> +		desc->info =3D priv->ts_tag;
> +	}
> +
> +	skb_tx_timestamp(skb);
> +	dma_wmb();
> +
> +	desc->die_dt =3D DT_FSINGLE | D_DIE;
> +	priv->cur_tx++;
> +
> +	/* Start xmit */
> +	rtsn_write(priv, TRCR0, BIT(TX_CHAIN_IDX));
> +out:
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +	return ret;
> +}

Thanks,

--=20
Paul Barker
--------------SEjJMspygJXbzyPxPJF0ZWYm
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------SEjJMspygJXbzyPxPJF0ZWYm--

--------------ZFFVBejAPQY8KvydEKALj2bw--

--------------2MP6NEUQsVoWKgtKARm0mqGi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZmrmKgUDAAAAAAAKCRDbaV4Vf/JGvfQO
APsFjEEa4d62+6M18ztkm9lfSU8DstDyO1JqqVwZI9cU2wD/SpT4qTqb+vZCyKgv4CtR/7glSZ1y
1CL2IKBlVwCloAU=
=zoT4
-----END PGP SIGNATURE-----

--------------2MP6NEUQsVoWKgtKARm0mqGi--

