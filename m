Return-Path: <linux-renesas-soc+bounces-10182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7E79B39D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 19:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D6CFB21433
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 18:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394331D8E16;
	Mon, 28 Oct 2024 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ptkJApp2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD28D155A52;
	Mon, 28 Oct 2024 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141941; cv=none; b=YlDll3Nbs2vW0weDbf+1FK4aAhjYIPLbTxCq+aiY9zpZjnwFllFaLQX6LmJrTTggGqs8LITG4Mg7D1haBuYJaLm2sQsK9YX4jGUkGcHo25v1CtOaecNYEi8TcRAGP5A8XuGln7Yto66Af4waYRyLZWPEhR4K8S490HHWst0AlvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141941; c=relaxed/simple;
	bh=IHbyLhkCtNTuR+x6GPSqHsMn/QWFSVYk2YCENClOhJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPOdjZRudkVOTZ10cu/w72qRqurkdsi7HoxPmMkxYrdVaSQfeKExqjIF3u7yyRLt14zvrphImjo8C1k7cLLZmfGdbkLd/ZSoE8ovViJCFN+UhdvUXdv9hfLxB66t41tTzzjQwlyaVjJBNMzqOYqAlbTLqed0n2qkwOdwhSZPVRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ptkJApp2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E6C3890F6;
	Mon, 28 Oct 2024 19:58:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730141930;
	bh=NlgNP6cg/A4M6No0PkF2AHlBLOKMxjV9Z0JaeWFDKHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ptkJApp2qXE3ryESPPZcb0dcF0YKALRxzhGobEhMuXKqJPESuNKWfK4bmGhthDfv3
	 KwoeGq+I+FvrbmQ7WtUZtjuKibqM+Fx2AQn5aNd+p3ojbqoRjHX9RPOQD/9jLxEUqN
	 YtGWKS3RQRsr5FhFadHwRuZRhYyWDToo70ONSCpds7ZtSHe4qfNNDmpEjBQ+aSNd7v
	 hK6cI9Wz2mgQpJ861GsM40UiqN+tXGnrLVFwmj2I2aPKdvMsAdT7RCTVma2GMUpn4v
	 Qb9XlaNgYX3OCHWDnQ9HcdqFcc36yrrBnJSuS67rHZlz7KioU5kVfQP8syWpATXNW1
	 AZ4b+dBUedr4A==
Message-ID: <4d7d6a7d-cbe8-4cbf-9fb1-2cdec0f11ce2@denx.de>
Date: Mon, 28 Oct 2024 19:18:41 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/28/24 11:13 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hello Geert,

>>>>> So, what would you suggest when the PHY nodes would not have compatible
>>>>> strings?
>>>> I would suggest keep the PHY compatible strings, because that is the
>>>> most accurate method to describe the hardware and fulfill the PHY bring
>>>> up requirements. If the PHY changes on this hardware in some future
>>>
>>> That issue is moot for KSZ9031.
>>
>> If the PHY won't change, then we can keep the compatible strings ?
> 
> Sorry for being unclear. I should have written "the PHY bring-up
> requirements are moot for KSZ9031".

Perhaps, (*) but odd erratas do show up every once in a while, so unless 
you can surely say no such errata will show up for the KSZ9031, can you 
really dismiss the bring up requirements ?

>>>> revision, we can revisit this discussion ? Maybe bootloader-applied DTOs
>>>> could work then ?
>>>
>>> So, what would you suggest when the PHY nodes would not have compatible
>>> strings?
>> I hope I already answered that question before.
> 
> Sorry, I may have missed that?
> 
> I really prefer not having the PHY compatible strings, as DT should
> describe only what cannot be auto-detected.
See paragraph above (*). My take on this is the exact opposite, better 
describe the PHY in DT fully, including compatible strings, so that if 
the PHY driver needs to do some sort of bring up tweak/fix/errata 
workaround/... , it can do so by matching on the compatible string 
without trying to bring the PHY up in some generic and potentially 
problematic way.

The MDIO bus is not discoverable the same way as PCIe or USB is, so I 
don't think the "DT should describe only what cannot be detected" is 
really applicable to MDIO bus the same way it applies to PCIe or USB.

