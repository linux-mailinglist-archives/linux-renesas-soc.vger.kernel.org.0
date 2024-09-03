Return-Path: <linux-renesas-soc+bounces-8652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B6969D6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 14:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 009711C2390A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 12:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50E81C986E;
	Tue,  3 Sep 2024 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ba6EToGn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC71C984F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366361; cv=none; b=PbrhM1K8d5MRG6ewUPu6qe4bRcYZzWB+i1tliz8V4mAvqJmvZXWY59KhKoODS1H8EepemiZeEollzlH4HDY3btKD4iSrH/0d5JHXtuRx4SnnJXp1oNd6mCryzFpIimkAURqblh9xwokqmfnTt/HkmYAHP4En++EAyti/uNuBGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366361; c=relaxed/simple;
	bh=a0Dd4JWmM7haDwR0iXBE1kfomv0PSlhhIKArOk1RZzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nImq6Y13jXxcFyhattodTcK35gIrfrqZhoni8ZkCTvB10xQcvnETyWIDGVYcsbLu5oRSSo3OUft3WLEOb5sV7SnjUsi3m+VzS4qGosq+32v0/VspXXfWinG9XMO6Xp7hOsYM2WWmP8VHfrn9hPjIkBt5gH2K25BFaPEAs/6TVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ba6EToGn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c26b5f1ea6so979287a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725366358; x=1725971158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cdIRXo5VTqWR2KdDzO1DTS+Vt8PiHUf2RGCvnaGFsQ=;
        b=ba6EToGnZTcjtlxOZnx4KqVxMNNTjMd9eK/EiS3OXuLybDIRe/EAOXmxjOAyakw0qL
         Y4TUlOKJEv4sKlfLgwyBCBSCoGYrLNIRgYT0R3Zpj39eTIylWHzinbHFa/6hmWuKU6sZ
         KMaCSCvyFLzagyJKL+yjieGzCBVbu09BMr3FnJtbyAyKh0TTGhTkg/EErV63OnZPli8b
         TIhWCDyBFFHHc3H0DQALOhttviHm2xd/Fsf4XYgTaP6lPdfr7YZVZPJ2hVBH54xYe/Vt
         /9XBaakV8wZuG7WtCMeRTrQ8YWgAoDUypyOU2Ye/JIZpkQbnG284zwgT7dm4RFT/JNSv
         vrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725366358; x=1725971158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+cdIRXo5VTqWR2KdDzO1DTS+Vt8PiHUf2RGCvnaGFsQ=;
        b=T5JQUoqGCSNXwNMJA3CWA191w5ECUN5rELIPexo8+/Z3Uimd5jXdkvm0cvB20n1Wjj
         TwOAfPRQecS0N67nV7BgcmKoqSQdigBH39BjfgMFISg8M1DpLNS+2noDj3Qt9d6azDF3
         YP1dzbdJA0n9/aR4YkGHD9ZvYey9HTDFq6DLy2iFDqqmZjQ9SbtzO0nhZMfrUsJKVNuw
         mE1cZbbaKig78vowqt6TTNatnJFI3flPlsdWtVzybrWMwBPNMRmf6YDRPlh/D6QIQXJt
         WXRIil6BZQYmeGocHpjbAC9x163s68HHQ/ZRWfzfowl78ZJqs34b8vxkV4YCJPMVDXJh
         msZA==
X-Forwarded-Encrypted: i=1; AJvYcCXaZmdIyRGAE+2SoKztg8FlTR32L6YvcQWA5DLZdYfSTHDMBr2Aa+NkJU4G5ND8zz7wuMp8+DUnF66+cy+A4VIi1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMx8ZJIF3m+sNbAlayKayHgH7KzOp9jhEXUkMnDV7RljbZMB9
	uTLQvraF0j2AjWlKEOkSHwYtQAX+X9FB4KBCYT2ye3hC5bNNCnE6MBGZ5nF/2yI=
X-Google-Smtp-Source: AGHT+IGCJSAfsQxh53LJgcY+qGaZ+a7jTX6q5V6OFCLQvyiQ7yrxNllyp0cepO9Zz23djK5zaAK9PQ==
X-Received: by 2002:a05:6402:4310:b0:5a2:2654:7fc4 with SMTP id 4fb4d7f45d1cf-5c25c3a717amr5389144a12.8.1725366357788;
        Tue, 03 Sep 2024 05:25:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a3cdsm6412278a12.12.2024.09.03.05.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 05:25:57 -0700 (PDT)
Message-ID: <0b73544b-0253-43b9-b631-6578b48eaca8@tuxon.dev>
Date: Tue, 3 Sep 2024 15:25:55 +0300
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
 <TY3PR01MB113467275C519B729FCAB1ACB86922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5556d176-cca7-492c-ba21-48256d5d6338@tuxon.dev>
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113469FC8A9F49D9B1FA432FD86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.09.2024 15:00, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Biju Das <biju.das.jz@bp.renesas.com>
>> Sent: Tuesday, September 3, 2024 12:07 PM
>> To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>; Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> p.zabel@pengutronix.de; geert+renesas@glider.be; magnus.damm@gmail.com; gregkh@linuxfoundation.org;
>> mturquette@baylibre.com; sboyd@kernel.org; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>;
>> linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> renesas-soc@vger.kernel.org; linux-usb@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> clk@vger.kernel.org; linux-pm@vger.kernel.org; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Subject: RE: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
>>
>> Hi Claudiu,
>>
>>> -----Original Message-----
>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>> Sent: Tuesday, September 3, 2024 12:00 PM
>>> Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas
>>> RZ/G3S SoC
>>>
>>>
>>>
>>> On 03.09.2024 13:31, Biju Das wrote:
>>>>>> During boot clr USB PWR READY signal in TF-A.
>>>>>> STR case, suspend set USB PWR READY signal in TF-A.
>>>>>> STR case, resume clr USB PWR READY signal in TF-A.
>>>>> As I said previously, it can be done in different ways. My point
>>>>> was to let Linux set what it needs for all it's devices to work. I
>>>>> think the way to go forward is a
>>> maintainer decision.
>>>>
>>>> I agree, there can be n number of solution for a problem.
>>>>
>>>> Since you modelled system state signal (USB PWRRDY) as reset control
>>>> signal, it is reset/DT maintainer's decision to say the final word
>>>> whether this signal fits in reset
>>> system framework or not?
>>>
>>> I was thinking:
>>> 1/ Geert would be the best to say if he considers it OK to handle this
>>>    in Linux
>>
>> I agree Geert is the right person for taking SYSTEM decisions, since the signal is used only during
>> state transitions (Table 41.6.4 AWO to ALL_ON and 41.6.3 ALL_ON to AWO)
> 
> One more info, as per [1], this USB PWRRDY signal setting to be before Linux kernel boots.

The "controlled by" column mentions CA-55 on PWRRDY signal control line and
it is b/w steps "DDR exits from retention mode" and  "clock start settings
for system bus and peripheral modules". AFAICT, after DDR exists retention
mode Linux is ready to run.

E.g. on resume Linux doesn't sets the clocks of all peripheral in sequence
and then runs the rest of settings for each peripheral, in turn it sets the
clock of one peripheral along with all the other necessary peripheral
settings and then continues with the rest of peripherals (including their
clocks).

> 
> All clocks/reset happens after setting USB PWRRDY signal
> 
> https://pasteboard.co/qbz021q7KPyi.png
> 
> Cheers,
> Biju

