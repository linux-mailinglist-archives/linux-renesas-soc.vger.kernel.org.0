Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701225B78B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 19:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiIMRqW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 13:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbiIMRqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 13:46:00 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4D46DAED;
        Tue, 13 Sep 2022 09:42:01 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id cb8so9110686qtb.0;
        Tue, 13 Sep 2022 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nUbyO9E+1Q6feXAO0oMDhnIFniyfOKjq2mcZJKwUb+k=;
        b=Qi6MMSo0mwKInls0EPO4Zv0cXqkCG33emESjMo/MQTwOmQPiop09YNd9oYNmesvwNP
         eAg+gvtmbBcW66vky5YshbIGEg71rYbM0o0FPWI8puNb+QVD9gYy7IwCmzANBzVlgLii
         ODnwBAG+gea+u+/wsk1P+SL26FwMSFLai5xqMKAYqLQsBVnapucwjxbvaroGUjDRf8Pj
         nhkPqp50UKpfRxAKY3IHMESjENlUXbUZWGyGcwB/jLioFrDQLZHRD7eIhdLriqkM3YAd
         Woz+wd/rUgmFqvBp6qsaxAcCsfRVJMK2g8KFvyXvcg0Qqq96jaP3201HvS10Gj9VAhjQ
         az5g==
X-Gm-Message-State: ACgBeo2SyHqwBkWRVuKRXHmz5U92pmNuA+aLlSZb/a6L8E9ETiPL041v
        RK+fLBWkYoNlMh96FYPsJOnkJkgzN/CPBswb
X-Google-Smtp-Source: AA6agR4LbedjCB4ZnRcFEf8JjHYxFYQo19RUEn7yAhrC3d7e9tI6siarYa5EBDI0W4fOfIo0JYAcoA==
X-Received: by 2002:a05:622a:3cf:b0:35b:b16d:88e7 with SMTP id k15-20020a05622a03cf00b0035bb16d88e7mr10722638qtx.405.1663087320019;
        Tue, 13 Sep 2022 09:42:00 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id bp14-20020a05620a458e00b006ce51b541dfsm3713453qkb.36.2022.09.13.09.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 09:41:58 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3450990b0aeso147162197b3.12;
        Tue, 13 Sep 2022 09:41:58 -0700 (PDT)
X-Received: by 2002:a81:1691:0:b0:345:17df:4fc6 with SMTP id
 139-20020a811691000000b0034517df4fc6mr26381933yww.502.1663087318249; Tue, 13
 Sep 2022 09:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com> <OS0PR01MB592232E7F1F06F53463FBCC986479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592232E7F1F06F53463FBCC986479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Sep 2022 17:41:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5c=S9m+4w7vvkEPsFjuBZKsunRYK3pivxEDvr_1JJYA@mail.gmail.com>
Message-ID: <CAMuHMdU5c=S9m+4w7vvkEPsFjuBZKsunRYK3pivxEDvr_1JJYA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 13, 2022 at 10:58 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
> > multiplier and divider values
> >
> > On Tue, Sep 13, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3
> > > > clock multiplier and divider values On Tue, Sep 13, 2022 at 9:44 AM
> > > > Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > As per the HW manual (Rev.1.10 Apr, 2022) clock rate for 533MHz
> > > > > PLL2 and
> > > > > PLL3 clocks should be 533 MHz, but with current multiplier and
> > > > > divider values this resulted to 533.333333 MHz.
> > > > >
> > > > > This patch updates the multiplier and divider values for 533 MHz
> > > > > PLL2 and
> > > > > PLL3 clocks so that we get the exact (533 MHz) values.
> > > >
> > > > Does this matter? Is there anything that doesn't work (well) because
> > > > of this?
> > >
> > > Yes, SDHI performance gone bad as it selects 400Mhz clock instead of
> > 533Mhz.
> > > Similar case for RZ/G2UL, which I am testing it now.
> > >
> > > Previously:-
> > > 533333333->src clk0
> > > 400000000->src clk1
> > > 266666666->src clk2
> > >
> > > Now:-
> > > 533000000->src clk0
> > > 400000000->src clk1
> > > 266500000->src clk2
> > >
> > > If I am correct, with wrong values, it ended up in 533333332(parent
> > > rate= 133333333 *4) and requested rate 533333333 and it selected best
> > > rate as 400000000.
> >
> > IC, that is annoying.
> >
> > However, I don't think the right fix is to change the dividers to values
> > that do not match the hardware.
>
> The new values(for SDHI, SPI mult and M4) are matching with clock list
> Document RZG2L_clock_list_r1.1.xlsx and HW manual(page 235/236)
> Figure 7.2/7.3 Clock System Diagram.

All values are given in MHz, with a limited number of significant
digits, not in Hz. The most accurate value I found is 66.625 MHz,
which has 5 significant digits, and thus really means 66625xxx Hz.
Such an accuracy matches the accuracy of typical clock crystals.

The figures only mention "1600 MHz" and "533 MHz".  The latter
has only 3 significant digits, and is probably just 1600 MHz / 3.
All further dividers are documented to be powers of two.

> Yes, we need to have some relaxation for clocks as mentioned
> below.

Indeed. But this is IMHO something that should be handled by the
code that looks for the best clock rate, instead of by fiddling with the
dividers to get "nicely rounded" numbers.

> > Due to the (in)accuracy of clock crystals, the least significant digits
> > in the above clock rates are not significant anyway.
> >
> > Perhaps the "if (freq > (new_clock << i))" check in
> > renesas_sdhi_clk_update() can be slightly relaxed, so it allows e.g. a
> > 0.1% (or 1/1024th?) higher clock rate than requested?
> >
> > > > > -               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1,
> > 3),
> > > > > +               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2,
> > > > > + 533, 1600),
> > > >
> > > > I highly doubt the actual hardware is not using a by-3 divider....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
