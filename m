Return-Path: <linux-renesas-soc+bounces-19997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42521B1B1B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F09AB3B9FC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C82A26A0B9;
	Tue,  5 Aug 2025 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F00kzYyM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A01DEFD2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Aug 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388349; cv=none; b=GRRgjYSc9A6jjBUitsluusfVzLJaT0mRrpQrl0ZHE4VA8YUb0dEFFuLjzwwJQsrGAufpTmwZnp+itgOxDOdUOq11tLLlpXIb3MtL9w4PKymPd8s5kkQOXrnkVbBPeFJG3SbsuldfvSpK1qEOtIDV/Vi809uzBSafOL/lkTRvMY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388349; c=relaxed/simple;
	bh=6C+1KQrRGEVs5yevENfdWXMJjYaH1qtssIzaEcKbKsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXLx4Y3ccYLGYErOt6gC6BnV3gaG+N/qB7PuXto6TZI91guw79eqCSCukUKlGY5wtDWwGADDL3fGYs4dXKVAzB+4rmIiAja40Fc0bOoAifJsrIplSoE9bPvXglyV7IpoaP7kELPxHPjzoCBQ6MoKMLnRKG/gXWe51qxUz2Diu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F00kzYyM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45994a72356so19072765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Aug 2025 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754388346; x=1754993146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WlJi9cGntow0MX8lCUDCRyZGY71FSIx/7fRRzmtG1E=;
        b=F00kzYyMEQxFqtv/g7wiZp8ZAX+n9IM+PU13a4ryesbNAm/oz67tgIoAWgp/ew5csO
         t1a9JCOh1M42LRjpYYfz/n2q3m74KxqJGSxBaqn40Dh3xURAMvytxKoL9rnmy9FP4bZj
         JILZ4hObWOjKVyg6wYrk6YoTKZZhfwRjBdaJDmAacMripyQZV8MtYjjtyqyZqRwmxzTE
         JA6OvyPcq01D1xZO1gWeq8nClslaS/cTTgHpwfgO7jgZYyrS/Ida5cPA4ek2Em8spxP0
         Z99BQB9qBvnV4nDCNBmlbzIyxppy8ZoRGlaGxyGJaS5aGsafHUsCI44y7sjFMzm1jqbk
         xxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388346; x=1754993146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WlJi9cGntow0MX8lCUDCRyZGY71FSIx/7fRRzmtG1E=;
        b=qlXoyY/rveU+5WVQQ7GWKgVsoRbOLbkQ2wVrdsXqF5mfcAPeI4vGSHVdm4CFHzuFsv
         jYjmuIDgsbx+L3xDzje2ixl+e6NLweXLuawsiuC1MLQPgAxG4a28M7WEHi6F9zRMlW7A
         hR6Ry+EmORhTEHBkXIaAUwVXfyhpuiujyPfkca0D4mIVTWctTe4SxAzEI3EusO4qthcJ
         Nt0HWum8c4CecCfISQJoN70H/eb+tSst/vyMn7hUE+hqRiTOTeEMP2jo9l4SmFRoquVD
         sfmQiCtRrWOb/W5SBkF/D+jq6Jf93dpb5fmf1Moc1S+GDBDSNCMZbqsW5A6SME74tBYa
         1XhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6o/bRAHHf30BWWOtCnsFu8NmfaWzH3Z4FKDI+Ul5bapxUjjwVqBLl2B0QWx5jIx8dUVda2Bm5OKNNHTXWh65QHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9em4y+7moEaEOByp+peMzZ6ex/UJgmdpQilJwnbS/8lapukFH
	z9bpi87sO7GNGRuxLRl4BF3MO7HpiJRWjHaacVafYNxLUhpBVdmoYpsUNaGO1B96iEs=
X-Gm-Gg: ASbGnctg6QMdHdbHz4sva6XUchQ8+SeleSeNqjd+/le0+HO7CTEBosPw6ywkWn8OQkl
	cxy7wKrHwrasNjm9efJgZ/F4YDiOis+cicSxO3/ZhqxFx4/rPDVN3yk2NC2GUaGXDhCxa8Qes21
	IjStF9AQwfO9Wy8TJymVZW3vz7SFv9qO8A8WtPoZZET0R0FWMr4qs23bIcemTAvH5dt3iBafMOk
	rmAk2WyaZ/hE4fK5O9BU3YOwzGxzYPi/bZ3slgCHFFuPIKPsGFA4se/XBN7JwJKkk2BdGCiMCDz
	zdD+fRug2pgO+m2wXnZVHmqluom+GumDwYWSEVSi53UpQBKSLhE/YgIJWxgSqCnl/UOlEor8Ult
	wb64CF9IuVdYBpE07j5P7EgaqmXZydhiQgYJY/KFV8BHXmg1u91jjKBgxMGK4lN24MT1VvOIX
X-Google-Smtp-Source: AGHT+IH+DQ96eXMvvGEe+t/KMa5/NOiWF9sy7ZABIms9qVBZ7ZnokCJwIj+c1GxCOC9C5xJiKziJOg==
X-Received: by 2002:a05:600c:6748:b0:456:1d06:f37d with SMTP id 5b1f17b1804b1-459e0d12436mr25547225e9.16.1754388346499;
        Tue, 05 Aug 2025 03:05:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458ba0a133bsm124646055e9.0.2025.08.05.03.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 03:05:46 -0700 (PDT)
Message-ID: <6e496737-3cec-425e-a4a1-29b576f8eade@linaro.org>
Date: Tue, 5 Aug 2025 12:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] thermal: renesas: rzg3e: Add thermal driver for
 the Renesas RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "john.madieu@gmail.com" <john.madieu@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "magnus.damm" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "niklas.soderlund+renesas@ragnatech.se"
 <niklas.soderlund+renesas@ragnatech.se>
References: <20250522182252.1593159-1-john.madieu.xa@bp.renesas.com>
 <20250522182252.1593159-4-john.madieu.xa@bp.renesas.com>
 <aHgVe0YwPWapIYed@mai.linaro.org>
 <OSCPR01MB14647DE009925C982AE6BB5D2FF27A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <64622ffd-05d1-43c3-85d0-cf98f3012477@linaro.org>
 <OSCPR01MB1464771054F720542F817E84FFF22A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <OSCPR01MB1464771054F720542F817E84FFF22A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi John,


On 05/08/2025 09:49, John Madieu wrote:

[ ... ]

>>> I might not get what you are asking, but since I compute the
>>> temperature in the hard IRQ handler, I just wait for it to complete
>>> and notify the completion so I can grab the processed value to notify
>>> the thermal core.
>>>
>>> Please let me know if this does not answer your question.
>>
>> Can you describe how the sensor works ? And perhaps if you have a pointer
>> to some documentation ?
> 
> Here is the documentation [1]. The thermal device is referred to as TSU.
> 
> [1] https://www.renesas.com/en/document/mah/rzg3e-group-users-manual-hardware?r=25574493
> 
>>    [ ... ]

Thanks for the pointer. I got it now ;)

I'm a bit worried about the latency introduced by this mechanism when 
the system is entering in a thermal pressure episode.

The get_temp function wait for a completion up to 100ms, it is a lot. 
Especially if the userspace can be reading the temperature and blocking 
the read.

There is also the spin_lock taken introducing another lock while the 
get_temp function is holding a mutex on the thermal zone.

Did you it that under stress ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

