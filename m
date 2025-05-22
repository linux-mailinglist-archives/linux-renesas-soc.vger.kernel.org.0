Return-Path: <linux-renesas-soc+bounces-17371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B022AC0BDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3855E4A75F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C326E28A3E2;
	Thu, 22 May 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTariqT/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BB7D098;
	Thu, 22 May 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918007; cv=none; b=bagyZhZ/JgOmRqyj2uTYO4OTwEYA8NmhwwnACoyRDpDtYMdCKiFCW22dFM94NNopbiyGeFX05AS14ltQoM/fCJ6fJnYmQ6cZT0bFwMdPsAmKXK6DkYoqqvVgVvOY77QiR6uAezFlKgS+1XJt0QZmGmRZe6yXu4L6jAlMETC5rHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918007; c=relaxed/simple;
	bh=yqdBkbrJxcadoEyqCSoaqj5nw4PAHonI4ZHJExMHUws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8hGqJDTKb3YSKItuQOrkxMR66uR1YiLr7lG17VR+D+prA4C6d43sFA0fzT8BrGpewAO365EnHmRoAjDQDaZzCEjqZlqO6jZX3svtpNfd4fYPWvipmnhpazdbpd2zcASRqyYme5F3/jFOTbu+PYE4oFyZisS9QMWGO9c7fcXKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTariqT/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BD8C4CEE4;
	Thu, 22 May 2025 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747918007;
	bh=yqdBkbrJxcadoEyqCSoaqj5nw4PAHonI4ZHJExMHUws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CTariqT/8tuu/mTASNwunqzewr0WtcYQnYTakNEibAYGinNJLlsTabyXvOdjgAE6L
	 cqnWvyEk9s5wQ1d3g9H3Qio5tLSjuYLRh0R+gMoUMLhYIn9irt6EmXJ8ygMgHPbrfL
	 xIBiCa85kXohpUdIm1cGheitMKPQHSpnQmHxjydoQQ7nOt3MQq79dWaxnCCe6Zr+YF
	 6N6o/LyrmxCLmEijNuxh+CActfXwKJEzc80JAWm5o+RilcB8Acg9b1pN/x2GG5j9FZ
	 HfB23NWfZQPHQdca3ahIxMh0ddg+oXTqr4fWvzaGXOxS9zp+Cs8qJCYQcEIuefijkV
	 8dJd2gmJXD2Sg==
Message-ID: <4a07048a-c55a-4fd3-b4e5-7f9d218de76f@kernel.org>
Date: Thu, 22 May 2025 14:46:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] dt-bindings: phy: renesas,usb2-phy: Add
 renesas,sysc-signals
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, kees@kernel.org,
 gustavoars@kernel.org, biju.das.jz@bp.renesas.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
 <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>
 <20250522-evasive-unyielding-quoll-dbc9b2@kuoka>
 <b22e7a46-7e35-4840-aae3-a855c97fbde4@tuxon.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b22e7a46-7e35-4840-aae3-a855c97fbde4@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 12:26, Claudiu Beznea wrote:
> Hi, Krzysztof,
> 
> On 22.05.2025 10:03, Krzysztof Kozlowski wrote:
>> On Wed, May 21, 2025 at 05:09:36PM GMT, Claudiu wrote:
>>>  .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>> index 12f8d5d8af55..e1e773cba847 100644
>>> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>> @@ -86,6 +86,16 @@ properties:
>>>  
>>>    dr_mode: true
>>>  
>>> +  renesas,sysc-signals:
>>> +    description: System controller phandle, specifying the register
>>> +      offset and bitmask associated with a specific system controller signal
>>
>> This is 100% redundant information. system controller specifying system
>> controller signal.
>>
>> Drop.
>>
>>
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    items:
>>> +      - items:
>>> +          - description: system controller phandle
>>
>> What for? Explain the usage. How is ut used by this hardware.
> 
> OK, I though I've explained in the renesas,sysc-signals description
> section. I'll adjust it and move it here.

That description did not explain me at all. I mean really, which parts
explains the usage by hardware?


> 
>>
>>> +          - description: register offset associated with a signal
>>
>> What signal? That's a phy.
> 
> Would you like me to specify here exactly the signal name? I tried to made
> it generic as the system controller provides other signals to other IPs,
> the intention was to use the same property for other IPs, if any. And kept
> it generic in the idea it could be used in future, if any, for other
> signals provided by the system controller to the USB PHY.

Bindings are not generic, so yes, you must explain here what hardware
aspect this is relevant to. What signal? Between whom?

> 
> As explained in the commit description, on the Renesas RZ/G3S SoC, the USB
> PHY receives a signal from the system controller that need to be

Interrupt? Some pin changes state? What is a signal? This property is in
the USB PHY device, not system controller.

> de-asserted/asserted when power is turned on/off. This signal, called
> PWRRDY, is controlled through a specific register in the system controller
> memory space.
> 
> With this property the intention is to specify to the USB PHY driver the
> phandle to the SYSC, register offset within SYSC address space in charge of

This is obvious from the schema and I asked to drop redundant parts.

> controlling the USB PWRRDY signal and the bitmask within this register.

So basically this last piece describes what this hardware needs to do
with system controller? Change some register?

> 
> The PHY driver parse this information and set the signal at proper moments.
> 
> 
>>
>>> +          - description: register bitmask associated with a signal
>>> +
>>>  if:
>>>    properties:
>>>      compatible:
>>> @@ -117,6 +127,18 @@ allOf:
>>>        required:
>>>          - resets
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: renesas,usb2-phy-r9a08g045
>>> +    then:
>>> +      required:
>>> +        - renesas,sysc-signals
>>
>> That's ABI break.
> 
> There is no in kernel device tree users of "renesas,usb2-phy-r9a08g045"
> compatible. It is introduced in patch 11/12 from this series. With this do
> you still consider it ABI break?

Then this patch cannot be split from binding introducing the user. Don't
add unused/undocumented compatibles.



Best regards,
Krzysztof

