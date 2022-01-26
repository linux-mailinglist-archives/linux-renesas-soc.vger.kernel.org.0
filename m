Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A8E49C976
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 13:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241174AbiAZMTK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 07:19:10 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:38608 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiAZMTJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 07:19:09 -0500
Received: by mail-vk1-f175.google.com with SMTP id l196so11323118vki.5;
        Wed, 26 Jan 2022 04:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vKpNvDlon/l4pHsf9dVUBAkYplk9e3cJv6MxL4gM+I=;
        b=lJfi2j/RG5Nr+LIiQzo7U/1fDIC7pkaPXA+DboWV8n+mwT3DxUIysCP8yy3MG78c0H
         LlgDY5+R0UnVM0PpvIOYIyY96pZYC5zIFIn5q+FnDBtGVSboiyjpDC9rMqk+oj59rJkM
         IVfAtJGlkdtq4LtZSAbJPaUv1ZQWwbdxKHTS+ehhBSNWmGdk4ihQ9i5WauLeSA5fR7kc
         XQHLzrqGG2E3EtTULdHDYthDf8KbWig2/CidhcuEk8c23sH0vNlMnz7Z7ztMMZfnelau
         h2BOgvc7memWNW+GpBcuViGl3sIaayOCMhvrIEzJq2+WzE8rZT8IOKJlgsiT/kxlMunn
         Rd+w==
X-Gm-Message-State: AOAM5308xzerdH4paBIpRL4jj49jD42DmCAPYkbWHfxvViuB+txo60uv
        Co8Ii2qiV5aYrdEiJGNcbh/ZIX/Xk+6Uyh+2
X-Google-Smtp-Source: ABdhPJycaCYSN0DLq3ojf5hjc3yAWLgt6A/0yb/5Y4lNoTm+esZyGDmLZ9g+7vwcQ+Z/gKG330tKYg==
X-Received: by 2002:a1f:7f0b:: with SMTP id o11mr9150327vki.25.1643199548770;
        Wed, 26 Jan 2022 04:19:08 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id w188sm3674802vsb.32.2022.01.26.04.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 04:19:08 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id y4so43032091uad.1;
        Wed, 26 Jan 2022 04:19:07 -0800 (PST)
X-Received: by 2002:ab0:2991:: with SMTP id u17mr4965487uap.89.1643199547584;
 Wed, 26 Jan 2022 04:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com> <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jan 2022 13:18:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
Message-ID: <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> boards as an optional external panel. It is described in the
> arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> board device trees, with other minor modifications, to enable the panel.
>
> This is however not how external components should be modelled. Instead
> of modifying the board device tree to enable the panel, it should be
> compiled as a DT overlay, to be loaded by the boot loader.
>
> Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> declaring a panel node only, without hardcoding its path. Overlay
> sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
>
> This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> is currently unused. As overlay support for this panel has only been
> tested with Gen3 hardware, and Gen2 support will require more
> development, move the file to arch/arm64/boot/dts/renesas/.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi

> - * Copyright (C) 2014 Renesas Electronics Corp.

> +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi

> + * Copyright (C) 2021 Renesas Electronics Corp.

Shouldn't you keep the year? Not much has changed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
