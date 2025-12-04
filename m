Return-Path: <linux-renesas-soc+bounces-25553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88717CA3B0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 14:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7253066DC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 12:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C5D325726;
	Thu,  4 Dec 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IF3Oi617"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DAC2DE709;
	Thu,  4 Dec 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853134; cv=none; b=iZCCq34u6faLrd0vu68Nt+H9iVXLRAb3LtnFBwBW8kJm5l1aMQWFQkt9SjpMcGEViQnpxfvD/cei/zEBweT8VQ8t21NjsKbvanDL27bnaigdkC4071vZCTY3MWKapAmrByGonS8s/Fxqik6c4qIBMtRXdpiiI6cJNHnS42UnCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853134; c=relaxed/simple;
	bh=ogbjbsoXVQNPtxaeTClW3KYHN7NZWmk6iE0ZtQepCP4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=B8BI0LawCrdmX8kO4EoZU78sHGS9bFmeCw3UQLbwvgaAD0jN4iCyHATOfg0sRkplBW14LJUDjILruRuarX+0J+9YiHXsGM7ZEIjSvW96ZHk4u3AiG9Nqrdzl+YMfy/ZI3qEFkvgwtIagnZqRDxTH5AynQFZ3WZOBrUnKgS0Xl1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IF3Oi617; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F8D98CB;
	Thu,  4 Dec 2025 13:56:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764852992;
	bh=ogbjbsoXVQNPtxaeTClW3KYHN7NZWmk6iE0ZtQepCP4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IF3Oi617ZgDXnTCdIXE6Q6SWiiaalV+tBxjFTqbtjYW0+go9U4rlWLfHQKSGeG3jc
	 ml6NWKuy0XSEX1ZOVMwBrljWt3fESxNTOXHKvx2smIxLfsrVkyaCVX7AhR8LYWmBIK
	 Fjwb7mXFrxefxC96HctzckhOAF0i1gTVb/MUi1Bs=
Message-ID: <874ca23f-c50e-49ae-be2b-eb6b9cf2b068@ideasonboard.com>
Date: Thu, 4 Dec 2025 14:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
 <1f580f1d-8ed5-4167-8991-1909c350d00e@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <1f580f1d-8ed5-4167-8991-1909c350d00e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi again,

On 04/12/2025 14:54, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/12/2025 20:11, Marek Vasut wrote:
>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
>> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
>> previous behavior for maximum compatibility.
>>
>> The change of behavior is visible below, consider Vertical mode->flags
>> for simplicity sake, although the same applies to Horizontal ones:
>>
>> Before 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
>>
>> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>>
>> After 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
>>
>> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
>>
>> The "Neither" case behavior is different, because DRM_MODE_FLAG_N[HV]SYNC is
>> really not equivalent !DRM_MODE_FLAG_P[HV]SYNC .
>>
>> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks, looks good to me. Pushing to drm-misc-next.

Actually, drm-misc-next-fixes looks the correct one for this.

 Tomi

> 
>  Tomi
> 
>> ---
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
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: - Update commit message
>>     - Use only !P[HV]SYNC
>> ---
>>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> index 9413b76d0bfce..4ef2e3c129ed7 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> @@ -492,9 +492,9 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>>  
>>  	/* Configuration for Video Parameters, input is always RGB888 */
>>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
>>  
>>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
> 


