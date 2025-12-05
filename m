Return-Path: <linux-renesas-soc+bounces-25596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B9CA7107
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 11:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 382E4308FCF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E692FF158;
	Fri,  5 Dec 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U1pE3yOj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DE30B50B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928802; cv=none; b=VCHmzkG5/ufBlz4srUE5m6QYhpUAOWWGoYMdYeyVhjZ7PbXCZPWXnpGr20N+0PcRfNDmCwkUSYUw91xCvhuPQ7DCq1QU5PUHjwC8iaD/S35167twLrrh2jKqN+cUl7GwacQovDamoup06+fj0hZ3ipvgBxiiBY/EW3AyOmJASBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928802; c=relaxed/simple;
	bh=VUXzybIkw6pmsWXzSBXgDi2J0etu5zEWUC2XxlXLp3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWCLlkPpmN4vVaaNrjvvFPf/QXQ777Ed/pZTFHuGjYaeZpSDacq4f9aXRZf4bmKrBd0Nd0mt5ASjN9GSzbH7nPMkrfzCM/WD5iESDPkvQeMXOVBxszDzCESUfE13y8PKOW4/PhoGhbey+55DldKCmaD6c4EVL8FxuMU3oLkNOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U1pE3yOj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b38693c4dso920041f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764928794; x=1765533594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3AzSjud1NEXvTFa5UK9u90TKwwXwP5zeEqUY9xgxS8=;
        b=U1pE3yOjn/ojna5505K9LfwS0gqRVmFzWmDki2BGwLO7/QrbtUA2M7hpseaGq8jreq
         pS3o9F4AMmzUKHQgyUX5FUvZMnAX+8Ku2OL9bUHNmoB5LuUb6tA0uJEqzIQhW/wNhncS
         wM7Ubi44kdlAFrE5VLSVnIx/9suPWEYKQeRXP1jJ8oql9qnogUn1GAU2LUCqJPKiYHa8
         97aOvY3de5DAUHPRJ+2zDjWOIcUxbu7d4rscp8RQtqNrimiCav1wP8RUFf5Hdfmqb153
         kMHvW/lqd+I9QMFU4Ie8ROzuGK22H9hz1XXlOK0qAH29ipcCWWd2kL0vhVNQahJAnrp9
         76dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764928794; x=1765533594;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3AzSjud1NEXvTFa5UK9u90TKwwXwP5zeEqUY9xgxS8=;
        b=LmOpeaIo35qMI32LslNcR3pWI2ZKCLFtpw0SDdWs80hUevMfhzt6pzR/lA4Ikiswha
         Gk7Si0gKdsoqOif/dWDnlmB7DH71NGquOssKUaa54BcvBHL7fb4mmNZjwpwiGCUf86Tk
         dG+F1UVoar6iyCn4ZQqUOOVos9RqnM3Tm3rzLU2gq4mvAfszcVDB8U8xePCuJDQXcEsf
         ut41UHX6b9yo6WcJR0euWUS0zszV+cVaSjeWmSVHoCWtfsOEoxokVDailSmXrQUhoFmu
         hUmqv3gjCLl1Iw95CXP6RWgpqTGrLz+xjY+yxmXy5qdZEzDkGmR2ct1t8O8PFDt5OQcX
         SB5w==
X-Forwarded-Encrypted: i=1; AJvYcCWXdj9qLo/08Zzu7bKf51oK0gnJYNblfagfzBebTKUTA88mE099z8I5z38tXeLhw51efxk0LUNphrTcJSOsN+zfTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01g2Ks64Llk2HXhnZaebju/1R+NsG8c+PMRe+o9ns94Fgxyz5
	lpmsxv3txUqC16d77hsiLp/XCWrGaAyADWafbLBfuD1v2009bjKC+meUNRRj8VRap6M=
X-Gm-Gg: ASbGncvU5AwUnu6F/AtWouIZDjVRh0f2+ZbmcvcIZ46IQDXXNggAxUz0m2eVYDDjRDo
	Z5z3xsCk9jqdT299MLupMsGjLz34CMI8fVY15vHXzwdSKlZHnguf09yxLpP60/qXQBhk/AyMxkf
	RMdNSoLmKgyAg3z+Dvf7OGtDKUJ7pW2ZRQp3ZwYM8FvRc60pXqawtp4vA18NT+IE5j8anb40Wsa
	mO9qTr2oXiGABLq91Kc3DstayWDXV5f01JGSCbhhGlsG2ukpWUCKyjuLE5qZuT3OhADU99Yaf7g
	11QS8lnV06A+0S86xio7eTSrYyM9XyMJNrTOJFo69DSpHkMZcPc4M9oyaTGSody9Lo3KLXxcPlR
	lxQQf76rlc20X72HA+2zPFNWIsO/XUuTDTmiFjlEd1Goqlk29J5eTIYSyNjGXeerw6DU44o8y8u
	sUV/GeYNidKmAwB8+SsRo=
X-Google-Smtp-Source: AGHT+IGhG0MbnaY5V3mxTdAaMwoPY6Dj1gXYcm7fHaJgmneI6rTtx7Ok4O43ek0G883TRjM54G66tQ==
X-Received: by 2002:a05:6000:22c4:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-42f7980bc01mr6954054f8f.14.1764928793854;
        Fri, 05 Dec 2025 01:59:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm7648127f8f.31.2025.12.05.01.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:59:53 -0800 (PST)
Message-ID: <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
Date: Fri, 5 Dec 2025 11:59:51 +0200
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 12/5/25 10:53, Biju Das wrote:
> 
> 
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 04 December 2025 18:26
>> Subject: Re: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
>>
>> Hi, Philipp,
>>
>> Could you please let me know if there's anything I should do for this series?
> 
> If rzg2l_usbphy_ctrl_suspend() fails, What is the probability that it will
> suspend again without any issue

How can I measure this?

The idea with this code was the following: if any instruction of suspend
fails, the suspend is aborted, thus code in rzg2l_usbphy_ctrl_suspend() is
trying to restore the runtime state of the HW so that no runtime users of
it to be affected. This is also how core suspend code is doing, e.g.
suspend_devices_and_enter().

> as currently we abort system suspend
> and enable clocks/deassert reset which keep draining the power.
The code is restoring the clocks and resets to their previous runtime state
so that any users of it to not be affected. Later, at runtime, if any power
needs to be saved the runtime PM framework will do its job.

Thank you,
Claudiu

