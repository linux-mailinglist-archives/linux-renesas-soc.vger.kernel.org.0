Return-Path: <linux-renesas-soc+bounces-21547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C800CB48481
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 08:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E41D173C2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 06:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1C329293D;
	Mon,  8 Sep 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XGOEZ/gR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09D22FE0D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Sep 2025 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314451; cv=none; b=MlPgevJQrWVhMkhRcDrCmjrEwRgq7GSTSZlt6C+YmWqE1S/L7xZ7B43bct1NJ65piSN5xyLwwLlilusW2fu/ArEm1zC6ojNo5MeMsuu69ic4XljJoBSSlLozd+LwA5rVM4UooMzrCC76Fqrpjzf/wQiCewbdOnSs7MV+dkG/0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314451; c=relaxed/simple;
	bh=89Kcw2gLgaJYgm7Wgq9e1Mu15pHehUERgjbrZ4hW2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXw9JPRoxBN11fXPJPuw0VNV3Vwukz5Q4aTWd7f92BaXdxyy8k14FWaIuiuApdjb4yQWOumEWZY5reYFnOaVyl2ETX9eNpxNyG/oHQ6/5dWW4KFoANDX9T4A6Hm3xFkIgl3cOfr4zLEZ2SyDHyu5Jb2exi3+pw/VkhZ+/T8sXNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XGOEZ/gR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E6C799F;
	Mon,  8 Sep 2025 08:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757314373;
	bh=89Kcw2gLgaJYgm7Wgq9e1Mu15pHehUERgjbrZ4hW2gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XGOEZ/gR2CN8N/K+PTgsoTH8wgiyU0sVR2ENTsbcs3yyEdxTEN/fswqFR9P4EG1fQ
	 ftuWjIAP3wWgnAOqGsJd5iaJ+oJXoWH4DHFJyOSubLMlMJZEltaMyIlmxmW/R5YCEm
	 v4fRoyBhIKcN03Q5oqrTpZqs/HB7UL9d4i0JH3Ts=
Message-ID: <b3332d6c-08e8-427d-a928-bdc94ab48940@ideasonboard.com>
Date: Mon, 8 Sep 2025 09:54:02 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 04/09/2025 18:31, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Display Unit LVDS driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
> kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
> on PM, the code may still serve as an example for new drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> index 4dcb36dc0bff6e53..6d44238c4078a425 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -1013,7 +1013,7 @@ static int rcar_lvds_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rcar_lvds_pm_ops = {
> -	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver rcar_lvds_platform_driver = {
> @@ -1021,7 +1021,7 @@ static struct platform_driver rcar_lvds_platform_driver = {
>  	.remove		= rcar_lvds_remove,
>  	.driver		= {
>  		.name	= "rcar-lvds",
> -		.pm	= &rcar_lvds_pm_ops,
> +		.pm	= pm_ptr(&rcar_lvds_pm_ops),
>  		.of_match_table = rcar_lvds_of_table,
>  	},
>  };

Thanks, pushing to drm-misc-next.

 Tomi


