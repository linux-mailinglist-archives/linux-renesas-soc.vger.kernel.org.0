Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897982C68F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 16:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbgK0Pul (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 10:50:41 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45612 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730324AbgK0Pul (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 10:50:41 -0500
Received: by mail-oi1-f196.google.com with SMTP id l206so6271942oif.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 07:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+r8Va6Dsy/4kT5J+07oZJLKf747NaYmID5jZevVZxE=;
        b=cAZ6K7FFC1SRzdt8iT683NaqZtwVJO0/8ZuOBDOwZg8z/W89l+j4e7nu8b818rrvLM
         xExV7Uv1IZWOEha30nYIAgv88+rF8OAoxs78Rrjvwtg1ekkctHUFlAk/f7L7D7m8RgTF
         7hpDdxt24IAVDMmgmvwOYI1qjPLukgWBLJJ0I3UNomga0EiGMvoAto9w3VtJd2FhGOmh
         TbWo5JKZEm25TCFlQ19Q1LuKpZI/jN5hQjQPvcDZbbZWdRmzuW4Aum2YM6NFzFxuiIDx
         26lL8ZlPQ30LPYZaVX1cMlmw9ZYdqwrqANOGF+zkxbF1Gma/LNOk/6uLD6CvE21yUyhZ
         t2kA==
X-Gm-Message-State: AOAM530eR2TzUt+fuOvziCDLlOVB5XLgiJcSTZeleesSI9+Y37HvmO5L
        S+PTZxse2k1CNIaQst/bzDy40L5GvVDNYmY3EFHm13B7gwZeJw==
X-Google-Smtp-Source: ABdhPJw42caTKBaDABO64gzle9HbLv36HCyh0BIujaGNsIjBRepyPGfFkTxZLAyr9bNuOkosPdtTo+RpldHnGYz62f8=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr5941644oic.54.1606492239961;
 Fri, 27 Nov 2020 07:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-4-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 16:50:28 +0100
Message-ID: <CAMuHMdXQc2fHMV4Lb+1cGKyCN=NUTE+Eze4ad9mTmbmXoG+K6A@mail.gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: renesas: r8a779a0: Add DU pins, groups and function
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds DU pins, groups and function for the R8A779A0 (V3U) SoC.
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -1736,6 +1736,53 @@ static const unsigned int canfd_clk_mux[] = {
>         CAN_CLK_MARK,
>  };
>
> +/* - DU --------------------------------------------------------------------- */
> +static const unsigned int du_rgb888_pins[] = {
> +       /* DU_DR[7:2], DU_DG[7:2], DU_DB[7:2] */
> +       RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> +       RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
> +       RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 15),
> +       RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 12),
> +       RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
> +       RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
> +};
> +static const unsigned int du_rgb888_mux[] = {
> +       DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK,
> +       DU_DR4_MARK, DU_DR3_MARK, DU_DR2_MARK,
> +       DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK,
> +       DU_DG4_MARK, DU_DG3_MARK, DU_DG2_MARK,
> +       DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK,
> +       DU_DB4_MARK, DU_DB3_MARK, DU_DB2_MARK,
> +};
> +static const unsigned int du_clk_out_pins[] = {
> +       /* DU_DOTCLKOUT */
> +       RCAR_GP_PIN(1, 24),
> +};
> +static const unsigned int du_clk_out_mux[] = {
> +       DU_DOTCLKOUT_MARK,
> +};
> +static const unsigned int du_oddf_pins[] = {
> +       /* DU_EXODDF/DU_ODDF/DISP/CDE */
> +       RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int du_oddf_mux[] = {
> +       DU_ODDF_DISP_CDE_MARK,
> +};
> +static const unsigned int du_cde_pins[] = {
> +       /* DU_CDE */
> +       RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int du_cde_mux[] = {
> +       DU_ODDF_DISP_CDE_MARK,
> +};
> +static const unsigned int du_disp_pins[] = {
> +       /* DU_DISP */
> +       RCAR_GP_PIN(1, 27),
> +};
> +static const unsigned int du_disp_mux[] = {
> +       DU_ODDF_DISP_CDE_MARK,
> +};

With not-yet-submitted debug checks:

    r8a779a0_pfc: groups du_cde can be an alias for du_oddf
    r8a779a0_pfc: groups du_disp can be an alias for du_oddf
    r8a779a0_pfc: groups du_disp can be an alias for du_cde

Do we need all three?

> @@ -2103,6 +2156,15 @@ static const char * const canfd_clk_groups[] = {
>         "canfd_clk",
>  };
>
> +static const char * const du_groups[] = {
> +       "du_rgb888",
> +       "du_clk_out",
> +       "du_sync",

With CONFIG_DEBUG_PINCTRL=y:

    r8a779a0_pfc: function du: group du_sync not found

And indeed, the sync group with the HSYNC (GP1_25) and VSYNC (GP1_26)
pins is missing.

With the above fixed:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
