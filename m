Return-Path: <linux-renesas-soc+bounces-20471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938FBB254BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 22:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16BF07A3A4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 20:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0132C0F90;
	Wed, 13 Aug 2025 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YI0gnFPq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Q9DQ8kKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5929BD97
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118305; cv=none; b=hffBy4qJ2PkGiUNfm2EbA9wlp2pnsx48D6o3be28cTyk0aYNR+4C+q2JwNYVDEU4rnA6IwKGA/odKcDaBa4EymuAtP8ocIODvWIl/UDtprs36OclROxmnbsX7ZFdXQizQFcEcIvMOKQKW3naKveesP0LpelD7csq1Pbo8pV15rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118305; c=relaxed/simple;
	bh=/kWB01C8QOhVo8WG0M4pLDNV3Q9/QF5PLqXsS48lDB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHmLIHa4v3NeVFWOjtKG8KVGBV2TAM3i1CBAxnSvoLf47dfAAJ0H8HP6nsgOeCEB0n6PuaIt/rfK9sSpGLtnJUM0+8EOLqSqbkbViH1Ova43tmCED9cjrZlKxBxXxv7UarqvJz0oMEMFWouTN2VeGM8HZfggjdxssEKW1WVBIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YI0gnFPq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Q9DQ8kKO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c2LC14xT0z9tcl;
	Wed, 13 Aug 2025 22:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755118301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gFwAKu0hoiLVfmAEDUQusobP3JXVMfwhrQTManzOjQw=;
	b=YI0gnFPq9U0dE56ndTCi1Ql7CnK9zaLfbwuNOijMVP5VC94z0LAhyEyKC6XMuU4Dlq0rrk
	u7CaRzUoJBbxi+eofJ+Fjo+MiRXSYCtdDgwL5zyKmxttaMTMLawVNVbyQZ9mHLltJXZ70T
	T26qqZ5SU3x6dd84aG7ypv8cy4MEj4zArVsGxVuas4Fg/cfq7KsE4R5Jg5eJBSRuNzyZdv
	d4bLUM1gFfFG2Z0P/WjhoY2zk0Q6zkdB0LHlCV4vPdaHuNNjp6rocGe5doxgqB/eUzBdeN
	GWM8KZBudvbKiNAK9bom/jQGsGK5LxmxCZX5qKEJcxpBBTlHaHao8HVl+HgGuw==
Message-ID: <b65941e4-6e34-46b3-aac0-0bb8f323187b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755118299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gFwAKu0hoiLVfmAEDUQusobP3JXVMfwhrQTManzOjQw=;
	b=Q9DQ8kKOmxFIUQq3J6k91ZaDAlrcbu6XfI0BXbmfrT9OVaYVGO66bhVM3E/IjyGHEGmEjf
	MuAccuTsUrZdzDOF1KbnMbcCR833s3ixv2kb4yXUZgm1VQsl5p18XI4erN4iEMJt/op8KL
	5qAaOXNVAafHpd0Q4wRapr1OQSO976nWAH2WAqpKUd7Ky54ZVg82gtKgAEU7+B+EJQsCPl
	ihXBBq2YyDimkikEHAp2hFMHF1k5TbKvr5m4/qGFryu8W7pZ8habToadHabIEBWTG6fNhu
	BtkAMWcBXlXJlt9zEc2I6xpMSFhFPkAwjC18ePOR2LAKpA+oBIvr/Cpr7cAgfA==
Date: Wed, 13 Aug 2025 22:51:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT()
 macro
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
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
 <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
 <205c11a3-4794-416b-b287-76c853ca4fd2@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <205c11a3-4794-416b-b287-76c853ca4fd2@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: oojfx7jocnnkx1coq9cq1gnwitdi8w95
X-MBO-RS-ID: aa5deff07e13164b504

On 8/13/25 9:42 AM, Tomi Valkeinen wrote:

Hi,

>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/
>>>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>> index a6b276f1d6ee..b3e57217ae63 100644
>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>
>> [...]
>>
>>>> @@ -51,11 +51,11 @@
>>>>      #define TXVMVPRMSET0R            0x1d0
>>>>    #define TXVMVPRMSET0R_HSPOL_HIG        (0 << 17)
>>>> -#define TXVMVPRMSET0R_HSPOL_LOW        (1 << 17)
>>>> +#define TXVMVPRMSET0R_HSPOL_LOW        BIT(17)
>>>
>>> I'm not sure about this (and below). We have two defines for the HSPOL,
>>> high and low. If one of them is (x << y), shouldn't the other one be of
>>> that style too?
>> It is inconsistent, but one macro describes bit set to 0 and the other
>> bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I
>> would be tempted to remove the bits set to 0, that's probably the real
>> discussion that should happen here. But that would also be a much bigger
>> patch. What do you think ?
> 
> In my mind if you have defines for both HIGH and LOW, you have a
> bitfield with a value, the values being 0 and 1, and for values you use
> (0 << 17) and (1 << 17). It just happens here that the bitfield value is
> only one bit long.

I am not a big fan of that, it seems overcomplicated, hence this clean up.

> But I'm also fine with having only "TXVMVPRMSET0R_HSPOL_LOW
> BIT(17)", and then the interpretation is that we have a enable/disable
> style bit.

I think this would work, yes.

> In the end, I'm fine with any of these, or the current one in the patch.
> Although the current one does rub me the wrong way just enough for me to
> comment about it =).
I can also drop this patch from the series and do full conversion of the 
driver to TXVMVPRMSET0R_HSPOL_LOW BIT(17) style afterward. This patch is 
not strictly necessary for the follow up patches.

