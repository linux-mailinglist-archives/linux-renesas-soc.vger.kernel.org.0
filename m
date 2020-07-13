Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB2B21D4CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbgGMLXx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:23:53 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33613 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgGMLXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:23:53 -0400
Received: by mail-oi1-f196.google.com with SMTP id k22so10702430oib.0;
        Mon, 13 Jul 2020 04:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0c5/AlvHBtEdtRei7U/gPNfoy0qpSsHEDnU5efW7LQ=;
        b=QAX++xtorYkssSzDni1/eDKuz98dXoz6jbPhLTY/ck/D97Qlg0Xo9aFrgL/ftHyBYO
         5oP3EmvfJBEooI+8rM4ca6xmSNR9Ml7TlswbUQuDTAoCqsGyiVLFgwyhoIz3zkQBUOaf
         QxAe8NQTL76DYvrYXv40LZXoPzn5IlTSedRrUr4F107hlGOuahX5SA8B5jw1YKeiTm4+
         ytnYHbHFDqnd188BaEH2tUDj7Rc+7yGE4vvJ6TVKxA1+4UTmWQwMNw/+qHCN9q02puMe
         OaE3h7SIGo5zYQOsVfvOFaglzEoNsk6HlAqyujjDf8N4akpvgfw1DoGKKhnr7tdqbEQT
         3VwQ==
X-Gm-Message-State: AOAM530by5+4NxKZcXt1jyzNyFqlXJ4u6PLREKJUsMiri7sR2wI1z/Uz
        eqagbcU4Gv3/ICI+hDHrDxz3HtrJPvGibrnKw3Q=
X-Google-Smtp-Source: ABdhPJxpNlgDeDuBZWvoF2yBqvFfeg9xo/UBJLiMa1zcD4QIP4g207kFYL2Jsaai2+C1jcjtJtL3Ks7vlyCzIuxIFdo=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr13054270oib.148.1594639432252;
 Mon, 13 Jul 2020 04:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 13:23:41 +0200
Message-ID: <CAMuHMdUoQxQ90uD0D4jV695S7weN5whZV=ypq7pUOW+q3DHW_g@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: serial: renesas,scif: Document r8a774e1 bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> RZ/G2H (R8A774E1) SoC also has the R-Car gen3 compatible SCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
