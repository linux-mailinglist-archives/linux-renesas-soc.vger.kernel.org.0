Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290037C2AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 15:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfGaNDc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 09:03:32 -0400
Received: from foss.arm.com ([217.140.110.172]:46782 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbfGaNDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 09:03:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C9D344;
        Wed, 31 Jul 2019 06:03:31 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9FF43F575;
        Wed, 31 Jul 2019 06:03:30 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 7272A680205; Wed, 31 Jul 2019 14:03:29 +0100 (BST)
Date:   Wed, 31 Jul 2019 14:03:29 +0100
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Cc:     "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        Brian Starkey <Brian.Starkey@arm.com>,
        "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "eric@anholt.net" <eric@anholt.net>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH v1 1/2] drm: Free the writeback_job when it with an empty
 fb
Message-ID: <20190731130329.ejji2axjff7zwj3b@e110455-lin.cambridge.arm.com>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-2-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 31, 2019 at 11:04:38AM +0000, Lowry Li (Arm Technology China) wrote:
> From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
> 
> Adds the check if the writeback_job with an empty fb, then it should
> be freed in atomic_check phase.
> 
> With this change, the driver users will not check empty fb case any more.
> So refined accordingly.
> 
> Signed-off-by: Lowry Li (Arm Technology China) <lowry.li@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c |  3 +--
>  drivers/gpu/drm/arm/malidp_mw.c                          |  4 ++--
>  drivers/gpu/drm/drm_atomic.c                             | 13 +++++++++----
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c              |  4 ++--
>  drivers/gpu/drm/vc4/vc4_txp.c                            |  5 ++---
>  5 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index 617e1f7..d6103dd 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -43,9 +43,8 @@
>  	struct komeda_data_flow_cfg dflow;
>  	int err;
>  
> -	if (!writeback_job || !writeback_job->fb) {
> +	if (!writeback_job)
>  		return 0;
> -	}
>  
>  	if (!crtc_st->active) {
>  		DRM_DEBUG_ATOMIC("Cannot write the composition result out on a inactive CRTC.\n");
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index 2e81252..a59227b 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -130,7 +130,7 @@ static void malidp_mw_connector_destroy(struct drm_connector *connector)
>  	struct drm_framebuffer *fb;
>  	int i, n_planes;
>  
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
>  
>  	fb = conn_state->writeback_job->fb;
> @@ -247,7 +247,7 @@ void malidp_mw_atomic_commit(struct drm_device *drm,
>  
>  	mw_state = to_mw_state(conn_state);
>  
> -	if (conn_state->writeback_job && conn_state->writeback_job->fb) {
> +	if (conn_state->writeback_job) {
>  		struct drm_framebuffer *fb = conn_state->writeback_job->fb;
>  
>  		DRM_DEV_DEBUG_DRIVER(drm->dev,
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 419381a..14aeaf7 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -430,10 +430,15 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
>  		return -EINVAL;
>  	}
>  
> -	if (writeback_job->out_fence && !writeback_job->fb) {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> -				 connector->base.id, connector->name);
> -		return -EINVAL;
> +	if (!writeback_job->fb) {
> +		if (writeback_job->out_fence) {
> +			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
> +					 connector->base.id, connector->name);
> +			return -EINVAL;
> +		}
> +
> +		drm_writeback_cleanup_job(writeback_job);
> +		state->writeback_job = NULL;
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index ae07290..04efa78d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -147,7 +147,7 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,
>  	struct drm_device *dev = encoder->dev;
>  	struct drm_framebuffer *fb;
>  
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
>  
>  	fb = conn_state->writeback_job->fb;
> @@ -221,7 +221,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
>  	unsigned int i;
>  
>  	state = rcrtc->writeback.base.state;
> -	if (!state || !state->writeback_job || !state->writeback_job->fb)
> +	if (!state || !state->writeback_job)
>  		return;
>  
>  	fb = state->writeback_job->fb;
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 96f91c1..e92fa12 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -229,7 +229,7 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
>  	int i;
>  
>  	conn_state = drm_atomic_get_new_connector_state(state, conn);
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +	if (!conn_state->writeback_job)
>  		return 0;
>  
>  	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> @@ -269,8 +269,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
>  	u32 ctrl;
>  	int i;
>  
> -	if (WARN_ON(!conn_state->writeback_job ||
> -		    !conn_state->writeback_job->fb))
> +	if (WARN_ON(!conn_state->writeback_job))
>  		return;
>  
>  	mode = &conn_state->crtc->state->adjusted_mode;
> -- 
> 1.9.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
