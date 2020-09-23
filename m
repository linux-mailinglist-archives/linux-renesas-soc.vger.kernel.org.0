Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88B12754E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 11:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIWJ5Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 05:57:25 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38685 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWJ5W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 05:57:22 -0400
Received: by mail-ot1-f65.google.com with SMTP id y5so18393881otg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2020 02:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LmMehiIx6AFD9psmrU8zYljqsZ6mkFgXq3E7+QfBp4c=;
        b=hjSthqwjYikAQZp6RwcW/iG6Y52pejU990f0F2ACcR4+XXJl912AI9ANftEc0rz/1N
         xq7K6mItYG+DSeFh4cJhRjGv+PxdQXeG9iXjV+ObEg9Jp6BVsWDyyws2JhKlOmEV+Znv
         Yv2j4a13CUUsH6yBGmf1fCnQPPvXD4NjP5IyWmbCS6uEZeZbCdrSPxz1aZBwQ4BQ2vdV
         asPt7zRBiwqADn7pHWpX3ZbgPpc1ltpLU13PC40jHsHMiRbd+In/AAjeXKhBHtyuNwUI
         b6e1ofR57vmy1cL7oaUPN4/yAKtFk0WS07TECNP0rXBwQ6b6gP0hY6SajzbOb4CGHRNU
         kmgw==
X-Gm-Message-State: AOAM5326cLp8ccPDoqdaEfnue9y/dncgkl3jNwiWPf2hkeb7mPH8hARf
        pDWYnyEl+IpaQahocMC2tG5jZb9cg/+yTMRh6NM=
X-Google-Smtp-Source: ABdhPJzj3XanOgVBL3FYnKRUsPqRJh3FbMx72Oyi2o105QSwW2gC7l7LD56XqGBO2YzDcTTWwaWUQE8Q92qYy9RF7eQ=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr5440887oth.145.1600855041343;
 Wed, 23 Sep 2020 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se> <20200914233744.468175-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200914233744.468175-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 11:57:09 +0200
Message-ID: <CAMuHMdUj1EdZFdUN7htAAidV-9bSn8eHzhj3TqhDmVUP05OtBg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a77951: Add VIN pins, groups and functions
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

CC Laurent.

On Tue, Sep 15, 2020 at 1:38 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds VIN{4,5} pins, groups and functions to the R8A77951 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Niklas: Rework to fit upstream driver]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> @@ -4074,6 +4074,18 @@ static const union vin_data vin4_data_b_mux = {
>                 VI4_DATA22_MARK, VI4_DATA23_MARK,
>         },
>  };
> +static const unsigned int vin4_data8_sft8_pins[] = {
> +       RCAR_GP_PIN(1, 0),  RCAR_GP_PIN(1, 1),
> +       RCAR_GP_PIN(1, 2),  RCAR_GP_PIN(1, 3),
> +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin4_data8_sft8_mux[] = {
> +       VI4_DATA8_MARK,  VI4_DATA9_MARK,
> +       VI4_DATA10_MARK, VI4_DATA11_MARK,
> +       VI4_DATA12_MARK, VI4_DATA13_MARK,
> +       VI4_DATA14_MARK, VI4_DATA15_MARK,
> +};

I'm not so fond of the "sft8" suffix.
What about using "vin4_g8" instead of "vin4_data8_sft8", cfr. "[PATCH v3]
pinctrl: renesas: r8a7790: Add VIN1-B and VIN2-G pins, groups and
functions"?
https://lore.kernel.org/linux-renesas-soc/20200917195924.20384-1-prabhakar.mahadev-lad.rj@bp.renesas.com

>  static const unsigned int vin4_sync_pins[] = {
>         /* HSYNC#, VSYNC# */
>         RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
> @@ -4128,6 +4140,18 @@ static const union vin_data16 vin5_data_mux = {
>                 VI5_DATA14_MARK, VI5_DATA15_MARK,
>         },
>  };
> +static const unsigned int vin5_data8_sft8_pins[] = {
> +       RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
> +       RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
> +       RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
> +       RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
> +};
> +static const unsigned int vin5_data8_sft8_mux[] = {
> +       VI5_DATA8_MARK,  VI5_DATA9_MARK,
> +       VI5_DATA10_MARK, VI5_DATA11_MARK,
> +       VI5_DATA12_MARK, VI5_DATA13_MARK,
> +       VI5_DATA14_MARK, VI5_DATA15_MARK,
> +};

I'm not so fond of the "sft8" suffix.
However, as this is a 16-bit instead of a 24-bit interface, "vin5_g8"
doesn't sound appropriate to me.
Anyone with a good suggestion?

>  static const unsigned int vin5_sync_pins[] = {
>         /* HSYNC#, VSYNC# */
>         RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
> @@ -4470,6 +4494,7 @@ static const struct {
>                 SH_PFC_PIN_GROUP(vin4_data18_b),
>                 VIN_DATA_PIN_GROUP(vin4_data, 20, _b),
>                 VIN_DATA_PIN_GROUP(vin4_data, 24, _b),
> +               SH_PFC_PIN_GROUP(vin4_data8_sft8),

warning: excess elements in array initializer

You have to increase the size of the .common[] array, to match the
actual number of entries.
Booting a kernel with CONFIG_DEBUG_PINCTRL=y also helps.

The same comments apply to patches 2-4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
