Return-Path: <linux-renesas-soc+bounces-27067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC5D3B682
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99C293002176
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8942631281C;
	Mon, 19 Jan 2026 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pD6znHaQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109842BD5B4;
	Mon, 19 Jan 2026 19:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849269; cv=none; b=quBvTvpaThMzkW5+3JVnP+hTjnNrQE+Ns+bFynuQfw8UbiuF28YZUbLTcNAh+zcG+4kvhGPgabRVp4k2NtPe7QI+OQhFQ8c5Xu+mrpMQy0En8K4RYNY+KfufxuvLuCVrVM9Mv6PGPm7KUuT4VFSxhEG7O0F1GJcRDD3wOghHlSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849269; c=relaxed/simple;
	bh=1r03tFePel8c4madg7Epkw8zXeEhbAb9cyIji9K+4ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXuEXUgomWj2B8NjTstH/EFikMt2y40KMgpsNLVQO4ysmWjSSPg8iuMwtxiqsX88/VTzecOUcHdga147yTg0j5W5TkPh3AzSTfMEL9mfrFO8ylqhG6qMGgru4JVrwMj4LKfHAWMZ8Dj7VQj7kHv5Pm4udiubPEGekU4M+lgNl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pD6znHaQ; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dw0Cs5gszz9v15;
	Mon, 19 Jan 2026 20:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768849257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHWgHmHioEt/0YiiJEprWST3wU3t3S/52C4koyjJRYk=;
	b=pD6znHaQkhDrHvxE7ZHu8rnPx7tGuW8bnoNSf3bzVLSyUaesaPyNp6ZO5RbceRbr2dm7Zq
	9uAWG+AV8bWIPezuKWOlFyg7VNq/K8Xq2aUgSIhiqjgh52x5G3LHRd9eVC9qUcKL2qWcMO
	4bMXZf/b4PwWs7laV/kbIqkj8P3Ez6JSBwwa21uqfLxFkIEWQmcVHTuqLrmU+6HtCy8hdA
	Ufyi3vTS9Gck/pObcv7xlmpSQIBw2TcLESWawySdGljAAy+5/i+CeViQ6R9pFZ1CsK6J0Q
	b3/knjgKsWycv5FsQUdQPeWVb/NIlRy4nTHRFaPMn6WyGkXzfItLDzNlUt1dpA==
Message-ID: <a76c8764-b0be-40bc-941f-02515cd5167d@mailbox.org>
Date: Mon, 19 Jan 2026 20:00:54 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aW5hmb9tyw1Gv388@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jga11wgoc6aah6yxxmh97yibomjjdejy
X-MBO-RS-ID: cde433c36df03f86619

On 1/19/26 5:53 PM, Cristian Marussi wrote:

[...]

>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> index be817fd9cc34b..d06cca9273c48 100644
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -146,6 +146,13 @@ properties:
>>         this platform. If set, the value should be non-zero.
>>       minimum: 1
>>   
>> +  arm,no-completion-irq:
>> +    type: boolean
>> +    description:
> 
> Shouldn't these two points have to be swapped as per Sudeep and Rob
> suggestions ?
> 
>      description:
> 	....
>      type: boolean
> 
>> +      This optional property is intended for hardware that does not generate
>> +      completion interrupts and can be used to unconditionally enable forced
>> +      polling mode of operation.
>> +
>>     arm,smc-id:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:

They were referring to the content of the description: . Note that the 
type precedes the description: , see e.g. arm,smc-id above or any of the 
other properties.

