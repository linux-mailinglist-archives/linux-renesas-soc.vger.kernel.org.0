Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EC539FA58
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhFHPZz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:25:55 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:40943 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbhFHPZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:25:38 -0400
Received: by mail-vs1-f54.google.com with SMTP id b1so9339230vsh.7;
        Tue, 08 Jun 2021 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLtAXNvdTwsCQkdXR6zInVT34PWj9yNdT1iQLsuVGcU=;
        b=UiCRGtg3unQzaRelZEzj3xSjbjycJyTyBZ4hIlX6TZSl3jc4ZnHrIVw3nbVs0R2adQ
         Xzde7XqYwu89ob5rCcNV4VRFMf9JCFwTntZyBj/oGJn2v3dQDw/jFWCCO4MOk3zpQxLq
         aywuOGo5dJBTld7TY3ndYD4M67/aTPkurcVEDaZbP0jc2rN72SAkf1Qg2525ecWzL51r
         6yUorskANEzYS8ewicTIi3CUFTylBrdMZbe6nTc7gPXcFAHhcW5cjsxYaiNpp81xslKh
         fFY1FEoUtl6fTpuvzQG8RmFlQHW9tCnHfcvIfGfcX7nG8L1Qk7AG2rgFGr8MCjxuTee6
         /Hgw==
X-Gm-Message-State: AOAM531FCOBF40wypyacxeqizDFH1tuakBiqcYAq/xSpCCMb0QjWWt38
        bBqrum06eSLyYm1XcQ5wrNARSHM6GWZ1BZ7kEZ8=
X-Google-Smtp-Source: ABdhPJy2G4x1+3g6k8M7MspEWuFkyDUzrUpWcbY6zb6G+KomiRlPbUGVcJ3aH/+CUrzg5TDctjse8O/AD7JNA2Dmw7o=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr759222vss.18.1623165824596;
 Tue, 08 Jun 2021 08:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:23:33 +0200
Message-ID: <CAMuHMdUHEmGarOrvTjR4wzUPK+tzh0bx9Vy2o=3LthAh2BvXxQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: arm: renesas: Document Renesas
 RZ/G2UL SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/G2UL SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
