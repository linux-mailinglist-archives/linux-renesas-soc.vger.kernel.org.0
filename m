Return-Path: <linux-renesas-soc+bounces-24134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D0C34D2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 10:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80423BE51E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCC82046BA;
	Wed,  5 Nov 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iK0fYayv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861F2FA0D3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334324; cv=none; b=OIsXeXI5wb+j7YcduAvZpXLXDK3dTIz5hM+qR02Jkt55Q9RGuNNG2/jnwBxEKIuZ3EE5HtAUVwbGtJK2DWzzgvYwJER1gDt1upWOSev6LPmUWOi7SnHoquWmvE4gv+WewQyaxzKeGbcJ/ayB4NTyh25wSgzv5TGpAGlwVWw4QkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334324; c=relaxed/simple;
	bh=awFhXZzE2IGL8BlXadL+botqVoI6oRQSQbqUNatq/7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQ3xkwKV35VCQLUW7s7rV5+k0zcQUxkknhceN/KGhshLHUpjL1K5v9s8oqxzBsufq0bmXf03ngxK3cbY+NkiVEwUG7Ox+WJ2FnmA1YG+e7ZpZyJTIVeTOV6u0GUpmtCVVnukVrXdZZ/FSOp+71P9Cga5R59fCt3P6egCzPoagvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iK0fYayv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F5307E0;
	Wed,  5 Nov 2025 10:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762334205;
	bh=awFhXZzE2IGL8BlXadL+botqVoI6oRQSQbqUNatq/7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iK0fYayvEOCeiDYBCBeSzVLXgSK31DP/jfxsCcXVDbh4q0y/8US45ZLTRnqQU240s
	 VuGnTryI6D1+RntqAL/d3D0GMJBuBSyQQyWOKps7hgNA++JR2F84noF6AdeoYBuDZa
	 jlqCEybyrh3kWdVMevLsGt5u9YA4lwYhmKw+6riE=
Message-ID: <123e92ad-fa24-4f08-a1f3-3ed2fd726bcb@ideasonboard.com>
Date: Wed, 5 Nov 2025 11:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: airlied@gmail.com, alok.a.tiwari@oracle.com,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 magnus.damm@gmail.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, alok.a.tiwarilinux@gmail.com
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
 <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
 <20251104115729.GB27255@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251104115729.GB27255@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 04/11/2025 13:57, Laurent Pinchart wrote:
> On Mon, Oct 20, 2025 at 06:06:44PM +0100, Kieran Bingham wrote:
>> Quoting Alok Tiwari (2025-10-17 20:16:21)
>>> The rcar_du_crtc_cleanup() function has a void return type, but
>>> incorrectly uses a return statement with a call to drm_crtc_cleanup(),
> 
> I don't know if it's incorrect as such, but it makes the code more
> readable.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 

Thanks, pushing to drm-misc.

 Tomi

>>> which also returns void.
>>>
>>> Remove the return statement to ensure proper function semantics.
>>> No functional change intended.
>>>
>>> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>>> ---
>>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> index 7e175dbfd892..22bcd7db4195 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>>> @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
>>
>> This cleanup is called through .destroy which is:
>> 	void (*destroy)(struct drm_crtc *crtc);
>>
>>>         rcar_du_crtc_crc_cleanup(rcrtc);
>>>  
>>> -       return drm_crtc_cleanup(crtc);
>>> +       drm_crtc_cleanup(crtc);
>>
>> and drm_crtc_cleanup is:
>> 	void drm_crtc_cleanup(struct drm_crtc *crtc)
>>
>> So it certainly can't return anything:
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>>  }
>>>  
>>>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
> 


