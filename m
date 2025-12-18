Return-Path: <linux-renesas-soc+bounces-25883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7FCCAE3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 09:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0CE1300B9AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C6D33066A;
	Thu, 18 Dec 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b="LUsKvlne"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailkram.bugwerft.de (mailkram.bugwerft.de [95.216.200.101])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152232E62C0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.200.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046466; cv=none; b=i28AIdwK0Rm30q9GczTn9GA0gi3orERnneNwBvD3sWUuUelQ54tQZxCMWhJkwqVSE49nPD/OCT7AspOv8RlHzEKG9mEwXFeXK5l+Oh1427SRL3xVOac/RP7/4KwMpk0zn5GfmmKyFTSuYDP2jRSwt04HqV3Oa0oMYQZk3iB9AiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046466; c=relaxed/simple;
	bh=n41lyNSoQuYpdPqcvETyvQJamEbAi8/jglp1oEC2UoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDXwOOAhcTMmU7xROm/0QGa1JNXpLJml+4N/ZsnVPORpSTZ/NLUSRDGBsJp44VCB2lTEqY8rX66XWGgNzTmXAcE4Df+yGpjzKQHzDTF6eTLPKMfkcBRbQrCGCMrHXOyJ52r5OOZ0I5DhwTCWKVcbjIz7MyXTPre1JxrNunvYzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; dkim=pass (1024-bit key) header.d=zonque.org header.i=@zonque.org header.b=LUsKvlne; arc=none smtp.client-ip=95.216.200.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zonque.org; s=mail;
	t=1766046096; bh=n41lyNSoQuYpdPqcvETyvQJamEbAi8/jglp1oEC2UoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LUsKvlneD1aEiZdlieFQ2we1bSEAq4rzRKwu1L+ljZIDhSuR3ua7gBOrbVXcNbyms
	 JILQcubDuvtfgJHBBirMMIQHp7QYpu7Alcv1catZTk2u6Lm6TqrMqV0J6dy9ZpJJEH
	 x6QMFcWQOizJXVVZ/GfCCjamnKXWDLvHMWcAuC/8=
Received: from [10.10.3.104] (unknown [62.214.9.170])
	by mailkram.bugwerft.de (Postfix) with ESMTPSA id 81A0B4168D;
	Thu, 18 Dec 2025 08:21:35 +0000 (UTC)
Message-ID: <700e5050-aebe-4ca4-b02d-8ffacccf7045@zonque.org>
Date: Thu, 18 Dec 2025 09:21:29 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
To: Arnd Bergmann <arnd@arndb.de>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
 <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
Content-Language: en-US
From: Daniel <daniel@zonque.org>
In-Reply-To: <35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/17/25 17:04, Arnd Bergmann wrote:
> On Fri, Dec 12, 2025, at 22:58, Robert Jarzmik wrote:
>> "Rob Herring (Arm)" <robh@kernel.org> writes:
>>
>>> These .dtsi files are not included anywhere in the tree and 
>>> can't be tested. They have not been touched since 2018 other than 
>>> clean-ups.
>>>
>> And yet, there are used by people using pxa2xx board with an DT 
>> support (like the mioa701 for which a board file was never merged).
>>
>> If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
>> remove all support for this architecture from the kernel, as
>> these are the building blocks needed to make it work.
>>
>> That might be what should be done, I'll let Arnd and Daniel 
>> comment on the future of PXA in the kernel.
> 
> I agree with Rob that at the very minimum, any dtsi files in the
> kernel should be build-tested along with the rest, so either
> we add some dts files using them soon, or we can remove pxa2xx
> (and maybe pxa3xx) completely.

PXA3xx is in use by the Raumfeld boards, and I would really like to keep
them around.

For PXA2xx I'm torn. I don't have the capacity and hardware to work on
those, but I don't know how many users are out there with out-of-tree
dts files.

> I already plan to remove the remaining board files for both
> sa1100 and pxa soon, as nobody has picked up the task to do
> any further DT conversion after we removed the majority of
> the files back in 2022 and left only the ones that someone
> said they'd be interested in keeping.
>
> Robert, let me know if you or someone else is able to spend
> some time on sending (warning-free) dts files for pxa2xx
> machines soon. If not, I'd plan to remove whatever is there
> along with the board files and drivers.
> 
> I also checked the pxa3xx Raumfeld devicetree support that
> Daniel added in linux-3.7. The manufacturer's firmware
> download page contains kernel images based on this work,
> using a 4.19 kernel but built in 2022. If we remove pxa2xx
> DT support, it would be good to find out if anyone still
> plans to use something newer on that hardware, which may
> happen because of CRA requirements.

As I said, I would like to not close the door on this one if possible.


Thanks,
Daniel


