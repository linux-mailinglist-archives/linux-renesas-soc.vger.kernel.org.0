Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4441643CEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfFMPib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:38:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41286 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731952AbfFMKCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:02:50 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 10B7925BE52;
        Thu, 13 Jun 2019 20:02:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0FF64940483; Thu, 13 Jun 2019 12:02:47 +0200 (CEST)
Date:   Thu, 13 Jun 2019 12:02:46 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Add cpg reset for
 LVDS Interface
Message-ID: <20190613100246.qa2lcbcgbyd3zuaz@verge.net.au>
References: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com>
 <20190612121556.GK5035@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612121556.GK5035@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 03:15:56PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Wed, Jun 12, 2019 at 09:37:14AM +0200, Geert Uytterhoeven wrote:
> > On Sun, Jun 9, 2019 at 1:11 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > > It is necessary to reset the LVDS Interface according to display on/off.
> > > Therefore, this patch adds CPG reset properties in DU device node
> > > for the R8A77995 SoC.
> > >
> > > This patch was inspired by a patch in the BSP by Takeshi Kihara <takeshi.kihara.df@renesas.com>.
> > >
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > @@ -1001,6 +1001,8 @@
> > >                         clocks = <&cpg CPG_MOD 724>,
> > >                                  <&cpg CPG_MOD 723>;
> > >                         clock-names = "du.0", "du.1";
> > > +                       resets = <&cpg 724>, <&cpg 724>;
> > > +                       reset-names = "du.0", "du.1";
> > 
> > These are not the LVDS resets, but the (shared) DU channel resets.
> > 
> > The LVDS interface has its own separate device node, so if you want to
> > be able to reset that, you need to add reset properties to the LVDS
> > node instead.
> > 
> > Note that I haven't reposted a new version of "[PATCH v2] dt-bindings:
> > drm: rcar-du: Document optional reset properties"[1] yet, after the
> > split off of the LVDS interface into its own device node. Laurent wanted
> > to wait until the driver gained DU reset support.
> > However, the above differs from my proposal, as it also adds "du.1",
> > pointing to the same (shared) reset.
> > With a fresh look (2 years later ;-), that actually makes sense, so
> > perhaps I should change my proposal and repost? We do have shared
> > resets in other places (e.g. USB).
> > Laurent, what do you think?
> 
> For Gen3 reset is handled at the group level, so I think specifying one
> entry per group is enough. If other SoCs require per-channel reset
> (which would surprise me as it would then imply a big redesign of the DU
> IP core, which may lead to a separate driver) we can always extend the
> bindings accordingly.
> 
> > [1] https://lore.kernel.org/linux-renesas-soc/1488817556-21410-1-git-send-email-geert+renesas@glider.be/

Sorry, I'm a little unclear on what the suggested way forwards is here.

Is it to add a reset for du.0 but not du.1 ?
