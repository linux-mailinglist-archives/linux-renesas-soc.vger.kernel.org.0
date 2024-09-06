Return-Path: <linux-renesas-soc+bounces-8830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5696FB47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 20:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 333A51C217BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 18:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BC413B783;
	Fri,  6 Sep 2024 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="xmzKnSq9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A026B1B85C7;
	Fri,  6 Sep 2024 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725647816; cv=none; b=COgLUZvLehvwqw2g11uyDN6eLMPAq5NyOLcvkQCXBaNpULDagK6pQjaccJTl9Ps64V9RwNNIrw6gEt5Xpp6o0jTifZcDSmW7jHxHT3weZaqhEfl/18hizFCv/Kav8rbPuyGX7fliw/NtnzFkcNYjQ1XMcbB9Sd8b4J/A1PpNfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725647816; c=relaxed/simple;
	bh=x6kTqd7p1pvKS6s7BCNxL1Thc9wkqKidg5dpXSt7cME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4O5z5zTj/U6U04JH9KQnte1iewdojLPdaFUwtT70fTsOFubjaJ8BGmXbVSpDjEMXWqguLJ1X2xgAp8TfeO8eQsnEJNlezVQrFwFLIKRUFOXEJIan8XbJlIvveWBe9VnHLGerL9jJ07FFaogkXnQMyrIsN9govfjhe+wXz7hM6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=xmzKnSq9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0F94388D28;
	Fri,  6 Sep 2024 20:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725647220;
	bh=MBzwCWFoEfRwzQ78lGGbV/YUbPVE/pDpa1MAJ2s+OPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xmzKnSq9WOyAoxM2WKgcUO1XIg0rp9NlkI71yAtQbuDxzDUscHx3UuED0hLlvUtj/
	 1OaM42bW3KzQzemSkkpS1p7Xo1eJM5QoYxv1Ii39k1XS/0LLtMd/e7usmTcWqh0qEL
	 ccrbCYF4d8GLmR99xpiBGf3nm46UHi+zEVuYd2zuNa2hSGvRUzYQdmV/109QT2pIvb
	 8ODjx1pU+MQQiSrdZHB0KNbI8NkHYzBESmbFJT95JRHqhkFZzyuAG9r/p+XhS0NGgq
	 I89PVyPVh/nGH2lKaEABmdZNQlw7BcH2461lxnHXMsaqMjeYHyz37JKFWCkbIOU8oP
	 AE9TL2Bxx7O5A==
Message-ID: <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de>
Date: Fri, 6 Sep 2024 20:09:19 +0200
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
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
 <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/22/24 3:56 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

sorry for the delay.

> On Fri, Aug 2, 2024 at 7:16 PM Marek Vasut <marex@denx.de> wrote:
>> On 8/2/24 10:33 AM, Geert Uytterhoeven wrote:
>>> What is your stance on this?
> 
>>> On Thu, Jul 4, 2024 at 5:26 PM Niklas Söderlund
>>> <niklas.soderlund+renesas@ragnatech.se> wrote:
>>>> When creating a dedicated mdio node to describe the bus the gpio reset
>>>> property was erroneously left in the phy node. The reason for adding
>>>> mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
>>>> were probed, keeping the property in the phy node prevented this.
>>
>> If the PHYs should be reset before they are probed, that is something
>> the PHY driver should take care of, right ? The PHY driver can bind to
>> the PHY via compatible string. Does the PHY driver not reset the PHYs ?
> 
> AFAIK, there is no requirement to reset the PHY before it is probed.

That would mean the PHY is in undefined state before it is probed, which 
is not good.

> However, the reset signal may be in asserted state when the PHY is
> probed (e.g. after unbind from the Ethernet driver, or during kexec).
> Identifying the PHY by reading the ID register requires deasserting
> the reset first.
That may not be the entire precondition. For example the SMSC LAN87xx 
PHYs also require PHY clock to be enabled before the reset is toggled, 
but such information is available only to the specific PHY driver.

The MDIO-level reset GPIO handling, as far as I understand it, applies 
in case there are more PHYs on the MDIO bus which share the same reset 
GPIO line.

In this case there is only one PHY on the MDIO bus, so the only bit 
which applies is the potential PHY-specific reset requirement handling. 
If the PHY driver ever gets extended with such a thing in the future, 
then having the reset-gpios in the PHY node is beneficial over having it 
in MDIO node.

It will always be a compromise between the above and best-effort PHY 
auto-detection though.

