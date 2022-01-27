Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4585649E3C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 14:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbiA0NoA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 08:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiA0Nn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 08:43:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A455AC061714;
        Thu, 27 Jan 2022 05:43:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC91949C;
        Thu, 27 Jan 2022 14:43:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643291036;
        bh=LNTPgJr89tkA0iGFDgELfs9wQTVYZHc1hJjqa5lPsD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dv2jddbgboBqlIOfP5gnMCQSYBEG7/FPgNk4F3gnzusaItfMnu7XgW4jB2dDWqroA
         8UPvUK1ea8XCFTZqfjxienzgQUdOmxPUm57NQW2LoWCE0p4xJorzMtdaVvJyBmoV4I
         cllPiUrNNxOnHw/hMVEVPXttUZaPsLPafbnOJCG0=
Date:   Thu, 27 Jan 2022 15:43:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0
 support
Message-ID: <YfKhh8FQdfY7eTiT@pendragon.ideasonboard.com>
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Jan 27, 2022 at 12:05:31PM +0100, Geert Uytterhoeven wrote:
> On Tue, Jan 25, 2022 at 6:33 PM Yoshihiro Shimoda wrote:
> > Document the compatible values for the IPMMU-VMSA blocks in
> > the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > @@ -44,6 +44,10 @@ properties:
> >                - renesas,ipmmu-r8a77990 # R-Car E3
> >                - renesas,ipmmu-r8a77995 # R-Car D3
> >                - renesas,ipmmu-r8a779a0 # R-Car V3U
> > +      - items:
> > +          - enum:
> > +              - renesas,ipmmu-r8a779f0 # R-Car S4-8
> > +          - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
> 
> I'm wondering if we need the family-specific fallback.
> For R-Car Gen3, we don't have it, and match on (all) the SoC-specific
> compatible values instead.
> Do you remember why we decided to do it that way?

I'm afraid I don't. You know my usual opinion of SoC-specific compatible
strings :-)

> At least R-Car V3M/V3H/D3 have slight differences in the register bits,
> but I don't think that was the reason.

-- 
Regards,

Laurent Pinchart
