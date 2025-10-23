Return-Path: <linux-renesas-soc+bounces-23512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92CC01A48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EBD3B8A4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F054E315D46;
	Thu, 23 Oct 2025 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HaVABwHm";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PEiveaMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268E2EC0A7;
	Thu, 23 Oct 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227880; cv=none; b=uLSKhVsAxfQV/jSmeM+2ruMK94jdruQSYiq7cLwPuhJ7+SQW4lPHdfeFDrZq6lqVVrij5i727DKO/6eHA0/4xtmFwwRnvP3JIt/pZk+44qf5xdLQQ+jpefl+e4ukA84WjQEQMgJ5E3udjdNEOeJyij3CgHfUNHOSSpp6d6ESMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227880; c=relaxed/simple;
	bh=DYroCMjw9XCPjel3CU+YSBNAO2XxycQfnKMx4IfoDeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aq9WmwWm4S/2A7zoxLiqkPKBt0azit0Rn14mDMr/cXZ6UKh8Q9Mob+TpPEBq6F04eP5X9cF08ojnHVATde1At2s5BdHcNX8mtSmaHQ+hc327W6JQR9chstdBoDiNaYJlOCpSwNiZwbxpCnWdtge8j+ixZBRHdGs+NwXIkXGOTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HaVABwHm; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PEiveaMw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4csnfr3cgdz9slx;
	Thu, 23 Oct 2025 15:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761227876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvDw3KVRz7KvchjxSHR2cOozGBUZnt7khP7Ju+BwHEs=;
	b=HaVABwHmhZOUxy8QugCfn+LoF0N0PRvzMLWoJZ4nggrZqO2Z630mpKgmMiie33/QvpWpRY
	3pk2p45Bxhe3w4zKnrjwHqPxMQVo3YvAi03PZurgtocgJY+2cIGbqsNyId4d6DDLPIFrLi
	I2+MlZ4Rxv71k+Zh6I8uT9fgtsq1yao7w+A60rhCh8/Oss36NQEYvbyawe2nyCG7awZa8j
	dRxIyHn9L52N9H/jRrZZUUCWQbB6iCx+k4/K6paI862xs8n8LKgVF6CkTuJ/i2nNepU71F
	T2j90/aklKGfqvBhzTna3TbGr3/qVLJ3oHeab/rXljrRXY2GlZgFg6sB7hHHfA==
Message-ID: <98ce2726-ab58-447a-bcb5-23b6347fa4fb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761227874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvDw3KVRz7KvchjxSHR2cOozGBUZnt7khP7Ju+BwHEs=;
	b=PEiveaMwtZEcej3rfaw7BGWVnPSXvrzU0PHYP2sM8/v2LF7DLswJgbgvzer/jQwpvWJLJc
	JBrOk59mwKuf0lZU4aj2pU0NTIFPfmUEA4UBAwOqsKxSxSvfp7ZHyjHkojmIuiT6z7hfy6
	jddWSdpleDdryGqnsFYuG/0mN6aepCiRdJOGlqAnFKlNMM9EO8d4B92wLMt/90NUzbvSjG
	R3ynh161xa74jgFy49R1W3wRcpXsVgWosawDKZ3qBaoTZLq9GTlR56q4PPPNYXd0Ovj+B3
	no65cQOxnU1U/fBAqcjJYHF5S6BUlyErdKDk/HyEgqcKDIbBrbJrigUbPl+OMg==
Date: Thu, 23 Oct 2025 15:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <20251023-active-blue-collie-2978ea@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-active-blue-collie-2978ea@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dusg5ipbwggidpzsepg36osiph8xjhnt
X-MBO-RS-ID: 30b98b26cec28366837

On 10/23/25 3:42 PM, Sudeep Holla wrote:

Hello Sudeep,

>>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> index be817fd9cc34b..b53754a318ea1 100644
>>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>>> @@ -146,6 +146,13 @@ properties:
>>>         this platform. If set, the value should be non-zero.
>>>       minimum: 1
>>>   
>>> +  arm,poll-transport:
>>> +    type: boolean
>>> +    description:
>>> +      An optional property which unconditionally forces polling in all transports.
>>> +      This is mainly mean to work around uncooperative SCP, which does not generate
>>> +      completion interrupts.
>>> +
>>
>> Could you please clarify which platform and transport this change pertains to?
>>
>> Introducing a property that enforces unconditional polling across all
>> platforms is not ideal - particularly if this is intended as a workaround
>> for a platform- or firmware- specific issue. Such implementations often get
>> replicated across platforms without addressing the root cause, leading to
>> wider inconsistencies.
>>
> 
> Just to clarify what I mean by "enforces unconditional polling" is with the
> added DT property only. I understand this is new property and it much be
> present in DT to enforce polling, but it can be misused initially for testing
> in absence of interrupt support and forgotten in DT. Hence my concern.

I would argue about the "mis" part of "misused" . It can be both "used" 
and "misused". I can add stronger warning into the description ?

-- 
Best regards,
Marek Vasut

