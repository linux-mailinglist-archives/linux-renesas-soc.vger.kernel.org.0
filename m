Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0BF18FA1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 17:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgCWQmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 12:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:34812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727357AbgCWQmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 12:42:16 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1913520753;
        Mon, 23 Mar 2020 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584981735;
        bh=02Kf9WpideHAeaiUmNJrBUV6bHi5stRkRbsCThccRjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xy/iuWM40CuwjgUhDnwM+XDKVxozGS0WmZMOgQxw9RqDiEqEqioIiXCYjZGKNcjk1
         gK13WjTc25DhsJ79xjkIYPHLlsa5ZSSizfr6AWviYxM4yEysjYxrddozASa7JFHzNc
         NSYhlsjcbNt0oseXfHSHdG+rg3CwXbaOPurqXKXc=
Received: by mail-qt1-f174.google.com with SMTP id f20so12239371qtq.6;
        Mon, 23 Mar 2020 09:42:15 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3aBxlfpoHQAHKnomoI+ngiWlX+V2SGOZuuCOzrsfPaRLLJoWDY
        5zXbMX1+ZJYAhaSCj4jiwaWSgalqyg9tqIHLhA==
X-Google-Smtp-Source: ADFU+vv7cTGvxC9hMAYxTeAIEH2A++JcPRe510U2M7ukQfSAPh0pK3/2XZwYvglTSrY49qlGUNpWYFGRxCL1cyLzmVU=
X-Received: by 2002:aed:3461:: with SMTP id w88mr22287799qtd.143.1584981733920;
 Mon, 23 Mar 2020 09:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200306090720.9365-1-geert+renesas@glider.be>
 <20200312200523.GA17854@bogus> <CAMuHMdWoRSE7VQ5o575Ocjfh+y1yH-ciFE1BUqqPVO9oukwgNw@mail.gmail.com>
In-Reply-To: <CAMuHMdWoRSE7VQ5o575Ocjfh+y1yH-ciFE1BUqqPVO9oukwgNw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 23 Mar 2020 10:41:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5CmL6M_njeHHYA21zs2jTQxENet+q=BJNVuz8K7Jubw@mail.gmail.com>
Message-ID: <CAL_JsqL5CmL6M_njeHHYA21zs2jTQxENet+q=BJNVuz8K7Jubw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Convert to json-schema
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 23, 2020 at 8:38 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> Thanks a lot for your comments!
>
> On Thu, Mar 12, 2020 at 9:05 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Mar 06, 2020 at 10:07:20AM +0100, Geert Uytterhoeven wrote:
> > > Convert the Renesas Serial Communication Interface ((H)SCI(F)(A|B))
> > > Device Tree binding documentation to json-schema.
> > >
> > > Split the bindings in 5 files, one per major type, to ease expressing
> > > constraints.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
>
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: renesas,sci
> >
> > Do you plan to add to this? It can be simplified to just
>
> Not really. I just used the same construct for consistency with the other
> SCI variants.
>
> > 'const: renesas,sci'.
>
> OK.  I guess no other H8 and SuperH variants will pop up anytime soon.
> Oops, RZ/A1 has SCI, and RZ/A2 has SCIg (they keep on inventing new
> names, to be seen how compatible).
>
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > > @@ -0,0 +1,168 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/serial/renesas,scif.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Renesas Serial Communication Interface with FIFO (SCIF)
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +
> > > +description:
> > > +  Each enabled UART may have an optional "serialN" alias in the "aliases" node,
> > > +  where N is the port number (non-negative decimal integer) as printed on the
> > > +  label next to the physical port.
> >
> > That's every serial port...
>
> So you suggest to just remove this paragraph from all files?

Yes.

> Shall I add it to serial.yaml instead?

Sure. I'd really like to get to having a registry of alias names we can check.

>
> > > +  interrupts:
> > > +    description: |
> > > +      Must contain one or more interrupt-specifiers for the serial interface.
> > > +      If a single interrupt is expressed, then all events are
> > > +      multiplexed into this single interrupt.
> > > +
> > > +      If multiple interrupts are provided by the hardware, the order
> > > +      in which the interrupts are listed must match order below. Note
> > > +      that some HW interrupt events may be muxed together resulting
> > > +      in duplicate entries.
> > > +    minItems: 1
> > > +    maxItems: 6
> >
> > This allows 2, 3, 4, or 5 interrupts. Is that valid? If not, then you
>
> 1, 4, and 6 are valid.
>
> > should do something like this:
> >
> > oneOf:
> >   - items:
> >       description: A combined interrupt
> >   - items:
> >       - description: Error interrupt
> >       - ...
>
> So I tried:
>
>   interrupts:
>     oneOf:
>       - items:
>           description: A combined interrupt

You're missing a '-' here.

>       - items:
>           - description: Error interrupt
>           - description: Receive buffer full interrupt
>           - description: Transmit buffer empty interrupt
>           - description: Transmit End interrupt
>       - items:
>           - description: Error interrupt
>           - description: Receive buffer full interrupt
>           - description: Transmit buffer empty interrupt
>           - description: Break interrupt
>           - description: Data Ready interrupt
>           - description: Transmit End interrupt
>
> That fails for devices with 4 or 6 interrupts, e.g.:
>
>     arch/arm/boot/dts/r7s9210-rza2mevb.dt.yaml: serial@e8007000:
> interrupts: [[0, 265, 4], [0, 266, 4], [0, 267, 4], [0, 265, 4], [0,
> 268, 4], [0, 268, 4]] is valid under each of {'additionalItems':
> False, 'items': [{}, {}, {}, {}, {}, {}], 'maxItems': 6, 'minItems':
> 6, 'type': 'array'}, {'items': {}, 'type': 'array'}
>
> Note that initially I forgot to cater for the 4-interrupt case used in
> arch/arm/boot/dts/r7s72100.dtsi, and "make dtbs_check" did not complain.
>
> > > +
> > > +  interrupt-names:
> > > +    minItems: 1
> > > +    maxItems: 6
> > > +    items:
> > > +      enum:
> > > +        - eri # Error
> > > +        - rxi # Receive buffer full
> > > +        - txi # Transmit buffer empty
> > > +        - bri # Break
> > > +        - dri # Data Ready
> > > +        - tei # Transmit End
> >
> > Based on above, you probably want 'items' to be a list, not a
> > dict(schema).
>
> Like
>
>   interrupt-names:
>     oneOf:
>       - items:
>           - const: eri
>           - const: rxi
>           - const: txi
>           - const: tei
>       - items:
>           - const: eri
>           - const: rxi
>           - const: txi
>           - const: bri
>           - const: dri
>           - const: tei
>
> ?
> Seems to work, but needs the duplication as the 4-interrupt case is not
> just the 4 first entries of the 6-interrupt case (tei is always last).

Yes, that looks right. No name for the single irq case?

>
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +    items:
> > > +      enum:
> > > +        - fck # UART functional clock
> > > +        - sck # optional external clock input
> > > +        - brg_int # optional internal clock source for BRG frequency divider
> > > +        - scif_clk # optional external clock source for BRG frequency divider
> >
> > Same issue again...
>
> The order is not fixed for the three optional clocks, as they may or
> may not be wired (for sck and scif_clk), or the BRG may not be present.
> Hence unlike for interrupts, I cannot drop the "enum", IIUIC?

Well, you could list out every possible combination, but the above is
fine I guess.

Rob
