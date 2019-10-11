Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FF6D46DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 19:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfJKRqY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Oct 2019 13:46:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728470AbfJKRqY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Oct 2019 13:46:24 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC72221835;
        Fri, 11 Oct 2019 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570815982;
        bh=cCan5WfHyvTySsprLa8MG8Pk1yN1pL0Z22pVSVDHh+Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kcGnYOdV0Afs5sCaIDGthExPA/LdjfuVpPz8r6/CNgjKpA1ovDmjO7x3Hqnbn0YFZ
         3+GAwzd8KrSWa8Q7Qhx1pOhdgOlXyfNkZSp32SKCAAMlBojSTo64A+kVaoI44xDRDI
         OgSm5uOMzRQNbEkT5JiXmYrSsneal+N5vUmp7BPw=
Received: by mail-qk1-f170.google.com with SMTP id x4so5719325qkx.5;
        Fri, 11 Oct 2019 10:46:22 -0700 (PDT)
X-Gm-Message-State: APjAAAWIaAbUueCaNEvXda/fZdl6OHQpOWlhWNiRSljXu8lj2fuQTQ31
        /vsX7u4thkxsyWJgElhR51lUCMTMWrw3/7h2Yg==
X-Google-Smtp-Source: APXvYqx8NWxIkgR2gwBZKvDxeeXE3vkunAfy2ZjWqHue5z6OeFFUywQNqB23lykYwT24W4jiQ/KDjMZvYec9Euj/cdE=
X-Received: by 2002:a37:98c1:: with SMTP id a184mr15759520qke.119.1570815981911;
 Fri, 11 Oct 2019 10:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <1569527977-21213-1-git-send-email-ykaneko0929@gmail.com>
 <20191010220709.GA1314@bogus> <CAMuHMdWR3HnT1-yp+i0OXAr2xF-6MANJDuXz1hj9WC1eUJjRAQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWR3HnT1-yp+i0OXAr2xF-6MANJDuXz1hj9WC1eUJjRAQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 11 Oct 2019 12:46:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+9Am1KPE_=TX7_c+sdMt09hPzxXfz0kk53+pF13WtVxw@mail.gmail.com>
Message-ID: <CAL_Jsq+9Am1KPE_=TX7_c+sdMt09hPzxXfz0kk53+pF13WtVxw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas: intc-irqpin: convert
 bindings to json-schema
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 11, 2019 at 1:57 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob, Kaneko-san,
>
> On Fri, Oct 11, 2019 at 12:07 AM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Sep 27, 2019 at 04:59:37AM +0900, Yoshihiro Kaneko wrote:
> > > Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.
> > >
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> > > @@ -0,0 +1,102 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: DT bindings for the R-/SH-Mobile irqpin controller
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
>
> Looks like I received many maintainerships recently ;-)

Maybe I should have called it something else, but I view this as who's
the owner not who applies it. There are lots of binding files with no
maintainer, so it's me by default. I wanted to avoid that and not by
having 4K MAINTAINERS entries.

> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
> > > +          - renesas,intc-irqpin-r8a7778  # R-Car M1A
> > > +          - renesas,intc-irqpin-r8a7779  # R-Car H1
> > > +          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
> > > +      - const: renesas,intc-irqpin
> > > +
> > > +  reg:
> > > +    # Base address and length of each register bank used by the external
> > > +    # IRQ pins driven by the interrupt controller hardware module. The base
> > > +    # addresses, length and number of required register banks varies with
> > > +    # soctype.
> > > +    minItems: 1
>
> minItems: 5
>
> > > +    maxItems: 6
> >
> > Every entry is the same thing?
>
> No they're not.
>
> First entry is the Interrupt control register.
> Second entry is the Interrupt priority register.
> Third entry is the Interrupt source register.
> Fourth entry is the Interrupt mask register.
> Fifth entry is the Interrupt mask clear register.
> Sixth entry is the optional Interrupt control register for ICR0 with IRLM bit.

So this should be an 'items' list with these descriptions.

Rob
