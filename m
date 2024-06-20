Return-Path: <linux-renesas-soc+bounces-6520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB790FCE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 08:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702EA285491
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 06:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5B63F9F9;
	Thu, 20 Jun 2024 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdX5jqML"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601A3BBED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 06:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865659; cv=none; b=ou5neWmuyC3GbuuG9gGreGoxpAhDgMPsqAgtwkXexjGZB+2AEeE4+tjaNAnvmGq3scAY1jTiJb9S4I+5wUsDZuvIE6YTVmME8ZX4F7pGnrxmWxx5X6H1gPyPfDNfwCSBNrmd9N5XLudG7W46Lqb4KNc3FxBL9JrWGEvqvH3fuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865659; c=relaxed/simple;
	bh=0DyIr8oRP6KBBH+K1QiefkxzX+B8T2dsfMh5Vutrro4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdiJbtu7MPxYdiVyhIxSCg/p2DtJq4GAayefEu5Epr9m9R6eZ9HwmZX2D0Hf4z3ZuajZE98KKGbXW1yMbeEQrZOMabGESgEnIpIvCMnuAG3Z9gBZUGnG5VPD53R1L4LxM2pRnb9qRew+DTUqQybh1ZsRe4Fatu5upqLOIoMeFrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdX5jqML; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 738D666F;
	Thu, 20 Jun 2024 08:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718865636;
	bh=0DyIr8oRP6KBBH+K1QiefkxzX+B8T2dsfMh5Vutrro4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RdX5jqMLPZvJnmiR8bGLLXVXvOJ68cjqD8ajMeFodrsqEueSMicfglo+wQ9Wy4oZN
	 OczWi4DZXJG5kkB1IDNE/cGh84ZiMLkKpO23FQL03Hy0lPmcsk8zL1ITu1BoloEpzu
	 bty1eJ8ijBw+0iX6u9Vp/CqG6HjBXtPJxyIYG07I=
Message-ID: <b3cf22bd-fb75-4485-8f7d-dc7312d201bd@ideasonboard.com>
Date: Thu, 20 Jun 2024 09:40:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR"
 <linux-renesas-soc@vger.kernel.org>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
 <20240619192909.GB31507@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240619192909.GB31507@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2024 22:29, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> CC'ing Tomi.
> 
> On Wed, Jun 19, 2024 at 12:22:15PM +0200, Jacopo Mondi wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> Version 0.51 of the Renesas R-Car Gen4 TRM reports bit 16 of the
>> CLOCKSET1 register of the DSI transmitter module to be a reserved
>> field.
>>
>> Fix this by correcting the CLOCKSET1_LOCK definition to match the TRM
>> and remove the CLOCKSET1_LOCK_PHY definition, as the register is simply
>> called "lock" in the datasheet.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> index f8114d11f2d1..1bf9c4717d5a 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>> @@ -141,8 +141,7 @@
>>   #define PHYSETUP_RSTZ			(1 << 0)
>>   
>>   #define CLOCKSET1			0x101c
>> -#define CLOCKSET1_LOCK_PHY		(1 << 17)
>> -#define CLOCKSET1_LOCK			(1 << 16)
>> +#define CLOCKSET1_LOCK			(1 << 17)
> 
> This matches the documentation, but we should get it tested on V4H to
> make sure it doesn't cause a regression. Tomi, would you be able to test
> the patch ?

Works for me.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


