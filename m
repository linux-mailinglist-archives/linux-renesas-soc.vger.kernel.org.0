Return-Path: <linux-renesas-soc+bounces-12760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0647A232BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 18:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 146D6166973
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 17:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC0F1EF081;
	Thu, 30 Jan 2025 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsa9f5ku"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A711EEA35
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257886; cv=none; b=JFG71aUo5stQGHg0/8qZitet+bOJVo9kzigyCuf3Dqs/nr424tHYm3g6ve6I3Hsow5i5dCiDld47RuMeWF1VBXmvMS/Lw0oZEW9sQm65/Z327zamWXQfqPkTkAW2uKWWuIXVUJkxjGjS1MMQKeREhzx+3PmITkrBGf2CBJXW4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257886; c=relaxed/simple;
	bh=lhgUmgTEIT/vBwhj68pfvvbInab5tq3uuxQ9tFQKC3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhywdxmdSSzU7IAothbFlW7mMLIWXoCEpfHaZ8tCgLSnR3DJOTIgy0HwiXMPNZjSF5cX4ukbD5mosPXbW2oQCiAEOGr4rqSGheJzVhcqGuLiAowVjeFqYECqkdeEOkWTp8cJ0DwRqIyGIEZ0MBus/tUnWfeQbWPKcHHWzaoFbwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsa9f5ku; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e0e224cbso672225f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738257883; x=1738862683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyeDfNgF8wSUnxJsK4c0ibCBKb5iWxSmVaedgdkZ/qE=;
        b=rsa9f5kuF/qfLSmiWJdpoofhGH81/rcL7eupFaAbtfsJfFjsYXwusoVMGSkta+NOQJ
         rsGWqUcf/Kw6padrDj75HTJwZ2INUAArnhcxlCaTRDElPQ0UT4rPdhecRn96PmhpC0Y0
         RZx76cgRq2wAxLbNglfXxcGcWw7U8rea3vWPOJx/D+wGeotjJA1UWP70L9zLel7dtV61
         4aXksx6NqkeukoWuLCRiGLDuAwLAFcKbam/Uu6g+Vux2zMhTBl6nfA9MB/Fd04TubxI/
         zFYShFOjY2OmCB8eDOsmrBQ6JBognAdRYK+pUwfSqGIQ1b9Nymah82RzfvJHjg8/Klzg
         DjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257883; x=1738862683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyeDfNgF8wSUnxJsK4c0ibCBKb5iWxSmVaedgdkZ/qE=;
        b=loYB8kmdrpV1fURNtMLbVi15bgLsfTkMpHjmoSYqRoqDXUSUMOrZb5F52lnY3DAn2S
         hsngcba2vXphfI9gB8wS9qcKRlXbewKq2ZlPsIVFJBf89rBo3tDzWwxvOf/qjB6G5FCV
         owGeiocOi0rO+cjPllMqQ6FVAZdxd1Dx31akD/e5nCSXIAf+2Mb2M3aXlyBMEhJWG0Eo
         gJuywnyNzBDFt1sHFls18VqvPJp+uMBapYQhzW0cvyYweBPe7eXdvMEbSn6+E0Fn28Gi
         xQqus4QIxI1PQ0p7wRM7pS31QKgYj9HhvJ74MvH/8SXV7TMN3Xau7Dk3lJiZuiom/KRq
         FaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB43hTkA0X3I7iXIMO9KxxaX/hfnzgcJJLaLjqAFkKYfuao5rxnztq6bAepvVD3WwbiU8rAPJAUW1eVatkDjcioQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzliKRslN/SHCn59y07TeA1mrnNRq1ygg+5Xaq8sk9GuUEXVt9Q
	57GxLPSXV4FI8Qi5YyOLuIm+NS57llI9It0zSW4VLx8ABT85fVOEsiGtlJ4Ohp4=
X-Gm-Gg: ASbGnct7eaJ7UNhYUNYwmnkpxQatojlvFKOeHY1BTPlQWX8tevZ6izMYW13eIiTjUj7
	CdSzj3sQaQA0aUrTyM9sfbWXov6CC7KwwBtfjAHm/Fsvp4Ggux3efTifaZ9RE2kdq1POEci+lEl
	TOujvnbuIE7SKZePI0dRXY3BdEkwHYRNaJ7r/3WFq9u+sRI8reot3r8lqIGjGspPxJUtFZE0Gq7
	Z+YHvEkPWls+O+YIFlZvNqJHEKM8MHGRZ232qSM6NHuw4Iyu3LudnSORI1n7VYlvZUupB7S243D
	11JlKAqWog4PjHCQK07GGZATNl2XSJJ7kiaG8Th5h1MsjrFljXM0UZ0=
X-Google-Smtp-Source: AGHT+IFOKhwS7SVTZlAgB/KmUq5YUcsnKXwUcdqRruGMwNm81PK27tTx5RK+9qsQBjRXDr0I6E36aQ==
X-Received: by 2002:a5d:6d02:0:b0:385:f092:e1a with SMTP id ffacd0b85a97d-38c5194c3b6mr6343222f8f.11.1738257883252;
        Thu, 30 Jan 2025 09:24:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c0ebfdasm2599755f8f.17.2025.01.30.09.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:24:42 -0800 (PST)
Message-ID: <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
Date: Thu, 30 Jan 2025 18:24:41 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/01/2025 11:30, Claudiu Beznea wrote:
> 
> 
> On 30.01.2025 12:07, Daniel Lezcano wrote:
>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>> Hi, Daniel,

[ ... ]

>>>> Would the IP need some cycles to capture the temperature accurately after the
>>>> clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of the
>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may
>> not be a good thing, especially if the system enters a thermal situation where
>> it has to mitigate.
>>
>> Without any testing capturing the temperatures and compare between the always-on
>> and on/off, it is hard to say if it is true or not. Up to you to test that or
>> not. If you think it is fine, then let's go with it.
> 
> I tested it with and w/o the runtime PM and on/off support (so, everything
> ON from the probe) and the reported temperature values were similar.


Did you remove the roundup to 0.5°C ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

