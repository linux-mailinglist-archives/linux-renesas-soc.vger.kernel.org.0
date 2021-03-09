Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11845332081
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 09:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCII1R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 03:27:17 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:37207 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhCII0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 03:26:45 -0500
Received: by mail-ua1-f42.google.com with SMTP id d3so4262446uap.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Mar 2021 00:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ej6gpr3nL/jZjSkylWgDi8BrU/n3nC4+XJxx/+yJmss=;
        b=BTJWPO5KJhJywVn7i73rgpXdWZG//xIYbZb980P6T5sWqgrwPDC2wNNpeFBUc1WCVl
         hBNaG9Jc93y45vzMZvhwkt69qheMU1j0Pfg0UvKwwHr2Gapfpy6ocEc3xxtXNzyjF2gG
         MOgsmJCoRlxZ68Nx9U4WOgdsJ0RDvf9h8DOdOHLINAWTh3kXsFZcd87NN/7K8mY/zw1j
         nTryBsU8a3VTe1/2QBB7oxHiFEYuSkcGRsgucmDaIuUA3bs3BK+PPyHR0Firg+/rkyC6
         vi4/vOkIOqNjKKu41vWHoTL+Lyek7hMo08XX3u2acuYwB09Rwd98Lw63vL/Qk4r9Via6
         IcUw==
X-Gm-Message-State: AOAM532nw+9HeF3aWcU8KxOWq34FGemIka3BQuDejvjmXSr1EYSAiNp5
        gdI1lkhiHSkWFBD6SxDbcIfaMDV+sYwqs9hH5xK/9ZzA
X-Google-Smtp-Source: ABdhPJwJ+QZtwekY57GcrznGa9KnHZZG/EVsbKyH4pkWAjO+w/FxznO1+TIRCYnn+Tut6S7FA3VHSLMZ7Lscw7mVt+A=
X-Received: by 2002:ab0:20b3:: with SMTP id y19mr15356426ual.2.1615278405053;
 Tue, 09 Mar 2021 00:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20210308155942.1733341-1-niklas.soderlund+renesas@ragnatech.se> <20210308155942.1733341-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210308155942.1733341-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Mar 2021 09:26:33 +0100
Message-ID: <CAMuHMdWpCSkeogU-kkc_=OYyvtuMim3yAB4AvF0sKUew1=bRsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: renesas: r8a77951: Add vin{4,5}_high8 pins
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Mon, Mar 8, 2021 at 5:00 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This patch adds VIN{4,5}_high8 support to the R8A77951 SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> * Changes since v1
> - Rename g8 to high8 per Geerts suggestion.
> - Rebase to renesas-pinctrl.

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pfc-r8a77951.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
> @@ -4126,6 +4126,18 @@ static const union vin_data vin4_data_b_mux = {
>                 VI4_DATA22_MARK, VI4_DATA23_MARK,
>         },
>  };
> +static const unsigned int vin4_high8_pins[] = {
> +       RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +       RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin4_high8_mux[] = {
> +       VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +       VI4_DATA10_MARK, VI4_DATA11_MARK,
> +       VI4_DATA12_MARK, VI4_DATA13_MARK,
> +       VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};

I think for vin4, you should keep on calling them "vin4_g8", as vin4
supports 24-bit RGB, and "high8" would mean lines 16-23, not 8-15.
Same comment for the other patches, obviously.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
