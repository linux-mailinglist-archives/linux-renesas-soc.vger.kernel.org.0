Return-Path: <linux-renesas-soc+bounces-23822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F1C175DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70AE11B281E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468AF2D879F;
	Tue, 28 Oct 2025 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I+UFeKaT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43D22AD32
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694256; cv=none; b=N88toG3FTQp+O3Yr62vqMuIMXp0J0hvCCIupxk8oueSEZRuCB7BNyVe10ybvO2unYzFY3l78gfr92rNe2i0Numi8HUQPVuLQ3pWVIBzy2G/MG6kj1eBuqxVJCGGJZadwn/3Id2u324JxNVTg2X+lNuZiGFVlO2kg8p9J+gYZdwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694256; c=relaxed/simple;
	bh=x0A26jyR8bmntwGzSXRbORXN/+lXVZOI9CumsysdrC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxKC0u80W+W5EuGhKSU37gbBpmkyIetb1eTqnRKfXhxTLLbqnolLkbXI1+DUZc5Ictnkll3IPQyHOtTyb192MfZUqE8Vk7rm2hd85iVDvRBRwIMGeY14gIAFaz1pxEsMxRiFOnBwVVM5AvxRIISdwfvJ3JhY0/6CJdjCcUlDd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I+UFeKaT; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx67Z25Qgz9tN2;
	Wed, 29 Oct 2025 00:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9BmYL/i6Hyf7UCiTg5HAmzogLkrlL+L3F4jpUu6knFQ=;
	b=I+UFeKaTcB5gBy3REC3lkbLDmUTpSQqfRT130ZbXue6jwi/dWhXz7IwMJ71aqZjrf5PKs+
	8fG9lhlosXr87U1JHM+g7TeQjwiA4UR8uHEyO4lnv6cC6oxJZCdIRMYp9QkOk3tp8Dbecg
	3O2l2dpUSRBuhYCltnEA+IxfzDGKkXkj4uTgg7CJDfAVO8D3b4NGKcEB9XzW4tMaYP+99q
	42FkW5Dnjt5Bc9UQfUxPqgSLRTZjhAL+y9/BUifnVvmdJZpFdsiusCQC6Ncj1O3nn6vlXz
	6MyhkiXNuUO/KxLBqS/2qJYyCQ/QQOkyPoblKtpdTKWFEeCq19AWNwjiv0n8iQ==
Message-ID: <214eaf54-f77e-4d04-85ef-38801f88f5c9@mailbox.org>
Date: Wed, 29 Oct 2025 00:30:48 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bff68fb9-d826-4d5e-8896-13cc62d40093@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0af70b5789e28b4449e
X-MBO-RS-META: h7mardtic5shnaaax9gwsp4qkzg6whc9

On 10/28/25 6:28 PM, Tomi Valkeinen wrote:

Hello Tomi,

> On 05/10/2025 06:02, Marek Vasut wrote:
>> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
>> Most of this patchset is boring mechanical conversion.
>>
>> Noteworthy patches are 6 and 7 , those introduce handling of DSI mode flags
>> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
>> should not have any adverse effect on existing hardware.
> 
> After the few minor comments I sent resolved, for the series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Remaining issues are fixed in V4, thank you for the review.

-- 
Best regards,
Marek Vasut

