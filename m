Return-Path: <linux-renesas-soc+bounces-5893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B98FD60A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 20:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1300E2850C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 18:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067813B5B5;
	Wed,  5 Jun 2024 18:51:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985C22615;
	Wed,  5 Jun 2024 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613475; cv=none; b=amd9CbUCSFqIb72Mp4ztgpZkcvQ0uC5KonPSPAI6QkflyESCeSj1f485t4v9a9hW4/VoHqQYswhjVDp3uO8XNr0wgfiCMGXsbcFN1fFCKBPkpr7IV1hDBJ4OEf2gSWdSthcQVeSh+3k2tCBAiXRyo3DdX9xSyCH9QaInYw8eq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613475; c=relaxed/simple;
	bh=zx9Pn72XW+0OyeDmaj8nqxeP/1TM/BNsr82eIksOpv8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FGAzRPu3eHxSG0S/BTpwBdBNxr33EE18VTMti11s6J/aHwlu/pe4mBg2bhj9MXN6WIwf/n+nSM3k2bIZSWlcJlU6NzCU4Pw/F+P9YOYViG0SoGpScGA7WILiiC4an7JgtthUpZSPVo3S5qc5LZjLbxbHEKrPml3vLKDHtxUJP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.195) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 5 Jun
 2024 21:51:02 +0300
Subject: Re: [net-next PATCH v5 4/7] net: ravb: Refactor GbEth RX code path
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
 <20240604072825.7490-5-paul.barker.ct@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <9fc54591-532e-2dc0-6f83-52a5d4a6312e@omp.ru>
Date: Wed, 5 Jun 2024 21:51:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240604072825.7490-5-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/05/2024 18:28:34
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185750 [Jun 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.195 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.195 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;31.173.84.195:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.195
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/05/2024 18:33:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/5/2024 4:42:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/4/24 10:28 AM, Paul Barker wrote:

> We can reduce code duplication in ravb_rx_gbeth().
> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>


Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

