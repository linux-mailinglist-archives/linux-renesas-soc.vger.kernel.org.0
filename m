Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDE473BD9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 19:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjFWRQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 13:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjFWRQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 13:16:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066DF1BFA;
        Fri, 23 Jun 2023 10:16:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 131D9838;
        Fri, 23 Jun 2023 19:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687540524;
        bh=+m8bhcEorL2N0D3vtWBNikB8ew3LCemt+gm4zE68GYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lFsyNBUPmVf0C7fnm8NfYfQw/CLaSrU/X5zKictx5sbxGy7CeXXQlYoRBjjIEQRmB
         EBFiwkuvYNTq48qYJ+5SkML9WgieDha5zWLAm7Ke97vBODl7PH6Zt5KLTh0RMbF4a+
         FWbp0Tnl5UtftIhVvwnP3Sjwh/CYxEe5i6ogXJGg=
Date:   Fri, 23 Jun 2023 20:15:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 37/39] drm: renesas: shmobile: Remove internal CRTC state
 tracking
Message-ID: <20230623171559.GM2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <7a758de388d2f904ac94eb256d815bb6b7bc6663.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a758de388d2f904ac94eb256d815bb6b7bc6663.1687423204.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:49AM +0200, Geert Uytterhoeven wrote:
> Now the suspend/resume methods no longer need to look at internal driver
> state, the dpms and started fields in the shmob_drm_crtc structure can
> be removed, as well as the shmob_drm_crtc_dpms() wrapper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 35 ++++---------------
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 --
>  2 files changed, 6 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index b11bb666de3bac46..f2332bb0fbbd51a1 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -196,9 +196,6 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  	u32 value;
>  	int ret;
>  
> -	if (scrtc->started)
> -		return;
> -
>  	ret = pm_runtime_resume_and_get(dev);
>  	if (ret)
>  		return;
> @@ -252,8 +249,6 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  
>  	/* Turn vertical blank interrupt reporting back on. */
>  	drm_crtc_vblank_on(crtc);
> -
> -	scrtc->started = true;
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -314,9 +309,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
> -	if (!scrtc->started)
> -		return;
> -
>  	/*
>  	 * Disable vertical blank interrupt reporting.  We first need to wait
>  	 * for page flip completion before stopping the CRTC as userspace
> @@ -335,8 +327,6 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  	shmob_drm_clk_off(sdev);
>  
>  	pm_runtime_put(sdev->dev);
> -
> -	scrtc->started = false;
>  }
>  
>  static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
> @@ -344,21 +334,6 @@ static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
>  	return container_of(crtc, struct shmob_drm_crtc, base);
>  }
>  
> -static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> -{
> -	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> -
> -	if (scrtc->dpms == mode)
> -		return;
> -
> -	if (mode == DRM_MODE_DPMS_ON)
> -		shmob_drm_crtc_start(scrtc);
> -	else
> -		shmob_drm_crtc_stop(scrtc);
> -
> -	scrtc->dpms = mode;
> -}
> -
>  static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  					struct drm_atomic_state *state)
>  {
> @@ -378,13 +353,17 @@ static void shmob_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  static void shmob_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> -	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
> +	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> +
> +	shmob_drm_crtc_start(scrtc);

If this function isn't called from any other location anymore, you may
want to inline it.

>  }
>  
>  static void shmob_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
> -	shmob_drm_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
> +	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> +
> +	shmob_drm_crtc_stop(scrtc);

Same here.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  }
>  
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
> @@ -476,8 +455,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  
>  	init_waitqueue_head(&sdev->crtc.flip_wait);
>  
> -	sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
> -
>  	primary = shmob_drm_plane_create(sdev, 0);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index 37380c815f1f5a08..89a0746f9a35807d 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -27,9 +27,6 @@ struct shmob_drm_crtc {
>  
>  	struct drm_pending_vblank_event *event;
>  	wait_queue_head_t flip_wait;
> -	int dpms;
> -
> -	bool started;
>  };
>  
>  struct shmob_drm_connector {

-- 
Regards,

Laurent Pinchart
