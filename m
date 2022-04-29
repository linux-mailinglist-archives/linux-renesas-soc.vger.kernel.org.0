Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5B0514614
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 11:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347684AbiD2J6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 05:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357118AbiD2J6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 05:58:48 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575002AE37;
        Fri, 29 Apr 2022 02:55:29 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id f186so5445900qke.8;
        Fri, 29 Apr 2022 02:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFTN23nUCCpI2Jnr4JgNtRkH/u7d9il0md/KJx4MB4Q=;
        b=qYzBpjBkufxrbfPdpmZ4PqLv9OzqQJOVB9NNa3N5Fv1GBdOWCCl19MD7UTDFZvPDHk
         ITrp6IvrjfvnRhM/4PeHmapoy75a5nfac+HDZicWOLT1fSHo+nZlx8RRCgzHZheyrVt8
         h9H0FYE2B/3NNUTbbtmYtDYiOjMTDdfsPKAeb00UopRH/kXPMYcv3pDrcF7PHt1uir3I
         AVXa/q277ykSyFw5QYfN6o14PvdSqRNVX7NaXnRKIdxDGPhfZkMDLWSHiQydaVeNkjd2
         /F7mYd4dRJS5PPGL/+YzY/77htpAO46Ltu0jJR37Wj/KW69EtYhr9zH296JMkIgeXC/V
         IHSg==
X-Gm-Message-State: AOAM533of4bRtBCECfv+raXTbFllSGtmO5Nb8XgdbjuZUvpnCim5jkYP
        3X2f2TfubOXAa3bw7p6OF2oOO1u/8xcwVFy9
X-Google-Smtp-Source: ABdhPJyyY9RGjF9Ds9CzKrRjWQ3CeiUecr3rPm2YlSjX6aJwLsumdl1/i1RBLsHLf5BO9AlmaoQc+Q==
X-Received: by 2002:a05:620a:28c4:b0:69f:8e2:3550 with SMTP id l4-20020a05620a28c400b0069f08e23550mr22516742qkp.511.1651226127937;
        Fri, 29 Apr 2022 02:55:27 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b11-20020a05622a020b00b002f38fe59f03sm1388812qtx.18.2022.04.29.02.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 02:55:27 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f7ca2ce255so79644527b3.7;
        Fri, 29 Apr 2022 02:55:27 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr24768155ywf.256.1651226127010; Fri, 29
 Apr 2022 02:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
 <20220427094823.3319-4-biju.das.jz@bp.renesas.com> <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
 <OS0PR01MB5922F0C5A80F26109A27BC5D86FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F0C5A80F26109A27BC5D86FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 11:55:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW88S+STBvsL45wT1ox0mO=_HUtSd8HqB5037R=XCcGTw@mail.gmail.com>
Message-ID: <CAMuHMdW88S+STBvsL45wT1ox0mO=_HUtSd8HqB5037R=XCcGTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
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

On Fri, Apr 29, 2022 at 11:50 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk
> > support

> > On Wed, Apr 27, 2022 at 11:48 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)
> > >
> > > This patch add support for DSI divider clk by combining DSIDIVA and
> > > DSIDIVB .
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > +
> > > +       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> > > +
> > > +       if (priv->mux_dsi_div_params.clksrc)
> > > +               parent_rate /= 2;
> > > +
> > > +       return parent_rate;
> > > +}
> > > +
> > > +static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> > > +                                           struct clk_rate_request
> > > +*req) {
> > > +       req->best_parent_rate = rzg2l_cpg_get_vclk_parent_rate(hw,
> > > +req->rate);
> > > +
> > > +       return 0;
> >
> > So any value of req->rate passed is supported, and req->rate never needs
> > to be updated?
>
> Yes, We can add a check for freq greater than 148.5MHz and if it is greater,
> Assign req->rate to 148.5MHz.
>
> >
> > > +}
> > > +
> > > +static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
> > > +                                     unsigned long rate,
> > > +                                     unsigned long parent_rate) {
> > > +       struct dsi_div_hw_data *dsi_div = to_dsi_div_hw_data(hw);
> > > +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> > > +
> > > +       /*
> > > +        * MUX -->DIV_DSI_{A,B} -->M3 -->VCLK
> > > +        *
> > > +        * Based on the dot clock, the DSI divider clock sets the
> > divider value,
> > > +        * calculates the pll parameters for generating FOUTPOSTDIV and
> > the clk
> > > +        * source for the MUX and propagates that info to the parents.
> > > +        */
> > > +
> > > +       if (!rate)
> > > +               return -EINVAL;
> > > +
> > > +       dsi_div->rate = rate;
> >
> > So any non-zero value of rate is supported?
>
> Currently yes, But If we add a check for > 148.5Mhz in determine_rate, it will allow only upto 148.5Mhz.

You still need that check here, too, as there is no guarantee users
will call .set_rate() with the rounded parameters obtained from
.determine_rate().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
