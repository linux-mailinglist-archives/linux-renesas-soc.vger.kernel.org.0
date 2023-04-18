Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593EF6E5BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjDRIKP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjDRIKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:10:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DFD86A1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 01:09:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 967E6802;
        Tue, 18 Apr 2023 10:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681805350;
        bh=NuC002o01Die+SqNlcXkQatYTWFiikr0m8g660PcWhM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fp6/1bosVgjbWXfJW+Rn8RnCehyQAXPszKmTtpnuCHdzOdhbEZatqNfhtgofoSCzu
         oGQWLf7+VpSRdNuL68fkrhFjaloPbB+WVjXxFCr2vhqHXRpegITiDIfLiJuJ2p5BQ0
         l+fOvytPYrXpmZ4GwSxjQCQx+NFj0wTKTvkWIQEo=
Date:   Tue, 18 Apr 2023 11:09:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
Message-ID: <20230418080928.GA30837@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
 <20230418075000.GF4703@pendragon.ideasonboard.com>
 <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Apr 18, 2023 at 10:00:35AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 18, 2023 at 9:49 AM Laurent Pinchart wrote:
> > On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> > > Currently, there are two drivers for the LCD controller on Renesas
> > > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> > >   1. sh_mobile_lcdcfb, using the fbdev framework,
> > >   2. shmob_drm, using the DRM framework.
> > > However, only the former driver can be used, as all platform support
> > > integrates the former.  None of these drivers support DT-based systems.
> > >
> > > This patch series is a first step to enable the SH-Mobile DRM driver for
> > > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
> > > to add DT support.
> > >
> > > Changes compared to v1:
> > >   - Add Reviewed-by,
> > >   - Drop dependency on ARM.
> > >
> > > This has been tested on the R-Mobile A1-based Atmark Techno
> > > Armadillo-800-EVA development board, using a temporary
> > > platform-enablement patch[1].
> > >
> > > Thanks for applying to drm-misc!
> >
> > Would you like to request drm-misc committer rights ? :-)
> 
> Don't the listed maintainers for drivers/gpu/drm/shmobile/ don't
> have such access already?

Actually, as you're taking over maintenance for this driver, would you
send a patch to update MAINTAINERS ?

-- 
Regards,

Laurent Pinchart
