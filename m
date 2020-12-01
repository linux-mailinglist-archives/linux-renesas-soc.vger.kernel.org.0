Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83B72C9A1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 09:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgLAIz2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Dec 2020 03:55:28 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35435 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgLAIzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 03:55:24 -0500
Received: by mail-ot1-f68.google.com with SMTP id t18so963073otk.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Dec 2020 00:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=drPgkwdhOBRxvmkB/65dceRp+WBXpceyLl/zH4DkKcA=;
        b=c/Bw7bQZg2uvW26K6E04UPeI460g7RkuOuTqjwGhLc8b6AhBU1kTq5Qftp9x/NhQtt
         IDsaDj30IK6VLvh/Uw+/dXWk5UkdW41QYiFNy/fMF/ct3bQ6xHRwff0sUorMkIBWt0Yf
         4j0ES5CoX7U/c82pPxIhQ249OHciFAP3ObfXAeGTJhkg08AT6p1GHMH7ufmiOMqkU/d9
         z9Oa3/oWrdO37dxJmuNkweRJ3OztAWwWnONmQVQW3vhqIB7zL18t7RhBokQjdkHOao58
         Bg5hGGWKqr9tVQ2CILhBIure2ZONfOQJfoZJaYRC8s71fbckG138k4wQF2sLQ94Ipz3j
         4qIA==
X-Gm-Message-State: AOAM530DlhpOdlWKkGhstCMjcND3oWJNNYX2vsGVsmWDTRNebtyU+9U4
        oi4Z6TSw8xLqiN7QcxmPosvfVlSLMA7vPru+gszlT6zJuWY=
X-Google-Smtp-Source: ABdhPJwQI+G0lK93TaIf+dPi5zAjfmCK7oAkTEEVcEeGjP8pRiFBtQMtisEtKh1pnvqTDUX+iNYKxOunnHsgtNyOEHw=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1183006oth.250.1606812883092;
 Tue, 01 Dec 2020 00:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126172058.25275-1-uli+renesas@fpond.eu> <20201126172058.25275-3-uli+renesas@fpond.eu>
In-Reply-To: <20201126172058.25275-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Dec 2020 09:54:31 +0100
Message-ID: <CAMuHMdWLVkZ2ZkrCCykLVYhehpr6=f-jGT07cKoH45P-moo+VA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

One more comment...

On Thu, Nov 26, 2020 at 6:21 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds initial pinctrl support for the R8A779A0 (V3U) SoC,
> including bias control.

... and drive strength, and I/O voltage control.

> + static int r8a779a0_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> +                                    u32 *pocctrl)
> + {
> +         int bit = pin & 0x1f;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC0].reg;
> +         if (pin >= RCAR_GP_PIN(0, 15) && pin <= RCAR_GP_PIN(0, 27))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC1].reg;
> +         if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 30))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC2].reg;
> +         if (pin >= RCAR_GP_PIN(2, 2) && pin <= RCAR_GP_PIN(2, 15))
> +                 return bit;

The above are pins switchable between 1.8V and 3.3V pins, which are
handled fine.

> +
> +         *pocctrl = pinmux_ioctrl_regs[POC4].reg;
> +         if (pin >= RCAR_GP_PIN(4, 0) && pin <= RCAR_GP_PIN(4, 17))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC5].reg;
> +         if (pin >= RCAR_GP_PIN(5, 0) && pin <= RCAR_GP_PIN(5, 17))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC6].reg;
> +         if (pin >= RCAR_GP_PIN(6, 0) && pin <= RCAR_GP_PIN(6, 17))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC7].reg;
> +         if (pin >= RCAR_GP_PIN(7, 0) && pin <= RCAR_GP_PIN(7, 17))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC8].reg;
> +         if (pin >= RCAR_GP_PIN(8, 0) && pin <= RCAR_GP_PIN(8, 17))
> +                 return bit;
> +
> +         *pocctrl = pinmux_ioctrl_regs[POC9].reg;
> +         if (pin >= RCAR_GP_PIN(9, 0) && pin <= RCAR_GP_PIN(9, 17))
> +                 return bit;

The above are 2.5/3.3V pins, and they are not handled correctly by
sh_pfc_pinconf_[gs]et(), which always assumes 1.8/3.3V.

I think the simplest solution would be to split the
SH_PFC_PIN_CFG_IO_VOLTAGE flag in two flags, and the pin_to_pocctrl()
callback in two callbacks, one for 1.8/3.3V and one for 2.5/3.3V pins,
but you may have a better idea?

Note that the R-Car V3M, V3H, E3, and D3 SoCs also have 2.5/3.3V pins,
but their pinctrl drivers just don't handle them, and limit voltage control
to the 1.8/3.3V pins.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
