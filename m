Return-Path: <linux-renesas-soc+bounces-5695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02F8D4846
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 11:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8719428222E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 09:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247C36F300;
	Thu, 30 May 2024 09:21:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0870183971;
	Thu, 30 May 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060889; cv=none; b=PM+yIkoUalI8UQzs8tlo2NdpmxSuod6pnCtmIzXASEnxq2TJnnkA/ZIyPd2Q+pTR4u+F9oT8U4bMkB+8bUccLcI5b3RGrXekqsEqdcFNOeovROfMniZJ9RgeO3hR49WSuDfSyVJgGNXgIY56G6EvH1fQ9el6YfJEtHaGV6/3juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060889; c=relaxed/simple;
	bh=WyJ8/AA8xtDaG+uv7jk8HpbPR3mDB7JxK6qcLYPk1QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKBGx3txC0aWBT9QD6jVuHMP/fMJqCDzVVyNz5z2Yf1SVsTvVsGsu1goRTc4+pyws8p7zXoEqSHdT3mi+mGB8f8yJx9alev5qe9kRfnDpGygfd06S3WKygvR8LBNckUEtYfC6EnVjeukWETnChOfsGWpw+Ct7PwSxIVpLQpH03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,199,1712588400"; 
   d="asc'?scan'208";a="206163612"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 May 2024 18:21:23 +0900
Received: from [10.226.92.79] (unknown [10.226.92.79])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1697C400F2CC;
	Thu, 30 May 2024 18:21:18 +0900 (JST)
Message-ID: <e7cf9dd8-9c67-476b-a892-b8dbe9312c4c@bp.renesas.com>
Date: Thu, 30 May 2024 10:21:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NduQAJmKJW5S98p94IasMcFk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NduQAJmKJW5S98p94IasMcFk
Content-Type: multipart/mixed; boundary="------------tT627k6zk8L9vxPOpFEzDnM7";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <e7cf9dd8-9c67-476b-a892-b8dbe9312c4c@bp.renesas.com>
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>
In-Reply-To: <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>

--------------tT627k6zk8L9vxPOpFEzDnM7
Content-Type: multipart/mixed; boundary="------------gYXoYI3vxxKEXotyQaJdbFVX"

--------------gYXoYI3vxxKEXotyQaJdbFVX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29/05/2024 21:52, Sergey Shtylyov wrote:
> On 5/28/24 6:03 PM, Paul Barker wrote:
>=20
>> This patch makes multiple changes that can't be separated:
>>
>>   1) Allocate plain RX buffers via a page pool instead of allocating
>>      SKBs, then use build_skb() when a packet is received.
>>   2) For GbEth IP, reduce the RX buffer size to 2kB.
>>   3) For GbEth IP, merge packets which span more than one RX descripto=
r
>>      as SKB fragments instead of copying data.
>>
>> Implementing (1) without (2) would require the use of an order-1 page
>> pool (instead of an order-0 page pool split into page fragments) for
>> GbEth.
>>
>> Implementing (2) without (3) would leave us no space to re-assemble
>> packets which span more than one RX descriptor.
>>
>> Implementing (3) without (1) would not be possible as the network stac=
k
>> expects to use put_page() or page_pool_put_page() to free SKB fragment=
s
>> after an SKB is consumed.
>>
>> RX checksum offload support is adjusted to handle both linear and
>> nonlinear (fragmented) packets.
>>
>> This patch gives the following improvements during testing with iperf3=
=2E
>>
>>   * RZ/G2L:
>>     * TCP RX: same bandwidth at -43% CPU load (70% -> 40%)
>>     * UDP RX: same bandwidth at -17% CPU load (88% -> 74%)
>>
>>   * RZ/G2UL:
>>     * TCP RX: +30% bandwidth (726Mbps -> 941Mbps)
>>     * UDP RX: +417% bandwidth (108Mbps -> 558Mbps)
>>
>>   * RZ/G3S:
>>     * TCP RX: +64% bandwidth (562Mbps -> 920Mbps)
>>     * UDP RX: +420% bandwidth (90Mbps -> 468Mbps)
>>
>>   * RZ/Five:
>>     * TCP RX: +217% bandwidth (145Mbps -> 459Mbps)
>>     * UDP RX: +470% bandwidth (20Mbps -> 114Mbps)
>>
>> There is no significant impact on bandwidth or CPU load in testing on
>> RZ/G2H or R-Car M3N.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>> ---
>> Changes v3->v4:
>>   * Used a separate page pool for each RX queue.
>>   * Passed struct ravb_rx_desc to ravb_alloc_rx_buffer() so that we ca=
n
>>     simplify the calling function.
>>   * Explained the calculation of rx_desc->ds_cc.
>>   * Added handling of nonlinear SKBs in ravb_rx_csum_gbeth().
>>
>>  drivers/net/ethernet/renesas/ravb.h      |  10 +-
>>  drivers/net/ethernet/renesas/ravb_main.c | 230 ++++++++++++++--------=
-
>>  2 files changed, 146 insertions(+), 94 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/etherne=
t/renesas/ravb.h
>> index 6a7aa7dd17e6..f2091a17fcf7 100644
>> --- a/drivers/net/ethernet/renesas/ravb.h
>> +++ b/drivers/net/ethernet/renesas/ravb.h
> [...]> @@ -1094,7 +1099,8 @@ struct ravb_private {
>>  	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
>>  	void *tx_align[NUM_TX_QUEUE];
>>  	struct sk_buff *rx_1st_skb;
>> -	struct sk_buff **rx_skb[NUM_RX_QUEUE];
>> +	struct page_pool *rx_pool[NUM_RX_QUEUE];
>=20
>    Don't we need #include <net/page_pool/types.h>

Yes. I got away with it as ravb_main.c includes
<net/page_pool/helpers.h> before including "ravb.h", but the header
shouldn't assume that.

>=20
> [...]
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/et=
hernet/renesas/ravb_main.c
>> index dd92f074881a..bb7f7d44be6e 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
>> @@ -317,35 +289,56 @@ static void ravb_ring_free(struct net_device *nd=
ev, int q)
>>  	priv->tx_skb[q] =3D NULL;
>>  }
>> =20
>> +static int
>> +ravb_alloc_rx_buffer(struct net_device *ndev, int q, u32 entry, gfp_t=
 gfp_mask,
>> +		     struct ravb_rx_desc *rx_desc)
>> +{
>> +	struct ravb_private *priv =3D netdev_priv(ndev);
>> +	const struct ravb_hw_info *info =3D priv->info;
>> +	struct ravb_rx_buffer *rx_buff =3D &priv->rx_buffers[q][entry];
>> +	dma_addr_t dma_addr;
>> +	unsigned int size;
>> +
>> +	size =3D info->rx_buffer_size;
>> +	rx_buff->page =3D page_pool_alloc(priv->rx_pool[q], &rx_buff->offset=
, &size,
>> +					gfp_mask);
>> +	if (unlikely(!rx_buff->page)) {
>> +		/* We just set the data size to 0 for a failed mapping
>> +		 * which should prevent DMA from happening...
>> +		 */
>> +		rx_desc->ds_cc =3D cpu_to_le16(0);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dma_addr =3D page_pool_get_dma_addr(rx_buff->page) + rx_buff->offset=
;
>> +	dma_sync_single_for_device(ndev->dev.parent, dma_addr,
>> +				   info->rx_buffer_size, DMA_FROM_DEVICE);
>=20
>    Do we really need this call?

Looking at .config I see CONFIG_DMA_NEED_SYNC=3Dy so yes I think this is
needed.

>=20
>> +	rx_desc->dptr =3D cpu_to_le32(dma_addr);
>> +
>> +	/* The end of the RX buffer is used to store skb shared data, so we =
need
>> +	 * to ensure that the hardware leaves enough space for this.
>> +	 */
>> +	rx_desc->ds_cc =3D cpu_to_le16(info->rx_buffer_size
>> +				     - SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
>=20
>    Please leave the - operator on the previous line...

Ack.

>=20
>> +				     - ETH_FCS_LEN + sizeof(__sum16));
>=20
>    Here as well...

Ack.

>=20
>> +	return 0;
>> +}
>> +
>>  static u32
>>  ravb_rx_ring_refill(struct net_device *ndev, int q, u32 count, gfp_t =
gfp_mask)
>>  {
>>  	struct ravb_private *priv =3D netdev_priv(ndev);
>> -	const struct ravb_hw_info *info =3D priv->info;
>>  	struct ravb_rx_desc *rx_desc;
>> -	dma_addr_t dma_addr;
>>  	u32 i, entry;
>> =20
>>  	for (i =3D 0; i < count; i++) {
>>  		entry =3D (priv->dirty_rx[q] + i) % priv->num_rx_ring[q];
>>  		rx_desc =3D ravb_rx_get_desc(priv, q, entry);
>> -		rx_desc->ds_cc =3D cpu_to_le16(info->rx_max_desc_use);
>> =20
>> -		if (!priv->rx_skb[q][entry]) {
>> -			priv->rx_skb[q][entry] =3D ravb_alloc_skb(ndev, info, gfp_mask);
>> -			if (!priv->rx_skb[q][entry])
>> +		if (!priv->rx_buffers[q][entry].page) {
>> +			if (unlikely(ravb_alloc_rx_buffer(ndev, q, entry,
>=20
>    Well, IIRC Greg KH is against using unlikely() unless you have actua=
lly
> instrumented the code and this gives an improvement... have you? :-)

My understanding was that we should use unlikely() for error checking in
hot code paths where we want the "good" path to be optimised. I can drop
this if I'm wrong though.

>=20
> [...]
>> @@ -727,12 +739,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *s=
kb)
>>  	if (unlikely(skb->len < sizeof(__sum16) * 2))
>>  		return;
>> =20
>> -	hw_csum =3D skb_tail_pointer(skb) - sizeof(__sum16);
>> +	if (skb_is_nonlinear(skb)) {
>> +		last_frag =3D &shinfo->frags[shinfo->nr_frags - 1];
>> +		hw_csum =3D skb_frag_address(last_frag) + skb_frag_size(last_frag) =
- sizeof(__sum16);
>> +	} else {
>> +		hw_csum =3D skb_tail_pointer(skb) - sizeof(__sum16);
>> +	}
>=20
>    We can do the subtraction only once here...

Ack. I'll pull that out of the if.

>=20
> [...]
>> @@ -816,14 +824,26 @@ static int ravb_rx_gbeth(struct net_device *ndev=
, int budget, int q)
>>  			if (desc_status & MSC_CEEF)
>>  				stats->rx_missed_errors++;
>>  		} else {
>> +			struct ravb_rx_buffer *rx_buff =3D &priv->rx_buffers[q][entry];
>> +			void *rx_addr =3D page_address(rx_buff->page) + rx_buff->offset;
>=20
>    Need an empty line here...

Ack.

>=20
>>  			die_dt =3D desc->die_dt & 0xF0;
>> -			skb =3D ravb_get_skb_gbeth(ndev, entry, desc);
>> +			dma_sync_single_for_cpu(ndev->dev.parent, le32_to_cpu(desc->dptr),=

>> +						desc_len, DMA_FROM_DEVICE);
>> +
>>  			switch (die_dt) {
>>  			case DT_FSINGLE:
>>  			case DT_FSTART:
>>  				/* Start of packet:
>> -				 * Set initial data length.
>> +				 * Prepare an SKB and add initial data.
>=20
>    I'd prefer calling it skb in the comments...

Ack.

>=20
> [...]
>> @@ -865,7 +894,16 @@ static int ravb_rx_gbeth(struct net_device *ndev,=
 int budget, int q)
>>  				stats->rx_bytes +=3D skb->len;
>>  				napi_gro_receive(&priv->napi[q], skb);
>>  				rx_packets++;
>> +
>> +				/* Clear rx_1st_skb so that it will only be
>> +				 * non-NULL when valid.
>> +				 */
>> +				if (die_dt =3D=3D DT_FEND)
>> +					priv->rx_1st_skb =3D NULL;
>=20
>    Hm, can't we do this under *case* DT_FEND above?

It makes more logical sense to me to do this as the last step, but I
guess it's a little more optimal to do it earlier. I'll move it.

Thanks,

--=20
Paul Barker
--------------gYXoYI3vxxKEXotyQaJdbFVX
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------gYXoYI3vxxKEXotyQaJdbFVX--

--------------tT627k6zk8L9vxPOpFEzDnM7--

--------------NduQAJmKJW5S98p94IasMcFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZlhFDQUDAAAAAAAKCRDbaV4Vf/JGvcXD
AQCrgEBeh3Q47M88KJr3A+824TVXmdwbR8DZTYZJWvTYgAEAnyZP9yXhntoUECQxVpmydhJiR0fi
eeluhSL2cfp0MQ4=
=BtU8
-----END PGP SIGNATURE-----

--------------NduQAJmKJW5S98p94IasMcFk--

