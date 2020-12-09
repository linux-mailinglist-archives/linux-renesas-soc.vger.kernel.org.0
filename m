Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF3E2D4342
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 14:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732212AbgLINbO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 08:31:14 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35596 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732040AbgLINbK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 08:31:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id i6so1334813otr.2;
        Wed, 09 Dec 2020 05:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzW70Pamq+b2VRw1VdFXxJmHQ9+Tfx+f/MhHEs+gaKI=;
        b=CVK5n+nNLbOB/QZ1mZWntd7PnUfhp6Hyon9P/5E8315FqgAVj9+rN0rstMvNarYTwT
         0nAGz/lCsCBx6oIRgx//daFNTaaEVVBN1poBS3gYH6qlqAbNQi46Q/c9qM9dYgXtb+xZ
         2Eurps8UXNByXR12kAeyhGz5HwFduo81hz59VcQtbPevc/0EbhLmOi/p5IV+4j0oudKQ
         zVJbIPlsVnjrWPmX8cNBAkunEjNe3a8r9uI2NP5CggsRrfDHWN9+EV18KoKnNZGQOjXf
         Sa79oBk1Moa1uNc/LwigbS1TeO8F+Mvh+/knWXekH0byNLDg6BnarL0sZ8NvXkcwmve4
         ZslQ==
X-Gm-Message-State: AOAM533gDJELt94zYbSPTQ8lM7E4ghgMGGaKCxEF2Q7e76wgyZwz7gSl
        OKL4M8iSHL/QhJI0mgo2qY0rK/RxOsELIkla9HE=
X-Google-Smtp-Source: ABdhPJxYTV9hE1u49nRNxWsfHHEG4EfpACSuNWojoOVUGjF01c85d5xxQmmHLGZE7Y22LJIIUZ30RRfXLZdYmCUt88o=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1713344otc.145.1607520629305;
 Wed, 09 Dec 2020 05:30:29 -0800 (PST)
MIME-Version: 1.0
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Dec 2020 14:30:18 +0100
Message-ID: <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC Matti (BD9573/6 driver for R-Car platforms)

(I don't have the BD9574 datasheet, so I have to base my review on
 https://www.rohm.com/r-car-pmic)

On Tue, Dec 8, 2020 at 9:06 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
>
> The new PMIC BD9574MWF inherits features from BD9571MWV.
> Add the support of new PMIC to existing bd9571mwv driver.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> [shimoda: rebase and refactor]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c
> @@ -20,6 +20,7 @@ static const struct mfd_cell bd9571mwv_cells[] = {
>         { .name = "bd9571mwv-gpio", },
>  };
>
> +/* Regmap for BD9571MWV */

Note that bd9571mwv_cells[] above also applies to BD9571MWV.

>  static const struct regmap_range bd9571mwv_readable_yes_ranges[] = {
>         regmap_reg_range(BD9571MWV_VENDOR_CODE, BD9571MWV_PRODUCT_REVISION),
>         regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
> @@ -112,6 +113,95 @@ static const struct bd957x_data bd9571mwv_data = {
>         .num_cells = ARRAY_SIZE(bd9571mwv_cells),
>  };
>
> +static const struct mfd_cell bd9574mwf_cells[] = {
> +       { .name = "bd9571mwv-gpio", },

No regulator cell?

> +};
> +
> +/* Regmap for BD9574MWF */

Note that bd9574mwf_cells[] above also applies to BD9574MWF.
Perhaps the comments should be changed slightly, and moved up,
to serve as a separator between chip variants?

> +static const struct regmap_range bd9574mwf_readable_yes_ranges[] = {
> +       regmap_reg_range(BD9574MWF_VENDOR_CODE, BD9574MWF_PRODUCT_REVISION),

Missing BD9574MWF_BKUP_MODE_CNT and BD9574MWF_DVFS_*?

> +       regmap_reg_range(BD9574MWF_GPIO_IN, BD9574MWF_GPIO_IN),
> +       regmap_reg_range(BD9574MWF_GPIO_INT, BD9574MWF_GPIO_INTMASK),
> +       regmap_reg_range(BD9574MWF_GPIO_MUX, BD9574MWF_GPIO_MUX),
> +       regmap_reg_range(BD9574MWF_INT_INTREQ, BD9574MWF_INT_INTMASK),
> +};
> +
> +static const struct regmap_access_table bd9574mwf_readable_table = {
> +       .yes_ranges     = bd9574mwf_readable_yes_ranges,
> +       .n_yes_ranges   = ARRAY_SIZE(bd9574mwf_readable_yes_ranges),
> +};
> +
> +static const struct regmap_range bd9574mwf_writable_yes_ranges[] = {

Missing BD9574MWF_BKUP_MODE_CNT and BD9574MWF_DVFS_*?

> +       regmap_reg_range(BD9574MWF_GPIO_DIR, BD9574MWF_GPIO_OUT),
> +       regmap_reg_range(BD9574MWF_GPIO_INT_SET, BD9574MWF_GPIO_INTMASK),
> +       regmap_reg_range(BD9574MWF_INT_INTREQ, BD9574MWF_INT_INTMASK),
> +};

> @@ -182,6 +272,8 @@ static int bd9571mwv_probe(struct i2c_client *client,
>         product_code = (unsigned int)ret;
>         if (product_code == BD9571MWV_PRODUCT_CODE_VAL)
>                 bd->data = &bd9571mwv_data;
> +       else if (product_code == BD9574MWF_PRODUCT_CODE_VAL)
> +               bd->data = &bd9574mwf_data;
>
>         if (!bd->data) {
>                 dev_err(bd->dev, "No found supported device %d\n",

While BD9571MWV and BD9574MWF can be distinguished at runtime,
I think it would still be a good idea to document a "rohm,bd9574mwf"
compatible value in the DT bindings, and let the driver match on that.

> diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
> index 0126b52..e9e219b 100644
> --- a/include/linux/mfd/bd9571mwv.h
> +++ b/include/linux/mfd/bd9571mwv.h

> +#define BD9574MWF_VDCORE_VINIT                 0x50
> +#define BD9574MWF_VD09_VINIT                   0x51
> +#define BD9574MWF_VDCORE_SETVMAX               0x52
> +#define BD9574MWF_VDCORE_SETVID                        0x54
> +#define BD9574MWF_VDCORE_MONIVDAC              0x55
> +#define BD9574MWF_VDCORE_PGD_CNT               0x56

Some of the above are the same as the corresponding BD9571MWV
registers, so using the same define may simplify regulator support
(cfr. BD9571MWV_DVFS_SETVID and BD9571MWV_DVFS_MONIVDAC).

> +#define BD9574MWF_PART_NUMBER                  "BD9574MWF"

BD9574MWF_PART_NAME?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
