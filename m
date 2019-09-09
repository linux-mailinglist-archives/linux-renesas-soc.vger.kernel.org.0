Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7733ADE19
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 19:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbfIIRhi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 13:37:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729681AbfIIRhi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 13:37:38 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 757A32086D;
        Mon,  9 Sep 2019 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568050656;
        bh=vqIEZZbtR3NKMhw8K2e0Vtcm1cTwOYkPoQImLlns2ZI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k1LBjYzgpR9seZqTUupxanVsDT/nhMYfIm1OxpeSf82hxgwbJgEuc4UkjTU4XZDvR
         fVbV+0mBHI4elMbirrFa2L47HwTCXdwmohZfPCFj2cjuKlLdUPfYzeeEnopeC1qRVc
         SOrHTFLKJRCkhpiZzDETm1ImQxBTwaiu4bjOB9Bo=
Received: by mail-qt1-f171.google.com with SMTP id j1so4399497qth.1;
        Mon, 09 Sep 2019 10:37:36 -0700 (PDT)
X-Gm-Message-State: APjAAAWhZi0BRMd05DbQECEMN5iBmvx4tVHIZBeandcbmJV/hiElGGnW
        SfK8nRpSyq4ilmVYDOOyQgz2Suv456AHpV9+vA==
X-Google-Smtp-Source: APXvYqzq0j++n4eKVDNNNf0bccH4SIfrLsGTlPImTz1o1E3ik6uutTh8Tzcc9jloU5Wg0/wz7ku3pg4ESS64R5AL2AQ=
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr24929079qts.136.1568050655569;
 Mon, 09 Sep 2019 10:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161537.27258-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161537.27258-1-marek.vasut@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 9 Sep 2019 18:37:24 +0100
X-Gmail-Original-Message-ID: <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
Message-ID: <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
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

On Sat, Sep 7, 2019 at 5:15 PM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Rename of_empty_ranges_quirk() to of_missing_ranges_is_ok()
>     - Move comment into the of_missing_ranges_is_ok() function
>     - Make of_missing_ranges_is_ok() a bit more readable by adding
>       a variable marking the quirk_state as initialized.
>     - Reinstate check for !of_missing_ranges_is_ok() in of_translate_one()
> ---
>  drivers/of/address.c | 47 ++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 978427a9d5e6..df82ef88823f 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -473,21 +473,42 @@ static struct of_bus *of_match_bus(struct device_node *np)
>         return NULL;
>  }
>
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_missing_ranges_is_ok(struct device_node *np)
>  {
> +       /*
> +        * Normally, an absence of a "ranges" property means we are
> +        * crossing a non-translatable boundary, and thus the addresses
> +        * below the current cannot be converted to CPU physical ones.
> +        * Unfortunately, while this is very clear in the spec, it's not
> +        * what Apple understood, and they do have things like /uni-n or
> +        * /ht nodes with no "ranges" property and a lot of perfectly
> +        * useable mapped devices below them. Thus we treat the absence of
> +        * "ranges" as equivalent to an empty "ranges" property which means
> +        * a 1:1 translation at that level. It's up to the caller not to try
> +        * to translate addresses that aren't supposed to be translated in
> +        * the first place. --BenH.
> +        *
> +        * As far as we know, this damage only exists on Apple machines, so
> +        * This code is only enabled on powerpc.

You dropped Grant's name on this. Wouldn't matter too much as we can
run 'git blame', but now we have another level to trace back thru.

> +        */
> +
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* To save cycles, we cache the result for global "Mac" setting */
> -               static int quirk_state = -1;
> +               static int quirk_state_initialized;

This can be bool too.

> +               static bool quirk_state;
>
>                 /* PA-SEMI sdc DT bug */
>                 if (of_device_is_compatible(np, "1682m-sdc"))
>                         return true;
>
>                 /* Make quirk cached */
> -               if (quirk_state < 0)
> +               if (!quirk_state_initialized) {
> +                       quirk_state_initialized = 1;
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
> +               }
> +
>                 return quirk_state;
>         }
>         return false;
> @@ -502,25 +523,9 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>         int rone;
>         u64 offset = OF_BAD_ADDR;
>
> -       /*
> -        * Normally, an absence of a "ranges" property means we are
> -        * crossing a non-translatable boundary, and thus the addresses
> -        * below the current cannot be converted to CPU physical ones.
> -        * Unfortunately, while this is very clear in the spec, it's not
> -        * what Apple understood, and they do have things like /uni-n or
> -        * /ht nodes with no "ranges" property and a lot of perfectly
> -        * useable mapped devices below them. Thus we treat the absence of
> -        * "ranges" as equivalent to an empty "ranges" property which means
> -        * a 1:1 translation at that level. It's up to the caller not to try
> -        * to translate addresses that aren't supposed to be translated in
> -        * the first place. --BenH.
> -        *
> -        * As far as we know, this damage only exists on Apple machines, so
> -        * This code is only enabled on powerpc. --gcl
> -        */
>         ranges = of_get_property(parent, rprop, &rlen);
> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -               pr_debug("no ranges; cannot translate\n");
> +       if (ranges == NULL && !of_missing_ranges_is_ok(parent)) {
> +               pr_err("no ranges; cannot translate\n");
>                 return 1;
>         }
>         if (ranges == NULL || rlen == 0) {
> --
> 2.23.0.rc1
>
