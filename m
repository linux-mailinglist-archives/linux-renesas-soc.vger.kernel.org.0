Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F8513CFBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 23:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgAOWG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 17:06:57 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34443 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAOWG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 17:06:57 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so17547832otf.1;
        Wed, 15 Jan 2020 14:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QA72jMIQiIcv6qKeAvOBZo5//ESBp/sElxNZhuRd/aw=;
        b=Ku0iu43+DRp7ADCgca45A3oFR4oD6KSyxvayLrXjC1YHUgRX7tN9VwCUaRy3T+rs1d
         HrDz7EMyz1DhwJfQ1AUHgaJZjIDig6WGjYe+yHk90CNXS7z5kCKJnRKawqAUMqFcQGJt
         nm4lFsr+AuxGP41OLyp+FhHA3IIk/1bS4z3AFny+YxaCKXjCF5kJu2b5LK/tU/+LUgf6
         3GJxh8RQYaGMzfnhpcOJIUCw4UvdyE3lYZsqr9YtMIp3PtdicX9+ldwaqMQbmy3xQ9WF
         uDaAJdaGqWeuRWZqfhKkIKPgwcP20tZ4V9zReNN0apzTlKfIiNPo1UWg0RZVIoU29PFW
         L++Q==
X-Gm-Message-State: APjAAAWRWblEbCoV8Z5OTo5yqxGA+upBFl31WX3+iBWiAKObZi53GQ5I
        z68KEOfGIXtyLZtChCRJIEcMjYACkx4JACjb/ac=
X-Google-Smtp-Source: APXvYqwUReB61qJ2CDHEnYmnlWNvkGwBGaJEh4v0341plcso6oNlKga1A3x3SDtLiNVKbUvoihUE/WDHebZDXkh8m9k=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr4374295otd.39.1579126016415;
 Wed, 15 Jan 2020 14:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be> <20200115210104.GA28904@ravnborg.org>
In-Reply-To: <20200115210104.GA28904@ravnborg.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jan 2020 23:06:45 +0100
Message-ID: <CAMuHMdUEqWWKS_85pNSbAdFBUuGTEzgwE1bd9+x_mN_uzd254Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: sitronix,st7735r: Convert to
 DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Wed, Jan 15, 2020 at 10:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jan 15, 2020 at 01:45:44PM +0100, Geert Uytterhoeven wrote:
> > Convert the DT binding documentation for Sitronix ST7735R displays to DT
> > schema.
> >
> > Add a reference to the Adafruit 1.8" LCD while at it.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> > diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> > new file mode 100644
> > index 0000000000000000..21bccc91f74255e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> Use (GPL-2.0-only OR BSD-2-Clause) for new binding files.

I used GPL-2.0-only, as this is a conversion of an existing binding file,
covered by the default GPL-2.0-only of the Linux kernel source tree.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sitronix ST7735R Display Panels Device Tree Bindings
> > +
> > +maintainers:
> > +  - David Lechner <david@lechnology.com>
> > +
> > +description:
> > +  This binding is for display panels using a Sitronix ST7735R controller in
> > +  SPI mode.
> > +
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
>
> I am no binding expert so I do not know how to add it.
> But the old binding described that this MUST be a child of spi.
> This is missing here.
>
> Other panels using spi does not have it - so it is probarly OK.

Yeah, I couldn't find any examples of expressing that requirement in yaml.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
