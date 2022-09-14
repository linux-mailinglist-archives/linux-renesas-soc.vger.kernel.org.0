Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61E85B8C21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 17:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiINPoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 11:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiINPog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 11:44:36 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F16B26E1;
        Wed, 14 Sep 2022 08:44:32 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id o13so12033773qvw.12;
        Wed, 14 Sep 2022 08:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OSboxixIkC9ztGDQJ2boTjZZ2NsCfcyWK4O2HInU8lk=;
        b=PC78C1PIIvouCQXY9bLtC26H2IBb1s9P38HAOUbDIt8CEtuzT0acdG7VnIic07S2hS
         oVxuTgcIazq3np48hC7e0gX49FGQV/CTLy1dJBiYf6OI/mpBOzgn5qmZ9s+RQXEK8CLD
         a1kbaWcOzLknl95tGxBQj4rMkhLXTu5OEdlu7+NOoFrmjj3bDLIV6rgjAzGUVOna3Hjt
         OW/6Mikh63YXQiJ/KTL/rkOo2lVkx49WTLBrjXr0lGZ7s/Oxytbnz89OD4+zKrUwF6R/
         dWfy7Dk+cxJKwPm2/Qn7KX8Ub61gFlBSRl6WtTk+x8g+L9yFkBLE02P6/ojI6IDBiKWp
         LPhQ==
X-Gm-Message-State: ACgBeo29fmylkapKxF29hYEPxpAbbQNqtm7b4aEBzzWJ6S1NAfT+YWzy
        1+Nr3IwpXGtQwx+rgxh4SuDtiC0yVekI0F5P
X-Google-Smtp-Source: AA6agR6xYo5+cp4mNFbwo5xGr0bUl6g/9hroc3Tpgd2+lUW0emF6aarM5UsTItD95AJM79/TScwwQA==
X-Received: by 2002:ad4:5bac:0:b0:4ac:929b:3363 with SMTP id 12-20020ad45bac000000b004ac929b3363mr21317036qvq.32.1663170270960;
        Wed, 14 Sep 2022 08:44:30 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id fv17-20020a05622a4a1100b003434d3b5938sm1754208qtb.2.2022.09.14.08.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 08:44:30 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3450990b0aeso185171857b3.12;
        Wed, 14 Sep 2022 08:44:30 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr30221255ywc.316.1663170269840; Wed, 14
 Sep 2022 08:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
 <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Sep 2022 16:44:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
Message-ID: <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs clock
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Wed, Sep 14, 2022 at 6:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: RE: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
> > clock
> > > Subject: Re: [PATCH] mmc: renesas_sdhi: Add margins for main clock and
> > > hs clock
> > > On Tue, Sep 13, 2022 at 5:15 PM Biju Das <biju.das.jz@bp.renesas.com>
> > > wrote:
> > > > The SDHI high speed clock is 4 times that of the main clock.
> > > > Currently, there is no margin added for setting the rate associated
> > > > with these clocks. On RZ/G2L platforms, the lack of these margins
> > > > leads to the selection of a clock source with a lower clock rate
> > > > compared to a higher one.
> > > >
> > > > RZ/G2L example case:
> > > > SD0 hs clock is 533333333 Hz and SD0 main clock is 133333333 Hz.
> > > > When we set the rate for the main clock 133333333, the request rate
> > > > for the parent becomes 533333332 (133333333 * 4) and the SD0 hs
> > > > clock is set as 400000000 Hz.
> > > >
> > > > This patch adds a margin of (1/1024) higher hs clock and main clock
> > > rate.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > > @@ -147,6 +147,7 @@ static unsigned int
> > > > renesas_sdhi_clk_update(struct
> > > tmio_mmc_host *host,
> > > >         }
> > > >
> > > >         new_clock = wanted_clock << clkh_shift;
> > > > +       new_clock += new_clock >> 10;
> > >
> > > This changes the requested clock rate. Is that really a good idea?
> > >
> > > Isn't it sufficient to change the test "if (freq > (new_clock << i))"
> > > slightly?
> >
> > We hardly enter this test, after it request for proper wanted_clk.
> >
> > freq is clk_round_rate(ref_clk, new_clock << i);  and it compares 400MHz
> > vs 533.332 MHz.
> >
> > Basically wanted_clock= 133.33333 MHz and is scaled to power of 2 and
> > then each iteration it scale down to power of 2 compare with round rate
> > value.
> >
> > [    4.020781] ####rzg2l_cpg_sd_clk_mux_determine_rate####### req-
> > >rate=4266666656
> > [    4.028013] ####rzg2l_cpg_sd_clk_mux_determine_rate####### req-
> > >rate=2133333328
> > [    4.035330] ####rzg2l_cpg_sd_clk_mux_determine_rate####### req-
> > >rate=1066666664
> > [    4.042639] ####rzg2l_cpg_sd_clk_mux_determine_rate####### req-
> > >rate=533333332
> >
> > >
> > > >
> > > >         /*
> > > >          * We want the bus clock to be as close as possible to, but
> > > > no @@ -172,6 +173,7 @@ static unsigned int
> > > > renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> > > >
> > > >         clk_set_rate(ref_clk, best_freq);
> > > >
> > > > +       best_freq += best_freq >> 10;
> > >
> > > Can you please elaborate why this is needed?
> > > It looks counter-intuitive to me.
> >
> > When we try to set 133.333 MHz clk, the determine rate calculates req-
> > >rate for sd clk as 533.332 and since available clock source for sd0 clks
> > are 266.6666, 400 and
> > 533.333 MHz, so it select the clock source as 400MHz.
>
> Just to add here the main issue is coming from math calculation.
>
> Consider any value A
>
> B = A / 4
> C = B * 4
>
> Ideally, we expect A = C, But in the below example
> It is not the case (it is A != C).
>
> A = 533333333 (1600/3 MHz)
> B = 533333333/4 = 133333333
> C = 133333333 * 4 = 533333332
>
> Since A != C we are ending up in this situation.

I am fully aware of that ;-)

However, clk_round_rate() is supposed to return the closest
matching rate.  Hence when passed 533333332, it should return 533333333.
AFAIU, this is then rejected by "if (freq > (new_clock << i))", due to
being slightly too large, causing 400000000 to be picked instead.

Am I missing something?
I'm currently not in the position to test/verify what is actually happening.

I do see clk_mux_determine_rate_flags() has a comment:

        /* find the parent that can provide the fastest rate <= rate */

So perhaps the issue is that it does not return the closest rate, but a
slower rate?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
