Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A03414F50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 19:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhIVRmZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 13:42:25 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:35695 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236815AbhIVRmX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 13:42:23 -0400
Received: by mail-ua1-f49.google.com with SMTP id d4so2398801uak.2;
        Wed, 22 Sep 2021 10:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tvtYY0msHjnoC+I/Lu672obi3mQrOmz8sSMZ/dhCgcM=;
        b=FCj3Efls9Q8dLA0QxErM9Xb0i8ZbUqG4jBD8i+gelfJds8YrhELeqZI0ykoHZ7v1/S
         Oozm5Fdg11HkPOogmdkgt/DSmslqSHtKY1pgKPo/llEAANBkFk13MarrmPTuuR7SKthK
         AuTk+V9SUwOAB/ppRxu50guRUgE1NoQBlyX8Edzi93O55+3yTb9IzvL1MuI09wZ1EUR4
         YYwynGoA3KqySXSunwEkeFxWeYIL+8jvVUyym8SBS6i23gbvK8ymqwGDOVXdqIiCshN3
         tik9C6ietbyaqBHEP2ff6NYTITYdQlTgcj0bFPso/WR4bfpgDkYlDQyVh6yLbkBwFia4
         Cvew==
X-Gm-Message-State: AOAM533+WbE0M04biw5o9JBC5PSeK59DBSTCVKcKlcDGqNOcPqi+KPZF
        1TnfFWgzWGXsWlplSlT8DtFqhbj5KVMKiHeJ1WQ=
X-Google-Smtp-Source: ABdhPJzd6iDf31R8aoIZCqnSwnmWaUJ7hUGbaC3Wu5rohHlUdjjVsD/K6aFxIKOAYsQD2BBiS+LwneCYtSPWWyKiJjw=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr635558ual.122.1632332452990;
 Wed, 22 Sep 2021 10:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com> <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
 <YUqGWa6q+wYq2vAt@pendragon.ideasonboard.com> <CAMuHMdXRhOmj4upp6Zsn3yb5bRdpg8hrgATWJCA6bSdvD=e1qw@mail.gmail.com>
 <YUrkiDnlDYabSi9T@pendragon.ideasonboard.com>
In-Reply-To: <YUrkiDnlDYabSi9T@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Sep 2021 19:40:41 +0200
Message-ID: <CAMuHMdUKsSA8_BD9KksVKAcOYdqTLhu_Wm=rwD3tfb=yceh7EQ@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add binding
 for R-Car MIPI DSI/CSI-2 TX
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Sep 22, 2021 at 10:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Sep 22, 2021 at 08:43:57AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Sep 22, 2021 at 3:27 AM Laurent Pinchart wrote:
> > > On Tue, Sep 21, 2021 at 05:53:52PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart wrote:
> > > > > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > > > > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > > > > @@ -0,0 +1,118 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > > > > +
> > > > > +maintainers:
> > > > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > +
> > > > > +description: |
> > > > > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > > > > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > > > > +  to four data lanes.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: Functional clock
> > > > > +      - description: DSI (and CSI-2) functional clock
> > > > > +      - description: PLL reference clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: fck
> > > > > +      - const: dsi
> > > > > +      - const: pll
> > > >
> > > > No interrupts?
> > > > The hardware manual says there are 9 interrupts.
> > >
> > > Who comes up with such insanely high numbers of interrupts ? :-)
> > >
> > > What the hardware manual doesn't document is how interrupts are mapped.
> > > There's indeed 9 of them, and there are 9 interrupt sources, but that's
> > > all we know. I can easily add a
> > >
> > >   interrupts:
> > >     maxItems: 9
> > >
> > > but I can add interrupt names without additional information. It may be
> > > possible to deduce some of the interrupt mappings from experiments, but
> > > not all of them. What do you think would be a good way forward ? Leave
> > > the interrupts out for now as we don't have the information ? Only list
> > > the interrupts but not their names ? Something else ?
> >
> > I think what we did in the past is not list the interrupts at all.
> > They can be added once we receive more documentation.
>
> Sounds good to me, as that's what this patch does already ;-) A R-b or
> A-b tag is welcome.

Your wish is my command...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
