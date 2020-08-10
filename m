Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDF824036A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 10:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgHJI2J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 04:28:09 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33896 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJI2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 04:28:09 -0400
Received: by mail-ot1-f66.google.com with SMTP id k12so6672119otr.1;
        Mon, 10 Aug 2020 01:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eh3W9EtO5pIjBRNzAhGPiTVpKKJqj3aKGwA7TcnbRiM=;
        b=mWIkmi0bV9K/MRN9MXl/Ry//uj+N0M4SGoS7YQCflh+c2HxTpcPjscvKtiiEVPAieR
         TQdVv/ZKyjmLgpKM1jz9pLj3VM03MXpccQ61lKuhcmvWsjQOD7+8Or5OBsD1s6wMtJoc
         /6mONJ/GnjdrUXFQOpoFKOl+m7s4t0F4FnwQRLJ3BzSRXU4bnY5XqJAk0UZvjczqmOmV
         7X3kwPsHjsT37COCEwjgq8NsoxJTqv9lvXW5iUEnJqEkNgKCs3mRdmVPOohkTdlrZ2d0
         ZFzLV3TSHKPPdK5MZJNFybZHMazBbYYNDEHsX4Iy5/OeYtKggJD7leYlrLZZ2QRlDOaQ
         caqw==
X-Gm-Message-State: AOAM531EkZ+5++bowEaTMRayMJmHqpZCII0YTwZzDFma2LsUfOXRtqUa
        TtBbwOGqV7loDIo3bpxOWjmN8nPXcQTUNI6vJqs=
X-Google-Smtp-Source: ABdhPJxQulcE7/JusbTYnqwHYnQVJLDRBysRxEAhgyWpRidsDiU/4VQm001qLWGLopsYWkEwjeMlWoNhcMBoGoX0YDc=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr21101979ote.107.1597048088183;
 Mon, 10 Aug 2020 01:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808205543.GL6186@pendragon.ideasonboard.com> <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
In-Reply-To: <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 10:27:57 +0200
Message-ID: <CAMuHMdXBR1t8gCfEiE88QvAaJ6diohmZnhOZxLYES6n5cSxYpg@mail.gmail.com>
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Aug 9, 2020 at 11:44 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Sat, Aug 8, 2020 at 9:55 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> > > This patch series adds support for DU and LVDS to r8a7742
> > > SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> > >
> > > This patch series applies on top of [1].
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> >
> > The driver changes will need to go through the DRM/KMS tree, and I'd
> > recommend the DT binding changes to go the same route as well. I can
> > handle the rebase when applying, and once the bindings get accept, you
> > can ask Geert to upstream the last 3 patchs. Would that work for you ?
> >
> I'm OK with it as long as Geert is happy. (Fyi I still have bunch of
> patches for G1H)

I'm fine with that.  BTW, I use an R-b from Laurent on the DT bindings
as the acceptance criterium, so you're good.

> > > Lad Prabhakar (7):
> > >   dt-bindings: display: renesas,du: Document the r8a7742 bindings
> > >   drm: rcar-du: Add r8a7742 support
> > >   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
> > >   drm: rcar-du: lvds: Add r8a7742 support
> > >   ARM: dts: r8a7742: Add DU support
> > >   ARM: dts: r8a7742: Add LVDS support
> > >   ARM: dts: r8a7742-iwg21d-q7: Add LCD support

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
