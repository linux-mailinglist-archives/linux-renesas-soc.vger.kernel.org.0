Return-Path: <linux-renesas-soc+bounces-10223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F659B699A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 17:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C65C91C20B78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 16:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7FA2144A4;
	Wed, 30 Oct 2024 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hMRAxvtk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35812C8EB;
	Wed, 30 Oct 2024 16:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307146; cv=none; b=blN9jsDU0Zllkjh7DdoWbHkwWyEVyTD8SX9VOornuTnAEXa4OplASLRt5Z6cdC6kMCWLvbXFxIWJxNPEaJoG3vSlVT0hlsIqBZYbJlmxdA7Cex+9yKSZSUkkoX80DtdVPJHBvbLT+gcueGdw+H++E+HzqQaovKcDXjSVED6CUO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307146; c=relaxed/simple;
	bh=lTE5B4Q0DvJ0K8kws/zE6MD1HtyarAGLFRHInpfDi0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cywtva+VDebu7WkWCspmB6kT3o9vK3Epppy0sc3oEhjqmz6fFvC6oIgvXKknSQ4ZTiO5U5hQDgBnfMGul5m0ltujmbg3hWO0q3NDGgIy1ZE/EVSBJtrQQNGQLCiqjbQ9jRD8EmmOBsT7N/MCE2uSm5wb++ucqS+XsXGjdf2fEoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hMRAxvtk; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 08FAC88C05;
	Wed, 30 Oct 2024 17:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730307142;
	bh=x+Yr7pJg5mP2ZbYGiOeNesNXBUpmKdLZpizfZOIamOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hMRAxvtkj6ba2o6ARABi+wku7kxQGehhXOvqdvBrm9ytYcDzT/YiWaVsN6rj/PRBQ
	 z3aWHRCdEJog8CX7cdF75P4X0lF3cvjB9iBCUmJcRqupZLr3SVSQrsBnWkxD7lLNzB
	 OMq+kZI7/JGqtQCwD5rmUAgZHGVSclZxC4iX5Xalg2YA/F3EHYOBxOk0/IK4NfeFy7
	 YQCQa9Cc+8kNL9+2k3AlmIYb3zc5YSD546q5PjCDn6BhOlJ3ovh9nrSjVg05JrgjmB
	 z2xPZ9Tqv+iL0bwn0rkcdXuqzISSw96cWh6nRSe4ornup1AIzEIBk4rt5k5ZQLxRMy
	 ThbEi33vgkLuQ==
Message-ID: <021aee32-795a-42c8-80e7-89cb8a45f935@denx.de>
Date: Wed, 30 Oct 2024 15:45:30 +0100
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
 <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de>
 <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
 <4d7d6a7d-cbe8-4cbf-9fb1-2cdec0f11ce2@denx.de>
 <CAMuHMdVnJPMLx=39=f+7S4vdRAC-0q0hKS6Ww=ELYEaLBx+gZw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdVnJPMLx=39=f+7S4vdRAC-0q0hKS6Ww=ELYEaLBx+gZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/24 9:26 AM, Geert Uytterhoeven wrote:

[...]

>>>>>> revision, we can revisit this discussion ? Maybe bootloader-applied DTOs
>>>>>> could work then ?
>>>>>
>>>>> So, what would you suggest when the PHY nodes would not have compatible
>>>>> strings?
>>>> I hope I already answered that question before.
>>>
>>> Sorry, I may have missed that?
>>>
>>> I really prefer not having the PHY compatible strings, as DT should
>>> describe only what cannot be auto-detected.
>> See paragraph above (*). My take on this is the exact opposite, better
>> describe the PHY in DT fully, including compatible strings, so that if
>> the PHY driver needs to do some sort of bring up tweak/fix/errata
>> workaround/... , it can do so by matching on the compatible string
>> without trying to bring the PHY up in some generic and potentially
>> problematic way.
>>
>> The MDIO bus is not discoverable the same way as PCIe or USB is, so I
>> don't think the "DT should describe only what cannot be detected" is
>> really applicable to MDIO bus the same way it applies to PCIe or USB.
> 
> So you think this is similar to SPI NOR, where most FLASHes can be
> discovered with the JEDEC READ ID opcode?

Possibly, if you take broken-flash-reset DT property into account 
somehow. Even SPI NOR does require a proper reset after all, else the 
READ ID opcode may not work.

> See commit 4b0cb4e7ab2f777c
> ("dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles"),
> which clarified why no new compatible values are accepted.
This works as long as your SPI NOR reset works.

