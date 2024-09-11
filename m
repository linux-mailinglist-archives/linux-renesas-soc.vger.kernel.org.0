Return-Path: <linux-renesas-soc+bounces-8935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C0974F11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2024 11:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780BF1C20B3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2024 09:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E0213D510;
	Wed, 11 Sep 2024 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vgcwAQGO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A97224F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Sep 2024 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726048317; cv=none; b=YmHPKibFJoqmdug3ICanmsRBTFkC2z0ESrbRl5y5iAlzjgj4H6jxLyHSD5Z1U+zIR2OSHsnko1FEIvivjReXjtbpludaCrFM+zcOpXbUimbSn5cAebY/qmv1uYUqRPsHJncmDJgIxnIBoFq11iNY2MXf1WDw1DWez1HPTv4m238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726048317; c=relaxed/simple;
	bh=E5X0N4knkqpIVRCMt7kxebRIQnXbxg+DEiCRGEwvRDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlhAKUY9HjtjZ23T9/BHICsubcBNjS6LQSldrpJ5TysegBpQZenZO7QMwrOKunTKp0BHh3PhuoqniDcFWt82xSZkzNxpMHlqj/dU+Ej0clNrKly/E5LdF6iFbhVba3210drgaHxGDgm7ogk9A63DspQ+rDtyeq366urhxbVWpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vgcwAQGO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7448D5B3;
	Wed, 11 Sep 2024 11:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726048230;
	bh=E5X0N4knkqpIVRCMt7kxebRIQnXbxg+DEiCRGEwvRDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vgcwAQGOKF8g6aC4YH5Z/YW+QqJDzkNWKxzkA4N9Yvy44FowsyepwIRbzc0TRoZ3u
	 aIg6hZJ/evWK0sautqefLLCAE9+FkUkkdJ0u1c+9CE/fgcxwO6DFsuKjc+KPYEBxr9
	 K9Cxgiwz7hm8px4beniPYY85iim5fGQBXmYP19Mo=
Date: Wed, 11 Sep 2024 12:51:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read() with
 __maybe_unused
Message-ID: <20240911095113.GB4470@pendragon.ideasonboard.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
 <87jzfjk4vy.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzfjk4vy.fsf@intel.com>

On Tue, Sep 10, 2024 at 04:36:01PM +0300, Jani Nikula wrote:
> On Tue, 10 Sep 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Hi Jani,
> >
> > On Tue, Sep 10, 2024 at 12:06 PM Jani Nikula <jani.nikula@intel.com> wrote:
> >> Building with clang and and W=1 leads to warning about unused
> >> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
> >>
> >> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >> inline functions for W=1 build").
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> >> @@ -32,7 +32,7 @@ struct rcar_cmm {
> >>         } lut;
> >>  };
> >>
> >> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> >> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> >>  {
> >>         return ioread32(rcmm->base + reg);
> >>  }
> >
> > This function was never used. Why not remove it instead?
> 
> Can do if that's what the maintainers desire. It's just that sometimes
> it's better to have the implementation reviewed and ready waiting for
> the users than requiring the first user to add the implementation. I
> opted for __maybe_unused across the series.

Jiapeng Chong has sent a patch to drop the function, and I've reviewed
it. See https://lore.kernel.org/r/20240619075436.86407-1-jiapeng.chong@linux.alibaba.com

I've sent a pull request for v6.12 but it hasn't been processed in time
:-( See https://lore.kernel.org/r/20240822234445.GA23541@pendragon.ideasonboard.com

-- 
Regards,

Laurent Pinchart

