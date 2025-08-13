Return-Path: <linux-renesas-soc+bounces-20443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DBB242F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 09:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFFD27AFEA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 07:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368672DEA7D;
	Wed, 13 Aug 2025 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NIZnSNeG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0242D060A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070931; cv=none; b=IB3Cu42uip7qnuZyMHEfvFfEUxf23jQg8ORp1UK5MZGI6demxItmoQb93R9sQy53HqjxvMEYE3+nhJpfTeb+GJMpZZAByTmiH933PoQQ0WK0D54wwcC5Kgnf0eBSH3Q9OyhHF/yB0taXpt2oAnx8zOVMWUyRAWzvUQI0kBMMawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070931; c=relaxed/simple;
	bh=pfi0Nlnyj6XBvdl1brm/RguLb44hlUQLAHoSNeBRh+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjiVPrzL15RIS6XIiXQYuTChVp68tboFday3HEHnxS8RDhdNiAxgShlLLSHEbrLQIIyB75yN45lekIgFRKI/UwkRe4AGCYCeJNelC5Fmgg+PBWdlWTkQ0NmNWgjuJuXf4lB0sKpPpslqy6wiXnUag8Hm5S0Kuv7S5MXDL02zDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NIZnSNeG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8AA4379;
	Wed, 13 Aug 2025 09:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755070874;
	bh=pfi0Nlnyj6XBvdl1brm/RguLb44hlUQLAHoSNeBRh+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NIZnSNeG/y3zjJlbx/lMMBnPESEZaNigQzVv6D2zAT3FBctXVbwq4hacpAzsMiOTd
	 Qi1/3fMefr/nF/ZMVjsjnPo3dtF6Ro/yZzS6FVfrv0Kur9LhktlTfSFAql84O1WhtM
	 KFRrnagr1C+uYvTpFMgGDFxFjp4ooFUCEGEAaZgw=
Message-ID: <205c11a3-4794-416b-b287-76c853ca4fd2@ideasonboard.com>
Date: Wed, 13 Aug 2025 10:42:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT()
 macro
To: Marek Vasut <marek.vasut@mailbox.org>,
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
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/08/2025 22:32, Marek Vasut wrote:
> On 8/12/25 3:26 PM, Tomi Valkeinen wrote:
> 
> Hi,
> 
>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/
>>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> index a6b276f1d6ee..b3e57217ae63 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> 
> [...]
> 
>>> @@ -51,11 +51,11 @@
>>>     #define TXVMVPRMSET0R            0x1d0
>>>   #define TXVMVPRMSET0R_HSPOL_HIG        (0 << 17)
>>> -#define TXVMVPRMSET0R_HSPOL_LOW        (1 << 17)
>>> +#define TXVMVPRMSET0R_HSPOL_LOW        BIT(17)
>>
>> I'm not sure about this (and below). We have two defines for the HSPOL,
>> high and low. If one of them is (x << y), shouldn't the other one be of
>> that style too?
> It is inconsistent, but one macro describes bit set to 0 and the other
> bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I
> would be tempted to remove the bits set to 0, that's probably the real
> discussion that should happen here. But that would also be a much bigger
> patch. What do you think ?

In my mind if you have defines for both HIGH and LOW, you have a
bitfield with a value, the values being 0 and 1, and for values you use
(0 << 17) and (1 << 17). It just happens here that the bitfield value is
only one bit long.

But I'm also fine with having only "TXVMVPRMSET0R_HSPOL_LOW
BIT(17)", and then the interpretation is that we have a enable/disable
style bit.

In the end, I'm fine with any of these, or the current one in the patch.
Although the current one does rub me the wrong way just enough for me to
comment about it =).

 Tomi


