Return-Path: <linux-renesas-soc+bounces-26228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFDCEC945
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 22:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D206E30049E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 21:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0512D2C032C;
	Wed, 31 Dec 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gDF+lvcl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB331C32FF;
	Wed, 31 Dec 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767216541; cv=none; b=jdhG+jZgzq5heudZYErqrOZHFxZMHA6DAHIAApX2XY1tcvohCYfnCPn8pCSrVzOkFIhmag/3eo+5dMAA8+JUaqreU8KOr1QnZ99AAeht1PMM9MVBi24l6VVxCe4uItHdTxhrHV/iYD61XIfinAbJjOcuVWMq1UmVJ4YtqmbjucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767216541; c=relaxed/simple;
	bh=0tjpd7y4aSzRV3nPNIxpp/6olSPsg7+dBjQMXgHolEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhn6XcUe6bSo3aFdvvKYKA7ra5VvfFZmIUTdDj5Qp0PdRDZnQLnF2plHrEC+WBb2CxtpCY8zk6NAkf71rFrkTUdrr3rg5iII02CirG2OQQs5uqVv12PLwesIFBqfUmTgHhEJgnhgrf9bjN+xIVpR/77dIgeTN+E+sQOesYrhCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gDF+lvcl; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhNPM4zmFz9sn0;
	Wed, 31 Dec 2025 22:28:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XInEE4iUYf/IaVHJewYjjBtnMax2uK/LFqDVXLltU3U=;
	b=gDF+lvcl66LnvvKkk7dGpKCoXz8i0gYhEaV2UzwhSpJndzYPPRHEuacFp3oCjdn/kbN1HS
	mKiIMpmkKQcF6HU2P5DG23x0v8iJHEBtFc1vcKUm7AAzeCbrDEe99lN3RGTjy+kOACVvEt
	KbgqijrNj/NeginE51gk2RAkOOD+GZxb7Jjbz/u22YcnjdHYDjuzEFkA10fr3BKCRdAbTP
	FUUwM0SMIyuFtPBGYQok4lJxsuPKPv4dcK/hrpQ2pTBUa8f6+sx5gmGw+O6fN8J/jnEcBl
	+Y+L4+A3iT9bM6ZJdzODbc/uCvfhWzLdPargRWzWgHpUgGwwMt9wEomuBYpHwQ==
Message-ID: <758bfdb2-dd23-44cb-acfc-c562525e108f@mailbox.org>
Date: Wed, 31 Dec 2025 22:00:52 +0100
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
References: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org> <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
 <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
 <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
 <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>
 <20251205-winged-quizzical-pigeon-ed692d@sudeepholla>
 <06fc0557-6b7c-4092-aeec-e3e16bab2d72@mailbox.org>
 <20251208-quixotic-cocky-emu-9a3916@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251208-quixotic-cocky-emu-9a3916@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 727a93c3853f678877a
X-MBO-RS-META: xg4oymzifyitc19boad6f1b9wm5hiy6s

On 12/8/25 5:30 PM, Sudeep Holla wrote:

Hello Sudeep,

it seems I missed you at LPC, we could have discussed this in there, 
pity ...

>>>>>>> Also IIUC, the irq request happens
>>>>>>> as part of channel startup and there are no explicit APIs for the mbox client
>>>>>>> driver to control that. SCMI is mbox client in this case.
>>>>>>
>>>>>> Sure, but the mailbox driver has to make sure it is correctly demuxing the
>>>>>> IRQs it handles and correctly sends received_data notifications to the right
>>>>>> channel(s) .
>>>>>>
>>>>>
>>>>> Agreed, but the concern is that if SCMI is forced to use polling when the
>>>>> channel is opened, and IRQs are enabled by default with no way for SCMI to
>>>>> disable them in polling mode, we could run into issues.
>>>>
>>>> This constellation seems odd -- if the channel can do IRQs, then this
>>>> property should not be present in DT.
>>>>
>>>
>>> Yes, but there is no way to validate or check this and that is the root
>>> cause for all my worries.
>>
>> Should a configuration like that even be considered valid and relevant ?
>>
> 
> Yes, as I have mentioned, there is no way to validate the same in the kernel.

But the DT has to be a valid hardware description. If your DT is not a 
valid hardware description, bad things can and likely will happen.

I would argue that if you add this poll property into DT, then the DT 
has to describe hardware which does not generate IRQs, otherwise the DT 
is invalid.

The poll property description in this binding document already states 
that this is for hardware which does not generate IRQs.

>>>>> I realise it’s a very
>>>>> specific corner case, but every time I’ve assumed such scenarios wouldn’t
>>>>> occur, we eventually ended up encountering them. So sorry if I am very
>>>>> pedantic, but I prefer to start smaller and restrictive and expand if and
>>>>> when necessary or required only.
>>>>
>>>> I don't think this case, where mailbox channel does IRQs and polling is
>>>> enabled, can/should even be considered valid. Either the channel does not do
>>>> IRQs and then it should do polling, or it does IRQs and then it should use
>>>> IRQs, but not both.
>>>>
>>>
>>> Yes ideally, but having loose ends like this binding which allows someone
>>> to add it to their DT complicates though it is invalid. We have no way to
>>> detect and I don't want to work around such configs in the future.
>>
>> If the DT is invalid, bad things happen, but I would argue that is then a DT
>> bug and the DT should be fixed.
>>
> 
> Well, ideally I would like that, but not always the reality.

If the DT (hardware description) is invalid, Linux can only do so much 
about it. And it is up to the implementer of such a broken DT to fix 
that DT.

If there is a broken hardware with this poll property in DT which 
suddenly does also generate IRQs and those cannot be disabled, then that 
can likely be quirked out and such IRQs can be ignored by some empty IRQ 
handler. But I would also argue that such a quirk should be added only 
once such a broken hardware gets upstreamed (if ever).

>> [...]
>>
>>>>> Yes, that’s essential, because polling in an SMC context is meaningless in my
>>>>> opinion.
>>>>
>>>> Maybe the "a2p" IRQ is also used for notifications from longer running
>>>> operations ?
>>>>
>>>
>>> Yes, it is some sort of work around some platforms implemented as by design
>>> when the SMC returns, the synchronous commands must complete and it is had
>>> to support async SCMI commands without platform specific interrupt(p2a). This
>>> a2p is sort of completion interrupt for synchronous command. I assume the
>>> platform may offload the task from secure f/w to something else otherwise
>>> secure side needs to be given CPU cycles to complete which complicates this.
>>> In short SMC is synchronous and if the execution returns from it in NS world,
>>> the command is complete.
>>
>> Wouldn't polling still be useful for the async case , even in SMC setup?
>> Note that the SMC setup does use shmem, and therefore can do polling on the
>> shmem.
>>
> 
> No, it makes no sense for SMC as I have already mentioned few times.

I can drop the SMC part from the 2/2 , but it feels like we're dropping 
a poll coverage for the async part.

>>>> [...]
>>>>
>>>>>>> Yes it can be minimalistic but not restrictive. As I already clearly mentioned
>>>>>>> I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
>>>>>>> just mailbox to start with and extend to other transports if and when needed.
>>>>>>> It would be good to impose that restriction in the binding as well but that
>>>>>>> is not a must IMO. I am fine if the bindings for whatever reasons(though I
>>>>>>> don't see the need) to apply for any transport.
>>>>>> So I should simply drop the smc.c changes , keep the rest, and send V2 ?
>>>>>
>>>>> Not just that. Unless DT maintainers oppose, I just want to keep this
>>>>> new property valid only for mailbox transport(i.e. "arm,scmi" compatible
>>>>> not otherwise) so that we can catch any other use in binding checks and
>>>>> interested parties must discuss on the list and expand that if they require.
>>>>>
>>>>> Also we can explore if we can parse and scan this in mailbox transport for
>>>>> now.
>>>> I feel that this only adds more implementation complexity and makes the
>>>> solution less generic, while it does win us very little in the end ? The
>>>> generic solution implementation is actually easier to implement.
>>>
>>> Yes I want it less generic to start with. Why you want to start making
>>> this workaround on your platform a generic implementation just because
>>> the specification has provision for it ?
>>
>> Because this is generic kernel code, it seems counterintuitive to introduce
>> less generic solution which requires more complex implementation.
>>
> 
> I would argue. Lot of code gets added as specific and gets generalised
> eventually if there are more users and in different configurations.
> 
>> Since the DEN0056 specification states this mode of operation is supported,
>> I also wouldn't call it a workaround.
> 
> Sure, I take back if I called it workaround. But why would we want to make
> it generic when we can test only mailbox based platform with it. I don't see
> how it can be useful with SMC/Optee.

For SMC, I have no use case, but it seems like the async interrupt could 
benefit from polling if ever needed.

> I am not sure if it is useful with
> virtio and if there is a way to test this. All I am saying is I don't want to
> enable something and advertise it as generic when we have no platform or way
> to test it and keep it functionally correct.
All right, let me send a slightly reduced V2 to move this along.

