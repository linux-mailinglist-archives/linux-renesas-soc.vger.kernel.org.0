Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBC93C5BBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 14:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhGLLs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:48:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhGLLs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:48:28 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0440CC;
        Mon, 12 Jul 2021 13:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626090339;
        bh=LpXj4jsBWJOpYy/FeuZCj7ir0OWMOuVE8x277jtC9V8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FuYw92Xef5RdMK4jm9kiLjxcWUFXrD88uiVSUBRHdZr9m3sNjGeWV0TZLYPguJMF+
         5X/NzwaN4DeFK0e74hplnwf6Sy3cpr0cU6awzy4QkXgFIjKosFEKnHyCrVqMvZCvlW
         Xy/0shopEYcFx+jR0qQYTXeCilNfDyFokiRULjAI=
Date:   Mon, 12 Jul 2021 14:44:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH LOCAL] arm64: renesas: defconfig: Restore graphical
 consoles
Message-ID: <YOwrNQ2qfGy+fvFc@pendragon.ideasonboard.com>
References: <4a671ef00b3469f8b7ffd42309c3dfb1ccb8eb8a.1626085156.git.geert+renesas@glider.be>
 <YOwlv26H1pYVCny0@pendragon.ideasonboard.com>
 <CAMuHMdUsM0EhTbsVPuxuMi5Pm3OctWJ7uwJxAzB1Q_RuKaZcjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsM0EhTbsVPuxuMi5Pm3OctWJ7uwJxAzB1Q_RuKaZcjw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 12, 2021 at 01:36:19PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 12, 2021 at 1:22 PM Laurent Pinchart wrote:
> > On Mon, Jul 12, 2021 at 12:19:33PM +0200, Geert Uytterhoeven wrote:
> > > As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> > > CONFIG_FB"), CONFIG_FB is no longer auto-enabled.
> > >
> > > Restore support for graphical consoles by enabling it explicitly in the
> > > defconfig for Renesas R-Car Gen3 and RZ/G2 systems.
> > >
> > > Fixes: f611b1e7624ccdbd ("drm: Avoid circular dependencies for CONFIG_FB")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Not intended for upstream merge.
> >
> > Why not ? We have no KMS console driver yet, FB is currently the only
> > option.
> 
> Because there is no renesas-defconfig in upstream.

Obviously. I'll wake up first and then continue reviewing patches...

> > > To be queued in topic/renesas-defconfig, unless the rcar-du experts
> > > consider CONFIG_FB to be no longer needed nor wanted on systems where
> > > graphics are provided by a DRM driver.

-- 
Regards,

Laurent Pinchart
