Return-Path: <linux-renesas-soc+bounces-11650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E409F927B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 13:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456951893C6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AD72046B5;
	Fri, 20 Dec 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="sUFXG+vn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325D1C549C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698816; cv=none; b=k7X6s/YpLMtPsRDflNj01cpCNMb0rKPQiKC5tBKMNjdo/Bv30rlozCRlxFjNO/LbrJuPAW6V+rgqEVPJ2HYuqkKa256my+86NJ0kE/eDJBioRtsdT1TQGANtsGhEKHlLEzfF9CXUAqHfyyJBOOzzB8V3CJFXD6RBlUGoTxpim0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698816; c=relaxed/simple;
	bh=5khHjsT1KuPi0a5zmTt4KqcGl30ctxJ3hwpuSXe7JXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7U4Z+ThgzLNjKKO0XQTyVlyg0UTt1mREK3C9k3stnIXPSUeQ3XvGnAafZlpho8XgPdehPprAUM0QljeB1lRXGeboufxSEEbrvUdTGaSO7v/BwNmUzuhnBbe1PnrAr5+o8ebBSvLlfJIjn3heU2OQX8+GJGYGsr1nQDvBIDoQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=sUFXG+vn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6832so1859553e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734698813; x=1735303613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAfL/GZOdN5vbvq3CRu6BK/jXF2l81O7enXcx/p2vpQ=;
        b=sUFXG+vnYfK6NV5ha5o44BmYoAE0Ic2tgl1me2Cg+6r9hiUKP13f+zLZp1cTf5qsEe
         dR4NavFY8lWuaSIlNWE74X9hTdPNlHiHPw2rKfoyz/dTFzmEv41fo6NBpTBV1fNIi+xk
         nkaNL6aqG1yblG5p/KC6KHlp49XOrKNFjdS8GBgt+NfDvcYjEgGbD5UiaoR2zb7v/wHz
         8SUT2feEQr9CDw63CngIxyUvLRivtcqluRM7C2zLuxJi0EoW37MCFuApVyud+0noQ0U1
         ktGqdqiUONh48BTdKISBvfz5G8zQZcl7KUGVpGQiQBs1jJ1siZ281964e/naIlPw0WDh
         tMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698813; x=1735303613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAfL/GZOdN5vbvq3CRu6BK/jXF2l81O7enXcx/p2vpQ=;
        b=t3zrqLIQ5A9UKxEgC3Y2maGH1HAXkk91f11rkWYC2Iu05r4zvTRnGl6rqx4euDGQHq
         DJuQ3o76HMjMquksc/33XKWaThtQQ4u0KlsPb07cEzLliyAi4ALQBBrsa8EHoyLyN4W1
         x+SCk/GPpv6ji/jUTeUFGlWnZmH/u1GmySyI2pi7Z7IVcaWJEtsnXvJhs92HMNHGhW/j
         qXjRRj8kVv9JzicxtjcWZRQfaT+iq1OHKYn9DOCDPg/Z73uyGyjFJJHO5K7RtLA1uRZq
         R85Jc0aH2YA130SGGp2q5jfoONhslxXai2qj25yk1MaMa0vd0fb8EsSLaQQffnj/7X6g
         uccw==
X-Forwarded-Encrypted: i=1; AJvYcCWJdTcbFdylw6Vn1PHQUtHk1tUDmCDFmtR1j1RsxHtYc6NkSnk0LeMAF2nSKkJwKpTPWu4fQgJznL2h1GcqcI5OiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/qtWauoH7rwnuARj/N/l0+kLx4h/MXvVRdtBvrA1qO9c3kh+
	AHBnsrr7ytM923Cg+gPnXfmKEWifwZRwrUnJ1+cQMgWPVSkLhTSc6tBIHpY4WAE=
X-Gm-Gg: ASbGnctGUClr/y3truE2AN022xkMLYPT+J12RNpMTN6WMR4zaO5zZxPZNRZyToOxyTz
	51DiV5s1zWTXIM355ZZlQhWdY1QTnkQNGIodDEj9KwE0aidryagzu4N7sUHoD+HOf9cYtoiXPZ9
	QpWvOoAIHtlgjVMA/FlY1CXO9RYtZSxLNX8AZeRG0LHmbfD0g1h/T6plelVRLs3YqFfNTAhnxRA
	pAhexRlgkWYhox1g49w5XA0Ms+m2rfJ/aBqo2FrkbEHvigbSl3t9/Sg8ILLl45xe97yIisUY7Iv
X-Google-Smtp-Source: AGHT+IFRug0gAtFzEi7SVSfbVtJJPnSgb4yzeT1ZeS1to7j0mgIVY3nWKOx6iFynybRq9q6BDl3nNw==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr1003264e87.43.1734698812945;
        Fri, 20 Dec 2024 04:46:52 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm477812e87.73.2024.12.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:46:52 -0800 (PST)
Message-ID: <ca2f1f63-0682-420f-b447-eebe7ba66c63@cogentembedded.com>
Date: Fri, 20 Dec 2024 17:46:50 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <1f4b60ec-544c-49c5-b939-89882e1311ed@lunn.ch>
 <21f0aa0e-9df3-4b5a-957a-dcf68399cdce@cogentembedded.com>
 <b82ba8c6-b8ba-4045-bd65-b2cdc80d7df9@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <b82ba8c6-b8ba-4045-bd65-b2cdc80d7df9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> There are only 3 physical ports, however the use case I'm targeting is -
>> virtual ports serving virtual machines (with offloading features making
>> hardware directly L2-forward or L3-route most traffic between outside world
>> and VM-owned virtual port frontends). In this setup, some of 8 GWCA irqs
>> will be given to VMs and thus there are definitely not enough to
>> per-consumer allocation.
> 
> And you are describing your VMs in DT as well? And if you change your
> VM setup, you are going to modify your DT? This all sounds wrong.

Since this is for embedded, particular setups will likely be static... so defining driver configuration 
in device tree suits the needs quite well.

Still, if this is considered as device tree misuse, I will implement some other solution.

Maybe, add a sysfs_group to port netdev and have irq_index attribute there?
Then, target rootfs will be able to configure that via udev rules file.

> I don't know if it will help, but ethtool mentions:
> 
>         -l --show-channels
> ... 
>         -L --set-channels

I believe this is for multi-queue devices configuration, which is a somewhat different thing.

Nikita

