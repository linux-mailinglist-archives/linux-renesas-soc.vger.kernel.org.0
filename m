Return-Path: <linux-renesas-soc+bounces-23732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45409C14400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F7F256815F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE4425486D;
	Tue, 28 Oct 2025 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ltcUvB3Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9A302168;
	Tue, 28 Oct 2025 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649018; cv=none; b=JPTjoCobhsPHs1M66Jb3UQsxdjRrzs/dLMPXJmP7iRXI+xRP0T5vXbSxCl5SeAe39OJnGJjbKFUFmHb2AdyKqmWeyU7JuTgNVKaalfHtvPKxxXwBQwvKA4p+kfumL48YptlIFR61lJEOlfGr2RKFa/oU5DT6qNJ6HYPGLD25us0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649018; c=relaxed/simple;
	bh=O2CowSFEo0Z74Nf8jlQtb/rvgK4uLbl5mlybf85GCO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy81P2SmAbaacBq+DIx7AHQlcBCasNN6pcqUk3r/YntLWxTaDYLMGoU2g8mSQiH31UKhO5yTMeUFUjm4VZiODEJKFLzDiL6UNEV+yt1soC2OWRf33B6M16c3aQXtjnM4StE8kVCn9eRSB6QhNOHg1lK6VRcQPt5Bvs3Tt4jpJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ltcUvB3Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3FCC176B;
	Tue, 28 Oct 2025 11:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761648904;
	bh=O2CowSFEo0Z74Nf8jlQtb/rvgK4uLbl5mlybf85GCO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ltcUvB3ZzJOtqDnsClT7Lk+CVuvQPkiAGBa9NGTooam0aQlFJGsbF4qXzzndNgYMh
	 MQduQdhrP62m4RxkJQdehxZ5VGKQSaeAHqih5JLaqIAqkg5pwgdWWz6aMLBxinZU9V
	 cGzSI6ZSGKqIBalo71DTlMkHHm8fvR9x+lHF1H3U=
Message-ID: <9a9b2fc0-81ca-445c-981c-104d7ed9043c@ideasonboard.com>
Date: Tue, 28 Oct 2025 10:56:49 +0000
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
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CABMQnVJu-rVHSYcSU271sVeVvuHN=+h8YOAMkDXW--MWfxguuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Good morning Nobuhiro - thanks for your comments

On 26/10/2025 03:54, Nobuhiro Iwamatsu wrote:
> Hi all,
> 
> 2025年10月26日(日) 10:06 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>:
> 
> 
>>>
>>> Indeed, I couldn't find it anywhere either so resorted to phytool.
>>>
>>>>
>>>> Which PHY is actually mounted on the board you have?
>>>> Can you inspect it visually?
>>>
>>> It says LAN8830, plus a couple of other strings.
>>>
>>
>> Yes, this board has a LAN9930 chip.

Sorry; is that a typo? Should that be LAN8830?

>> Since this chip's PHY_ID is 0x22165X, I believe the PHY driver needs
>> to be modified.
> 
> I have confirmed that this IC is supported by micrel.c, not microchip.c.

Excuse my ignorance; I have no experience with phys really. The driver that claims the phy is indeed 
micrel.c, and with the phy id set to 0x00221652 it's picked up as "Microchip LAN8841 Gigabit PHY". 
When I take a look at that the PHY_ID_LAN8841 (0x00551650) and MICREL_PHY_ID_MASK (0x00fffff0) seem 
like they're appropriate already. What needs to be modified?

Thanks
Dan

> 
> Best regards,
>    Nobuhiro
> 
> 
> --
> Nobuhiro Iwamatsu
>     iwamatsu at {nigauri.org / debian.org / kernel.org}
>     GPG ID: 32247FBB40AD1FA6


