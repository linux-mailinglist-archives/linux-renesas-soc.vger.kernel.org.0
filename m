Return-Path: <linux-renesas-soc+bounces-24747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B220BC6B878
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 21:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B4C86359F70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658ED2D248D;
	Tue, 18 Nov 2025 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="quiVWOGl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F802F39A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496517; cv=none; b=hgYRzOXXbC6UJNVgOAY+4R/ytuMN2gykbfEcLlnRcpiSmd27J/AOR/TIDQVrrinElj/z9KqHgTk3FKs5YawqYoc0ubM0Fix5FNnVK/DEkYp3fYnemhhTA9ULQ5hTWhdm29Rq12xGt5I0XdOxaVfM2c5C0FdG25FpzEobnLuJcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496517; c=relaxed/simple;
	bh=os5B8SRPAkvKEIhvaCs275WfA06F9kmtY01nuafqvHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJQljP0iWsentthK/f8IM6gM+888BDSDQaeMeXcH2H82uf05ihvjnErayoVWTkUnY2lImqoOm5fiaL9E+V94HlFcdEvDsz1NQJOl0VtKalTMOuJOm7Vx+AHtP3fGixqUbQTy9xPCIMPYzUxMcxrYgHKkEnenPjUhAVODH6acweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=quiVWOGl; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d9wfH16TQz9v6T;
	Tue, 18 Nov 2025 21:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763496503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62JbVR0rfXOv5ktjxfrITbxdHa9P8CnEO8KeHvj0UO0=;
	b=quiVWOGlLM7ObPjgW9oRstr2jgcysxVx8IM7nauUYgahiBaTPByepE/uHZIuqHJfw+tGqt
	Gq/jqe2nrgaff56cpUhFjN0WKJIh7WtxQfFegX7T+JYgbn268ul83BaFOxU8B3GCCHAZD0
	qzoUzJbipQIxfevKwU7BEb4lLj6kbl0viQVNTIK/ayGqprUTY9ZVRXMI7IlyBuwS8fnJ+R
	y/+An1P/0XyTFIPf5qlRvvkjb/LKQtctnUFBr7hYQFjRBGdSb8SJRbo8IRiTXE5xnuyDBa
	4MWy0pgvZUttQMgQ9qVapAh2bVKa3McklMnTnPtJOhqB+7bo4Qxz7wyi4Ok5fg==
Message-ID: <246dfc90-5d6c-4bac-8e13-ce95653fa6d7@mailbox.org>
Date: Tue, 18 Nov 2025 21:08:18 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>
 <2v43kghgrw7qeh7l77czahr5ms34raykviuzetdbda7wuvh2ic@mc5stkequmh3>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2v43kghgrw7qeh7l77czahr5ms34raykviuzetdbda7wuvh2ic@mc5stkequmh3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: i99pdnje8uybuybh7fpgq4rb1rkmtw7t
X-MBO-RS-ID: c41cec412c7958fb13d

On 11/18/25 5:49 PM, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Nov 08, 2025 at 12:04:26AM +0100, Marek Vasut wrote:
>> Introduce a variant of drm_atomic_helper_commit_modeset_enables()
>> which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> where the CRTC provides clock to LVDS and DSI, and has to be started
>> before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>>
>> This specifically fixes the case where ILI9881C is connected to R-Car
>> DU DSI. The ILI9881C panel driver does DSI command transfer in its
>> struct drm_panel_funcs .prepare function, which is currently called
>> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
>> and the DSI command transfer times out.
>>
>> Fix this by restoring the enable ordering introduced in commit
>> c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>> and post-disable"), to enable CRTC early.
>>
>> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c           | 24 +++++++++++++++++++
>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>>   include/drm/drm_atomic_helper.h               |  2 ++
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 5a473a274ff06..c0cdd36a03df1 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
>>   
>> +/**
>> + * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
>> + * @dev: DRM device
>> + * @state: atomic state object being committed
>> + *
>> + * This function is a variant of drm_atomic_helper_commit_modeset_enables()
>> + * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> + * where the CRTC provides clock to LVDS and DSI, and has to be started
>> + * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>> + */
>> +void
>> +drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
>> +						    struct drm_atomic_state *state)
>> +{
>> +	crtc_enable(dev, state);
>> +
>> +	encoder_bridge_pre_enable(dev, state);
>> +
>> +	encoder_bridge_enable(dev, state);
>> +
>> +	drm_atomic_helper_commit_writebacks(dev, state);
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
>> +
>>   /*
>>    * For atomic updates which touch just a single CRTC, calculate the time of the
>>    * next vblank, and inform all the fences of the deadline.
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> index 116ad9605704b..b7e2a735a03ae 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> @@ -547,7 +547,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>>   	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>   	drm_atomic_helper_commit_planes(dev, old_state,
>>   					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
> 
> Just like we discussed on Linus' series for MCDE, we don't want to have
> an helper variant for every driver variation. If rcar is the only user
> of that helper, rename and export the symbols you need, and roll yor own
> commit_tail implementation.
It seems both Linus and me are affected, and those are now two different 
drivers ?

