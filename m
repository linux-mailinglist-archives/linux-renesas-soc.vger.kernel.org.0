Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CDD302D8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 22:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732687AbhAYVZd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 16:25:33 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44681 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732682AbhAYVZZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 16:25:25 -0500
Received: by mail-ot1-f54.google.com with SMTP id e70so14201488ote.11;
        Mon, 25 Jan 2021 13:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gerI2X7REx0tAiYWrM7wbv2wWEM/qqVaLK1pErzM2N0=;
        b=H8ub348Z4j4AswMylqX81SOsEH3QgNtPCEPUhzgroTZTuIsaB/xoGC5N/ci+1Jsp16
         8sZugENF4oK6awvdl9D1R5o0rdDhaJqxcA5iECLr5MSXaPzJLchvt/sG84I9UfnSOYl6
         oJtBmlS6m6jj7p4ZeRqoQudpWvFniLIuZmC0ayTWCVO561ZTUZriNoc5EN/V+2qQkseG
         vcs8WKPqg/3thnaFmHFO0HuuU8Lm/L7MLNA3unFaQ6pbabX4hfS0gG0hiwcJVARDcswu
         GisSZoeRX46PMviO48dL6wILBFf22LPE5gnd1uxI3HJV5V6bAufVB3caeipurWo7kY/t
         CN9g==
X-Gm-Message-State: AOAM532bSJlflCnOS/b5vVRc+rj8Mz4/dEq++YC+wrOXE3V67QehWUdJ
        pL9NKjzephDdEMu6DJcEAg==
X-Google-Smtp-Source: ABdhPJwOlCcoKwWW+VD9c1AKxsaKLbvI3DbHBpYFnjcRG9a6psp4t4wPzAAGnPgD8c3ynPy7yLfnow==
X-Received: by 2002:a05:6830:1e50:: with SMTP id e16mr1787994otj.149.1611609884301;
        Mon, 25 Jan 2021 13:24:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n93sm3697893ota.37.2021.01.25.13.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:24:43 -0800 (PST)
Received: (nullmailer pid 1024393 invoked by uid 1000);
        Mon, 25 Jan 2021 21:24:42 -0000
Date:   Mon, 25 Jan 2021 15:24:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clk: versaclock5: Miscellaneous fixes
 and improvements:
Message-ID: <20210125212442.GA1019390@robh.at.kernel.org>
References: <20210114125650.2233045-1-geert+renesas@glider.be>
 <6d7a8180-b10d-481f-a3ca-05c37c17cb1a@lucaceresoli.net>
 <CAMuHMdWO5Uv22q8TuO4MQ_gv4LLT6UDCm0TrDtWe6DL=bbFKWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWO5Uv22q8TuO4MQ_gv4LLT6UDCm0TrDtWe6DL=bbFKWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 20, 2021 at 05:29:54PM +0100, Geert Uytterhoeven wrote:
> Hi Luca,
> 
> On Wed, Jan 20, 2021 at 5:08 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> > On 14/01/21 13:56, Geert Uytterhoeven wrote:
> > >   - Add missing reference for "idt,voltage-microvolt",
> > >   - Add missing "additionalProperties: false" for subnodes, to catch
> > >     typos in properties,
> > >   - Fix property names in example.
> > >
> > > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
> > >     ('clk: vc5: Use "idt,voltage-microvolt" instead of
> > >     "idt,voltage-microvolts"'),
> > >   - Drop reference to clock.yaml, which is already applied
> > >     unconditionally,
> > >   - Drop removal of allOf around if condition, as it is unnecessary
> > >     churn.
> > > ---
> > >  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > index 2ac1131fd9222a86..70239f992d714ae0 100644
> > > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > > @@ -75,12 +75,15 @@ patternProperties:
> > >          maximum: 6
> > >        idt,voltage-microvolt:
> > >          description: The output drive voltage.
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> >
> > "Vendor specific properties having a standard unit suffix don't need a
> > type." -- Documentation/devicetree/bindings/example-schema.yaml
> 
> Thanks, will fix in v3!
> 
> Rob: would this apply to idt,slew-percent, too?
> I.e. should -percent be added to dt-schema/schemas/property-units.yaml?

Yes.

Rob
