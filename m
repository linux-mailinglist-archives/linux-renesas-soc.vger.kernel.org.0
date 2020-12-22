Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A0E2E09D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 12:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgLVLpZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 06:45:25 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45041 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLVLpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 06:45:25 -0500
Received: by mail-ot1-f49.google.com with SMTP id f16so11604723otl.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 03:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1hPNPXtEOwApRtoaPnJ7K0suPaOLm73JIUQ4fjmFLU=;
        b=ep9yOiH4mD8zDMlYMZJUP7F0zOMGGNfIwC2SiLFjZNzEQSj+V+akDERwVC3DR0JrmA
         dL/oPBD+WWi66vR0Qh1qw+dTxVglIT/2M9orwwCW1qpQ6SnI8+f48Q7/A0gPUdjKtVhv
         3e0iJOkQnFh6yc3m3Nozno+rHMc/lYILCFD4EU3muRKkoeNrdQRjrSErCXanke4O+2cA
         Z7EfnT0HV9cJM9Uykb9imFNziNcARv0yS4LuNnORj17HTeWKrrN+zukvLKPG1PVNtuAo
         xiVnAZWpw4Frqs5h1CzESK5VuP7jyephyB3LMkkYH5em7fixctsxZdK9P8ocPgSl8pi9
         EUDg==
X-Gm-Message-State: AOAM530zvVW6zlXfCIjvlXU9E0yaNunkQ5zh+trRaNLgFVrXstmOF4U9
        4rYxpnkeNJTkFlLjjLgSbxTVBP8zLaka9AaLAyfpwRNcqOE=
X-Google-Smtp-Source: ABdhPJwc6GoFYrBrvhkP0m3GkLgA4H5EMRJ5cw5yrovHhbKiJoZe1ep8vnA1NUA9sHJxQsIrDudjWhx3m2BKFgsDT3E=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr809620otr.107.1608637484397;
 Tue, 22 Dec 2020 03:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-3-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 12:44:33 +0100
Message-ID: <CAMuHMdX-9=2NfxeeWjWV5rsRx8TLjdtJ_ZmdK9xJvAvLhkFJ+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: add I/O voltage level flag
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds config macros describing the voltage levels available on
> a pin. The current default (3.3V/1.8V) maps to zero to avoid having to
> change existing PFC implementations.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -634,6 +634,9 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
>         }
>
>         case PIN_CONFIG_POWER_SOURCE: {
> +               int idx = sh_pfc_get_pin_index(pfc, _pin);
> +               const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> +               int lower_voltage;
>                 u32 pocctrl, val;
>                 int bit;
>
> @@ -648,7 +651,10 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
>                 val = sh_pfc_read(pfc, pocctrl);
>                 spin_unlock_irqrestore(&pfc->lock, flags);
>
> -               arg = (val & BIT(bit)) ? 3300 : 1800;
> +               lower_voltage = (pin->configs & SH_PFC_PIN_VOLTAGE_25_33) ?
> +                       2500 : 1800;
> +
> +               arg = (val & BIT(bit)) ? 3300 : lower_voltage;

Alternatively, .pin_to_pocctrl() could return mV_low and mV_high?
That would require updating all subdrivers, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
