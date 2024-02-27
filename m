Return-Path: <linux-renesas-soc+bounces-3253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3D868D78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 11:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E117028E677
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 10:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D40137C42;
	Tue, 27 Feb 2024 10:24:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814F56458;
	Tue, 27 Feb 2024 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709029460; cv=none; b=Mi+cX8DVXPJnlj4bHhFpTgIGA8KS6RacIOV/bemIIgFEIkPB1P+iQWFuFYfvloBO6FdhnB2W+cC/8Yy3M8BTP1ZQjTiID88HjwSXZ5MVRTMS2sVU8/wqzN/B7My1ohqaQowfT4966Y3N6DXwz3tkw2EeiPl4eDUPxbnQ+L7bd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709029460; c=relaxed/simple;
	bh=Lb6u+F5Y3zDeicwtR1SX5jKmHw1GySf/c3/cLlb4RhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhCLeIg1NAk/YM1W038FSspqF2LSiI9PVAZjtEq88htnYHyV9w9tFg+jkPHtFOh812Wb+eWokh7W91g6au8hwGn7t9eqHsqoT576MZBZ5shGWUJXO8dr+YHaWigI43Sa/8WCoIb3vs4yVfcCvU8tWdc24piBCU1THrDo5N9XynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,187,1705330800"; 
   d="asc'?scan'208";a="199446128"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2024 19:24:15 +0900
Received: from [10.226.92.206] (unknown [10.226.92.206])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3A81941FC763;
	Tue, 27 Feb 2024 19:24:11 +0900 (JST)
Message-ID: <3ace0c25-8d3f-491a-9f3e-ccd77715e63d@bp.renesas.com>
Date: Tue, 27 Feb 2024 10:24:10 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 1/6] ravb: Group descriptor types used in Rx ring
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
 <20240227014014.44855-2-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240227014014.44855-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MkMdfntey5fdGBQQjbvxcKcs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MkMdfntey5fdGBQQjbvxcKcs
Content-Type: multipart/mixed; boundary="------------fTPJPt5PABNxvoLccSMIxB2S";
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
Message-ID: <3ace0c25-8d3f-491a-9f3e-ccd77715e63d@bp.renesas.com>
Subject: Re: [net-next 1/6] ravb: Group descriptor types used in Rx ring
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227014014.44855-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240227014014.44855-2-niklas.soderlund+renesas@ragnatech.se>

--------------fTPJPt5PABNxvoLccSMIxB2S
Content-Type: multipart/mixed; boundary="------------av7aTP2boydXDdHciuMpt90g"

--------------av7aTP2boydXDdHciuMpt90g
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2024 01:40, Niklas S=C3=B6derlund wrote:
> The Rx ring can either be made up of normal or extended descriptors, no=
t
> a mix of the two at the same time. Make this explicitly by grouping the=

> two variables in a rx_ring union.
>=20
> The extension of the storage for more than one queue of normal
> descriptors from a single to NUM_RX_QUEUE queues have no practical
> effect. But aids in making the code readable as the code that uses it
> already piggyback on other members of struct ravb_private that are
> arrays of max length NUM_RX_QUEUE, e.g. rx_desc_dma. This will also mak=
e
> further refactoring easier.
>=20
> While at it rename the normal descriptor Rx ring to make it clear it's
> not strictly related to the GbEthernet E-MAC IP found in RZ/G2L, normal=

> descriptors could be used on R-Car SoCs too.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  6 ++-
>  drivers/net/ethernet/renesas/ravb_main.c | 57 ++++++++++++------------=

>  2 files changed, 33 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> index 35e642fc4b2a..aecc98282c7e 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1092,8 +1092,10 @@ struct ravb_private {
>  	struct ravb_desc *desc_bat;
>  	dma_addr_t rx_desc_dma[NUM_RX_QUEUE];
>  	dma_addr_t tx_desc_dma[NUM_TX_QUEUE];
> -	struct ravb_rx_desc *gbeth_rx_ring;
> -	struct ravb_ex_rx_desc *rx_ring[NUM_RX_QUEUE];
> +	union {
> +		struct ravb_rx_desc *desc;
> +		struct ravb_ex_rx_desc *ex_desc;
> +	} rx_ring[NUM_RX_QUEUE];
>  	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
>  	void *tx_align[NUM_TX_QUEUE];
>  	struct sk_buff *rx_1st_skb;
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index f9fb772b05c7..c25a80f4d3b9 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -241,11 +241,11 @@ static void ravb_rx_ring_free_gbeth(struct net_de=
vice *ndev, int q)
>  	unsigned int ring_size;
>  	unsigned int i;
> =20
> -	if (!priv->gbeth_rx_ring)
> +	if (!priv->rx_ring[q].desc)
>  		return;
> =20
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		struct ravb_rx_desc *desc =3D &priv->gbeth_rx_ring[i];
> +		struct ravb_rx_desc *desc =3D &priv->rx_ring[q].desc[i];
> =20
>  		if (!dma_mapping_error(ndev->dev.parent,
>  				       le32_to_cpu(desc->dptr)))
> @@ -255,9 +255,9 @@ static void ravb_rx_ring_free_gbeth(struct net_devi=
ce *ndev, int q)
>  					 DMA_FROM_DEVICE);
>  	}
>  	ring_size =3D sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1=
);
> -	dma_free_coherent(ndev->dev.parent, ring_size, priv->gbeth_rx_ring,
> +	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].desc,=

>  			  priv->rx_desc_dma[q]);
> -	priv->gbeth_rx_ring =3D NULL;
> +	priv->rx_ring[q].desc =3D NULL;
>  }
> =20
>  static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
> @@ -266,11 +266,11 @@ static void ravb_rx_ring_free_rcar(struct net_dev=
ice *ndev, int q)
>  	unsigned int ring_size;
>  	unsigned int i;
> =20
> -	if (!priv->rx_ring[q])
> +	if (!priv->rx_ring[q].ex_desc)
>  		return;
> =20
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
> -		struct ravb_ex_rx_desc *desc =3D &priv->rx_ring[q][i];
> +		struct ravb_ex_rx_desc *desc =3D &priv->rx_ring[q].ex_desc[i];
> =20
>  		if (!dma_mapping_error(ndev->dev.parent,
>  				       le32_to_cpu(desc->dptr)))
> @@ -281,9 +281,9 @@ static void ravb_rx_ring_free_rcar(struct net_devic=
e *ndev, int q)
>  	}
>  	ring_size =3D sizeof(struct ravb_ex_rx_desc) *
>  		    (priv->num_rx_ring[q] + 1);
> -	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q],
> +	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].ex_de=
sc,
>  			  priv->rx_desc_dma[q]);
> -	priv->rx_ring[q] =3D NULL;
> +	priv->rx_ring[q].ex_desc =3D NULL;
>  }
> =20
>  /* Free skb's and DMA buffers for Ethernet AVB */
> @@ -335,11 +335,11 @@ static void ravb_rx_ring_format_gbeth(struct net_=
device *ndev, int q)
>  	unsigned int i;
> =20
>  	rx_ring_size =3D sizeof(*rx_desc) * priv->num_rx_ring[q];
> -	memset(priv->gbeth_rx_ring, 0, rx_ring_size);
> +	memset(priv->rx_ring[q].desc, 0, rx_ring_size);
>  	/* Build RX ring buffer */
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
> -		rx_desc =3D &priv->gbeth_rx_ring[i];
> +		rx_desc =3D &priv->rx_ring[q].desc[i];
>  		rx_desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
>  					  GBETH_RX_BUFF_MAX,
> @@ -352,7 +352,7 @@ static void ravb_rx_ring_format_gbeth(struct net_de=
vice *ndev, int q)
>  		rx_desc->dptr =3D cpu_to_le32(dma_addr);
>  		rx_desc->die_dt =3D DT_FEMPTY;
>  	}
> -	rx_desc =3D &priv->gbeth_rx_ring[i];
> +	rx_desc =3D &priv->rx_ring[q].desc[i];
>  	rx_desc->dptr =3D cpu_to_le32((u32)priv->rx_desc_dma[q]);
>  	rx_desc->die_dt =3D DT_LINKFIX; /* type */
>  }
> @@ -365,11 +365,11 @@ static void ravb_rx_ring_format_rcar(struct net_d=
evice *ndev, int q)
>  	dma_addr_t dma_addr;
>  	unsigned int i;
> =20
> -	memset(priv->rx_ring[q], 0, rx_ring_size);
> +	memset(priv->rx_ring[q].ex_desc, 0, rx_ring_size);
>  	/* Build RX ring buffer */
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
> -		rx_desc =3D &priv->rx_ring[q][i];
> +		rx_desc =3D &priv->rx_ring[q].ex_desc[i];
>  		rx_desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
>  					  RX_BUF_SZ,
> @@ -382,7 +382,7 @@ static void ravb_rx_ring_format_rcar(struct net_dev=
ice *ndev, int q)
>  		rx_desc->dptr =3D cpu_to_le32(dma_addr);
>  		rx_desc->die_dt =3D DT_FEMPTY;
>  	}
> -	rx_desc =3D &priv->rx_ring[q][i];
> +	rx_desc =3D &priv->rx_ring[q].ex_desc[i];
>  	rx_desc->dptr =3D cpu_to_le32((u32)priv->rx_desc_dma[q]);
>  	rx_desc->die_dt =3D DT_LINKFIX; /* type */
>  }
> @@ -437,10 +437,10 @@ static void *ravb_alloc_rx_desc_gbeth(struct net_=
device *ndev, int q)
> =20
>  	ring_size =3D sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1=
);
> =20
> -	priv->gbeth_rx_ring =3D dma_alloc_coherent(ndev->dev.parent, ring_siz=
e,
> -						 &priv->rx_desc_dma[q],
> -						 GFP_KERNEL);
> -	return priv->gbeth_rx_ring;
> +	priv->rx_ring[q].desc =3D dma_alloc_coherent(ndev->dev.parent, ring_s=
ize,
> +						   &priv->rx_desc_dma[q],
> +						   GFP_KERNEL);
> +	return priv->rx_ring[q].desc;
>  }
> =20
>  static void *ravb_alloc_rx_desc_rcar(struct net_device *ndev, int q)
> @@ -450,10 +450,11 @@ static void *ravb_alloc_rx_desc_rcar(struct net_d=
evice *ndev, int q)
> =20
>  	ring_size =3D sizeof(struct ravb_ex_rx_desc) * (priv->num_rx_ring[q] =
+ 1);
> =20
> -	priv->rx_ring[q] =3D dma_alloc_coherent(ndev->dev.parent, ring_size,
> -					      &priv->rx_desc_dma[q],
> -					      GFP_KERNEL);
> -	return priv->rx_ring[q];
> +	priv->rx_ring[q].ex_desc =3D dma_alloc_coherent(ndev->dev.parent,
> +						      ring_size,
> +						      &priv->rx_desc_dma[q],
> +						      GFP_KERNEL);
> +	return priv->rx_ring[q].ex_desc;
>  }
> =20
>  /* Init skb and descriptor buffer for Ethernet AVB */
> @@ -830,7 +831,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, =
int *quota, int q)
>  	limit =3D priv->dirty_rx[q] + priv->num_rx_ring[q] - priv->cur_rx[q];=

>  	stats =3D &priv->stats[q];
> =20
> -	desc =3D &priv->gbeth_rx_ring[entry];
> +	desc =3D &priv->rx_ring[q].desc[entry];
>  	for (i =3D 0; i < limit && rx_packets < *quota && desc->die_dt !=3D D=
T_FEMPTY; i++) {
>  		/* Descriptor type must be checked before all other reads */
>  		dma_rmb();
> @@ -901,13 +902,13 @@ static bool ravb_rx_gbeth(struct net_device *ndev=
, int *quota, int q)
>  		}
> =20
>  		entry =3D (++priv->cur_rx[q]) % priv->num_rx_ring[q];
> -		desc =3D &priv->gbeth_rx_ring[entry];
> +		desc =3D &priv->rx_ring[q].desc[entry];
>  	}
> =20
>  	/* Refill the RX ring buffers. */
>  	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) =
{
>  		entry =3D priv->dirty_rx[q] % priv->num_rx_ring[q];
> -		desc =3D &priv->gbeth_rx_ring[entry];
> +		desc =3D &priv->rx_ring[q].desc[entry];
>  		desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
> =20
>  		if (!priv->rx_skb[q][entry]) {
> @@ -957,7 +958,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, i=
nt *quota, int q)
> =20
>  	boguscnt =3D min(boguscnt, *quota);
>  	limit =3D boguscnt;
> -	desc =3D &priv->rx_ring[q][entry];
> +	desc =3D &priv->rx_ring[q].ex_desc[entry];
>  	while (desc->die_dt !=3D DT_FEMPTY) {
>  		/* Descriptor type must be checked before all other reads */
>  		dma_rmb();
> @@ -1017,13 +1018,13 @@ static bool ravb_rx_rcar(struct net_device *nde=
v, int *quota, int q)
>  		}
> =20
>  		entry =3D (++priv->cur_rx[q]) % priv->num_rx_ring[q];
> -		desc =3D &priv->rx_ring[q][entry];
> +		desc =3D &priv->rx_ring[q].ex_desc[entry];
>  	}
> =20
>  	/* Refill the RX ring buffers. */
>  	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) =
{
>  		entry =3D priv->dirty_rx[q] % priv->num_rx_ring[q];
> -		desc =3D &priv->rx_ring[q][entry];
> +		desc =3D &priv->rx_ring[q].ex_desc[entry];
>  		desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
> =20
>  		if (!priv->rx_skb[q][entry]) {

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------av7aTP2boydXDdHciuMpt90g
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------av7aTP2boydXDdHciuMpt90g--

--------------fTPJPt5PABNxvoLccSMIxB2S--

--------------MkMdfntey5fdGBQQjbvxcKcs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZd24SgUDAAAAAAAKCRDbaV4Vf/JGvYPG
AP9AXBXAwonwgszoYAffxYNnsFY6pbzR15nU92uXc8Q1XQD/ZViA+raLBh5pP8GT5jkdrZ+KiwRo
xMlnWn9VQfeF7QY=
=zWVQ
-----END PGP SIGNATURE-----

--------------MkMdfntey5fdGBQQjbvxcKcs--

