Return-Path: <linux-renesas-soc+bounces-13767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2BA47F5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2C9163095
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1B2224246;
	Thu, 27 Feb 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dumiIXwz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D12206AC;
	Thu, 27 Feb 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663278; cv=none; b=qlguaSAuORTC3YjmbkO5A9ZMmkBJea3OjbpZVR0DS6rKzQHosvrT/7GcY9wi9u3PPA7LN/8DIE7BBioHu8GHzOxh/6ngIOJq58GyG50OGCGN4aNLljvwfsp50sEZ26FGPKGB4RFAT5u1F7au1FH5PezUA2Z04DLg4TUVXcG8Srk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663278; c=relaxed/simple;
	bh=fRqkrVKLLclncjgROXsCyebTYbELBsd1B1Fx3c2oqRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQ06prZHSJWr8IW9IYQcSI2alCq75Y6/zvoq6xA/N0znodur3uGkHw5oDVNoaUWMyWccJCbOv0QHKkn2VIszCGBXqTBGLzJEqfgy2D2ONgzI5VGFSGDCzuYazXqDUBg+ztSMZDlKl1uOkm1jUyaNsnH28TzuYCbKEBIogtwDlR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dumiIXwz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D34C4CEDD;
	Thu, 27 Feb 2025 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740663278;
	bh=fRqkrVKLLclncjgROXsCyebTYbELBsd1B1Fx3c2oqRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dumiIXwzmhW90HPrg5j9C5KiIX4hnOu8fp/boErhgRjOfON7Ac3jXNf+Ayktxwyx9
	 t/SDjZS+i7/gk0jPXffYmOqNEEoSRNqsAf0ZgcCQtAq3Tmgu88IKUFvzE8MEqlhWIz
	 O04E5Ix2IlXe+FlVcejhXEqQAIrE1FD+0nFvh39ScJC1ZhnL0nJEphn12B+9QzcFYE
	 GAY0z5jdvcotMtYlqGGQSxPOJU4nLXM0QZKhmosM6isbTRhwfVtBZs/n/kbszh7LoW
	 teNPfzS2CL0fF8wB4w3cC0vQgWSyPztLmxBgaYnZGntZK336iU2vAhMGjyQUUGeDmX
	 MkWBRJr8+bZIw==
Message-ID: <6323eb7a-03e9-4678-ac4f-f90052d0aace@kernel.org>
Date: Thu, 27 Feb 2025 14:34:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
 <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
 <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
 <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org>
 <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <c4a44c39-5448-47d5-aeb1-32bab6e57047@kernel.org>
 <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMuHMdXwMoY0mhG6-u0iVg79zYxAvv0Snrt019kDP+TJoXA5FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/02/2025 14:25, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, 27 Feb 2025 at 12:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 27/02/2025 11:48, Thierry Bultel wrote:
>>>> This is fine, I am not against fine-grained SoC-enable options. However
>>>> all your SoCs should be enabled by default (default y if ARCH_RENESAS or
>>>> any other option which works for you) thus you won't be growing user-
>>>> selectable choices.
>>>>
>>>> Strictly speaking this still will be choice, because you need to trim
>>>> config, but all people and all distros will just ignore it  and don't see
>>>> it in defconfig.
>>>>
>>>
>>> I understand.
>>>
>>> All the ARCH_XXX SoC options are already under a menuconfig section, which
>>> is defaulted to 'y' if ARCH_RENESAS.
>>
>> Indeed and it actually cannot have "if ARCH_RENESAS" due to how compile
>> test is enabled there.
> 
> Sorry, I don't get what you mean here...

Probably I got top-level COMPILE_TEST opposite and it actually should be
"if ARCH_RENESAS" as I suggested. Otherwise it would be enabled by
default for compile tests.


> 
>>> So I guess that this simple additional change would make it:
>>>
>>> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
>>> index 91a815e0a522..231880c21aa7 100644
>>> --- a/drivers/soc/renesas/Kconfig
>>> +++ b/drivers/soc/renesas/Kconfig
>>> @@ -358,6 +358,7 @@ config ARCH_R9A09G057
>>>
>>>  config ARCH_R9A09G077
>>>         bool "ARM64 Platform support for RZ/T2H"
>>> +       default y
> 
> Please add "if ARCH_RENESAS" iff we decide to go this route...

Yeah, like I suggested earlier.



Best regards,
Krzysztof

