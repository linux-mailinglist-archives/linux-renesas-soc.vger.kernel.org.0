Return-Path: <linux-renesas-soc+bounces-7130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A9928EF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 23:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3659C284311
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 21:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35500145A00;
	Fri,  5 Jul 2024 21:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rt1mBxim"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07A313ADA;
	Fri,  5 Jul 2024 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720216251; cv=none; b=qtFg7gu1K5irncqDkkNR5X1ConuvKuPUakq6imwJDmqF2R8oMvO57Bc1ULNpHxtlM+pXpvVh7aBk8DX3jsc5yBAVztX7s+ck6IVzehbh5rLiZ7RH9Kq+tr8OS888mhGKOWwowm5ZuduZ2g0WuN9xd8r/JonfsyUbpE6kmMgkgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720216251; c=relaxed/simple;
	bh=9g7uUd6Ua29S3ak106XqSEVuqrsaHBDW71h8hmw+F0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDbOdMQrjDiOdm2MgB+C19csLLN3XWVxczH+EcOPmHAy3JrSlPVAHfEOxh/8DQ0Fws3EABADacqw3ybqfsKUYRMFHm+C30QrS+VP1/Jf9Et8myDEis9BhyRdTm/gv0u/hcavDfH7qkX/fkVgNaNUgVmMQhzzGb5RwnyIT2t9qs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rt1mBxim; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B891C881AD;
	Fri,  5 Jul 2024 23:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720216240;
	bh=7+24+gjh34XsbwY6GeBFW9MyY9yyMjRcuQ5AZYwxY1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rt1mBximwVacvv8COUp/4viKR7rCDkqFvPUVvzPDXBaAdv70h5tharb4ZZD1dFrM5
	 qr2rElcJnyiiV8f4DV88HbUDFsSB9wvCZUD58jU/GltiSecMaLld8KXu7buJckOgOD
	 j5/XMiGB889QbdS6kAZ1bvSyvyrVZBz5FOfRwJTSnxutuXv3YpGyNpB3ytNUJTwzMB
	 eAzAQiZetZM+szik+BmXjvMAdHe1fkdV+niUa3phzRnhsISf3dphlRyL5dsxa1Xqqk
	 wIx1zNbqOApuVopmDMWqmR4KVuezXOAlSzDd5Z8vjqWllfW3TSOIwqJsHR6+hfy5CG
	 lDX5RgRXQ9brg==
Message-ID: <b9c2abc3-cc01-4ac7-9e42-c9ce1db64eba@denx.de>
Date: Fri, 5 Jul 2024 23:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/3/24 10:24 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

[...]

>>> What about moving the PHYs inside an mdio subnode, and removing the
>>> compatible properties instead? That would protect against different
>>> board revisions using different PHYs or PHY revisions.
>>>
>>> According to Niklas[1], using an mdio subnode cancels the original
>>> reason (failure to identify the PHY in reset state after unbind/rebind
>>> or kexec) for adding the compatible values[2].
>>
>> My understanding is that the compatible string is necessary if the PHY
>> needs clock/reset sequencing of any kind. Without the compatible string,
>> it is not possible to select the correct PHY driver which would handle
>> that sequencing according to the PHY requirements. This board here does
>> use reset-gpio property in the PHY node (it is not visible in this diff
>> context), so I believe a compatible string should be present here.
> 
> With the introduction of an mdio subnode, the reset-gpios would move
> from the PHY node to the mio subnode, cfr. commit b4944dc7b7935a02
> ("arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2")
> in linux-next.

That's a different use case, that commit uses generic 
"ethernet-phy-ieee802.3-c45" compatible string and the PHY type is 
determined by reading out the PHY ID registers after the reset is released.

This here uses specific compatible string, so the kernel can determine 
the PHY ID from the DT before the reset is released .

> Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Use
> MDIO node for all AVB devices") did keep the reset-gpios property in
> the PHY node. I guess it should be moved one level up?
> 
> Does the rtl82xx PHY have special reset sequencing requirements?

Aside from reset timing, which does not seem to be in use here, not that 
I am aware of.

>> What would happen if this board got a revision with another PHY with
>> different PHY reset sequencing requirements ? The MDIO node level reset
>> handling might no longer be viable.
> 
> True. However, please consider these two cases, both assuming
> reset-gpios is in the MDIO node:
> 
>    1. The PHY node has a compatible value, and a different PHY is
>       mounted: the new PHY will not work, as the wrong PHY driver
>       is used.

What is the likelihood of such PHY exchange happening with these three 
specific boards ? I think close to none, as that would require a board 
redesign to swap in a different PHY.

>    2. The PHY node does not have a compatible value, and a different
>       PHY is mounted:
>         a. The new PHY does not need specific reset sequencing,
>            and the existing reset-gpios is fine: the new PHY will just
>            work, as it is auto-detected.

Or maybe, it will work by sheer chance, the reset timing would be off 
for the new PHY, but nobody will notice until much later. At least with 
the specific compatible string, such a PHY exchange would be detected 
outright.

>         b. The new PHY does need specific reset sequencing: the
>            new PHY will not work.
> 
> Which case is preferable? Case 1 or 2?

I think 1 because that is the well defined option which always works or 
always fails.

