Return-Path: <linux-renesas-soc+bounces-26655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C9D17949
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 10:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7293D3038D17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 09:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C65389DEA;
	Tue, 13 Jan 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cP8pqTgt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17963815F2;
	Tue, 13 Jan 2026 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295742; cv=none; b=WrdBUzplm6+wRPcqvUP5PFg3XFrP/i5cD1X7y7s20TP9jVSdw/nszEIDWHMOzIvgNMz18wtSa4e03/02TXU5J569rxUGkY9v5Fn9h6IMFjO9qcM61/PRIFgZ02HJhwuTdbTIFFZSK7x74o4ZH4YvPb3wxQkEfWmteMLzvAzVqTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295742; c=relaxed/simple;
	bh=nIIksL5mUlWdTnTjhPHMrEehI9aA1snjhXPcWS3H0qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jk/kbUrKCGrqOECa1ymT3KU/oRP7pLYa2rb0WyWUwFiEeHprwqWvHOxdUF6QSS83YqFGSukcJStscXeO+OaB+eUyDba+Iamczl+9kGQYMNaOi5fCKvJJwgNXgE0/YrkznltAFkmOJksHMTMC42lV3PU2IwHsdzYP/WtgX99OMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cP8pqTgt; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dr3Vz5gLqz9sbt;
	Tue, 13 Jan 2026 10:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768295723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQ7AtPjQ2Ronaqwmz5J5bM5bR7wWBP2yp8oCfP+eth0=;
	b=cP8pqTgtxZhtLZglYZrNCDjSY1DlxxBf8Nc39IYaS5vLeGZ1cXqNaQoSAj80RykGRkZZRx
	clLouFGJSJt5ib18IoC/Lqcp+fZ6N6BYpRVk6sbmfVKqzcQVveZ2Kl4JPsHAoIt6KFIoYy
	xrNxStCJdEM/niCTkMI003ySVC8b7tUc8nOdoRHs3TXLFF2gxmZZQRXSmY6tiIsApU0vAB
	q8JkCD69W979TVzpnPuaF6+9A3pDm9rr/ItBkmWbO1RN6FVVygyLgVIgximr7WIE/KpFjh
	GQV2zrnFkGw97l46Yo6DwRQ1OiUFlYofE5zM4OnS4VQi2BRUotV50vaUfKwZ4w==
Message-ID: <9c59661e-98e6-473e-9a5e-b6002048c51a@mailbox.org>
Date: Tue, 13 Jan 2026 10:15:16 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXT] [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Joseph Guo <qijian.guo@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
 <773b6e43-4f86-4b11-8e6b-a9f2561a75de@nxp.com>
 <65ccfeb6-4962-4964-be1d-cfb0ed41773e@mailbox.org>
 <409cdcf0-af9b-4084-845f-d863ad6303c5@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <409cdcf0-af9b-4084-845f-d863ad6303c5@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zhhta6mtoru8d4m813ormdjwi7reu7uu
X-MBO-RS-ID: 0283d1e8558795067bf

On 1/13/26 9:15 AM, Joseph Guo wrote:
> On 1/13/2026 4:04 PM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>
>>
>> On 1/13/26 7:41 AM, Joseph Guo wrote:
>>> On 1/13/2026 7:47 AM, Marek Vasut wrote:
>>>> [You don't often get email from marek.vasut+renesas@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>>>
>>>>
>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>> any known panels which may use this bridge. Internally, this bridge
>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>
>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>>> warn user.
>>>>
>>>> The lane configuration is preconfigured in the bridge for each of the
>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>> so the actual count should come from DT.
>>>>
>>>>
>>> Hi Marek,
>>>
>>> I don't have 4 lanes waveshare panel on my hands. Have you tested with the 4-lane panel already?
>> Yes, the 13.3" DSI panel is 4-lane
>> https://www.waveshare.com/13.3inch-dsi-lcd.htm, I have it connected to
>> Retronix Sparrow Hawk board which has 4-lane port.
>>
>> See also this patch I submitted, that is the DT binding for it:
>>
>> [PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare
>> Display 13.3"
> 
> OK, thank you.
> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
Thank you too.

