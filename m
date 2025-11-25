Return-Path: <linux-renesas-soc+bounces-25130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA2C86F75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 21:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F653A62E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 20:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329C62D3EDF;
	Tue, 25 Nov 2025 20:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lrPAHpiF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD032B9A6;
	Tue, 25 Nov 2025 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101592; cv=none; b=ey3JDohqyPSRwdv1qcYcAOBfEssoAy8VMuR6QUhlLgZa0oQAtPGUBBQYVDMb7FlYFwYtSpy8xSDRIv5MUFKLzdYcqQzqIslk5gs6wC050Yvi5GK0CC56jlIEOVYFSnNOvYB0pRmWvW9qItWmFApaJ/m/VpfbIcKYsvoE+MWe/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101592; c=relaxed/simple;
	bh=PDN/qYaKx5KOPrvyKgTm80XnPYumW0xBAt7sy07RAiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ssqs0WQoutquBJxfr6TF/HqT5lei0IR2Qvkq63sOScexbjjq8oRFvkAgpj46ZxKc8r4cQ2b6P/lSkyOkB2ZHgKBJem3l0Nt46KhufGak7TYYyHhspUVo9e+tF1J+bESsCLt64vYxBicbdoJBaTdsErPcfd7mBuL0kLfiNP783Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lrPAHpiF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dGDQV3nJqz9tSw;
	Tue, 25 Nov 2025 21:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764101586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsVOLzBSeKtoAQQQH0qiBRV/hPqVXnOfBSVioSqYRf4=;
	b=lrPAHpiFnx9xOq019X6ifzEa8ROVfvrQYX+VhwpRI20YreNVIsWtNMbWwOsSavDBX0ysyG
	/zwpYQGWqoQCYzkePZgsg8/LHAirvSh1+HG+7lw8uXfS4NWJGrVMd+2CsVIaIwXIOdOhZR
	op2zRGFgpdmiaUqZOkcYburIj6L6oj5ZAjwFx/rwryleB13NTnOkraGIe4NtkPzOYiR5HJ
	64ofJibih44ENRlI3mTQN4gT5EDR7GB5xXi1LpBd6nf1iPi1BflB42FciK2wpRVrE77Jax
	vzOTgTDT18bLxVTA1tpGIcF+b8fwq9KhUUbd2vnYylHiVStSNwmPm9pituwsCA==
Message-ID: <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
Date: Tue, 25 Nov 2025 21:13:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
 <20251107232329.GI5558@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251107232329.GI5558@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ts8k8bwp1efza9rj18i4ba15i8a3zj56
X-MBO-RS-ID: e53d64192f6dd2becd5

On 11/8/25 12:23 AM, Laurent Pinchart wrote:
> On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.
> 
> Could you please explain what broke ?

Consider mode->flags, V-ones for simplicity:

Before 94fe479fae96 :

DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW

After 94fe479fae96 :

DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke

The "Neither" case behavior is different. I did not realize that:

DRM_MODE_FLAG_N[HV]SYNC is not equivalent !DRM_MODE_FLAG_P[HV]SYNC

They really are not equivalent .

[...]

>>   	/* Configuration for Video Parameters, input is always RGB888 */
>>   	vprmset0r = TXVMVPRMSET0R_BPP_24;
>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
>> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>   		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> 
> I don't think this restores the previous behaviour. You would need to
> write
> 
> 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
This patch covers both the N[HV]SYNC and !P[HV]SYNC , so that should 
restore the behavior to "Before" and explicitly be clear that N[HV]SYNC 
and !P[HV]SYNC are not the same thing.

