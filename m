Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82FC1F1AF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 16:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgFHO1o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 10:27:44 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45769 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgFHO1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 10:27:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id m2so13756726otr.12;
        Mon, 08 Jun 2020 07:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXkSZNHi/WgIFB2sRa6DAx0hWylWs93z0GvndY1AAZs=;
        b=rvlE251EcZtMNJsFOuM3VOfmXPvbgMbN6ZI906LhX4VQTWlcEs1Ew8fQ7nPNzu2qjr
         j7actgTCI3/eJYd1j6zkpIqQ69INraX2p8dgth9L7n19mESEi2ZuUvpe0s9e51znz9QT
         MnPToWl1sw/FT+8WbR/n1/EUu4HtICPM5GjBGhTM7S7wdeLVJBMoJ42eoYTZq6RvJhV1
         QKgX+kigY0PiAMLlc0+UIbixPnueNAdxwWpr8GG3Gz/Wgezqnl2cXYrwFdaO8TQLt6Bp
         dc05ebg+2Z3Bpj7wWKGOP+dseKdTWXRinvK+NkIaHuTfX+lc/wrRvuq/3S9+DTZ+0WIH
         YbKQ==
X-Gm-Message-State: AOAM533KUCT+O7ZEJA2oUmA6BTZDa80patA50dVIGnc5n+jhMKS1dDdu
        sRqqRysUusJw/XdkSEfoir1X+4jsAYjZSyGhyPw=
X-Google-Smtp-Source: ABdhPJxNgjxje+XshY61E4Thz/w6k4S3aOlbBBI4Xqo+OMNuRMsgD44RP+i7RwXHJABQLDAYJVkZB3AufOf/JKhLqYI=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr17972661otp.250.1591626461597;
 Mon, 08 Jun 2020 07:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jun 2020 16:27:30 +0200
Message-ID: <CAMuHMdU35fvy2TM+u=Zu3-4aVnzOC1Sxophu8WaExS7unVH1fg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thanks for your patch!

On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Separate out Rev.2.0 specific hardware changes into
> hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> by all the variants for RZ/G2M[N] boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> + * parts
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>

What about adding

    #include "hihope-common.dtsi"

here?
Then the *rev2.dts files have to include only "hihope-common-rev2.dtsi",
and get "hihope-common.dtsi" for free?

The same is true for the rev4.dtsi and the rev4.dts files.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
