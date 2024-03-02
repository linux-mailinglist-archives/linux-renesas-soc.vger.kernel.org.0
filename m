Return-Path: <linux-renesas-soc+bounces-3404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7186F01D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 11:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C95022832F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 10:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22D1BA42;
	Sat,  2 Mar 2024 10:55:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A8A6AD6;
	Sat,  2 Mar 2024 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709376937; cv=none; b=YTJtfAciRZkIiYivHReyKrfZY+S7gdhb93d/5BwcgGLwgn4iq7dKlPIXi4sH0aRkyiKwijUaToImyCSYYpom6bA5HqNuHUvfZLavFkmdQ6zTO9/n27SlThq1kdJcLXCS0WCYCSa8cYcPBBWpOr/7kDTTEaEBpprIdC61g+OgfeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709376937; c=relaxed/simple;
	bh=aqgtxThGr8cUBzOBwvdK5V9TqXaqnIqEV7NN4OEV8Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBC9eWbSJsP1QgR6pKDjDXUpoA6ZP9djZ/JF3nRYpYJUiWIgMyNt5m/HjUzQ+080Yimbw4RuHyqS23fdnLQoNOUPExOid0SxZ4b9FrUW6awgpjPcZEKxQVOEPcNeJdw8XJEUWhbrbWDKcRlCZ1rVktf35kp1SO9zdaz0BvlXo94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,199,1705330800"; 
   d="asc'?scan'208";a="200027857"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Mar 2024 19:55:27 +0900
Received: from [10.226.92.29] (unknown [10.226.92.29])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DCD774007551;
	Sat,  2 Mar 2024 19:55:23 +0900 (JST)
Message-ID: <bb186968-2c05-445e-8a97-9b9a86cd5a36@bp.renesas.com>
Date: Sat, 2 Mar 2024 10:55:22 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2 3/6] ravb: Create helper to allocate skb and align
 it
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0ty0xdaeCdztUU0yqpRC0bcT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0ty0xdaeCdztUU0yqpRC0bcT
Content-Type: multipart/mixed; boundary="------------07h229r7ZJ4SweqRhT1jCON1";
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
Message-ID: <bb186968-2c05-445e-8a97-9b9a86cd5a36@bp.renesas.com>
Subject: Re: [net-next,v2 3/6] ravb: Create helper to allocate skb and align
 it
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>

--------------07h229r7ZJ4SweqRhT1jCON1
Content-Type: multipart/mixed; boundary="------------l9SNEjYi51eze00PlzwkBEPO"

--------------l9SNEjYi51eze00PlzwkBEPO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2024 22:33, Niklas S=C3=B6derlund wrote:
> The RAVB device requires the SKB data to be aligned to 128 bytes. The
> alignment is done by allocating a skb 128 bytes larger than the maximum=

> frame size supported by the device and adjusting the headroom to fit th=
e
> requirement.
>=20
> This code has been refactored a few times and small issues have been
> added along the way. The issues are not harmful but prevents merging
> parts of the Rx code which have been split in two implementations with
> the addition of RZ/G2L support, a device that supports larger frame
> sizes.
>=20
> This change removes the need for duplicated and somewhat inaccurate
> hardware alignment constrains stored in the hardware information struct=

> by creating a helper to handle the allocation of a skb and alignment of=

> a skb data.
>=20
> For the R-Car class of devices the maximum frame size is 4K and each
> descriptor is limited to 2K of data. The current implementation does no=
t
> support split descriptors, this limits the frame size to 2K. The
> current hardware information however records the descriptor size just
> under 2K due to bad understanding of the device when larger MTUs where
> added.
>=20
> For the RZ/G2L device the maximum frame size is 8K and each descriptor
> is limited to 4K of data. The current hardware information records this=

> correctly, but it gets the alignment constrains wrong as just aligns it=

> by 128, it does not extend it by 128 bytes to allow the full frame to b=
e
> stored. This works because the RZ/G2L device supports split descriptors=

> and allocates each skb to 8K and aligns each 4K descriptor in this
> space.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
> * Changes since v1
> - Add a GFP mask argument to ravb_alloc_skb() to preserve GFP_KERNEL at=

>   init time.
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  1 -
>  drivers/net/ethernet/renesas/ravb_main.c | 43 +++++++++++++-----------=

>  2 files changed, 24 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> index 7f9e8b2c012a..751bb29cd488 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1057,7 +1057,6 @@ struct ravb_hw_info {
>  	netdev_features_t net_hw_features;
>  	netdev_features_t net_features;
>  	int stats_len;
> -	size_t max_rx_len;
>  	u32 tccr_mask;
>  	u32 rx_max_frame_size;
>  	unsigned aligned_tx: 1;
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index 5c72b780d623..e6b025058847 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -113,12 +113,23 @@ static void ravb_set_rate_rcar(struct net_device =
*ndev)
>  	}
>  }
> =20
> -static void ravb_set_buffer_align(struct sk_buff *skb)
> +static struct sk_buff *
> +ravb_alloc_skb(struct net_device *ndev, const struct ravb_hw_info *inf=
o,
> +	       gfp_t gfp_mask)
>  {
> -	u32 reserve =3D (unsigned long)skb->data & (RAVB_ALIGN - 1);
> +	struct sk_buff *skb;
> +	u32 reserve;
> =20
> +	skb =3D __netdev_alloc_skb(ndev, info->rx_max_frame_size + RAVB_ALIGN=
 - 1,
> +				 gfp_mask);
> +	if (!skb)
> +		return NULL;
> +
> +	reserve =3D (unsigned long)skb->data & (RAVB_ALIGN - 1);
>  	if (reserve)
>  		skb_reserve(skb, RAVB_ALIGN - reserve);
> +
> +	return skb;
>  }
> =20
>  /* Get MAC address from the MAC address registers
> @@ -251,7 +262,7 @@ static void ravb_rx_ring_free_gbeth(struct net_devi=
ce *ndev, int q)
>  				       le32_to_cpu(desc->dptr)))
>  			dma_unmap_single(ndev->dev.parent,
>  					 le32_to_cpu(desc->dptr),
> -					 GBETH_RX_BUFF_MAX,
> +					 priv->info->rx_max_frame_size,
>  					 DMA_FROM_DEVICE);
>  	}
>  	ring_size =3D sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1=
);
> @@ -276,7 +287,7 @@ static void ravb_rx_ring_free_rcar(struct net_devic=
e *ndev, int q)
>  				       le32_to_cpu(desc->dptr)))
>  			dma_unmap_single(ndev->dev.parent,
>  					 le32_to_cpu(desc->dptr),
> -					 RX_BUF_SZ,
> +					 priv->info->rx_max_frame_size,
>  					 DMA_FROM_DEVICE);
>  	}
>  	ring_size =3D sizeof(struct ravb_ex_rx_desc) *
> @@ -342,7 +353,7 @@ static void ravb_rx_ring_format_gbeth(struct net_de=
vice *ndev, int q)
>  		rx_desc =3D &priv->rx_ring[q].desc[i];
>  		rx_desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
> -					  GBETH_RX_BUFF_MAX,
> +					  priv->info->rx_max_frame_size,
>  					  DMA_FROM_DEVICE);
>  		/* We just set the data size to 0 for a failed mapping which
>  		 * should prevent DMA from happening...
> @@ -372,7 +383,7 @@ static void ravb_rx_ring_format_rcar(struct net_dev=
ice *ndev, int q)
>  		rx_desc =3D &priv->rx_ring[q].ex_desc[i];
>  		rx_desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
> -					  RX_BUF_SZ,
> +					  priv->info->rx_max_frame_size,
>  					  DMA_FROM_DEVICE);
>  		/* We just set the data size to 0 for a failed mapping which
>  		 * should prevent DMA from happening...
> @@ -476,10 +487,9 @@ static int ravb_ring_init(struct net_device *ndev,=
 int q)
>  		goto error;
> =20
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		skb =3D __netdev_alloc_skb(ndev, info->max_rx_len, GFP_KERNEL);
> +		skb =3D ravb_alloc_skb(ndev, info, GFP_KERNEL);
>  		if (!skb)
>  			goto error;
> -		ravb_set_buffer_align(skb);
>  		priv->rx_skb[q][i] =3D skb;
>  	}
> =20
> @@ -805,7 +815,8 @@ static struct sk_buff *ravb_get_skb_gbeth(struct ne=
t_device *ndev, int entry,
>  	skb =3D priv->rx_skb[RAVB_BE][entry];
>  	priv->rx_skb[RAVB_BE][entry] =3D NULL;
>  	dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
> -			 ALIGN(GBETH_RX_BUFF_MAX, 16), DMA_FROM_DEVICE);
> +			 ALIGN(priv->info->rx_max_frame_size, 16),
> +			 DMA_FROM_DEVICE);
> =20
>  	return skb;
>  }
> @@ -912,13 +923,12 @@ static bool ravb_rx_gbeth(struct net_device *ndev=
, int *quota, int q)
>  		desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
> =20
>  		if (!priv->rx_skb[q][entry]) {
> -			skb =3D netdev_alloc_skb(ndev, info->max_rx_len);
> +			skb =3D ravb_alloc_skb(ndev, info, GFP_ATOMIC);
>  			if (!skb)
>  				break;
> -			ravb_set_buffer_align(skb);
>  			dma_addr =3D dma_map_single(ndev->dev.parent,
>  						  skb->data,
> -						  GBETH_RX_BUFF_MAX,
> +						  priv->info->rx_max_frame_size,
>  						  DMA_FROM_DEVICE);
>  			skb_checksum_none_assert(skb);
>  			/* We just set the data size to 0 for a failed mapping
> @@ -992,7 +1002,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, =
int *quota, int q)
>  			skb =3D priv->rx_skb[q][entry];
>  			priv->rx_skb[q][entry] =3D NULL;
>  			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
> -					 RX_BUF_SZ,
> +					 priv->info->rx_max_frame_size,
>  					 DMA_FROM_DEVICE);
>  			get_ts &=3D (q =3D=3D RAVB_NC) ?
>  					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> @@ -1028,10 +1038,9 @@ static bool ravb_rx_rcar(struct net_device *ndev=
, int *quota, int q)
>  		desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
> =20
>  		if (!priv->rx_skb[q][entry]) {
> -			skb =3D netdev_alloc_skb(ndev, info->max_rx_len);
> +			skb =3D ravb_alloc_skb(ndev, info, GFP_ATOMIC);
>  			if (!skb)
>  				break;	/* Better luck next round. */
> -			ravb_set_buffer_align(skb);
>  			dma_addr =3D dma_map_single(ndev->dev.parent, skb->data,
>  						  le16_to_cpu(desc->ds_cc),
>  						  DMA_FROM_DEVICE);
> @@ -2682,7 +2691,6 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
>  	.net_hw_features =3D NETIF_F_RXCSUM,
>  	.net_features =3D NETIF_F_RXCSUM,
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
> -	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.internal_delay =3D 1,
> @@ -2708,7 +2716,6 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
>  	.net_hw_features =3D NETIF_F_RXCSUM,
>  	.net_features =3D NETIF_F_RXCSUM,
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
> -	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.aligned_tx =3D 1,
> @@ -2731,7 +2738,6 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
>  	.net_hw_features =3D NETIF_F_RXCSUM,
>  	.net_features =3D NETIF_F_RXCSUM,
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
> -	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
>  	.multi_irqs =3D 1,
> @@ -2756,7 +2762,6 @@ static const struct ravb_hw_info gbeth_hw_info =3D=
 {
>  	.net_hw_features =3D NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
>  	.net_features =3D NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats_gbeth),
> -	.max_rx_len =3D ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
>  	.tccr_mask =3D TCCR_TSRQ0,
>  	.rx_max_frame_size =3D SZ_8K,
>  	.aligned_tx =3D 1,

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------l9SNEjYi51eze00PlzwkBEPO
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGS4BNsBEADEc28TO+aryCgRIuhxWAviuJl+f2TcZ1JeeaMzRLgSXKuXzkiI
g6JIVfNvThjwJaBmb7+/5+D7kDLJuutu9MFfOzTS0QOQWppwIPgbfktvMvwwsq3m
7e9Qb+S1LVeV0/ldZfuzgzAzHFDwmzryfIyt2JEbsBsGTq/QE+7hvLAe8R9xofIn
z6/IndiiTYhNCNf06nFPR4Y5ZDZPGb9aw5Jisqh+OSxtc0BFHDSV8/35yWM/JLQ1
Ja8AOHw1kP9KO+iE9rHMt0+7lH3mN1GBabxH26EdgFfPShsi14qmziLOuUlGLuwO
ApIYqvdtCs+zlMA8PsiJIMuxizZ6qCLur3r2b+/YXoJjuFDcax9M+Pr0D7rZX0Hk
6PW3dtvDQHfspwLY0FIlXbbtCfCqGLe47VaS7lvG0XeMlo3dUEsf707Q2h0+G1tm
wyeuWSPEzZQq/KI7JIFlxr3N/3VCdGa9qVf/40QF0BXPfJdcwTEzmPlYetRgA11W
bglw8DxWBv24a2gWeUkwBWFScR3QV4FAwVjmlCqrkw9dy/JtrFf4pwDoqSFUcofB
95u6qlz/PC+ho9uvUo5uIwJyz3J5BIgfkMAPYcHNZZ5QrpI3mdwf66im1TOKKTuf
3Sz/GKc14qAIQhxuUWrgAKTexBJYJmzDT0Mj4ISjlr9K6VXrQwTuj2zC4QARAQAB
zStQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNhcy5jb20+wsGU
BBMBCgA+FiEE9KKf333+FIzPGaxOJ/SzRZ8AIlcFAmS4BNsCGwEFCQPCZwAFCwkI
BwIGFQoJCAsCBBYCAwECHgECF4AACgkQJ/SzRZ8AIlfxaQ/8CM36qjfad7eBfwja
cI1LlH1NwbSJ239rE0X7hU/5yra72egr3T5AUuYTt9ECNQ8Ld03BYhbC6hPki5rb
OlFM2hEPUQYeohcJ4Na5iIFpTxoIuC49Hp2ce6ikvt9Hc4O2FAntabg+9hE8WA4f
QWW+Qo5ve5OJ0sGylzu0mRZ2I3mTaDsxuDkXOICF5ggSdjT+rcd/pRVOugImjpZv
/jzSgUfKV2wcZ8vVK0616K21tyPiRjYtDQjJAKff8gBY6ZvP5REPl+fYNvZm1y4l
hsVupGHL3aV+BKooMsKRZIMTiKJCIy6YFKHOcgWFG62cuRrFDf4r54MJuUGzyeoF
1XNFzbe1ySoRfU/HrEuBNqC+1CEBiduumh89BitfDNh6ecWVLw24fjsF1Ke6vYpU
lK9/yGLV26lXYEN4uEJ9i6PjgJ+Q8fubizCVXVDPxmWSZIoJg8EspZ+Max03Lk3e
flWQ0E3l6/VHmsFgkvqhjNlzFRrj/k86IKdOi0FOd0xtKh1p34rQ8S/4uUN9XCVj
KtmyLfQgqPVEC6MKv7yFbextPoDUrFAzEgi4OBdqDJjPbdU9wUjONxuWJRrzRFcr
nTIG7oC4dae0p1rs5uTlaSIKpB2yulaJLKjnNstAj9G9Evf4SE2PKH4l4Jlo/Hu1
wOUqmCLRo3vFbn7xvfr1u0Z+oMTOOARkuAhwEgorBgEEAZdVAQUBAQdAcuNbK3VT
WrRYypisnnzLAguqvKX3Vc1OpNE4f8pOcgMDAQgHwsF2BBgBCgAgFiEE9KKf333+
FIzPGaxOJ/SzRZ8AIlcFAmS4CHACGwwACgkQJ/SzRZ8AIlc90BAAr0hmx8XU9KCj
g4nJqfavlmKUZetoX5RB9g3hkpDlvjdQZX6lenw3yUzPj53eoiDKzsM03Tak/KFU
FXGeq7UtPOfXMyIh5UZVdHQRxC4sIBMLKumBfC7LM6XeSegtaGEX8vSzjQICIbaI
roF2qVUOTMGal2mvcYEvmObC08bUZuMd4nxLnHGiej2t85+9F3Y7GAKsA25EXbbm
ziUg8IVXw3TojPNrNoQ3if2Z9NfKBhv0/s7x/3WhhIzOht+rAyZaaW+31btDrX4+
Y1XLAzg9DAfuqkL6knHDMd9tEuK6m2xCOAeZazXaNeOTjQ/XqCHmZ+691VhmAHCI
7Z7EBPh++TjEqn4ZH+4KPn6XD52+ruWXGbJP29zc+3bwQ+ZADfUaL3ADj69ySxzm
bO24USHBAg+BhZAZMBkbkygbTen/umT6tBxG91krqbKlDdc8mhGonBN6i+nz8qv1
6MdC5P1rDbo834rxNLvoFMSLCcpjoafiprl9qk0wQLq48WGphs9DX7V75ZAU5Lt6
yA+je8i799EZJsVlB933Gpj688H4csaZqEMBjq7vMvI+a5MnLCGcjwRhsUfogpRb
AWTx9ddVau4MJgEHzB7UU/VFyP2vku7XPj6mgSfSHyNVf2hqxwISQ8eZLoyxauOD
Y61QMX6YFL170ylToSFjH627h6TzlUDOMwRkuAiAFgkrBgEEAdpHDwEBB0Bibkmu
Sf7yECzrkBmjD6VGWNVxTdiqb2RuAfGFY9RjRsLB7QQYAQoAIBYhBPSin999/hSM
zxmsTif0s0WfACJXBQJkuAiAAhsCAIEJECf0s0WfACJXdiAEGRYIAB0WIQSiu8gv
1Xr0fIw/aoLbaV4Vf/JGvQUCZLgIgAAKCRDbaV4Vf/JGvZP9AQCwV06n3DZvuce3
/BtzG5zqUuf6Kp2Esgr2FrD4fKVbogD/ZHpXfi9ELdH/JTSVyujaTqhuxQ5B7UzV
CUIb1qbg1APIEA/+IaLJIBySehy8dHDZQXit/XQYeROQLTT9PvyM35rZVMGH6VG8
Zb23BPCJ3N0ISOtVdG402lSP0ilP/zSyQAbJN6F0o2tiPd558lPerFd/KpbCIp8N
kYaLlHWIDiN2AE3c6sfCiCPMtXOR7HCeQapGQBS/IMh1qYHffuzuEy7tbrMvjdra
VN9Rqtp7PSuRTbO3jAhm0Oe4lDCAK4zyZfjwiZGxnj9s1dyEbxYB2GhTOgkiX/96
Nw+m/ShaKqTM7o3pNUEs9J3oHeGZFCCaZBv97ctqrYhnNB4kzCxAaZ6K9HAAmcKe
WT2q4JdYzwB6vEeHnvxl7M0Dj9pUTMujW77Qh5IkUQLYZ2XQYnKAV2WI90B0R1p9
bXP+jqqkaNCrxKHV1tYOB6037CziGcZmiDneiTlM765MTLJLlHNqlXxDCzRwEazU
y9dNzITjVT0qhc6th8/vqN9dqvQaAGa13u86Gbv4XPYdE+5MXPM/fTgkKaPBYcIV
QMvLfoZxyaTk4nzNbBxwwEEHrvTcWDdWxGNtkWRZw0+U5JpXCOi9kBCtFrJ701UG
UFs56zWndQUS/2xDyGk8GObGBSRLCwsXsKsF6hSX5aKXHyrAAxEUEscRaAmzd6O3
ZyZGVsEsOuGCLkekUMF/5dwOhEDXrY42VR/ZxdDTY99dznQkwTt4o7FOmkY=3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------l9SNEjYi51eze00PlzwkBEPO--

--------------07h229r7ZJ4SweqRhT1jCON1--

--------------0ty0xdaeCdztUU0yqpRC0bcT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZeMFmgUDAAAAAAAKCRDbaV4Vf/JGvZSE
AQDiCmJ+mzYl5HSmKy03FMNX3QyV0c7RkqdSFP+avnQwEQD/ejzmdAJPjEUv6fhbQhQN23iv0R7C
oE8a/P+hxgdG4ww=
=Y5ul
-----END PGP SIGNATURE-----

--------------0ty0xdaeCdztUU0yqpRC0bcT--

