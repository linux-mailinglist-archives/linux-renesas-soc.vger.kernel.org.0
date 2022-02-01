Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AE14A5B5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 12:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbiBALoP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 06:44:15 -0500
Received: from mail-vs1-f41.google.com ([209.85.217.41]:38524 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237353AbiBALoO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 06:44:14 -0500
Received: by mail-vs1-f41.google.com with SMTP id f6so15673754vsa.5;
        Tue, 01 Feb 2022 03:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwazePksPoSD+vYBRyvmosVzQwAX88pB7+cTPwp6BLs=;
        b=SufisBpiQFNaPRWAWpq9JeebJ5JNs8wW8zd8D/Tk3xQbrn9nSLx42vli6fE7AJueGO
         2MpvT1L14Wc2J85O+/jWWUS3kVVhqwimcThlEt71XVWx1OayhQzHV2TVrTfxF1HC69c1
         +OXKrndRucalNBQ7qqOEoOJAhL8hDSsJFgvY6zBcfqDX6uxGiqNe+zbVPKMVlt99MzWo
         oCbpf3ypQGIgmyT74un8T2xS6n3NSbAPHYH3ODQBGQZvBz7mUMHgb2inU2uhakVHunqd
         Di6No7ToBAXwEdtg7faWhBzRs6ZTJpN/W1dvPOjro+9PKfkA6vKJdloNvdxK8vE97cDR
         Ktxg==
X-Gm-Message-State: AOAM5321Izvj156Gst3CuZcFZoLJmyYU0M2/FMfM1ELbLTazNQqct+vO
        dMx6kS8hcl+uMfJffumHy1OuYpItYmuiqQ==
X-Google-Smtp-Source: ABdhPJwDbmWuafSDAb+G9Erx/WO/IpDvqrDNhdgEp6n69kChunWWTJS9skGpGxmEJHZVcpnLFCW4pA==
X-Received: by 2002:a67:d207:: with SMTP id y7mr10213519vsi.60.1643715853457;
        Tue, 01 Feb 2022 03:44:13 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id u23sm3908679vsg.25.2022.02.01.03.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 03:44:12 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id l14so15688392vsm.3;
        Tue, 01 Feb 2022 03:44:12 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr9351120vse.57.1643715852422;
 Tue, 01 Feb 2022 03:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 12:44:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSQNKyoFEg59u5jBYGww6-EB23=DV93gNeavtMNsms8Q@mail.gmail.com>
Message-ID: <CAMuHMdVSQNKyoFEg59u5jBYGww6-EB23=DV93gNeavtMNsms8Q@mail.gmail.com>
Subject: Re: [RFC 01/28] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
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

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> PLL5 generates FOUTPOSTDIV clk and is sourced by LCDC/DSI modules.
> The FOUTPOSTDIV is connected to PLL5_4 MUX. Video clock is sourced
> from DSI divider which is connected to PLL5_4 MUX.
>
> Added 2 LUT's for generating FOUTPOSTDIV, 1 for DSI mode and other
> for DPI mode as it requires different parameters for generating the
> video clock. The LUT supports minimal set of frequency used by
> commonly used resolutions.
>
> This patch uses the above LUT to generate the required video clock
> by matching the frequency value in LUT with FOUTPOSTDIV/DSI_DIV.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -78,6 +78,8 @@ struct sd_hw_data {
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
>   * @notifiers: Notifier chain to save/restore clock state for system resume
>   * @info: Pointer to platform data
> + * @pll5_table: Table containing a set of pll5 parameters
> + * @num_pll5_entries: Number of entries in pll5 table
>   */
>  struct rzg2l_cpg_priv {
>         struct reset_controller_dev rcdev;
> @@ -93,6 +95,9 @@ struct rzg2l_cpg_priv {
>
>         struct raw_notifier_head notifiers;
>         const struct rzg2l_cpg_info *info;
> +
> +       const struct rzg2l_pll5_param *pll5_table;
> +       unsigned int num_pll5_entries;
>  };
>
>  static void rzg2l_cpg_del_clk_provider(void *data)
> @@ -266,6 +271,203 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +struct rzg2l_pll5_param {
> +       u64     frequency;

u32 should be sufficient.

> +       u64     pl5_refdiv;

u8? ;-)

(and move down to avoid gaps)

> +       u32     pl5_intin;

u8?

> +       u32     pl5_fracin;
> +       u8      pl5_postdiv1;
> +       u8      pl5_postdiv2;
> +       u8      dsi_div_a;
> +       u8      dsi_div_b;
> +       u8      dsi_div;
> +       u8      clksrc;
> +};
> +
> +static const struct rzg2l_pll5_param dsi_mode_param[] = {
> +       {   25175000, 1,  16, 13141593, 1, 1, 2, 3, 16, 0 }, /* VGA 25.175MHz */
> +       {   25200000, 1,  16, 13421773, 1, 1, 2, 3, 16, 0 }, /* VGA 25.200MHz */
> +       {   27000000, 1,  18,        0, 1, 1, 2, 3, 16, 0 }, /* 480p/576p 27.000MHz */
> +       {   27027000, 1,  18,   301990, 1, 1, 2, 3, 16, 0 }, /* 480p 27.027MHz */
> +       {   29605000, 1,  19, 12359216, 1, 1, 2, 3, 16, 0 }, /* WVGA 29.605MHz */
> +       {   40000000, 2,  80,        0, 2, 1, 1, 2,  6, 0 }, /* SVGA 40.00MHz */
> +       {   65000000, 1,  43,  5592405, 1, 1, 2, 3, 16, 0 }, /* XGA 65.00MHz */
> +       {   71000000, 2,  71,        0, 1, 1, 1, 2,  6, 0 }, /* WXGA 1280x800 71.0MHz */
> +       {   74176000, 1,  49,  7560932, 1, 1, 2, 3, 16, 0 }, /* 720p 74.176MHz */
> +       {   74250000, 1,  49,  8388608, 1, 1, 2, 3, 16, 0 }, /* 720p 74.25MHz */
> +       {   85500000, 2,  85,  8388608, 1, 1, 1, 2,  6, 0 }, /* FWXGA 1360x768 85.5MHz */
> +       {   88750000, 2,  88, 12582912, 1, 1, 1, 2,  6, 1 }, /* WXGA+ 1440x900 88.75MHz */
> +       {  108000000, 2, 108,        0, 1, 1, 1, 2,  6, 1 }, /* SXGA 108MHz */
> +       {  148500000, 2, 148,  8388608, 1, 1, 1, 2,  6, 1 }, /* 1080p 148.5MHz */
> +       { 3000000000, 1, 125,        0, 1, 1, 0, 0,  0, 0 }, /* 3000 MHz */

3000000000U, as this is larger than 1^31.
Why do you need the 3 GHz entry? There are no such high video modes.

Do you need .dsi_div?
.dsi_div = (1 << .dsi_div_a) * (.dsi_div_b + 1)

Personally, I don't like tables, as calculations are more flexible.
I'd expect the formula to be:

    .frequency = extal / .pl5_refdiv *
                 ((.pl5_intin << 24 + .pl5_fracin) >> 24) /
                 (.pl5_postdiv1 * .pl5_postdiv * .dsi_div)

(with extal = 24 MHz)

However, that gives the wrong results for .pl5_refdiv = 2:
  - For such entries in the above table, it calculates a frequency
    that's twice the value in the table,
  - For such entries in the below table, it calculates a frequency
    that's half the value in the table.

Note that some entries (esp. the first one) from the table below give
a clock rate closer to the expected one the corresponding entries
from the table above.

> +};
> +
> +static const struct rzg2l_pll5_param dpi_mode_param[] = {
> +       {   25175000, 1, 102, 13386820, 7, 7, 1, 0, 2, 0 }, /* VGA 25.175MHz */
> +       {   25200000, 1,  73,  8388608, 7, 5, 1, 0, 2, 0 }, /* VGA 25.200MHz */
> +       {   27000000, 1,  78, 12582912, 7, 5, 1, 0, 2, 0 }, /* 480p/576p 27.000MHz */
> +       {   27027000, 1, 110,  6043992, 7, 7, 1, 0, 2, 0 }, /* 480p 27.027MHz */
> +       {   29605000, 1,  88, 13673431, 6, 6, 1, 0, 2, 0 }, /* WVGA 29.605MHz */
> +       {   40000000, 1,  70,        0, 7, 3, 1, 0, 2, 0 }, /* SVGA 40.00MHz */
> +       {   65000000, 1,  81,  4194304, 5, 3, 1, 0, 2, 0 }, /* XGA 65.00MHz */
> +       {   71000000, 2,  71,        0, 6, 2, 1, 0, 2, 0 }, /* WXGA 1280x800 71.0MHz */
> +       {   74176000, 1,  74,  2952790, 6, 2, 1, 0, 2, 0 }, /* 720p 74.176MHz */
> +       {   74250000, 1,  86, 10485760, 7, 2, 1, 0, 2, 0 }, /* 720p 74.25MHz */
> +       {   85500000, 1,  83,  8388608, 6, 2, 1, 0, 2, 0 }, /* WXGA 1280x800 83.5MHz   */

83500000

> +       { 3000000000, 1, 125,        0, 1, 1, 0, 0, 0, 0 }, /* 3000 MHz */
> +};
> +
> +static int rzg2l_cpg_sipll5_get_index(unsigned long rate,
> +                                     const struct rzg2l_pll5_param *pll5tab,
> +                                     unsigned int n)

Perhaps just pass priv instead of pll5tab and n?

> +{
> +       unsigned int  i;
> +
> +       for (i = 0; i < n; i++) {
> +               if (pll5tab[i].frequency  == rate / pll5tab[i].dsi_div)
> +                       break;
> +       }
> +
> +       if (i == n)
> +               i--;
> +
> +       return i;
> +}
> +
> +struct sipll5 {
> +       struct clk_hw hw;
> +       unsigned int conf;
> +       unsigned long rate;
> +       struct rzg2l_cpg_priv *priv;
> +};
> +
> +#define to_sipll5(_hw) container_of(_hw, struct sipll5, hw)
> +
> +static unsigned long rzg2l_cpg_sipll5_get_rate(unsigned long rate,
> +                                              const struct rzg2l_pll5_param *pll5tab,
> +                                              unsigned int n)

This function has only a single caller, so perhaps it's better to
inline it manually?

> +{
> +       int index = rzg2l_cpg_sipll5_get_index(rate, pll5tab, n);
> +
> +       return pll5tab[index].frequency * pll5tab[index].dsi_div;
> +}
> +
> +static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
> +                                                 unsigned long parent_rate)
> +{
> +       struct sipll5 *sipll5 = to_sipll5(hw);
> +
> +       return sipll5->rate;
> +}
> +
> +static long rzg2l_cpg_sipll5_round_rate(struct clk_hw *hw,
> +                                       unsigned long rate,
> +                                       unsigned long *parent_rate)
> +{
> +       struct sipll5 *sipll5 = to_sipll5(hw);
> +       struct rzg2l_cpg_priv *priv = sipll5->priv;
> +       const struct rzg2l_pll5_param *pll5tab = priv->pll5_table;
> +
> +       sipll5->rate = rzg2l_cpg_sipll5_get_rate(rate, pll5tab, priv->num_pll5_entries);
> +       return sipll5->rate;
> +}
> +
> +static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> +                                    unsigned long rate,
> +                                    unsigned long parent_rate)
> +{
> +       struct sipll5 *sipll5 = to_sipll5(hw);
> +       struct rzg2l_cpg_priv *priv = sipll5->priv;
> +       const struct rzg2l_pll5_param *pll5tab = priv->pll5_table;
> +       u8 id = rzg2l_cpg_sipll5_get_index(rate, pll5tab, priv->num_pll5_entries);
> +       int ret;
> +       u32 val;
> +
> +       /* Put PLL5 into standby mode */
> +       writel(0x00050000, priv->base + CPG_SIPLL5_STBY);

Please add defines for magic numbers

> +       ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
> +                                !(val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
> +       if (ret) {
> +               dev_err(priv->dev, "failed to release pll5 lock");
> +               return ret;
> +       }
> +
> +       /* Output clock setting 1 */
> +       writel(0x01110000 |

Magic number

> +              (pll5tab[id].pl5_postdiv1 << 0) |
> +              (pll5tab[id].pl5_postdiv2 << 4) |
> +              (pll5tab[id].pl5_refdiv << 8),
> +              priv->base + CPG_SIPLL5_CLK1);
> +       /* Output clock setting, SSCG modulation value setting 3 */
> +       writel((0 << 0) | (pll5tab[id].pl5_fracin << 8), priv->base + CPG_SIPLL5_CLK3);
> +       /* Output clock setting 4 */
> +       writel(0x000000ff | (pll5tab[id].pl5_intin << 16), priv->base + CPG_SIPLL5_CLK4);

magic number (and more below)

> +
> +       /* SSCG modulation value setting 5 */
> +       writel((0x16 << 0), priv->base + CPG_SIPLL5_CLK5);

> +       /* PLL normal mode setting */
> +       writel(0x00050001, priv->base + CPG_SIPLL5_STBY);
> +
> +       /* PLL normal mode transition, output clock stability check */
> +       ret = readl_poll_timeout(priv->base + CPG_SIPLL5_MON, val,
> +                                (val & CPG_SIPLL5_MON_PLL5_LOCK), 100, 250000);
> +       if (ret) {
> +               dev_err(priv->dev, "failed to lock pll5");
> +               return ret;
> +       }
> +
> +       return 0;
> +}

> @@ -918,6 +1123,18 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>         priv->num_resets = info->num_resets;
>         priv->last_dt_core_clk = info->last_dt_core_clk;
>
> +       priv->pll5_table = dpi_mode_param;
> +       priv->num_pll5_entries = ARRAY_SIZE(dpi_mode_param);
> +       /* Fix me: Selection of the table needs to be overridden by either
> +        * 1) a property in DTS or
> +        * 2) Detecting DSI/DPI mode from dts or
> +        * 3) DSI/DPI mode runtime detection
> +        */
> +       if (info->pll5_lcdc_dsi_mode) {
> +               priv->pll5_table = dsi_mode_param;
> +               priv->num_pll5_entries = ARRAY_SIZE(dsi_mode_param);
> +       }
> +

I'd expect that to be detected at runtime, or derived from what clock
rate(s) the display driver asks for?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
