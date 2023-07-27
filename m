Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F679764FE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 11:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjG0Jet convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 05:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjG0Jeb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 05:34:31 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFFD4C19
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 02:25:47 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-583a8596e2aso8021177b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 02:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449946; x=1691054746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM7dbmsUNQ9ephJiHm7mnMG3bHxM2q6uJO1Stbh0MgY=;
        b=TDEJyce1itnSonLp3vSfhDDwt7tnbFEb2pZVkd8IBH1bdK/0MtbgXL2WuqiUApCDXy
         aUM3GloOOyEHpVsmn9db9UYQO1RoY+d7CX/YiK1NhYn1qJ49CNQDa+uPlgZBjBsYPNOS
         wQrQ0Vpr5KYARG5bmgRSWZxFfrFxYdTWW1gDLYvSm/qAYoxp0z25IXW+IBr1l+sGTYqr
         nJwT/iH0JbeczuzfzUVranYT+ojfZMl2K9YReHtgkxNdky1Q7t2H8Fyuu+yupzwwUkpY
         g/xJ23xX5dGX/wjdvgJCDumC1DyWwZhyPMK2d+7jCCPh/BZoFk/Qief8Au9rMc25a55k
         pMfQ==
X-Gm-Message-State: ABy/qLahlPplOr84uq54TX4tW/Ak1aHOjrAL6yDC9n4OdStuafVcSXLX
        bA27tTWXmZrbA0rlPWTllxsNMvTP5/39Gg==
X-Google-Smtp-Source: APBJJlFg0bjNU/1P1KoQk70zmIIbA4WY73NTrNZ+AjoCLWlPHhJzn0oWU10gjkZgyn5Y5Ogvtg394w==
X-Received: by 2002:a0d:cb52:0:b0:577:2f3f:ddbb with SMTP id n79-20020a0dcb52000000b005772f3fddbbmr4577671ywd.47.1690449946628;
        Thu, 27 Jul 2023 02:25:46 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id m128-20020a0dfc86000000b005732b228a83sm289043ywf.140.2023.07.27.02.25.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:25:45 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-583a8596e2aso8020767b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 02:25:44 -0700 (PDT)
X-Received: by 2002:a25:db04:0:b0:d18:1fbf:c11d with SMTP id
 g4-20020a25db04000000b00d181fbfc11dmr3898899ybf.47.1690449944618; Thu, 27 Jul
 2023 02:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2307270709580.3082@hadrien>
 <OS0PR01MB59227764417EB66A9CBDE69F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <bf5c77ec-fc9f-419a-d0e8-15ad54df2fb@inria.fr> <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592291F0C8AE19F7118DCF0F8601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 11:25:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
Message-ID: <CAMuHMdXhS-u-n+ZThnNM6w81rc0LsOUyaJ5UxXwbC44e7NFw8w@mail.gmail.com>
Subject: Re: [linux-next:master 2742/4710] drivers/clk/clk-versaclock3.c:404:2-8:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead. (fwd)
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jul 27, 2023 at 11:19 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division, please
> > consider using div64_ul instead. (fwd)
> >
> > On Thu, 27 Jul 2023, Biju Das wrote:
> > > The reproduce link is not working for me.
> > >
> > > Can you please provide instruction to reproduce this issue?
> >
> > I don't think it's intended to be reproduced.  The issue is just that a
> > long value is being passed to an integer that is 32 bit.  If the long
> > value will never be very big, then you can just ignore the warning.
>
> The rate values are well below max 32 bit, 4294967296. So I guess, it is ok.

The type of the parent_rate in/output parameter of clk_ops.round_rate()
is unsigned long.  Hence you should use div64_ul().

> > > > versaclock3.c:404:2-8: WARNING: do_div() does a 64-by-32 division,
> > > > please consider using div64_ul instead. (fwd)
> > > >
> > > >
> > > >
> > > > ---------- Forwarded message ----------
> > > > Date: Thu, 27 Jul 2023 08:50:37 +0800
> > > > From: kernel test robot <lkp@intel.com>
> > > > To: oe-kbuild@lists.linux.dev
> > > > Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> > > > Subject: [linux-next:master 2742/4710] drivers/clk/clk-
> > > > versaclock3.c:404:2-8:
> > > >     WARNING: do_div() does a 64-by-32 division,
> > > >     please consider using div64_ul instead.
> > > >
> > > > BCC: lkp@intel.com
> > > > CC: oe-kbuild-all@lists.linux.dev
> > > > CC: Linux Memory Management List <linux-mm@kvack.org>
> > > > TO: Biju Das <biju.das.jz@bp.renesas.com>
> > > > CC: Stephen Boyd <sboyd@kernel.org>
> > > >
> > > > tree:
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > > version of the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > > | Closes:
> > > %2BsY49B78%3D&reserved=0
> > > >
> > > > cocci warnings: (new ones prefixed by >>)
> > > > >> drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> > > > >> 64-
> > > > by-32 division, please consider using div64_ul instead.
> > > >
> > > > vim +404 drivers/clk/clk-versaclock3.c
> > > >
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  382
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  383  static long
> > > > vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  384
> > unsigned
> > > > long *parent_rate)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  385  {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  386   struct vc3_hw_data *vc3 =
> > > > container_of(hw, struct vc3_hw_data, hw);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  387   const struct vc3_pll_data
> > *pll
> > > > = vc3->data;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  388   u64 div_frc;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  389
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  390   if (rate < pll->vco_min)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  391           rate = pll->vco_min;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  392   if (rate > pll->vco_max)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  393           rate = pll->vco_max;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  394
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  395   vc3->div_int = rate /
> > > > *parent_rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  396
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  397   if (pll->num == VC3_PLL2)
> > {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  398           if (vc3->div_int >
> > 0x7ff)
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  399                   rate =
> > *parent_rate
> > > > * 0x7ff;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  400
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  401           /* Determine best
> > > > fractional part, which is 16 bit wide */
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  402           div_frc = rate %
> > > > *parent_rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  403           div_frc *= BIT(16) -
> > 1;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05 @404           do_div(div_frc,
> > > > *parent_rate);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  405
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  406           vc3->div_frc =
> > > > (u32)div_frc;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  407           rate = (*parent_rate
> > *
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  408                   (vc3->div_int
> > *
> > > > VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  409   } else {
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  410           rate = *parent_rate
> > *
> > > > vc3->div_int;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  411   }
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  412
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  413   return rate;
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  414  }
> > > > 6e9aff555db7b6 Biju Das 2023-07-05  415
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > >



-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
