Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FEE4A618D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 17:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbiBAQrF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 11:47:05 -0500
Received: from mail-vk1-f178.google.com ([209.85.221.178]:45664 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241238AbiBAQrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 11:47:05 -0500
Received: by mail-vk1-f178.google.com with SMTP id l14so9642755vko.12;
        Tue, 01 Feb 2022 08:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RZJ3KR+etR/Hrlh91I0/q2n0oluzt1AeQ1Y88MCWErk=;
        b=QbAgLPspUnCIeTrUVgx+Pkq/j39BE2aipheD/Dtby0t+N/rF7rrO2cAL0ErbEjsXul
         4EBAGxx4ZCd5M/FowEuWomkoEHKZJLLXV4bEksFWz7XkqBS+ZW1jv0JM2iQSOm85PkGZ
         szueYxsaRuBYuq4KNTMmWhg5UtuBJUl9iM6nKKj8ZyFSEceF8RfFz04wVGj54072j+zU
         A2LcGO/hBCLM82SC6wCIhKDXZ2X14vjU3BC15vgjgiA+JxUTjnbquJy1hwLgAtzlFmnu
         26/nwzDMVO2GDLG4N+NW2kS6ZvQFXRz2Xv4WMFE4nv+qxBkvoMb69+BwlCmTSHkrNFnl
         Bhfw==
X-Gm-Message-State: AOAM533YzFP7sk7fYXSxQ7uQa2enmK/7nZdZMRYUNVcWYUGtZn2HNTSK
        QznwBmbapzScxCmXqC1ifaABN3xEr0abIw==
X-Google-Smtp-Source: ABdhPJx3cikH412WRkFmT5OAbZx8Ej+QMjkLbWzLeL2C4vJcP50fmkCxj8tV99flG0B9Uecyu7oOtQ==
X-Received: by 2002:a05:6122:792:: with SMTP id k18mr10505884vkr.15.1643734024182;
        Tue, 01 Feb 2022 08:47:04 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id g22sm4945810vkm.3.2022.02.01.08.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 08:47:03 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p26so5975590uaa.11;
        Tue, 01 Feb 2022 08:47:03 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr9797963vsb.68.1643734023456;
 Tue, 01 Feb 2022 08:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 17:46:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com>
Message-ID: <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju, Prabhakar,

On Wed, Jan 19, 2022 at 10:52 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
> different.
>
> Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
> uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available
> on PMOD1.
>
> This patch adds support for handling the pin mapping differences by moving
> definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts

> @@ -66,11 +65,6 @@
>         status = "disabled";
>  };
>
> -&scif2 {
> -       /delete-property/ pinctrl-0;

In the meantime, one more line for pinctrl-names should be deleted.

> -       status = "disabled";
> -};
> -
>  &spi1 {
>         /delete-property/ pinctrl-0;
>         status = "disabled";

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  /*
> - * Device Tree Source for the RZ/G2L SMARC EVK common parts
> + * Device Tree Source for the RZ/G2L SMARC EVK parts
>   *
>   * Copyright (C) 2021 Renesas Electronics Corp.
>   */

Note that the above conflicts with "[PATCH v2 11/12] arm64: dts:
renesas: Add initial device tree for RZ/V2L SMARC EVK"[1], which
I had queued in renesas-devel, but dropped again due to a missing
dependency on the clock bindings include file.  In the meantime,
the updated clock bindings include file is ready.

So, which one has the highest priority: this series, or RZ/V2L?

[1] https://lore.kernel.org/all/20220110134659.30424-12-prabhakar.mahadev-lad.rj@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
