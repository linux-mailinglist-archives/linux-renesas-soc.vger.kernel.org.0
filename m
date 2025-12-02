Return-Path: <linux-renesas-soc+bounces-25498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56856C9C3BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 17:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20305348294
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 16:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C87B29BD81;
	Tue,  2 Dec 2025 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TD/7tCNK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4339C289378;
	Tue,  2 Dec 2025 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693421; cv=none; b=A9ZndY4vaGwrUUwW6Ceb3Pjb/ZSzQja3j5xvF++zkppJNrxsnKWO4lhFoMoNeRMXyWu6+pdqmS/iwqpPBmQr6yEUTW3iqCySgqVUQqW7mBfgOxfImcxae4JPpz9r0OWEKjxKzvb3g8y9XLkSnEYzBpygykuIR1Reb+MN7a8FqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693421; c=relaxed/simple;
	bh=2KDgS7tYAgFLjq0GgUSJJ7WRNioD+CIep2YyfepMI2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3v8Bvip2yXXXj5P9ozQ2nra/TbdaB6lsyeCiGjMcarcc6w5q5SwpOlnn5oD69tSY6rMDZyO8DQBvxP84JRvLpTGrNFXr/jEZTgEFZ7M+Lit+mPvvmfAUGrY2Ky5y1Hhf8kdB2xyNlq/tpwGUdhAkocvyYkApkKNl13QknaYCls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TD/7tCNK; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLRHr3bFbz9tPF;
	Tue,  2 Dec 2025 17:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764693416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouQXuzIraPB2D4kvwgqomW1JSJU+R5g72qD/eXUPvvw=;
	b=TD/7tCNK7xPkEzXu1K6i6i0oJ+JPL0/9upqdLYIRjNpUCk8SgRS2tjNyFrrXxH24BUd5Ml
	TJdUSoMSllooOJK6PRPLDIKfQZ+RpEd/anVN+Si6BRF8leyiV1TjGOJf8a5JJHGiz6qTH6
	Sck77NrE4BvZNZ6PC9Lc0nO19XQmcMO54916VDnVvauCsAyXPKfrbY07dqLfwZ5VZGtlus
	edEmHw51yrLEDVd3bkDxq3GfZUaIDOK3uKIpQgoOxJTc4ED4i7HaX7E+G028VKtzIblbK2
	NRYZuKHUCmjdbMR9p/HYOHSPvZWKBQw4HrO9CSi3cLQ5HxBN8L7YxXQ3gJSeCA==
Message-ID: <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
Date: Tue, 2 Dec 2025 17:36:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto> <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org> <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ef09950386f662b3642
X-MBO-RS-META: xnxgf58ioag4dimis9zusdeen8x8huea

On 12/2/25 3:52 PM, Sudeep Holla wrote:

Hello Sudeep,

>>> While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
>>> Shared memory based transport" , bullet • Completion interrupts, I found it
>>> explicitly states:
>>>
>>> "
>>> This transport supports polling or interrupt driven modes of communication.
>>> In interrupt mode, when the callee completes processing a message, it raises
>>> an interrupt to the caller. Hardware support for completion interrupts is
>>> optional.
>>> "
>>
>> Oh, yes...I knew that...it is just that till now, no systems were really
>> ever developed that lacked the completion IRQ as a whole, it was, till now,
>> more of a case of having the capability NOT to use it selectively at runtime
>> and instead use polling when wanted (like for clock ops in ISR context)
>>
> 
> Indeed.
> 
>> I am not sure what is the reason why this only-polling scenario was never
>> supported in the HW description, this indeed pre-dates my work on SCMI....
>> ...I would/will check with Sudeep, when he's back, what are the reasons for
>> this (if any)...
>>
> 
> As you mentioned earlier, no platform has required this before. I’m fine with
> adding it, but we need to be more explicit about what it implies for SCMI. The
> transport may be shared with other system components, and enforcing polling
> for SCMI while the same transport generates interrupts for another user could
> lead to issues.

How do you imagine this -- a transport shared with other components, one 
which does generate IRQs and one which does not -- would look like ? Can 
you think of an example ?

> Clearly defining these constraints would be helpful. It may also be useful to
> note that this is primarily intended for mailbox transports, if that’s
> accurate. Alternatively, we could keep the DT binding definition broader but
> emit warnings when a transport other than mailbox is used. That approach might
> make it easier to move forward.

DEN0056F refers to this polling mode in Shared memory based transports, 
that can be other than mailbox transports, it includes e.g. SMC or OPTEE 
transports.

I don't think a warning is justified, if the behavior follows the 
specification. But I do agree the behavior is ... suboptimal.

-- 
Best regards,
Marek Vasut

