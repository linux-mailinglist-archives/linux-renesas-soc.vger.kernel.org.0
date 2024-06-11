Return-Path: <linux-renesas-soc+bounces-6079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93A903F39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 16:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4719628607B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 14:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D079E12E48;
	Tue, 11 Jun 2024 14:51:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04A1B5A4;
	Tue, 11 Jun 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117502; cv=none; b=l/B7PIatv+d/MmpIF4R60gKSqfUqXJF4L1nSvPpWt5KwWKdfqdRKOTa0v493+SyvvujDieDw/BAm3lQ3IBDiWNDVyTfUID5WO4b4onFKq7tOtUzLGAwp2PmBdPGWXCqvBv2TCEKnNDxQ9IqnZWu/2Cb4lky29B4BvhUMKdUm4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117502; c=relaxed/simple;
	bh=TDzr1Mo8/sJ3FGHibQwF3qogkFlalO8tEDXakXpFlyQ=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=l+ePvV5pjeH+LPnJMcTk0o2cDFg/RTb7+RWh7Vl0C/K/pJmrOaDw6hbVUXoA4eczYZAmWpU5lJTRAmq+BhTB5YREAT4HXkPtv26DJ+fF2BC5Ka/w++2Rko50gfJMMrWSpMe4ZmmkMz1UO+lznTqRQrrzwR5o7GN2UrSPksDIc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.79.242) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 11 Jun
 2024 17:51:23 +0300
Subject: Re: [PATCH] [net] ravb: RAVB should select PAGE_POOL
To: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <fa61b464ae1aa7630e9024f091991937941d49f1.1718113630.git.geert+renesas@glider.be>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <353e07ba-1fee-f2be-3b4a-419f3f98e3aa@omp.ru>
Date: Tue, 11 Jun 2024 17:51:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fa61b464ae1aa7630e9024f091991937941d49f1.1718113630.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/11/2024 14:36:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185868 [Jun 11 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.79.242 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.79.242
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/11/2024 14:40:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/11/2024 10:46:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/11/24 4:48 PM, Geert Uytterhoeven wrote:

> If CONFIG_PAGE_POOL is not enabled:
> 
>     aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>     aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
>     aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_rx_ring_refill':
>     ravb_main.c:(.text+0x8d8): undefined reference to `page_pool_alloc_pages'
>     aarch64-linux-gnu-ld: ravb_main.c:(.text+0x944): undefined reference to `page_pool_alloc_frag'
>     aarch64-linux-gnu-ld: drivers/net/ethernet/renesas/ravb_main.o: in function `ravb_ring_init':
>     ravb_main.c:(.text+0x1d4c): undefined reference to `page_pool_create'

   Oopsie! :-)

> Fixes: 966726324b7b1400 ("net: ravb: Allocate RX buffers via page pool")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey


