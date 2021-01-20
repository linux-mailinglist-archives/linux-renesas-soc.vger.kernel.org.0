Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111D42FD5B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 17:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404019AbhATQbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 11:31:44 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34886 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404081AbhATQas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 11:30:48 -0500
Received: by mail-ot1-f52.google.com with SMTP id 36so12391461otp.2;
        Wed, 20 Jan 2021 08:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qbcj96nUBxwaOq/+VeJJ4TOWxu4T57LWPFj57lO5C0=;
        b=Zixq75D+m44gJxZj7PZxRvWQeME0k3gpVTJWvHBvL1u7QDxyEoC/ds8S8ZoGQXGNZD
         vdqeZrbdmr7qGK31juxvRnq8CeMOyIoECh8W6TFm0yR/Ph/At5823W4e7sgk9X7ZX/+k
         HTCsUPFv1hL16ASv/7MpalMw+0ef2Z3N1m1Oq2FA2IRk7hXG/GlSHx/OSVUqAV2We2He
         LCEm79wauKKM9jLDXQc4mjBQFxbUQipfUJDoio2DZxKDYq+n1O/26RqVu+yZnhu9vyvi
         YCVuFrOOFhHRlK4G5kMvyXe1//8gKcG2ekg4DhmZw3P1Q09ax32B+Wfg2s5762H1+4Ct
         kdkA==
X-Gm-Message-State: AOAM532SMUuLCZosGu6BjiYkF+YwbNYqQhJHTgF5W0RSit0vN+BXSh+L
        ALqmTXZZ1o4hdL9N2XhGKSlQwCyBKIBAi9ilU+vL+7xAffo=
X-Google-Smtp-Source: ABdhPJzeqp/HHuaRc2XnkL25kpeIpG1eTyKiF4x4rD/IMvU3G3HkLGqRJwU8dkWjjsz1mJTdLGPMYx40St7gv5U7sGM=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr7583208oth.250.1611160205924;
 Wed, 20 Jan 2021 08:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20210114125650.2233045-1-geert+renesas@glider.be> <6d7a8180-b10d-481f-a3ca-05c37c17cb1a@lucaceresoli.net>
In-Reply-To: <6d7a8180-b10d-481f-a3ca-05c37c17cb1a@lucaceresoli.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jan 2021 17:29:54 +0100
Message-ID: <CAMuHMdWO5Uv22q8TuO4MQ_gv4LLT6UDCm0TrDtWe6DL=bbFKWw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Luca,

On Wed, Jan 20, 2021 at 5:08 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> On 14/01/21 13:56, Geert Uytterhoeven wrote:
> >   - Add missing reference for "idt,voltage-microvolt",
> >   - Add missing "additionalProperties: false" for subnodes, to catch
> >     typos in properties,
> >   - Fix property names in example.
> >
> > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
> >     ('clk: vc5: Use "idt,voltage-microvolt" instead of
> >     "idt,voltage-microvolts"'),
> >   - Drop reference to clock.yaml, which is already applied
> >     unconditionally,
> >   - Drop removal of allOf around if condition, as it is unnecessary
> >     churn.
> > ---
> >  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > index 2ac1131fd9222a86..70239f992d714ae0 100644
> > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > @@ -75,12 +75,15 @@ patternProperties:
> >          maximum: 6
> >        idt,voltage-microvolt:
> >          description: The output drive voltage.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
>
> "Vendor specific properties having a standard unit suffix don't need a
> type." -- Documentation/devicetree/bindings/example-schema.yaml

Thanks, will fix in v3!

Rob: would this apply to idt,slew-percent, too?
I.e. should -percent be added to dt-schema/schemas/property-units.yaml?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
