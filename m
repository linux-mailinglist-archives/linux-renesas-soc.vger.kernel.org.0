Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4152CA392
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 14:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgLANSK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Dec 2020 08:18:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38623 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgLANSJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 08:18:09 -0500
Received: by mail-ot1-f67.google.com with SMTP id e105so1569426ote.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Dec 2020 05:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ufzebz1Lmxq9YM4zrBTqdTLR9I9jDr6xbn2GCWxIYlo=;
        b=PTTywQBDNiqaXT+UQK5QrbbS8epKXfLFMrfEiKy/JbVm/qdGlrbxGFrKxBLlRg8Hoi
         8uJgM//fajsgN9uRYr9eBDv7JLqgq2rtFpMV50aNIGmP0s8evoAt/H91LnYkTPTsYKW0
         NblROq+v3cc8NamfAxUT3vWxTb865WtiGeYoYZce+wG+GtZ6oXm8k+6dzuDI7AET74kw
         dBSmY1pHHDP/1mt6fhZJEH6iTKkQaD7467Ve27dMuPW1kb0iuejB4kdKknRY1TUWUNVQ
         sIiBrRap1d4hgV+0Ze110IeKvmMDn2IWGsnQj3n8UKUyykRFcbeYoc663CgownxpZ7q8
         IsxQ==
X-Gm-Message-State: AOAM531A5A3Hkk82naZRyidWL6xXEv4EuxH6+B1ey1r8V/cZUywNpCRN
        WgZwHMePY4Pe0fiG0s7NF0LTAdU39JDUSxh3dQA=
X-Google-Smtp-Source: ABdhPJwQ5FA4BrU3675SMtx3qbgZVxnOpu7W4cg7c5w/mDBDC55wOuwy4a8SO7bFK1yRaEwjYVBPXMx+kd7cUAqsM80=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr1021488ota.107.1606828648195;
 Tue, 01 Dec 2020 05:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20201201110641.28986-1-uli+renesas@fpond.eu>
In-Reply-To: <20201201110641.28986-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Dec 2020 14:17:16 +0100
Message-ID: <CAMuHMdWFjkwG_gBnmMrr2N8psckcoSjyvQuT9wONt8UrNxT+Kw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Tue, Dec 1, 2020 at 12:06 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds I2C0-6 pins, groups and functions to the R8A779A0 (V3U)
> SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>
> Hi!
>
> This patch was missing from the "pinctrl: renesas: basic R8A779A0 (V3U)
> support" series. I have thus posted it on its own for review now and will
> include it in v2 of the series later.

Thanks!

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -1199,6 +1199,70 @@ static const struct sh_pfc_pin pinmux_pins[] = {
>         PINMUX_GPIO_GP_ALL(),
>  };
>
> +/* - I2C0 ------------------------------------------------------------------- */
> +

Please drop this superfluous blank line.

> +static const unsigned int i2c0_pins[] = {
> +       /* SDA0, SCL0 */
> +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),
> +};
> +static const unsigned int i2c0_mux[] = {
> +       GP2_03_MARK, GP2_02_MARK,

If we need PINMUX_PHYS()for the I2C pins[1], then this should become:

    SDA0_MARK, SCL0_MARK,

Likewise for the other I2C signals.

The rest looks good to me. so with the above corrected/clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

[1] https://lore.kernel.org/linux-renesas-soc/CAMuHMdVSF_8JmR5t1aMPktY=J7=BvUbWLzPGnb9=QnRrLeA2ew@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
