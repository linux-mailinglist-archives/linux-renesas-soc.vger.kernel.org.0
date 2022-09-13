Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917765B6AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 11:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiIMJlq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 05:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiIMJlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 05:41:45 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A139E5AC55;
        Tue, 13 Sep 2022 02:41:44 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id ml1so8759465qvb.1;
        Tue, 13 Sep 2022 02:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bUqGzNam9P2JpJFCKoAI4XsxJG7TI3fcIwyUcf3LHTk=;
        b=bazyWg+v47U7cYGeXFXphd+5XmhsCQYE4T2P5Mgq03FZ8s3U2WbTyPQ0XiURi/SZEE
         DqBX8/Yo0wThzgjYP4hOaTsskX0zDxvc+7mBPVIID4sARY+qvhGfjWqk78+LpL7OiZ2r
         9R+sRGFdKvYYnkE0E9n2SYIXXQZq4LLFJR797NJBBJDRP9w5OofwnSYN/yiHzymLvPie
         bLZdKO6vrtYupMSspKznZyZ5u+8G0vbQQQ6m/W6WZDI1Maid5whXhLRDIPk1vUOzavde
         XPLCyzHelYdrCYMJugK0fBztRiQy7SmUe8fuaXUCAgrgO+9UJzHY+Avw0x53kGMyv5mP
         hWdg==
X-Gm-Message-State: ACgBeo0a7gjBXkQ0BXWzsss3SFL2EWL1S54d/QiNgbClYsoDu/KQSRLr
        Ux5IA3xaj8WRIxh7IoHFXLN0qJmaFe70HRx5
X-Google-Smtp-Source: AA6agR6KL2fMAHRH9NkpCrVBSowu8rqTFWQHk9KgTcdGrwWU64fByPnNJTQRUS/8nZ2yQIRhENbEvQ==
X-Received: by 2002:a0c:fe0f:0:b0:4a4:618:c6c2 with SMTP id x15-20020a0cfe0f000000b004a40618c6c2mr26681161qvr.75.1663062103384;
        Tue, 13 Sep 2022 02:41:43 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id w4-20020ac87e84000000b0035ba7012724sm8057812qtj.70.2022.09.13.02.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 02:41:43 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-348b1838c2bso133137237b3.3;
        Tue, 13 Sep 2022 02:41:42 -0700 (PDT)
X-Received: by 2002:a81:4983:0:b0:345:20ee:589d with SMTP id
 w125-20020a814983000000b0034520ee589dmr25569048ywa.383.1663062102291; Tue, 13
 Sep 2022 02:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com> <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Sep 2022 10:41:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
Message-ID: <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

CC Wolfram (SDHI)

On Tue, Sep 13, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
> > multiplier and divider values
> > On Tue, Sep 13, 2022 at 9:44 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > As per the HW manual (Rev.1.10 Apr, 2022) clock rate for 533MHz PLL2
> > > and
> > > PLL3 clocks should be 533 MHz, but with current multiplier and divider
> > > values this resulted to 533.333333 MHz.
> > >
> > > This patch updates the multiplier and divider values for 533 MHz PLL2
> > > and
> > > PLL3 clocks so that we get the exact (533 MHz) values.
> >
> > Does this matter? Is there anything that doesn't work (well) because of
> > this?
>
> Yes, SDHI performance gone bad as it selects 400Mhz clock instead of 533Mhz.
> Similar case for RZ/G2UL, which I am testing it now.
>
> Previously:-
> 533333333->src clk0
> 400000000->src clk1
> 266666666->src clk2
>
> Now:-
> 533000000->src clk0
> 400000000->src clk1
> 266500000->src clk2
>
> If I am correct, with wrong values, it ended
> up in 533333332(parent rate= 133333333 *4) and requested rate 533333333
> and it selected best rate as 400000000.

IC, that is annoying.

However, I don't think the right fix is to change the dividers to
values that do not match the hardware.
Due to the (in)accuracy of clock crystals, the least significant
digits in the above clock rates are not significant anyway.

Perhaps the "if (freq > (new_clock << i))" check in
renesas_sdhi_clk_update() can be slightly relaxed, so it allows
e.g. a 0.1% (or 1/1024th?) higher clock rate than requested?

> > > -               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
> > > +               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 533, 1600),
> >
> > I highly doubt the actual hardware is not using a by-3 divider....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
