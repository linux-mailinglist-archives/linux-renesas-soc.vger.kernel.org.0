Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88A13EB3A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 11:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239327AbhHMJzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 05:55:55 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:37431 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238741AbhHMJzv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 05:55:51 -0400
Received: by mail-ua1-f44.google.com with SMTP id 67so4171225uaq.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 02:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FG6+n9faQJ8zUMY2x+YbAjuI50F3IntuI53soFI+w68=;
        b=qPWPWVxTDA7Ie8azgok5hhIXKHDlyRlAbY99Pe3qFKKliI2plKW9UI4dLl8ikaq0Lg
         1XHViM687FmjuQhZbpb4AMsISR23jGYMbPhJ+V+duop2k0FWRDWv0/gmXjPt1sXSn3sw
         PJSjWe6WIj5fRpP0IvhVZx6IPUgIRrAlfxSexF3/R1Q1XIf1NkrQiu5w3gmQm4UICsWa
         HWxGQ3darHCPjspP21mpM/vlmrwG+MMsHFIXlFctvuNZjj/b4rOR8TPClwDPi1I3X0jk
         LSIsHUmF/z8aXLrVZQ/KF7CNr4eB5Xf+7OhaJlGqWvwzzGBEHzSLuB34UT+MqgFEdpDT
         fizA==
X-Gm-Message-State: AOAM5305erzBkA5WszHZCHgtOzPCkkI1VwOpvO6GwmHH4JFPZCM7zUIO
        R1zq0a4rlQcl0DWb/1wJ0k4yvKpiz/OKatu8WdU=
X-Google-Smtp-Source: ABdhPJxZJ4afdAaKuLZz7YvoI2zSB/6cg5kwoTk3tC64vT3nc422Lh+byTCIHb9qnOF6RTljbhg3b7+BUsAOGGAjIj8=
X-Received: by 2002:ab0:6887:: with SMTP id t7mr707504uar.114.1628848524873;
 Fri, 13 Aug 2021 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
 <20210611165624.30749-6-biju.das.jz@bp.renesas.com> <CAMuHMdV5FE24t__Xa0d5uTA2FPTitn69tDPFqQhpRGz3uvrckg@mail.gmail.com>
In-Reply-To: <CAMuHMdV5FE24t__Xa0d5uTA2FPTitn69tDPFqQhpRGz3uvrckg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Aug 2021 11:55:12 +0200
Message-ID: <CAMuHMdX_=2t5xoybwgmTFqfkDRhq7BPVoU9qC=CB88qrJpoPSA@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable RIIC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 14, 2021 at 2:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Enable RIIC driver support for Renesas RZ/G2L based platforms.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.15.

Given we don't have any i2c users yet in the RZ/G2L board DTS files,
I'm postponing this to v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
