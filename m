Return-Path: <linux-renesas-soc+bounces-30049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCdoOPpkvml3OQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 10:29:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA252E4693
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 10:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0005F300DDF0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 09:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D8635839E;
	Sat, 21 Mar 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qa5jZhGo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9A32C94B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085368; cv=none; b=rL+L+Vq0JRRavU2+URZyniu9DzEmRjJWC0P/aruf4zNPCrPNHhkbnnkOuk9e7IqBHP1tFRFY5KSkLyXsPPlVzTxN8pKtSKaQfO09UxFggA3ssHyqrWV9lU3pO03IBcczIlq1p/aGT1iCar8teE8FbNLZS5xuJxKNUjKKLFl3FU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085368; c=relaxed/simple;
	bh=S76NDo7G9Fif+GinmDfkE9jIRA07xbZsaoS12azmLJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B79B16Tnh4F4BCLdCiuETwoW9Us6Sw4r0NACEQlShZlpGzMZUili0WqdNNuev5R3zvkDZLB9kL7jA7r9P3O9iCiwJ9HrwTE0UoFk3vbmZn+1yTez7TSn1S4EulhzZHHQym25tOIoRxC64WEOv3jRz574lwIRB/wgTNw3Pqx9f9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qa5jZhGo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe655187so18794035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085366; x=1774690166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ae7LdzXoquAOXrOj2DhIoBLAnNhW7bM3mjCSYPOvKpw=;
        b=Qa5jZhGoBzv8mKNdXKLgDg3ssv8RCgmEqOFvoJwu4y1J8EWO4jP2bjkkhPAEdyH48i
         19Spxdia9k11zidlGV76vgL9cDIvNKalbI17gc6LjGztefJ9PpSBKA+EOWK/Ms9V5N6D
         ptGxoIQxuolPCiXKb+zl4Uc+QxDoCGcmKW7KyOy3sIpi1e2eN2yyfWR5uC3Wz+2o41vY
         65bCiwVjvhqLFK+GvTni/MIaJyd9GN4Ka8ysfIM2doWKGU8okJCK1iTmUSXp3AUFTsEq
         hYLtKVS0RTj5BoA3UIqydAUlMTpjYcFOnjvJE2E0hQB7SB9WPZ7h1GXB51HAvUca9KkA
         vMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085366; x=1774690166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae7LdzXoquAOXrOj2DhIoBLAnNhW7bM3mjCSYPOvKpw=;
        b=FzQutdmvP7yd5EbR9wZhyP6i9/dB+LZPPtP1uEYV/tw6wuk+AuTTrtGX6YxtM9GkBX
         mY6WvzfHf8nBUnlImv/r2XVFtzzyz0b8QZr8fQ54kp2q5CUbU6P+6tIxQIUqnQg++nrO
         j1ixnRiWE0HmiZ5PZ0tYXFzQumHISIEf6+0fchaqzMwfum6KIiDox/f8GV+TuV6RKp1P
         Va/2pNjfleBBrHcRil/i9IOJCp4+JLsiYJZdunR9N73eojYCu2Vv10ImCVUL0n4nCGbH
         2qZUnGW/u4mwhJJOwhKhn2IqsPfss1GVLU8YJWC9ePuOmvnd//bOQvKmUgJbCj8C6NI1
         FCnA==
X-Forwarded-Encrypted: i=1; AJvYcCXGQwBDB0GkTbPQnM637BhaW34PobLQ4GKzaBbPpCoeV05Fe8LE2oYJe7ebtsCWJBooYzdMlvESN9DzlFUI8kkOkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWdPWivo1lx0qpOau5KjeTUfpcS1x6WBEZ8L8gnC88BgVhIBF
	f64MIOzV7yj2E1G2dKU75s87ymz5s51M/AgdEXS81iFP0e2IhPWTGh91jz3S/JfcVec=
X-Gm-Gg: ATEYQzxptlY/1Nv05GPZWlbrPAU6jkeHIy9pulALomn4XvxRzMPdBAQMkOyumBxHEkd
	WbXcxCVlghMXdkA4eCT1SqeYinV3+lBe9NQfnBX+f+qmwxgt9YIYJVDnaJaDa83G+5vSZh3ZRnV
	4BFpoZuUONJ+CAlR71OYqvbNzjxJqLanjGlWS96pftbJVroFaPMr0mSduKgZB2OTD16r1S2FJly
	mq3icmq/3/Aqew5UmHzqWjLb6AHdpYKeUO5Gg7Ox07MSxtlVD5JiEB0BJFEqMhCY3+eCv/UGxYM
	0PgOnfK0CDdLXcvgpcXRd2dO1ezY+sBYs12H+WFXK0fUd5Tzygjf9dPM9za3eGu9MAANe8eZKuT
	75Pwcm4IGMMbHx+LXnVtaytVvg3BcomM+bD3iIDn2EDFt/nSib2H8l4HPBVoRSJGf0iYB7hEL7K
	mvTfaE7rzENSqNxVI9sm7I1Y85RtiuQWmJWI6JJMun7SCFesxqP3hZq6wglLVJn9v0JmdccAzbr
	u1sYg87YdB8Gi3KdZA/DZIDFWpZLDLCIWsElQM=
X-Received: by 2002:a05:600c:3490:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-4870300db54mr37516295e9.31.1774085365366;
        Sat, 21 Mar 2026 02:29:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm160430305e9.14.2026.03.21.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:29:24 -0700 (PDT)
Message-ID: <c1b4cd6d-2b08-4f0d-9b87-4dd163cad334@linaro.org>
Date: Sat, 21 Mar 2026 10:29:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <20260321070919.1687f991.michal.pecio@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260321070919.1687f991.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30049-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 4BA252E4693
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 21/03/2026 à 07:09, Michal Pecio a écrit :
> On Thu, 19 Mar 2026 09:49:32 +0100, Neil Armstrong wrote:
>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>> which connects over PCIe and requires specific power supplies to
>> start up.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
>> ---
>>   .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> new file mode 100644
>> index 000000000000..8b8be572c930
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +description:
>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>> +  The UPD720202 supports up to two downstream ports, while UPD720201
>> +  supports up to four downstream USB 3.0 rev1.0 ports.
>> +
>> +properties:
>> +  compatible:
>> +    const: pci1912,0014
> 
> Hi,
> 
> AFAIK that's the ID of uPD720201, while uPD720202 is 0015.
> At least that's the case with mine and what hwdata says.

Thanks for the feedback, I'll add 0015 aswell to cover both.

Neil

> 
> Regards,
> Michal


