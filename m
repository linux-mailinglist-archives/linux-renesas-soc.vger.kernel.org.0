Return-Path: <linux-renesas-soc+bounces-8646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E134969B09
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 13:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD3D61F244AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799651A0BE4;
	Tue,  3 Sep 2024 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dV7Hjoa7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F419F428
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361221; cv=none; b=G2Gzhh/jD1xoAwPi7hEybBa2wythoy9cZMd6wXSx0vD3Ec5WXg1HUgjtCmAY/WhaJjWCsdhjnXIeXgDlbnQt5HAPc5CLaE61eraQcIjaUs3sraOYq9DHhrSkDjH98gqruTmo2N4BmOPvPsOzzpD0BeEJYdxksdudWwV1g80spW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361221; c=relaxed/simple;
	bh=UO59GE3YEI54l2X9UqluH/rG/n6+zP+/1w4DtVlLAko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8XRAXtafE1ifVkhDMP4wZ2Ramr2jJ4QkEndfzz97IexKUER8CjC7q9HwxdPYKERXnXOj88HuolTG0MKZccBSHNzrhlwYRUL6z+QL1z+T3hKEnNaj5JqB0XOwXXrTy1ai1OZRl1xvvb3DbZAvd3KKuFp0G1BwCsmVn69xU7kEgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dV7Hjoa7; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-498c64c6833so1482538137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725361219; x=1725966019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35ye01cj8maiCra/xx+0mtB7wu3vvnw0f4Z2moOlFvQ=;
        b=dV7Hjoa7hcn4Bi10kS3fC+RsXSppCHUWtf/uAGDstzJaZ67MYnss4gONKptlnGhiMU
         WQPzkj+67/l+otEs+s3g91gkIZs8ZQF0NxHKVZDUrn786hhc7GhpJnIuKRQJwjUWp3Q3
         J/X2MKcVaAo8USyMDbbmdcPOq2MR0kSpMNs2ZBCTzfrf87b9X2BhRE3T01RLotfcmQPe
         WOD67Gxadqx3PR9hgqFyCDlXtnvTmUO+jKamTztd1dO43yDgOcyOuuveXDQmBWPBSI7q
         LUuRWc0O4dSlxGGtwUu0ywc2FdoQg2nCZ/DSIRsLB09+weLmuPZZf0yjxuOLyQzg2A7A
         CtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361219; x=1725966019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35ye01cj8maiCra/xx+0mtB7wu3vvnw0f4Z2moOlFvQ=;
        b=qBPd3RoJeQu7ZYHxw1E76eKGKjkxEhrRgu2IHIkH2yhU8uLH/4TTtypBHZlfQGB7R/
         JyAa0zI31JvIevyVaDOEKN3E3SdlpLTKEeHLwNUb7zzBmw+kn8Zl2Z7V9xLbul+pUodG
         wEzye0B3OMn7X6h+4pJ5MtOdOCErI3j4bKN31lxJ8uH9WcgIrHtEacBWwZQMXZugq8+o
         Y/hPgMXWmeB7dO+g5m4KhXM2AkptV8cwkYSfXvQdUlHWXqCWklB9iGPqOK7jA/OO/JoE
         tzJV9L/SZ6OLiKmEWabSFtk+T+burh/MHFR+f8GuoZtvzeoLILWIMbGsS9UPKR6DI+Sb
         jtTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+JFrgo338erUUfJBWssGi29SReNeaZzfX5n4rhEkX99JguyBEnuuGopOk9xsaxMYBUcvmyaqXIdEVv1kJZoHlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZksQAYzUFALYbE3sYW+eIqrjiv2L2V+RGGZIvtMMPYoVgQBAG
	kthhhL3Gf9IP/avH2FTmOnS9V2Dhwdw92H8ifeIkMD6A8qChfd7C5xu/PNwfbWg=
X-Google-Smtp-Source: AGHT+IEyWkWxB3kdP1wMXyn+HAeVNB8ptUkhduOrIrlTeYDpqYQo7fk5GbJaIlaHBt5fb9HAnogEug==
X-Received: by 2002:a05:6102:3ecc:b0:492:9927:a5c6 with SMTP id ada2fe7eead31-49a778b6632mr12051931137.12.1725361218664;
        Tue, 03 Sep 2024 04:00:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d87633sm507928685a.136.2024.09.03.04.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 04:00:18 -0700 (PDT)
Message-ID: <f7c57e76-b890-491f-880d-62d060b7b31e@tuxon.dev>
Date: Tue, 3 Sep 2024 14:00:11 +0300
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
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev>
 <TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11332EF1A8D064C491D8F261286932@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.09.2024 13:31, Biju Das wrote:
>>> During boot clr USB PWR READY signal in TF-A.
>>> STR case, suspend set USB PWR READY signal in TF-A.
>>> STR case, resume clr USB PWR READY signal in TF-A.
>> As I said previously, it can be done in different ways. My point was to let Linux set what it needs
>> for all it's devices to work. I think the way to go forward is a maintainer decision.
> 
> I agree, there can be n number of solution for a problem.
> 
> Since you modelled system state signal (USB PWRRDY) as reset control signal, it is reset/DT maintainer's decision
> to say the final word whether this signal fits in reset system framework or not?

I was thinking:
1/ Geert would be the best to say if he considers it OK to handle this
   in Linux
2/ if OK, then we should get approval from Ulf and Philipp on the power
   domain or reset approaches

Thank you,
Claudiu Beznea

> 
> Cheers,
> biju

