Return-Path: <linux-renesas-soc+bounces-297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9A7FA97F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 20:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A4C281705
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 19:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3673C46E;
	Mon, 27 Nov 2023 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B35D4D;
	Mon, 27 Nov 2023 11:01:25 -0800 (PST)
Received: from [192.168.1.103] (31.173.82.188) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 27 Nov
 2023 22:01:17 +0300
Subject: Re: [PATCH 13/13] net: ravb: Add runtime PM support
To: Geert Uytterhoeven <geert@linux-m68k.org>, claudiu beznea
	<claudiu.beznea@tuxon.dev>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <p.zabel@pengutronix.de>,
	<yoshihiro.shimoda.uh@renesas.com>, <wsa+renesas@sang-engineering.com>,
	<biju.das.jz@bp.renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<sergei.shtylyov@cogentembedded.com>, <mitsuhiro.kimura.kc@renesas.com>,
	<masaru.nagai.vx@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-14-claudiu.beznea.uj@bp.renesas.com>
 <04cb07fe-cccc-774a-f14d-763ce7ae7b07@omp.ru>
 <b3456a4d-336c-434d-9fd5-4c87582443cb@tuxon.dev>
 <9af21eb9-6fe1-de3a-f2eb-4493778ebb32@omp.ru>
 <e35882ea-c325-4039-bb84-c18b0244dbe0@tuxon.dev>
 <CAMuHMdVCRXYKtcwaC=v-HhJW-PLV-zhj_3GmeU6Vu1JOK_eu0Q@mail.gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <ec9b6604-839f-d31f-59c6-72367804d06a@omp.ru>
Date: Mon, 27 Nov 2023 22:01:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVCRXYKtcwaC=v-HhJW-PLV-zhj_3GmeU6Vu1JOK_eu0Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/27/2023 18:45:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181629 [Nov 27 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_all_Bitcoin, text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.188 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.188
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/27/2023 18:53:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/27/2023 4:12:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/27/23 5:05 PM, Geert Uytterhoeven wrote:

[...]
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>>> RZ/G3S supports enabling/disabling clocks for its modules (including
>>>>>> Ethernet module). For this commit adds runtime PM support which
>>>>>> relies on PM domain to enable/disable Ethernet clocks.
>>>>>
>>>>>    That's not exactly something new in RZ/G3S. The ravb driver has unconditional
>>>>> RPM calls already in the probe() and remove() methods...
>>>>> And the sh_eth driver
>>>>> has RPM support since 2009...
>>>>>
>>>>>> At the end of probe ravb_pm_runtime_put() is called which will turn
>>>>>
>>>>>    I'd suggest a shorter name, like ravb_rpm_put() but (looking at this function)
>>>>>> off the Ethernet clocks (if no other request arrives at the driver).
>>>>>> After that if the interface is brought up (though ravb_open()) then
>>>>>> the clocks remain enabled until interface is brought down (operation
>>>>>> done though ravb_close()).
>>>>>>
>>>>>> If any request arrives to the driver while the interface is down the
>>>>>> clocks are enabled to serve the request and then disabled.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

[...]

> Sergey: does sh_eth.c really reinitialize the hardware completely after
> pm_runtime_get_sync()?

   Well, even with the original Magnus' commit that added the RPM support (bcd5149ded6b2edbf3732fa1483600a716b1cba6) it wasn't so -- sh_eth_open()
indeed seemed to re-init everything (but not TSU!) but sh_eth_get_stats()
surely didn't (the RPM calls there have been removed since); other RPM
"wrappers" have been added to the driver methods since -- which also
don't init anything... thus the comment in sh_eth_runtime_nop(() seems
to be wrong from the very start...

[...]

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey

