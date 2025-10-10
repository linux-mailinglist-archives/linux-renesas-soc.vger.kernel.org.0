Return-Path: <linux-renesas-soc+bounces-22886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87EBCCB90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 13:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9301E4211FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEFC2475CD;
	Fri, 10 Oct 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HkdIYMHc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BEA18872A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095067; cv=none; b=X5pVW3B3fc95XqDDY8iIPxTHOKqcc73L9hqYVjTJNqvcKlDvYOPYht/UDArcYB4OFXCWrtCrPWppp9ODlMHAnDNFFiwPNh9WAaFsWKSIx72fue7ygvo9L3j1v6tMHf/DRP5x5FUEYVGOAVA/r+gJcBOiO19oHkMtSeTdv1i7k2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095067; c=relaxed/simple;
	bh=KtxlDWPITa5bEuPFEGshMtxcyISVp2BcGqrMhLFKkYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzjjF9RaQL4TWVXkBPRI5CfPDxTl8EbfXn3+QovXOSj+e/Ik89Hrzx5EpQru2zV7U656DHngp/nFFIAQvVs+IAwX0ZzHLVUQi2J6bZGZt3PaD7xOMNNotn0L2yA0xF3cTLIpuCGLpo+H0VZ1LNsWnqzABVCij2FxysjtMu5VKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HkdIYMHc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1675243f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760095063; x=1760699863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1ynCVq0m0dwKkBAOEoWpD+qF9QKRnUMUdTWsdSWb50=;
        b=HkdIYMHcIQE398WdTPSIN5Mm+cZJxgxezu+A+N6RoJNwlZqQIMKxAdWDPNWw5nPs8H
         OU76CojdVbYGD9cW4il7ZeB2s32ErVc/NVQCP1Hg9YwqhyWFCUQzjbzrsaBlJE2XaPZh
         bzfzQn/aVQxhxM7ckFcWzEHAdyo8jI8Lt1ESDmjW9fJQc0wvTq+DH0tEfq3bUywmo613
         4b7xDsCOg9cR3P8lsWw7TaotIti2Z0fnyL7+++XT1L7nqlozzNwf6qKkzjjNO6IK8FyS
         jAg2aMXsyBuQQeUBsiNl19BgvgabDWMUbBlY6dARm5mtnVaJ8paoVPmxNHI5qQr74cx6
         B2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095063; x=1760699863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1ynCVq0m0dwKkBAOEoWpD+qF9QKRnUMUdTWsdSWb50=;
        b=CQBvRs5Fl8cKpqV+43ECqaDwWQyYuBSvB0kvczMGP8r9DnzU/pvcgkXa32+hasMCnM
         GQylZEP0zr9RqgHJ5WloiE/42AqBfGOtSsUBxLXTrEZBIYHE1RbVwhDvFHFo3peJqkQT
         4eDulWSp+7yYiczPvgDIal2N2lHF7nWO2ziihHVObQ4c8rF7WF7ljFS39u94rPARrc8q
         RV66diZm4vMCaTd6d2caGyyo+OKolON7YkvhkfDqlAJGYBfJVdGSKdyiu3uE+KvXx6YQ
         E1wokU0SAErkQhGXTbi6dGM2MyNw2jWQfjdleLdjwxTHAJDC3KM3g25kFAATAAi4O9gX
         8jbw==
X-Forwarded-Encrypted: i=1; AJvYcCVl/Gq9rYD42FL54LovqGOjTgNQfs7Eq4yY4YnKDy8srCJS+T62dzpZ5ftqcdb4NCbM9UnWD7AD8Xo4eCkvdh256A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MlY7Plv01mBgAp4djlox+Aco4HH4QUO80jmNQA1mKNjTz+BS
	4LVX9nX5EE/ol8ZzohKqMYymW//i56vdtN4aPv+pW4Y3Cz6GNzvg1UJ/QzXQ67acdcA=
X-Gm-Gg: ASbGncsxfsofcU4bYlLe11dcMNlNXOd9oqHUM7pUYfiWOvCCEW0moYqbr6wRcfd1YiS
	pInllPR3SWapbcjMN3Z7JnpNOc6GX7QxeVi7Imz1dq9rlbyof484LYY29RdR3Htyhw7Li0aGh+Z
	33UbOrJCSGG8hVac0qaGp+KDZRw6ev6DjZ5NC7crELZzCzvpPqkjdzqyZCjEGwLCyjyncGSDm0y
	EIpG1++fv1XeMqKfDFHGppfDCYTyd/w/Np0q6Dd7sLXDq2O9zOHZcgc9Xb/EhN61VviynuPRBgH
	pP2+sp4FaiDd/HcO20kw9evTFK6egdq/lBNj3e1MAQzhFQhre6nxNuEh+H5liirStQ4nwjsBbqS
	aUE6hPzlqH04D3vE8L8JemFx0hb7tVR9gMqEKD1eNPoC5asez
X-Google-Smtp-Source: AGHT+IEJyJwckoO/p0aVyGWvU5k2OM0lgE0S2o7VC0t5p2sDg5hRPW4SnUamM22kpxYfehRCibmZsA==
X-Received: by 2002:a5d:5d88:0:b0:401:70eb:eec7 with SMTP id ffacd0b85a97d-4266e8dc113mr7191302f8f.43.1760095063534;
        Fri, 10 Oct 2025 04:17:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489ac60sm42166215e9.16.2025.10.10.04.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 04:17:43 -0700 (PDT)
Message-ID: <7848e331-3d32-42ee-a05f-66ab40ef00be@tuxon.dev>
Date: Fri, 10 Oct 2025 14:17:41 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
 <20251007133657.390523-4-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113461AF51BD346E1D96E43B486E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113461AF51BD346E1D96E43B486E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 10/7/25 16:44, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 07 October 2025 14:37
>> Subject: [PATCH v5 3/6] arm64: dts: renesas: r9a08g045: Add PCIe node
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/G3S SoC has a variant (R9A08G045S33) which supports PCIe. Add the PCIe node.
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v5:
>> - updated the last part of ranges and dma-ranges
>> - collected tags
>>
>> Changes in v4:
>> - moved the node to r9a08g045.dtsi
>> - dropped the "s33" from the compatible string
>> - added port node
>> - re-ordered properties to have them grouped together
>>
>> Changes in v3:
>> - collected tags
>> - changed the ranges flags
>>
>> Changes in v2:
>> - updated the dma-ranges to reflect the SoC capability; added a
>>   comment about it.
>> - updated clock-names, interrupt names
>> - dropped legacy-interrupt-controller node
>> - added interrupt-controller property
>> - moved renesas,sysc at the end of the node to comply with
>>   DT coding style
>>
>>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 66 ++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> index 16e6ac614417..00b43377877e 100644
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -717,6 +717,72 @@ eth1: ethernet@11c40000 {
>>  			status = "disabled";
>>  		};
>>
>> +		pcie: pcie@11e40000 {
>> +			compatible = "renesas,r9a08g045-pcie";
>> +			reg = <0 0x11e40000 0 0x10000>;
>> +			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
>> +			/* Map all possible DRAM ranges (4 GB). */
>> +			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
> 
> On RZ/G3E, HW manual mentions PCIe can access up to a 36-bit address space (access to DDR and PCIE0).
> 
> Not sure about RZ/G3S?

As of my knowledge/investigation, according to chapter 5.4.2.1 34-Bit
Address Space Access of HW manual, revision 1.10, on RZ/G3S there are some
bus masters that can access up to 34-bit address space, these being
SDHI/eMMC, GEthernet, USB2.0, DMAC. The rest can access up to 32-bit
address space.

Thank you,
Claudiu

