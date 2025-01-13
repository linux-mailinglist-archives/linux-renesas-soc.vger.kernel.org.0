Return-Path: <linux-renesas-soc+bounces-12075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EE0A0B0FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 09:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C14321887815
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2025 08:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E24233140;
	Mon, 13 Jan 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKuIxveU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB3233139
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2025 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756717; cv=none; b=TWyTlysHJZb5OXHi5Xi01dxlqRE8Bmnjj0PqMFHBeU2/45NRYXHcOttt8Tt7/DUQPm3Z77zm5ZJnQWZp+yHqe0XR8Ym7gqzVUzWs+GJuHpgbOHNoOSWpe78IduW5DJGkPGlwJ+4ahklfQUi0RMbW2Iv63AUVqxhSlSf7mhacCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756717; c=relaxed/simple;
	bh=5t/TrcuXNWNUZTuS5pgxHTJQKuHzmhw4UrOTlIJ4BOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z28UOIPZI4eVBL18LnDHT5H051tnSiuy1/6kGC92nWYmzTvepKvhAaPYEM81n1rXf1MvZ/tCKtX93bQG1ItEAFTwwehFkwqXNpeP6t9mH7aY0nreeu6l6E+gsH0+JBnIZRrg3Sw85GI4bW4OKqQYJIl4TCtbGOeRk9UT/xJ9Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKuIxveU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54025432becso3693227e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2025 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736756713; x=1737361513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=VKuIxveUwLt3RwsqOf2zdz43fjhwd0REq9TdceAA/AAgp+Mdq4Xba5PE9k0BGFuQYC
         os/xvPD2AjzWp+rKOF0LSlfm/D+H3qhAoETVYKVRvm0fXYE6AH3nNGSzfVN0WPORmacE
         JC3gAoqoXA9b8wBsoqzvLU7QtqIueS449tgcs1PLWEBQbV3Dnh/KR0RJnJU6AG66vLri
         cp6PF9f8RLLKT2F6gEng47/DpBkELHIAYTSNM4pJZ58RB2bj79hAMp6A1DfZhXsdRqxf
         u0jeUEuMvigo4bzKtMTApw4aMEQkPQmFClP7E1Yz2/Vfu45v5qrDCtsXDcscFEaw+Tr6
         6Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756713; x=1737361513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
        b=ixCCwIGQJWq2LZf28mj1QvdZcKXcFR1R1kejdv3/+hHe3UD7yPE5B2crbhwYG9R99N
         ZFsdeVMwNSQNbGXeOIyf87kfnHcZx0xxFpRLIO0t/999ajZz/TBAk7bbnw1LjLJuFeuL
         THPuqITSXMGON9rqJJvG6Ks2lMnvA+1epX0M4PvD/g7TGjzMWTiDvV48w4aznzFepXxA
         498f7r9ltSqUAgefnQDf1B2pF9O6fPwH1NpFUVDWZuLHQgCkNrnMjd3yF70HX+RupyvH
         d62dEx8b3CCqTKo+aBpcBbSADMWp1F8sHwKxKUfdVTIRb8i/dYA0aZC60wXb3GvVtt+6
         5u9w==
X-Forwarded-Encrypted: i=1; AJvYcCUKUWMmw6UNvVqut+AwxdZfpOkhD4Cn2qv/tVYsXaxGmKDjf7dYh2J9gtPZpgzffE70IS267U8b37gkV+n+BauERg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtk8+jKUm8TLp0HREZW31RAoxURUcn15oOA0yhAUi42fVUraor
	1XwSarXLk4OQxacRyUGSMRZI9zfFs8mBbXoAYQWKDkUz9uJLWUUGR8V7Z6iJ77E=
X-Gm-Gg: ASbGncu+w8M8oP/cb2Ksz+zXiBbB6OS0OVBEU83AwXErsgO1HON3mYbRav8Pm6RNaYA
	NS7UrI0jsB8waB8QWNcVpMceDiimRZL2nsA6TUwSFu328/1DC0aIwAvIbb53qtiHLiPWhBSkP1p
	R4xMKbkNMPBN9BsuRZkjB0hV2Vcd55EzZ9qyyHLIYQNuJyYZb/oOxo7y/o3H4hxZMJsqf5aANZ1
	B4f7F6TmJyu5cVqT6sPU20IxqIebDvpQtXyZHPQzry05h3TlrlqWDYyn9oV+P/yUUPOjZqKg4wN
	BiAwd7FGc55ni+ERbxYBAXyYCPPxKYzubqEK
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614;
        Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

