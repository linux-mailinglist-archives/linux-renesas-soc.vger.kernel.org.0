Return-Path: <linux-renesas-soc+bounces-19373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE5AFC7FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9367F18974EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 10:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F295268690;
	Tue,  8 Jul 2025 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FpJd+aRR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC221FF51
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969403; cv=none; b=PLgxbblFSdZTt3qqYbmaFwuCOiS3mLS2wuNexiWVNRKeCbB/Xk1Yv02NVELKtsGLENsVRlasjwiIyJMyvZRNYCKchJ2/ZAJ7X01ee8H4aqs+9QdkU2OA27GcSNafY4zcj04hzs5FmO1LKc+ZRF+TIu0eFAnjXWgNNJMOaLKP+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969403; c=relaxed/simple;
	bh=47O6nAGkTl4F+LjVK4KzSkuF78FXCIFg8NWc0TWYEJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzWU4BAmiujUACOCZ6qlO+J2Y6+cYEyYNFWvvNWULbJU9f6aX07U8Fhnmv7OEWIDG17ju53woul/8OK+yNMUs9hIsbKGe19kWaBYOLR7xGl95i5V8J5kophDAPSyKG7V9ROfKcrZS6HfCC6p5lLAvOJex8ShyTDu8YB/Lek4sOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FpJd+aRR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so881474766b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jul 2025 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751969398; x=1752574198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=FpJd+aRRb1it8uGgFDuY0XeugoGH9+Xt8YLCtgSGvAG9ttAdIiF6uTEQDfV2vJt7pF
         saS4jmFqJQgGfBAcYzMAuCSTyeJufjPSAKbukbKLwp0qRzoEfRZLDxXSCT67yvKKuZPe
         WyRiz67d4dZPVTXwIZBmqYRMJqhH82gCHwxRHywXE8tZEP3m6Aaq6Qm/ffcZSFJI4HOw
         IN9N5kR/UrRAwUhV+x2QQO2jo4bt4H88JL/nAETv+t59F9B8Wz3jd1W9w21UCZZkUtmO
         nlIj+NTkhLtlvVIup1M1bUoAQcFfQ/9CLcp2NgLe0nPXqUbuA9FLNxm6d+zS/dX7X6gF
         uL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969398; x=1752574198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wW9jD4nttc2FFz4tK+x1u/l3hcsbPGY6bGVXePrYDv4=;
        b=LqWc02XtDj+BZobH2cwlz5faHM5A12S3ckvePxsbBsDzGmjCuUhDHvMe59uCLiaA+d
         oGquHTmUgrqdveTQ4aP58V6Bg+srsxbYzCjX7zbTy2oYxD3HpayNP4JQyE7d/wr9Dq18
         GpD+qR+tyz4YfMNW0T6CoIJgA/u5rbwX4rtkQxh1NSiWTxm7flHEiBs8Q3b5lQ9kijUP
         f2vjShUTysHw/TOqr6Vgi6q7vhHoPpm5Z4fYqhD6ovIxqWvOJCc+fvH3Qyhsg/OipWal
         dJ4M/dNWjp93lNiOjmpZWi6bETan8oCLVntEELGTPkYRNJ5lFBg7Up0ejz0paFtT5/n9
         ymZg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ztgQGgQXRqy1tZcnnRq+2zPyuLXHQBvYQcUERtopFMDU8uDaclKfpGx2ZYygSk8jes53AnVfx593PKJ8T7EFMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJINkUgkq8xxyySb40GAlYg8V2YkClsH1E0By8FE0YArCkHbv
	vDnXgYwjnODx4a4UDYDNdo9p0SpxjwNuZY1fookuKQmZyPkRF0ntPAVHBog6hLXmJyM=
X-Gm-Gg: ASbGncvjQQ/u88sGPpVcU503gYlqzQ0OaKLw+jHqUttH9hEug8DY0HVOGXoaHFrkGo7
	+ZOl5wUEqAHKjUf94GtK/yVh2dQ/0ZK4sDGLNxpk7SzzieKLhS+RndR/vY7mIucyf/oNjbGe1PO
	mAaPeglcfL1imxO8bRfVOX9NYICXG4w0Q0WQFKnWK08R58vtEvJ3g6ppY6KtAFaEjNDC+nw1lqn
	ABXaBoAzqywPYoofxot6WUXFqSxDmPS8/aUYyUbXhfxuLbZZORg4xa4HyY1hd0C0gCVuRFl9ppE
	onWAKW5sr4TAk+pm/LIHa4q9Cb0xAo/DnKwfpGseUGiNEZz20a86sEEhXxnV1GhVX2kjqw==
X-Google-Smtp-Source: AGHT+IFDhnpFLf+9SokY6ajJmYa0R4eHOoHCTd+GxI/yEq5DE0Ci4xD7oIth8WUim7upiSOwhgaH5Q==
X-Received: by 2002:a17:907:1c26:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae3fe5c28d7mr1545563166b.22.1751969397715;
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d931csm875767566b.10.2025.07.08.03.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:09:57 -0700 (PDT)
Message-ID: <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev>
Date: Tue, 8 Jul 2025 13:09:55 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "lizhi.hou@amd.com" <lizhi.hou@amd.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 07.07.2025 11:18, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 04 July 2025 17:14
>> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Update the PCIe dma-ranges property to reflect this.
> 
> I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
> Do we need to make board specific as well there?

I'm not familiar with R-Car, but if there are ranges reserved for other
purposes, I think we should reflect it in board specific device trees.

But that would have to be address though a different series as it has
nothing to do with enabling the RZ/G3S PCIe support.

Thank you,
Claudiu

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r8a774e1.dtsi?h=next-20250704#n2487
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/salvator-common.dtsi?h=next-20250704
> 
> Cheers,
> Biju
> 
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none, this patch is new
>>
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-
>> smarc-som.dtsi
>> index 39845faec894..1b03820a6f02 100644
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,11 @@ &sdhi2 {
>>  };
>>  #endif
>>
>> +&pcie {
>> +	/* First 128MB is reserved for secure area. */
>> +	dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>; };
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>  	eth0-phy-irq-hog {
>> --
>> 2.43.0
>>
> 


