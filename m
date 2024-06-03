Return-Path: <linux-renesas-soc+bounces-5765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DFE8D7CFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 10:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CADA1F212DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 08:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014A450A80;
	Mon,  3 Jun 2024 08:03:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF58487BF;
	Mon,  3 Jun 2024 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401787; cv=none; b=lSJYiuJHwx4vkaPjJlUTC9O0IyO+ggW5FXVQMkzjDQKIPc2lHNZc60xztLwl22x6WhmzaRo2fvjaqFvssclKAoUq24OW9EJ6fSPG12wd+H1uZk1ntId4fveP49N116QgPB084rpnuMft01lR1foiUzXHYidJYhTi/hpWauFCQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401787; c=relaxed/simple;
	bh=OusBBOulCw3ULuWtWaK5geeGS93JDe8ET3JIBVu3PSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpUn2Z7qVtWwgTCRsB5aERMWK9OM1R+ta6ZefU3NTVM1v6xsPWf7XcAmJ2tEXnq0iDaBEteSZ6Kn/6UnT/DDhR1WqDxoAGOhb3s7CXCPi8cafU26bBlxuxD83w8fzBoYy6FxeVMZfjNzmQiQWRkXhit1/nszmAhSja+74xJmMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,210,1712588400"; 
   d="asc'?scan'208";a="206523729"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jun 2024 17:02:57 +0900
Received: from [10.226.92.239] (unknown [10.226.92.239])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E3196400A653;
	Mon,  3 Jun 2024 17:02:52 +0900 (JST)
Message-ID: <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
Date: Mon, 3 Jun 2024 09:02:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
To: Simon Horman <horms@kernel.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240601101300.GA491852@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b121cLfRPSkssOH00KLMrU7K"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b121cLfRPSkssOH00KLMrU7K
Content-Type: multipart/mixed; boundary="------------R30QspFlbmKavc0wVY53QG5y";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Simon Horman <horms@kernel.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
In-Reply-To: <20240601101300.GA491852@kernel.org>

--------------R30QspFlbmKavc0wVY53QG5y
Content-Type: multipart/mixed; boundary="------------zbhuKgbMatVfEqxSttUB0omu"

--------------zbhuKgbMatVfEqxSttUB0omu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/06/2024 11:13, Simon Horman wrote:
> On Tue, May 28, 2024 at 04:03:39PM +0100, Paul Barker wrote:
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
>=20
> Hi Paul,
>=20
> Some minor feedback from my side.
>=20
> ...
>=20
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/et=
hernet/renesas/ravb_main.c
>=20
> ...
>=20
>> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *nd=
ev, int q)
>>  		priv->tx_ring[q] =3D NULL;
>>  	}
>> =20
>> -	/* Free RX skb ringbuffer */
>> -	if (priv->rx_skb[q]) {
>> -		for (i =3D 0; i < priv->num_rx_ring[q]; i++)
>> -			dev_kfree_skb(priv->rx_skb[q][i]);
>> +	/* Free RX buffers */
>> +	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>> +		if (priv->rx_buffers[q][i].page)
>> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page, =
0, true);
>=20
> nit: Networking still prefers code to be 80 columns wide or less.
>      It looks like that can be trivially achieved here.
>=20
>      Flagged by checkpatch.pl --max-line-length=3D80

Sergey has asked me to wrap to 100 cols [1]. I can only find a reference
to 80 in the docs though [2], so I guess you may be right.

[1]: https://lore.kernel.org/all/611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp=
=2Eru/
[2]: https://www.kernel.org/doc/html/latest/process/coding-style.html

>=20
>>  	}
>> -	kfree(priv->rx_skb[q]);
>> -	priv->rx_skb[q] =3D NULL;
>> +	kfree(priv->rx_buffers[q]);
>> +	priv->rx_buffers[q] =3D NULL;
>> +	page_pool_destroy(priv->rx_pool[q]);
>> =20
>>  	/* Free aligned TX buffers */
>>  	kfree(priv->tx_align[q]);
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
>=20
> nit: I would appreciate it if some consideration could be given to
>      moving this driver towards rather than away from reverse xmas
>      tree - longest line to shortest - for local variable declarations.=

>=20
>      I'm not suggesting a clean-up patch. Rather, that in cases
>      like this where new code is added, and also in cases where
>      code is modified, reverse xmas tree is preferred.
>=20
>      Here I would suggest separating the assinment of rx_buf from
>      it's declaration (completely untested!):
>=20
> 	struct ravb_private *priv =3D netdev_priv(ndev);
> 	const struct ravb_hw_info *info =3D priv->info;
> 	struct ravb_rx_buffer *rx_buff;
> 	dma_addr_t dma_addr;
> 	unsigned int size;
>=20
> 	rx_buff =3D &priv->rx_buffers[q][entry];
>=20
>      Edward Cree's xmastree tool can be helpful here:
>      https://github.com/ecree-solarflare/xmastree

Ack.

>=20
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
>> +	rx_desc->dptr =3D cpu_to_le32(dma_addr);
>> +
>> +	/* The end of the RX buffer is used to store skb shared data, so we =
need
>> +	 * to ensure that the hardware leaves enough space for this.
>> +	 */
>> +	rx_desc->ds_cc =3D cpu_to_le16(info->rx_buffer_size
>> +				     - SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
>> +				     - ETH_FCS_LEN + sizeof(__sum16));
>> +	return 0;
>> +}
>=20
> ...
>=20
>> @@ -816,14 +824,26 @@ static int ravb_rx_gbeth(struct net_device *ndev=
, int budget, int q)
>>  			if (desc_status & MSC_CEEF)
>>  				stats->rx_missed_errors++;
>>  		} else {
>> +			struct ravb_rx_buffer *rx_buff =3D &priv->rx_buffers[q][entry];
>> +			void *rx_addr =3D page_address(rx_buff->page) + rx_buff->offset;
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
>>  				 */
>> +				skb =3D napi_build_skb(rx_addr, info->rx_buffer_size);
>> +				if (unlikely(!skb)) {
>> +					stats->rx_errors++;
>> +					page_pool_put_page(priv->rx_pool[q],
>> +							   rx_buff->page, 0, true);
>=20
> Here skb is NULL.
>=20
>> +					break;
>> +				}
>> +				skb_mark_for_recycle(skb);
>>  				skb_put(skb, desc_len);
>> =20
>>  				/* Save this SKB if the packet spans multiple
>> @@ -836,14 +856,23 @@ static int ravb_rx_gbeth(struct net_device *ndev=
, int budget, int q)
>>  			case DT_FMID:
>>  			case DT_FEND:
>>  				/* Continuing a packet:
>> -				 * Move data into the saved SKB.
>> +				 * Add this buffer as an RX frag.
>>  				 */
>> -				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
>> -							       priv->rx_1st_skb->len,
>> -							       skb->data,
>> -							       desc_len);
>> -				skb_put(priv->rx_1st_skb, desc_len);
>> -				dev_kfree_skb(skb);
>> +
>> +				/* rx_1st_skb will be NULL if napi_build_skb()
>> +				 * failed for the first descriptor of a
>> +				 * multi-descriptor packet.
>> +				 */
>> +				if (unlikely(!priv->rx_1st_skb)) {
>> +					stats->rx_errors++;
>> +					page_pool_put_page(priv->rx_pool[q],
>> +							   rx_buff->page, 0, true);
>=20
> And here skb seems to be uninitialised.
>=20
>> +					break;
>> +				}
>> +				skb_add_rx_frag(priv->rx_1st_skb,
>> +						skb_shinfo(priv->rx_1st_skb)->nr_frags,
>> +						rx_buff->page, rx_buff->offset,
>> +						desc_len, info->rx_buffer_size);
>> =20
>>  				/* Set skb to point at the whole packet so that
>>  				 * we only need one code path for finishing a
>=20
> The code between the hunk above and the hunk below is:
>=20
> 				/* Set skb to point at the whole packet so that
> 				 * we only need one code path for finishing a
> 				 * packet.
> 				 */
> 				skb =3D priv->rx_1st_skb;
> 			}
> 			switch (die_dt) {
> 			case DT_FSINGLE:
> 			case DT_FEND:
> 				/* Finishing a packet:
> 				 * Determine protocol & checksum, hand off to
> 				 * NAPI and update our stats.
> 				 */
> 				skb->protocol =3D eth_type_trans(skb, ndev);
> 				if (ndev->features & NETIF_F_RXCSUM)
> 					ravb_rx_csum_gbeth(skb);
> 				stats->rx_bytes +=3D skb->len;
> 				napi_gro_receive(&priv->napi[q], skb);
> 				rx_packets++;
>=20
> It seems that the inter-hunk code above may dereference skb when it is =
NULL
> or uninitialised.
>=20
> Flagged by Smatch.

I see what has happened here. I wrote this using if statements first,
then changed to switch statements in response to Sergey's review. So the
break statements were intended to break out of the outer for loop, not
the switch statement. I'll need to replace them with goto statements.

Thanks for your review!

--=20
Paul Barker
--------------zbhuKgbMatVfEqxSttUB0omu
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

--------------zbhuKgbMatVfEqxSttUB0omu--

--------------R30QspFlbmKavc0wVY53QG5y--

--------------b121cLfRPSkssOH00KLMrU7K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZl14qwUDAAAAAAAKCRDbaV4Vf/JGvWld
AP0U42Qbsg8P89QByTcMcgnaP7qAUe/sZC/xt0bbAJUyFQEAmwqY6xuk4DXsMWd+FdkOTULdw5dF
S9HKvxaGEv4nYgo=
=9PQC
-----END PGP SIGNATURE-----

--------------b121cLfRPSkssOH00KLMrU7K--

