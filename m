Return-Path: <linux-renesas-soc+bounces-25608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5410ECA7E1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 15:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958F7310E88D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 14:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D118F3191CA;
	Fri,  5 Dec 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aNGuOTXp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624082FFF9B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764943318; cv=none; b=U+IVcHGSuCLwgkyIv2Lf+OWxCJAGJ61iPTTLBLCiS977hUGZdQgtjcyw/h9hjTMSVOufsv3ZWoXkj6RAJQN2qr3/61ZW+Chs3jsOmyvlisDDkFb7FRrsrqjShQijmDtKzcmwL7SqhE0SLxxpbURve+buV5WRsRANrjupQWIKzz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764943318; c=relaxed/simple;
	bh=wEeRhbI5x0EzNu4bkeBOKxzkJfD8jqm9H83aTBh8FMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWG4/Qw8kg6wwL1G+Jnif2jVp8aexDULeB0lRYXodO9kiCE/VczqvFK/M4wjAjvnR8fmeA/oMO67EA21oGkBppCtOXrjPA6MOXx6DPdgQuAcNiNwTqfC+xS73XniY6eNnEkiEneta51ODo6orh3UMT3N7A0Y71CMvzm/KpfNvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aNGuOTXp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2e40582eso1240733f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764943313; x=1765548113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETP6ZwRR8d1hP4cNbKBiZUy+JiTc6tdkyie3Djet/bI=;
        b=aNGuOTXpOQztaPUJo4ttnXn7wPwIYVv6XI3U1T05vmzU54X4/LUgkS2jG9kPPTt+Ok
         USiTHQMqSlLt3H8XZqo7sCPMvWfnTVQbJojXvekrU3G2KwKCBIWdHY10RYU1AMUi42SS
         1OufR+4fXy5/Dnl40r6GVUpu4BR4wy7FQzSGegFuo4RHGXcQtSavrluCAQNmd0fe2c2l
         DIiQKUrcMcc1CE8wq/awUbwqDYqNQfEenv1opCjc9D/OiKKe2/cJ907poS0Qt9Wu/fKW
         mptTHkEmtNclvrfacP5HWpoZrxZZQ8djh21+CKaCzi7331c1mpq7Pt70mX0AkkOhT8EV
         xJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764943313; x=1765548113;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETP6ZwRR8d1hP4cNbKBiZUy+JiTc6tdkyie3Djet/bI=;
        b=KEFJepuhTMHKNf20DdJQ2+Bnm5lQ/HZc5j48rwbCRCN7mte+UWXyivK6w1+09nnbCv
         kYG1SjkQS9Kt4hEppX4IINk+1W5IncUEicN+K9U1QLGLQzczqTYYI1glxKJ960eHimhA
         PtMrU/6V604a3S+GzBfJjZGhtgp+s9BsSoL4ljnCya/5uB3xmIDK8+mU/HEEIefsfJ9f
         huDNJsXDpObSEIptBKUlNAKH3pA1hjE3Vva7UZqsV5S//FpuCx+axkvCBQ3CtlEH9gQ8
         Bli+XyCw6AppK4Mj/a8iOdqgjO42PEEpNPbOuGpyQ8AFQ41plc34KPJhdZMl+HzcYAf+
         aY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4MlxM6M4CWPIatVqqO8A7shgxwLOrKN5VcwLgXopd7fnBJsF2yRtDvaerTYkbSNJESujyTM811WCqKv71Cz8t3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+dfoK8ebiJioyDI4If8VcNc43dka7o6y1znLRNPqLFa7pFD2
	BECGI17MMDd8GNbyNg7Wulgdt1+zSIxLgj5l84a1ecHLJ3Qty6tP1ocyDra5oLR9e24nuQO3Ujf
	pX9k3
X-Gm-Gg: ASbGncshBlGCM4HJW+rUP+BMqZsBEdJuPjXGi9E5WVoLLl/oClL20INjpKisScbDQKW
	vVCSoRybM0j93NTnQFK2aLW6koaSbTKdayb67h0xBkI8dQewfVikDLSlwfiPD4w9yVqAOOmzwQd
	vrkDqZ3cICalHUe5vwbZGMaWE09zNcTRokD4m2E2AgyhkDvndqPqs4F39Ph/YurbWMPjmD3k9IM
	PY7Zeyuu2FeecGJgWfW0SVZX+F6ITyqacAsU3PxPzcZ60HwbVm1R8i3+poED+M1JOjtTO8RhooA
	uRfaUzZjeqc7Ge5PM/M9X8l/RdBPPdidTo9g6f924ZZgKwF3EdG7LGk3lTbF7osZ03dEj5357qt
	KZeycB1CJpGHFnqvw38t0/smUX8UGvN5wQ6x5xjQtUQsvbtUfoUdbHygJx6e8f52VMge0/FChDv
	qexrGo8b38XeQofyz4uUo=
X-Google-Smtp-Source: AGHT+IHa0/JLkPmDvfwM24LUa6FS0JVCw0o6W9U9nEda9fVYcYWwSPyfk24Kk98oEUhOeULnAibMaQ==
X-Received: by 2002:a05:6000:4287:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-42f7985dc85mr7096458f8f.56.1764943313057;
        Fri, 05 Dec 2025 06:01:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm8828509f8f.12.2025.12.05.06.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 06:01:52 -0800 (PST)
Message-ID: <562eda90-6ca2-40b5-b1f8-fcc4034dd122@tuxon.dev>
Date: Fri, 5 Dec 2025 16:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
 <TY3PR01MB11346C5EDDE82E779C69566BB86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346C5EDDE82E779C69566BB86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/25 15:45, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 05 December 2025 13:30
>> To: Biju Das <biju.das.jz@bp.renesas.com>; p.zabel@pengutronix.de
>> Cc: linux-kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
>>
>>
>>
>> On 12/5/25 13:55, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Biju Das
>>>> Sent: 05 December 2025 10:57
>>>> Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to
>>>> RAM support
>>>>
>>>>
>>>> Hi Claudiu,
>>>>
>>>>> -----Original Message-----
>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>> Sent: 05 December 2025 10:47
>>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to
>>>>> RAM support
>>>>>
>>>>>
>>>>>
>>>>> On 12/5/25 12:17, Biju Das wrote:
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>>>> Sent: 05 December 2025 10:00
>>>>>>> To: Biju Das <biju.das.jz@bp.renesas.com>; p.zabel@pengutronix.de
>>>>>>> Cc: linux-kernel@vger.kernel.org;
>>>>>>> linux-renesas-soc@vger.kernel.org;
>>>>>>> Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend
>>>>>>> to RAM support
>>>>>>>
>>>>>>> Hi, Biju,
>>>>>>>
>>>>>>> On 12/5/25 10:53, Biju Das wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Claudiu,
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>>>>>> Sent: 04 December 2025 18:26
>>>>>>>>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add
>>>>>>>>> suspend to RAM support
>>>>>>>>>
>>>>>
>>>>> From my previous experience with suspend/resume implementations, I
>>>>> can say restoring the system in failure cases in suspend/resume or
>>>>> not, is up to the subsystem maintainer. So, I'll let Philipp to
>>>>> decide how he wants to go with it in this
>>>> driver.
>>>>>
>>>>
>>>> Agreed.
>>>>
>>>>> They are still supporting suspend to idle, where power is
>>>>> maintained, right? Shouldn't we cover this case?
>>>>
>>>> Yes, I agree. Probably best thing is zero failures, if there is a
>>>> failure in suspend path, the same device will fail in similar fashion, and the system never enters
>> suspend state.
>>>>
>>>> So, report the failure and debug and fix the issue.
>>>
>>> FYI, On your resume path, if the below call fails, then there is a pm imbalance for next suspend().
>>>
>>> ret = pm_runtime_resume_and_get(dev);
>>>
>>> Similarly, if reset_assert() fails for a shared reset.
>>
>> Wouldn't be the same if there will be no failure path code?

Could you please reply to this question as I may be wrong?

> 
> 
> Eg:
> ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		goto pwrrdy_off;
> 
> Here you are skipping pm_runtime_resume_and_get(), The subsequent suspend()
> Will lead to pm underflow error.
> 
> Similarly, on suspend() you are checking the error code of reset_assert(),
> If it fails, you deassert it. Surprisingly, there is no deassert operation
> On resume().
Could you please share how would you like to look these functions? It looks
to me that you want to ignore any operation that might fail (as you
proposed in the case of resume from power off) and just re-enable
everything, unconditionally. If that's the case it wouldn't cover all the
cases, either. E.g., if resume looks like this:

static int rzg2l_usbphy_ctrl_resume(struct device *dev)
{
	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);

	rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
	reset_control_deassert(priv->rstc);
	pm_runtime_resume_and_get(dev);
	rzg2l_usbphy_ctrl_init(priv);

	return 0;
}

the rzg2l_usbphy_ctrl_set_pwrrdy(), reset_control_deassert(),
pm_runtime_resume_and_get() may still fail and may still lead to imbalance
refcounters for the next suspend execution or other scenarios.

Thank you,
Claudiu

