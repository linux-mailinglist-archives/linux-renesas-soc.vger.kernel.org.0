Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA833B464F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 17:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhFYPHm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 11:07:42 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:47060 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbhFYPHm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 11:07:42 -0400
Received: by mail-vk1-f176.google.com with SMTP id j22so944479vka.13;
        Fri, 25 Jun 2021 08:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKlWOJ0zB8RNeSLkwmfHvYaSmU+aHeMgw93KtxX6eiA=;
        b=U9hzRE/i+23GDvZUHwkHDH0lteWtda/7l/jFXR1ktm8Aqeg3dfQwslbKLnBMiyImEM
         Xd3I5G1f7cvaGPdtSZjfKlK7o9JdZwxwzD1XwxJ7PZoJuq/rGZ8s8dxhueS0SyyRG0BE
         Bx6qSRo/Zm6+jKQDrY+LSg0Ou3QDeUZXHeTGkMe7CfJhJyyX0obm16Vo3a1ouzB4uHUK
         uqaqoBSWVM9H8Zh2js4hZm7Zy2YWIA0+DDg5J8jcqb6zVQnBvs7TT52uNyTuAZs0N3i7
         qSYyvwx8SA5y4VrwnVy0OQTn6MiKXH3ZsnVSw7kR1JrmHZIbWCuzxiNxljBUlrxC9SZ8
         UACQ==
X-Gm-Message-State: AOAM530QaInYE1+a3umvr7U3w4cVI8odiuDItLZQ8ZVb3Yr6o3tXC9Hb
        nidAW3kmycPaok/nXpxBEts9SI76Z2Hs6vNlSYmyxu2AhazlIQ==
X-Google-Smtp-Source: ABdhPJzjmYsWYMlMTBq2LZup2LsAg/cpgdHWU8YOoI8TMnRQKZUXWLYG1ZvZEUJ79rgmOuv1UGJdnQxlEKWFzeokilc=
X-Received: by 2002:a05:6122:130b:: with SMTP id e11mr1066943vkp.6.1624633516289;
 Fri, 25 Jun 2021 08:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 17:05:04 +0200
Message-ID: <CAMuHMdWHz1RZ9qsbNHC9ded4x3HWCRBdRyFF2qAY4XGzV9hR2A@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock/reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update {GIC,IA55,SCIF} clock and reset entries to CPG driver to match with
> RZ/G2L clock list hardware manual(RZG2L_clock_list_r02_02.xlsx) and RZ/G2L
> HW manual(Rev.0.50).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>    * Updated reset entries.

Thanks for the update!

I think this patch can be merged with the previous one ("[PATCH
v2 06/11] drivers: clk: renesas: renesas-rzg2l-cpg: Separate reset from
module clocks").  The previous patch defined the infrastructure, and
this patch implements it.  All files touched by the previous patch
are also touched by this patch.

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -47,9 +47,9 @@
>  #define SDIV(val)              DIV_RSMASK(val, 0, 0x7)
>
>  #define CLK_ON_R(reg)          (reg)
> -#define CLK_MON_R(reg)         (0x680 - 0x500 + (reg))
> -#define CLK_RST_R(reg)         (0x800 - 0x500 + (reg))
> -#define CLK_MRST_R(reg)                (0x980 - 0x500 + (reg))
> +#define CLK_MON_R(reg)         (0x180 + (reg))
> +#define CLK_RST_R(reg)         (reg)
> +#define CLK_MRST_R(reg)                (0x180 + (reg))
>
>  #define GET_REG_OFFSET(val)            ((val >> 20) & 0xfff)
>  #define GET_REG_SAMPLL_CLK1(val)       ((val >> 22) & 0xfff)
> @@ -310,14 +310,12 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>   * @hw: handle between common and hardware-specific interfaces
>   * @off: register offset
>   * @onoff: ON/MON bits
> - * @reset: reset bits
>   * @priv: CPG/MSTP private data
>   */
>  struct mstp_clock {
>         struct clk_hw hw;
>         u16 off;
>         u8 onoff;
> -       u8 reset;
>         struct rzg2l_cpg_priv *priv;
>  };
>
> @@ -451,8 +449,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>         init.num_parents = 1;
>
>         clock->off = mod->off;
> -       clock->onoff = mod->onoff;
> -       clock->reset = mod->reset;
> +       clock->onoff = BIT(mod->onoff);

I find it a bit confusing to have two members (albeit in different
structures) named the same with different semantics.
Moreover, mstp_clock.onoff is too small to hold anything beyond bit
7.  While RZ/G2{L,LC} don't have any clock bit definitions beyond
bit 7 (there are reset bit definitions up to bit 12), future SoCs in
the series may have them.
So I'd just store the bit offset (which always fits in u8) in both
structures, and perhaps rename it to "bit", as it is no longer a
bitmask of multiple bits to control on/off.

Same for "reset"?

>         clock->priv = priv;
>         clock->hw.init = &init;
>
> @@ -476,12 +473,11 @@ static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
>  {
>         struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
>         const struct rzg2l_cpg_info *info = priv->info;
> -       unsigned int reg = info->mod_clks[id].off;
> -       u32 dis = info->mod_clks[id].reset;
> +       unsigned int reg = info->resets[id].off;
> +       u32 dis = BIT(info->resets[id].reset);
>         u32 we = dis << 16;
>
> -       dev_dbg(rcdev->dev, "reset name:%s id:%ld offset:0x%x\n",
> -               info->mod_clks[id].name, id, CLK_RST_R(reg));
> +       dev_dbg(rcdev->dev, "reset id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
>
>         /* Reset module */
>         writel(we, priv->base + CLK_RST_R(reg));
> @@ -500,11 +496,10 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>  {
>         struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
>         const struct rzg2l_cpg_info *info = priv->info;
> -       unsigned int reg = info->mod_clks[id].off;
> -       u32 value = info->mod_clks[id].reset << 16;
> +       unsigned int reg = info->resets[id].off;
> +       u32 value = BIT(info->resets[id].reset) << 16;

I just realize there's no checking if "id" points to a filled entry
in info->resets[], except for a range check against nr_resets.
Perhaps rzg2l_cpg_reset_xlate() (which is BTW identical to
of_reset_simple_xlate()) can check for a non-zero .off field?  In the
(long) end, we should have all entries filled in, but until then,
a resets property in DT pointing to a non-filled entry may cause havoc.

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
> @@ -78,7 +78,6 @@ enum clk_types {
>   * @parent: id of parent clock
>   * @off: register offset
>   * @onoff: ON/MON bits
> - * @reset: reset bits
>   */
>  struct rzg2l_mod_clk {
>         const char *name;
> @@ -86,17 +85,15 @@ struct rzg2l_mod_clk {
>         unsigned int parent;
>         u16 off;
>         u8 onoff;
> -       u8 reset;
>  };
>
> -#define DEF_MOD(_name, _id, _parent, _off, _onoff, _reset)     \
> +#define DEF_MOD(_name, _id, _parent, _off, _onoff)     \
>         [_id] = { \

Hadn't realized this before, but do you need the "[_id] ="?
rzg2l_cpg_info.mod_clks[] is only indexed during initialization.
If there are gaps due to not all clocks being implemented yet, they
are skipped by the .name check in rzg2l_cpg_register_mod_clk().
But I think you can just remove the gaps instead, decreasing kernel
size (for now).

>                 .name = _name, \
>                 .id = MOD_CLK_BASE + _id, \
>                 .parent = (_parent), \
>                 .off = (_off), \
>                 .onoff = (_onoff), \
> -               .reset = (_reset) \
>         }
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
