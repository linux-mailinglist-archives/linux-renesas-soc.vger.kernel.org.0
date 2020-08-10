Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF502403A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgHJIx3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 04:53:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36791 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJIx2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 04:53:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id x24so6711887otp.3;
        Mon, 10 Aug 2020 01:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xmzp7fk+vIO5KhMWu8O9IbD4bDIyRfJdP7iP0tIOvno=;
        b=mOGdM88vJfUe0IjTNtwfTexNlHHBK7uHOmlybBGz/g4R6k9oPggbECbVtj36holqsR
         k7QT3oL0xY024giKb/YQz19mQwhXMijoQ3jCCiQriglgjCMnq+A01BCHpFFV6TBrpOM5
         YRQgmMjrTYZW1FFfUHDs42CoQeDXilaYx224qLxDWVpv1DOzxtbUB5r3kacDHqczXZ5F
         7oz5GoV0wVaqT4/AWscfe5H191gRSDBawxGDhGcamMlOUBwqjVrxqITyC2m1fSInP5Q3
         MR96+3GP7yrI+8brGHXae4KWNTutrLX0DAA39eHpsiTdzMXSSDhjnb5EFLaMQTiThzMx
         2Xcw==
X-Gm-Message-State: AOAM530BcwnSm6BBTRwh6JMSFf1uC8LvedlajFTy+OeRn7HwWCCWwMQ0
        4sJILOivXhjQ0LYCA2ktr0Z40YJWrvtX9CBaE/c=
X-Google-Smtp-Source: ABdhPJzSt76d0ygTKVbbokZXs04MvcLY5RinH8EKwMctMbjh/IruKDAr8twMrh9yrF5whd8fFKWBPfGLT5IiuTy66Aw=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr3284otn.250.1597049607701;
 Mon, 10 Aug 2020 01:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com> <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
In-Reply-To: <CA+V-a8snp3EUFRuMHLxVhnc=zPq-LaQL8du7LgGcswi+6NthLQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 10:53:16 +0200
Message-ID: <CAMuHMdVEqc1JVeZrLdDfRo1EwyzaVq-ORStO39NyTqwwkh8YLQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Fri, Aug 7, 2020 at 10:22 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Aug 7, 2020 at 8:48 PM Sergei Shtylyov
> <sergei.shtylyov@gmail.com> wrote:
> > On 8/7/20 8:49 PM, Lad Prabhakar wrote:
> > > Add du node to r8a7742 SoC DT. Boards that want to enable the DU
> >
> >   Both "du" and "DU" on a single line? :-)
> >
> Argh my bad.

No worries, I can replace the former one by "Display Unit (DU)" while
applying.

> > > need to specify the output topology.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
