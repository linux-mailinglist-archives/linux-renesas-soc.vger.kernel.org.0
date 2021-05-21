Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE3E38C7DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbhEUN0c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:26:32 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:40557 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhEUN0b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:26:31 -0400
Received: by mail-vs1-f41.google.com with SMTP id o192so10332784vsd.7;
        Fri, 21 May 2021 06:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cN1SbxJ6jb3NaPylRh/NVFKU6vsuWdd5PlEtgCJN1oM=;
        b=SMqcu7EEbOxuwsjUSrkqdw4zO0diCjZQsTcaofj2K28qxyJdUlK117LVhIC80OsYe5
         WpWBkkuXJFYlAzmr/WREM3Q0wIOjb4FdqpDg6JOjLbuRarLUGxUsGYigGLUTZ5HG1011
         V2oCuQPj7nWUTcWBJ2crrpFso4tEn5tXJRRgK2c19QNzgyhTZh9SPnXwipIku0txSzdV
         vcwaDPg8lpEZELUdzXHHQXa+ANzJGxahYAe5ZkZEQ1Sk77bnRRHQ/P30SbC2CfEHcGvv
         OOtjFxYml7qg9pSJbAeif8xW7jB6w7Cg7rnKyowtPkw+Ykjjm41x6NuDsVwZNTbmFzOo
         +ONQ==
X-Gm-Message-State: AOAM531WtGpc2qm9uGDcIKGDLpfRMSepUMvfU+sU/ipNoOqLTS4PeJj1
        6Clhzqu2M8Q/67fuBvOkAWxyA5HOe+o02BHhElk=
X-Google-Smtp-Source: ABdhPJyo82tIL2YL3mxccwXRX3dklKLv6XZakyPXfGfT903sNbH4qrlf2CO09NEUmgIi7KAU8a6XgqMPLXrwHzJKWqg=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr10012391vsd.42.1621603507423;
 Fri, 21 May 2021 06:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:24:56 +0200
Message-ID: <CAMuHMdX=1QOtxp2Wa6bBdBLLL6QP8R8cofsO9etE-n+qBG3MtA@mail.gmail.com>
Subject: Re: [PATCH 03/16] dt-bindings: arm: renesas: Document SMARC EVK
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document Renesas SMARC EVK boards which are based on RZ/G2L (R9A07G044L)
> SoC. The SMARC EVK consists of RZ/G2L SoM module and SMARC carrier board,
> the SoM module sits on top of carrier board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -310,6 +310,9 @@ properties:
>
>        - description: RZ/G2{L,LC} (R9A07G044)
>          items:
> +          - enum:
> +              - renesas,smarc-r9a07g044l1 # SMARC EVK with single Cortex-A55
> +              - renesas,smarc-r9a07g044l2 # SMARC EVK with dual Cortex-A55
>            - enum:
>                - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
>                - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC

Likewise, do we care (at the top level) if this is a board with an SoC
die that has one or two Cortex-A55 cores enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
