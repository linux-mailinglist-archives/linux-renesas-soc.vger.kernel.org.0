Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25BD043CF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfFMPic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:38:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731953AbfFMKEB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:04:01 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8303E52B;
        Thu, 13 Jun 2019 12:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560420238;
        bh=44UXGOwJn6Te23Fl90PVHuW6U1h36y3mffgPls8OrKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dunr0mibNV4HP0zk3fV2XtB2SJBOt3BbGGSTCpap9LOxVYuOUvkvA/1uxFoagoqL/
         zv1CR5l3lufJ3svKrTo4+0j7yMgS6MmdMbz92B43G1bmspyboSrlJUUE3CTIm4z2wG
         L5N9qz3PkcFWDuhAaLARDtS5Gt7MiUk9oHNfXRDU=
Date:   Thu, 13 Jun 2019 13:03:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Add cpg reset for
 LVDS Interface
Message-ID: <20190613100342.GB5259@pendragon.ideasonboard.com>
References: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com>
 <20190612121556.GK5035@pendragon.ideasonboard.com>
 <20190613100246.qa2lcbcgbyd3zuaz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190613100246.qa2lcbcgbyd3zuaz@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Jun 13, 2019 at 12:02:46PM +0200, Simon Horman wrote:
> On Wed, Jun 12, 2019 at 03:15:56PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 12, 2019 at 09:37:14AM +0200, Geert Uytterhoeven wrote:
> >> On Sun, Jun 9, 2019 at 1:11 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> >>> It is necessary to reset the LVDS Interface according to display on/off.
> >>> Therefore, this patch adds CPG reset properties in DU device node
> >>> for the R8A77995 SoC.
> >>>
> >>> This patch was inspired by a patch in the BSP by Takeshi Kihara <takeshi.kihara.df@renesas.com>.
> >>>
> >>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> >> 
> >> Thanks for your patch!
> >> 
> >>> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> >>> @@ -1001,6 +1001,8 @@
> >>>                         clocks = <&cpg CPG_MOD 724>,
> >>>                                  <&cpg CPG_MOD 723>;
> >>>                         clock-names = "du.0", "du.1";
> >>> +                       resets = <&cpg 724>, <&cpg 724>;
> >>> +                       reset-names = "du.0", "du.1";
> >> 
> >> These are not the LVDS resets, but the (shared) DU channel resets.
> >> 
> >> The LVDS interface has its own separate device node, so if you want to
> >> be able to reset that, you need to add reset properties to the LVDS
> >> node instead.
> >> 
> >> Note that I haven't reposted a new version of "[PATCH v2] dt-bindings:
> >> drm: rcar-du: Document optional reset properties"[1] yet, after the
> >> split off of the LVDS interface into its own device node. Laurent wanted
> >> to wait until the driver gained DU reset support.
> >> However, the above differs from my proposal, as it also adds "du.1",
> >> pointing to the same (shared) reset.
> >> With a fresh look (2 years later ;-), that actually makes sense, so
> >> perhaps I should change my proposal and repost? We do have shared
> >> resets in other places (e.g. USB).
> >> Laurent, what do you think?
> > 
> > For Gen3 reset is handled at the group level, so I think specifying one
> > entry per group is enough. If other SoCs require per-channel reset
> > (which would surprise me as it would then imply a big redesign of the DU
> > IP core, which may lead to a separate driver) we can always extend the
> > bindings accordingly.
> > 
> >> [1] https://lore.kernel.org/linux-renesas-soc/1488817556-21410-1-git-send-email-geert+renesas@glider.be/
> 
> Sorry, I'm a little unclear on what the suggested way forwards is here.
> 
> Is it to add a reset for du.0 but not du.1 ?

Correct.

-- 
Regards,

Laurent Pinchart
