Return-Path: <linux-renesas-soc+bounces-13752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49206A4797F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 10:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20BF13B285D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 09:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63562227E9B;
	Thu, 27 Feb 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlfZ0Ma6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA8227E8D;
	Thu, 27 Feb 2025 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649394; cv=none; b=WjUjAYcQt4m83E0IGMxcqopVShGri2SaUKGSuXJJNiHhfgGExxora2AeipgkcOB0iQX7kCQdr9/Ydvjj4ZIs35KrwDlemIpZhzy1JOf0oSKs2/SFqdCfvTeJrRx1zLfNRQH32UPoDVw3TneOIkLSA0mAi+1LEQNUnr5Vneae/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649394; c=relaxed/simple;
	bh=rhZFnjMg+djY7ot31T8mlPega5Poldl8bzTau+ol+1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqQDmQsX/hmTkf9F+WDt4WCMH6vjAsayylLSR00aGwOSSFQ04J/7rXI9a6hSO+HjybiyOhc2rNo2cSzet6TTooptDS5OMv0134AlQUBtqIeJKb5dPNmYB4T3A3E/O0Ox/82ZZbDNpI4smqe5bC2/PIVLTudpR1nmTM4XsIRwAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlfZ0Ma6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D6DC4CEDD;
	Thu, 27 Feb 2025 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740649393;
	bh=rhZFnjMg+djY7ot31T8mlPega5Poldl8bzTau+ol+1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nlfZ0Ma6ZgFJhLr04yaoOeKC64EpwKMlj4iJ1DfPLM38VyK5Bj5IFFMgBgdsLrR0P
	 RRndHubCXPuhvZvj2lGCpT4GSI2wp7AYk3eTXucnujSsQNLz0IY32sAMtje+8BKCs1
	 BNGz/9t30wnbSWJ1oFrJCsLs5O+vLREC5qluZASJ5GQk2hujVOfLaf4s6x7zR85d/T
	 s7ECaLEAkgvFebzLQLlX3wQ7/1XOopfkgeQy1y3cdjyG6iaovcFNmN9xXgnIiVvf3s
	 kvjqN+1NMYYxdDsJBs3VGfdQF/JYpHitbsJV2toe0oytPzo86Ix1tGmt8IppwxENtB
	 d403pVt6Jll6Q==
Message-ID: <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org>
Date: Thu, 27 Feb 2025 10:43:08 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/02/2025 10:24, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 26 Feb 2025 at 15:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 26/02/2025 15:32, Thierry Bultel wrote:
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: mercredi 26 février 2025 15:22
>>>> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>; thierry.bultel@linatsea.fr
>>>> Cc: linux-renesas-soc@vger.kernel.org; geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; linux-arm->kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>>>> Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC option
>>>>
>>>> On 26/02/2025 14:09, Thierry Bultel wrote:
>>>>> Selects support for RZ/T2H (aka r9a09g077), and SCI (serial) specific
>>>>> code for it.
>>>>>
>>>>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>>>>> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>>>>> ---
>>>>
>>>> You never responded to my comments at v1. So I asked at v2. Still no answer.
>>>>
>>>> That's v3 and still silence from your side.
>>>
>>> Yes, I understand your position and have added a paragraph
>>> at the end of the cover letter about this point.
>>
>> We do no read cover letters, unless look for dependencies, so if you
>> disagree with someone you ought to respond to the email directly. Not
>> silently discard.
>>
>> You keep adding more and more symbols, so your "out of scope of this
>> patchset" is no true. Otherwise every contributor will use exactly the
>> same arguments - "not my problem".
>>
>> So again NAK because it is something ought to be finally fixed (and is
>> not even tricky to, so I don't ask for impossible).
> 
> Adding RAM to existing systems is usually quite hard ;-)
> 
> Not all Renesas SoCs are used in systems with multi-GiBs of RAM, so
> IMHO it is still valuable to have fine control over which SoCs are
> supported by your kernel (and e.g. which large pin control tables are
> included in your kernel image).


This is fine, I am not against fine-grained SoC-enable options. However
all your SoCs should be enabled by default (default y if ARCH_RENESAS or
any other option which works for you) thus you won't be growing
user-selectable choices.

Strictly speaking this still will be choice, because you need to trim
config, but all people and all distros will just ignore it  and don't
see it in defconfig.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


Best regards,
Krzysztof

