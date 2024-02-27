Return-Path: <linux-renesas-soc+bounces-3286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE386A15E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7691F21EBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 21:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9C914F98B;
	Tue, 27 Feb 2024 21:11:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D62E14EFDF;
	Tue, 27 Feb 2024 21:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709068304; cv=none; b=CP6S89eS7mZdP18PLwJQLAbhUfHWX69G/kk6wvuRJy0YzVwKt+mL+RP8h9Iz88lsia2ZK+yIB5EhGgbLPVDk+uhdZIFWlQur6VwoLyA+vDr/FKEENMAS9CLUsqR56z4uX8+8oVI2qnx++cMEEFmd/6P9ztk3yPlYsBSodHV+H+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709068304; c=relaxed/simple;
	bh=Yh/WdoCDWTB1ZCRy/HfkRO6iV8ypjfA2AC9oVtu8UMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNK/ehSvraAztKmtsyb192XY2KYezVesOty8DOYoB9Wsadgt343mI7s/k/1MliMOWXIeHOvL2+afc4kIpWtNMbH7h2EuSeKxriHtEa6kWlaf10PMgnLAn3iO0wVe4reWkzm52HwLKuTeg3xi3h5XWauRz426JNEDaj1LiBpwzEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,188,1705330800"; 
   d="asc'?scan'208";a="195555947"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Feb 2024 06:11:39 +0900
Received: from [10.226.92.31] (unknown [10.226.92.31])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CF0DE400CEF0;
	Wed, 28 Feb 2024 06:11:35 +0900 (JST)
Message-ID: <67d079cf-a0d7-4ef3-a2a5-e8469e474647@bp.renesas.com>
Date: Tue, 27 Feb 2024 21:11:34 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 6/6] ravb: Unify Rx ring maintenance code paths
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227014014.44855-7-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240227014014.44855-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C1MR2f9fSnTE0juRLqNDwU7n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C1MR2f9fSnTE0juRLqNDwU7n
Content-Type: multipart/mixed; boundary="------------I05LpNk8A3cVtpXjET5Kor8n";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <67d079cf-a0d7-4ef3-a2a5-e8469e474647@bp.renesas.com>
Subject: Re: [net-next 6/6] ravb: Unify Rx ring maintenance code paths
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227014014.44855-7-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240227014014.44855-7-niklas.soderlund+renesas@ragnatech.se>

--------------I05LpNk8A3cVtpXjET5Kor8n
Content-Type: multipart/mixed; boundary="------------Y2mAZ0GIjx6Sgqbfu0VZLRQc"

--------------Y2mAZ0GIjx6Sgqbfu0VZLRQc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2024 01:40, Niklas S=C3=B6derlund wrote:
> The R-Car and RZ/G2L Rx code paths was split in two separate
> implementations when support for RZ/G2L was added due to the fact that
> R-Car uses the extended descriptor format while RZ/G2L uses normal
> descriptors. This has lead to a duplication of Rx logic with the only
> difference being the different Rx descriptors types used. The
> implementation however neglects to take into account that extended
> descriptors are normal descriptors with additional metadata at the end
> to carry hardware timestamp information.
>=20
> The hardware timestamps information is only consumed in the R-Car Rx
> loop and all the maintenance code around the Rx ring can be shared
> between the two implementations if the difference in descriptor length
> is carefully considered.
>=20
> This change merges the two implementations for Rx ring maintenance by
> adding a method to access both types of descriptors as normal
> descriptors, as this part covers all the fields needed for Rx ring
> maintenance the only difference between using normal or extended
> descriptor is the size of the memory region to allocate/free and the
> step size between each descriptor in the ring.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |   5 +-
>  drivers/net/ethernet/renesas/ravb_main.c | 132 ++++++-----------------=

>  2 files changed, 32 insertions(+), 105 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> index b12b379baf5a..b48935ec7e28 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1039,9 +1039,6 @@ struct ravb_ptp {
>  };
> =20
>  struct ravb_hw_info {
> -	void (*rx_ring_free)(struct net_device *ndev, int q);
> -	void (*rx_ring_format)(struct net_device *ndev, int q);
> -	void *(*alloc_rx_desc)(struct net_device *ndev, int q);
>  	bool (*receive)(struct net_device *ndev, int *quota, int q);
>  	void (*set_rate)(struct net_device *ndev);
>  	int (*set_feature)(struct net_device *ndev, netdev_features_t feature=
s);
> @@ -1055,6 +1052,7 @@ struct ravb_hw_info {
>  	u32 tccr_mask;
>  	u32 rx_max_frame_size;
>  	u32 rx_max_desc_use;
> +	u32 rx_desc_size;
>  	unsigned aligned_tx: 1;
> =20
>  	/* hardware features */
> @@ -1090,6 +1088,7 @@ struct ravb_private {
>  	union {
>  		struct ravb_rx_desc *desc;
>  		struct ravb_ex_rx_desc *ex_desc;
> +		void *raw;
>  	} rx_ring[NUM_RX_QUEUE];
>  	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
>  	void *tx_align[NUM_TX_QUEUE];
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index dee51a78cf36..2702455b6cc6 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -200,6 +200,13 @@ static const struct mdiobb_ops bb_ops =3D {
>  	.get_mdio_data =3D ravb_get_mdio_data,
>  };
> =20
> +static struct ravb_rx_desc *
> +ravb_rx_get_desc(struct ravb_private *priv, unsigned int q,
> +		 unsigned int i)
> +{
> +	return priv->rx_ring[q].raw + priv->info->rx_desc_size * i;
> +}
> +
>  /* Free TX skb function for AVB-IP */
>  static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed=
_only)
>  {
> @@ -244,17 +251,17 @@ static int ravb_tx_free(struct net_device *ndev, =
int q, bool free_txed_only)
>  	return free_num;
>  }
> =20
> -static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
> +static void ravb_rx_ring_free(struct net_device *ndev, int q)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	unsigned int ring_size;
>  	unsigned int i;
> =20
> -	if (!priv->rx_ring[q].desc)
> +	if (!priv->rx_ring[q].raw)
>  		return;
> =20
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		struct ravb_rx_desc *desc =3D &priv->rx_ring[q].desc[i];
> +		struct ravb_rx_desc *desc =3D ravb_rx_get_desc(priv, q, i);
> =20
>  		if (!dma_mapping_error(ndev->dev.parent,
>  				       le32_to_cpu(desc->dptr)))
> @@ -263,48 +270,21 @@ static void ravb_rx_ring_free_gbeth(struct net_de=
vice *ndev, int q)
>  					 priv->info->rx_max_frame_size,
>  					 DMA_FROM_DEVICE);
>  	}
> -	ring_size =3D sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1=
);
> -	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].desc,=

> +	ring_size =3D priv->info->rx_desc_size * (priv->num_rx_ring[q] + 1);
> +	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].raw,
>  			  priv->rx_desc_dma[q]);
> -	priv->rx_ring[q].desc =3D NULL;
> -}
> -
> -static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
> -{
> -	struct ravb_private *priv =3D netdev_priv(ndev);
> -	unsigned int ring_size;
> -	unsigned int i;
> -
> -	if (!priv->rx_ring[q].ex_desc)
> -		return;
> -
> -	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		struct ravb_ex_rx_desc *desc =3D &priv->rx_ring[q].ex_desc[i];
> -
> -		if (!dma_mapping_error(ndev->dev.parent,
> -				       le32_to_cpu(desc->dptr)))
> -			dma_unmap_single(ndev->dev.parent,
> -					 le32_to_cpu(desc->dptr),
> -					 priv->info->rx_max_frame_size,
> -					 DMA_FROM_DEVICE);
> -	}
> -	ring_size =3D sizeof(struct ravb_ex_rx_desc) *
> -		    (priv->num_rx_ring[q] + 1);
> -	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].ex_de=
sc,
> -			  priv->rx_desc_dma[q]);
> -	priv->rx_ring[q].ex_desc =3D NULL;
> +	priv->rx_ring[q].raw =3D NULL;
>  }
> =20
>  /* Free skb's and DMA buffers for Ethernet AVB */
>  static void ravb_ring_free(struct net_device *ndev, int q)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
> -	const struct ravb_hw_info *info =3D priv->info;
>  	unsigned int num_tx_desc =3D priv->num_tx_desc;
>  	unsigned int ring_size;
>  	unsigned int i;
> =20
> -	info->rx_ring_free(ndev, q);
> +	ravb_rx_ring_free(ndev, q);
> =20
>  	if (priv->tx_ring[q]) {
>  		ravb_tx_free(ndev, q, false);
> @@ -335,7 +315,7 @@ static void ravb_ring_free(struct net_device *ndev,=
 int q)
>  	priv->tx_skb[q] =3D NULL;
>  }
> =20
> -static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
> +static void ravb_rx_ring_format(struct net_device *ndev, int q)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	struct ravb_rx_desc *rx_desc;
> @@ -344,11 +324,11 @@ static void ravb_rx_ring_format_gbeth(struct net_=
device *ndev, int q)
>  	unsigned int i;
> =20
>  	rx_ring_size =3D sizeof(*rx_desc) * priv->num_rx_ring[q];

I think `sizeof(*rx_desc)` should be changed to
`priv->info->rx_desc_size`.

> -	memset(priv->rx_ring[q].desc, 0, rx_ring_size);
> +	memset(priv->rx_ring[q].raw, 0, rx_ring_size);
>  	/* Build RX ring buffer */
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
> -		rx_desc =3D &priv->rx_ring[q].desc[i];
> +		rx_desc =3D ravb_rx_get_desc(priv, q, i);
>  		rx_desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
>  					  priv->info->rx_max_frame_size,
> @@ -361,37 +341,7 @@ static void ravb_rx_ring_format_gbeth(struct net_d=
evice *ndev, int q)
>  		rx_desc->dptr =3D cpu_to_le32(dma_addr);
>  		rx_desc->die_dt =3D DT_FEMPTY;
>  	}
> -	rx_desc =3D &priv->rx_ring[q].desc[i];
> -	rx_desc->dptr =3D cpu_to_le32((u32)priv->rx_desc_dma[q]);
> -	rx_desc->die_dt =3D DT_LINKFIX; /* type */
> -}
> -
> -static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
> -{
> -	struct ravb_private *priv =3D netdev_priv(ndev);
> -	struct ravb_ex_rx_desc *rx_desc;
> -	unsigned int rx_ring_size =3D sizeof(*rx_desc) * priv->num_rx_ring[q]=
;
> -	dma_addr_t dma_addr;
> -	unsigned int i;
> -
> -	memset(priv->rx_ring[q].ex_desc, 0, rx_ring_size);
> -	/* Build RX ring buffer */
> -	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		/* RX descriptor */
> -		rx_desc =3D &priv->rx_ring[q].ex_desc[i];
> -		rx_desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
> -		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
> -					  priv->info->rx_max_frame_size,
> -					  DMA_FROM_DEVICE);
> -		/* We just set the data size to 0 for a failed mapping which
> -		 * should prevent DMA from happening...
> -		 */
> -		if (dma_mapping_error(ndev->dev.parent, dma_addr))
> -			rx_desc->ds_cc =3D cpu_to_le16(0);
> -		rx_desc->dptr =3D cpu_to_le32(dma_addr);
> -		rx_desc->die_dt =3D DT_FEMPTY;
> -	}
> -	rx_desc =3D &priv->rx_ring[q].ex_desc[i];
> +	rx_desc =3D ravb_rx_get_desc(priv, q, i);
>  	rx_desc->dptr =3D cpu_to_le32((u32)priv->rx_desc_dma[q]);
>  	rx_desc->die_dt =3D DT_LINKFIX; /* type */
>  }
> @@ -400,7 +350,6 @@ static void ravb_rx_ring_format_rcar(struct net_dev=
ice *ndev, int q)
>  static void ravb_ring_format(struct net_device *ndev, int q)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
> -	const struct ravb_hw_info *info =3D priv->info;
>  	unsigned int num_tx_desc =3D priv->num_tx_desc;
>  	struct ravb_tx_desc *tx_desc;
>  	struct ravb_desc *desc;
> @@ -413,7 +362,7 @@ static void ravb_ring_format(struct net_device *nde=
v, int q)
>  	priv->dirty_rx[q] =3D 0;
>  	priv->dirty_tx[q] =3D 0;
> =20
> -	info->rx_ring_format(ndev, q);
> +	ravb_rx_ring_format(ndev, q);
> =20
>  	memset(priv->tx_ring[q], 0, tx_ring_size);
>  	/* Build TX ring buffer */
> @@ -439,31 +388,18 @@ static void ravb_ring_format(struct net_device *n=
dev, int q)
>  	desc->dptr =3D cpu_to_le32((u32)priv->tx_desc_dma[q]);
>  }
> =20
> -static void *ravb_alloc_rx_desc_gbeth(struct net_device *ndev, int q)
> +static void *ravb_alloc_rx_desc(struct net_device *ndev, int q)
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	unsigned int ring_size;
> =20
> -	ring_size =3D sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1=
);
> +	ring_size =3D priv->info->rx_desc_size * (priv->num_rx_ring[q] + 1);
> =20
> -	priv->rx_ring[q].desc =3D dma_alloc_coherent(ndev->dev.parent, ring_s=
ize,
> -						   &priv->rx_desc_dma[q],
> -						   GFP_KERNEL);
> -	return priv->rx_ring[q].desc;
> -}
> +	priv->rx_ring[q].raw =3D dma_alloc_coherent(ndev->dev.parent, ring_si=
ze,
> +						  &priv->rx_desc_dma[q],
> +						  GFP_KERNEL);
> =20
> -static void *ravb_alloc_rx_desc_rcar(struct net_device *ndev, int q)
> -{
> -	struct ravb_private *priv =3D netdev_priv(ndev);
> -	unsigned int ring_size;
> -
> -	ring_size =3D sizeof(struct ravb_ex_rx_desc) * (priv->num_rx_ring[q] =
+ 1);
> -
> -	priv->rx_ring[q].ex_desc =3D dma_alloc_coherent(ndev->dev.parent,
> -						      ring_size,
> -						      &priv->rx_desc_dma[q],
> -						      GFP_KERNEL);
> -	return priv->rx_ring[q].ex_desc;
> +	return priv->rx_ring[q].raw;
>  }
> =20
>  /* Init skb and descriptor buffer for Ethernet AVB */
> @@ -500,7 +436,7 @@ static int ravb_ring_init(struct net_device *ndev, =
int q)
>  	}
> =20
>  	/* Allocate all RX descriptors. */
> -	if (!info->alloc_rx_desc(ndev, q))
> +	if (!ravb_alloc_rx_desc(ndev, q))
>  		goto error;
> =20
>  	priv->dirty_rx[q] =3D 0;
> @@ -2677,9 +2613,6 @@ static int ravb_mdio_release(struct ravb_private =
*priv)
>  }
> =20
>  static const struct ravb_hw_info ravb_gen3_hw_info =3D {
> -	.rx_ring_free =3D ravb_rx_ring_free_rcar,
> -	.rx_ring_format =3D ravb_rx_ring_format_rcar,
> -	.alloc_rx_desc =3D ravb_alloc_rx_desc_rcar,
>  	.receive =3D ravb_rx_rcar,
>  	.set_rate =3D ravb_set_rate_rcar,
>  	.set_feature =3D ravb_set_features_rcar,
> @@ -2693,6 +2626,7 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.rx_max_desc_use =3D 2048 - ETH_FCS_LEN + sizeof(__sum16),
> +	.rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
>  	.internal_delay =3D 1,
>  	.tx_counters =3D 1,
>  	.multi_irqs =3D 1,
> @@ -2703,9 +2637,6 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
>  };
> =20
>  static const struct ravb_hw_info ravb_gen2_hw_info =3D {
> -	.rx_ring_free =3D ravb_rx_ring_free_rcar,
> -	.rx_ring_format =3D ravb_rx_ring_format_rcar,
> -	.alloc_rx_desc =3D ravb_alloc_rx_desc_rcar,
>  	.receive =3D ravb_rx_rcar,
>  	.set_rate =3D ravb_set_rate_rcar,
>  	.set_feature =3D ravb_set_features_rcar,
> @@ -2719,6 +2650,7 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.rx_max_desc_use =3D 2048 - ETH_FCS_LEN + sizeof(__sum16),
> +	.rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
>  	.aligned_tx =3D 1,
>  	.gptp =3D 1,
>  	.nc_queues =3D 1,
> @@ -2726,9 +2658,6 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
>  };
> =20
>  static const struct ravb_hw_info ravb_rzv2m_hw_info =3D {
> -	.rx_ring_free =3D ravb_rx_ring_free_rcar,
> -	.rx_ring_format =3D ravb_rx_ring_format_rcar,
> -	.alloc_rx_desc =3D ravb_alloc_rx_desc_rcar,
>  	.receive =3D ravb_rx_rcar,
>  	.set_rate =3D ravb_set_rate_rcar,
>  	.set_feature =3D ravb_set_features_rcar,
> @@ -2742,6 +2671,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.rx_max_desc_use =3D 2048 - ETH_FCS_LEN + sizeof(__sum16),
> +	.rx_desc_size =3D sizeof(struct ravb_ex_rx_desc),
>  	.multi_irqs =3D 1,
>  	.err_mgmt_irqs =3D 1,
>  	.gptp =3D 1,
> @@ -2751,9 +2681,6 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
>  };
> =20
>  static const struct ravb_hw_info gbeth_hw_info =3D {
> -	.rx_ring_free =3D ravb_rx_ring_free_gbeth,
> -	.rx_ring_format =3D ravb_rx_ring_format_gbeth,
> -	.alloc_rx_desc =3D ravb_alloc_rx_desc_gbeth,
>  	.receive =3D ravb_rx_gbeth,
>  	.set_rate =3D ravb_set_rate_gbeth,
>  	.set_feature =3D ravb_set_features_gbeth,
> @@ -2767,6 +2694,7 @@ static const struct ravb_hw_info gbeth_hw_info =3D=
 {
>  	.tccr_mask =3D TCCR_TSRQ0,
>  	.rx_max_frame_size =3D SZ_8K,
>  	.rx_max_desc_use =3D 4080,
> +	.rx_desc_size =3D sizeof(struct ravb_rx_desc),
>  	.aligned_tx =3D 1,
>  	.tx_counters =3D 1,
>  	.carrier_counters =3D 1,

--=20
Paul Barker
--------------Y2mAZ0GIjx6Sgqbfu0VZLRQc
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------Y2mAZ0GIjx6Sgqbfu0VZLRQc--

--------------I05LpNk8A3cVtpXjET5Kor8n--

--------------C1MR2f9fSnTE0juRLqNDwU7n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZd5QBgUDAAAAAAAKCRDbaV4Vf/JGvWEQ
AP4pulJ5VKA7qhgckNkeTvs32wUUdxewLVkbm0ypRPF1WAEA/9VPBCDRDoRk6nu2Nlxio/U4EEoz
UvXox2xTukGlWgU=
=f+61
-----END PGP SIGNATURE-----

--------------C1MR2f9fSnTE0juRLqNDwU7n--

