Return-Path: <linux-renesas-soc+bounces-25592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D57CA7161
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 11:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54E8323283C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 08:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926533B6C1;
	Fri,  5 Dec 2025 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tH2ujPA2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380733ADA8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764923622; cv=none; b=h4wjgUssdD+ihUf356fq8xywBbn0tLjPLsGeqMGA5MQXjDIHppuhyAVuSFG87HtNQVlmhVrzaSDBuyiT94ePXU41HRFMHVHDAGZpqaBpL5/sQTC9wHejtJAXWNIC0W4PAXCEmvrk2ja+ILhsLohEGvv9qEIbm7H9XkR7h32oz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764923622; c=relaxed/simple;
	bh=UyQjbgNkcQ8ZMj3fNbDdVkLI3cFd/TSrINhKEXB38mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVJPq0q9wz22HGiMmYv4dN35FHrnchvPPISDsdvOVcLj0DDhn/RzCqynR9xFeqEgyeDoYP+6xNox1uSiKSJgxYPbsTBAQ8iJ0kNlP1ev6Erp3Kg9XcjsaECSQL6FYYiA887Vbc6gsGH8w06aibWnk/hRrPd4JU119V3Di5yNtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tH2ujPA2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25445E7C;
	Fri,  5 Dec 2025 09:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764923472;
	bh=UyQjbgNkcQ8ZMj3fNbDdVkLI3cFd/TSrINhKEXB38mU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tH2ujPA2jle2bE1on5NnXBDmajAjBlTFQRCBoMpP10xnsLZJk6RSbKD1nr0cTtm16
	 OPMDK1vIv86y/siCEUVKFVHJ66OVyyj0Kedq9GFIq5lTkonl72X/pGPiiGu6yioZsx
	 GvHws4a6BYyIpzWhNg5Sn1ViVZbNIk6+8eVLuJUo=
Message-ID: <4dd94089-eb3d-47f2-bc4a-0f238eaf9ed8@ideasonboard.com>
Date: Fri, 5 Dec 2025 10:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
To: Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Vicente Bergas <vicencb@gmail.com>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
 <aaec3da5-83bb-4de9-a999-67ed65711b90@ideasonboard.com>
 <20251203022229.GJ8219@pendragon.ideasonboard.com>
 <20251205-magnificent-mink-of-completion-acef96@houat>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251205-magnificent-mink-of-completion-acef96@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2025 10:32, Maxime Ripard wrote:
> On Wed, Dec 03, 2025 at 11:22:29AM +0900, Laurent Pinchart wrote:
>> On Tue, Dec 02, 2025 at 10:58:50AM +0200, Tomi Valkeinen wrote:
>>> On 02/12/2025 08:34, Laurent Pinchart wrote:
>>>> On Sun, Nov 30, 2025 at 01:11:16PM +0100, Linus Walleij wrote:
>>>>> This fixes two regressions experienced in the MCDE and
>>>>> R-Car DU DRM drivers after
>>>>> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
>>>>> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
>>>>> caused a series of regressions in all panels that send
>>>>> DSI commands in their .prepare() and .unprepare()
>>>>> callbacks.
>>>>>
>>>>> This series make it possible to selectively bring back the
>>>>> old behaviour with explicit semantics and implements
>>>>> the old behaviour as modified commit tails in MCDE and
>>>>> R-Car DU.
>>>>
>>>> We now have a third platform broken by
>>>> c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
>>>> for a revert, to give us the time to implement a correct solution.
>>>
>>> Perhaps... It's been very slow or not possible to get feedback regarding
>>> (some) of the broken platforms, so I don't think we have a safe way of
>>> changing the enable/disable sequence. I think the "correct" solution
>>> then is to make this new enable/disable sequence either opt-in, offered
>>> by the framework, or just implement it as a custom sequence in the
>>> specific drm driver.
>>
>> I don't think that's right, sorry. We need to improve the bridge API to
>> handle ordering properly. Changes to the commit tail handlers in display
>> controller drivers are hacks, they handle issues with the internal DSI
>> transmitters, but if you had a LVDS-to-DSI bridge in the pipeline things
>> would still break.
>>
>>> Reverting c9b1150a68d9362a0827609fc0dc1664c0d8bfe1 will break DSI and
>>> OLDI outputs on TI platforms, so we need to implement a fix for those
>>> platforms before the revert, and there has been one or two fixes merged
>>> for other platforms for this, which most likely also need to get reverted.
>>
>> That's 3 vs. 1, so I think breaking DSI and OLDI with a revert is better
>> than not reverting the commit. If we can merge a propert solution at the
>> same time that's great, but the first target is to restore operation of
>> the drivers that got broken.
> 
> Yeah, I agree. Could it be possible to flip the custom commit_tail
> implementation and instead implement it into tidss while the core
> changes are reverted to avoid the regressions and keeping tidss
> functional?
Yep, I have a WIP series. I'll send it today.

 Tomi


