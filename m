Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4D050BB59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 17:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449193AbiDVPN3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 11:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449286AbiDVPNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 11:13:19 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC345C371;
        Fri, 22 Apr 2022 08:10:26 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id j6so5983082qkp.9;
        Fri, 22 Apr 2022 08:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUbWiCFAOjrj391k9XEhMaJ647zWOrTQk080omU6HvE=;
        b=ZCnBvtoKxYSbTlw2sO2lWvi/dQeleCfh0rTpflbjX0XEwkCczRbJ5y2QJfKbNnyRry
         b9XL8/U3EOmYLaSmMN74M4dKXnQOABbSzvX9Rz/ZBXdp1annasY7Rym4JZp32cOCubXN
         9RrVX+srX5zso87iZgjF1QXSsJ5qXR7tYEhuRyPflah6qKYQFF7MuEFrUXfL9D9TjQIY
         Y9b8+jrpm3kDTZ7X5gfz/mdTy5aBZdvNq2XI+MbpYLjKX8gsQ0fHut1And/vTPW4xPFM
         lBasyNj/gilZsKHJkCkU77zkU7nCh6+83IWNBHfP28N/WflOOJMsyM0k0/K2BzoIwRmu
         TNmw==
X-Gm-Message-State: AOAM533FEMCoOolVG2uXkNT21ztpkHeotEBGkGaRfYQrGY7eMGy/649I
        LhNjqqYDqfXiZr7NtKFFgJK2NGjDFAsANw==
X-Google-Smtp-Source: ABdhPJzxV256wnoQvx4M/K32FgDLHCbr/e7+ChkpLioq1OPy6UUfsqi/+oskkYdj6bwMxEAWmo0FWg==
X-Received: by 2002:a05:620a:1341:b0:69e:cd37:763c with SMTP id c1-20020a05620a134100b0069ecd37763cmr2933095qkl.284.1650640224935;
        Fri, 22 Apr 2022 08:10:24 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85916000000b002f3402e34a3sm1444452qty.55.2022.04.22.08.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:10:24 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2eba37104a2so88931587b3.0;
        Fri, 22 Apr 2022 08:10:24 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr1523744ywh.62.1650640224270; Fri, 22
 Apr 2022 08:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
 <20220318175113.8956-4-biju.das.jz@bp.renesas.com> <CAMuHMdV9Rt6_VQ4oU-FAAM=vdrG22Qc2yBHTrEd-NrAu3FejWw@mail.gmail.com>
 <OS0PR01MB59220A6CE01D617EB4F1A29D86F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220A6CE01D617EB4F1A29D86F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 17:10:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaYHBDm5TmOskMgQGg2bPVgx4RmQVEJ3d5nXjS3s8wvw@mail.gmail.com>
Message-ID: <CAMuHMdXaYHBDm5TmOskMgQGg2bPVgx4RmQVEJ3d5nXjS3s8wvw@mail.gmail.com>
Subject: Re: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Apr 22, 2022 at 1:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 3/9] clk: renesas: rzg2l: Add DSI divider clk support
> > On Fri, Mar 18, 2022 at 6:51 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)
> > >
> > > This patch add support for DSI divider clk by combaining DSIDIVA and
> > > DSIDIVB .
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > +static long rzg2l_cpg_dsi_div_round_rate(struct clk_hw *hw,
> > > +                                        unsigned long rate,
> > > +                                        unsigned long *parent_rate)
> > > +{
> > > +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> > > +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> > > +
> > > +       dsi_div->rate = rate;
> > > +
> > > +       priv->pll5_params.pl5_intin = rate / MEGA;
> >
> > .round_rate() (and .determine_rate()) is used to check if a rate is
> > supported, without actually changing the clock rate.  Hence this should not
> > operate on priv->pll5_params, but on a local variable.
> >
> > > +       priv->pll5_params.pl5_fracin = ((rate % MEGA) << 24) / MEGA;
> > > +       priv->pll5_params.pl5_refdiv = 2;
> > > +       priv->pll5_params.pl5_postdiv1 = 1;
> > > +       priv->pll5_params.pl5_postdiv2 = 1;
> > > +       priv->pll5_params.clksrc = 1;
> > > +       priv->pll5_params.dsi_div_a = 1;
> > > +       priv->pll5_params.dsi_div_b = 2;
> > > +
> > > +       priv->pll5_params.frequency =
> > > +               EXTAL_FREQ_IN_MEGA_HZ * MEGA / priv-
> > >pll5_params.pl5_refdiv *
> > > +               ((((priv->pll5_params.pl5_intin << 24) + priv-
> > >pll5_params.pl5_fracin)) >> 24) /
> > > +               (priv->pll5_params.pl5_postdiv1 *
> > > + priv->pll5_params.pl5_postdiv2);
> > > +
> > > +       if (priv->pll5_params.clksrc)
> > > +               priv->pll5_params.frequency /= 2;
> > > +
> > > +       *parent_rate = priv->pll5_params.frequency;
> > > +
> > > +       return dsi_div->rate;
> > > +}
> > > +
> > > +static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
> > > +                                     unsigned long rate,
> > > +                                     unsigned long parent_rate) {
> > > +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> > > +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> > > +
> >
> > You should update priv->pll5_params here, instead of in your
> > .round_rate() callback.
>
> I need to find parent_rate based on video clock during {determine,round rate}

There is no guarantee that .set_rate() is called right after
.determine_rate() with the exact same parameters, or that it is called
at all. Modifying priv->pll5_params prematurely may affect the other
clocks in hard to debug ways.  So please modify priv->pll5_params
only when actually setting the clock rate.

> I have added there to avoid duplication.

You can use a helper that takes a pointer to a struct rzg2l_pll5_param,
calculates the values, and fills them in.
.{determine,round rate}() would call it with a pointer to a local variable.
.set_rate() would call it with a pointer to &priv->pll5_params.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
