Return-Path: <linux-renesas-soc+bounces-35167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iRIOC29TVWqomwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 23:06:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4274F2D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 23:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=MEtLxz+Q;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 048F230074A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 21:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8632B3090C5;
	Mon, 13 Jul 2026 21:06:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1578F3A;
	Mon, 13 Jul 2026 21:06:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976812; cv=none; b=EZoqOg1AT88MUIf4ZB+D4fC3DIDbpaZDNWKQ9lsq5agVlzrMYbk3I4U3kFjAkPnp5O/b+3h76apBbmYLWJ7M2WGtZmJvy2DIkMGmy+bRgptud6+wQ6zPtBZeXKFS4mncj2mpw989TPmvYusSAco/Z3XLxXveJNdRWQEUHBcCS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976812; c=relaxed/simple;
	bh=MVa1wRBJRU6+fCy+2HEUjLBXLS095SdQAspyYiCbT3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c58QtTDnRMSeIjBlW9rfPRWXxx4zkARJv6AatfWRzNvLr4Z/k2b0sAMpGLxRyg7YJF2K/Sl47PafTPygtCuwuzfRJaBnpuKvKpRlCha1FayYxJpdtlmeQduZ6BNGr0oOZaeeb07LJuPCoGjbh8j/1in1kVk+nfs2T9TVXf9HOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MEtLxz+Q; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xQrScTMErwGvqTbe4/xRXxRntlCADJUSrD0i3fE7pTU=; b=MEtLxz+QaBvAuYqwlzpVK9DTMK
	2vEikTmQdo/d7diC4pmJnjScn04vhjDtET+9wHUXgiQHEmu0BIMMxxhxshP4pVaYWrXatPaYZ9UqU
	mc7YRYAqKwsAHGUmizXgKPSxzM/lR3Gk1SW1YMdgGr1ylDHKsHYyNGACbJzqA8tE7ufKdKb5y0ko8
	BAS0RWViFgPHrjDdIEE4xm0VgTh5XjXn4fV/TRBbRBTN928yOaf1tbGjAI8++zHNBrx68UpXzoWbo
	fKemjPL6WqzUQzwwWLoDWB+nc2P+XC3EtFfudlRWuulA7M+RJqiCW7gImoyIrJRQ0COXpx48MLmcI
	59Z0HZjA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wjNr8-00Eg7T-Rb; Mon, 13 Jul 2026 23:06:27 +0200
Message-ID: <220b89a8-348e-4021-a11a-cfd73610c688@Igalia.com>
Date: Mon, 13 Jul 2026 14:06:18 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm/managed: implement managed versions of
 kzalloc_obj/objs()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
 <20260612-wb-drop-encoder-v6-1-9f3a54f81310@oss.qualcomm.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260612-wb-drop-encoder-v6-1-9f3a54f81310@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35167-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_SENDER(0.00)[John.Harrison@Igalia.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Igalia.com:from_mime,Igalia.com:mid,igalia.com:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEC4274F2D1

On 6/12/26 11:30, Dmitry Baryshkov wrote:
> The kzalloc_obj() and kzalloc_objs() functions proven to be useful and
> widely used for the reset of the kernel. Implement a drm_device-managed
> versions of those macros to mix the nice interface with the automatic
> freeing of the pointers.
>
> Note: the original macros accept optional GFP_foo arguments. They are
> skipped for now, making all allocations use GFP_KERNEL. If necessary,
> support for overriding the GFP type can be introduced later.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/drm/drm_managed.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 72d0d68be226..79049bec277d 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -105,6 +105,28 @@ static inline void *drmm_kcalloc(struct drm_device *dev,
>   	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
>   }
>   
> +/**
> + * drmm_kzalloc_objs - &drm_device-managed kzalloc_objs()
> + * @dev: DRM device
> + * @p: Variable or type to allocate an array of
> + * @count: How many elements in the array
> + *
> + * Returns: newly allocated pointer to the zeroed array of @P on success, or
There is a mix of p and P going on here. With this made more consistent:
Reviewed-by: John Harrison <John.Harrison@Igalia.com>

> + * NULL on failure.
> + */
> +#define drmm_kzalloc_objs(dev, p, count) \
> +	drmm_kcalloc(dev, count, sizeof(typeof(p)), GFP_KERNEL)
> +
> +/**
> + * drmm_kzalloc_obj - &drm_device-managed kzalloc_obj()
> + * @dev: DRM device
> + * @p: Variable or type to allocate
> + *
> + * Returns: newly allocated pointer to a @p on success, or NULL on failure.
> + */
> +#define drmm_kzalloc_obj(dev, P) \
> +	drmm_kzalloc_objs(dev, P, 1)
> +
>   char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>   
>   void drmm_kfree(struct drm_device *dev, void *data);
>


