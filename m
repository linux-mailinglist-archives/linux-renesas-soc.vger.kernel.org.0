Return-Path: <linux-renesas-soc+bounces-23597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17255C08947
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 05:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D343B7F33
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Oct 2025 03:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED8023D7E4;
	Sat, 25 Oct 2025 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pqbuufId"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD306238D5A;
	Sat, 25 Oct 2025 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761361802; cv=none; b=JAI+HRtlXkl0jmI2W+2QMHFZEiwlsalMpsDRc5eIRKyVveB59xTmedu8WkrXRJvhq1VIHju0c3Cs5mEZamBOtw2w3gr+M68uD/X883dD+FOrRGpjkcI5kfzZgJdiUCZhb1XNMDLpov8kz05ROv0qOPLIzkJMjFVcHWVlySOgraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761361802; c=relaxed/simple;
	bh=u73Fqi92p1tDLJhHvzCPtZqShi2M6T+Vg+kCA6cfbxA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PT/FLD5/90HYjAZL0tinNQzjLMWqEiTsO+/5FuUSJWqXG4M2OiNypNxIVbFk6iwLW13HLLX/bnrcN5o3U6C9XFZEqWMU2in3va1/vXqj4K4BadUI9Qbyfs78T4O/BJL3VFJkAxhvtctxYcwhf+JbH57cLjG77XNT2OEEGt7MeXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pqbuufId; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ctlBC63QFz9tSV;
	Sat, 25 Oct 2025 05:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761361795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCBF62IKGB4u03vYMjx7QTYVxxXPjwm02rXnGgVFTvo=;
	b=pqbuufIdhpVgT8UXgWZmWk1Rs05clDeoOxtUffPGuyxE7p2zuYOMmZskaj3h82wPDsBh/9
	dU9q5tt64L498gITnADEiBXPC/9kMSmUcLAGoFT945FkYOgL3Jp4P2rEyNPYaqHdEsN1AY
	jTUhNbTS5O0cRe1nTEsd29xVh98WI8OMPmOBQmfWMQEgQtXSwpgK0kKo25JddTQkS+jObw
	qHq1RJ2OFpo/I2zXfAsSa+g13ifUwwNbPILvMR7rEpBT0/groEZjHDEgEil6XCoX/Zm/wF
	LRxaQcJ38e6qWx+TuF3cFhP4hY3MNPV205qxAbv3PYIEs196ZbR9uxooHAnVZQ==
Message-ID: <168f8017-8da8-4ec0-878f-dae5b52d1994@mailbox.org>
Date: Sat, 25 Oct 2025 05:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
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
Content-Language: en-US
In-Reply-To: <825c8662-831d-43e0-ba28-a1373f9d5a9d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: odnfc4d55gfj5txzcamzqos3iz4byt7s
X-MBO-RS-ID: 4553bc8a81704e814e3

On 10/24/25 2:24 AM, Andrew Lunn wrote:

Hello Andrew,

> On Fri, Oct 24, 2025 at 12:39:45AM +0200, Marek Vasut wrote:
>> From: Thanh Quan <thanh.quan.xn@renesas.com>
>>
>> According to the TI DP83869HM datasheet Revision D (June 2025), section
>> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
>> Fix this.
> 
> It is a good idea to state in the commit message what the bad
> behaviour is which the patch fixes. Somebody looking through the
> patches can then decide if they need to cherry-pick the patch into
> their dead vendor tree, etc.
> 
> Please add to the commit message what issue you where seeing which
> made you create this patch.

In short, on the hardware I use, the interface to the PHY is SGMII, but 
the driver is confused into thinking it is RGMII based on the STRAP_STS 
register content, and misconfigures the PHY for RGMII.

I plan to extend the commit message this way. I tried to cover all the 
bases there, so people can decide whether the are affected or not. Is 
this understandable or is it maybe too much ?

"
net: phy: dp83869: fix STRAP_OPMODE bitmask

According to the TI DP83869HM datasheet Revision D (June 2025), section
7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
Fix this.

In case the PHY is auto-detected via PHY ID registers, or not described
in DT, or, in case the PHY is described in DT but the optional DT property
"ti,op-mode" is not present, then the driver reads out the PHY functional
mode (RGMII, SGMII, ...) from hardware straps.

Currently, all upstream users of this PHY specify both DT compatible string
"ethernet-phy-id2000.a0f1" and ti,op-mode = <DP83869_RGMII_COPPER_ETHERNET>
property, therefore it seems no upstream users are affected by this bug.

The driver currently interprets bits [2:0] of STRAP_STS register as PHY
functional mode. Those bits are controlled by ANEG_DIS, ANEGSEL_0 straps
and an always-zero reserved bit. Systems that use RGMII-to-Copper functional
mode are unlikely to disable auto-negotiation via ANEG_DIS strap, or change
auto-negotiation behavior via ANEGSEL_0 strap. Therefore, even with this bug
in place, the STRAP_STS register content is likely going to be interpreted
by the driver as RGMII-to-Copper mode.

However, for a system with PHY functional mode strapping set to other mode
than RGMII-to-Copper, the driver is likely to misinterpret the strapping
as RGMII-to-Copper and misconfigure the PHY.

For example, on a system with SGMII-to-Copper strapping, the STRAP_STS
register reads as 0x0c20, but the PHY ends up being configured for
incompatible RGMII-to-Copper mode.
"

Thank you for your help !

