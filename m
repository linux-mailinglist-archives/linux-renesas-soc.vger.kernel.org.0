Return-Path: <linux-renesas-soc+bounces-23139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4ECBE2D32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48AB0585087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC124E4D4;
	Thu, 16 Oct 2025 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZYp8L2b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDA2D12F5;
	Thu, 16 Oct 2025 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610209; cv=none; b=LdD9JRmsLOW2fXu5tOP6MG0xK915Ewajes4xRj1mzDUaLZpGl424n457pTSsY/XyQnFUHsYIS/bvVKsfv0iVHnv+Jks/Iyobfx7oNbrn0SeCa43iJWPLVs2dBYtZHtTN10ui4vaXkR92fhHCflKUfzK2z/RLp+MEEphSWV3IIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610209; c=relaxed/simple;
	bh=Bw+T6cKjpYfUGYhO5GoDyJHGV4DUiEzQQTaSyfd+/0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1k1xCc+sF5Z0ZwW87uBddWxdKggUXXkTKYSczO4Nt0CQzWrFqPsyAEG/mQyU8nbZi77yqXgr0QG0I7Z5b49EOq/9AXTWngO5JBx+FB559SKPufs1B9PpoecpGXRAMN7tLFk101y9/yv7/jZyCzT55zdFe59Pd4iNAWvFcFB2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IZYp8L2b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5AA06DC;
	Thu, 16 Oct 2025 12:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760610104;
	bh=Bw+T6cKjpYfUGYhO5GoDyJHGV4DUiEzQQTaSyfd+/0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IZYp8L2biYaumzOATBVesVry8hu4dOKaKEVmgi97ySOZGpNo0LYtGJar7aC6riJFW
	 BBy6fuwBBdRk9FF0SEh28cehBTxxh2P3Ez1et3xbJaAhbx8NXbZDGv1fnwZz/VLW2I
	 Fx6BiTRDlr/MH/QGaFHvm5vqoMARfZHLAFYaV3oQ=
Message-ID: <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com>
Date: Thu, 16 Oct 2025 11:23:20 +0100
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
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert

On 15/10/2025 13:32, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
>> Enable the eth0 node and define its phy.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
>> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
>> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>>          };
>>   };
>>
>> +&eth0 {
>> +       pinctrl-0 = <&eth0_pins>;
>> +       pinctrl-names = "default";
>> +       phy-handle = <&phy3>;
>> +       phy-mode = "rgmii-id";
>> +       status = "okay";
>> +};
>> +
>> +&mdio0 {
>> +       phy3: ethernet-phy@3 {
>> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
> 
> The first compatible value corresponds to a Micrel KSZ9031 Ethernet
> PHY, but according to the block diagram and the picture in the Kakip
> H/W Quick Reference, the board has a Microchip LAN8830 instead?

Ah, my bad...I thought it was the same as the EVK so I copied from there. I think then that this 
should be "ethernet-phy-id0022.1652" (based on reading PHY registers 2 and 3 with phytool) and the 
other properties look to be KSZ9031 specific so I'll drop them and re-send

Thanks
Dan

> 
> The rest LGTM, but I don't have schematics to verify every detail.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


