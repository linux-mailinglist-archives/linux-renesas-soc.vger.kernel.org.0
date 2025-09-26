Return-Path: <linux-renesas-soc+bounces-22399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695AABA2DDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2995A625EE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 07:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E052836A6;
	Fri, 26 Sep 2025 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkP4eDT0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821826E6E1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758873479; cv=none; b=TjK/KDKAuAbu30hatMww2LRh4ezGniPxSciWTRP8M8qV0ttF8ZrsidlQJ9G5BuBSLm3tbOSATGqIg/euk+cQLumd4+QtFdm4l+1hAErFV3wmTXnlO6Yb4VOSa2ga+oAIIqNpk+DHY+WVIzL7+tj1VrAItXAEqL8ioL/OQm/lQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758873479; c=relaxed/simple;
	bh=wQX2+e06nx3AF2Bto4vUnWY1OLat3znhbrwGZTqgXuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LJS4x6l57mvMgghYHD6XtN4GIVtZIVtqIatzxHIrYU68Cu97UeqYbffDgQ3UNlrQPUmFe9xUgULKuutYVkQ+5w5g6ycFHTulP1hX2PEHbVdFmbE4IGNUDg2pvcXoZO01fPmFPPKOG7aiJRVfpmEroYwLaP1jRznlSQQ0Mzrv3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkP4eDT0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758873478; x=1790409478;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=wQX2+e06nx3AF2Bto4vUnWY1OLat3znhbrwGZTqgXuM=;
  b=UkP4eDT0y0wvMtZvfWEtBl+6rqzYumnZnPrDEXH/9sjQFJfwYdZZiSFL
   l9gsw2ahe9cVjGfcPCsFu3C+HCNWI6nKpBhbjhecAnW1kIL7+VTFetpp6
   LHDXuUThiQC21CLoGwLyB46LLZKMWu74WoSGGj0mcCxJMdipWI1RnY2KX
   pCSd4ia0O0a7WuXy5rwLGU/7vVC5cdDFvq0tsgAw8pObu5o68I/rb+vp3
   +VQ+a1pTsWClCdgX6eNDg7uAHuYECidZneqFoYpgSbBcnqorwxqeSGgf2
   LxF4McuAopxEPH5T7k4FsYRWW9pzHYyldaNNZYm0Cc4CM6oNJBewUsR7H
   w==;
X-CSE-ConnectionGUID: 14/IbHcqQ7q9fb0UH4oJQQ==
X-CSE-MsgGUID: jHSfUbYAQYGomV1+zPGDsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72565962"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="72565962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 00:57:57 -0700
X-CSE-ConnectionGUID: LL22015qTLyX1DmBS8ZSSA==
X-CSE-MsgGUID: U+cJtfFwTqalWDZUNmwPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="178309997"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.10])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 00:57:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, David Airlie
 <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Date: Fri, 26 Sep 2025 10:57:49 +0300
Message-ID: <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 24 Sep 2025, Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> Most of this patchset is boring mechanical conversion.

I suggest using the relatively new sized BIT_U32() and GENMASK_U32(), or
other sizes if your register sizes are different. You'll get better
compile time protection against mistakes, and sometimes the unsigned
long type of plain BIT() and GENMASK() can be annoying.

BR,
Jani.


>
> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
> should not have any adverse effect on existing hardware.
>
> Marek Vasut (10):
>   drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>   drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>   drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>   drm/rcar-du: dsi: Clean up VCLKSET register macros
>   drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>   drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>   drm/rcar-du: dsi: Respect DSI mode flags
>   drm/rcar-du: dsi: Clean up handling of DRM mode flags
>   drm/rcar-du: dsi: Convert register bits to BIT() macro
>   drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
>
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  89 +++--
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 363 +++++++++---------
>  2 files changed, 232 insertions(+), 220 deletions(-)
>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org

-- 
Jani Nikula, Intel

