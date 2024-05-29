Return-Path: <linux-renesas-soc+bounces-5673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B028D3E55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 20:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DC7F1F23D59
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 18:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2815B990;
	Wed, 29 May 2024 18:30:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ABF1B949;
	Wed, 29 May 2024 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007431; cv=none; b=FGFIrJCY0+XqLnMHCMLOuuhrxXIlF7UXIOOU/CDq7C+nT/r6AOZWqg5dhRZy7oJswKwqQzW8We+Gg80kWWAKu6dX5h3CoMQiInQn8rKbPLZeV3csUcucxW49ceS+RBhBT+EuIitXfo8g4yg9JbZ8o5MbNZuQhVvmMyFG4cqrmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007431; c=relaxed/simple;
	bh=v/g7ChUERc+YBX4PR0tIacx+5V0vyX+QMkYyi8IFySY=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OI+1UdPJqFOkXJYkbt/wHq3bM+7zANvrp/DZ68wisoMfSgy6SCkFimiYak4vM2Hb67iPJu0ToKdd2R8QsfANUDJMrghWMj8naTfdecBKLY5E4Yt4/inR4doTyItZYU0GPyV3JluOwMElt9LFfsNpYdY7rZVvMaVSJV6dFpWmTVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.72.107) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 29 May
 2024 21:30:09 +0300
Subject: Re: [net-next PATCH v4 4/7] net: ravb: Refactor GbEth RX code path
To: Paul Barker <paul.barker.ct@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-5-paul.barker.ct@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru>
Date: Wed, 29 May 2024 21:30:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240528150339.6791-5-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 05/29/2024 18:07:30
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185600 [May 29 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.107 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.107
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/29/2024 18:11:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 5/29/2024 5:02:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 5/28/24 6:03 PM, Paul Barker wrote:

> We can reduce code duplication in ravb_rx_gbeth().
> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 7df7d2e93a3a..c9c5cc641589 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -817,47 +817,54 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>  				stats->rx_missed_errors++;
>  		} else {
>  			die_dt = desc->die_dt & 0xF0;
> +			skb = ravb_get_skb_gbeth(ndev, entry, desc);
>  			switch (die_dt) {

   Why not do instead (as I've asked you alraedy):

			case DT_FSTART:
				priv->rx_1st_skb = skb;
				fallthrough;

>  			case DT_FSINGLE:
> -				skb = ravb_get_skb_gbeth(ndev, entry, desc);


> +			case DT_FSTART:
> +				/* Start of packet:
> +				 * Set initial data length.
> +				 */

   Please consider turning that block comment into one-liner...

>  				skb_put(skb, desc_len);
> +
> +				/* Save this SKB if the packet spans multiple
> +				 * descriptors.
> +				 */

   This one too...
   (The current line length limit is 100 columns.)

> +				if (die_dt == DT_FSTART)
> +					priv->rx_1st_skb = skb;

   This needs to be done under *case* DT_FSTART above instead...

> +				break;
> +
> +			case DT_FMID:
> +			case DT_FEND:
> +				/* Continuing a packet:
> +				 * Move data into the saved SKB.
> +				 */
> +				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
> +							       priv->rx_1st_skb->len,
> +							       skb->data,
> +							       desc_len);
> +				skb_put(priv->rx_1st_skb, desc_len);
> +				dev_kfree_skb(skb);
> +
> +				/* Set skb to point at the whole packet so that

   Please call it consistently, either SKB or skb (I prefer this one).

> +				 * we only need one code path for finishing a
> +				 * packet.
> +				 */
> +				skb = priv->rx_1st_skb;
> +			}
> +
> +			switch (die_dt) {
> +			case DT_FSINGLE:
> +			case DT_FEND:
> +				/* Finishing a packet:
> +				 * Determine protocol & checksum, hand off to
> +				 * NAPI and update our stats.
> +				 */
>  				skb->protocol = eth_type_trans(skb, ndev);
>  				if (ndev->features & NETIF_F_RXCSUM)
>  					ravb_rx_csum_gbeth(skb);
> +				stats->rx_bytes += skb->len;
>  				napi_gro_receive(&priv->napi[q], skb);
>  				rx_packets++;

   Otherwise, this is very good patch! Sorry for letting in the duplcate
code earlier! :-)

[...]

MBR, Sergey

