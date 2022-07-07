Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A670C569CC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 10:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbiGGINo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jul 2022 04:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbiGGINX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 04:13:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635764D16A;
        Thu,  7 Jul 2022 01:13:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80C99326;
        Thu,  7 Jul 2022 10:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657181598;
        bh=1DXhRWbA8QBg9QD2HQKZBXd/xkMKr0Zy67OPBy9vSE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3jsa0DbQPoOd+Jlv2pIdEZc+o59SjdTxngqIjzGbWBth9bcuXY1S17cgjmNGvkFe
         D/IuroPzVkl85cV4UQ9IdO9q52d+Mtkrk3CZ6FJCatyWdZAhd42C3o8ol/HMN3vmMc
         XCoJjBpa32nCNEgKamEBBQNr49mBZdD7Sb4CnKXk=
Date:   Thu, 7 Jul 2022 11:12:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
Message-ID: <YsaVhL4pb7uBisUz@pendragon.ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
 <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
 <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
 <YfHf0ZNt8GV0gHaF@pendragon.ideasonboard.com>
 <YsZEEHbLxQgszvyq@pendragon.ideasonboard.com>
 <CAMuHMdXWE5eQF7FB52gWQhtMOsMSyK9wwS0O3xSWzD+GLKO93w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWE5eQF7FB52gWQhtMOsMSyK9wwS0O3xSWzD+GLKO93w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Jul 07, 2022 at 09:30:23AM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 7, 2022 at 4:25 AM Laurent Pinchart wrote:
> > On Thu, Jan 27, 2022 at 01:57:05AM +0200, Laurent Pinchart wrote:
> > > On Wed, Jan 26, 2022 at 08:15:26PM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Jan 26, 2022 at 7:58 PM Laurent Pinchart wrote:
> > > > > On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > > > > > > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > > > > > > boards as an optional external panel. It is described in the
> > > > > > > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > > > > > > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > > > > > > board device trees, with other minor modifications, to enable the panel.
> > > > > > >
> > > > > > > This is however not how external components should be modelled. Instead
> > > > > > > of modifying the board device tree to enable the panel, it should be
> > > > > > > compiled as a DT overlay, to be loaded by the boot loader.
> > > > > > >
> > > > > > > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > > > > > > declaring a panel node only, without hardcoding its path. Overlay
> > > > > > > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> > > > > > >
> > > > > > > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > > > > > > is currently unused. As overlay support for this panel has only been
> > > > > > > tested with Gen3 hardware, and Gen2 support will require more
> > > > > > > development, move the file to arch/arm64/boot/dts/renesas/.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > >
> > > > > I see you've reviewed the whole series. Can you pick it up ?
> > > >
> > > > I believe it depends on the removal of the empty endpoints, for which
> > > > we're waiting for feedback from Rob, IIRC?
> > >
> > > You're right. Let's wait some more time then.
> >
> > How should we proceed with this ?
> 
> That dependency is commit 747bbcd3aacd95fe ("arm64: dts: renesas:
> Remove empty rgb output endpoints") in v5.19-rc1, right?
> So I can take this for v5.20, or are any other changes needed?
> 
> Please confirm.

To my knowledge everything is good and ready to go.

-- 
Regards,

Laurent Pinchart
