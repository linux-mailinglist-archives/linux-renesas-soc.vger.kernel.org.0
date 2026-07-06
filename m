Return-Path: <linux-renesas-soc+bounces-34764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lR4nIKrxS2rYdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:19:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD57146A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 20:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=krdw+o6S;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38F7730BC1EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 16:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652B93AFAFE;
	Mon,  6 Jul 2026 16:41:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DC3BE168;
	Mon,  6 Jul 2026 16:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356102; cv=none; b=YLLT5Cccwmy4EzuMKYhDzGlpWic7o+bYQ1nID7HDCB/5sGkKyj0cVgdZvUPH52mPDhFA8a0kvYK0pwVvzxMulwZInjua6XGzNFplWPSItDlj0nU+FdIvU8LBQqm2fvQWF6gq3g9KnKHgtPoZAm5sffgYEZD6sLvVxKIhFjbC7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356102; c=relaxed/simple;
	bh=8+KUBWXi1vy01BNq7Tz7jGIqJiG5n0TmU0P5p0hWIPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnH2UNsV75Rlwg8qopOJr2ZXNtb43G8z1kQqE1OR9/Ah5F76TF7E075XzsgJsSgn5SQyu1fJ1T/XH7B3PSO51+3ioRcC+yeGqmZhUAPINq2D7IJt9ioPday6kPY0/HTLGRH+r/KkbW3O+Htr5Ogdseqkzy1TfZ3xhjSJ3wF+dME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=krdw+o6S; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7guCZdTD2KAERz8f6MPx3Klbbmu2md0ZZwoWL4nEApU=; b=krdw+o6SiF86wGukpkdCg723JC
	Wm6xOUm6oOfBYk3+ZOem8KIP5ugPm+GZvAdWCcGg2KqKBR4PXXvweAQNZBjKCIPEYXSkw6pTGrnwm
	Denu+4/x0rTy00y70Xmutt9C85sr7lwu5XeMTey21CRdJQwqP0pUaOypX+amjG8QkySVT9Js1kIh/
	nBCu7mbB/muzjTPOvUOTN+7vrkiFd8ehIKyBIrmJi/9KbJdQ2bSY0rU8X5nYS0at3H2rQcpzjMz12
	6mKu33XOAPtO1i68diKTyOM5DIdbMY1FhlVF/SthmJqPtBac90bif6f81ie29rBawlTZDY3ni6fv2
	AMajf0gQ==;
Received: from d209-89-236-181.abhsia.telus.net ([209.89.236.181] helo=atmagalia)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wgmNd-009psZ-UQ; Mon, 06 Jul 2026 18:41:14 +0200
Date: Mon, 6 Jul 2026 10:41:04 -0600
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	John Harrison <John.Harrison@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH v6 2/9] drm/amd/display: use drmm allocation for
 writeback connector
Message-ID: <akvOKjElA-gfEk_E@atmagalia>
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
 <20260612-wb-drop-encoder-v6-2-9f3a54f81310@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-wb-drop-encoder-v6-2-9f3a54f81310@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34764-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:John.Harrison@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:alex.hung@amd.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[siqueira@igalia.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[siqueira@igalia.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com,igalia.com,lists.freedesktop.org,vger.kernel.org,wanadoo.fr];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:from_mime,atmagalia:mid,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25CD57146A0

On 06/12, Dmitry Baryshkov wrote:
> Currently memory used for writeback connectors isn't freed on driver
> unbinding, leaking the memory. Use drm_device-memory allocation
> function for the writeback connector, making sure that the memory is
> freed on the driver unbinding.
> 
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Suggested-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ece581609cf7..436562e32e63 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -91,6 +91,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_utils.h>
>  #include <drm/drm_vblank.h>
> @@ -5807,7 +5808,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>  		link = dc_get_link_at_index(dm->dc, i);
>  
>  		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
> -			struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
> +			struct amdgpu_dm_wb_connector *wbcon = drmm_kzalloc_obj(adev_to_drm(adev), *wbcon);
>  
>  			if (!wbcon) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to allocate writeback connector\n");
> @@ -5816,7 +5817,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>  
>  			if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to initialize writeback connector\n");
> -				kfree(wbcon);
> +				drmm_kfree(wbcon);

Hi Dmitry,

It looks like drmm_kfree is missing one parameter. It looks like it
should be something like this:


  drmm_kfree(&adev->ddev, wbcon);


If I missed a new series where you address this issue, please ignore
this comment.

Thanks

>  				continue;
>  			}
>  
> 
> -- 
> 2.47.3
> 

-- 
Rodrigo Siqueira

