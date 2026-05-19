Return-Path: <linux-renesas-soc+bounces-32833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO0yOsGXDGphjgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:02:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885A582CA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B6E5302515A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 17:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE834367B86;
	Tue, 19 May 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XaO/NlCv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06336409106;
	Tue, 19 May 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210000; cv=none; b=DsJdru3W8nZZZn/vF/1QO0Y7shFyYqLsS+Z0MjIYI57c/h0VCquvrSYpIq3KP3GIFRDY4znJBQFZDHtNhqp0UCGnSd93BEnn1eq/FEOT5QuxIh2fFdhzYt53HbV2Eh1Q8aQxojEaeHjyh73Xy5LM0L+nBR4yhWdyM93cLILynlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210000; c=relaxed/simple;
	bh=6nqlPL/Z+9cM2PfQjhS+wS9TuQuu4MgYO54FjQBAN+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctVyLa51KBgEayQE1lFVcADdpfdkyMJmwVIvdSPGN8+OPeE5Aj22yGjndyMnp7/6TVN1gfBIu3+ja81YYOTez+RB1taG2y8mGi+kIiRluRh+MS2rijqGSOrIyxMU0nLFAfxxJXpy0jjKsas4ZIUJAJYF87nFeZ29mmgbdyoDxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XaO/NlCv; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hp7+EIkRbnyy03IIX7pmZkir0cv4vk2JcR+C9KZzo2Q=; b=XaO/NlCv59zOW942ddRcqWltw6
	Kp9raJ4qx1l76AkXpNrPB3FMtwqtye/6Vg39R2y/ZewG/S06ujHhWp9mTTwedRA3AGVn5ib4x9HNc
	YMdpYh4HTMRe5cNDIoBMFWA1z+E1ZYtTLG/h6pviiB7HSFcedSA1JyPu8o45lfCiWIy8jkTSp8d3+
	HrRJL9/iNzOXGyaDJjiIRpmdoKjq9SzvkgyBioHy7VFxnQ3WdVSBAFai7mR5zemH59dlXNUamRb2o
	Su0PClXWN4TdJum1K1aayDz9ifRzqb1Wx3zEK7NB5ODJNmCQZsAEctzvZihvpEO7fsFaE5dRZnLcW
	xB8FGZGg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wPNmi-003Hri-6j; Tue, 19 May 2026 18:59:12 +0200
Message-ID: <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
Date: Tue, 19 May 2026 09:59:00 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector
 initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <177894506978.2448625.17152574519326512949.b4-ty@b4>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177894506978.2448625.17152574519326512949.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32833-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,Igalia.com:mid]
X-Rspamd-Queue-Id: 5885A582CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/16/26 08:25, Dmitry Baryshkov wrote:
> On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
>> Drivers using drm_writeback_connector_init() / _with_encoder() don't
>> perform cleanup in a manner similar to drmm_writeback_connector_init()
>> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
>> to use drmm_writeback_connector_init(), drop
>> drm_writeback_connector_init() and drm_writeback_connector::encoder
>> (it's unused afterwards).
>>
>> [...]
> Applied to msm-fixes, thanks!
>
> [1/8] drm/msm/dpu: don't mix devm and drmm functions
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c
>
> Best regards,
That is only the first patch of the series, yes?

What is happening with the rest? Can they all be merged to drm-next now? 
As I understand it, only the first patch was still being discussed, the 
others have all been reviewed some time ago.

Thanks,
John.


