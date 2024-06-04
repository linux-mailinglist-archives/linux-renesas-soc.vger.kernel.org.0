Return-Path: <linux-renesas-soc+bounces-5840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E568FBD7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 22:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77448B24273
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 20:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DAF14B090;
	Tue,  4 Jun 2024 20:47:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190214A627;
	Tue,  4 Jun 2024 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717534065; cv=none; b=MQiv/CZ9Rb4orR7ei7AwaBPfgwmPnIbOclxvo+ceEaWYT2SAu6nc4vcqedpCHZGQBMXSCdjwtshsBRjkAnKUQacLRyBRRE7a9VegyFB7DYpKe73iXC5Ud3F+fRB3OSHJ0sgCniCOMEnoXiHoRizvU3Dy7FrTFeeFnSkcKJX7Akg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717534065; c=relaxed/simple;
	bh=T8ArkHAWEsoLdQdAfF8cZxmF56dM4QXiFunMu84Sspg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=l2GHEJVlPDgvQ6w9gbaEp2IO4BsDPR7buYafYEjbYQrVdk/+K74ep2i/wI5jc59qkfJcEzQyI1rLnBGKfAxSrkNEKXaXow6eoEKJvmCy5UNS6WGCwqypepdiH6fT1CFwFYG2xyxZkeHKVa+CvEGijznqz2nTiCLNJMpcO7DkZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.78.182) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 23:47:26 +0300
Subject: Re: [net-next PATCH v5 2/7] net: ravb: Align poll function with NAPI
 docs
To: Paul Barker <paul.barker.ct@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
 <20240604072825.7490-3-paul.barker.ct@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <4958f946-3c95-9280-9da8-3670a3187cc5@omp.ru>
Date: Tue, 4 Jun 2024 23:47:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240604072825.7490-3-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/04/2024 20:26:27
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185716 [Jun 04 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.182 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.182 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	178.176.78.182:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.182
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/04/2024 20:29:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/4/2024 4:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/4/24 10:28 AM, Paul Barker wrote:

> Align ravb_poll() with the documentation in
> `Documentation/networking/kapi.rst` and
> `Documentation/networking/napi.rst`.
> 
> The documentation says that we should prefer napi_complete_done() over
> napi_complete(), and using the former allows us to properly support busy
> polling. We should ensure that napi_complete_done() is only called if
> the work budget has not been exhausted, and we should only re-arm
> interrupts if it returns true.
> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

[...]

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

MBR, Sergey

