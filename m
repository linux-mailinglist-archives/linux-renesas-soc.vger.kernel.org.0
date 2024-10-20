Return-Path: <linux-renesas-soc+bounces-9916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A729A5799
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 02:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB991C20A0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 00:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FBE629;
	Mon, 21 Oct 2024 00:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="fMCVAgQD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E12173;
	Mon, 21 Oct 2024 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729469612; cv=none; b=s9n3Zi56gSkH7+WTXsf9xNwqGzN9vcVrKofzDDlJEQk6+MSYJ1KL2KM7yfF2UzHVlDdc0nhBJ0u+zgxoIABG+2nOEq5iwWy7teWrHIA0fMH0k8XpjIGKRAMvnAq6HvN7HTXYGtAzNWpN0zbjI/xH0lRYu9Up+gB2s/nYKsMuPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729469612; c=relaxed/simple;
	bh=R/k9uYQHSpDcpi50VvUloJGEk0H00iqdXI18v4ZuqNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9ReH9lquF5Tv0rgpbfF8LgfhoFxNHt3YUz2psY2sC2TC4rFX51iv1VKYgwFHam46bBZpDdS6Xsyrgb6fKeNX8veT/B5ahDE2N4+N0kOjt6ivVwvjcGy7x80dPr1ninH8cFgxxpBGS9HKCv30ajSAf7+RnCNnGeE+ooAd2cchHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=fMCVAgQD; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 760CF88278;
	Mon, 21 Oct 2024 02:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729469608;
	bh=IRVAUBinxbX/l4Lyk6VhE6sA/V8JI+dBGkk5jqRChqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fMCVAgQDpMge1KO/GJgCBiwcRh+6/QybCLogajgvCvmTsnK1NE7eOAcd5ZIxFoOTD
	 heyF1ge1ieIMGCM7SIAfGxF30DkYGoVR6cDftHg/ZBSbOKicXGv2d8BNdZ+V3zxS0O
	 LeNZxB/oBB3GPCozNF/tUHv8pX9Ekcsa4dL7OZZkL7jzCtaQuTpkJeT1Snj1pIEYsK
	 lfz2dn7kPFFcPsr00ELCk0chI5goWfXRxarfmL9W9GLGTg13MJkEJU7aPqHOSLqfNg
	 9IW2v6ji2p8IUtWS/tXegTcDa1gwi9pRFOVw11v5xWUPfjl1cx/Nng2sf/3KT3zMIO
	 KSnnySi0vtVUw==
Message-ID: <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de>
Date: Mon, 21 Oct 2024 00:16:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
 <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
 <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de>
 <20241015144810.GD2838422@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241015144810.GD2838422@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/15/24 4:48 PM, Niklas Söderlund wrote:

Hi,

>>> However, the reset signal may be in asserted state when the PHY is
>>> probed (e.g. after unbind from the Ethernet driver, or during kexec).
>>> Identifying the PHY by reading the ID register requires deasserting
>>> the reset first.
>> That may not be the entire precondition. For example the SMSC LAN87xx PHYs
>> also require PHY clock to be enabled before the reset is toggled, but such
>> information is available only to the specific PHY driver.
>>
>> The MDIO-level reset GPIO handling, as far as I understand it, applies in
>> case there are more PHYs on the MDIO bus which share the same reset GPIO
>> line.
>>
>> In this case there is only one PHY on the MDIO bus, so the only bit which
>> applies is the potential PHY-specific reset requirement handling. If the PHY
>> driver ever gets extended with such a thing in the future, then having the
>> reset-gpios in the PHY node is beneficial over having it in MDIO node.
>>
>> It will always be a compromise between the above and best-effort PHY
>> auto-detection though.
> 
> I agree this is not needed if the PHY is identified by the compatible
> string, but might be if it is not. In this case it works and the reason
> for this patch was just to align the style used here.
> 
> I'm happy to drop this patch, or send a rebased version that applies
> since the context changed ;-) Marek, Geert what is your view? I'm happy
> with either option.
I was hoping Geert would comment on this first, but seems like maybe no. 
I think, since the PHY node does have a compatible string AND the reset 
is connected to the PHY, I would keep the reset property in the PHY 
node. Sorry.

