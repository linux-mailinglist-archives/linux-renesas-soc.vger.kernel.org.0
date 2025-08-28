Return-Path: <linux-renesas-soc+bounces-21053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9DB3AA6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 20:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37B0A01C61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 18:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFDD326D51;
	Thu, 28 Aug 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QOZcbAzl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3D029CB41
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756407226; cv=none; b=hneQZ4hx6qM9gu3i356NvfjR2XLDLCpOvg2MMiM0P9xf4RhQ4uMwqx+YWWGKN6k2YB6+6UOPUR+E3QIYSFieY9Z32jNVYqKePN/jEd5c2MVZHbolO7F82CoNr8y8l8llAB8Qg3slQ+rtb/LwC8+U5RZTkYl6TCF/1dcvX1DlNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756407226; c=relaxed/simple;
	bh=FQ1rdKGi9R94HCP+YGbh7p78J9PEq/G/b/AdDFMY+jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FH7vTV9wdRKhGQJi4B5m5F4jM+hjYc76TydM57QrBcy255JM20aa0UreC5MpduV+cGQoKuBwmEs5GAoLX43qu+Lz6rqe3btlakl1+LC99Cs3DCQQl15MBUuR97avVTHHYNln1MFO0gN2q9HcYubyow7UBvGh2dzH2fJtGY5ZKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QOZcbAzl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so8089305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Aug 2025 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756407221; x=1757012021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQxssGI+raI+XkRI8ea9mGLdtxL/7Ytn0lgOA6dMPAE=;
        b=QOZcbAzlqtiDVq0p0SK2wIYjMIrVjLkDoxQG9YQq0g3CVrOpaPI2SAOa8YMr/u5uSx
         qoXS7ucnnv4z7nBLgs05zJ2+o8cggQXg0mWMCV3bV/UbqPIuiz8/+sEHQUMFdNZhxCPu
         NTfriGwrOQ7TmTthVIA2jz0BEKyCWT7QF+wIwziliqiDFhHKQlE2/kYSaK7TEL5nfSZV
         6GEArmB32Q4qiuOk5I5keQqcEjcmeCemI+XbvM54DtUDzRvcvqAUS417eQkX4frwmCM7
         JP+ZZBqVLq2JyEH4MS242ODQQ+1QPjEtYMpX5TygGzdcbs80AkNkx9dtIhdDkwBFDNC4
         5T5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756407221; x=1757012021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQxssGI+raI+XkRI8ea9mGLdtxL/7Ytn0lgOA6dMPAE=;
        b=wBlgDNRw7gcz3Eos/IP33aWpffj+vYBqPENKmETU9qszDv3MhW2FcB+587lQCnfVgB
         2PPGZSEMqIWEj0kGX9nh6w9/JRAnjze69QhpSBbv2ixpGSTKbrMiLFoPZEF/T3ZV1Eh0
         5D3rQyJjEZF9+SlyXtnEHFy/ktwCfo0IP44laCFYu6//GZMTIayaqZMYVVD0T8xCOqni
         CRTW2PXiruhRV6VpIDTWxZHeYP6KFN02BX6tcZeOQrsPXu/7ZR1QxXMveYFcjjJxeIAW
         pTi//Fgc3+mLuyOcgpmqqRE2sZGa95pD1JfiFXu8cNoS9MYAMgujv5PVR2MPsdNLfe2z
         baVA==
X-Forwarded-Encrypted: i=1; AJvYcCX2qqADdOj4U/4KQLSofLgGC9fsZ8n6fXcgB5qYGJBTZD64oXT0NRP0S0kpNzmuHLYj0MuVmnjCQd5Lt7CWwoErTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSr4MIp2epZ81SeSrfCOAXAfWjPMZ1nZTr5pABn32IHpr/xg2
	o0IaL3RULl1yz5L8KM7rTrIpxADaddQ3kTdjmQNUMbtSvsndoUTuZI9xTdn0cK5Gl7k=
X-Gm-Gg: ASbGncueP3tCEeTXSVynS5bPIPLExpK0t+0fEtUSYB/zRHrQV2JRh2v8GygNFjG3E05
	eM3/dn/OZugUUU4DnIvowQxEAKlkqyqiRo7I9YVQ6uhFK9XOF85m6ta/6Rgbw8EJfdxPjkf/t3H
	hHBGgBGiHHwrIm/f3y/fCd8+yo0j10lfswA6L1ixVO9NiTqfX6Hw13ThxHrgaQ4qY6Pk98tgc4D
	d3M7mGFlX61Y67TcWmCDmFuss5Oc1siQ9Ykit0yJLeAlpC/Kg82MAT05UzF+wgy4XyLV59cvWex
	Zn3mVOlhMWHIVRCMbPbUmmuxk1whks3j7ZORAz2EisjBGeJ5iHm/N4DlzTNHLGGAm4V5PGBLf37
	qyo/zVCNXQrbZG+AiCnwASvikJ+CayhHYZyA9OABodhjwC3vTXoueXIzDMIwH7lbEFSpFFl4Nlo
	EZoQ==
X-Google-Smtp-Source: AGHT+IEsQ4LuJqJJ8bLH2sEiTn/a4xu8JBjHjhH5JH9gsrlNMbO4Yfh55Kjm7XpwgoiSOdsGhAur2g==
X-Received: by 2002:a05:600c:46ca:b0:45b:7c54:7518 with SMTP id 5b1f17b1804b1-45b7c5475a5mr21923185e9.13.1756407221350;
        Thu, 28 Aug 2025 11:53:41 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd? ([2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm85978075e9.14.2025.08.28.11.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 11:53:40 -0700 (PDT)
Message-ID: <a27c5e51-14ab-4f6c-8da7-3733c1c89abb@tuxon.dev>
Date: Thu, 28 Aug 2025 21:53:39 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund@ragnatech.se,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
 <aLAWLZBenSWWqqkK@shikoro>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aLAWLZBenSWWqqkK@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Wolfram,

On 8/28/25 11:41, Wolfram Sang wrote:
> On Sun, Aug 10, 2025 at 03:21:21PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> This series adds thermal support for the Renesas RZ/G3S SoC.
>>
>> Series is organized as follows:
>> - patches 1-2/4:	add thermal support for RZ/G3S
>> - patches 3-4/5:	add device tree support
>>
>> Merge strategy, if any:
>> - patches 1-2/4 can go through the thermal tree
>> - patches 3-4/4 can go through the Renesas tree
> 
> Series applies fine; I can read the temp (36°) which increases
> reasonably over time (40°).
> 
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for checking it,
Claudiu

