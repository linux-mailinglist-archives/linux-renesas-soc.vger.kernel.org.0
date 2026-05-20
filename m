Return-Path: <linux-renesas-soc+bounces-32887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILzIKLRGDmoM9gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 01:41:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148659CD98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 01:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2CE13030EAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 22:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5572ED15F;
	Wed, 20 May 2026 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pAgwiZym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AE33A9FE;
	Wed, 20 May 2026 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317472; cv=none; b=Nglh+o7oSMcUHXn3cU1H2dcCdtUyAchXy8wd00YrBunGMcK7V7bCrqIJ3AnrVOvxfCOGa8nxqemDeDf+M+D1WadqkxNmRl7ZfV4eacZ0NmIo+hj01KY7hy9SVJ+5AWl+xsHUJqIzWB1jbpqwBiIceJDqN68HYsPzdmviKqga6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317472; c=relaxed/simple;
	bh=zlajbrVUi4MpS0m3fKu0aT0gFphuz5cuKsBSgtxFc3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSfDtrpDEmIdffzdSEojpAWEjoIxfKxojHaHkSrgpnPayBc7ueYbzYvZ7mfV0giQurMYWMEa1XbndVwY8aPztxpdTALITRMIelV/63Xrm5iPwth6CBaQvBZuh7ITD8TL1TldWLg+t+qSIguiYEtd/w6/Ju7Ly2D4KCYfMeY7VI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pAgwiZym; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HsjhAy2BBtCFA/egDCdJZk4pjYZbxFSYZKXDkZ+Avwo=; b=pAgwiZymOW8GGrLLojHhetbVx0
	9TrKs9vM0v6AmUOGFF9kTLwGkbQ/WntzQL2Sj0b7582rF4a4DMqcybT4HUbo4l4rKRyqkxpCx4H/e
	o1Z4MDHncvmdjtf+fvVmlVAJ4gNVGT2Q/PtvPUOqX4J6E0C9rvamZCWWq/Rzj8l2qU7wrfxT7Rkj4
	iEQgN5cRzQaPAArG92EKxbyOWFD4IBrKs+vQ4yLdziplGub28uNWH2zOi1fq/2WLfzZDFmtFPb/4z
	VCWOXI0i0O92YxbT0DmOHLG4oKNKWiGJ3fQdBFOulCCk2bIG40O5m42OD9JBUlNlvsdvIRP50KAki
	hzS4+nFw==;
Received: from d209-89-236-181.abhsia.telus.net ([209.89.236.181] helo=atmagalia)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPpk9-0043dh-8d; Thu, 21 May 2026 00:50:25 +0200
Date: Wed, 20 May 2026 16:50:14 -0600
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: John Harrison <John.Harrison@igalia.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <ag44Kk4h188WGhcN@atmagalia>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <177894506978.2448625.17152574519326512949.b4-ty@b4>
 <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
 <wcgvogluzfrjk6rlomswkmqceilbbichxsgx3aqzpoawe7jzgw@uiy3ogtswflk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wcgvogluzfrjk6rlomswkmqceilbbichxsgx3aqzpoawe7jzgw@uiy3ogtswflk>
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32887-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[siqueira@igalia.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,linux.intel.com,intel.com,amd.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 1148659CD98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/20, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 09:59:00AM -0700, John Harrison wrote:
> > On 5/16/26 08:25, Dmitry Baryshkov wrote:
> > > On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
> > > > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > > > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > > > (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> > > > to use drmm_writeback_connector_init(), drop
> > > > drm_writeback_connector_init() and drm_writeback_connector::encoder
> > > > (it's unused afterwards).
> > > > 
> > > > [...]
> > > Applied to msm-fixes, thanks!
> > > 
> > > [1/8] drm/msm/dpu: don't mix devm and drmm functions
> > >        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c
> > > 
> > > Best regards,
> > That is only the first patch of the series, yes?
> 
> Yes, correct.
> 
> > 
> > What is happening with the rest? Can they all be merged to drm-next now? As
> > I understand it, only the first patch was still being discussed, the others
> > have all been reviewed some time ago.
> 
> At least we need an ack from the AMD maintainers. I can pick up patches
> 3-6 to drm-misc-next, but it doesn't really help because the rest of the
> patches are blocked by the AMD change.


Hi Alex, Harry,

Could we have your acked-by for this series? I tested it with a DCN
4.0.1 and the kms_writeback test; everything looks fine. This series
should not cause regressions because the AMD modifications are
restricted to the writeback functions; if you want to be sure and cover
more hardware, it can be useful to run it through AMD CI (you just need
to make a few minor adjustments when applying it to the
amd-staging-drm-next).

Anyway, this series was

Tested-by: Rodrigo Siqueira <siqueira@igalia.com>

Thanks

> 
> -- 
> With best wishes
> Dmitry

-- 
Rodrigo Siqueira

