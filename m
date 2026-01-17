Return-Path: <linux-renesas-soc+bounces-26943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA065D38A8A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 01:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D9B1304D855
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 00:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273F155C97;
	Sat, 17 Jan 2026 00:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SlseDU4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790071548C;
	Sat, 17 Jan 2026 00:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608916; cv=none; b=mXJU3QjfqANRYgyk1LbCb9ruDJn1bWcrnURmZU2AGpAIB/XSqpxbf5An4Udj0JiweAEglEx7KZLIIhdfJ/onY6H3goTsl/rlr6fzB6HaXebixou0OkjwDacwiVQqRzq5pxYyl8K3sQHQxqs4CI1zvSnAe1550Q9A6Xw1scX/+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608916; c=relaxed/simple;
	bh=UBrEWpU3wE9Qp8IwcuyIpngZVwzcRikJyzYK3PFZDN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZIGHyw0hY164c9O8UmzfeztRFsLkUxqAY7MKXB9FcXzpNs1WRqumjWoKonmJgMAFREQlgb/PFCNScedFOYE6j6mu3itlnI16QmOXmfIG3005AerTkmeKZPbf3Mep0lXepO5HydV6og2XMCUgnk5drd86FzdkrzyzvgKyj3yVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SlseDU4b; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dtH6d2WbNz9vC5;
	Sat, 17 Jan 2026 01:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768608329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKRa8QawqDzIvt7NlwnnBTWgzNog8p4CKpjNhH/1PZU=;
	b=SlseDU4bBi5Mixp/2CUPctSORnoqKjW7G6NTe8NUczv47/TLpZJ3wSLsb0RXNXdcvCe8ho
	W80dT5gSyPaLPdDCwH5/e1dUQ8LPZt8/epqox+nvOUXgzuGP5E/W8w9KOfS86dOgbDcM4M
	oCOl11muFj5GcQ+9rhQnVEbH69iboRxSKq7Z0ZJXHVdL2wSwBCxIvnVjNbLdkjcEmoxXpA
	ja5AaeZV4y9tXQQszI3jY270IVI6ijnsXBOwd4njHFSfShLrRb6o1WAvJrWUI/30YxsN+a
	iE327eJwfjgLsVG+qaGImQz+UqnwHApRCW1VPvWaxBkniPZPyE9E/ClljNBLFg==
Message-ID: <7d2554e2-bc69-48c3-89c7-deb701d8a12b@mailbox.org>
Date: Sat, 17 Jan 2026 01:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
 <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
 <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: edcd393bf97bbd689c1
X-MBO-RS-META: r6q7zznwwkxqqc151rrxyqkmbmiaaqgw

On 1/16/26 4:26 AM, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 1:20 PM Marek Vasut <marek.vasut@mailbox.org> wrote:
>>
>> On 1/15/26 6:40 PM, Rob Herring wrote:
>>> On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
>>>> Move the Waveshare panels description into separate document, so they
>>>> can be properly described with compatible = "waveshare,...", "panel-dpi"
>>>> and attached to "waveshare,dsi2dpi" bridge.
>>>
>>> But why do we need "panel-dpi"? Adding that requires changing a DT.
>>> Can't you make the kernel handle these compatible strings as a
>>> "panel-dpi" without the compatible?
>> I can, but wouldn't we then miss the more specific compatible strings in
>> the DT ?
>>
>> compatible = "waveshare,13.3inch-panel", "panel-dpi";
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>                this ... would be removed. Do we want that ?
> 
> No, drop "panel-dpi". Or really, don't add it.
> 
>>
>> The other option would be to add the timings into panel-simple driver,
>> then we wouldn't have to change the bindings at all. Maybe that would be
>> preferable ?
> 
> Why can't the "panel-dpi" driver match to"waveshare,13.3inch-panel"?
It could, but then, if I am already patching that panel-simple driver, I 
can also simply include the timings in it, just like many other panels do.

