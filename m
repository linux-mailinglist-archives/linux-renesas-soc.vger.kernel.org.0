Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B2523F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 09:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbfFYHHG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 03:07:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36711 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfFYHHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 03:07:06 -0400
Received: by mail-io1-f67.google.com with SMTP id h6so911692ioh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sitTKlwfe5CJiHs/Va0VW5zU7SdBgYUdb/IYHbhXWKI=;
        b=v8pmhnphWzNT6bqdIDaKwIWXqZl9YkPM+ypeqVA/EyvxnZ1GJ/n82SvJT1efxzPnHf
         svrezQICWC+aMeMr3xDjXF4n3uKRQZSgQmaMyIDNsRUu/JMxemawamvuhzWe3WxnnADa
         IGKlPr/K63AiOleZR9nK8hI1gXiWSVNpkK+ABJQtrSlyxDEXyHTIPMalQt0qWxuKmzJG
         humETII3hiM0CPWG4dfqeAL9/PHvLhoPCnao5SAxlwlYcsbgqSgTWRU/Mz4UNLICYtQJ
         VyoJHWqKqJ+Hk7a1tFk3eALYxeYPeXkEe4SjPIL7yYjlEcn5/7+UhMB3xnvzKKs7c9tV
         HCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sitTKlwfe5CJiHs/Va0VW5zU7SdBgYUdb/IYHbhXWKI=;
        b=L1jP0PuQkL63UeJ7eV2UeCO6Wzsu17TRrk19D+GevpDPY422FymyaRFiRgh9y7zQIm
         GT9YBeTBliH/Sg5FF7mnXEAehaVOSenhjUywn30JKES4NIkT7h9FQSFO1E6BAavJT7gd
         Tzpx1YjBRZOUmPN4WLy7ND4sIG+JPWl6qBYu6cEHULNP8l7PEMYQXR7CJNdmSQXgRdoB
         khnpsIer7CghrZJL9shXoJq4eQ0fnj2GD4hlH3mVMrpgZ7mZOv74VGWZYulekNnIrb4G
         Uez9mvbs02CwoeslIwl4uWwkMsUsEZ3X7oLZTxP5aJDbeW5iRxryLh3o2EOIaZlGAS4t
         vEuA==
X-Gm-Message-State: APjAAAXYEECFU9L4BmYl/SKSS1599etTQEIf9AeHuds29LKjol+H1Cm7
        009OdRktQj4U2IZaEHtluF+IA7EC6WniBh4UaB4mk3fn
X-Google-Smtp-Source: APXvYqwYtomIIwG8GjrqbsPjW97O4AdIYwh+0eHuQsGR9Kl8V1avARFHux8X0RF4BmAY4x4EoDAXwRDOHQTBoUgR/GQ=
X-Received: by 2002:a5d:80c3:: with SMTP id h3mr38675351ior.167.1561446425029;
 Tue, 25 Jun 2019 00:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190624170402.6944-1-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Jun 2019 09:06:54 +0200
Message-ID: <CAMRc=Mfc_94R-4V64vjvWriiD9JSuQ2Fkap76F8ERVZcP+AEbg@mail.gmail.com>
Subject: Re: [PATCH] i2c: add newly exported functions to the header, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Kieran Bingham <kieran@ksquared.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pon., 24 cze 2019 o 19:04 Wolfram Sang
<wsa+renesas@sang-engineering.com> napisa=C5=82(a):
>
> Nobody (including me) noticed that these functions were exported but not
> added to the header :/
>
> Fixes: 7159dbdae3c5 ("i2c: core: improve return value handling of i2c_new=
_device and i2c_new_dummy")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 5 ++---
>  include/linux/i2c.h         | 6 ++++++
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9e43508d4567..4ef44fa7e36b 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -721,7 +721,7 @@ static int i2c_dev_irq_from_resources(const struct re=
source *resources,
>   * This returns the new i2c client, which may be saved for later use wit=
h
>   * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -static struct i2c_client *
> +struct i2c_client *
>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info co=
nst *info)
>  {
>         struct i2c_client       *client;
> @@ -887,8 +887,7 @@ static struct i2c_driver dummy_driver =3D {
>   * This returns the new i2c client, which should be saved for later use =
with
>   * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -static struct i2c_client *
> -i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
> +struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter, u16=
 address)
>  {
>         struct i2c_board_info info =3D {
>                 I2C_BOARD_INFO("dummy", address),
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 1308126fc384..79f0d4fd5036 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -436,6 +436,9 @@ struct i2c_board_info {
>  extern struct i2c_client *
>  i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *in=
fo);
>
> +extern struct i2c_client *
> +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info co=
nst *info);
> +
>  /* If you don't know the exact address of an I2C device, use this varian=
t
>   * instead, which can probe for device presence in a list of possible
>   * addresses. The "probe" callback function is optional. If it is provid=
ed,
> @@ -457,6 +460,9 @@ extern int i2c_probe_func_quick_read(struct i2c_adapt=
er *, unsigned short addr);
>  extern struct i2c_client *
>  i2c_new_dummy(struct i2c_adapter *adap, u16 address);
>
> +extern struct i2c_client *
> +i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address);
> +
>  extern struct i2c_client *
>  devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, =
u16 address);
>
> --
> 2.19.1
>

Ha! How about that? :)

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
