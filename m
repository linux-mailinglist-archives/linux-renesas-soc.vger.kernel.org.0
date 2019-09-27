Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61718C0549
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 14:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfI0MiR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 08:38:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38415 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfI0MiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 08:38:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id e11so2088820otl.5;
        Fri, 27 Sep 2019 05:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrtLlc4EAd9C0LDZUS2MwxsP3sVYIR69wiCz9aRBfmc=;
        b=ahEnEb9xaLH37IWp+kzMfbdq26ki0gz9jrLsrYNt3rzA7IQhVdAnoEuuCPP/vcK1uP
         c26ZVKIk9NOO7L5h/D1b3YYCAUcM1hM/hhqQAinyLXj/M299FAWnYGcb2RqKkleF2kHK
         9cwnlvJpI2gMcyYhG859n8QBlTiwJ1zptCQxmi0xG0YG3Xzf3AeELxe7onKAUSRmrl60
         VBOBHGIKb6tgWx0fU89u855PAo+Tkbdt5Wq0omkE22SxPNE8uWxS8jC61r22sXoz4OCG
         cSxNXN0GGDnyiOC2oQ8SG5Mt9U9op4WuBJkZ+m7s9Mwp5YG7rmAuIXvoaymgp0+X182r
         g21w==
X-Gm-Message-State: APjAAAXdRCRqfLlN5sk+DlB301LBdbRVet+glQ+joXMV3rocJbT2+aS5
        RyHgtjAIjlSyf8FT0vi3sMlw8Vrhib4Pc5QYiPA=
X-Google-Smtp-Source: APXvYqy3LTzpbmpruzojcCljMIf+BYanzCbxfXlGJbILiUVjLDxJUJVDxiL10B6utP0X81xcMR1BWe6Ha6bFkR6o8i0=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr3078604otj.297.1569587896485;
 Fri, 27 Sep 2019 05:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com> <1568725530-55241-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1568725530-55241-5-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 14:38:05 +0200
Message-ID: <CAMuHMdVNfurC1MATNePq8Veefyxgc_HPz4wYA++h_+7145UPHA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Add HiHope RZ/G2N main board support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 17, 2019 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the HiHope RZ/G2N main board:
>   - Memory,
>   - Main crystal,
>   - Serial console
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One question below...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2N main board
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a774b1.dtsi"
> +#include "hihope-common.dtsi"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2N main board based on r8a774b1";
> +       compatible = "hoperun,hihope-rzg2n", "renesas,r8a774b1";
> +
> +       memory@48000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */
> +               reg = <0x0 0x48000000 0x0 0x78000000>;
> +       };
> +
> +       memory@480000000 {
> +               device_type = "memory";
> +               reg = <0x4 0x80000000 0x0 0x80000000>;
> +       };
> +};

So both the HiHope RZ/G2M and RZ/G2N boards have 4 GiB of RAM, while
the latter has a narrower memory bus, so it must be wired differently?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
