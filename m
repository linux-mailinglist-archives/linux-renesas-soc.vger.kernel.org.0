Return-Path: <linux-renesas-soc+bounces-8654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC484969E79
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 14:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736D42819E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 12:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D4A1A7241;
	Tue,  3 Sep 2024 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P+LbduX/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E831CA6B6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368239; cv=none; b=MG+3cYrBeB3eevzSt0LNxCqYcbdtCpWHy+CGuogg9ToSGRZGM3qBNoNZNZCil+R7COrLYuJZ8p5PktASvBsLD3I6ejtmc53Vk80kEEk8rNdQX5OOjzr/mzfGDT2AXtCDmMF+tfeq6yAsHiRwuaunw4/7FlPMb/ZYn0MKbXjjPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368239; c=relaxed/simple;
	bh=Cso/wpl/yeMkWTb7DkdYbxAtmVl36+WAAEZqRrLLhr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgotT//X6fCQMPtiksxGC6InJVGt7/n3VAnbaZB6dcT1U2v49eSRAz4LvGTRJ5IuHFIL84IofFvXkL3ZUw8lFqw52Xy0VrP+3HXEzzO7q7W41uZ/FT1jYx84MtGpnikI2RF44/4I22hucusHc/gAOcC98A3KVdFOtKGWG+pqtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P+LbduX/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a86abbd68ffso873995766b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725368236; x=1725973036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p5yg7eSpfkF7KfEUeaswPPeaoWpvFoniZltR7IGrLo=;
        b=P+LbduX/4blADViUq5pJ3RS8Fo7Vwkw4jhVHAN+nQsSJqwPxv5HdaIGaHl/zIj3WVR
         NdfeNLSXiyFFsLzJHdomGi1zKjdwJkdTu1fy6qJ88EaBId7FURsM0m7cFIdgWRnkznFM
         jqtLNuWI9rYRzzg3PxltYxF4QFTV3eZrwtVh8n4QEJ56G1o+ZpgwxkeQOEaGGmlBGLxQ
         gtqKi4913YBUbpVj1h/YDjZ3R1zAKUuECWG59+N8e1EK28PNx1NNxCQjysKZ1o1z7uR2
         6nOzjkS/IRa3pGXlRpXun+YCSRWJxXLzfeuaiI5VRCYpbY8sfyNELG4Ti0BdlyjfQvt7
         fIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368236; x=1725973036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p5yg7eSpfkF7KfEUeaswPPeaoWpvFoniZltR7IGrLo=;
        b=sSuMU3WDJTv1/9YFu+ODLhcA5HsF2DjSnIAUZo+lBlePi9QicJtbBQSVrR9n+LnJF6
         i3ZmKuJNIRwb+vEDqhBEwxq4NHoi8m34OOH2FUfdNOGKNHTybJzT3dn3fsiKTRHyNuhv
         xQpaHowi85ixxzh7wLZJ5rmr1Ws3kWRcel6kPspi2DexDRQEzdW+j5wusq9mi36TvbLL
         8jq3yh8WUEt45vX/j4G1MpmbLtag8gRhxd9uHg6n0dW76AMAmp8HTne5sW8HXnHoACbL
         mSCOmR8WcfY36U9nvx/A+QWic9mSPCApI/Nhflpeuvo9SLRqmGiRmsry2o1imP/8ervY
         EGfg==
X-Forwarded-Encrypted: i=1; AJvYcCVPFaqbL7XUe+N/fwmq4X+5bsqBiJSC4dQ81KagvQV/R8a8sK1YMBzwX8vpBb0ml1mzhn2vDKU8HOKrluA/5O6KVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAfzfOMJinxe1KnG7Qg+C/OzWN4QPLZearnOhaJSu3gAK0MSv
	fAfdk+HqfVkGH8fniSJdDBOFVsQh6pzgYb2AQ+cIv5G4fbsmQc8gpxrptWUCjz0=
X-Google-Smtp-Source: AGHT+IHZXUf4gCvoTnaido/Qhn8cqkw+YBP7i7FYjIQcDtkx87EhKcdM6qoGHvRSR0AuY4uEo+anoQ==
X-Received: by 2002:a17:907:7248:b0:a77:ca3b:996c with SMTP id a640c23a62f3a-a89a267a567mr1608923766b.16.1725368235772;
        Tue, 03 Sep 2024 05:57:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb31fsm690077166b.17.2024.09.03.05.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 05:57:15 -0700 (PDT)
Message-ID: <5bcdc677-e61e-4312-a19b-57b4600685d3@tuxon.dev>
Date: Tue, 3 Sep 2024 15:57:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
 "kishon@kernel.org" <kishon@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464D53083F4C8A5DBBA36586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <590a4fb2-24b2-432b-92db-534c5a52ed0b@tuxon.dev>
 <TY3PR01MB11346505565B81AD2894E035586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <35dc7414-f5bd-4ed4-bfa1-f723f4f0078c@tuxon.dev>
 <TY3PR01MB11346A4814F83FE296A1DED8886922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134648BF51F1B52BFE34DD6D86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <fbfa9179-2f52-429f-8b69-f7f4064e796b@tuxon.dev>
 <TYCPR01MB11332EF1A8D064C491D8F261286932@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <f7c57e76-b890-491f-880d-62d060b7b31e@tuxon.dev>
 <TYCPR01MB11332BE2EDB318950B9C7B54C86932@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469FC8A9F49D9B1FA432FD86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0b73544b-0253-43b9-b631-6578b48eaca8@tuxon.dev>
 <TY3PR01MB1134689573A785E91A9041E1886932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134689573A785E91A9041E1886932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.09.2024 15:37, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, September 3, 2024 1:26 PM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> p.zabel@pengutronix.de; geert+renesas@glider.be; magnus.damm@gmail.com; gregkh@linuxfoundation.org;
>> mturquette@baylibre.com; sboyd@kernel.org; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>;
>> linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> renesas-soc@vger.kernel.org; linux-usb@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> clk@vger.kernel.org; linux-pm@vger.kernel.org; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
>>
>>
>>
>> On 03.09.2024 15:00, Biju Das wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>> Sent: Tuesday, September 3, 2024 12:07 PM
>>>> To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>; Ulf Hansson
>>>> <ulf.hansson@linaro.org>
>>>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>>>> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de;
>>>> geert+renesas@glider.be; magnus.damm@gmail.com;
>>>> gregkh@linuxfoundation.org; mturquette@baylibre.com;
>>>> sboyd@kernel.org; Yoshihiro Shimoda
>>>> <yoshihiro.shimoda.uh@renesas.com>;
>>>> linux-phy@lists.infradead.org; devicetree@vger.kernel.org;
>>>> linux-kernel@vger.kernel.org; linux- renesas-soc@vger.kernel.org;
>>>> linux-usb@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux- clk@vger.kernel.org; linux-pm@vger.kernel.org; Claudiu Beznea
>>>> <claudiu.beznea.uj@bp.renesas.com>
>>>> Subject: RE: [PATCH 00/16] Add initial USB support for the Renesas
>>>> RZ/G3S SoC
>>>>
>>>> Hi Claudiu,
>>>>
>>>>> -----Original Message-----
>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>> Sent: Tuesday, September 3, 2024 12:00 PM
>>>>> Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas
>>>>> RZ/G3S SoC
>>>>>
>>>>>
>>>>>
>>>>> On 03.09.2024 13:31, Biju Das wrote:
>>>>>>>> During boot clr USB PWR READY signal in TF-A.
>>>>>>>> STR case, suspend set USB PWR READY signal in TF-A.
>>>>>>>> STR case, resume clr USB PWR READY signal in TF-A.
>>>>>>> As I said previously, it can be done in different ways. My point
>>>>>>> was to let Linux set what it needs for all it's devices to work. I
>>>>>>> think the way to go forward is a
>>>>> maintainer decision.
>>>>>>
>>>>>> I agree, there can be n number of solution for a problem.
>>>>>>
>>>>>> Since you modelled system state signal (USB PWRRDY) as reset
>>>>>> control signal, it is reset/DT maintainer's decision to say the
>>>>>> final word whether this signal fits in reset
>>>>> system framework or not?
>>>>>
>>>>> I was thinking:
>>>>> 1/ Geert would be the best to say if he considers it OK to handle this
>>>>>    in Linux
>>>>
>>>> I agree Geert is the right person for taking SYSTEM decisions, since
>>>> the signal is used only during state transitions (Table 41.6.4 AWO to
>>>> ALL_ON and 41.6.3 ALL_ON to AWO)
>>>
>>> One more info, as per [1], this USB PWRRDY signal setting to be before Linux kernel boots.
>>
>> The "controlled by" column mentions CA-55 on PWRRDY signal control line and it is b/w steps "DDR exits
>> from retention mode" and  "clock start settings for system bus and peripheral modules". AFAICT, after
>> DDR exists retention mode Linux is ready to run.
> 
> DDR retention exit happens in TF-A and it jumps into reset code where it executes BL2 in TF_A. Bl2 checks for warm or cold reset.
> If it is warm reset, it sets required minimal clocks/resets and pass the control to linux by calling the
> SMC callback handler. Which in turn calls resume(step 11-->14) path.

Is this from HW manual or some specific documentation? I'm referring at
"resume" == "steps 11-->14"

> 
> Step 8, Cortex-A55 Exit from DDR retention mode (when using) Setting for exiting form DDR retention mode
> Step 9, Cortex-A55 USB PHY PWRRDY signal control (if use USB) SYS_USB_PWRRDY
> Step 10, Cortex-A55 PCIe RST_RSM_B signal control (if use PCIe) SYS_PCIE_RST_RSM_B

Note *if use*: how does the TF-A know if USB/PCIe is used by Linux? The
documentation mention to set it *if use*. Same note is on ALL_ON to VBATT
transition documentation (namely "if using USB", "if using PCIe"). If TF-A
will do this it should set this signals unconditionally. It will not be
something wrong though. We don't know at the moment what this involves in
terms of power consumption, if it means something...

> Step 11, Cortex-A55 Clock start setting for system bus and desired peripheral modules in PD_ISOVCC CPG_CLKON_***ep 
> (***: GIC600, MHU, SDHI, USB, ETH, DDR, PCI,AXI_COM_BUS, PERI_COM, AXI_TZCDDR,
> OTFDE_DDR)
> Step 12, Cortex-A55 Release reset setting for system bus and desired peripheral modules in PD_ISOVCC CPG_RST_***
> (***: GIC600, MHU, SDHI, USB, ETH, DDR, PCI, AXI_COM_BUS, PERI_COM, AXI_TZCDDR,OTFDE_DDR)
> Step 13, Cortex-A55 Release MSTOP bit for system bus and desired peripheral modules in PD_ISOVCC CPG_BUS_***_MSTOP
> (***: ACPU, PERI_COM, PERI_DDR, TZCDDR),
> CPG_MHU_MSTOP.
> Step14) Cortex-A55 Clock start setting and reset release setting for Cortex-M33_FPU (if use Cortex-M33_FPU)
> CPG_CLKON_CM33, CPG_RST_CM33
> 
> Cheers,
> Biju

