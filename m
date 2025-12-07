Return-Path: <linux-renesas-soc+bounces-25630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC3CAB31A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 10:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3409B304C5C6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E952EC094;
	Sun,  7 Dec 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MMLNuu8L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF97A2E62C4;
	Sun,  7 Dec 2025 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765099356; cv=none; b=WHBLHIrDapE229DHxS4rZfpxuFVqMZoOGh0SxgfUpo/7LdrW8JnV+ACV7x/i6BD/6vB4TOmuqCoIknWqW+776DT1wsZ2iz4Dh7k4eoePUdb5tCU74dutwNCVGh694bZDOvLF6BDccKtCdlQVgbvO2JliWt0NQ5+QUo8lSClEmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765099356; c=relaxed/simple;
	bh=MxiJQYTjIgbG0iYddWjMMCEaWbAqLdWQR3bV3ghU50U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVXp1CrYQYnH6r4gUFLd5YlG27fbPy8KyiFZrzm4r5Vpe0xanofIWt3XG7Q7tXmBqZbz2/QHtV28lrtvtV3wgAAjqhDU1wS5VhOxftjaX08Kq0fyjgRcv7dSNXAqKeIMY9bZO1b42kBG9QbIczCASKProrGswc+t/euBTshIZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MMLNuu8L; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dPKQ92X7Rz9shs;
	Sun,  7 Dec 2025 10:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1765099345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kc45u/PDfej0xIwt4rw4xQz4SHHoHsBqpxhcRb94zqE=;
	b=MMLNuu8Lk5Tv9OLVpZ16VNPP7nHspLW+/67gHz3VYmRLk6l9+iZlNkBsh7oAGq6C2PnShJ
	PJTDYPYVTjRbE8991L11HyA2hb/2YAt00iUSySH227WghAz18mRfZUKVYNQZMicalXi+ig
	W5AJLMgMTa/gpMyjDyaCNcxViINGJk4qsB69/b7Wff9jT5u4WBUxlJo+rHfYqbQiews0DH
	TjG+2m91uQdRhug4AuloJTvuh78me0BKw6E42RjMurtQ8v3aQ0QRuFoG2/QMQ14Ogwqs6A
	4ClVeWEwSapTIbqfWrf/qaIHEAen0J9VGnn2+Bbr8XKsavjdMQW7/8dfWBt6Qg==
Message-ID: <06fc0557-6b7c-4092-aeec-e3e16bab2d72@mailbox.org>
Date: Sun, 7 Dec 2025 10:16:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto> <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org> <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
 <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
 <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
 <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>
 <20251205-winged-quizzical-pigeon-ed692d@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251205-winged-quizzical-pigeon-ed692d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 14481eff2fad3e208d7
X-MBO-RS-META: 5eezd4rfgip53r7u7w31f16sqj41jq1e

On 12/5/25 10:54 AM, Sudeep Holla wrote:

Hello Sudeep,

>>>>> Also IIUC, the irq request happens
>>>>> as part of channel startup and there are no explicit APIs for the mbox client
>>>>> driver to control that. SCMI is mbox client in this case.
>>>>
>>>> Sure, but the mailbox driver has to make sure it is correctly demuxing the
>>>> IRQs it handles and correctly sends received_data notifications to the right
>>>> channel(s) .
>>>>
>>>
>>> Agreed, but the concern is that if SCMI is forced to use polling when the
>>> channel is opened, and IRQs are enabled by default with no way for SCMI to
>>> disable them in polling mode, we could run into issues.
>>
>> This constellation seems odd -- if the channel can do IRQs, then this
>> property should not be present in DT.
>>
> 
> Yes, but there is no way to validate or check this and that is the root
> cause for all my worries.

Should a configuration like that even be considered valid and relevant ?

>>> I realise it’s a very
>>> specific corner case, but every time I’ve assumed such scenarios wouldn’t
>>> occur, we eventually ended up encountering them. So sorry if I am very
>>> pedantic, but I prefer to start smaller and restrictive and expand if and
>>> when necessary or required only.
>>
>> I don't think this case, where mailbox channel does IRQs and polling is
>> enabled, can/should even be considered valid. Either the channel does not do
>> IRQs and then it should do polling, or it does IRQs and then it should use
>> IRQs, but not both.
>>
> 
> Yes ideally, but having loose ends like this binding which allows someone
> to add it to their DT complicates though it is invalid. We have no way to
> detect and I don't want to work around such configs in the future.

If the DT is invalid, bad things happen, but I would argue that is then 
a DT bug and the DT should be fixed.

[...]

>>> Yes, that’s essential, because polling in an SMC context is meaningless in my
>>> opinion.
>>
>> Maybe the "a2p" IRQ is also used for notifications from longer running
>> operations ?
>>
> 
> Yes, it is some sort of work around some platforms implemented as by design
> when the SMC returns, the synchronous commands must complete and it is had
> to support async SCMI commands without platform specific interrupt(p2a). This
> a2p is sort of completion interrupt for synchronous command. I assume the
> platform may offload the task from secure f/w to something else otherwise
> secure side needs to be given CPU cycles to complete which complicates this.
> In short SMC is synchronous and if the execution returns from it in NS world,
> the command is complete.

Wouldn't polling still be useful for the async case , even in SMC setup?
Note that the SMC setup does use shmem, and therefore can do polling on 
the shmem.

>> [...]
>>
>>>>> Yes it can be minimalistic but not restrictive. As I already clearly mentioned
>>>>> I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
>>>>> just mailbox to start with and extend to other transports if and when needed.
>>>>> It would be good to impose that restriction in the binding as well but that
>>>>> is not a must IMO. I am fine if the bindings for whatever reasons(though I
>>>>> don't see the need) to apply for any transport.
>>>> So I should simply drop the smc.c changes , keep the rest, and send V2 ?
>>>
>>> Not just that. Unless DT maintainers oppose, I just want to keep this
>>> new property valid only for mailbox transport(i.e. "arm,scmi" compatible
>>> not otherwise) so that we can catch any other use in binding checks and
>>> interested parties must discuss on the list and expand that if they require.
>>>
>>> Also we can explore if we can parse and scan this in mailbox transport for
>>> now.
>> I feel that this only adds more implementation complexity and makes the
>> solution less generic, while it does win us very little in the end ? The
>> generic solution implementation is actually easier to implement.
> 
> Yes I want it less generic to start with. Why you want to start making
> this workaround on your platform a generic implementation just because
> the specification has provision for it ?

Because this is generic kernel code, it seems counterintuitive to 
introduce less generic solution which requires more complex implementation.

Since the DEN0056 specification states this mode of operation is 
supported, I also wouldn't call it a workaround.

