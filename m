Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772E94561B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 18:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234168AbhKRRrJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 12:47:09 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:40670 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbhKRRrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:47:09 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru B3E27205EC18
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 3/4] clk: renesas: cpg-mssr: Check return value of
 pm_genpd_init()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117115101.28281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUi_Aj6JQ5n31R3DROUMG8F+032+L43AMmkiBwB_TQhWw@mail.gmail.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a427dace-171d-3cf7-ece6-ea7b15d586d0@omp.ru>
Date:   Thu, 18 Nov 2021 20:44:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUi_Aj6JQ5n31R3DROUMG8F+032+L43AMmkiBwB_TQhWw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/18/21 6:29 PM, Geert Uytterhoeven wrote:

[...]
>> Make sure we check the return value of pm_genpd_init() which might fail.
>> Also add a devres action to remove the power-domain in-case the probe
>> callback fails further down in the code flow.
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk-for-v5.17.
> 
>> @@ -574,7 +580,13 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>>                        GENPD_FLAG_ACTIVE_WAKEUP;
>>         genpd->attach_dev = cpg_mssr_attach_dev;
>>         genpd->detach_dev = cpg_mssr_detach_dev;
>> -       pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
>> +       ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
>> +       if (ret)
>> +               return ret;
>> +       ret = devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, genpd);
> 
> Will insert a blank line here.

   You mean after *return*? Else I don't think we need an empty line. :-)

> 
>> +       if (ret)
>> +               return ret;
>> +
>>         cpg_mssr_clk_domain = pd;
>>
>>         of_genpd_add_provider_simple(np, genpd);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergey
