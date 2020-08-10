Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA466240302
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 09:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgHJHym (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 03:54:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46341 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJHyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 03:54:41 -0400
Received: by mail-oi1-f193.google.com with SMTP id v13so8092260oiv.13;
        Mon, 10 Aug 2020 00:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVxB3479AF19vVgQTNpUIFHlH9OwsA2eid0MPwV0Nhs=;
        b=uOOdtoxDiLFZQCdhS4OTh8UtwCwRULHU4LBvH+qrA9CXvck/f8u2QS3d+5/u/pp2pb
         Lh3Z7TwSvlOoCaGf+wvLY7Nea7P7b2WWd2XhGyB0OUUJE5xbBINPGNmiPjllqaReYmMu
         GgqDbTSPL5yjxd1fxwTJ3mOgMP1zvkJlkICJiAjeASOBw4Ki8//pLyxpHU15lMH+Tf3E
         NzLNu6BJw/Y8kEloVA33rUHPw0ElBJuTmqiTy/ApuZn4+eAS1KXTG5p5zWud7pOkkk7y
         87PIskqkqXNLJOEnnKIwygU0e2lLL34kc+ktTloJ131oRf6qfNlr3NkIw/B64vFHnr9A
         h0KQ==
X-Gm-Message-State: AOAM530XJ+1UWS5Bkdo/5XxaLaeKi0eAvv/V02nz/3dZAPKSMww1NhHg
        BKpOCsb1LV8mbb8tJMZ+5L5O6XFCY0chZnAQ3Q0=
X-Google-Smtp-Source: ABdhPJxgFdidTVAFODckZ2RCZ+KmWC/yJB0+ysb0XhnacXp3SOkRfMahcG9B60dWR73a+LDZb0z3h1zBZ56b1i1le38=
X-Received: by 2002:aca:adc4:: with SMTP id w187mr20036329oie.153.1597046080801;
 Mon, 10 Aug 2020 00:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 09:54:29 +0200
Message-ID: <CAMuHMdXSdtm02jroh0EV210jnVCnVc6RO+bk8x7z_mBWa741yQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Sort compatible
 string in increasing number of the SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
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

On Sun, Aug 9, 2020 at 9:35 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Sort the items in the compatible string list in increasing number of SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

As my previous tag was conditional on fixing the sort order:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
