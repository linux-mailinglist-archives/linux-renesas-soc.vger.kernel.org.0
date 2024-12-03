Return-Path: <linux-renesas-soc+bounces-10863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0B9E2B0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 19:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8798FB27EC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233531F8AD2;
	Tue,  3 Dec 2024 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/sPXwUL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB951F9F7C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247429; cv=none; b=CvxiwnL9FnLjosjMZXEB7TqoMFflgX9Ow3EWNKG/L6UlNRvfr4F8Dr8e0MKwk1Qp/Z40CtVQDeHchFdzSIfjzNCl46CAWYYd7YgbOkXcrumykNvoY1YfQ6F5sJuq12yAN6Tmpn8VD8+6QAl64J8loikJdsxClpxv1mrtaYs3LcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247429; c=relaxed/simple;
	bh=w7mAofiWzyf8juvu3AM7qcBAsuCXIoSz/RIAPv7U6Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFEVXG1UrKgblRTsj4LNFPxoQkdOu0+QXX+lK9LdQzZAMHP6c57DzIiUAdk05tgRPBKgCgvhbhRN/fUHKR6TBBZM21wWxIoAKyNH8lPbo0v4iv8tpBtTtQC3qasFATAU4NU4iBqw5h/XHtFI65x5wcFs/QRZHYUFR58Gyxq8WH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/sPXwUL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de6b7da14so5726676e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733247425; x=1733852225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0ycjfZzwnPcCeUDtH0/9f2OzsKqNdVBQ5imE6kMpyI=;
        b=x/sPXwULTNWCfUD4BW5jgLYSrIZ6+OdFZtGYXGnRn2fLCahYRYcd5k33zw+vCeXYbj
         WtbmQU2kTOaxlpZyP658E6K/dQ2vbEFmzXc2cw9mQ4HSLUU0g6Blw8FZUY0qZipUJEls
         wLNuZyyUvrhNFIEyKjJGwBWntbQY4ndCyzOJfPqQaB1FBp873QVJlBg0y1xoEcM82LGp
         8GGNfWZP2kErSJhcpzcepeIFjtGpDLozGc16jgC5ZwTLzZ31xCE20eHo/oiuVuX64/pn
         oVvq9dpktinPArRUUBaQRsgKY36krj2q1t9TG+r5fgI0OTTKjFMrGRewnhtUXO8fvbbq
         jBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247425; x=1733852225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0ycjfZzwnPcCeUDtH0/9f2OzsKqNdVBQ5imE6kMpyI=;
        b=miGwMKMPDw5qo2RWSqdzU96mh6Z8pTM2xswkQ/On/AiSEdVVFjoD4xNJ7nvSoJKttQ
         mQH96sYawuud+3/iBpvbbAEckn/JXdTsgcIUH00pQjaPGEYG+OxHCV6xmN+0ScW7vaeX
         KTFrcSSDJUrL/4x4e1JuqLot81Rtg+tUNG2GZGGl3zGJ1kSjyC53WuP8KgP0UlUPxG2n
         IzdqD7uBaWLLpVNnK3YCRqaJXE0IYcdXqRknegQZipbJF4xlDsyLmwHAl2WS3DgjbmKt
         1bpyZOi7qM8OVie0TSHwG+u5Kp/7JTZFGe6lSgcdiWpueJa9zss2AAXGSZ7iN8Ooo1SG
         /lqg==
X-Gm-Message-State: AOJu0YwDc2gUuhphWhtgj5wfbHkTtweeSMr14k8AcpmxbbYqDQpD/7Eh
	fDA94JSLgtKQNOjj2+BI8mDdYh5ZKSqaQ66JP56UiiB3XfnJ3OnnWcrhbo1G7fc=
X-Gm-Gg: ASbGncsrf5sb4A0lBD9hpDYGFt2yess9m22rrwtwMwb91ZL50jfwQRBczvDIqULJZYv
	HvH7PSDAGZiaIWevxh0/A0wf1sosok37yhpJPo8D+q6u/ROMYKbILw9nzWx28zHR/p9i6VaKq1k
	z/op7DzezxnCoQ0FnXAe95xYQlvBtR9eaOaDJSYA+9bKkJz/LMffP+FWYTjQOTWcqUw3RCnPhYI
	6ddh0q75JHyNEVcH/AnaNiNOWYUcentCj449voKOE2oX1IbbCs7+HJmnvH4vpRuOol8icViKwFf
	upq02XpS/uF/oQlYbNoZlZ4KKCSevQ==
X-Google-Smtp-Source: AGHT+IE+iThB2rDkPXhvDwKDCV995m9FRY0n6NLKd/YWSdF2FKr6uqn66k8o0X2h8rNCUXaQsEfXfg==
X-Received: by 2002:a05:6512:4028:b0:53d:ec9a:4e6d with SMTP id 2adb3069b0e04-53e1b8b6f05mr505370e87.46.1733247425267;
        Tue, 03 Dec 2024 09:37:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443385sm1916238e87.95.2024.12.03.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:37:04 -0800 (PST)
Date: Tue, 3 Dec 2024 19:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	biju.das.jz@bp.renesas.com, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>

On Tue, Dec 03, 2024 at 06:21:29PM +0100, tomm.merciai@gmail.com wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA and VESA input formats.

For the patch itself,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A more generic question: is the bridge limited to 4 lanes or does it
support 3-lane or 5-lane configurations?

> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index cbabd4e20d3e..83d1db29157a 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -48,6 +48,7 @@
>  #define  REG_COL_DEP			GENMASK(1, 0)
>  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
>  #define  OUT_MAP			BIT(4)
> +#define  VESA				BIT(4)
>  #define  JEIDA				0
>  #define  REG_DESSC_ENB			BIT(6)
>  #define  DMODE				BIT(7)
> @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
>  	fsleep(10000);
>  }
>  
> +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
> +{
> +	switch (input_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		return true;
> +	}
> +	return false;
> +}
> +

-- 
With best wishes
Dmitry

