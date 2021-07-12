Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE9C3C5B91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhGLLrP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:47:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhGLLrP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:47:15 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24711CC;
        Mon, 12 Jul 2021 13:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626090266;
        bh=XqvfFlF8lWzDSZjHRwbA9CTfbpcL6Rcyr2revonNgPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LH4C8+HkcahNY97LrtSlIOcY2DtSACoQpivpMiW3GhRTH/x0WFpd7yAqJ7DNirwTc
         dEhvy2yTIRIqGm8lfKU+L4dTscs6/3F/yJYLX3JP4EBPbwZZO3SFu5yA69WkSTT1WT
         gJxVpfb8PY3R8LjxRihP5IroyHDnJD7I5XCQQor0=
Date:   Mon, 12 Jul 2021 14:43:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Restore graphical consoles
Message-ID: <YOwq65XMf8jBVQ4I@pendragon.ideasonboard.com>
References: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
 <YOwmfqZnVzcsp+T/@pendragon.ideasonboard.com>
 <CAMuHMdU2JKtnRWj-TsS+NxRN5hoapRRMgrmmZJY5agN6G-z_NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2JKtnRWj-TsS+NxRN5hoapRRMgrmmZJY5agN6G-z_NQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Jul 12, 2021 at 01:35:34PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 12, 2021 at 1:25 PM Laurent Pinchart wrote:
> > On Mon, Jul 12, 2021 at 12:16:57PM +0200, Geert Uytterhoeven wrote:
> > > As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
> > > CONFIG_FB"), CONFIG_FB is no longer auto-enabled.  While CONFIG_FB may
> > > be considered unneeded for systems where graphics is provided by a DRM
> > > driver, R-Mobile A1 still relies on a frame buffer device driver for
> > > graphics support.
> > >
> > > Restore support for graphics on R-Mobile A1 and graphical consoles on
> > > DRM-based systems by explicitly enabling CONFIG_FB in the defconfig for
> > > Renesas ARM systems.
> >
> > Does anyone still care about the Armadillo board ?
> 
> I do. It's my only Renesas board with graphical output ;-)

I recommend a VGA or HDMI monitor :-) The sh-mobile-lcdcfb driver is
unmaintained. If nostalgia is a big enough drive factor, you could try
converting R-Mobile A1 to the shmob-drm driver :-)

> > This being said, I think CONFIG_FB should be added , but for a different
> > reason. There's no KMS console driver, so the only option we have today,
> > even when a KMS driver is available, is to go through FBDEV emulation,
> > which requires CONFIG_FB to be enabled.
> 
> That's covered by "Restore [...] graphical consoles on DRM-based
> systems", right?

I had read the commit message as implying that a graphical console can
be available without FB when a KMS driver is available.

-- 
Regards,

Laurent Pinchart
