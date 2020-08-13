Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8B4243754
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgHMJKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 05:10:02 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45502 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMJKC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 05:10:02 -0400
Received: by mail-oi1-f196.google.com with SMTP id o21so4399759oie.12;
        Thu, 13 Aug 2020 02:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFMezuvSe3SKrMQIzsU7calM1hohwotMeVW3G3XCg7k=;
        b=ayUFDfCq39r0TjWZX2NssVnBkdQdB55EGRdAnmxJv7Ru34E5GypFIMqzC8/M6m0LX7
         zpUf0571fescCptcZcE8TVCOTkkdX1U05odY1gNUvZb2vk5g2hcuDni6C/x5Ig44lw+8
         pkiCi8yoBsPXJwq3Ad46Vno/Gw7sjacxWrvIEaPPf8eby+6vhpcRiNBe/U15fjwrQGFf
         JNqhVXQ+nDX5xmPxDPZdA07yYsHtkOM/TP0NpTJ7PRJOopWjLqLKle0S6l2R3hXEFssj
         33hQ5CnIE8Fdk/lyQIr4N0BnLKVvmiVaTz1rqek1xajwEi/vyOn5GcFNDuYtMB5Nm+TL
         /FtQ==
X-Gm-Message-State: AOAM530j31yiji4ZO8+utoh3EwnS6EmlnryHJfeUkbjomSs/pOSCm+4A
        NggEwgDZBiAZXSons8Fp9m7Ch23NXX6rWTpjaAM=
X-Google-Smtp-Source: ABdhPJzPc4BxFza9KeAbG78MDR54iNiEFsW2Ry0hmfIVXU1snC6Y09cLyREs/EwBnuaR3sFXtTWjL+41a4m/TmCRNl4=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr2437706oie.153.1597309801507;
 Thu, 13 Aug 2020 02:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Aug 2020 11:09:50 +0200
Message-ID: <CAMuHMdW04aC5Tusba=S4Sf4Gbu9VwgZ5Kar4HOjZaQXpF9F27Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document the RZ/G2H (R8A774E1) LVDS bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the logical change (ported to .yaml):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
