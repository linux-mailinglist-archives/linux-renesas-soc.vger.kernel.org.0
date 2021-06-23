Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2FF3B1AD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFWNOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:14:41 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:41479 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWNOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:14:36 -0400
Received: by mail-vs1-f48.google.com with SMTP id c26so1393940vso.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 06:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7rFRIRYVnAhcIWsXCCdA/bizkATSrGafe3L9HwAMN8=;
        b=iK3DWmev8TWYNpj2vuykibibnhGB29R71kxAsjMhWGIank0uDb5AZkt5oqquB9IDoL
         Fd9/JnmXnpYKLbbUDaxXDqs7hK26nhKRhgurV957VCt39KgZCN2zCkC3vzedTGZkPdyK
         8Q59Y2XCuAXENRC/xx1JKE33vdDrQDMwvuVXu8ia0mJlAVMTxqwWbgmZGv5ZvNabDoQd
         JxTPLejugqzquEgdf3iNItrvckgFVaWr6tKcOEcLiZZLcRmTX6j8+a2gUYOCaf1cKWZY
         pzk3on7FA5Q97pgZXPA2zJJDmS7JnIYGx+QkoX/d4aFjxggTm6KJ+Bs32X8P6NPM65mO
         qU6Q==
X-Gm-Message-State: AOAM532hT0KyKffq92HgDsedzoJfMH6bkkncQz0EJG0NBAHKHIBP8Cp0
        r1u5YQKjYrV5bH/wKxhp4gq3IcerbjmcXSWJXSg=
X-Google-Smtp-Source: ABdhPJzZI9MYYf2tOdqEUy8y9Qb/m+yl7lTQXg4ghKtEi+OUGC91Wm77OztA/Kq7tA1r9cQGp0HQl5n1FJ4ztveyudM=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr28617833vsp.3.1624453937586;
 Wed, 23 Jun 2021 06:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210623034656.10316-2-laurent.pinchart+renesas@ideasonboard.com> <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
In-Reply-To: <bc508b07-5028-b8e9-b0ac-994c9deca74d@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 15:12:06 +0200
Message-ID: <CAMuHMdUD-GsVCyAsNNdK1D-zoDiRAoKgmU+jXE6UT_uCOrc=hA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] dt-bindings: display: bridge: Add binding for
 R-Car MIPI DSI/CSI-2 TX
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 23, 2021 at 11:06 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 23/06/2021 04:46, Laurent Pinchart wrote:
> > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
> >  1 file changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > new file mode 100644
> > index 000000000000..7e1b606a65ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > +  to four data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r8a779a0-dsi-csi2-tx # for V3U
>
> Only a potential nit ...
>
> Is it worth moving the "# for V3U" over a bit to allow for extended
> compatibles in the future without re-aligning the table?
>
> Looks like 37 chars before it currently, it could at least move to
> position 40.

Happy predicting the future ;-)

Did you take into account adding items and/or oneOf, which will
impact alignment, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
