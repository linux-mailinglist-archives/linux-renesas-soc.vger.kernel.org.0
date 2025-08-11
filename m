Return-Path: <linux-renesas-soc+bounces-20214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E5B203F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF407A53F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D11223DED;
	Mon, 11 Aug 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L0/QhBZi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C39221FBE;
	Mon, 11 Aug 2025 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905228; cv=none; b=ZbHvENYayULC4kupG/xpGEiGz2dhKg9Ji983vqJcEAh5QpQkdB0RxsZzLnXww1C8eMSTp1LGK2Kdjn7uT5RLIfLQ4+w1lFGuf1zCniQJbcz1T1MamOvxOaacJ0ntT2t2GNIx23QDck7POky5AYVF0UYCHHKxJCI9kWQvcXwsBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905228; c=relaxed/simple;
	bh=ErWu5p3IP8zhvqO/d0BfVnobP6PnfSl2P3urZEEN7C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHADa9630P10qLTskHii/GwklPRNDARbx1wSslpzXFU+TGs60njQs5u5BP9ZDp5hVL1trtsbqXWPCzYCtnX3urLR++s+S9uNQ5Pn6RIIx4O8HCRID3zz8f6KJtLwkoZv9Fehfn/lIZ2HgxsnA6II9l9maa/9nwteO4KrqkpWL8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L0/QhBZi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C719D4A4;
	Mon, 11 Aug 2025 11:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754905171;
	bh=ErWu5p3IP8zhvqO/d0BfVnobP6PnfSl2P3urZEEN7C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0/QhBZig6BVj0w2QIWmeTytqJiK1SPyjyoB4YqyU+RF6rGeN2LgiU0XNUiUO1lpS
	 l3Ky8rGXIjasOLQQmXYNA/4VkEzo82ToMNUuQ3GVUDp+f3v30EePnPuBqEX1w2uBCV
	 KkJ3svCA4b9L+7RMp+aLydw7CYatNMnwEayTPP+g=
Date: Mon, 11 Aug 2025 12:40:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
	arun.r.murthy@intel.com, uma.shankar@intel.com,
	jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
	harry.wentland@amd.com, siqueira@igalia.com,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	airlied@gmail.com, simona@ffwll.ch, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev,
	tzimmermann@suse.de, jessica.zhang@oss.qualcomm.com,
	sean@poorly.run, marijn.suijten@somainline.org, mcanal@igalia.com,
	dave.stevenson@raspberrypi.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new
 drm_writeback_connector
Message-ID: <20250811094004.GD21313@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-8-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-8-suraj.kandpal@intel.com>

On Mon, Aug 11, 2025 at 02:57:06PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the rcar-du writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to drm_connector
> within the rcar_du_crtc.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 ++--
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++++++++++--------
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> index d0f38a8b3561..457c803d75bc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
> @@ -72,11 +72,11 @@ struct rcar_du_crtc {
>  	const char *const *sources;
>  	unsigned int sources_count;
>  
> -	struct drm_writeback_connector writeback;
> +	struct drm_connector connector;

You forgot to update the documentation of the structure.

"connector" is a too generic name. I'd keep the existing field name.

>  };
>  
>  #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
> -#define wb_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, writeback)
> +#define connector_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, connector)
>  
>  /**
>   * struct rcar_du_crtc_state - Driver-specific CRTC state
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 9986a10e8114..95e6810612c2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -47,10 +47,12 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
>  				    dev->mode_config.max_height);
>  }
>  
> -static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
> +static int rcar_du_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  				  struct drm_writeback_job *job)
>  {
> -	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
> +	struct drm_connector *connector =
> +		container_of(wb_connector, struct drm_connector, writeback);
> +	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);

Modify wb_to_rcar_crtc() instead of changing the code here and below.

>  	struct rcar_du_wb_job *rjob;
>  	int ret;
>  
> @@ -72,10 +74,12 @@ static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
>  	return 0;
>  }
>  
> -static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
> +static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *wb_connector,
>  				   struct drm_writeback_job *job)
>  {
> -	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
> +	struct drm_connector *connector =
> +		container_of(wb_connector, struct drm_connector, writeback);
> +	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
>  	struct rcar_du_wb_job *rjob = job->priv;
>  
>  	if (!job->fb)
> @@ -199,7 +203,7 @@ static const u32 writeback_formats[] = {
>  int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  			   struct rcar_du_crtc *rcrtc)
>  {
> -	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> +	struct drm_writeback_connector *wb_conn = &rcrtc->connector.writeback;
>  
>  	struct drm_encoder *encoder;
>  
> @@ -212,7 +216,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  
>  	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>  
> -	drm_connector_helper_add(&wb_conn->base,
> +	drm_connector_helper_add(&rcrtc->connector,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
>  	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> @@ -231,7 +235,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  	struct drm_framebuffer *fb;
>  	unsigned int i;
>  
> -	state = rcrtc->writeback.base.state;
> +	state = rcrtc->connector.state;
>  	if (!state || !state->writeback_job)
>  		return;
>  
> @@ -246,10 +250,10 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
>  			    + fb->offsets[i];
>  
> -	drm_writeback_queue_job(&rcrtc->writeback, state);
> +	drm_writeback_queue_job(&rcrtc->connector.writeback, state);
>  }
>  
>  void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
>  {
> -	drm_writeback_signal_completion(&rcrtc->writeback, 0);
> +	drm_writeback_signal_completion(&rcrtc->connector.writeback, 0);
>  }

-- 
Regards,

Laurent Pinchart

