Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DCE41915E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 11:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhI0JQC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 05:16:02 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:34380 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbhI0JQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 05:16:01 -0400
Received: by mail-vk1-f176.google.com with SMTP id z202so6672083vkd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Sep 2021 02:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zOsifX0XNMCBW4xgm007TYjSIsCcKXZ8qcv7DNOmJzE=;
        b=lIBiAHiCG2KrQKz+B/9BjkkYMEpaj2h5lDE2k+p+1/mqwdAyapZ2lHQVXRulE8HguE
         rBpEksVOxXeOb5wRuT+ntvz5n7O1s5zEpRCQ3gdMsCa5grxobbZBU8ac7RybshVA6DW8
         1Dlm107hiaf3ww5SOPpm6SP1JPoXrBtwx6lxSXUW7oEf/wT8a6bSO1Yeeaqd6tQyxabu
         TcNVoQi2GabT8leJoMPsG1tXnx1pFt/a8Sp3gQjgre9i8iFvkjptEQ9RWG9Lpgjd1+gs
         X5mKUcLwckebj8umJz9SgdxqJbrKSBcrGbgIcdPiRFbDKvaRm0dfl0rkfDDEZqvZMUCc
         pGTQ==
X-Gm-Message-State: AOAM530NO64w754lNSsBCqClemlnw6ou2L785oftNL4aNreCYHO1S+kM
        xPLBnnj68PF6SlGM1I7Sx1z22C65FHlUoSwHj/8=
X-Google-Smtp-Source: ABdhPJyObj8EHIr+6MpKxmUK16FNlhoCFaG42KOGzWCGHmV3vURb+wvixxZhGeE9zZMRp2Nn35cLqrBRrJ8m0SXH1ao=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr14385207vky.26.1632734063717;
 Mon, 27 Sep 2021 02:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 11:14:12 +0200
Message-ID: <CAMuHMdWN-D_MOJC_ec1L_9fSkhm+=jtyO5uBhLWKqe1ds3sjzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: defconfig: Enable SND_SOC_WM8978
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 11:39 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> WM8978 audio CODEC is supported on RZ/G2L SMARC EVK.
> Enable it on arm64 defconfig as module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
