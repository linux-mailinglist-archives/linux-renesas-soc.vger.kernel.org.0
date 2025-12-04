Return-Path: <linux-renesas-soc+bounces-25556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CECA43F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 16:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFF73031716
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193D23EABD;
	Thu,  4 Dec 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Muw99Q3o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DC19D8AC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764861379; cv=none; b=RM3PStqxXNmBd7/KsrDUZENpZMyrIneFL3p3D/4etix27fNwDbkr7K4w48l6Tv7EuJ9T2hM0gzVGqoZY+3KsnS9uYnE6dgSUr+ugb4Joq+crMeO/np+5zbiodJydIQtyvnr2e6mL8vLpRpin5dt8OWGdZn15RdGb2ZhvidvShCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764861379; c=relaxed/simple;
	bh=qjOIvShGhmLljPUFevXVcg8QRdXTO63XF54qsgX6o3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldTGrIn1tGVD3Tm8+ks5CaEPFRgGkosa6BMtylv6JBk22TKPvBrjonBHyVtgIwiC+qjvIqzY9DysgSiKQIWYM3QPlibgxBSTLAuZKa1icY2hWUpOLKyGrbZpogE+pXCKHoQOAVMdrxTHMDXUGpB2lg6igwRQ/0dxgG97/j78Tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Muw99Q3o; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <369afee2-2ae9-4dee-ab0c-c9f196c8dbb1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764861375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1WFKmJAqdQOsrn5LBL7ihECviyJrkF8uPSQqPQKLmw=;
	b=Muw99Q3oLkmh1GuLJgjVocivZRtHEuRhrWoQoFNBg0w4a3Ls2dUzsY7oeA/sGkzfk9x3ql
	HrtQbATnA74HAQFpZw+uAFrZra1Kaj8/4p6+YtXR4BXBkjUMgBsT7oHR7gUXN/KZ47a8OP
	wwl5iU0UrWDxHndsG6QlPgaGmCldnBI=
Date: Thu, 4 Dec 2025 15:16:10 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 02/12/2025 21:02, Linus Walleij wrote:
> This fixes two regressions experienced in the MCDE and
> R-Car DU DRM drivers after
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.>
> This series make it possible to selectively bring back the
> old behaviour with explicit semantics and implements
> the old behaviour as modified commit tails in MCDE and
> R-Car DU.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Thank you for your patches, Linus. I am sorry multiple drivers had
regressed due the original patches.

I haven't been tracking the mailing lists actively past few weeks, and
only came across this when Laurent mentioned a patch from the v3 of this
series a couple days back in a discussion for the Rockchip drivers.

My email-id that is indeed used in all those conversations is long gone,
and I had hoped having the newer email-id in the sign-off-by tags would
make up for it. Perhaps that wasn't the case.


I am a little late, but I did give a look at the v6. I don't for-see any
concerns with it.


--
Regards
Aradhya



