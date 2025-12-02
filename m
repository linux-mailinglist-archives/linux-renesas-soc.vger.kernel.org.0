Return-Path: <linux-renesas-soc+bounces-25501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D2330C9C974
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 19:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 55036345AB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 18:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1305B24BBF0;
	Tue,  2 Dec 2025 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qw7tZ+Kw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B52222B2;
	Tue,  2 Dec 2025 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699547; cv=none; b=k2TVQNYhdtBtVeMiPA92MhndZ/GMCMdav7oi2uPiLh4H8ah++J180MCT4OotWnM4veN/YOogxba3t9ndSQI5zsEXkAyX8W3pHe1bSlxEazkNBpgi6kKq0uGf39cyRwQn07FQ8L8TQ3/zqrB8FDNijPyDDucDNEDI0wmDquSm8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699547; c=relaxed/simple;
	bh=WeS/VBzYWgoHQTqQfzoNTDlGqCHUR9yeJZ2bGCc1lRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbwS37zgc7H7XAyejGfjqfwtQKr7ioKrcNSletTyf2MlCwZb5JUk3yDOudXCh6CUE5vLaxj7YxgfWqziV/XTB/b7FDpdhj45AnPMi+OE6vTbT7cfawbFEpviUQ2P0EZlb6bm0bAX3evQNh4a3rda7dGl3rf10g4RCnTDzCrCg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qw7tZ+Kw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLTYf1Tlrz9t0J;
	Tue,  2 Dec 2025 19:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764699542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g53S91+c/Gch116GtLv/TmzFVDQ7Kv2v/HyXanlFEPY=;
	b=qw7tZ+Kwn+gflfZouHmuBOkJrG43Z43qidi+BoA5JA8eJPRQ78owJaXgZ/D1s71hhJwTSH
	17QjST0vTcu0kWp+OXa795jzCh8kVpDDiHbd6jSOvt25QgTQs6yBQzd0YIep3og3uf2PP2
	rip9k+XDsV34D3icWGCOXuU4blc9PhOPDqJkOr8pWJfy8giUjDMa7qIWuI68/uF20+lAwG
	YBQhuQ0L4R0CXwiFf1l35vIUrmINDUvrF3JTXJgWOt+mw25LbB3HWDalJr/t7CejHuIywH
	o6SGnm4DwZzYr7pOKsLBAn46xRLJaJcV5qtuQGyQK3iA3xLuKA9loSftQdIpWA==
Message-ID: <31ce0f27-b716-4b3a-b6b6-35bcee0a33f3@mailbox.org>
Date: Tue, 2 Dec 2025 19:18:58 +0100
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
 <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
 <20251201060931.GC21943@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251201060931.GC21943@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 38cc291c0b03b13ee4e
X-MBO-RS-META: u11sdtkxgishbai7ytegta1bfsx3p33o

On 12/1/25 7:09 AM, Laurent Pinchart wrote:

Hello Laurent,

> On Tue, Nov 25, 2025 at 09:13:02PM +0100, Marek Vasut wrote:
>> On 11/8/25 12:23 AM, Laurent Pinchart wrote:
>>> On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
>>>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>>>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>>>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.
>>>
>>> Could you please explain what broke ?
> 
> Sorry, I wasn't clear. I meant could you summarize the explanation in
> the commit message ?
> 
>> Consider mode->flags, V-ones for simplicity:
>>
>> Before 94fe479fae96 :
>>
>> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>>
>> After 94fe479fae96 :
>>
>> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
>>
>> The "Neither" case behavior is different. I did not realize that:
>>
>> DRM_MODE_FLAG_N[HV]SYNC is not equivalent !DRM_MODE_FLAG_P[HV]SYNC
>>
>> They really are not equivalent .
>>
>> [...]
>>
>>>>    	/* Configuration for Video Parameters, input is always RGB888 */
>>>>    	vprmset0r = TXVMVPRMSET0R_BPP_24;
>>>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>>> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
>>>> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>>>    		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>>>
>>> I don't think this restores the previous behaviour. You would need to
>>> write
>>>
>>> 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>>
>> This patch covers both the N[HV]SYNC and !P[HV]SYNC , so that should
>> restore the behavior to "Before" and explicitly be clear that N[HV]SYNC
>> and !P[HV]SYNC are not the same thing.
> 
> Before commit 94fe479fae96 we had
> 
> 	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
> 		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
> 		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
> 		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
> 		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
> 
> Considering the vertical sync for simplicity, this gives us
> 
> NVSYNC \ PVSYNC		0		1
>   0			VSPOL_LOW	VSPOL_HIG
>   1			VSPOL_LOW	VSPOL_HIG
> 
> With this patch, the code becomes
> 
> 	/* Configuration for Video Parameters, input is always RGB888 */
> 	vprmset0r = TXVMVPRMSET0R_BPP_24;
> 	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
> 	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> 	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
> 	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
> 
> which gives us
> 
> NVSYNC \ PVSYNC		0		1
>   0			VSPOL_LOW	VSPOL_HIG
>   1			VSPOL_LOW	VSPOL_LOW
> 
> This is a different behaviour. Granted, we should never have both NVSYNC
> and PVSYNC set together (unless I'm missing something), so the
> difference in behaviour shouldn't matter. I'm fine with that if you
> explain it in the commit message, however I think that writing
> 
>   	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>   		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>   	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>   		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
> 
> would both restore the previous behaviour in all cases, and be simpler.
I sent a V2 which addresses both, the commit message update and this 
comment.

