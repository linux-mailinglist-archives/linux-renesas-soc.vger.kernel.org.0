Return-Path: <linux-renesas-soc+bounces-23529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD8C01E06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA241A65877
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AD532E73E;
	Thu, 23 Oct 2025 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bDGojmZb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pTWrJXBh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719BB32D43E;
	Thu, 23 Oct 2025 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230838; cv=none; b=JOtaHUUyDuDUSGRWW5E07/EF/AU0dE/PLhSPeaoJ2cRHwPw8aFP3EsoX2gi7G28X8TFA8AwfVQbFjL1APTzdjRmZeznA7KoUJPDH5GPlcvEb0AW+kFaewiiZFUKmQo5cd0vK+ibsxJYMmi7JFtrlaSscYgqRJAq21yRQBW11Trc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230838; c=relaxed/simple;
	bh=OKhGWUCQr+57PGU1q2Qd7v4SIdjXRG60s+iYlQma/3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPKBcjXWeP9ie11UzRH4+hOSkiYL6+cIXdUv6/+jXjuISqHHH9Wic75Q+ahxGdTb6rrCF42o21Viyl78+YqdL+UxAvj/EDIyRVnX+Wid2YSR4QK6ePSupol8IUuTtE+VdnFRzqGsMw6MLn0qFiyq8DX7xS8Y8fnZ5Ed+br6R34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bDGojmZb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pTWrJXBh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4csplj3rxkz9v3V;
	Thu, 23 Oct 2025 16:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG9mO41qdraguNJdS/6+Qp6H8j9kWox/Hp446T4ci5o=;
	b=bDGojmZbAN1nkACD7qeCBpRai7STixWjnUxtqLh9lHwtnlUuXkoYxz0t3vCuED50EVne9v
	oSvT5qU3rE91TMaTfFuyxm2A7FBVBubt2gG1xRrwLpGIb/4V0q+20scSzlg+lAR+KlyJQ7
	tMDsJ+2WRAAOnW8fXcuDiRhTksBZ+bkvjGslHkGdp4FCX9NlvWwt9wy3MPH5FmCFo1dS+E
	5vSQh+pRMO2mCVhxPWSr/Gmg07z5N4RgLrkgnOLS1elTnGY3ZQykShBpOTGMgNWUb2vxjf
	/I0e5PJOAVkxK8wESeRh8FfSnFlSa596VanP/5sOk7MuXk+efksasnSms7185Q==
Message-ID: <9164261a-56fa-458b-851c-6c8e59c73a22@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761230831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG9mO41qdraguNJdS/6+Qp6H8j9kWox/Hp446T4ci5o=;
	b=pTWrJXBhpx87q1dsl5+0CHogbjgL2PNRmbH5tW/bX/o0Vnl/LR8kyaHEz3i0OfaPfB7v9n
	Rklejf4FFq6J1Vzm4GY8ImIRkOs8oalzINTRpyPhR4dx3kJe0BpVWthv7AwGk5dZr21VXc
	HwL+cgCWrUTjKzcOIBkh7pGoAHYQg29SSwWOT9Yhpfup9iUFi73eUnSUMZ88Iq4me8lC8i
	ZzFnKjaq+sy/yTkcRKhxwdNMBVkDb0tquZgB8yKIrACQxCk07cXqXMdbBoB01JmuAg/bid
	PVWRUtpvPEBAkcEHjoezX8xjLTsSdAX6X3A7lT4imH4oha0bOtoIipq3siD5Zw==
Date: Thu, 23 Oct 2025 16:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
 <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fr4zt5cqw3fgfmafahmjticiqdqzajek
X-MBO-RS-ID: dc816153aad6230af32

On 10/23/25 4:36 PM, Sudeep Holla wrote:

Hello Sudeep,

>> This is not platform-specific issue. SCMI provider which fails to generate
>> interrupts can appear on any platform, using either transport, that is why I
>> made the property generic.
>>
> 
> Good point, but ideally this is property of the transport itself. For example,
> what does this "arm,poll-transport" can possibly mean for SMC/Optee transport ?

It actually is a property of the transport, except it applies to all 
transports (mailbox, smc, virtio). For Optee transport, this is 
implicitly true, since Optee transport always uses polling in any case, 
so the property has no effect.

> I understand this is a valid request, just not sure if this is the right way
> to solve( i.e. Adding this property in the SCMI node in the proposed form).
> 
> Let me think and give others a chance to express their opinion.

Sure, thank you !

-- 
Best regards,
Marek Vasut

