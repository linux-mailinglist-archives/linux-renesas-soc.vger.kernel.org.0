Return-Path: <linux-renesas-soc+bounces-33414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KyyFJKxHmr7JAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:33:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8A62CA85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BABCC304DAE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 10:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AEE36F8F0;
	Tue,  2 Jun 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tBDAILO/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7683932D9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396394; cv=none; b=Tf8alM2Yt6eYx1LwmMXOe6Mp66djIXcTW22qdIEPs4Gc0xWSstfZl5GQ4413DiLgGe+gEXVm5fXbpeSBMW+zhR+WwyksQ/CUHvj/OyiXwMu7pVm+z9j8JVy+c+8Griu20JJcrLVdGAp+VWqP9nrH36Ujv+/KMePCumbbBrJdEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396394; c=relaxed/simple;
	bh=iOHUK6brXgyIm879Y6Al2FeqYaz5id6uidKZL33WOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG+/2+lEVcSYmnmUvHUY0FGAJ6/SYcjy2xm8ubXGqwPvKK06187H3fFmDLp6p3P7yJU/T8Tye1V2naQf8eLkM694J6NTDQ/bAbXvZ06UEX2q2D2Z7MqrdE9dLp0pPnM3O1PNM/CG39a9J4OZD+Lh/apZeodiSyCJrszSff+1egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tBDAILO/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E73821596
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 03:33:06 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A78D43F632
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780396391; bh=iOHUK6brXgyIm879Y6Al2FeqYaz5id6uidKZL33WOWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBDAILO/jB5mp+zrux17V6Nw/Vm/CkawznXnHxoXqSTQPbe+qUJ708wY8Z/MG6nIO
	 Sj57uqbpKdhYYtKQt2VkCzzKwe5tMkOLFsr5CbiyA/KAe1ajyH9YRZsNP93vFAMJa9
	 tYMnHUh3bMgvMRV/6BSTdqJxIVIBuV+1qXb2zjsI=
Date: Tue, 2 Jun 2026 11:32:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	"Kandpal, Suraj" <suraj.kandpal@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 3/8] drm/komeda: use drmm_writeback_connector_init()
Message-ID: <ah6xQEWemicF_ECc@e142607>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-3-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-wb-drop-encoder-v5-3-42567b7c7af2@oss.qualcomm.com>
X-Rspamd-Queue-Id: C2F8A62CA85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33414-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 03:25:00AM +0300, Dmitry Baryshkov wrote:
> The driver uses drm_writeback_connector_init() instead of its drmm
> counterpart, but it doesn't perform the job queue cleanup (neither
> manually nor by calling drm_writeback_connector_cleanup()). On the
> contrary, the drmm_writeback_connector_init() function ensures the
> proper cleanup of the job queue.
> 
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index 41cc3e080dc9..bcc53d4015f1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -5,6 +5,7 @@
>   *
>   */
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>  #include "komeda_dev.h"
>  #include "komeda_kms.h"
>  
> @@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
>  	return 0;
>  }
>  
> -static void komeda_wb_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -	kfree(to_kconn(to_wb_conn(connector)));
> -}
> -
>  static const struct drm_connector_funcs komeda_wb_connector_funcs = {
>  	.reset			= drm_atomic_helper_connector_reset,
>  	.detect			= komeda_wb_connector_detect,
>  	.fill_modes		= komeda_wb_connector_fill_modes,
> -	.destroy		= komeda_wb_connector_destroy,
>  	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>  };
> @@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  	struct komeda_wb_connector *kwb_conn;
>  	struct drm_writeback_connector *wb_conn;
>  	struct drm_display_info *info;
> +	struct drm_encoder *encoder;
> +
>  	u32 *formats, n_formats = 0;
>  	int err;
>  
>  	if (!kcrtc->master->wb_layer)
>  		return 0;
>  
> -	kwb_conn = kzalloc_obj(*kwb_conn);
> +	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
>  	if (!kwb_conn)
>  		return -ENOMEM;
>  
> @@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  		return -ENOMEM;
>  	}
>  
> -	err = drm_writeback_connector_init(&kms->base, wb_conn,
> -					   &komeda_wb_connector_funcs,
> -					   &komeda_wb_encoder_helper_funcs,
> -					   formats, n_formats,
> -					   BIT(drm_crtc_index(&kcrtc->base)));
> +	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
> +
> +	err = drmm_writeback_connector_init(&kms->base, wb_conn,
> +					    &komeda_wb_connector_funcs,
> +					    encoder,
> +					    formats, n_formats);
>  	komeda_put_fourcc_list(formats);
>  	if (err) {
>  		kfree(kwb_conn);
> 
> -- 
> 2.47.3
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

