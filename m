Return-Path: <linux-renesas-soc+bounces-198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194597F6717
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 20:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFB2A281BA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 19:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D594120D;
	Thu, 23 Nov 2023 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337D2BA;
	Thu, 23 Nov 2023 11:26:50 -0800 (PST)
Received: from [192.168.1.103] (178.176.78.136) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 23 Nov
 2023 22:26:42 +0300
Subject: Re: [PATCH 08/13] net: ravb: Rely on PM domain to enable refclk
To: claudiu beznea <claudiu.beznea@tuxon.dev>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <p.zabel@pengutronix.de>,
	<yoshihiro.shimoda.uh@renesas.com>, <wsa+renesas@sang-engineering.com>,
	<biju.das.jz@bp.renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<sergei.shtylyov@cogentembedded.com>, <mitsuhiro.kimura.kc@renesas.com>,
	<masaru.nagai.vx@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV=2_h2PW9K7zT3Hwqjdk6D2m_Dd09bqHtifAvVTM7Lrw@mail.gmail.com>
 <a9760bbb-d06d-4914-b0d1-48a224f74858@tuxon.dev>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <6d08cf58-f487-052a-e908-8d1a7579053e@omp.ru>
Date: Thu, 23 Nov 2023 22:26:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a9760bbb-d06d-4914-b0d1-48a224f74858@tuxon.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/21/2023 23:48:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181514 [Nov 21 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 3 0.3.3 e5c6a18a9a9bff0226d530c5b790210c0bd117c8
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.136 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.136
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/21/2023 23:54:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/21/2023 8:06:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/23/23 8:10 PM, claudiu beznea wrote:
[...]

>> On Thu, Nov 23, 2023 at 5:35 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
[...]
>>> w/o the need to add clock enable/disable specific calls in runtime PM
>>> ops of ravb driver and interfere with other IP specific implementations,
>>> add a new variable to struct_hw_info and enable the reference clock
>>> based on the value of this variable (the variable states if reference
>>> clock is part of the Ethernet's power domain).
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

[...]
>>>  static const struct of_device_id ravb_match_table[] = {
>>> @@ -2749,12 +2750,14 @@ static int ravb_probe(struct platform_device *pdev)
>>>                 goto out_release;
>>>         }
>>>
>>> -       priv->refclk = devm_clk_get_optional(&pdev->dev, "refclk");
>>> -       if (IS_ERR(priv->refclk)) {
>>> -               error = PTR_ERR(priv->refclk);
>>> -               goto out_release;
>>> +       if (!info->refclk_in_pd) {
>>> +               priv->refclk = devm_clk_get_optional(&pdev->dev, "refclk");
>>> +               if (IS_ERR(priv->refclk)) {
>>> +                       error = PTR_ERR(priv->refclk);
>>> +                       goto out_release;
>>> +               }
>>> +               clk_prepare_enable(priv->refclk);
>>>         }
>>> -       clk_prepare_enable(priv->refclk);
>>
>> Is this patch really needed? It doesn't hurt to manually enable a
>> clock that is also under Runtime PM control.  Clock prepare/enable
>> refcounting will take care of that.
> 
> I agree with that. I chose this path to not interfere w/ the comments
> ravb_runtime_nop() which I didn't understand. Also I fail to understand why
> the ravb_runtime_nop() is there...

   Looks like it was blindly copied from the sh_eth driver and doesn't (yet?)
apply to ravb...

[...]

MBR, Sergey

