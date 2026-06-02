Return-Path: <linux-renesas-soc+bounces-33415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDORKsixHmr7JAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:34:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CC62CADE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 12:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 227063043C24
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 10:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10553D6CAE;
	Tue,  2 Jun 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c2MtEDF2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD523D6691
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396469; cv=none; b=MVKJUUhWmsDh5AZz9At9Kx528HHBRDyy4DyxsQ0wyUhQbk3uQ6T7O4tbftoPjift62T3Jqr+47U+RlJJ/Cn+5Ovm9Vjr/uPx29oe+mCCEOEHBhGrQWoW9ZIuUmTWFCmotfBj2+UvTaOqNbYXHUcwVzM6lTHe0e45JFj6OF9Xk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396469; c=relaxed/simple;
	bh=sSLG3wXzMGkuchBhOWXlkifyhi6ZS+mT6rRQfEDVsGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMouLYlt94e+jAXybTULgiqKmijaNG95ak20NZC68UuA89/jPmI7r3/fgywIMxeqykGnyIFqmm8LsEjhBclcFr6gqn/ijupDyuhCCWbtpKiN3PV3+EJEM52SIYKB9yVDqN6heNPLuy68gcbx0c4aNOslfpMyZA6ZsYng4eUANzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=c2MtEDF2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A27A2364
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 03:34:22 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F0EA3F632
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780396467; bh=sSLG3wXzMGkuchBhOWXlkifyhi6ZS+mT6rRQfEDVsGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2MtEDF24NZMmzshFfswZKEHkPKTOhzvaJ64ZcCQuhwS4Rh9M+PExlxrceFjyRIPh
	 B7nPj19iGjbzaZ1KjAY+iDzi3tn/MAC+fZF3fQi9RXNmXMVrIK7Jf/tRnc7HgEUfRV
	 jOdTH8V/UAa6TrspOgEOj0wh0hAaiQt3P4KDg/Tg=
Date: Tue, 2 Jun 2026 11:33:49 +0100
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
Subject: Re: [PATCH v5 4/8] drm/mali: use drmm_writeback_connector_init()
Message-ID: <ah6xjR_vHhsXqvyI@e142607>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-4-42567b7c7af2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-wb-drop-encoder-v5-4-42567b7c7af2@oss.qualcomm.com>
X-Rspamd-Queue-Id: 2D8CC62CADE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33415-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,intel.com:email,bootlin.com:email]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 03:25:01AM +0300, Dmitry Baryshkov wrote:
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
>  drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index fad343842038..6e0c78e998aa 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
>  	return connector_status_connected;
>  }
>  
> -static void malidp_mw_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static struct drm_connector_state *
>  malidp_mw_connector_duplicate_state(struct drm_connector *connector)
>  {
> @@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
>  	.reset = malidp_mw_connector_reset,
>  	.detect = malidp_mw_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = malidp_mw_connector_destroy,
>  	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
> @@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
>  int malidp_mw_connector_init(struct drm_device *drm)
>  {
>  	struct malidp_drm *malidp = drm_to_malidp(drm);
> +	struct drm_encoder *encoder;
>  	u32 *formats;
>  	int ret, n_formats;
>  
> @@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
>  	if (!formats)
>  		return -ENOMEM;
>  
> -	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
> -					   &malidp_mw_connector_funcs,
> -					   &malidp_mw_encoder_helper_funcs,
> -					   formats, n_formats,
> -					   1 << drm_crtc_index(&malidp->crtc));
> +	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
> +					   NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
> +
> +	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
> +					    &malidp_mw_connector_funcs,
> +					    encoder,
> +					    formats, n_formats);
>  	kfree(formats);
>  	if (ret)
>  		return ret;
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

