Return-Path: <linux-renesas-soc+bounces-23142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4DBE2EF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB421A64226
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2A320A31;
	Thu, 16 Oct 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJ4d9pGF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEED2DECBC;
	Thu, 16 Oct 2025 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611831; cv=none; b=B4c8HZvumZyDdriSN1//+wLMGQEOAh0hIFO89bUF9UYvvf5JhI3Bj4Ecpx8YmHkmGm84vFSpNHzLmftuDyEpwwtzE3mNc64mzsalEI7ot/sBHIwD7QGheFvi+eofsMl4lt0jquYUoEbbTpF5ne++FNzzawKI3ys67NG6OhcjAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611831; c=relaxed/simple;
	bh=nhtP8gYnLz+wyGXt2SQWyjUOTbE5Cjckx8uj8HL0Bvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCwNwTBMbObydoifWQwPqO1hACXC9im7qJ5++uwZF+6K0FsygOUHumYrgpdWQ3PwufKoJ2Oy52zQF9eEunnLF/guaiUhMbmbGM/0uQX2OzNubY8U0IFjmiv19732WIpBfLiNCjvPSBRPCvkPyxo5u1zQ9DaAOra2P7m7HjonxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJ4d9pGF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DA0422E;
	Thu, 16 Oct 2025 12:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760611726;
	bh=nhtP8gYnLz+wyGXt2SQWyjUOTbE5Cjckx8uj8HL0Bvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJ4d9pGFjUx/+hjmQet4+zEgzUwOA3dwp9SAn5+N4CdghyFygPfjGg6vEZ0eQ5LY6
	 zyruN2BCWoHTGfJ3Huywn8MMXdQo60m+0D2IZUcx3ub5kX6enDq6DdbMqRpEpmZTU2
	 S2MIN5hoGNmnSlU8hRL1bzpGRBZm8WqSIoQPbsO0=
Message-ID: <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com>
Date: Thu, 16 Oct 2025 11:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
 <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com>
 <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert

On 16/10/2025 11:40, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Thu, 16 Oct 2025 at 12:23, Dan Scally <dan.scally@ideasonboard.com> wrote:
>> On 15/10/2025 13:32, Geert Uytterhoeven wrote:
>>> On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
>>>> Enable the eth0 node and define its phy.
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>
>>>> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
>>>> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
>>>> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>>>>           };
>>>>    };
>>>>
>>>> +&eth0 {
>>>> +       pinctrl-0 = <&eth0_pins>;
>>>> +       pinctrl-names = "default";
>>>> +       phy-handle = <&phy3>;
>>>> +       phy-mode = "rgmii-id";
>>>> +       status = "okay";
>>>> +};
>>>> +
>>>> +&mdio0 {
>>>> +       phy3: ethernet-phy@3 {
>>>> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
>>>
>>> The first compatible value corresponds to a Micrel KSZ9031 Ethernet
>>> PHY, but according to the block diagram and the picture in the Kakip
>>> H/W Quick Reference, the board has a Microchip LAN8830 instead?
>>
>> Ah, my bad...I thought it was the same as the EVK so I copied from there. I think then that this
>> should be "ethernet-phy-id0022.1652" (based on reading PHY registers 2 and 3 with phytool) and the
>> other properties look to be KSZ9031 specific so I'll drop them and re-send
> 
> Hmm, include/linux/micrel_phy.h has:
> 
>      #define PHY_ID_LAN8841          0x00221650
> 
> drivers/net/phy/microchip.c has:
> 
>      .phy_id         = 0x0007c132,
>      [...]
>      .name           = "Microchip LAN88xx",
> 
> I haven't found the ID in the LAN8830 datasheet yet, it seems to be
> buried deep...

Indeed, I couldn't find it anywhere either so resorted to phytool.

> 
> Which PHY is actually mounted on the board you have?
> Can you inspect it visually?

It says LAN8830, plus a couple of other strings.

Thanks
Dan

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


