Return-Path: <linux-renesas-soc+bounces-23878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43AC1BC46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80296224FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16967314B90;
	Wed, 29 Oct 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xdMGHRXF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HX5Xism4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDCF311C06
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751542; cv=none; b=dUJFhzepbliq5Xly1wkF/gaHGbiDfpNUpXl7wY5mVgf9DJ8j6J+st6StskyAbVs5L23SzNoK365wYjCEqjjDt0cFB7GxZ5w7ysgPUiWdkhW2jn23bss8hwJXeOIt+LkFcH5oh97d4QzNa+INHCVaBBMfhwIuYQ6iP/nihKgGDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751542; c=relaxed/simple;
	bh=r1fzBvCJYglkcA14ri1jqLim8Cr/hRY4P1gvELMESt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlZiBD+7oOmR6Ewjw0WkPeM0ETF6RHU0trnJEUOtAIRNUCwTI51bvgTPp8m+1mmBVfSk9dWYoYsxNYNAz1DO7FNgW9LOuW+e8JdxuX3AnUx+zcuG8l7/BHt8yXKinwovGMO/2IE1WrXEK3ZBjttim/1o3BMUkSTqEO1XjZisRTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xdMGHRXF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HX5Xism4; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cxWKG5zztz9tCG;
	Wed, 29 Oct 2025 16:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761751538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhUcv1IL0upcpQTK944Koz2Faz/o5idxFnloyVhGwxs=;
	b=xdMGHRXFuQZ4tPB/JkOuSmnPC1BHNi8/kXGpzw0qXhuzihdhNzq4rQo4Etfb0tw0tYboUT
	yPDECIM5iA7/qnBTcc1PTcz7EANJ50YnzXHCa7Db+QkcdZdiErWrQaKGaadV+wTOeeXEMm
	MX/oD0b8I4zbBl7b5wlRbqX+PMtmgLEzcFomj5AnPeWBAoQWuavjW+6RouIWOfdOvcUb6o
	EjNQy4pSQadd0dJvQU2eLGVrwkSsOz+uH9c6jiJkQZRdtT3KRyoxPBOgG2AxwE3wPDBaP/
	0jaym0nkr0vRFURnsQmjme1tOzq8IGjhRB09eCMfMZ3J6QQlhKV/qzNLnXzjOg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HX5Xism4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <795893ce-c7b1-4128-a28c-1b5b5633f400@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761751537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhUcv1IL0upcpQTK944Koz2Faz/o5idxFnloyVhGwxs=;
	b=HX5Xism4Va6eRcYVj7xQJMUjIFIB+n+XxbjoVF6s7S4cREdpmrlNnOXz9FT4T1zFjagXbm
	It18d29BVDl1FhUaUJAximO+r8e1B8iqGMeqwKLgH2RG3Uw1eiSlR+JfVmuROKWxMJ4SlE
	BXIuta68O+DAJsv55pPiZ4aFG5Rb7BJtSuKWKr+VcylTBbqVmVEHMhsaUYjks7j+KjT9md
	c4Lp3IU4Y9T0BwwwKWl7rUHtCpiQqVlWFPyJm1k1efB5HNmlgg18M7qkdaTLu3hDWpMT7N
	OZlaWoha3TmfzZY+ZiWbqwOJyo8gkqmanJrN6kqrTzf8Pv+yl1AQHmVFvDaRuA==
Date: Wed, 29 Oct 2025 16:18:43 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/11] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
 <b44112ed-2c41-4e33-953b-8031fd29a97d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b44112ed-2c41-4e33-953b-8031fd29a97d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: db20519cf3726ca7137
X-MBO-RS-META: 7b1gu4eoscuir7wtezqeeiqmuq9in5ke
X-Rspamd-Queue-Id: 4cxWKG5zztz9tCG

On 10/29/25 10:38 AM, Tomi Valkeinen wrote:

Hello Tomi,

> On 29/10/2025 01:28, Marek Vasut wrote:
>> Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
>> Most of this patchset is boring mechanical conversion.
>>
>> Noteworthy patches are 8 and 9 , those introduce handling of DSI mode flags
>> and convert use of DRM_MODE_FLAG_P.SYNC into DRM_MODE_FLAG_N.SYNC, but that
>> should not have any adverse effect on existing hardware.
>>
>> Marek Vasut (11):
>>    drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
>>    drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
>>    drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
>>    drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
>>    drm/rcar-du: dsi: Clean up VCLKSET register macros
>>    drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
>>    drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
>>    drm/rcar-du: dsi: Respect DSI mode flags
>>    drm/rcar-du: dsi: Clean up handling of DRM mode flags
>>    drm/rcar-du: dsi: Convert register bits to BIT() macro
>>    drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
>>
>>   .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  50 ++-
>>   .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 387 +++++++++---------
>>   2 files changed, 237 insertions(+), 200 deletions(-)
>>
> 
> Thanks, pushed to drm-misc-next.

Thank you

-- 
Best regards,
Marek Vasut

