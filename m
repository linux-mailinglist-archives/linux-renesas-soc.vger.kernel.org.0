Return-Path: <linux-renesas-soc+bounces-7707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E479946256
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 19:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58028283852
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2024 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0668115C13C;
	Fri,  2 Aug 2024 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="USXurMBE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F51136335;
	Fri,  2 Aug 2024 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722619008; cv=none; b=NLOFiKZ8JxbRD8pywhgQZyI0SQvKniW0Y2x0k+ln6yt3A61MvZFFeR2fzvEc23AAAhzOlmrAYpmOcuboeKDMrlTF6kY4B3w6hm6ox/d0Tt7KIdF5gwy6fb4GGvT0B39+XoyCim8B38weE/Med2tqQKheiZOZbGBwe3m+eTNY6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722619008; c=relaxed/simple;
	bh=cUFeEBARYFV8sis7dqXt2LpqVorwXGI0yJIKPIt5D/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY5GWXGbEt+JuZEZV0Idxe549Xi8uVT1wCVnS6dGf8+hIomDD8jUe/r9ZW3l0E5SqGmoUbCJzDez1ffwdBUYOwCACYwUAkApIcBHG+oAp7R/wp2zyGehvrJlWbh/ywkguwV/j5YlRR+ZyUAu5edJfSVokCgfFhfF/hEyUJxi7HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=USXurMBE; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3D9CD889B4;
	Fri,  2 Aug 2024 19:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1722619004;
	bh=RAXCEEpgCwatpuBHTqAhmFDWy6UBEOuWQxJkjlfgoj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=USXurMBE9vAznKErmxEavJNYpWLaNX9kmKOh29aqoY3oav7zqrQ/tq6sVr3J52JX2
	 pES92CqHdOYHshkv6lZ9y3gKH0Nj2101gmTSFfBBpicvCPn8plA4TkB8HANaBiHhLn
	 lOwY7po8ROCb2SFkmdMnbW8zWHIILSE5Zes/2LUjjWTu3OX8HCS4pYUHFm+MYJO6X0
	 OoaXH1sLl/LViHWAlwo7uuT0YjkU2JifNaOXmToPb+ssQHIFOjXeh5BFrIi8GO373+
	 mCizZlPPItXIGH/xgTPMeL1Pc/diAaFHueI/V38lMr7p+cXrmfRT8YJcDvQOVm72OH
	 vgPv+LxK8n0Lg==
Message-ID: <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de>
Date: Fri, 2 Aug 2024 19:16:43 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/2/24 10:33 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> What is your stance on this?
> Thanks!
> 
> On Thu, Jul 4, 2024 at 5:26 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
>> When creating a dedicated mdio node to describe the bus the gpio reset
>> property was erroneously left in the phy node. The reason for adding
>> mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
>> were probed, keeping the property in the phy node prevented this.

If the PHYs should be reset before they are probed, that is something 
the PHY driver should take care of, right ? The PHY driver can bind to 
the PHY via compatible string. Does the PHY driver not reset the PHYs ?

