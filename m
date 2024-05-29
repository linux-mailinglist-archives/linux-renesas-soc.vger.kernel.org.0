Return-Path: <linux-renesas-soc+bounces-5668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DB8D3BDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 18:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23B621C248A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 16:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57045181CF8;
	Wed, 29 May 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eHBxF7Fo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D314291E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998807; cv=none; b=srTk4o0UnrbF+9CJEYUg0f2bofFyMoPLpZjJbGr6p8jMli6D/1jZp8z6Yov9l0KBzlpL7iGuAKXCvTFrEAzH+d17samdN+mRe85KrXula2BQAn3ISCLq5t0dcRtKHuj3NsDpK6haQvvKRLqKFCkgJXRPSeJ4rW/qgXmJtwSvQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998807; c=relaxed/simple;
	bh=fDnly2tUhRuwmNSrfSy+Wd07EpJqc4K96zVcqbux54U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxR7M6AoAPnOKAHH2LmxHgPIVl3AQmSLPVkp6D4HoGcHSGMuDuYembjkPloKI6bUP8DNCYSR2l8gSNzDMo/JQE1MvWD3B4UucJ4dfOxussLTdYL51HfN285YwOtSHArrTOIFL9lavU0CBcKtd/ZI9OdoBJxrh1wEQ1i+cnd47BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eHBxF7Fo; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716998802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0B0orRSVXeRsISQcfG64605/nqIQ5aF+rELBmkvuJc=;
	b=eHBxF7FoYnQeIJdXyrbp9wXAwXze6wqtzgUmOrfal4uvv7S2DWwITXkGQbLw5p+PWGLsWu
	mLj7UsNfX2ozuBS5aWD1eHvxtq6EtsZORZozhm3JFO/JKgK2yQgdmjvIv6LS8KG0vHUKLs
	+aWnDv3fsTqCMA82Crl7Y6Vb+4FsXA8=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-renesas-soc@vger.kernel.org
X-Envelope-To: dianders@chromium.org
Message-ID: <170bf071-fc33-4892-bf65-b52eddd796b0@linux.dev>
Date: Thu, 30 May 2024 00:03:59 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [resend,v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/5/29 20:16, Geert Uytterhoeven wrote:
> From: Douglas Anderson <dianders@chromium.org>
>
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_helper_force_disable_all() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case of
> OS shutdown comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.


True, looks safer.


> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
> [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Best regards,
Sui


