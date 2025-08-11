Return-Path: <linux-renesas-soc+bounces-20215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFFB20421
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 11:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4223B90D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 09:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506E72DC339;
	Mon, 11 Aug 2025 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qmUN6l41"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A108224B01;
	Mon, 11 Aug 2025 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905492; cv=none; b=IEPf6GwIXKe36Eba8Yroiwsg8Jv/LATwbgwjQASM1NPjxDiOo9y0UoaFhdOMxnRpyIYtZnpi/2aKA4/X/9t8X2qZFRTgs+GPxdQaBy1bjtiqK5e7RpQDhXp1wgeM4qDvPfgH2sDdhNDHErBTXmsD7DnayUzz7i8iUiiHokI4JLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905492; c=relaxed/simple;
	bh=UPWf30ZMlvogYjQ/MI9+xpo9+6mFRrRtQPnIp/bW4SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hxq0epgVMwxHq0JxKFq7gAcPW7jmnc5hxp7Vk3jB3i/mvpUmfApnSaz5L9EEUx4emTh1QA9fa7OvA4hJcS5Z9Jsse/eduWNxJpzqaCuNFOPy1jv/cJPgFY92TWm7T7W3Z75wPrNuQQOQb0WBQxJlRyuVZ+yRYut7noYw0BcVZV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qmUN6l41; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AD4A74A4;
	Mon, 11 Aug 2025 11:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754905436;
	bh=UPWf30ZMlvogYjQ/MI9+xpo9+6mFRrRtQPnIp/bW4SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmUN6l41QzLaqgRP8EvPL7HiBYQTQhDj35OzSZSqDxirRD/vdal5O6kvdCkBoe/NA
	 WuOobkLmX/G5SwiKWSAxg+zWkCzB9Wpfnt3nJAfbPYzAx/bD9dEs0qAeLv7xq/3vk/
	 MIvFrRCtzCJeDzQLS5Pf7r8FCA0caunSMJHdMVDA=
Date: Mon, 11 Aug 2025 12:44:29 +0300
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
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250811094429.GE21313@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>

On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not.
> To solve this we move the drm_writeback_connector within the
> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We do all other required
> modifications that come with these changes along with addition
> of new function which returns the drm_connector when
> drm_writeback_connector is present.
> All drivers will be expected to allocate the drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
>  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     | 68 ++++-----------------------------
>  3 files changed, 89 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index ec2575c4c21b..198b8c488056 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -89,8 +89,10 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
>  {
>  	struct drm_writeback_connector *wb_connector =
>  		fence_to_wb_connector(fence);
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  
> -	return wb_connector->base.dev->driver->name;
> +	return connector->dev->driver->name;
>  }
>  
>  static const char *
> @@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  					  struct drm_encoder *enc, const u32 *formats,
>  					  int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_property_blob *blob;
>  	int ret = create_writeback_properties(dev);
> @@ -269,7 +272,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_encoder *enc,
>  				 const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	int ret;
>  
>  	ret = drm_connector_init(dev, connector, con_funcs,
> @@ -339,7 +343,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,
> @@ -382,13 +387,15 @@ int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  
>  int drm_writeback_prepare_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector
> +		= drm_writeback_to_connector(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  	int ret;
>  
>  	if (funcs->prepare_writeback_job) {
> -		ret = funcs->prepare_writeback_job(connector, job);
> +		ret = funcs->prepare_writeback_job(wb_connector, job);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -434,12 +441,14 @@ EXPORT_SYMBOL(drm_writeback_queue_job);
>  
>  void drm_writeback_cleanup_job(struct drm_writeback_job *job)
>  {
> -	struct drm_writeback_connector *connector = job->connector;
> +	struct drm_writeback_connector *wb_connector = job->connector;
> +	struct drm_connector *connector
> +		= drm_writeback_to_connector(wb_connector);
>  	const struct drm_connector_helper_funcs *funcs =
> -		connector->base.helper_private;
> +		connector->helper_private;
>  
>  	if (job->prepared && funcs->cleanup_writeback_job)
> -		funcs->cleanup_writeback_job(connector, job);
> +		funcs->cleanup_writeback_job(wb_connector, job);
>  
>  	if (job->fb)
>  		drm_framebuffer_put(job->fb);
> @@ -521,8 +530,10 @@ struct dma_fence *
>  drm_writeback_get_out_fence(struct drm_writeback_connector *wb_connector)
>  {
>  	struct dma_fence *fence;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  
> -	if (WARN_ON(wb_connector->base.connector_type !=
> +	if (WARN_ON(connector->connector_type !=
>  		    DRM_MODE_CONNECTOR_WRITEBACK))
>  		return NULL;
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..da63fdafd9f2 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1882,6 +1882,61 @@ struct drm_connector_cec {
>  	void *data;
>  };
>  
> +/**
> + * struct drm_writeback_connector - DRM writeback connector
> + */
> +struct drm_writeback_connector {
> +	/**
> +	 * @pixel_formats_blob_ptr:
> +	 *
> +	 * DRM blob property data for the pixel formats list on writeback
> +	 * connectors
> +	 * See also drm_writeback_connector_init()
> +	 */
> +	struct drm_property_blob *pixel_formats_blob_ptr;
> +
> +	/** @job_lock: Protects job_queue */
> +	spinlock_t job_lock;
> +
> +	/**
> +	 * @job_queue:
> +	 *
> +	 * Holds a list of a connector's writeback jobs; the last item is the
> +	 * most recent. The first item may be either waiting for the hardware
> +	 * to begin writing, or currently being written.
> +	 *
> +	 * See also: drm_writeback_queue_job() and
> +	 * drm_writeback_signal_completion()
> +	 */
> +	struct list_head job_queue;
> +
> +	/**
> +	 * @fence_context:
> +	 *
> +	 * timeline context used for fence operations.
> +	 */
> +	unsigned int fence_context;
> +	/**
> +	 * @fence_lock:
> +	 *
> +	 * spinlock to protect the fences in the fence_context.
> +	 */
> +	spinlock_t fence_lock;
> +	/**
> +	 * @fence_seqno:
> +	 *
> +	 * Seqno variable used as monotonic counter for the fences
> +	 * created on the connector's timeline.
> +	 */
> +	unsigned long fence_seqno;
> +	/**
> +	 * @timeline_name:
> +	 *
> +	 * The name of the connector's fence timeline.
> +	 */
> +	char timeline_name[32];
> +};
> +
>  /**
>   * struct drm_connector - central DRM connector control structure
>   *
> @@ -2305,6 +2360,11 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +
> +	/**
> +	 * @writeback: Writeback related valriables.
> +	 */
> +	struct drm_writeback_connector writeback;

No, sorry, that's a bad idea. Most connectors have nothing to do with
writeback, you shouldn't introduce writeback-specific fields here.
drm_writeback_connector happens to be a drm_connector because of
historical reasons (it was decided to reuse the connector API exposed to
userspace instead of exposing a completely separate API in order to
simplify the implementation), but that does not mean that every
connector is related to writeback.

I don't know what issues the Intel driver(s) have with
drm_writeback_connector, but you shouldn't make things worse for
everybody due to a driver problem.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 958466a05e60..2a52b6761797 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -15,66 +15,6 @@
>  #include <drm/drm_encoder.h>
>  #include <linux/workqueue.h>
>  
> -/**
> - * struct drm_writeback_connector - DRM writeback connector
> - */
> -struct drm_writeback_connector {
> -	/**
> -	 * @base: base drm_connector object
> -	 */
> -	struct drm_connector base;
> -
> -	/**
> -	 * @pixel_formats_blob_ptr:
> -	 *
> -	 * DRM blob property data for the pixel formats list on writeback
> -	 * connectors
> -	 * See also drm_writeback_connector_init()
> -	 */
> -	struct drm_property_blob *pixel_formats_blob_ptr;
> -
> -	/** @job_lock: Protects job_queue */
> -	spinlock_t job_lock;
> -
> -	/**
> -	 * @job_queue:
> -	 *
> -	 * Holds a list of a connector's writeback jobs; the last item is the
> -	 * most recent. The first item may be either waiting for the hardware
> -	 * to begin writing, or currently being written.
> -	 *
> -	 * See also: drm_writeback_queue_job() and
> -	 * drm_writeback_signal_completion()
> -	 */
> -	struct list_head job_queue;
> -
> -	/**
> -	 * @fence_context:
> -	 *
> -	 * timeline context used for fence operations.
> -	 */
> -	unsigned int fence_context;
> -	/**
> -	 * @fence_lock:
> -	 *
> -	 * spinlock to protect the fences in the fence_context.
> -	 */
> -	spinlock_t fence_lock;
> -	/**
> -	 * @fence_seqno:
> -	 *
> -	 * Seqno variable used as monotonic counter for the fences
> -	 * created on the connector's timeline.
> -	 */
> -	unsigned long fence_seqno;
> -	/**
> -	 * @timeline_name:
> -	 *
> -	 * The name of the connector's fence timeline.
> -	 */
> -	char timeline_name[32];
> -};
> -
>  /**
>   * struct drm_writeback_job - DRM writeback job
>   */
> @@ -131,10 +71,16 @@ struct drm_writeback_job {
>  	void *priv;
>  };
>  
> +static inline struct drm_connector *
> +drm_writeback_to_connector(struct drm_writeback_connector *wb_connector)
> +{
> +	return container_of(wb_connector, struct drm_connector, writeback);
> +}
> +
>  static inline struct drm_writeback_connector *
>  drm_connector_to_writeback(struct drm_connector *connector)
>  {
> -	return container_of(connector, struct drm_writeback_connector, base);
> +	return &connector->writeback;
>  }
>  
>  int drm_writeback_connector_init(struct drm_device *dev,

-- 
Regards,

Laurent Pinchart

