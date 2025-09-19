Return-Path: <linux-renesas-soc+bounces-22091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702DB8A5DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 17:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3BF1896A6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 15:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116AA31CA41;
	Fri, 19 Sep 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yHVlC6jo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hLtBEhbi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7731C592;
	Fri, 19 Sep 2025 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296564; cv=none; b=Z2k5WbYjAuWcarfBvJhVGs9OEiw8tIeCmsY8xfSFdoS3EcVBgxZG+b1cq1XLoy1H8p5G9ouv8dB7wX5uvTH4q0PVX8R4EIcDSX48nYQZP+G+nDETFDSMIpkf0LXS7g1mpKRm5HSVax0PsRIkmgkibt6uU0huE5hxcofgAuNMJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296564; c=relaxed/simple;
	bh=nT0IlK4MNyUIspg9avz2WKTOIwejIyISgsi6l50Mpzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD66LLSeaeQgb0S//YNjZm8fl8pWdLuFxKoLkdfTD0Zg2q/IsiFOMQvKbadP/Z4VAFqLUrZV301PNds8QEBHTS0oLO4YICUzMk14uqZTbHd61aAPnfQ6Iga0gfDSXrhLoByrCJb2inLCz7QSEoVVmnAHNZdECgf0WMr6HUJLDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yHVlC6jo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hLtBEhbi; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cSxbM2x4pz9srv;
	Fri, 19 Sep 2025 17:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758296559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1Ehgl//7J5eN6jIwhxHmYv+Fa5MYiiiBJ6kgACwPfU=;
	b=yHVlC6joAYt1+1RMpzsfhIqXUqeNKrZOxDn5euG5D9bmVWDRRqrIZLjDYgQDaVoL066Knw
	JUg+dZrOHPc1ltO6GSxVX7+w7MyUjRQKX9VhwJbVM6S15/A+ggso8jTyUG3xWqQ/oVwCZV
	0xyX7sWodNsL+nY58NT4+q5Tu9S67IsCDB1GaPuB6sd23WDaV6ce9QdiMciFDMAA0GP22o
	jp2JnVMUmV6nZGMAdNKj+xcTDf9ZiskDc59CIZN+6L26J9OHI+MYGq/2cCMV/NBcag44Jz
	cEVrNxzdWg7ss6IVB8gV8fXoMI4RE+3ltbFZvQNeBD8Z3I8TXfh12SPRphCk/A==
Message-ID: <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758296557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1Ehgl//7J5eN6jIwhxHmYv+Fa5MYiiiBJ6kgACwPfU=;
	b=hLtBEhbiDO+lKrG8WUaqpYtg45pLbEgKIJQOw1wIxZUUF38HPDEReOqlr1j58LGg0/ehxI
	EKVLIVUbocX5EqliK+6oH4H4m75dRKSZGUGBd6RbqVtu6DDHA86TynI2/4z2balA2+OF9Z
	4+lGKOzuCK5ifYZ4Co3gA/9nFaSxbDzbyHNQSvt14UTjx4ruqxHK+McLt6G5rB1T7gp7yr
	0hjl/DdxZ41qRcD6ugLcfD9PbmftjB8aDrSt9CPk8mnyYg0HI0rcahPmCImzkANDuQbap7
	9vsHYfjLMwPGNBbcMszAVPxRbytgHffL0leH9V8JUMuqkljG5ovoUL/S1vWUPw==
Date: Fri, 19 Sep 2025 17:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Allow panel@ subnode
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tgc6nksa5org5k5jrkqcbo767uioh3zf
X-MBO-RS-ID: 94d5eb12e6c652a00fb

On 9/19/25 5:21 PM, Tomi Valkeinen wrote:

Hello Tomi,

>>> On 05/09/2025 00:01, Marek Vasut wrote:
>>>> This controller can have both bridges and panels connected to it. In
>>>> order to describe panels properly in DT, pull in dsi-controller.yaml
>>>> and disallow only unevaluatedProperties, because the panel node is
>>>> optional. Include example binding with panel.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Drop the dsi0: and dsi1: controller labels
>>>> ---
>>>>    .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>>>>    1 file changed, 51 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/
>>>> renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/
>>>> bridge/renesas,dsi-csi2-tx.yaml
>>>> index c167795c63f64..51d685ed82891 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>>> csi2-tx.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>>> csi2-tx.yaml
>>>> @@ -14,6 +14,9 @@ description: |
>>>>      R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2
>>>> mode, with up
>>>>      to four data lanes.
>>>>    +allOf:
>>>> +  - $ref: /schemas/display/dsi-controller.yaml#
>>>> +
>>>
>>> Did you try with a bridge? dsi-controller.yaml only allows a panel. I
>>> think I discussed this with someone not long ago, but I couldn't find
>>> any patch sent for that.
>> Nope, I only have these two 5" and 7" RPi Display 2 panels.
> 
> Ok. My point was just that the dsi-controller.yaml doesn't allow
> "bridge" node (you can just rename the panel to bridge to test). I
> thought someone (I just can't remember who was it =) will send a patch
> for it, but I think that hasn't happened.
Do you want me to drop the bridge part from the commit message (I assume 
yes) ?

Any other change I should do before sending a V3 ?

