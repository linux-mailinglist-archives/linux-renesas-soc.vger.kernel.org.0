Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B148D49D66A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 00:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbiAZX53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 18:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiAZX52 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 18:57:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CF7C06161C;
        Wed, 26 Jan 2022 15:57:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE050EE;
        Thu, 27 Jan 2022 00:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643241445;
        bh=vuhVq5HJ/9zxzx9WyHz58I5HTf0mfVL+Kxg3aE0E8cQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGNMEb2JunGKKWWZKTVYkFeg8HU4TVRzmNsBsIWxfgW7DuH3g2rSY0ltm0ZrZv5wj
         2nhpbKjdk4f+lHdXQiJcyz5iIpw6jZjCvOcEojAJLowTbiNxZ8NjA3w/HmAvnJct1g
         v7fya6WJC9qtqSDcsLcnSddDCYfLNr/vtOPM7uug=
Date:   Thu, 27 Jan 2022 01:57:05 +0200
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
Message-ID: <YfHf0ZNt8GV0gHaF@pendragon.ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
 <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
 <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1DwsMTVog4oBa_=ozH=aEeAdK+wS1SbwbZYz22JAL=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Jan 26, 2022 at 08:15:26PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 26, 2022 at 7:58 PM Laurent Pinchart wrote:
> > On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > > > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > > > boards as an optional external panel. It is described in the
> > > > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > > > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > > > board device trees, with other minor modifications, to enable the panel.
> > > >
> > > > This is however not how external components should be modelled. Instead
> > > > of modifying the board device tree to enable the panel, it should be
> > > > compiled as a DT overlay, to be loaded by the boot loader.
> > > >
> > > > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > > > declaring a panel node only, without hardcoding its path. Overlay
> > > > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> > > >
> > > > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > > > is currently unused. As overlay support for this panel has only been
> > > > tested with Gen3 hardware, and Gen2 support will require more
> > > > development, move the file to arch/arm64/boot/dts/renesas/.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > I see you've reviewed the whole series. Can you pick it up ?
> 
> I believe it depends on the removal of the empty endpoints, for which
> we're waiting for feedback from Rob, IIRC?

You're right. Let's wait some more time then.

-- 
Regards,

Laurent Pinchart
