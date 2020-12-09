Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682062D432B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732260AbgLIN0x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 08:26:53 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36241 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbgLIN0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 08:26:48 -0500
Received: by mail-ot1-f68.google.com with SMTP id y24so1315501otk.3;
        Wed, 09 Dec 2020 05:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mamLawiN11ABz2XuVq8yaJNvT+Fm8wDsG4g1Km1hYrU=;
        b=l2PiuElzKZnDOmos4PMpZMvq/amR/HmCBfOk/6wZRTqm8z9CsjGUh2vUd376aXJVTn
         0/2lSe17vjbFxz0HkkUXIR9M3PS7iFWsMZ13Wu18fsxPdLjeGTxP0tKF23O355ochns3
         XA4rjKNEgxE8tAX6o7Dgc9zFSWtn+A3FQpENFd/JLk/1pyXyZO9kXPMTmyZFvJngWQAW
         CRH92kdVfz7+i4anZA0WwqSRgYWwFeH3it26o6aGUT31YkYEw2B0e8zRt6rorAWgP49s
         D2Xmey3NfSdFfZMumPz3TIIbWAKYOTuUKyNQD6Fk3ZrMJVAifYg6vX93rDfJMbqGCzzm
         zjfQ==
X-Gm-Message-State: AOAM531GT42YnSJM3vQrWmDa4B4nqgsiyTpy1pnnEXqX8qBnA+jzDVOd
        +NgZxmlmwZs0ClD0EqiOpVp+FWUVFqhEfroMkac=
X-Google-Smtp-Source: ABdhPJzzcNwVu471rdJ74/UbqE9hJomMz89dFg65fDg+6bJHLKNXcwU4xX3JUli1g+A3gbf5CbKTioOn4+8geuyA7Zs=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr1708035ota.107.1607520367412;
 Wed, 09 Dec 2020 05:26:07 -0800 (PST)
MIME-Version: 1.0
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Dec 2020 14:25:56 +0100
Message-ID: <CAMuHMdXr1kDaXF7FFowq5CSVHzyima2fbF1fJUOowUEb88dOTA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Dec 8, 2020 at 9:06 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
>
> Since the driver supports BD9571MWV PMIC only,
> this patch makes the functions and data structure become more generic
> so that it can support other PMIC variants as well.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> [shimoda: rebase and refactor]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> index 80c6ef0..57bdb6a 100644
> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c

> @@ -127,13 +137,12 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
>                         ret);
>                 return ret;
>         }
> -
> -       if (value != BD9571MWV_PRODUCT_CODE_VAL) {
> +       /* Confirm the product code */
> +       if (value != bd->data->product_code_val) {
>                 dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
> -                       value, BD9571MWV_PRODUCT_CODE_VAL);
> +                       value, bd->data->product_code_val);
>                 return -EINVAL;
>         }

Reading the product code register, and checking the product code value
can be removed, as bd9571mwv_probe() has verified it already.

> @@ -150,6 +160,7 @@ static int bd9571mwv_probe(struct i2c_client *client,
>                           const struct i2c_device_id *ids)
>  {
>         struct bd9571mwv *bd;
> +       unsigned int product_code;

No need for a new variable...

>         int ret;
>
>         bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
> @@ -160,7 +171,25 @@ static int bd9571mwv_probe(struct i2c_client *client,
>         bd->dev = &client->dev;
>         bd->irq = client->irq;
>
> -       bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
> +       /* Read the PMIC product code */
> +       ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed reading at 0x%02x\n",
> +                       BD9571MWV_PRODUCT_CODE);
> +               return ret;
> +       }
> +
> +       product_code = (unsigned int)ret;
> +       if (product_code == BD9571MWV_PRODUCT_CODE_VAL)

... as you can just check if ret == BD9571MWV_PRODUCT_CODE_VAL here.

> +               bd->data = &bd9571mwv_data;
> +
> +       if (!bd->data) {
> +               dev_err(bd->dev, "No found supported device %d\n",

"Unsupported device 0x%x"?

> +                       product_code);
> +               return -ENOENT;
> +       }

The construct above may be easier to read and extend by using a switch()
statement, with a default case for unsupported devices.

> --- a/include/linux/mfd/bd9571mwv.h
> +++ b/include/linux/mfd/bd9571mwv.h

> @@ -83,6 +85,8 @@
>
>  #define BD9571MWV_ACCESS_KEY                   0xff
>
> +#define BD9571MWV_PART_NUMBER                  "BD9571MWV"

BD9571MWV_PART_NAME?

> +
>  /* Define the BD9571MWV IRQ numbers */
>  enum bd9571mwv_irqs {
>         BD9571MWV_IRQ_MD1,
> @@ -96,6 +100,20 @@ enum bd9571mwv_irqs {
>  };
>
>  /**
> + * struct bd957x_data - internal data for the bd957x driver
> + *
> + * Internal data to distinguish bd9571mwv chip and bd9574mwf chip

... distinguish bd957x variants?

> + */
> +struct bd957x_data {
> +       int product_code_val;

unsigned int?

> +       char *part_number;

part_name?

> +       const struct regmap_config *regmap_config;
> +       const struct regmap_irq_chip *irq_chip;
> +       const struct mfd_cell *cells;
> +       int num_cells;

I'd say "unsigned int", but mfd_add_devices() takes plain "int".

Please put the "product_code_val" and "num_cells" fields next to
each other, to avoid two 4-byte gaps on 64-bit platforms.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
