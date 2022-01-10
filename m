Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20843489B9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 15:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbiAJOxt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 09:53:49 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:38648 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiAJOxs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 09:53:48 -0500
Received: by mail-ua1-f42.google.com with SMTP id h11so1950848uar.5;
        Mon, 10 Jan 2022 06:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7ygsT73AEeJBniI+HRGTxrDPMfpxlwVBvwpwThxk7o=;
        b=XDALtdjqONaxzC7Ut3O7UwjfHjYuKikKUbtwo/ct/4DpVfuHZAAjxFv5GEz9Udt+aK
         q1FcqZgVmPxt3K3/F1I4FLXheumA6pwf9TgQ0AW9nzP+tWZAMXf80/WOgCr+CwZIB5r/
         6up+q9N4dxuVUuEFZwZFI89XP9mnfmCLztJ9vMiGm0Y1mBQvrXvFG0PK71JlVdkx6J7a
         vAQO+PVCxGDVrmytrgHIN4JiBZgbLpycTHRKXRpShGoQ3FdVveYh184e2a8V3XYscuk8
         Ub2RirW4VlaQ2FPlriDQtNCnzLRoPJcibiLdrTfP+9FUh4/yyY9rkt22Zwppskp1sAd7
         uaDw==
X-Gm-Message-State: AOAM5330N3lL0dtnbFgnc6gx+D310sQMWZQI0BQn2Ifx9n5yF4WJ7ox/
        2GqlQ4hJ983ZhgxTmiVURjd4uVgfzk1RCQ==
X-Google-Smtp-Source: ABdhPJy7Va80JrZrIDGz0bVldzisKrg4oQtqjwgkgGpsDre5sXJmXDkHoDRUDY6ZZ/luadQ6Glhqfg==
X-Received: by 2002:a67:eed9:: with SMTP id o25mr2341261vsp.24.1641826427800;
        Mon, 10 Jan 2022 06:53:47 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id m8sm3825448uae.8.2022.01.10.06.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 06:53:47 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 78so8273408vkz.7;
        Mon, 10 Jan 2022 06:53:47 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr80814vka.0.1641826426943;
 Mon, 10 Jan 2022 06:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com> <20211216114305.5842-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211216114305.5842-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 15:53:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWG+onWR-UGSG9WXcTmgfjnWxA77ZUMR6dicS9=T7Mqmw@mail.gmail.com>
Message-ID: <CAMuHMdWG+onWR-UGSG9WXcTmgfjnWxA77ZUMR6dicS9=T7Mqmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for
 RZ/G2LC SMARC EVK
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Dec 16, 2021 at 12:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add basic support for RZ/G2LC SMARC EVK (based on R9A07G044C2):
> - memory
> - External input clock
> - SCIF
> - GbEthernet
> - Audio Clock
>
> It shares the same carrier board with RZ/G2L, but the pin mapping is
> different. Disable the device nodes which is not tested and
> delete the corresponding pinctrl definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Before I queue this in renesas-devel for v5.18, I have two questions:

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2LC SMARC EVK board
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044c2.dtsi"
> +#include "rzg2lc-smarc-som.dtsi"
> +#include "rzg2lc-smarc-pinfunction.dtsi"

1) So far it looks like the definitions in rzg2lc-smarc-pinfunction.dtsi
   do not really differ from those in rzg2l-smarc-pinfunction.dtsi,\
   there are just less. Will there be other differences?
2) Would it make sense to create rzg2*-smarc-som-pinfunction.dtsi
   files, too?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
