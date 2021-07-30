Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0553DBF0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 21:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhG3Tdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 15:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhG3Tdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 15:33:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2934C06175F;
        Fri, 30 Jul 2021 12:33:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E210C2A3;
        Fri, 30 Jul 2021 21:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627673608;
        bh=ok0naQzMlCI0ggY3MCduPnEZLiYeC3q7JCVFbjkuKBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wQ06hs0knVejc5QAd8CqkgdH4Ct/SQEIc95F++VL3jGUOhgRN4Wo5fj0GAbAM0swG
         h2wQ6Zg6/1g3x2IhosUMltFcbZTuhwGELuX2WA24YCcj+TOB+xh4KXvopwGCLrhBSt
         ejne5iel98vHNlL/6d/to81Ehrkgc9Mi/EwPXhs4=
Date:   Fri, 30 Jul 2021 22:33:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/7] drm: Extend COMPILE_TEST support to some ARM drivers
Message-ID: <YQRT/9xIH2PyACbt@pendragon.ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQLdDTu4duXXQXAs@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YQLdDTu4duXXQXAs@ravnborg.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Thu, Jul 29, 2021 at 06:53:33PM +0200, Sam Ravnborg wrote:
> On Wed, Jul 28, 2021 at 06:37:29PM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series stems from subsystem-wide changes I wanted to
> > compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
> > ARM build probably resulted in more time being spent writing these
> > patches, but hopefully they'll turn out to be useful for more people :-)
> > 
> > Patches 1/7 and 2/7 are fixes for compilation warnings on 64-bit
> > platforms in the omapdrm and sti-drm drivers. They are a dependency for
> > the Kconfig changes that follow to avoid introducing build warnings, but
> > could also be merged before.
> > 
> > Patches 3/7 to 7/7 enable compilation of the imx-dcss, omapdrm, sti-drm,
> > tegra-drm and tilcdc drivers on ARM64 with COMPILE_TEST. The patches are
> > independent from each other, so they can be picked by their respective
> > maintainers.
> > 
> > We could also extend test compilation to more architecture, but I didn't
> > want to remove all dependencies on ARM or ARM64 at this point for fear
> > or triggering build warnings that I wouldn't be able to catch locally.
> > If there's a consensus that fully relaxing the platform requirement is
> > better, I can submit a new version that does so and rely on the 0day bot
> > to catch issues.
>
> I have alpha, sparc64, and a few more so we can get pretty good coverage
> before it hits -next.

It seems that the consensus is to enable COMPILE_TEST on all platforms,
so I'll do that.

> If we enable more build coverage then please address all W=1 warnings
> first.
> 
> I for once always builds with W=1 these days, and I see more and more
> warnings sneaking in again.
> So lets try to keep the noise level down.

Hmmmm... I build my kernel with -Werror to make sure I catch all
warnings. W=1 doesn't play well with that :-S I'll see if I can turn the
additional warnings into non-errors, but that may become a game of
whack-a-mole.

-- 
Regards,

Laurent Pinchart
