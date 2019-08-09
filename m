Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBFC8861D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 00:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfHIWe7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 18:34:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfHIWe7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 18:34:59 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 091DD218BE;
        Fri,  9 Aug 2019 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565390098;
        bh=63h+WNre9YQ91vhQdUSrJEGDG63V2dteAn2444A1ohI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OEin0ETOfBu0l8QJnZsDkSE0QwVCVNfwFiafp1UtCcHJBQd9O8yyv7gcfa9P8+6a6
         YOXg2lJtrS9bxP0z/v8R/LSIGjzbHE80DHxY1dMcKRM0f4H/3SzkxaEep9CWhYqYGu
         g7X5MNhUy1XssHh0w4DQAGekHVe/K+kWuipPNgJc=
Received: by mail-qk1-f169.google.com with SMTP id s145so72913448qke.7;
        Fri, 09 Aug 2019 15:34:57 -0700 (PDT)
X-Gm-Message-State: APjAAAWCvX5MglAyCNFpR30ahaRsrrXcAcI8v9KxE0ajOjDAfOnL1vgS
        b+DeiEKpyvNtpOWLp1BgnkSa29wQzghRSJlsKQ==
X-Google-Smtp-Source: APXvYqy7pA1ssspQpP07TJLYeFH4TeLAYGnMjiVHA3c2ol55j5NOO6wJlnI0Y9JTEpnWdpxuoN6j/rvKKcuaO7v75dI=
X-Received: by 2002:a37:6944:: with SMTP id e65mr19065297qkc.119.1565390097227;
 Fri, 09 Aug 2019 15:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190809173321.19944-1-marek.vasut@gmail.com>
In-Reply-To: <20190809173321.19944-1-marek.vasut@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 9 Aug 2019 16:34:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
Message-ID: <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
To:     =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well.

It never returns a negative. The negative is used as an uninitialized
flag. Note quirk_state is static.

> Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  drivers/of/address.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index b492176c0572..ae2819e148b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>         return NULL;
>  }
>
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_empty_ranges_quirk(struct device_node *np)
>  {
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* To save cycles, we cache the result for global "Mac" setting */
> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
> -               return quirk_state;
> +               if (quirk_state > 0)
> +                       return true;
>         }
>         return false;
>  }
> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>          * This code is only enabled on powerpc. --gcl
>          */
>         ranges = of_get_property(parent, rprop, &rlen);
> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -               pr_debug("no ranges; cannot translate\n");
> +       if (ranges == NULL && of_empty_ranges_quirk(parent)) {
> +               pr_err("no ranges; cannot translate\n");

This is wrong. If you have NULL ranges and not the quirk, then no
ranges is an error. IOW, if you are getting an error here, you have an
error in your DT (because I assume you are not working on a PASemi or
Apple system).

Rob
