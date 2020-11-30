Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6B2C8615
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 15:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgK3N6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:58:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46143 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgK3N6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:58:48 -0500
Received: by mail-ot1-f67.google.com with SMTP id z23so7661368oti.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I4U3lqKZ8er/80wdSwv0ZILyVNrOIGBWglOrpUCqcgo=;
        b=oQpe8fxKDnbJhkWmLsEa8l23xGX7FPz/YZPMkBI0G7LPPSHXtpEJRQfkozunhrL1L5
         qiXhj7FEa7wbo0vxllHOs8wK1h45wgQyBiwIesg2Uta1lJYdBe+p3W8n4d6gCiuMkp4e
         AbNnPHmFTgC20Kk4MWrbDTUIASrvxCBarBCt957S/5td++a3d4kHvXujAjsyYvQQYw6q
         KOEVHUQCa0t8ozpLL48x2uE78ztR6L6FG3diu/SZXy3FJyJaEbViKnfPD62L5xjni9Fp
         2/fciJ00aFbMkcokq/48RHCbH4hHuXj/U/1SQyGLyb/x3V0PUfmblRATXgmJ3bYXJMIR
         mU4A==
X-Gm-Message-State: AOAM531oMOMwk9x8S/x1RuKjgVQUwlPA7np2XzKZzmBJssrPpHQqdXzj
        l5ywghUh37h1j81FkeLzj41r7rXqEkZKsxkN3jU=
X-Google-Smtp-Source: ABdhPJxeqTiCO/EdDpqSwP6pAW8wlpY+Bj/d9hI9Dk3ZMgWF1ZZ4XYGpiTQotFRyGBl4+2PdxJ2j0AGEaWGC89pEM9E=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr8510487oth.250.1606744687745;
 Mon, 30 Nov 2020 05:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-11-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-11-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:57:56 +0100
Message-ID: <CAMuHMdXtz+7f0kpg4Yi5swmmZe6ZwkYi+vBJ-Bvt-EmKcnaY1Q@mail.gmail.com>
Subject: Re: [PATCH 10/11] pinctrl: renesas: r8a779a0: Add TMU pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds TMU TCLK1-4 pins, groups and functions to the R8A779A0
> (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!


> ---
>  drivers/pinctrl/renesas/pfc-r8a779a0.c | 47 ++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> index a83b6fa9ab9e..4aa725b3fbca 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -2502,6 +2502,39 @@ static const unsigned int scif_clk_mux[] = {
>         SCIF_CLK_MARK,
>  };
>
> +/* - TMU -------------------------------------------------------------------- */
> +static const unsigned int tmu_tclk1_pins[] = {
> +       /* TCLK1 */
> +       RCAR_GP_PIN(2, 23),
> +};
> +static const unsigned int tmu_tclk1_mux[] = {
> +       TCLK1_MARK,
> +};

According to the R-Car V3U Pin Multiplex Table, there are two sets.
The above definition corresponds to set A.
Set B is available on pin GP1_23.

> +
> +static const unsigned int tmu_tclk2_pins[] = {
> +       /* TCLK2 */
> +       RCAR_GP_PIN(2, 24),
> +};
> +static const unsigned int tmu_tclk2_mux[] = {
> +       TCLK2_MARK,
> +};

According to the R-Car V3U Pin Multiplex Table, there are two sets.
The above definition corresponds to set A.
Set B is available on pin GP2_10.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
