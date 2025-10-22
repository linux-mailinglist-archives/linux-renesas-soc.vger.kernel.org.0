Return-Path: <linux-renesas-soc+bounces-23441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA83BFCE59
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 17:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBFF74F7D65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 15:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AA1320394;
	Wed, 22 Oct 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="t0UnbZzP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172B33DEC8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147005; cv=none; b=pCpwbdw0YPlt8Yzt9/YNg0xh1pRHSsN30p0VqavMQVb2W7qkETe3FbkHqIjF6JQz4zT/fZbzmuE2YXs69sAaEQYU2IdWzwREYHqwlgaqjuHreTxEm6NAgW7nf6ivwbqbGOY6gEU9cHrBQUGql9GDrqYZdJRaoGKfzDi3vBlpZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147005; c=relaxed/simple;
	bh=kXnGNicnkulDXZlTh8st0QBGn5FxMCJQfVsYmb5fDuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbLyWljfjel/D1JO3dMJuk5MyncicUEMB3neZZ7IyFJhk8VnDtoYHjjRVO6MJMTWs8xQKRAvjVE2r0wh0+Ghlghx5xQ7XPIYRpEUvK0iC0rf+2MLfN88K+guB9wsHaA04reF1SEjEea4l2o1U/hUPOGOXgNplfjMH0pQylrhuiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=t0UnbZzP; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csClV3F1Hz9vBy;
	Wed, 22 Oct 2025 17:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761146998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN0bIBVNkP7q3FH7XLaRTCtJfmFmXlaG0Q+0STjPd2s=;
	b=t0UnbZzP+S50fR1h/NFsKvSwuO5AhaR89dGoM+8lUYzLiQ+l0o9Lb4BLE2TPtlWvHkplOn
	QW6jtxXnYepTLvrJRO4s+XiLSCnhlwxm94u1qd212buZlQGZeUGiGYNxtMVXPdIkL10mZu
	5UXCMDZEMijyEsMpn3puiactZeGvctTKDdziJF8+qBOb4Ns2lxmz6VntsKIsX0X31o3xiE
	iS51YoEo9k+g0IPnD/RH/EqanoyCxPf51vl5R9HuHX9ngLaZ3fXNkQJZwQHOatI6xJi2c1
	drvDvl2fM52KZ+2tHt0W3nOWMPpmf7E9380FLRR2fNIBfNMtGdGwEvRssMyp8g==
Message-ID: <24c8da41-37db-4e69-b9aa-e33b2154acb0@mailbox.org>
Date: Wed, 22 Oct 2025 17:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <861pmvvv2g.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ezo84cukef64fk3hiucisabuc3nwd4ef
X-MBO-RS-ID: 094e1b274aad668d7cd

On 10/22/25 5:02 PM, Marc Zyngier wrote:

Hello Marc,

>>> We ensure that the AMU is available in the macro itself by checking
>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>> the offending sysreg access. This is similar to what we do for the
>>> PMU.
>>>
>>> Does your HW advertise an AMU, but doesn't actually have one?
>>
>> The hardware does have AMU, but it is currently blocked in old TFA
>> version and access to this AMU register here causes a fault. That's
>> why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
>> the AMU access is made available on this hardware. But even if I do
>> disable ARM64_HAS_AMU_EXTN=n , I get a fault.
> 
> Well, I would tend to say that you are trying to update the wrong
> piece of SW here. Crashing kernels should be a good incentive for the
> board manufacturer to update their firmware pronto, specially when we
> are talking of code that has been in the tree for over 5 years...

I do agree with this, and the update already exists. The upstream TFA MR 
for this platform also has this fixed.

>> This patch is mainly meant to prevent a surprise in case someone does
>> set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
>> access.
> 
> But that doesn't really fix anything if you have a buggy firmware,
> because you can't tell which CPUs have been correctly configured, and
> which have not.

I also agree.

> I also don't really get why this hack works for you,
> because the feature will be set as soon as one CPU advertises the
> feature.

For this old firmware, during development, ARM64_HAS_AMU_EXTN is 
disabled in kernel config to avoid triggering the AMU faults.

Except right now, I still trigger the AMU faults even with 
ARM64_HAS_AMU_EXTN=n , which I think should not happen ?

> In any case, this sort of terminally broken stuff should be handled as
> an IDreg override, for which we have a whole infrastructure already.
> There are countless examples in the tree already for similar purposes.

I would much rather not support the old firmware for this new platform 
in upstream and pollute the kernel with unnecessary workarounds.

I would much rather be able to disable ARM64_HAS_AMU_EXTN in kernel 
config for the old devices with old firmware, without triggering the 
faults ... and say that everything which is going to be upstream will 
always use new firmware that has proper working AMU support.

-- 
Best regards,
Marek Vasut

