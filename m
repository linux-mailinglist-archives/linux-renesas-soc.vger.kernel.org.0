Return-Path: <linux-renesas-soc+bounces-24042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C46C2CF5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 17:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A0C460FB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1516023AB8D;
	Mon,  3 Nov 2025 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CesO5XO4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3B1E3DED;
	Mon,  3 Nov 2025 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762184078; cv=none; b=UYR64Oe1lJgNJTgVJ/Vhp3RXkzSD6SsvGzeajR9n0jarg0714F9sFdifZFme1Egpby1oTYZ9r3z/Uww97mh0Ac0UzVWgrmc8TdIBBnQwCGT/QpgfHf3HWNIyw+69hAMwwGIHoEd5VPZUlaxMyDFoSw18ixd2CKECwloYjYQhBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762184078; c=relaxed/simple;
	bh=lysJftpz+IO4ZKExVW7pj1W42TMJiZpVuJsy6nHQIK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCQlz4bY9D44VzUKtlxLvtcTN7kiAwFr6DZPtyZdicV0GTY4gNnkzv29KSqreoYLPFnL6B3CGBLIk7DijlMuESfXvyhpNz3lITdkPnN1ITSAJUjFrX3syP/UkIcwm5lUGRjCzrnm0mOZ1CKRChTKszh7aRR13P+nX6JZ0CmZXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CesO5XO4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 051E4C73;
	Mon,  3 Nov 2025 16:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762183960;
	bh=lysJftpz+IO4ZKExVW7pj1W42TMJiZpVuJsy6nHQIK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CesO5XO4lfEF9mRUECys9JUjPdwDrlM3JXuqcf86n3XNE7QOsrTLG2OaRFZkWKoMA
	 i/pIEY3T4EV0FvO5kHRuY6KQA1ftzBBWCIjdn4Kufu1uwvrKMAC1kuCiBryA/tGTVB
	 TFZ2ruhfrU0KtlnDXNlkFPHBEz5kr8T5eRoP128A=
Message-ID: <1b60470f-c93e-4681-aab4-fdbda2057407@ideasonboard.com>
Date: Mon, 3 Nov 2025 15:34:30 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
 <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com>
 <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
 <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com>
 <CABMQnV+z=8-ORRGTjxM=6iP+6+qbJa-N_C0csi8K53wpFwLp_A@mail.gmail.com>
 <CABMQnVJu-rVHSYcSU271sVeVvuHN=+h8YOAMkDXW--MWfxguuA@mail.gmail.com>
 <9a9b2fc0-81ca-445c-981c-104d7ed9043c@ideasonboard.com>
 <CABMQnV+bR1bteABAWOS_tYd3LZqg190tE-=_kqzZYe95fTQttg@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CABMQnV+bR1bteABAWOS_tYd3LZqg190tE-=_kqzZYe95fTQttg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Nobuhiro

On 01/11/2025 07:20, Nobuhiro Iwamatsu wrote:
> Hi Dan,
> 
> 2025年10月28日(火) 19:56 Dan Scally <dan.scally@ideasonboard.com>:
>>
>> Good morning Nobuhiro - thanks for your comments
>>
>> On 26/10/2025 03:54, Nobuhiro Iwamatsu wrote:
>>> Hi all,
>>>
>>> 2025年10月26日(日) 10:06 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>:
>>>
>>>
>>>>>
>>>>> Indeed, I couldn't find it anywhere either so resorted to phytool.
>>>>>
>>>>>>
>>>>>> Which PHY is actually mounted on the board you have?
>>>>>> Can you inspect it visually?
>>>>>
>>>>> It says LAN8830, plus a couple of other strings.
>>>>>
>>>>
>>>> Yes, this board has a LAN9930 chip.
>>
>> Sorry; is that a typo? Should that be LAN8830?
> 
> Sorry, it is typo, LAN8830 is correct.
> 
>>
>>>> Since this chip's PHY_ID is 0x22165X, I believe the PHY driver needs
>>>> to be modified.
>>>
>>> I have confirmed that this IC is supported by micrel.c, not microchip.c.
>>
>> Excuse my ignorance; I have no experience with phys really. The driver that claims the phy is indeed
>> micrel.c, and with the phy id set to 0x00221652 it's picked up as "Microchip LAN8841 Gigabit PHY".
>> When I take a look at that the PHY_ID_LAN8841 (0x00551650) and MICREL_PHY_ID_MASK (0x00fffff0) seem
>> like they're appropriate already. What needs to be modified?
>>
> 
> Sorry for not explaining well.
> We need to update compatible from ethernet-phy-id0022.1640 to
> ethernet-phy-id0022.1650".
> Because this chip's ID is 0055165X.

Ack - ok, thanks very much!

Dan

> 
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -70,7 +70,7 @@ &eth0 {
> 
>   &mdio0 {
>          phy3: ethernet-phy@3 {
> -               compatible = "ethernet-phy-id0022.1640",
> "ethernet-phy-ieee802.3-c22";
> +               compatible = "ethernet-phy-id0022.1650",
> "ethernet-phy-ieee802.3-c22";
>                  reg = <3>;
>                  rxc-skew-psec = <0>;
>                  txc-skew-psec = <0>;
> 
> Best regards,
>    Nobuhiro
> 
> 
> 
> 
> 
> --
> Nobuhiro Iwamatsu
>     iwamatsu at {nigauri.org / debian.org / kernel.org}
>     GPG ID: 32247FBB40AD1FA6


