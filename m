Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C7142554
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438740AbfFLMQO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:16:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436570AbfFLMQO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:16:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB4979B1;
        Wed, 12 Jun 2019 14:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560341772;
        bh=GMgV0nzfWbQT9RS/WzZ9G4VnZN8/etx8qhUiIxNa4Ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYlJkKMCaEdOAW7Wa6MrHCzrOuz7TlB12bHJ3Anff1eU4LIlp2HBIc/8piV71ax18
         mKbeAHdf2e9DWcFpYEEEdoAS5kQwZ7L+pr7gg8JwBQDcePUvh5iAEmzX/ZXIid/31/
         rPC9sx17tti908urwUVoQW48ErxbBt2yLDwqgRc8=
Date:   Wed, 12 Jun 2019 15:15:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Add cpg reset for
 LVDS Interface
Message-ID: <20190612121556.GK5035@pendragon.ideasonboard.com>
References: <1560078659-19236-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Jun 12, 2019 at 09:37:14AM +0200, Geert Uytterhoeven wrote:
> On Sun, Jun 9, 2019 at 1:11 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > It is necessary to reset the LVDS Interface according to display on/off.
> > Therefore, this patch adds CPG reset properties in DU device node
> > for the R8A77995 SoC.
> >
> > This patch was inspired by a patch in the BSP by Takeshi Kihara <takeshi.kihara.df@renesas.com>.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > @@ -1001,6 +1001,8 @@
> >                         clocks = <&cpg CPG_MOD 724>,
> >                                  <&cpg CPG_MOD 723>;
> >                         clock-names = "du.0", "du.1";
> > +                       resets = <&cpg 724>, <&cpg 724>;
> > +                       reset-names = "du.0", "du.1";
> 
> These are not the LVDS resets, but the (shared) DU channel resets.
> 
> The LVDS interface has its own separate device node, so if you want to
> be able to reset that, you need to add reset properties to the LVDS
> node instead.
> 
> Note that I haven't reposted a new version of "[PATCH v2] dt-bindings:
> drm: rcar-du: Document optional reset properties"[1] yet, after the
> split off of the LVDS interface into its own device node. Laurent wanted
> to wait until the driver gained DU reset support.
> However, the above differs from my proposal, as it also adds "du.1",
> pointing to the same (shared) reset.
> With a fresh look (2 years later ;-), that actually makes sense, so
> perhaps I should change my proposal and repost? We do have shared
> resets in other places (e.g. USB).
> Laurent, what do you think?

For Gen3 reset is handled at the group level, so I think specifying one
entry per group is enough. If other SoCs require per-channel reset
(which would surprise me as it would then imply a big redesign of the DU
IP core, which may lead to a separate driver) we can always extend the
bindings accordingly.

> [1] https://lore.kernel.org/linux-renesas-soc/1488817556-21410-1-git-send-email-geert+renesas@glider.be/

-- 
Regards,

Laurent Pinchart
