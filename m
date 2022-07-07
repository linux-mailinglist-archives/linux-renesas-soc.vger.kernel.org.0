Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEF75697F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jul 2022 04:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbiGGCZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Jul 2022 22:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiGGCZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 22:25:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504031CFC8;
        Wed,  6 Jul 2022 19:25:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8EAA526;
        Thu,  7 Jul 2022 04:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657160745;
        bh=bQ+ijTONN42940AiCE855Ru1tmEGl/zsUVa5c+ElyhU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SyPfh6h1coZxVxJkAqPW+xwhbssRTxJqllgPw448Q7Q9MVkd1JPPP2IukiCiqgsil
         BeXfLVslrffR7kS88QFTWuq07BV4Ew3zMl+2MZHAE4ppH/3DRlNWfN9PzhXOerp5w3
         yIW9zpXzp9eVWUyOhsl17BiGuUcxmMw50jL9R4eI=
Date:   Thu, 7 Jul 2022 05:25:20 +0300
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
Message-ID: <YsZEEHbLxQgszvyq@pendragon.ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
 <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
 <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
 <YfHf0ZNt8GV0gHaF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfHf0ZNt8GV0gHaF@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 27, 2022 at 01:57:05AM +0200, Laurent Pinchart wrote:
> On Wed, Jan 26, 2022 at 08:15:26PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 26, 2022 at 7:58 PM Laurent Pinchart wrote:
> > > On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > > > > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > > > > boards as an optional external panel. It is described in the
> > > > > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > > > > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > > > > board device trees, with other minor modifications, to enable the panel.
> > > > >
> > > > > This is however not how external components should be modelled. Instead
> > > > > of modifying the board device tree to enable the panel, it should be
> > > > > compiled as a DT overlay, to be loaded by the boot loader.
> > > > >
> > > > > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > > > > declaring a panel node only, without hardcoding its path. Overlay
> > > > > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> > > > >
> > > > > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > > > > is currently unused. As overlay support for this panel has only been
> > > > > tested with Gen3 hardware, and Gen2 support will require more
> > > > > development, move the file to arch/arm64/boot/dts/renesas/.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > > I see you've reviewed the whole series. Can you pick it up ?
> > 
> > I believe it depends on the removal of the empty endpoints, for which
> > we're waiting for feedback from Rob, IIRC?
> 
> You're right. Let's wait some more time then.

How should we proceed with this ?

-- 
Regards,

Laurent Pinchart
