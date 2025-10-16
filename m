Return-Path: <linux-renesas-soc+bounces-23137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7476BE2D1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4705484A50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B031C328605;
	Thu, 16 Oct 2025 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LQ85WnW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E03328606;
	Thu, 16 Oct 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609479; cv=none; b=OouLRU0+FnE5p7ppwVtA/nPPHxZUhZ4MJXJq7bt35QShsr7ncTOCVMdZF9B+Bg+3OAfoDm2xSTqLnmhEOUnfADMGkxvk7Ls5ZXGQZjC/TcOpv3bWjw3flJdtYkLsb1MY/r1FUN2K2e/sbCP3ssDqRMauCVDIErY+J/+eU/DlF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609479; c=relaxed/simple;
	bh=uuvrRixyRF8v8fGyJZjVR1ZFEWMRtA/GPhl+xl8CvVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3VBhFJbRKUiRLgjVK4UcjYN0ZarLdh7mKOrL8O/O2t0DmmEha8oRHxDqv6Tkb8sn6WqdRh91qoWBXAr1AfJVtwwlLLI6I1+UwEPIOCYXNIqcmVXXfk5LuHtFF8xsax6yzp0Seq0CpTix3l+CFZU/tpk2jCgr5wRBrV3IDMlU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LQ85WnW/; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNyT6mbXz9snK;
	Thu, 16 Oct 2025 12:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760609474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XEkHO0Qp+G5qiHbC61D2twuNKFoICnhB602ktEQ9pg=;
	b=LQ85WnW/giG/wNYUMGjaCpnEWsvmiu3le36bj7e1dlLUvFaY5qdXIN78mHJ+zGuk3IApJ7
	dAx9mklKSK0MAA4YwN5NocvIlPI7q86NbDz86wW/5xL389vr9hCOVqmn6MMfvN+mJ/b1tr
	HSE2bhtI9wtL0aMUfA/Yvr+avuxDSzXSHxMOPN/Xb/ZkkQwBATiflC92Lo18bJBBuLnLzQ
	8kRf2J/NMOX/JyC7UxwSL7SjW5WNBG+Z24M+Nyqwuo/u+zE+pBfbRbQr8SsMHyZMrfs+9+
	C3vFDd4YGvfPv7iyPn3m/N5zME1AT9wlfITX2w3GbLiGbHQ6CcpLW0TbIK1a+A==
Message-ID: <921ac611-63b0-460b-86b5-67340eeb5dba@mailbox.org>
Date: Thu, 16 Oct 2025 11:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
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
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
 <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
 <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e2d7ddbfc98dbd254b
X-MBO-RS-META: 48n3zgsbymmnn5ca9mfuipkjb6dxnd4w

On 10/16/25 10:48 AM, Matt Coster wrote:

Hello Matt,

>>> Would you mind splitting this conditional block up? We already have a
>>> constraint for 2 power-domains (see img,img-bxs-4-64), which should be
>>> applied to the entire img,img-gx6250 compatible.
>>
>> I will add a patch into V3 which splits the allOf section up such,
>> that clocks and power-domains limits are limited separately. That will
>> make this addition of GX6250 easy.
>>
>>> As for the clocks, for the currently supported GPUs, we have "mem" and
>>> "sys" clocks that are optional at integration time, so those
>>> conditionals are based on the vendor compatible strings (ti,... etc).
>>> However, these older GPUs always require all three clocks, so it
>>> probably makes sense to create the properties:clock{,-name}s:minItems:3
>>> constraint on the img,img-gx6250 compatible as well, rather than the
>>> renesas,r8... ones.
>>
>> OK
>>
>>> You shouldn't need to explicit list the power-domain descriptions at the
>>> constraint level at all; if there's a build warning that they're missing
>>> I guess the correct place to add them would be on the top-level
>>> power-domains entry, but I don't really think they contribute anything
>>> meaningful.
>> The descriptions basically emulate minItems/maxItems: 2 here. I can
>> also just set minItems:2 ?
> 
> I think that's probably much cleaner! We can add maxItems:2 back in
> later if/when we add additional power domains at the top level.

OK, will do.

>> I have one more question -- does GX6250 _always_ have two power
>> domains, i.e. the constrains always set minItems:2 for
>> "img,img-gx6250" "power-domains" property ?
> 
> Yes, that's correct. All PowerVR GPUs have the number of power domains
> defined in the IP. Even where the SoC does not expose control of these
> to the OS, the GPU still communicates with the SoC power controller
> directly to gate them on and off during normal operation.
Understood, thank you for the clarification.

