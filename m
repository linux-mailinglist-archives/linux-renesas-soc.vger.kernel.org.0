Return-Path: <linux-renesas-soc+bounces-9957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C19A95FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 04:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7F21F22546
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 02:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16929139580;
	Tue, 22 Oct 2024 02:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TWPevTxV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452491386C9;
	Tue, 22 Oct 2024 02:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562851; cv=none; b=AJ0AK8wiVod9KsnDltSffXUrsbOQv0V4C3LcAYzbirZ2JKTebfvNLo1loMmNCGITiWiIvnjrTviu5vJRQB0zCQggJOY+fZzpUrk2tHQu0BbanPpsCJMNuvnESUuyxIny4aqUwgimet+/8A8oajDbBtUWcB5/zvDeMV/AgAOdPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562851; c=relaxed/simple;
	bh=kNmfwuWCwSI1Lnv9MoOIz4EIQ1MQSka28xLaVCbb+7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1ydwtZXHTJT7JJ6wHWY7TfarcGqsL6+0cXZw5pt5aAGUVCCG+moO2VqZNMWCsJtG2BiK84cV/BEYIfOQUO/f+/F13LF9UpQ3v6RXULqpenUudJjiKUU+JJV8eSDBZLiQEEn15P1evx14xB0oSh8kCnPZc6gN6vtlpfIjjLn/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TWPevTxV; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8356788F28;
	Tue, 22 Oct 2024 04:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729562847;
	bh=+0tl7Q7H4ndrPdzB3wPYNaGB1T/hwqmxhyO0X7DUPvo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWPevTxVzukyaieWel9VPjRSDfEzcPyFFhP3uam2pAk8fbx7YUrIyqqR+hWCdBUki
	 8Q07NXVUJR2AIVF7DbnE3uixUgaHQbUw6lQAKhnbl1UQAS/U7sOBY/dcxZlkQHu/0W
	 /m+TzMKX9vxdgr7lAvGDUPTXTiHTiFF1APMsKpxci+ZDlfiqDl+NSMocjsGqSv7nd8
	 I1t2UKDNE84LUbqcpZ68fkM+9FUZXkEU6D1TXJS2s292xIbTE+OFLaBXGDA0MQiv1+
	 8U0AHUvXHcWH0Ca2/Nl4flQ4/4zpPpPcDDetNPUpmd7aqBnE3KcsGhD+TCRjiAj63C
	 2JA7xLYybJpsA==
Message-ID: <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de>
Date: Mon, 21 Oct 2024 23:31:50 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/21/24 9:13 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Mon, Oct 21, 2024 at 2:13 AM Marek Vasut <marex@denx.de> wrote:
>> On 10/15/24 4:48 PM, Niklas Söderlund wrote:
>>>>> However, the reset signal may be in asserted state when the PHY is
>>>>> probed (e.g. after unbind from the Ethernet driver, or during kexec).
>>>>> Identifying the PHY by reading the ID register requires deasserting
>>>>> the reset first.
>>>> That may not be the entire precondition. For example the SMSC LAN87xx PHYs
>>>> also require PHY clock to be enabled before the reset is toggled, but such
>>>> information is available only to the specific PHY driver.
>>>>
>>>> The MDIO-level reset GPIO handling, as far as I understand it, applies in
>>>> case there are more PHYs on the MDIO bus which share the same reset GPIO
>>>> line.
>>>>
>>>> In this case there is only one PHY on the MDIO bus, so the only bit which
>>>> applies is the potential PHY-specific reset requirement handling. If the PHY
>>>> driver ever gets extended with such a thing in the future, then having the
>>>> reset-gpios in the PHY node is beneficial over having it in MDIO node.
>>>>
>>>> It will always be a compromise between the above and best-effort PHY
>>>> auto-detection though.
>>>
>>> I agree this is not needed if the PHY is identified by the compatible
>>> string, but might be if it is not. In this case it works and the reason
>>> for this patch was just to align the style used here.
>>>
>>> I'm happy to drop this patch, or send a rebased version that applies
>>> since the context changed ;-) Marek, Geert what is your view? I'm happy
>>> with either option.
>>
>> I was hoping Geert would comment on this first, but seems like maybe no.
>> I think, since the PHY node does have a compatible string AND the reset
>> is connected to the PHY, I would keep the reset property in the PHY
>> node. Sorry.
> 
> You are inverting the reasoning ;-) The compatible strings were added
> because otherwise the PHY core can not identify the PHY when the
> reset is asserted (e.g. after kexec).

... or because the PHY requires some complex sequence to bring it up, it 
is not just reset.

> If possible, I'd rather remove
> the compatible strings again, as different PHYs may be mounted on
> different PHY revisions, causing a headache for DTB management.

Will that ever be the case with this hardware ?

> So, what would you suggest when the PHY nodes would not have compatible
> strings?
I would suggest keep the PHY compatible strings, because that is the 
most accurate method to describe the hardware and fulfill the PHY bring 
up requirements. If the PHY changes on this hardware in some future 
revision, we can revisit this discussion ? Maybe bootloader-applied DTOs 
could work then ?

