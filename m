Return-Path: <linux-renesas-soc+bounces-6513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5E290F6A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 21:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCBC28148E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415CF50275;
	Wed, 19 Jun 2024 19:02:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99019134A5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718823720; cv=none; b=j4+s6k5q0vldFM4PB3daaGJ3GMFDFG9uRCz9i+CqyLD+RBdO3Juc1ZqwUppR0jqz89E13rus6D0iQdL4/K4AXGnvFRTcJ7jU1LeHTe6AX6q/2i7WLMIZq3f2sOp+DEXFwzUpKMLTU4i74oJUX+WTXvMVdFb3xpxD5q0igzjaXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718823720; c=relaxed/simple;
	bh=wbbd5WI0XpzSTA+wmazL+FOVqr33LbAsH+PBmSlS3b4=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TuDvw54kjISD4patReHklDPBW9snWHmx9QxMm84w6hPcNy5R7fUX+tX6MqHTe9d5mAT8UlJj3KXLzk8b66wMBb5VCvbvtCCqPFKPn9HsPdToACFCrKVgjfwWcJNMbL5ikfkWY0evrj39tI0SsJLoGsBMWnZB6mNEadZ+1mSgzVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.77.146) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 22:01:44 +0300
Subject: Re: [PATCH/RFC] net: ravb: Add MII support for R-Car V4M
To: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
CC: <linux-renesas-soc@vger.kernel.org>
References: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f757f4a2-2ac5-3005-93e2-aaaab6e95e30@omp.ru>
Date: Wed, 19 Jun 2024 22:01:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f0ef3e00aec461beb33869ab69ccb44a23d78f51.1718378166.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/19/2024 18:46:48
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 186013 [Jun 19 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.77.146
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/19/2024 18:51:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/19/2024 4:03:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/14/24 6:25 PM, Geert Uytterhoeven wrote:

> All EtherAVB instances on R-Car Gen3/Gen4 SoCs support the RGMII
> interface.  In addition, the first two EtherAVB instances on R-Car V4M
> also support the MII interface, but this is not yet supported by the
> driver.
> 
> Add support for MII to the R-Car Gen3/Gen4-specific EMAC initialization
> function, by selecting the MII clock instead of the RGMII clock when the

   But why are you adding such code to the ge3 function? According to the gen3
manual I have, gen3 SoCs don't have MII support...

> PHY interface is MII.  Note that all implementations of EtherAVB on
> R-Car Gen3/Gen4 SoCs have the APSR register, but only MII-capable
> instances are documented to have the MIISELECT bit, which has a
> documented value of zero when reserved.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c1546b916e4ef581..cbe2709e0ace871f 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -579,6 +579,16 @@ static void ravb_emac_init_rcar(struct net_device *ndev)
>  	ravb_write(ndev, ECSIPR_ICDIP | ECSIPR_MPDIP | ECSIPR_LCHNGIP, ECSIPR);
>  }
>  
> +static void ravb_emac_init_rcar_apsr(struct net_device *ndev)

   No, this name doesn't match the currently used naming scheme (which
has the SoC type as a last word... I'm suggesting something like ravb_emac_init_rcar_gen4() instead.

[...]
> @@ -2657,7 +2667,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.set_rate = ravb_set_rate_rcar,
>  	.set_feature = ravb_set_features_rcar,
>  	.dmac_init = ravb_dmac_init_rcar,
> -	.emac_init = ravb_emac_init_rcar,
> +	.emac_init = ravb_emac_init_rcar_apsr,

   I'm afraid we'll have to add the new ravb_gen4_hw_info variable. We already
have the gen4-specific compatible in ravb_match_table[]...

[...]

MBR, Sergey

