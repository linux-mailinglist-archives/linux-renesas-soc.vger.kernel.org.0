Return-Path: <linux-renesas-soc+bounces-27099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64DD3C4C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3D16582B90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA68C3D6669;
	Tue, 20 Jan 2026 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Qtk1k5b3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8553A89BD;
	Tue, 20 Jan 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903295; cv=none; b=cAHm0tGKYnHdChlToacKkSwl/O8+BHSEijtugv+fMEUflc68sc2C0GIfmB1gNjqUvPD5jmpjpCqMuEAUHuI27IkIS4xAYt9w+lGQjgzashlFxtPsVsZlb5wCHtTVSGzqtNhfM06WVflCLldANZVHW8KJhTq9g0l41AwsmZxldzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903295; c=relaxed/simple;
	bh=zKBx8VMw5ku5/+n9R0KcMRjMo3zLd5gqui5jroBnXGM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TnGAveACRdr1Gsp1aktSb9+G5mZ1hl/xd6mTlEiUQPrc1h0SaAB7xN+tm+QDLE4hTHs5lIEST3xv4gX4+AxP+zuWWc4vy3L1xqnlNj8LefPZJMqkU5GaAAXf79lfivwpzFztyb/o+OXsZyFx/NeafP5cYBOTeHXQ0R3mxcI+ZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Qtk1k5b3; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dwNBs6cMWz9v0b;
	Tue, 20 Jan 2026 11:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768903286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKfE1HagS5zYjDz3V0NjsZ5zkfW7JXAOUyzpd++NnY0=;
	b=Qtk1k5b3KnAA/8INIZcES60MabXbu9GWnCj/bVKXTNIirJsxIc45R410nnkxcaLDY7tX2m
	msBx5XbN89BWIx/G6asUqmGSSBqY1mSDlrQGaVRzH84L3Oxey29PyBLEDa2ZPKFsAOKwCg
	MOr1yDiYmpApX6mM2kN2Em90o3JLHjIp/EbBq9O3I/vwfsi9hUd4WnFkaYfRQNeP52RewL
	ZeUzu/IN/DLT3yEL1r4hpyyGBnVUgI8tzonScZTQD6V0Xx0YuhBqUMA5Ujv1WBnu4GWPVB
	O2l8hldV0T//t4VSO9ziqm/v9zAUwjMKBYDPKJeBLqQN3UhLndh9iYbO1VPWlA==
Message-ID: <4db9e78d-ec91-4ff1-a395-cdd2d08225bd@mailbox.org>
Date: Tue, 20 Jan 2026 11:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
 <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
 <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: esnahd1odebpirxkdfyrm89nieiddxnx
X-MBO-RS-ID: f259ff1c79d53f602e1

On 1/20/26 10:33 AM, Geert Uytterhoeven wrote:

Hello Geert,

>>> That looks like the plain standard 60Hz Full HD mode.
>>> Is there really no other copy of that structure available in the kernel?
>>>
>>> auo_t215hvn01_mode is almost the same, except for .clock and .flags.
>>> drivers/video/fbdev/core/modedb.c has the same mode, but in a different
>>> structure.
>>
>> The panel-simple.c is full of similar-ish panel timings . The timings
>> above are adapted from the waveshare DTO for this panel. What else would
>> you suggest I do/use for this device ?
> 
> I am just wondering if there is a better way for panels that use
> standard timings.

I sent a support request to waveshare to get hw details, but I am not 
holding my breath.

I don't think this panel should use standard timings in the first place, 
it should use timings which match the panel, but those are unknown, 
because the content of the metal case is unknown. For now, the timings 
come from the waveshare DTO, which only by coincidence matches the 
standard timings, but that may have to be updated in the future, at 
which point the use of standard timings would have to be removed anyway.

I don't think we should press for standard timings for this particular 
panel. For other panels, the timings come from their EDID/DPCD/... so 
that is already a solved problem.

