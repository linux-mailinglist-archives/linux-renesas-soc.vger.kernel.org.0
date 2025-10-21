Return-Path: <linux-renesas-soc+bounces-23390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA7BF7952
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 18:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 818964060DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F35341AC1;
	Tue, 21 Oct 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aI5oFskQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAD3451B7;
	Tue, 21 Oct 2025 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062832; cv=none; b=Tp2s0hHks0t5zMhFZGvp64qN3DJAGL+vHP5AZcFHMXb+868YlzATc0f9HpkqAFKIuPkRYxRqdpRpu5uX5WyiH3Btn0ZSseManLON/zuk6+h37uULO6deU/gcbPwhoFXdZcWDIDVWMW09PRE2XSjJ8ENiLulHzkbTiXQ8RiUbxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062832; c=relaxed/simple;
	bh=Z8Z45Yh74qlqoROn/D5Z7pkE63DX4wDr9y145M3BGmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZ2PFrmsqzC/QYUOp3SNZu/O1OySYoUUdmc5txvw8AYmIVjHfDCo97Md0gBb03r8xwSt72jRPDdpw9KD03ttdTR9XApViLeZKU1bye3N+Sm9JiAU00GEHvod2y9nGYxQgymBgsxXpZLuTVHEdTD0HOXslptN4pcF9RSq64EO3lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aI5oFskQ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4crccq0klBz9svN;
	Tue, 21 Oct 2025 18:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761062827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58QwQ0d6ddlVQwt1yt7loHo/bKQZqW/rus6AD7Mcw1E=;
	b=aI5oFskQEXHIokraiqSrvW7Ekjoagz5LsJQY6WsooS2ZwIykHaSu11XjktEApNQt0e9RPk
	3YWU+2RiEnmUaKTCgrSvlzFK6k/gvvPZHZSndJg++AkjdNX1YwAXapufyWyiEw7+niger0
	hc90/ZnMqlirxLuSgwE9Phga/2iNNgLD6rp0ZBU11mKZIuOx7gTNdQZAaJu9q03o1Rs+61
	tFctkbfq4ilfUcPZMDTZUXBbzaod89pb6h4GHNf4XCdUubnLOrEmS0t6mLlZ4kQaxn62K/
	NfbMjBr4dfXaYzXqxVvhKAVYRf88V2Ec13YQ2iDf1hfY3c6LYtmU3dJOGHJcXg==
Message-ID: <0e81437f-a13f-4605-b7f7-6e6640411f30@mailbox.org>
Date: Tue, 21 Oct 2025 18:07:04 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
 <aPaSF2lokJ748cTx@shikoro>
 <CAMuHMdXv_R6POTQe=MEcEOraKhjhzwrW5skkWnzgvijF2qAykw@mail.gmail.com>
 <fba13116-2495-49a3-a1b5-2eecb33bb448@mailbox.org>
 <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUP_bH5WW3=3J1H=6SocKzQXPdP7PFfYDrgaj4EhYTaYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a0008dc800233e8b927
X-MBO-RS-META: iaems8tq65apnwufqpu5oy6gkh6kz5jw

On 10/21/25 3:22 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Tue, 21 Oct 2025 at 15:14, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 10/21/25 9:09 AM, Geert Uytterhoeven wrote:
>>> On Mon, 20 Oct 2025 at 21:48, Wolfram Sang
>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>> Or better: drop all these swdt = reserved commits?
>>>>
>>>> Maybe. Since Marek is maybe interested in fixing FW...
>>>>
>>>>> TBH, I always had my doubts about making them reserved in the upstream
>>>>> DTS, and there does not seem to be much gain in doing so...
>>>>
>>>> No strong opinion here. With "reserved" I think I followed your
>>>> suggestion but I personally don't mind.
>>>
>>> Well, the proper mechanism would be that firmware using SWDT would
>>> override the status to reserved, preventing the user from using it if
>>> it was enabled in the DTB passed by the user.  But (a) the current
>>> firmware doesn't do that, and (b) we currently do not have a use-case
>>> for enabling SWDT in the DTB.
>>
>> Upstream TFA does enable SWDT for R-Car Gen3, but not for Gen4.
> 
> Oh, so this is a "generic" R-Car Gen4 issue?
> Does that mean we can use SWDT in Linux on R-Car Gen4 with TF-A,
> or does TF-A still block access to it?

I think this can be tested on Sparrow Hawk easily , with and without 
TFA. Wolfram, how do I test the SWDT ?

>> I can pass SWDT node from upstream TFA to next stage on Gen3 if you
>> would like that ?
> 
> I guess that would be a good thing to do.  But I am afraid it is a bit
> late in the product life cycle.  Ideally, everything that is used by
> firmware should be marked reserved...

It seems SWDT is not used by upstream TFA, but maybe it is used by 
downstream one (or downstream loader). I can enable SWDT in either TFA 
or U-Boot if that would be preferable, or leave it available for Linux.

-- 
Best regards,
Marek Vasut

