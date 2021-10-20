Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF2143521F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Oct 2021 19:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhJTSAP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Oct 2021 14:00:15 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:36673 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhJTSAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 14:00:12 -0400
Received: by mail-ua1-f54.google.com with SMTP id e10so8270260uab.3;
        Wed, 20 Oct 2021 10:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=axzAGlR/UxcLWT4CCwns5YXFS5liiGSF6fq491Emgd4=;
        b=kHsW8TQWA+elOQQzJvLnuqYf5Lja1pevGk4ukfCYWUQ53qJfQGMl0oStIGGRgoHtFS
         FTwmNNyx6tu4UwLXbdrZAW7rpJWL+CIFRj8S9XmrunJkH26ZK7IDGPkr9RoaqBmVEXxY
         t513MRdsAqr+EngQ7GZptxPzEEFthqJ0NEwDEoAKJ/45cA1y9uXWUU2uMJxuE9KI+8uy
         +HijjFQhk4mPt4TCfJDZoa2kcDKumFvb8d47SJ6HevRNSUKBBBXdgdP1ezfnk8Dk07is
         jNbr3itvx4TkaYknsEayu4CFZkuTy6r//iCPsB3kPDXd3RM05hy4qmEv8yO9EvGIJKdn
         jvkA==
X-Gm-Message-State: AOAM533pVABMGLhXnkpmhuEbNjuflJmYKDwqI+4SXrQojWQNb9GcFFsj
        3D4EEQvsSyxX/ZPuO5qf8L/yMl6uG9e8GA==
X-Google-Smtp-Source: ABdhPJyEFjFASj/oL9deO3KOrHTMHiW8WtwT4gxtgFtg5LjKd3ARMmRAoIGI62IHGPusALw5dpAteA==
X-Received: by 2002:a9f:3012:: with SMTP id h18mr934730uab.56.1634752676822;
        Wed, 20 Oct 2021 10:57:56 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id d4sm1836191vkq.54.2021.10.20.10.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 10:57:56 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id r17so8233852uaf.8;
        Wed, 20 Oct 2021 10:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr432414vsb.35.1634752675868;
 Wed, 20 Oct 2021 10:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210913170436.243-1-alexander.helms.jy@renesas.com>
 <20210913170436.243-2-alexander.helms.jy@renesas.com> <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
 <CAMuHMdXq2NyBf539raFJSoWSGXnwxOAMWcVB_WV-=uf+kOs7rw@mail.gmail.com>
 <4f2f81a8-9a79-3211-5ec3-fa679c3e7bb9@renesas.com> <CAMuHMdXHkeOK+Bg10BCLDvTztV6+y9+OomBUiTAoa1+GCHRnvw@mail.gmail.com>
 <f77449f2-9299-44d6-b49c-b0be687ea20c@renesas.com>
In-Reply-To: <f77449f2-9299-44d6-b49c-b0be687ea20c@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Oct 2021 19:57:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3uWwGFDe0CF0Y1mbDSyTb-uDMtCHCfLbOyOuKiFgD+Q@mail.gmail.com>
Message-ID: <CAMuHMdV3uWwGFDe0CF0Y1mbDSyTb-uDMtCHCfLbOyOuKiFgD+Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On Wed, Oct 20, 2021 at 6:57 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> On 10/20/2021 1:20 AM, Geert Uytterhoeven wrote:
> > On Tue, Oct 19, 2021 at 11:53 PM Alex Helms
> > <alexander.helms.jy@renesas.com> wrote:
> >> On 10/14/2021 5:16 AM, Geert Uytterhoeven wrote:
> >>> On Wed, Oct 13, 2021 at 8:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>>> On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
> >>>> <alexander.helms.jy@renesas.com> wrote:
> >>>>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> >>>>> The 8T49N241 accepts up to two differential or single-ended input clocks
> >>>>> and a fundamental-mode crystal input. The internal PLL can lock to either
> >>>>> of the input reference clocks or to the crystal to behave as a frequency
> >>>>> synthesizer.
> >>>>>
> >>>>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> >>>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>>
> >>>> Thanks for your patch!
> >>>>
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> >>>
> >>>> BTW, do you plan to add interrupt and/or GPIO support later?
> >>>
> >>> To clarify, and I really meant to add:
> >>>
> >>>   interrupts:
> >>>     maxItems: 1
> >>>
> >>> to the bindings now, and GPIO-related properties and subnodes later.
> >>
> >> Any additional features such as interrupts and GPIO properties would only be added if there is customer demand for such features. Since there is no interrupt support, does the "interrupts" item still need to be added to the yaml?
> >
> > DT describes hardware, not software policy (or limitations of the driver).
> >
> > Arguably that applies to both interrupts and GPIOs, but the latter is
> > more complex to describe, while the former is a simple "interrupts"
> > property.  It's not uncommon for board components to have their
> > interrupt line wired to an SoC, even if the driver doesn't use it.
>
> I understand what you are describing but I don't understand how it is
> relevant for this device. The device is a clock generator on the i2c
> bus. It has a few GPIOs that can be configured as outputs for specific
> events like loss of lock or loss of signal, but I don't understand why

According to the datasheet, the GPIOs can not only be used to indicate
clock generator status, but also as real GPIOs, e.g. to control LEDs
from software.

> that matters. 8t49n241 is similar to the existing dt and driver
> silabs,si5351 which does not define any interrupts. In fact it seems
> their dt describes both hardware and software policy because it uses
> custom dt keywords for changing driver behavior such as
> "silabs,pll-source" or "silabs,drive-strength". So looking at other
> examples of similar drivers, I don't understand why the 8t49n241
> driver needs to define an interrupt.

OK. So just ignore interrupts and GPIO for now.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
