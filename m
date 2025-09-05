Return-Path: <linux-renesas-soc+bounces-21528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C20B46374
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 21:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F921D22708
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 19:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168EB1FF1AD;
	Fri,  5 Sep 2025 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="C5a+ffIS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7C315D5D;
	Fri,  5 Sep 2025 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099883; cv=none; b=CtOPi7MbobSsMIM7aUj/TRACHeA/Sj2qePpepF3aofeYUOJlz/SOIvUJiOSE5CJK6GUvynYn7t1nJoz6QIEdW90gp6LGvoHObssxhmwrbuDX1SMHWU4YUglfhAxRCTfmEk/+3G+2GNDXjfpOTW5A0ttl9YAAmzC1YTLDX9mm+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099883; c=relaxed/simple;
	bh=7MRC0lZTayuh+KprYSHSa9qqkcqL8gzJBmURf1kGMUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFOKvnkowudJPkwbT1MJJIJOlVNTVN/K9EJQUmE6MB1GEcOLMI0mD8YijLCascpgsv5txt9dvVzKsQ8dg9c1o9b8goGCHuXqe6fhv7C/5v6fLijmUU0vjE3lXo/ulDcKyMIgDWMmTHhfuJOdiCQbz01dMY6bzZPQTQZ43mJCxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=C5a+ffIS; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cJR2F5sCJz9tDy;
	Fri,  5 Sep 2025 21:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757099877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AuHv2ylcVezR/vi7XrRIcEjiUPL9mtKb38cVL5qRBc=;
	b=C5a+ffISn5r4R4Dt1okCaUiNMJskcAYc3nK4MmwmbywC47MfKOnrHKcS2A67uCZ+pmMRgs
	/ACRnFdUb4YPqoPlfXB1RrDsrqqTzIjLawPCiQQ5+6nh+K8aGqgWBM9+LzQpDyNkSP5XMr
	dHXtih5o2apl/GwG2KKSIQC7eTS7M3ZoCnVWGz6fjDQPTUs7jD7cCgBGWyNuotpXs7YSrp
	rBSj7oSy5SI/HlJrN/FtTnR9Z0ENiUHaVD61/7mM5ODt5/42aHSmPVL0afDbFuVkZWDMvw
	FpWYvO2A6gsy7/NFFf90+Q0aiP5hqTxvmaVy8do912rACIGttpnEMploRUEGTQ==
Message-ID: <e4929fc7-d057-46a7-8603-68271e85b9b5@mailbox.org>
Date: Fri, 5 Sep 2025 21:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
 <20250905-humble-framing-3d9b786c87a2@spud>
 <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
 <20250905-imaginary-crazy-a5734cb794fc@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250905-imaginary-crazy-a5734cb794fc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 40b1347b2509e434e1b
X-MBO-RS-META: 4nawz5fb96azx54xwzyhdjacj1ddx7mw

On 9/5/25 9:03 PM, Conor Dooley wrote:
> On Fri, Sep 05, 2025 at 08:55:16PM +0200, Marek Vasut wrote:
>> On 9/5/25 8:46 PM, Conor Dooley wrote:
>>
>> Hi,
>>
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +      gpio@45 {
>>>
>>> ngl, seems strange to classify the device as a regulator in directory
>>> and name, but use gpio as the node name in the example.
>>>
>>> Otherwise, this seems fine - if you feel that the hardware is
>>> substantively differentially to what's in the "v1" regulator then
>>> keeping them apart is valid.
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> I can rename it to "mcu@" or "mfd@" some such ?
I called it a regulator@ and sent a V2. I didn't include the AB, please 
give it a once-over and provide one if still applicable.

Thanks !

