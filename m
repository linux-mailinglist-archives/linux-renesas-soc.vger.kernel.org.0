Return-Path: <linux-renesas-soc+bounces-7189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD7F92AEAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 05:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6C341F22B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 03:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F26B4C62E;
	Tue,  9 Jul 2024 03:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="FH/FGGyI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD66381BE;
	Tue,  9 Jul 2024 03:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720495560; cv=none; b=EUOHKR7MDL3ZjlKtF3uYSdjbf4i3/pUmxTl7gpaht+hRDMmFjcTpUTN0C4yECjIV1yDBH+4n8qqSpEV+M+CO4fbx7V2/P1HN0wFVt+UHFTkARCOjs11R3vDFwS2fA9+6UZhEOMltp5qT6n/2KUOBkCkmFS3spDSdp9acYxWnQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720495560; c=relaxed/simple;
	bh=JdyrFdKCTWfjfglxMsl284uEQUuorRRxU7dGT2VnDLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjP9ErtNHLWsQRCIlXyptrRwgMcm3sg1ZX6Nebmx72ZBG1g/4Mur9yfK4BI2TnE1TczUVuu4qOxAAcjQEFztn0hyBj1pmpqOWditFqhr29tLs5BKFShFFpw+Njd1fHOufdqFg2kyaVTR1SwZBsypE09PkQwM1l/aX3QYcvNX6OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=FH/FGGyI; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D95D78823C;
	Tue,  9 Jul 2024 05:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720495549;
	bh=7G9fZhat1FxnGu4Py9sTTi3wZI6B4RK2QEzU8MXEIjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FH/FGGyIm+4/ziML0+ny6b6fP5ThOi4l5MEydBv1bO6XSZGqKxrrvGa/kKbHzv93v
	 OxuN1/wYJAXwze5Tl2FDn34Z1uteWh2rYIOqjbx26UCeKFbY6Mtx+tPinfcdInTDed
	 HytzP6xGeJUNI1rNmqbwGR4A2swfQV/NZhK5MvSexzcH1aHXVtcv0BbdHm7ddyeceN
	 5i0yC+FEUSCwONO1YoGALcjuLx+at7iyLowAwfFAt/i5SVTkfErj7OSsdSGTNddK/+
	 QsvF+bz4FQKp/DoFn5qGp1uhCuCLij2pv9omO3GCTPR2NQtIrQWBQtu52pABKUhzRQ
	 fQdGIb++ADodQ==
Message-ID: <9f705a40-0b5b-4313-b50f-627dffb9fe3b@denx.de>
Date: Tue, 9 Jul 2024 05:22:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 kernel@dh-electronics.com, kernel test robot <lkp@intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
 <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <b9c2abc3-cc01-4ac7-9e42-c9ce1db64eba@denx.de>
 <CAMuHMdUtAU0uyXYK_FzHW2vMBwG6WEGNXgJALceCVvvr4DCVbw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdUtAU0uyXYK_FzHW2vMBwG6WEGNXgJALceCVvvr4DCVbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/8/24 9:09 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Fri, Jul 5, 2024 at 11:50 PM Marek Vasut <marex@denx.de> wrote:
>> On 7/3/24 10:24 AM, Geert Uytterhoeven wrote:
>>>>> What about moving the PHYs inside an mdio subnode, and removing the
>>>>> compatible properties instead? That would protect against different
>>>>> board revisions using different PHYs or PHY revisions.
>>>>>
>>>>> According to Niklas[1], using an mdio subnode cancels the original
>>>>> reason (failure to identify the PHY in reset state after unbind/rebind
>>>>> or kexec) for adding the compatible values[2].
>>>>
>>>> My understanding is that the compatible string is necessary if the PHY
>>>> needs clock/reset sequencing of any kind. Without the compatible string,
>>>> it is not possible to select the correct PHY driver which would handle
>>>> that sequencing according to the PHY requirements. This board here does
>>>> use reset-gpio property in the PHY node (it is not visible in this diff
>>>> context), so I believe a compatible string should be present here.
>>>
>>> With the introduction of an mdio subnode, the reset-gpios would move
>>> from the PHY node to the mio subnode, cfr. commit b4944dc7b7935a02
>>> ("arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2")
>>> in linux-next.
>>
>> That's a different use case, that commit uses generic
>> "ethernet-phy-ieee802.3-c45" compatible string and the PHY type is
>> determined by reading out the PHY ID registers after the reset is released.
>>
>> This here uses specific compatible string, so the kernel can determine
>> the PHY ID from the DT before the reset is released .
> 
> I am suggesting removing the specific compatible string here, too,
> introducing an mdio subnode, so the kernel can read it from the PHY
> ID registers after the reset is released?

I wrote this to Niklas already, so let me expand on it:

My understanding of reset GPIO in the MDIO node is that it is used in 
case there might be multiple PHYs with shared reset GPIO on the same 
MDIO bus. Like on the NXP iMX28 .

In this case, the reset is connected to this single PHY, so the reset 
line connection is a property of the PHY and should be described in the 
PHY node.

You could argue that in this case, because there is only one PHY and 
only one reset line, it fits both categories, PHY reset and MDIO reset.

And then, there is the future-proofing aspect.

If the compatible string is retained, then if in the future there is 
some problem discovered related to the reset of this PHY, the PHY driver 
can match on the compatible string and apply a fix up. But it prevents 
future PHY replacement (which is unlikely in my opinion).

If the compatible string is removed and the reset is moved to MDIO node, 
then replacement of the PHY in the future is likely possible (assuming 
it does not have any special reset timing requirements), but if there is 
a problem related to the reset of the current PHY model, the PHY driver 
cannot fix it up because there is no compatible to match on.

I think that about sums the pros and cons up, right ?

I also think there is no good solution here, only two bad ones, with 
different issues each.

>>>> What would happen if this board got a revision with another PHY with
>>>> different PHY reset sequencing requirements ? The MDIO node level reset
>>>> handling might no longer be viable.
>>>
>>> True. However, please consider these two cases, both assuming
>>> reset-gpios is in the MDIO node:
>>>
>>>     1. The PHY node has a compatible value, and a different PHY is
>>>        mounted: the new PHY will not work, as the wrong PHY driver
>>>        is used.
>>
>> What is the likelihood of such PHY exchange happening with these three
>> specific boards ? I think close to none, as that would require a board
>> redesign to swap in a different PHY.
> 
> I don't know about the likelihood for these boards.
> It did happen before on other boards, e.g. commit a0d23b8645b2d577
> ("arm64: dts: renesas: beacon-renesom: Update Ethernet PHY ID").

I had that happen too. The solution there was to upstream the newer PHY 
ID and apply backward compatibility DTO that rewrote the PHY ID for the 
few older boards. The DTO application decision was done in U-Boot scripting.

It was not possible to auto-detect the PHY after deasserting its reset 
in my case, I had to determine whether to apply DTO or not based on 
strap resistors on the board.

