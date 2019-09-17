Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFADB4E15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfIQMmN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:35246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727930AbfIQMmN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:42:13 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2F18218AF;
        Tue, 17 Sep 2019 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568724131;
        bh=kDP1y0WagYIm5s7dJfl7uFVnmZFFiVdtIJQ8yWDnACA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gYKbipAuE8m0K34GIa6sg02Jxv+BkQQG3IGYc7xnWJxVB7SdIP2xlpB0H7jWg9mBC
         Dcl17wK7P44wYBEDZjUos/TKAgUrsgBneJuGqqmYvRnEghwkJSDQIPQM/9pk7xYmaw
         T2TcqLpOZuU43e5N77RFl3WWMd03Nok045ZdxsZ0=
Received: by mail-qt1-f174.google.com with SMTP id c3so4134253qtv.10;
        Tue, 17 Sep 2019 05:42:11 -0700 (PDT)
X-Gm-Message-State: APjAAAXqCHnv8eQXkflDJcVSwFnjY9C+t2tH8VkyyBR+dgrfKlz86Uw6
        CXPL568EOHMMACa+0hhi6r8PfZK/k5v6dtegGQ==
X-Google-Smtp-Source: APXvYqyrirqPvMSbHXqBuiTB+hLdZCq0YN0XUCXBjwk0DG7hhgKCUAMN9NC4gbJocH/CrGdLo9wP72P6oj7CcQ7m8Z0=
X-Received: by 2002:ad4:528b:: with SMTP id v11mr2928289qvr.200.1568724130829;
 Tue, 17 Sep 2019 05:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-3-horms+renesas@verge.net.au> <670148264.237333.1568717022750@webmail.strato.com>
 <20190917110824.aapnwkccqijxgn4h@verge.net.au>
In-Reply-To: <20190917110824.aapnwkccqijxgn4h@verge.net.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 17 Sep 2019 07:41:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVYWAdyEarzBy9xj+tkJG=oTWqvy5CsLrBKoHDH5tqyA@mail.gmail.com>
Message-ID: <CAL_JsqJVYWAdyEarzBy9xj+tkJG=oTWqvy5CsLrBKoHDH5tqyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: bus: renesas-bsc: convert bindings to json-schema
To:     Simon Horman <horms@verge.net.au>
Cc:     Ulrich Hecht <uli@fpond.eu>, Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 6:08 AM Simon Horman <horms@verge.net.au> wrote:
>
> On Tue, Sep 17, 2019 at 12:43:42PM +0200, Ulrich Hecht wrote:
> >
> > > On September 16, 2019 at 5:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > >
> > >
> > > Convert Renesas Bus State Controller (BSC) bindings documentation to
> > > json-schema.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > > * Tested using:
> > >   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > >   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > > ---
> > >  .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -----------------
> > >  .../devicetree/bindings/bus/renesas,bsc.yaml       | 57 ++++++++++++++++++++++
> > >  2 files changed, 57 insertions(+), 46 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
> > >  create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.txt b/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> > > deleted file mode 100644
> > > index 90e947269437..000000000000
> > > --- a/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> > > +++ /dev/null
> > > @@ -1,46 +0,0 @@
> > > -Renesas Bus State Controller (BSC)
> > > -==================================
> > > -
> > > -The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> > > -Bridge", or "External Bus Interface") can be found in several Renesas ARM SoCs.
> > > -It provides an external bus for connecting multiple external devices to the
> > > -SoC, driving several chip select lines, for e.g. NOR FLASH, Ethernet and USB.
> > > -
> > > -While the BSC is a fairly simple memory-mapped bus, it may be part of a PM
> > > -domain, and may have a gateable functional clock.
> > > -Before a device connected to the BSC can be accessed, the PM domain
> > > -containing the BSC must be powered on, and the functional clock
> > > -driving the BSC must be enabled.
> > > -
> > > -The bindings for the BSC extend the bindings for "simple-pm-bus".
> > > -
> > > -
> > > -Required properties
> > > -  - compatible: Must contain an SoC-specific value, and "renesas,bsc" and
> > > -           "simple-pm-bus" as fallbacks.
> > > -                SoC-specific values can be:
> > > -           "renesas,bsc-r8a73a4" for R-Mobile APE6 (r8a73a4)
> > > -           "renesas,bsc-sh73a0" for SH-Mobile AG5 (sh73a0)
> > > -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> > > -           parent address and child address spaces.
> > > -  - reg: Must contain the base address and length to access the bus controller.
> > > -
> > > -Optional properties:
> > > -  - interrupts: Must contain a reference to the BSC interrupt, if available.
> > > -  - clocks: Must contain a reference to the functional clock, if available.
> > > -  - power-domains: Must contain a reference to the PM domain, if available.
> > > -
> > > -
> > > -Example:
> > > -
> > > -   bsc: bus@fec10000 {
> > > -           compatible = "renesas,bsc-sh73a0", "renesas,bsc",
> > > -                        "simple-pm-bus";
> > > -           #address-cells = <1>;
> > > -           #size-cells = <1>;
> > > -           ranges = <0 0 0x20000000>;
> > > -           reg = <0xfec10000 0x400>;
> > > -           interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> > > -           clocks = <&zb_clk>;
> > > -           power-domains = <&pd_a4s>;
> > > -   };
> > > diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > > new file mode 100644
> > > index 000000000000..0231a15cac47
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > > @@ -0,0 +1,57 @@
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/bus/renesas,bsc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas Bus State Controller (BSC)
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +
> > > +description: |
> > > +  The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> > > +  Bridge", or "External Bus Interface") can be found in several Renesas ARM
> > > +  SoCs.  It provides an external bus for connecting multiple external
> > > +  devices to the SoC, driving several chip select lines, for e.g. NOR
> > > +  FLASH, Ethernet and USB.
> > > +
> > > +  While the BSC is a fairly simple memory-mapped bus, it may be part of a
> > > +  PM domain, and may have a gateable functional clock.  Before a device
> > > +  connected to the BSC can be accessed, the PM domain containing the BSC
> > > +  must be powered on, and the functional clock driving the BSC must be
> > > +  enabled.
> > > +
> > > +  The bindings for the BSC extend the bindings for "simple-pm-bus".
> > > +
> > > +allOf:
> > > +  - $ref: simple-pm-bus.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - renesas,bsc-r8a73a4  # R-Mobile APE6 (r8a73a4)
> > > +          - renesas,bsc-sh73a0   # SH-Mobile AG5 (sh73a0)
> > > +      - const: renesas,bsc
> > > +      - const: simple-pm-bus
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> >
> > Shouldn't there be a "required:" section here?
>
> Thanks, I will add:
>
> required:
>   - compatible
>   - '#address-cells'
>   - '#size-cells'
>   - ranges

No need for all these as the simple-pm-bus binding already does.

>   - reg
