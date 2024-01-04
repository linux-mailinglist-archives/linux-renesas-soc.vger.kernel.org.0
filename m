Return-Path: <linux-renesas-soc+bounces-1297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 162958249C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 21:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 991C7B21536
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jan 2024 20:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE841E517;
	Thu,  4 Jan 2024 20:47:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165582C68F;
	Thu,  4 Jan 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.104] (178.176.76.15) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 4 Jan
 2024 23:47:15 +0300
Subject: Re: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
To: Simon Horman <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103212822.GA48301@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
Date: Thu, 4 Jan 2024 23:47:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240103212822.GA48301@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/04/2024 20:36:55
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
	178.176.76.15:7.4.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {cloud_iprep_silent}
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
X-KSE-Antiphishing-Bases: 01/04/2024 20:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/4/2024 6:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/4/24 12:28 AM, Simon Horman wrote:
[...]
>> I don't know this hardware, I don't have the manuals for it, so I can't
>> provide a good review.  Let's exclude the Ethernet Switch related files.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Hi Sergey,

  Hi Simon, long time, no see... :-)

> I don't know the back story to this, if there is one.

   Not much of a history: I got a lot of the rswitch patches in my
inbox and I mostly ignored them... but kept deferring this patch due
to a high load with fixing Svace's reports at work...

> But could I suggest that:
> 
> 1. The patch also updates the title MAINTAINERS section to cover the
>    remaining two drivers.
> 
>    e.g.: RENESAS ETHERNET DRIVERS ->
>          RENESAS ETHERNET AVB AND SUPERH ETHERNET DRIVERS
> 
>    Or alternatively, create separate sections for each driver.

   Yeah, this 2nd option seems cleaner. Still not sure about Kconfig/
Makefile though...

>    n.b.: This may involve moving sections to maintain alphabetical order
>          by section title
> 
> 2. Reaching out to Shimoda-san (CCed) or other relevant parties
>    to see if an appropriate maintainer or maintainers for the
>    Renesas Ethernet Switch driver can be found.
> 
>    n.b.: It may still be a holiday period in Japan for the rest of the week.

   It's a holiday period here in Russia as well, till the 8th of Jaunary. :-)

> 3. Rephrase the subject and patch description as splitting out maintenance of
>    the Renesas Ethernet Switch driver .

[...]

MBR, Sergey

