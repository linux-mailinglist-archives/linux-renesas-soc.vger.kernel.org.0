Return-Path: <linux-renesas-soc+bounces-4395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33689D4B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 10:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF17B21524
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 08:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712B757334;
	Tue,  9 Apr 2024 08:36:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E2A7E765
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712651760; cv=none; b=Ui6tHqKnmtPe4RYmsHP7IgYl6uLEy/RAjgmohwU/7hHs1Y9rEufpDmHdTxsWemXb6Gmj9ubCaqJO7tye5mkrtPbvyI42xvR3Tsa5MvFunUMNwK5oFm0/0LPzeY3HfWXnIt1TOpYnv8RKdpHKFmVUWglf4GufoIRtluEMTEb6pjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712651760; c=relaxed/simple;
	bh=IfVCddayH7pjxgbOhhwy98xkQY9CqS2oLX/1ICzN1Xc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=llDwld3NR4veWfoAlle1ZPuZO9n9EYIHqP26a/OTzXGTcNbtpGBy9J8rxVmj4/IbgZfUPabB5ug0rpIi2DipQ0u64gaP/h752FA8+LJSuiKS2OKHQlH/pimFOTuxdE+oEdE2MBqHHk4fO6hkF71NwxO6kQpXid3DIFG3tHcu+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 8wbp2C00C0SSLxL01wbppr; Tue, 09 Apr 2024 10:35:50 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ru6xJ-00CuUk-Ae;
	Tue, 09 Apr 2024 10:35:49 +0200
Date: Tue, 9 Apr 2024 10:35:49 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@kernel.org>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
    dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
    linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends
 on
In-Reply-To: <20240327-kms-kconfig-helpers-v3-9-eafee11b84b3@kernel.org>
Message-ID: <b601bc8-b016-e5af-b6ce-eb26d01413c1@linux-m68k.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org> <20240327-kms-kconfig-helpers-v3-9-eafee11b84b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Maxime,

Thanks for your patch, which is now commit 4d15125d7fe637f4
("drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on") in
drm/drm-next (next-20240402 and later).

On Wed, 27 Mar 2024, Maxime Ripard wrote:
> Most of our helpers have relied on being selected so far through
> Kconfig, but that creates issues when we have multiple layers of helpers
> with some depending on others.
>
> Indeed, select doesn't select a dependency's dependencies, and thus
> isn't super intuitive. Depends on however doesn't have that limitation,

(Almost?) Everywhere else we fixed that by also selecting the
dependencies, which is more user-friendly.

> so we can just switch all the drivers that were selecting
> DRM_DISPLAY_DP_AUX_BUS to depend on it.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -9,10 +9,11 @@ config DRM_DISPLAY_HELPER
>
> config DRM_DISPLAY_DP_AUX_BUS
> 	tristate "DRM DisplayPort AUX bus support"
> 	depends on DRM
> 	depends on OF || COMPILE_TEST
> +	default y

(quoting Linus) "What is so special about your driver, that it needs to
default to enabled?".

Especially as there is no help available for this option, so the casual
user has no idea if this is needed or not.

And a general comment for this series: many defconfigs need to be
updated, as drivers are no longer enabled because they need
functionality that now needs to be enabled explicitly.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

