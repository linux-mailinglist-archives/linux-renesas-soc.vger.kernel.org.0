Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FA32F4C3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbhAMN3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:29:55 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:42310 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbhAMN3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:29:55 -0500
Received: by mail-oi1-f181.google.com with SMTP id l200so2046805oig.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FGfirMz1ot7VWmfUO08H7UGVwf3tOsejNzbcGck7aT8=;
        b=f3qlAE1uhOjuQpkJNGcxM5FWhMaTcnsv1lGJSWinYvVfCpFjMtIaMtj3Cueil0jem+
         3QHY2O86s2cELJjWQSMG891/VM6iIuAh3AQ0s7zke9MycH+dtwbTNY0GZbFbvvJj3pub
         Eg0MYELHT8rLrjY5AGU4keoo+0IIE5Dfv+J80dX9+QaBiTdb4vdZ+wGnWGO+GqtMzgN5
         9bWy+WmDM4uXBTUx7UDLmtQWkFyCPHWB+U2L17burxyUI9SRx9IVCH3N/uKCoyX0qcHf
         aj4v/q7oCpvUICkS048zj5ye/dVgu/tKJA/1s7beFg+wamHbadjvh0fg2yegz7d/ez7f
         uD7g==
X-Gm-Message-State: AOAM533GsCTaSzUnPkdpUSHwpT/AyynKVmYvrPt/V28yYVhkFaI4ztPb
        FCfdyVgVF1Skg4CPJWJdUlWwrKVmuLm7727rnQe8RJAcMsA=
X-Google-Smtp-Source: ABdhPJwLT2OLwaioa0jd4d3i4Zf4pvp6bxp8FXDiQa69UbqMAjYbkWk2N65fkRwCaLkiRLH4xKDnxP10wwZsqPg/MEE=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr1188675oia.54.1610544554723;
 Wed, 13 Jan 2021 05:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20210112165912.30876-1-uli+renesas@fpond.eu> <20210112165912.30876-3-uli+renesas@fpond.eu>
In-Reply-To: <20210112165912.30876-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:29:03 +0100
Message-ID: <CAMuHMdXNTK=8d++J0DgrSZ+YETj77p6TpKONHc15QNUZ7wx1GA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] pinctrl: renesas: add I/O voltage level flag
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds config macros describing the voltage levels available on
> a pin. The current default (3.3V/1.8V) maps to zero to avoid having to
> change existing PFC implementations.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -702,6 +708,9 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
>
>                 case PIN_CONFIG_POWER_SOURCE: {
>                         unsigned int mV = pinconf_to_config_argument(configs[i]);
> +                       int idx = sh_pfc_get_pin_index(pfc, _pin);
> +                       const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
> +                       int lower_voltage;

unsigned int

>                         u32 pocctrl, val;
>                         int bit;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.12, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
