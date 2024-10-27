Return-Path: <linux-renesas-soc+bounces-10173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A5A9B1F2C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Oct 2024 17:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8FC81F20FA7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Oct 2024 16:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C363E156F45;
	Sun, 27 Oct 2024 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="A7+rWY0F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842032570;
	Sun, 27 Oct 2024 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730045380; cv=none; b=HWlJJFm52TghCM9Jkz2FPO31rX81tE8YZzZqdemusSjLjt9aGrv96lhWG5G59yMrJbRNd6bUDL9gC8npYkyDbNjKYU0M3wL3JF/I5SbByxW3MzfHA2lvI1Aeq7n/5Lcc+PQRJtNB8LZmkl8t5925+x8cHoMHtxDUeCremF3O9EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730045380; c=relaxed/simple;
	bh=LEyLuNN+XiFXA+iDsvrB5V2KKSzH5TWVMiLCfsy/Zy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL9huK1qYEY9o9Wa98h16fbCpyWEY2A1U7YST5zaSRr1q6jTJvxV6V7g7seBMIgyBO4cwCmKMaENEHFf6YvSyhFAMcZRPA0bwEtDJ9njNLzaNjkqStICE8rfvTLf1OJ70Nsa3EhK6qIkG0tqWPsNAsgadp8KSJo6Xw+g/Y1z6+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=A7+rWY0F; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 08BB788E31;
	Sun, 27 Oct 2024 17:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730045370;
	bh=FfXeh/dtS6hx5vj9W/ZqJjqolIp0XQRMc834mkUabYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A7+rWY0FofQwLsk8vVlAl6sYfwiFk7hUww6eQXEnB0RvWpNRUeTU9Ha1FppyVzqAV
	 UtItNU6mgVS2Cun7BxEzXCbNvONDbT0Mfk4kpu2wT6GWspNVyKqJiDeVO7x6VDBhFp
	 707i9t0ceZENkjwfajtCMFWzlTm8vDOsGFdeG0ycOO3chZSRnEo/pAVNlzmd9KMrqY
	 fTteNdnqXrDAqwILAitd7I8moqQN33GJgTboT0LCLcUxcnqq9lKuVVft+V+cZ0c9AP
	 ypFId/Eu8+eBynNTb6NkHcbhgbRqG3dZ0gd42D3NXflHvMsvi2W21L3WJizEGbSlta
	 tm/ukgos68E9w==
Message-ID: <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de>
Date: Sun, 27 Oct 2024 16:21:13 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
 <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
 <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de>
 <20241015144810.GD2838422@ragnatech.se>
 <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de>
 <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
 <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de>
 <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/22/24 9:38 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hello Geert,

>>>> I was hoping Geert would comment on this first, but seems like maybe no.
>>>> I think, since the PHY node does have a compatible string AND the reset
>>>> is connected to the PHY, I would keep the reset property in the PHY
>>>> node. Sorry.
>>>
>>> You are inverting the reasoning ;-) The compatible strings were added
>>> because otherwise the PHY core can not identify the PHY when the
>>> reset is asserted (e.g. after kexec).
>>
>> ... or because the PHY requires some complex sequence to bring it up, it
>> is not just reset.
> 
> That is your hypothetical case, but not the reason behind commit
> 722d55f3a9bd810f ("arm64: dts: renesas: Add compatible properties to
> KSZ9031 Ethernet PHYs").

We can stick to the "reset line in unknown state" here for the sake of 
this argument, it makes no difference.

>>> If possible, I'd rather remove
>>> the compatible strings again, as different PHYs may be mounted on
>>> different PHY revisions, causing a headache for DTB management.
>>
>> Will that ever be the case with this hardware ?
> 
> Dunno. It did happen with the Beacon boards.

Let's cross that bridge when we come to it ?

>>> So, what would you suggest when the PHY nodes would not have compatible
>>> strings?
>> I would suggest keep the PHY compatible strings, because that is the
>> most accurate method to describe the hardware and fulfill the PHY bring
>> up requirements. If the PHY changes on this hardware in some future
> 
> That issue is moot for KSZ9031.

If the PHY won't change, then we can keep the compatible strings ?

>> revision, we can revisit this discussion ? Maybe bootloader-applied DTOs
>> could work then ?
> 
> So, what would you suggest when the PHY nodes would not have compatible
> strings?
I hope I already answered that question before.

[...]

