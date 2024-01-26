Return-Path: <linux-renesas-soc+bounces-1895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF283E21C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 20:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6051C2197E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 19:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DD221A04;
	Fri, 26 Jan 2024 19:01:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BEB1DFE4;
	Fri, 26 Jan 2024 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706295677; cv=none; b=gXa41fx8j5DO3O7lEx+kVKZ0foS9aDhzJ94+xb6Xmo9xNzeuNYPSoyFITpZ3sAxqNODXaLunuLvQjLGqaUDQMHiVaY788cWo29IeJRwemtiF81EAjS1iK3hCWdBJzyAMA9FJEAWW/xssbnOz5UO20p3azRap5S9T/RHDtkrWKa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706295677; c=relaxed/simple;
	bh=7sHiXLSoiOdpliCAb4S82gxPhIsDMSU9EmiTu3PRmiw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F6+Lr3DgwOLu0oSdMV1zr3yzueVbnrhl3v4vKn1QtwELyKGkK/lSHsww6Lb2qE9Yqu781HHsd5plSiger9h2FKpcaZRVtEUOmt6sZrgGoLCg2n/X9wedsE/tw6Fp7XtKQ34WEpkjkDzos0xo4M5ROj9oBQdWNllWd5H8rKh6REU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.87.141) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 26 Jan
 2024 22:01:02 +0300
Subject: Re: [PATCH net-next v2 0/2] Add HW checksum offload support for
 RZ/G2L GbEthernet IP
To: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>, "peterz@infradead.org"
	<peterz@infradead.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <5245e582-5eea-ccdf-2ba3-fda58e261172@omp.ru>
 <TYCPR01MB11269BFD4A300AA71BA02DA85867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <37289018-785a-7584-f636-baa7729215af@omp.ru>
Date: Fri, 26 Jan 2024 22:01:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB11269BFD4A300AA71BA02DA85867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/26/2024 18:49:44
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182973 [Jan 26 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.141 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.141 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.141
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/26/2024 18:54:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/26/2024 4:55:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/26/24 1:08 AM, Biju Das wrote:
[...]

>> -----Original Message-----
>> From: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Sent: Thursday, January 25, 2024 7:11 PM
>> Subject: Re: [PATCH net-next v2 0/2] Add HW checksum offload support for
>> RZ/G2L GbEthernet IP
>>
>> Hello!
>>
>> On 1/24/24 1:21 PM, Biju Das wrote:
>>
>>> This patch series aims to add HW checksum offload supported by TOE
>>> module found on the RZ/G2L Gb ethernet IP.
>>
>>    Your previous try was back in 2021, still the cover letter has the same
>> issues (hm, I didn't point out those back then).
> 
> Thanks for correcting my bad English.

   I don't think you were the author of the e.g. RZ/G2L User's Manual that
has the same wording... Or were you? :-)

[...]

>>> TOE does not calculate checksum for UDP part of this frame as it is
>>> optional function as per standards.
>>>
>>> Add Tx/Rx checksum offload supported by TOE for IPV4 and TCP/UDP
>> protocols.
>>>
>>> Results of iperf3 in Mbps
>>>
>>> RZ/V2L:
>>> TCP(Tx/Rx) results with checksum offload Enabled:	{921,932}
>>> TCP(Tx/Rx) results with checksum offload Disabled:	{867,612}
>>>
>>> UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
>>> UDP(Tx/Rx) results with checksum offload Disabled:	{952,920}
>>>
>>> RZ/G2L:
>>> TCP(Tx/Rx) results with checksum offload Enabled:	{920,936}
>>> TCP(Tx/Rx) results with checksum offload Disabled:	{871,626}
>>>
>>> UDP(Tx/Rx) results with checksum offload Enabled:	{953,950}
>>> UDP(Tx/Rx) results with checksum offload Disabled:	{954,920}
>>>
>>> RZ/G2LC:
>>> TCP(Tx/Rx) results with checksum offload Enabled:	{927,936}
>>> TCP(Tx/Rx) results with checksum offload Disabled:	{889,626}
>>>
>>> UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
>>> UDP(Tx/Rx) results with checksum offload Disabled:	{949,944}
>>
>>    Too many figures, I think... :-)
>>    How RZ/G2L SoC is different from RZ/G2LC?

   At least they are described by a single manual...

> Just want to share with the wider community how the HW checksum is
> improving the performance of various SoCs in the RZ/G2L family.
> 
> and the results show improved performance on all 3 SoCs.

   I guess RZ/V2L and RZ/G2L would've been enough... but I'm probably
quibbling... :-)

>>> v1->v2:
>>>  * Updated covering letter and results
>>>  * Fixed the sparse warnings for patch#1 by replacing __sum16->__wsum.
>>>
>>> Note:
>>>  This patches are tested with [1] without the CPU performance is not
>>> good
>>
>>    Without CPU? I guess the performance would be 0. Seriously, this is
>> hardly parseable... :-)
> 
> without the patch [1] CPU performance is not good which impacts the
> network throughput.
> 
> [1] https://lore.kernel.org/all/20240117190545.596057-1-vincent.guittot@linaro.org/

   Thanks, that's much better. :-)

> Cheers,
> Biju

MBR, Sergey

