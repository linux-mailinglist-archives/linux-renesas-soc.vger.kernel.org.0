Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1706B1EF79C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 14:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgFEM1h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 08:27:37 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44631 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgFEM1g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 08:27:36 -0400
Received: by mail-oi1-f194.google.com with SMTP id x202so8027412oix.11;
        Fri, 05 Jun 2020 05:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HU1RM6XFyALR3u5LYsJyULZbc8RDM1S6If7s7JUVYl0=;
        b=SbOMpO1ZY5oAqNIcsjVuHIhinDqiSVIvW+2sV41guKniuZBQ/yUrpZYwQEKwnIsOTc
         TrA8qAuj2fmHI4gTDSXob9LIr8PNQfo4HBJF10vQ0kqemiLMEGf3Gm8ijM1qOSH1BiFr
         tkBUN1f6jt2FZWYEatueZh92IVlkoJrrEWQ7QFisje5ex5lnzOja86FBEChgbsZ4lkYL
         sk3h8dPahIQz+n4hDwFTaiKRbT22SH1BG4exbf0dranw0emHgunbBA2afSLMKJa+4Qxg
         WQY05LAJ2cAhzeWy1fa8eLGzQ//BhdeswbpXHbGkTVkFzqsSy29N5yspC+ZchwpH7/p5
         sgzA==
X-Gm-Message-State: AOAM531luX9wQ60VycjZ1iP7w7ecWSMmpTvenuGyOAyzvmlzNOBEdDXx
        CH9X2+avAIupCOwwEfaKTqFADbRWHu5sb9ZSaX0=
X-Google-Smtp-Source: ABdhPJyv9eA2nqvV1xxk2+5oDIKvkNs/bzH9H56dHKfSDxeJvNkDGGqadnhS5cy9QvwnES0yc/uWfLn979ls+iXx53g=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr1759190oia.54.1591360055179;
 Fri, 05 Jun 2020 05:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <1590586141-21006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1590586141-21006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Jun 2020 14:27:23 +0200
Message-ID: <CAMuHMdX+M+k-JRy1Ps=hRZR=mSuexSQbJ0+Cw1337uO6nak_qQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for
 camera DB
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, May 27, 2020 at 3:29 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for the camera daughter board which is connected to
> iWave's RZ/G1H Qseven carrier board. Also enable ttySC[0135] and
> ethernet1 interfaces.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts

> +&scifb1 {
> +       pinctrl-0 = <&scifb1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";

Before I queue this in renesas-devel for v5.9, I have on question:
As this port carries RTS/CTS signals, perhaps you want to add

    rts-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
    cts-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
