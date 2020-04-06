Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD9D19F4E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 13:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgDFLk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 07:40:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36658 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgDFLk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 07:40:28 -0400
Received: by mail-ot1-f67.google.com with SMTP id l23so14964999otf.3;
        Mon, 06 Apr 2020 04:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbg7DIum6KX3viMdVj5pwqj5cNuHsNuoxpYrRpMdwUo=;
        b=rO/0s16bAKvBqmdiU3RNGvThYLTJO4dDOcaIT5w9RjkNv//crbY7xVEyuyrh647m2Z
         ieoMDr0Xy/VOlRIRNBXB4hov5kqsVQPOcx6519fRGxpoIsueFSeBrKuxX8Fc2hsyyrdm
         gX21dp/JvdqJORX2SvFPtEHo4ALch9avviagzeusOH9G0uqKTBxBNf9Lups33j3Qiy+P
         8LEr4ScceSKhQMRtAQXsVYT5fRXHIKqY246VuXF5d+VN/towb8DoFqkkuOyj+/v86pMV
         CwZOTo8a6sboEZN6gY4wIPK9Nkppd6ILC1xRe5lxYdA+YMptNfJLVd7YfvOIwaHs9z5K
         qXNw==
X-Gm-Message-State: AGi0Pua65itJqHj6Kdwed5wg0iXgQVmE3T5ygP2BHaqINXegNTVLVVJG
        dymuWwNakkFu4IUl0iC7tl4fGyLQ246d9NLIy9YoCTY9
X-Google-Smtp-Source: APiQypKPqvJRqeOqzC4j+4scy+dkCgEgdJpmPPaKExBorHuKEyGk71KwouiImwTYTgXWTESJfoVc8xJbRu11OFUXFTY=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr16783289otl.145.1586173227928;
 Mon, 06 Apr 2020 04:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com> <20200406110924.GB4757@pendragon.ideasonboard.com>
In-Reply-To: <20200406110924.GB4757@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Apr 2020 13:40:16 +0200
Message-ID: <CAMuHMdWhj1uS6v1bb0ntsP_b29Sgw+M6KHPceDxmeF3329Aw=g@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Apr 6, 2020 at 1:09 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Apr 06, 2020 at 10:47:37AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart wrote:
> > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      enum:
> > > +        - renesas,r8a774c0-lvds
> > > +        - renesas,r8a77990-lvds
> > > +        - renesas,r8a77995-lvds
> > > +then:
> > > +  properties:
> > > +    clocks:
> > > +      minItems: 1
> > > +      maxItems: 4
> > > +      items:
> > > +        - description: Functional clock
> > > +        - description: EXTAL input clock
> > > +        - description: DU_DOTCLKIN0 input clock
> > > +        - description: DU_DOTCLKIN1 input clock
> > > +
> > > +    clock-names:
> > > +      minItems: 1
> > > +      maxItems: 4
> > > +      items:
> > > +        - const: fck
> > > +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> > > +        # These clocks are optional.
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> >
> > Can the duplication of the last 3 entries be avoided?
> > Perhaps like in
> > Documentation/devicetree/bindings/serial/renesas,scif.yaml?
>
> I'd love to, if you can tell me how to make sure the fck entry is
> mandatory. The following
>
>   minItems: 1
>   maxItems: 4
>   items:
>     enum:
>       - fck
>       - extal
>       - dclkin.0
>       - dclkin.1
>
> passes the checks, but would accept
>
>         clock-names = "extal";
>
> which is not valid. Your
> Documentation/devicetree/bindings/serial/renesas,scif.yaml bindings
> suffer from the same problem :-)

Hmm....

> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > +
> > > +    lvds@feb90000 {
> > > +        compatible = "renesas,r8a7795-lvds";
> > > +        reg = <0 0xfeb90000 0 0x14>;
> >
> > Examples are built with #{address,size}-cells = <1>.
>
> Are they ? I don't get any failure from make dt_binding_check.

Hmm... And you do have "reg: maxItems: 1"...


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
