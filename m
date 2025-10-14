Return-Path: <linux-renesas-soc+bounces-23040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD7BDBB3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 00:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97307353AE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 22:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430B51DB122;
	Tue, 14 Oct 2025 22:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="i7DMKfZa";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uMIQKtfC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DDD23CE;
	Tue, 14 Oct 2025 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760482131; cv=none; b=DFN4ym2XNh1kfa2fgWycHSFywBXkz2ea0LnXMBdJ9c0kzSvgcPbaB5EyeeUaHHzLG/xb0NDqrs1H4+LOUzGsj2VM2hIbcyFUdEguTvS1V5x/RgJC8kYjTerb3HGqphTUj5FTuQ5lXHRZTuOZtMVGLWBkBd0aLcOctGftW5q9Vs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760482131; c=relaxed/simple;
	bh=FL72utjfk8fs4AsqfZnDKy5TVaYZSkeiZREV+J0MS3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJ1N5O1xKfDQSuhfsZpJPURHLLZmcea7tAaenFpdiDPaGG2WtjUTS0cxAGtBjx1ua57cvhrEMFW4i2SjAkFf5tJ95W62aotH8CnDRxMHvPMZePGa7JdvghEuCZV247vvbUHpVvJz07kFabs2j9VzpqlkzZDpyhj6DSZxsXwqqlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=i7DMKfZa; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uMIQKtfC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmTsV6MYxz9t5k;
	Wed, 15 Oct 2025 00:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHlhZz30G+oPXKlMo7Vd7HYzgPOgmXmlwRn9QC9amKE=;
	b=i7DMKfZaCHhy6Ue6SLAd1jUSVgPzlJhy3sA3s8QsHCwBggGTP3+k7LJOmr0+2bNuaqqK7K
	6/ZoXdyIjM6s2AGpgSiTFaG2w9Vm7xSdfpSNIzN7a+dCSWs5HRJpXQxltXI6eOrYbo5eH9
	2RI1KmYdgwwb8qVFTxyC98XVDGN8d7cTfxcnDs54Cvm/FxpRhsR/ieqfigYFG+3nyz2uKP
	NULDU1CCio2t5FawwqDFLDDHBR3lKKYUrRGGMFtuM28IDx3MSko02+fmolWtZFwZSB2dF1
	8tb8CwnW5HZcQVjuCL/A/dbbJJvMKIGRxdfcfd47OxaUzVL6XH2dsAhcH/mb6Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=uMIQKtfC;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHlhZz30G+oPXKlMo7Vd7HYzgPOgmXmlwRn9QC9amKE=;
	b=uMIQKtfCGG1QVuhZosUesFSgN8z3mFM1dpPrbyvTRPc+tVUjjDFzs2qqVAsEHfkSbiNkUB
	1aJLdmOBdD8fXl/NjtFqtq9bEWJcfiGZbxCrBk7nFGNVlEpw2NPn7uQUWARKkLMhx7E7S+
	GDRRLx8WCJMRwffDu/2O9VuKqS8RBLZ1FP9a333ozS+2681szR6D0GkJO2RBc8Ic3Jky4k
	OEtwiKkhlB5gLnFJJiaD0Y9K06dDTTWMR4gKN+k/y+TVP2HBofRYKKu3Kke3LSsTqbMEiI
	2OesG8YuK+EyCbxl80UH+MMHT+Ef49ggX5tVySfi/XR8Up8bMk/wNgPgBGTXQw==
Date: Wed, 15 Oct 2025 00:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qqjtj8tec66ps6d13g3ze4r8g9pktzqa
X-MBO-RS-ID: b86a5c819d17da8554f
X-Rspamd-Queue-Id: 4cmTsV6MYxz9t5k

On 10/14/25 1:52 PM, Matt Coster wrote:

Hello Matt,

>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index c87d7bece0ecd..c9680a2560114 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -13,6 +13,12 @@ maintainers:
>>   properties:
>>     compatible:
>>       oneOf:
>> +      - items:
>> +          - enum:
>> +              - renesas,r8a77960-gpu
>> +              - renesas,r8a77961-gpu
> 
> I think this can just be renesas,r8a7796-gpu; most of the devices in the
> dts for these SoCs appear to use the same pattern and the GPU is the
> same in both.

Not really, the 77960 and 77961 are different SoCs, that is why they 
each have different specific compatible. Of course, most drivers match 
on fallback compatible, since the IPs are mostly identical, see this:

$ git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77961.dtsi
arch/arm64/boot/dts/renesas/r8a77961.dtsi:      compatible = 
"renesas,r8a77961";
arch/arm64/boot/dts/renesas/r8a77961.dtsi: 
compatible = "renesas,r8a77961-wdt",
arch/arm64/boot/dts/renesas/r8a77961.dtsi: 
compatible = "renesas,gpio-r8a77961",
...

$  git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77960.dtsi
arch/arm64/boot/dts/renesas/r8a77960.dtsi:      compatible = 
"renesas,r8a7796";
arch/arm64/boot/dts/renesas/r8a77960.dtsi: 
compatible = "renesas,r8a7796-wdt",
arch/arm64/boot/dts/renesas/r8a77960.dtsi: 
compatible = "renesas,gpio-r8a7796",
arch/arm64/boot/dts/renesas/r8a77960.dtsi: 
compatible = "renesas,gpio-r8a7796",

I can turn the first entry into renesas,r8a7796-gpu to be consistent 
with the legacy 7796 name for 77960.

Geert ?

>> +          - const: img,img-gx6250
>> +          - const: img,img-rogue
>>         - items:
>>             - enum:
>>                 - ti,am62-gpu
> 
> You also need to add img,img-gx6250 to the appropriate conditional
> blocks below here for the number of power domains (in this case, 2) and
> clocks (that's more complicated).
> 
> These older GPUs always require three clocks (core, mem and sys), but
> it's not immediately clear from the Renesas TRM how these are hooked up.
> I can see three "clocks" connected (fig 23.2 in my copy, clock details
> from fig 8.1b):

Which revision of the RM is that ? There should be some Rev.M.NP at the 
bottom of each page.

>   - Clock ZGφ: Appears to be a core clock for the GPU (3DGE). That would
>     make it our "core" clock.

This should be 600-700 MHz clock on M3-W , so that sounds like a GPU 
core clock.

>   - Clock S2D1φ: Appears to be a core clock used on the AXI bus, making
>     it our "sys" clock.

This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock 
? I think this might be the clock which drives the AXI bus, used by the 
GPU to access data in DRAM ?

>   - MSTP ST112: Appears to be a whole module on/off control of some
>     description, and definitely doesn't align with the missing "mem"
>     clock.

Maybe this is the "sys" clock, since it toggles the register interface 
clock on/off ?

> Do you have any further insights as to how Renesas have wired things up?

Please see above, maybe that helps a bit ?

-- 
Best regards,
Marek Vasut

