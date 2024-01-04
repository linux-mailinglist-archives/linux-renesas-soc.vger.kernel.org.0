Return-Path: <linux-renesas-soc+bounces-1296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BADCD824988
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 21:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D6D1F234E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 20:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512A02C698;
	Thu,  4 Jan 2024 20:24:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5462C695;
	Thu,  4 Jan 2024 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.104] (178.176.76.15) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 4 Jan
 2024 23:23:51 +0300
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
To: Jakub Kicinski <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103133735.7bd660b9@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7273be70-64b8-3af1-85e2-4d7eb67fc4f1@omp.ru>
Date: Thu, 4 Jan 2024 23:23:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240103133735.7bd660b9@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/04/2024 20:08:13
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182464 [Jan 04 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.15 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.15 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.76.15
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/04/2024 20:13:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/4/2024 6:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/4/24 12:37 AM, Jakub Kicinski wrote:

[...]
>> I don't know this hardware, I don't have the manuals for it, so I can't
>> provide a good review.  Let's exclude the Ethernet Switch related files.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
>> Index: net/MAINTAINERS
>> ===================================================================
>> --- net.orig/MAINTAINERS
>> +++ net/MAINTAINERS
>> @@ -18358,6 +18358,9 @@ L:	linux-renesas-soc@vger.kernel.org
>>  F:	Documentation/devicetree/bindings/net/renesas,*.yaml
>>  F:	drivers/net/ethernet/renesas/
>>  F:	include/linux/sh_eth.h
>> +X:	Documentation/devicetree/bindings/net/renesas,*ether-switch.yaml
>> +X:	drivers/net/ethernet/renesas/rcar_gen4_ptp.*
>> +X:	drivers/net/ethernet/renesas/rswitch.*
> 
> First off, very nice to see a refinement of MAINTAINERS to narrow
> down the scope and make it more precise. Thanks for doing that.

   It's long overdue. I've got a lot of the rswitch patches in my inbox
which I mostly ignored. Unfortunately, I've been loaded with fixing the
Svace (static analyzer) reports for about 2 years now...

> The solution itself is not very idiomatic, however :(
> IIUC you want to support SuperH and the AVB implementation.
> It'd be more usual to make the entry cover only the relevant files.

   Yeah, figured that out fianally... but still not sure what should
I do with Kconfig and Makefile...

> And for bonus points perhaps add an entry covering the switch files,
> mark that entry as Orphan?

   Will try to loop in Shimoda-san first -- maybe he'd be brave enough
to step in... :-)

MBR, Sergey

