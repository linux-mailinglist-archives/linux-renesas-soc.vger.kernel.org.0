Return-Path: <linux-renesas-soc+bounces-12954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AEA2C4C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 15:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD5547A6981
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3150C22FF58;
	Fri,  7 Feb 2025 14:08:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC35221DBD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Feb 2025 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937305; cv=none; b=ZcahHwjd2q3g6Q+7Ebq0RcdlzWz4ML/NPiPbpwqzsRBbiqExBxp7oQLMY/ac1muBVJb66T0E6o+YoygFg7wVJ/EEXhHRZmOMGnflA2d7AnozhbhsnwwoNPv8L9dClWRhOgMc3AFBR5DuJhzNVIUsQ9gCHR6Wn2A2CsYo6R5y5m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937305; c=relaxed/simple;
	bh=NbV5++rJzflBrbVw9AgGVCZTq9YsRaT1/xa1DeUxS/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZNZ7CMM3Bs/RY+x0WIqjTxz4n9LCMlEvXXLvZH/fLnxFewwfA+jl82XAxKqquyyYBOLE6KMb5sucTR9wDbEI3PhCXIBP4DilUDqy6V9ii0uMleVB0KGCz3lTheUIyDnZYWrSKm9rvTP+XIjJ5WMPu8o2CZ3oI/c4OjsjsKgOy8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.160.224) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 7 Feb
 2025 16:53:00 +0300
Message-ID: <8fb03758-d256-4e8d-aacc-e97639892a33@omp.ru>
Date: Fri, 7 Feb 2025 16:53:00 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] irqchip/renesas-rzv2h: Drop macros
 ICU_TSSR_TSSEL_{MASK,PREP}
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>,
	<linux-renesas-soc@vger.kernel.org>
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
 <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/07/2025 13:26:54
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 190873 [Feb 07 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.7
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 50 0.3.50
 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.160.224 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.160.224 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	213.87.160.224:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.160.224
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/07/2025 13:29:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/7/2025 9:59:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/7/25 2:36 PM, Biju Das wrote:

> On RZ/G3E, TSSEL register field is 8 bits wide compared to 7 on RZ/V2H.
> Also bits 8..14 is reserved on RZ/G3E and any writes on these reserved
> bits is ignored. Use the bitmask GENMASK(field_width - 2, 0) on both SoCs
> for extracting TSSEL and we can drop the macros ICU_TSSR_TSSEL_PREP and
> ICU_TSSR_TSSEL_MASK.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
> index 6d1de9277c7d..71d06820e598 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
[...]
> @@ -321,8 +318,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
>  	guard(raw_spinlock)(&priv->lock);
>  
>  	tssr = readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_k));
> -	tssr &= ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
> -	tssr |= ICU_TSSR_TSSEL_PREP(tint, tssel_n);
> +	tssr &= ~((GENMASK(priv->info->field_width - 2, 0) <<
> +		   (tssel_n * priv->info->field_width)) | tien);
> +	tssr |= (tint << (tssel_n * priv->info->field_width));

   Don't need () around the |='s rvalue.

[...]

MBR, Sergey


