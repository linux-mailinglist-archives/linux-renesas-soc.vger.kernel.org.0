Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5814AC1D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441909AbiBGOq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345973AbiBGOkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:40:23 -0500
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9ECC0401C1;
        Mon,  7 Feb 2022 06:40:22 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id m131so7913069vkm.7;
        Mon, 07 Feb 2022 06:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jo47vG6ydmJ/GIN4IdD70/epyPcTnuVU6TGxbCKCEvw=;
        b=UWGGZ6ZwC3LcHC0KJs2nM83hQoFdyNoBznq4EyhU5GtpObzJia6JoNbeFMu7iGOajq
         r8A9IEiEfuUjyIztTQo5Y6VpFUp9BMQ3LwFLapCPMVPAX2ckH8jOiA1WZUPJt+L8xYmL
         BK1yX+0hGGvqeYEdfMqtdcJbS1T74j9k8NDmZvAX1I6Z6TeykwEUQdbOOB0cQV3al/Cu
         9G37U5IimmyyhJ+ta5g7IxB6uWW2J/FbvTwuoWp3Hv7CTn6/WkgK54p/Iny0FI9esjZn
         29Valppr5NkUP9a7w1s4G+BH5oup9T2gXX8b/FnD3xm8/1a1CjY/Kn7TbhvWkUtDUfhH
         jJnQ==
X-Gm-Message-State: AOAM532OlLYmaCovMhciDvJe1c4kq5vTDPqq3OPDPBNll8JNkyjkC06s
        lYB7Sw5BvytEscCh7d7R5YmPHSfoZfvLjw==
X-Google-Smtp-Source: ABdhPJzszmBwl4BlbKd74VJgN6LHZHhOYg2UaAKEeXlt1KCXQR5iCLFAqWwouqxAuUDCibJAfBImKw==
X-Received: by 2002:a05:6122:202a:: with SMTP id l42mr5331827vkd.40.1644244821631;
        Mon, 07 Feb 2022 06:40:21 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id o16sm2180058vss.9.2022.02.07.06.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:40:21 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id v5so12132842uam.3;
        Mon, 07 Feb 2022 06:40:20 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr4193212vsa.77.1644244820669;
 Mon, 07 Feb 2022 06:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com> <OS0PR01MB59229CBA63FBDFBC8758A762862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59229CBA63FBDFBC8758A762862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:40:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVH9LMhVxfBZtTK7eMBFS8w4VLm28dqM02uYw+YxD=DLg@mail.gmail.com>
Message-ID: <CAMuHMdVH9LMhVxfBZtTK7eMBFS8w4VLm28dqM02uYw+YxD=DLg@mail.gmail.com>
Subject: Re: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Feb 7, 2022 at 3:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L
> > SoC
> > On Sat, Feb 5, 2022 at 9:40 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The
> > > only difference being RZ/V2L has an additional registers to control
> > > clock and reset for the DRP-AI block.
> > >
> > > This patch reuses r9a07g044-cpg.c, as the common clock IDS and rest
> > > IDS are same between RZ/G2L and RZ/V2L and adding a separate
> > > r9a07g054_cpg_info to take care of DRP-AI clocks/resets.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > > +++ b/drivers/clk/renesas/r9a07g044-cpg.c

> > > @@ -80,252 +81,285 @@ static const char * const sel_pll6_2[]    = {
> > ".pll6_250", ".pll5_250" };
> > >  static const char * const sel_shdi[] = { ".clk_533", ".clk_400",
> > > ".clk_266" };  static const char * const sel_gpu2[] = { ".pll6",
> > > ".pll3_div2_2" };
> > >
> > > -static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
> > > -       /* External Clock Inputs */
> > > -       DEF_INPUT("extal", CLK_EXTAL),
> > > +static struct {
> > > +       const struct cpg_core_clk common[44]; #ifdef
> > > +CONFIG_CLK_R9A07G054
> > > +       const struct cpg_core_clk drp[0]; #endif } const core_clks
> > > +__initconst = {
> >
> > Having a single "const" between "static" and "struct" is sufficient.
>
> I got a check patch error "ERROR: Use of const init definition must use __initconst"
> Which is fixed by "const core_clks __initconst". Looks like checkpatch needs this in one line.

Checkpatch is not a full C source parser, and is confused by the #ifdef/#endif
block, and by the combination of struct definition and declaration.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
