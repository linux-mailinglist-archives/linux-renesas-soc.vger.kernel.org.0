Return-Path: <linux-renesas-soc+bounces-10966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE099E5AA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 17:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C241881D17
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 16:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6CC21C164;
	Thu,  5 Dec 2024 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UnJpm9IT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF191D515B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414571; cv=none; b=iNXGVitbxLDCZmaIkb8o+nkvS6d5BdmSnkRs0hNXvV0pOPFrw5A0Tk6E5uOLO/vt/VhMDOrulXKb6byh89tqKWD/HaLD04e7Im5zpibdcx6d4d2vfckOzul+FmB0lKqiZn+9QJWuN+CwSIWiKR16iYVdwSJIXXJacltQpSOUAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414571; c=relaxed/simple;
	bh=5CNDk+8jD3acxfGjsxHYw4KsUodGWUopn2X+ZsSUETw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBNiy20O+EMp/T7tTcg3lx9Tg8qVXtlQoUbN2kEI22ax31ZxYMlWvpdxxKzX8yvmP0WblWEeyk2LqCX68U05i13pXwZjG367Sqp2KP3/hFA/WZcMEBMygkFe8hpPKGTjevPDKtKMx94p9J2CdO2vXScfWvFSuTgSjLLsfmB13gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UnJpm9IT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA247E2;
	Thu,  5 Dec 2024 17:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733414537;
	bh=5CNDk+8jD3acxfGjsxHYw4KsUodGWUopn2X+ZsSUETw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnJpm9ITpRTSM0y98S7jkN2lS/yQFuyIiOEa/5WmdslxYBw+VM32lxkmYpNGX1cvX
	 JOkuhIeNpubE2ig5tJfzPL0Hnfli9EnWYoY9pdGZ2OYfPjbrWKEORLm6hg+Qspoyo3
	 LqaocJLk+pR6Hf8hGHb7kHdVwBXP08TFUmsJBioc=
Date: Thu, 5 Dec 2024 18:02:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
Message-ID: <20241205160234.GN10736@pendragon.ideasonboard.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
 <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>

On Thu, Dec 05, 2024 at 05:03:00PM +0200, Jani Nikula wrote:
> Building with clang and and W=1 leads to warning about unused
> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

https://lore.kernel.org/r/20240911095113.GB4470@pendragon.ideasonboard.com

I wonder if Dave and Sima are starting to ignore my pull request in the
hope I'll switch to using drm-misc :-S I'll send another one.

> ---
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> index 26a2f5ad8ee5..ea52b0af9226 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,7 +32,7 @@ struct rcar_cmm {
>  	} lut;
>  };
>  
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>  {
>  	return ioread32(rcmm->base + reg);
>  }

-- 
Regards,

Laurent Pinchart

