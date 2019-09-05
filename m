Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB231AA2E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 14:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbfIEMVR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 08:21:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfIEMVQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 08:21:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55ABB26D;
        Thu,  5 Sep 2019 14:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567686073;
        bh=aaf3c4vVXRdYFGABiwBHWtpCoI8rCWYBI5QWUXCGKKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DdQkpRqsiT5zkmaKzifv4duLBj4Nthqq6t5IzYUXt7NvYAgAdqvlDAY5yVWJ1HVFG
         XfDzPGVHUTCE7sZD3fQ8THQs0/bwMyFvsZcw2yc2AkK+lcAw4xGapS8BehJv4/M3fU
         TSDLxOll4Kdjp09bhAi9G4m6BlbbQ4QXQH9WtF3U=
Date:   Thu, 5 Sep 2019 15:20:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190905122059.GK5035@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
 <20190826101550.GB5031@pendragon.ideasonboard.com>
 <20190830180108.mlei4wbfn3mktj23@uno.localdomain>
 <20190905115017.GI5035@pendragon.ideasonboard.com>
 <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Sep 05, 2019 at 02:05:34PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 5, 2019 at 1:50 PM Laurent Pinchart wrote:
> > On Fri, Aug 30, 2019 at 08:01:09PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 26, 2019 at 01:15:50PM +0300, Laurent Pinchart wrote:
> > > > How about converting this binding to yaml alreay ? It should be fairly
> > > > simple.
> > >
> > > I'm trying to, and I'm having my portion of fun time at it.
> > >
> > > The definition of the schema itself seems good, but I wonder, is this
> > > the first renesas schema we have? Because it seems to me the schema
> > > validator is having an hard time to digest the examplea 'clocks' and
> > > 'power-domains' properties, which have 1 phandle and 2 specifiers and 1
> > > phandle and 1 specifier respectively for Rensas SoCs.
> > >
> > > In other words, if in the example I have:
> > >
> > >  examples:
> > >    - |
> > >      cmm0: cmm@fea40000 {
> > >           compatible = "renesas,r8a7796-cmm";
> > >           reg = <0 0xfea40000 0 0x1000>;
> > >           clocks = <&cpg 711>              <---- 1 phandle + 1 specifier
> > >           resets = <&cpg 711>;
> > >           power-domains = <&sysc>;         <---- 1 phandle
> > >      };
> > >
> > > The schema validation is good.
> > >
> > > While if I use an actual example
> > >    - |
> > >      cmm0: cmm@fea40000 {
> > >           compatible = "renesas,r8a7796-cmm";
> > >           reg = <0 0xfea40000 0 0x1000>;
> > >           clocks = <&cpg CPG_MOD 711>         <---- 1 phandle + 2 specifier
> > >           resets = <&cpg 711>;
> > >           power-domains = <&sysc R8A7796_PD_ALWAYS_ON>; <---- 1 phandle
> > >      };                                                       + 1 specfier
> > >
> > > The schema validation fails...
> > > Error: Documentation/devicetree/bindings/display/renesas,cmm.example.dts:20.29-30 syntax error
> > > FATAL ERROR: Unable to parse input tree
> > >
> > > Are clocks properties with > 2 entries and power-domains properties with
> > > > 1 entries supported?
> > >
> > > Because from what I read here:
> > > https://github.com/robherring/yaml-bindings/blob/master/schemas/clock/clock.yaml
> > > "The length of a clock specifier is defined by the value of a #clock-cells
> > > property in the clock provider node."
> > >
> > > And that's expected, but is the examples actually validated against the
> > > clock provider pointed by the phandle? Because in that case, if we had a
> > > yaml schema for the cpg-mssr provider, it would indeed specify clock-cells=2.
> > >
> > > Do we need a schema for cpg-mssr first, or am I doing something else
> > > wrong?
> >
> > I think you just need to #include the headers that define CPG_MOD and
> > R8A7796_PD_ALWAYS_ON.
> 
> If that helps, you might want to replace the symbols in the examples by their
> actual values (1 resp. 32).
> 
> And perhaps keep the symbols as comments?
> 
>         clocks = <&cpg 1 /* CPG_MOD */ 711>;
>         power-domains = <&sysc 32 /* R8A7796_PD_ALWAYS_ON */>;

I think adding the required #include at the beginning of the example is
a better solution.

-- 
Regards,

Laurent Pinchart
