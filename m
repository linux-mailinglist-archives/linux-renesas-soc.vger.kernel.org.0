Return-Path: <linux-renesas-soc+bounces-21525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF26B462EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0722C1D21B5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9F4315D4C;
	Fri,  5 Sep 2025 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jDe8laPw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209D315D49;
	Fri,  5 Sep 2025 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098530; cv=none; b=F0Z77Qp/9wrCkWwj7wcTDLMCQhuslzeziJN04TMppLNDy7dCCvBi2vIqHVCVV3PgOUcSznm0W84oh2WWjMDVR6Px+FJmWoN7W+yGKO9HNzsl3gfvixRZsOpwQR1U8kkLd9MFX2kBGOvb3Va3lC+Qvi2nMnTE37c6abJMINiqZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098530; c=relaxed/simple;
	bh=s6CiRcXZMP0E4uYpulfgWGUiYBfB620YgA9WiOCn/0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3I3tscTb9JU79F4lIEX7vxTEWcGA4rGNudXtYYLRO+7WxdK0S5KgSzeb1a9K+YNa32W5NSzbEs+VMqP74VzS08XjDxe6rHUFHlAaKBNa1Pyw7Jj+oSiU+cc1d7OcPJWHvDe8MaFBWLQQQWlwLRkWe3Q7tauD/Ag9rqD5Gu943A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jDe8laPw; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cJQX723qKz9t8p;
	Fri,  5 Sep 2025 20:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757098519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvEyUa3aBwqq9pzCfPLROE7hTwVNse4Jw4z6I6A3IUI=;
	b=jDe8laPw/CLEhVt/gns4C/GwvDOWL06hGuCYyYa3+2qOpGK8EPAzeZdJvNlG1HNMmx/V77
	ggPWH+R6vZ+2gZ11rp+ywtzQ/R/L7+W+HPQb8NzF5cK7cWoIcA0+KFtqQZQpDOOOR1PyP2
	R87zmaaRv9s9XE5e7Y/X+6xPxWI9GKBIYFYFx9HWr1SCgwrQ8Hs7g2PLQ13QW+7tlIiEuo
	r/HqRjzXM4jFgCKZ0HduZT1EdPsuHiEjYtqqYlC2ZQ11LjxYW5A1vxjzzN2d0qFfH9hWkU
	KGvZv77cHfVYqRcjyDavC35eVjKIgIBeBbSz9My9uMfQaRAleVyMIZci/ZC2tg==
Message-ID: <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
Date: Fri, 5 Sep 2025 20:55:16 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250905-humble-framing-3d9b786c87a2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1610ff316d30fa5ccec
X-MBO-RS-META: 7bwgeaepbm4mhh4ckbu5hz6y3qkdg661

On 9/5/25 8:46 PM, Conor Dooley wrote:

Hi,

>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      gpio@45 {
> 
> ngl, seems strange to classify the device as a regulator in directory
> and name, but use gpio as the node name in the example.
> 
> Otherwise, this seems fine - if you feel that the hardware is
> substantively differentially to what's in the "v1" regulator then
> keeping them apart is valid.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
I can rename it to "mcu@" or "mfd@" some such ?

I originally thought it could be compatible with the V1, which is why I 
tried to conflate them into single binding in 6d09c6e474bd ("regulator: 
dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280") , 
but they are too different, so this undoes the change and creates 
separate binding.

