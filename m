Return-Path: <linux-renesas-soc+bounces-23647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F5C0E389
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC1E11896AE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 14:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2102BD5AF;
	Mon, 27 Oct 2025 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NcT4xlxt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2392797B5;
	Mon, 27 Oct 2025 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573742; cv=none; b=qu1duiqrz/kKcz+dTCyT7Hgle3Tk6Rkr8qbb3eSQbO2N/i/c+GGi40r2pHDwo2eRDujzwgdn8S3+5z19tF67rY43iRS99U4GPZ1TjkcxS7762Oq6aWiHcnHHHYC4V3oqlM5wJuScQLKzPlfpSm3i0F9r/Fl0IktfUTm0PP4MjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573742; c=relaxed/simple;
	bh=xj2uak6LNOqCto/XNOL9JjcOraNlJm6CvJe3AzaNPnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=em3L2Yy4RGD/r5zZRtnDt5sCof3o2rjdpCKSK3N/mh3eE+RV1FDXF9dVGQ65P6NzLq9F4sSE1HwoGHFQvzHVYxWNtHWoRp1e7RW7lrU1cxFZSCcOk11VZcCWe4ZXfY5w1BavEKP5G2Tpf1KH0fucp15VI8IAAuBQIvc5hWWOYmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NcT4xlxt; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwFZ01xNGz9spj;
	Mon, 27 Oct 2025 15:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761573736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxWVl23Mqsyq+6I9gjPinWqFeM2C1V1RfTSOwX+yLUc=;
	b=NcT4xlxtrXVOm53mOhYQGNZ/YgUq0FbV1jVtMlV7EN2oBmO8yJJBPwMTbjlz8V5Ee/Zxvu
	rTkqgBF6TZMB0OT2/G5+S8L/Z48FVq+rcF1UjvWlsSTFKafL/kW6ATkEUSlm7yjiLIpJqa
	F4iFJghOhPmK7u4TXhgpVoiQQ4KRtNssi9pIJXUgZZrp39RUIdaF/tuvSa56TRaRVl8p4w
	kunjA+wSYnhWWlwrAt76s+mCSRH55XTCNZHAXeOPk95f6nQf7Nwswsd6l4LOjXgnOUkqGA
	J9KER13+9vLKdMJzSIFqiy5P76bplRcj0bd8208rUegt7KvGzJz4XhSofz7pXQ==
Message-ID: <9bfb4118-088a-40cc-a071-4b12d9bc8015@mailbox.org>
Date: Mon, 27 Oct 2025 15:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net,PATCH] net: phy: dp83869: fix STRAP_OPMODE bitmask
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>,
 Hai Pham <hai.pham.ud@renesas.com>, "David S. Miller" <davem@davemloft.net>,
 Dan Murphy <dmurphy@ti.com>, Eric Dumazet <edumazet@google.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org
References: <20251023224018.192899-1-marek.vasut+renesas@mailbox.org>
 <825c8662-831d-43e0-ba28-a1373f9d5a9d@lunn.ch>
 <168f8017-8da8-4ec0-878f-dae5b52d1994@mailbox.org>
 <3b5e2a79-186e-4c92-9bef-51fdd34af351@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3b5e2a79-186e-4c92-9bef-51fdd34af351@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fd7dosefzsdi3ohyktuqk7fxfiriuq69
X-MBO-RS-ID: 3ca1a6115dbc66df811

On 10/27/25 12:48 AM, Andrew Lunn wrote:
> On Sat, Oct 25, 2025 at 05:09:17AM +0200, Marek Vasut wrote:
>> On 10/24/25 2:24 AM, Andrew Lunn wrote:
>>
>> Hello Andrew,
>>
>>> On Fri, Oct 24, 2025 at 12:39:45AM +0200, Marek Vasut wrote:
>>>> From: Thanh Quan <thanh.quan.xn@renesas.com>
>>>>
>>>> According to the TI DP83869HM datasheet Revision D (June 2025), section
>>>> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
>>>> Fix this.
>>>
>>> It is a good idea to state in the commit message what the bad
>>> behaviour is which the patch fixes. Somebody looking through the
>>> patches can then decide if they need to cherry-pick the patch into
>>> their dead vendor tree, etc.
>>>
>>> Please add to the commit message what issue you where seeing which
>>> made you create this patch.
>>
>> In short, on the hardware I use, the interface to the PHY is SGMII, but the
>> driver is confused into thinking it is RGMII based on the STRAP_STS register
>> content, and misconfigures the PHY for RGMII.
>>
>> I plan to extend the commit message this way. I tried to cover all the bases
>> there, so people can decide whether the are affected or not. Is this
>> understandable or is it maybe too much ?
>>
>> "
>> net: phy: dp83869: fix STRAP_OPMODE bitmask
>>
>> According to the TI DP83869HM datasheet Revision D (June 2025), section
>> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
>> Fix this.
>>
>> In case the PHY is auto-detected via PHY ID registers, or not described
>> in DT, or, in case the PHY is described in DT but the optional DT property
>> "ti,op-mode" is not present, then the driver reads out the PHY functional
>> mode (RGMII, SGMII, ...) from hardware straps.
>>
>> Currently, all upstream users of this PHY specify both DT compatible string
>> "ethernet-phy-id2000.a0f1" and ti,op-mode = <DP83869_RGMII_COPPER_ETHERNET>
>> property, therefore it seems no upstream users are affected by this bug.
>>
>> The driver currently interprets bits [2:0] of STRAP_STS register as PHY
>> functional mode. Those bits are controlled by ANEG_DIS, ANEGSEL_0 straps
>> and an always-zero reserved bit. Systems that use RGMII-to-Copper functional
>> mode are unlikely to disable auto-negotiation via ANEG_DIS strap, or change
>> auto-negotiation behavior via ANEGSEL_0 strap. Therefore, even with this bug
>> in place, the STRAP_STS register content is likely going to be interpreted
>> by the driver as RGMII-to-Copper mode.
>>
>> However, for a system with PHY functional mode strapping set to other mode
>> than RGMII-to-Copper, the driver is likely to misinterpret the strapping
>> as RGMII-to-Copper and misconfigure the PHY.
>>
>> For example, on a system with SGMII-to-Copper strapping, the STRAP_STS
>> register reads as 0x0c20, but the PHY ends up being configured for
>> incompatible RGMII-to-Copper mode.
>> "
> 
> This is good. It nice to have lots of details, cause and effect, even
> if its a silly topo bug.
> 
> Please add my Reviewed-by to the next version.
Will do. Thank you for your help !

