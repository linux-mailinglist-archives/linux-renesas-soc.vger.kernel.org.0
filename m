Return-Path: <linux-renesas-soc+bounces-3409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E692F86F43A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Mar 2024 10:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A18B28293E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Mar 2024 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F709B641;
	Sun,  3 Mar 2024 09:57:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B12900;
	Sun,  3 Mar 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709459861; cv=none; b=StL3d4ybAplkCeKdfRktmebEUKgo8oYO6g+WBuDBstTf6+KXeopoi9YDa3XgZ5GyhcVxk52enmfHo2dPyoiPkBNcukByxkqiWlrBnCs/UgRyedLII/eSp1/VRRx0bwW9jRXxYRM7J6VQ3UfzO31ARzsucHH2h9UC9PnFENlKQu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709459861; c=relaxed/simple;
	bh=Xcwy7LCxB7jJU0xRhAN9dYKv3RLwWlRgyZGsncWMs3A=;
	h=From:Subject:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=An+y/xTVBHqsdraBFz34/KUgtWUGD+XwggHus8VuwN/FA959eerisVHRZ3+RcB+oiZMpLeLGfZDnO/m8LydIV1deIFxvOAWPGn+nnk6ZgQqXbk95SAv1CuN/SfB7gdAvRso4R/FBPh2V0WDn1Az9xa4g7sgZ2K84PL28KhkJddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.74.177) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sun, 3 Mar
 2024 12:57:20 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [net-next,v2 3/6] ravb: Create helper to allocate skb and align
 it
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
Organization: Open Mobile Platform
Message-ID: <5e01055d-cb63-3bb2-496b-b3222fab06fc@omp.ru>
Date: Sun, 3 Mar 2024 12:57:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 03/03/2024 09:46:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183905 [Mar 03 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.177 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;178.176.74.177:7.4.1,7.7.3
X-KSE-AntiSpam-Info: {cloud_iprep_silent}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.74.177
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/03/2024 09:51:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/3/2024 4:38:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/28/24 1:33 AM, Niklas Söderlund wrote:

> The RAVB device requires the SKB data to be aligned to 128 bytes. The

   I prefer calling it Ether[net]AVB (like the manuals do), that "ravb" is
the driver's name... :-)

> alignment is done by allocating a skb 128 bytes larger than the maximum

   s/a/an/.

> frame size supported by the device and adjusting the headroom to fit the
> requirement.
> 
> This code has been refactored a few times and small issues have been
> added along the way. The issues are not harmful but prevents merging

   Prevent.

> parts of the Rx code which have been split in two implementations with
> the addition of RZ/G2L support, a device that supports larger frame
> sizes.
> 
> This change removes the need for duplicated and somewhat inaccurate
> hardware alignment constrains stored in the hardware information struct
> by creating a helper to handle the allocation of a skb and alignment of

   s/a/an/.

> a skb data.

   s/a/an/.
 
> For the R-Car class of devices the maximum frame size is 4K and each
> descriptor is limited to 2K of data. The current implementation does not
> support split descriptors, this limits the frame size to 2K. The
> current hardware information however records the descriptor size just
> under 2K due to bad understanding of the device when larger MTUs where
> added.
> 
> For the RZ/G2L device the maximum frame size is 8K and each descriptor
> is limited to 4K of data. The current hardware information records this
> correctly, but it gets the alignment constrains wrong as just aligns it
> by 128, it does not extend it by 128 bytes to allow the full frame to be
> stored. This works because the RZ/G2L device supports split descriptors
> and allocates each skb to 8K and aligns each 4K descriptor in this
> space.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 5c72b780d623..e6b025058847 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
> @@ -372,7 +383,7 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
>  		rx_desc = &priv->rx_ring[q].ex_desc[i];
>  		rx_desc->ds_cc = cpu_to_le16(RX_BUF_SZ);

   Don't we need to also update this?

>  		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
> -					  RX_BUF_SZ,
> +					  priv->info->rx_max_frame_size,
>  					  DMA_FROM_DEVICE);
>  		/* We just set the data size to 0 for a failed mapping which
>  		 * should prevent DMA from happening...
[...]

MBR, Sergey

