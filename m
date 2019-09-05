Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2DBAA2A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 14:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388601AbfIEMFq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 08:05:46 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46614 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731568AbfIEMFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 08:05:46 -0400
Received: by mail-oi1-f195.google.com with SMTP id x7so1550653oie.13;
        Thu, 05 Sep 2019 05:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uDPcDY1i2jtjkqYWiRv99e2tz5csWw3OmT8nJpxEh5w=;
        b=Cp3v34mrnkt7jsyGpN3v4FQt5MB8Rh8IGWoLwQBnafA0h8l1r/iCKYtgUOhp+/tAaf
         exm/aR2YPdnPRMTTL9IjaMtzwVLcbBgS2RTgghk9O/YDZtIJimHvkuqzhgnPUcJJWV3T
         ncS5P82egYHtJQk0j/DJoE3Hga5pTRpbMGSCC0b2zmTFVjJlO0kD6/+TpHJuPDFJYWXn
         +m4Q5A080qZ6e2d4iFzdB77YAYWMnH6SmQLJYS8aSPiozWpCi4tBZ/wTFTj+WZpJSFNn
         UwpuV9WCrjLC96x4vNVbq4Zp9VDAjRJATAXWKIOp/hLd9K2MwXCPnlQxNOxU0dJLi/9s
         6p/g==
X-Gm-Message-State: APjAAAVOch0N3VdzQ17C0HVAHUSld5X1Q9SbUgRjipHbCQNfcn1JgNlc
        Nz4D2g2LXcoU7xlkMVDwPEnludiuovf65SRtFmE=
X-Google-Smtp-Source: APXvYqwpJ443LWGufLd3u3Kr3HTxqxfWDoGjtPVjZUudTj0e2WRY1jT2mf+lcBAhCcqSef0fzUV0E58hAN+JwMzXjDw=
X-Received: by 2002:a05:6808:98a:: with SMTP id a10mr2275766oic.54.1567685145527;
 Thu, 05 Sep 2019 05:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org> <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain> <20190826101550.GB5031@pendragon.ideasonboard.com>
 <20190830180108.mlei4wbfn3mktj23@uno.localdomain> <20190905115017.GI5035@pendragon.ideasonboard.com>
In-Reply-To: <20190905115017.GI5035@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Sep 2019 14:05:34 +0200
Message-ID: <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>, Ulrich Hecht <uli@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Sep 5, 2019 at 1:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Aug 30, 2019 at 08:01:09PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 26, 2019 at 01:15:50PM +0300, Laurent Pinchart wrote:
> > > How about converting this binding to yaml alreay ? It should be fairly
> > > simple.
> >
> > I'm trying to, and I'm having my portion of fun time at it.
> >
> > The definition of the schema itself seems good, but I wonder, is this
> > the first renesas schema we have? Because it seems to me the schema
> > validator is having an hard time to digest the examplea 'clocks' and
> > 'power-domains' properties, which have 1 phandle and 2 specifiers and 1
> > phandle and 1 specifier respectively for Rensas SoCs.
> >
> > In other words, if in the example I have:
> >
> >  examples:
> >    - |
> >      cmm0: cmm@fea40000 {
> >           compatible = "renesas,r8a7796-cmm";
> >           reg = <0 0xfea40000 0 0x1000>;
> >           clocks = <&cpg 711>              <---- 1 phandle + 1 specifier
> >           resets = <&cpg 711>;
> >           power-domains = <&sysc>;         <---- 1 phandle
> >      };
> >
> > The schema validation is good.
> >
> > While if I use an actual example
> >    - |
> >      cmm0: cmm@fea40000 {
> >           compatible = "renesas,r8a7796-cmm";
> >           reg = <0 0xfea40000 0 0x1000>;
> >           clocks = <&cpg CPG_MOD 711>         <---- 1 phandle + 2 specifier
> >           resets = <&cpg 711>;
> >           power-domains = <&sysc R8A7796_PD_ALWAYS_ON>; <---- 1 phandle
> >      };                                                       + 1 specfier
> >
> > The schema validation fails...
> > Error: Documentation/devicetree/bindings/display/renesas,cmm.example.dts:20.29-30 syntax error
> > FATAL ERROR: Unable to parse input tree
> >
> > Are clocks properties with > 2 entries and power-domains properties with
> > > 1 entries supported?
> >
> > Because from what I read here:
> > https://github.com/robherring/yaml-bindings/blob/master/schemas/clock/clock.yaml
> > "The length of a clock specifier is defined by the value of a #clock-cells
> > property in the clock provider node."
> >
> > And that's expected, but is the examples actually validated against the
> > clock provider pointed by the phandle? Because in that case, if we had a
> > yaml schema for the cpg-mssr provider, it would indeed specify clock-cells=2.
> >
> > Do we need a schema for cpg-mssr first, or am I doing something else
> > wrong?
>
> I think you just need to #include the headers that define CPG_MOD and
> R8A7796_PD_ALWAYS_ON.

If that helps, you might want to replace the symbols in the examples by their
actual values (1 resp. 32).

And perhaps keep the symbols as comments?

        clocks = <&cpg 1 /* CPG_MOD */ 711>;
        power-domains = <&sysc 32 /* R8A7796_PD_ALWAYS_ON */>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
