Return-Path: <linux-renesas-soc+bounces-22471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFEBAB802
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 07:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3122A188C9DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 05:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3063D276057;
	Tue, 30 Sep 2025 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TI4uSpQw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06076276046
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759210403; cv=none; b=Sb8LJQbihf0PsvYcWMJTv9CUkz//1E1JeasEvdlSEoRZJ24VNldjo3YmsDH584q9fv/ENVcQM5yz6lQef3BoWxr9fgVcVruxH6clQOFOxsO3eQPdqlQnH4GV85vR6umy+dIIxD2yQi0KbsRoe37EWRTYzz17vikOR2maaJC9vH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759210403; c=relaxed/simple;
	bh=+zYHcq1PnJGmU//SbV0gpmoJSYNqd+MwGlmrpbux8Rk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ukiCq3T3mJhrCE4LNS+ww/Mw2lErTvwsl0YnKx0BV0qWPtNNAPwhi82ZZ3+5wfZRPgxyJ1Je9OUySK84TTxuexJoDZ2w49WREyddO4JR1UnBVo0O8asqGiKHWdbia2c7Vh9OKt0GbED6D62ydwY3mv0v8NyIkWy2R+T27nCgm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TI4uSpQw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-41174604d88so2778496f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 22:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759210399; x=1759815199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RcKZSqsNCClUnXNLZ+VWODkqJQUd67st9xIuGAhStQk=;
        b=TI4uSpQwWfQKYiW1tI6/8kA5Z+W7OMOqi0a4zllk1q8j+84RD0TwN0Du9UKkguXWhO
         W76z5mPf5mURJ4ve7m6CFUL+1+UsRX1pLFNYCGCwo3SFu01z3wnAa7RMnSU9BICyKlwO
         ld4kwDoZEKgwKlSsnd9aGwUYu82qT3Iho1o+MtzCQMBzgVs1uqg5u3ukbs5ZPNPGNodb
         543neIkoKYOqLzvovMx5dWX6W7EHk5etHpXdVKHjH0jlEYrqJXmnvgrsndCmaHc0Xjbr
         jf9IHBQDX6BUC8KxoEkh0w/TJX3JwqnHOIlLZNgtum8ys1Mb2uOlKF8vBz4ICzOSZsa5
         OtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759210399; x=1759815199;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcKZSqsNCClUnXNLZ+VWODkqJQUd67st9xIuGAhStQk=;
        b=bl9/F+s00xlYE7bo4/cpB6MTVKZMovpQlIe7amPYeeAfRdJoM0qLxQ03HmXpl90eFG
         yMeU7a0Q9SG5IjMprhFKggdBEx6CQTAIEo+kYyvSH8HQo9m6DVObC88PTRJfw/YejfFb
         mnqAkBvm6fbo3JaPjT8Q7PhiA4GhxHtGvAFLp1jJXsZm5pTEQo9kMKxE1gpvPP2grFIl
         L8D42eqbmegvctY/MSOwZVLQhSenyPim2fR3STXWC5N+AeNVCrxxKkX8GAKj7fIMlOYs
         vGvZXr+P7Qq1vlZxRPRer15CaL7OQw/rciGuUHGZS4onVr3Xu9CTpeOjBmV6RgyoUJp4
         zMOg==
X-Forwarded-Encrypted: i=1; AJvYcCW7cNDG+O1sZmb9cVTtFABvGuSv8KI3o//wKrgj4zU1GZGPMraKeSojlBMA5045JLL0exUzgaFZ7eAHP6vwZpqymQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmoyLShbGOklRZO5xo/AqskV0UQP8wt6FKWllAXOX3ZuL335F
	lxfKK70BWiV5lW6XuTiNLTXmAYF/oL36Z8QTmTyBt/KS7iKprCxvKvwx7NujluX7SvXItexIZq8
	U5Zj/
X-Gm-Gg: ASbGncuo18Z8WxqMckd9dVPKbFdPR1kty6ohL46OucnZ5QZOFbZOv5dPI/7Y1SLfNSu
	M8x4WHaxhIUMsYYPTW2gDkyVsVzQ7nqntn/C12pzRzeJCHLMzKMlMGlzLnfzyJAvGhpFX/BG9yL
	++5PjMhYXMRyaY2crOooFUGpceCpa2T6EfNRXeANjZhn1lnm6vOYH1xOS7ci7Krbh0tquAuPWTd
	q3Wj7T+cGB1O6D/p//4IajhOs51SgAPii15co7+1QbOzBRW7pZs5WleSbCiSikJW8jTsCrisC3V
	nD9sJfJNP5iU8BGhqHEPO7LjwhqjQWfJ2OFzKgkXZ3GmVcuRjvoAxulnvlrStvFCTOXZbiRifb5
	ebGiTF2CNIWJDLJ7G8GGiSa8qgH3rPukZwC57kGZwP8IfDQ1CdeMzzCs=
X-Google-Smtp-Source: AGHT+IEkueAS01kFVAoXd3MEH9FbKcaIHwo56QQ73i1m/EjHyO0vo1fWE9up8eTSOW6ZhEmF700+iQ==
X-Received: by 2002:a05:6000:400a:b0:3e4:957d:d00 with SMTP id ffacd0b85a97d-40e4c2d2576mr17438762f8f.58.1759210399124;
        Mon, 29 Sep 2025 22:33:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc88b0779sm20750915f8f.58.2025.09.29.22.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 22:33:18 -0700 (PDT)
Message-ID: <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
Date: Tue, 30 Sep 2025 08:33:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
 <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/29/25 15:10, Claudiu Beznea wrote:
>> This conflicts with commit d57183d06851bae4 ("pinctrl: renesas: rzg2l:
>> Drop unnecessary pin configurations"), which I have already queued
>> in renesas-drivers/renesas-pinctrl-for-v6.19.  Hence I am replacing
>> the above hunk by:
>>
>>             /* Switching to GPIO is not required if reset value is
>> same as func */
>>             reg = readb(pctrl->base + PMC(off));
>>     -       spin_lock_irqsave(&pctrl->lock, flags);
>>     +       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>             pfc = readl(pctrl->base + PFC(off));
>>             if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
>>     -               spin_unlock_irqrestore(&pctrl->lock, flags);
>>     +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>>                     return;
>>             }
>>
>> while applying.
> This is right. Thank you! I'm going to give it also a try (on actual HW) a
> bit later. I'll let you know.

Sorry for the delay, all looks good to me (checked on RZ/G3S).

Thank you,
Claudiu

> 
> Thank you,
> Claudiu


