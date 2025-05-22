Return-Path: <linux-renesas-soc+bounces-17399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F6AC12BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 19:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E5DD172AD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 17:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2D2178CC8;
	Thu, 22 May 2025 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="NCjb52G5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219419C554
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936573; cv=none; b=gIrmUHQoACmVd1b8JdHXbaRDHYa+alLmjmI82W/8N4uHw5DV3EPHGAWoj3Px/YreCL2UQsB5yeXUh7aqBayboyEgKzuKgncuGmeIWlCkAXVIQlUS1Hcm1VeroSWzLA4rFsueW6Tj4X8XljPvA09DibPrYXD1q6wHdr+n94qfc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936573; c=relaxed/simple;
	bh=k/oj3DAXey12//Sssfoel9lq6dRmNT8FNh3S38nYtNo=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=WK0ilYyrxFNztbOacZ9E1r9CnhIcWH47VKjiCuQdcC4q34f+VTFhXe14Cti62oDtqmYqUAlSw2+IWXofLXiG36ZcD6j4c4KNCII9fbia7woQHWpEafVD6fBr7gct4hctZNUQI116nYyKKMQoBObPnVHabqXc0TnZhKNAJ3RRjSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=NCjb52G5; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=P2jR42BJ84a6/4v6Tk7yEHFhGBl7qZVYNxnSb7kf4bE=; b=NCjb52G54QW3P01kTMqQVoJeOw
	vQ4uhOcGHtjZOg6fMpnzKYo0DgFtXTAgHnoNrdrR5qtbHOvFixTw1tHZgai9fJcOXcaUzxfJf+Wp8
	2quubFpZ8Vv2eacFKV52Ot+ErkQvDIYwT+jr7Cz2T7d5yO15OQlWl67ZvDYPZ06TErls=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:49436 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uIA99-0007vP-Fe; Thu, 22 May 2025 13:55:59 -0400
Date: Thu, 22 May 2025 13:55:59 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-Id: <20250522135559.602fd1a5d3914e292b7a3b62@hugovil.com>
In-Reply-To: <20250521210335.3149065-1-chris.brandt@renesas.com>
References: <20250521210335.3149065-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2] drm: renesas: rz-du: Add atomic_pre_enable
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Wed, 21 May 2025 17:03:35 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> When drm_panel.prepare_prev_first is set to true in a panel driver, the
> panel expects the MIPI DSI hardware to be already configured before the
> panel's prepare function is called because it might need to send DCS
> commands.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Tested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Tested by setting "drm_panel.prepare_prev_first = true" with two
different LCD panels.

Hugo


> ---
> v1->v2
>  - Fixed alignment reported by checkpatch
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 4550c6d84796..1202e0ce0188 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -531,8 +531,8 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
>  				 flags);
>  }
>  
> -static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> -					 struct drm_atomic_state *state)
> +static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
>  {
>  	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
>  	const struct drm_display_mode *mode;
> @@ -549,6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  		return;
>  
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +	int ret;
>  
>  	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
> @@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
>  	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,
> -- 
> 2.34.1
> 
> 

