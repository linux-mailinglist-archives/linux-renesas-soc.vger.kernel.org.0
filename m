Return-Path: <linux-renesas-soc+bounces-1844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99683CBF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 20:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A855B1F21980
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 19:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9728E12A16D;
	Thu, 25 Jan 2024 19:11:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15648472;
	Thu, 25 Jan 2024 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209869; cv=none; b=etsi7/VC9EL5fupsph5m592kbXMDbRWZBVyTfReq31Z+xlbHB99e+DsFTbbtYOdpFZPLFymJSwEq6KDya66xDignFJiDnUFbCJKbJUdit2eQxRA0UgLS3GplDrhqIbpND5BqKce9HHTOItjXO2VNuLeVyWnsxihGveQMiI+10GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209869; c=relaxed/simple;
	bh=rG0wyz2mZz0eyrwCAT1LdluCvKQNeMLcaSOnUATCrQg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=i5l4XtdMD7UIDyE/HYV3YuwxdG4QOT8nHtS60M2rUNh+WKGcVoYtt0nwkyUl7cT/M8KNfXwPfWTi4EyFO5/L3hgrMtmOFnmtgsl0OFKP1c4xz2g+IT1UofjuF+sPno4zL59jZgoY0zmtNLthlDvagaYgPf0zHBx3H48I6dacKLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.86.50) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 25 Jan
 2024 22:10:55 +0300
Subject: Re: [PATCH net-next v2 0/2] Add HW checksum offload support for
 RZ/G2L GbEthernet IP
To: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>, <peterz@infradead.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5245e582-5eea-ccdf-2ba3-fda58e261172@omp.ru>
Date: Thu, 25 Jan 2024 22:10:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/25/2024 18:49:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182947 [Jan 25 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.50 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.86.50 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.86.50
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/25/2024 18:55:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/25/2024 4:13:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

On 1/24/24 1:21 PM, Biju Das wrote:

> This patch series aims to add HW checksum offload supported by TOE module
> found on the RZ/G2L Gb ethernet IP.

   Your previous try was back in 2021, still the cover letter has the same
issues (hm, I didn't point out those back then).

> The TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum
> for both IPV4 and IPV6.
> 
> For Rx, the result of checksum calculation is attached to last 4byte
> of ethernet frames.

   "For Rx, the 4-byte result of checksum calculation is attached to the
Ethernet frames", you wanted to say?

> First 2bytes is result of IPV4 header checksum
> and next 2 bytes is TCP/UDP/ICMP.

   TCP/UDP/ICMP checksum, you mean?

> If frame does not have error "0000" attached to checksum calculation

   "If a frame does not have error, 0x0000 is attached as a checksum
calculation result", you wanted to say?

> result. For unsupported frames "ffff" is attached to checksum calculation

   s/to/as/, again?

> result. Cases like IPV6, IPV4 header is always set to "FFFF".

   In case of an IPv6 packet, IPv4 checksum is always set to 0xFFFF",
you wanted to say?

> For Tx, the result of checksum calculation is set to the checksum field of
> each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
> frames, those fields are not changed. If a transmission frame is an UDP
> frame of IPv4 and its checksum value in the UDP header field is H’0000,

   I think you can call it just UDPv4...

> TOE does not calculate checksum for UDP part of this frame as it is
> optional function as per standards.
> 
> Add Tx/Rx checksum offload supported by TOE for IPV4 and TCP/UDP protocols.
> 
> Results of iperf3 in Mbps
> 
> RZ/V2L:
> TCP(Tx/Rx) results with checksum offload Enabled:	{921,932}
> TCP(Tx/Rx) results with checksum offload Disabled:	{867,612}
> 
> UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
> UDP(Tx/Rx) results with checksum offload Disabled:	{952,920}
> 
> RZ/G2L:
> TCP(Tx/Rx) results with checksum offload Enabled:	{920,936}
> TCP(Tx/Rx) results with checksum offload Disabled:	{871,626}
> 
> UDP(Tx/Rx) results with checksum offload Enabled:	{953,950}
> UDP(Tx/Rx) results with checksum offload Disabled:	{954,920}
> 
> RZ/G2LC:
> TCP(Tx/Rx) results with checksum offload Enabled:	{927,936}
> TCP(Tx/Rx) results with checksum offload Disabled:	{889,626}
> 
> UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
> UDP(Tx/Rx) results with checksum offload Disabled:	{949,944}

   Too many figures, I think... :-)
   How RZ/G2L SoC is different from RZ/G2LC?

> v1->v2:
>  * Updated covering letter and results
>  * Fixed the sparse warnings for patch#1 by replacing __sum16->__wsum.
> 
> Note:
>  This patches are tested with [1] without the CPU performance is not good

   Without CPU? I guess the performance would be 0. Seriously, this is
hardly parseable... :-)
 
>  [1] https://lore.kernel.org/all/20240117190545.596057-1-vincent.guittot@linaro.org/
> 
> Biju Das (2):
>   ravb: Add Rx checksum offload support
>   ravb: Add Tx checksum offload support

   These summaries sound like you're adding checksum offload support for
all supported SoCs while you only do that for those having GbEther...

[...]

MBR, Sergey

