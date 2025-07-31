Return-Path: <linux-renesas-soc+bounces-19807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA9B17272
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 15:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DB801C229F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 13:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C795F2D12E2;
	Thu, 31 Jul 2025 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEin94r9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB812D3A70
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753969834; cv=none; b=D/DW7fuvQJEmbxzXP+C2BUq8qFdvd1JoBD+VNqjODbIv3DXWWgRM9WLrNfiXy1oviuT5WJg5NeuWbWxtsdHlWQdezmg0lxxXsX/j2jW5DbXtzz6DUomfqw6ybMVI/jOluK6i+YDk8xsQHXuyNG7O+ukmoXD3LjHJ+BepzqSQRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753969834; c=relaxed/simple;
	bh=5lxg9xauO3MeUewoXkq0nnjCyipVEFYu1QiDLPz8HQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/i1CY6XlmzoY/z6/8EPBJszNlYiUy1PuhYThHJu/Tdv+mrevBKHSXTKLL79HIaVleVv73/mDYPZNOuKu4lDfT+DMc4ewgc3r/L0TR10Uu3bHpzT2EfWh+Yw14CgQUNvK7h/1CaxURbhj67TureBkiH84afAOIViUtDnAoz3Kq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEin94r9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so395914f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753969831; x=1754574631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttbP0UASnXnUPdgY4WsQTV6ycnU/sxDT3VHkXEkJ2WI=;
        b=EEin94r9Pn844Zyh73bk8QooVaAByAK/ZD/7zPUUo+j7284Sfrxmx30l9IGYkMmcSb
         V/xHfU0EN0r1W0tX3NDWz9JMR4nHg63LYcY1B6ImfiwbxQIe/z0IURemAQb/gXI0CQZ8
         qCJ01GRVsTdovMWPmd59wET10HDK++ut8KYh2DWNiAYZvyttrdak/Z1c5OOjXpxHzt7u
         neru5XrEb/gK8iMxnNfzg1SGXss5o+Kpj8f6BrGJoreJf8YbDi4wCuNkzoK4RVC/KQvo
         4YOCScHhGPPhJiAUlBQdgUBa2OADaVnXzIQGgS+TMyJspSAoPNoSfD+JZ8YCCxJopYjI
         vMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753969831; x=1754574631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttbP0UASnXnUPdgY4WsQTV6ycnU/sxDT3VHkXEkJ2WI=;
        b=ej5svtHFR8pVEjVeo5LbtSRjLaOh2M4vYWlzZ4F0c6ZiJdYwwSbTTmY1ut8T6OAy64
         GBH0oXatrDDa3IWBZ0sz+DohLsOKW6PPaB4JU4+/f751ed/qByj7h05yGg0x8Uv7YjmU
         UWOu04zyNpivQ7XWoWfOBf3hnTXtb7GT7RIxFb1k7MJ12kXZlLey5RdjLKAGIp8ZqPtJ
         03X+3J1oYPi4dxLX+s+US/xnW88UIG4TwH8W+/gnM3yPLXintdTsQlYLZShW/LN3pxe6
         VAxFFJmZ5MaNjbV2F/A6v4Zm/s66Z/oc6ibE225P1Mpgi2VqgKxVtmlqniGrckQNak98
         9KGw==
X-Forwarded-Encrypted: i=1; AJvYcCWte7Q8yIngDZ3yhELOUWGkBkcrgDnxKnqHkkLHgwAg2b5XoxelS271iIKnWeg//p+32WpODnYKzeJ4I7UrPvszfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQbe7sMJK4HXZmYb4NnKD4ZMSuUut6O26mIktmtW8OW4eITlrq
	GROq8Oh9siQ3IxHYSyUDgMQl3AG8BTnAZAIARJ4oi1NgkZe1YhfwgrZutISqQiZSVpQ=
X-Gm-Gg: ASbGncsjnM0SCZ1M5lRebDXzIUOCLrGOgweZyumrEgiFASvvHiHpdafzis6kvUSle2w
	ruKlfkt3cuoT6UV01LFPDTFtV5MNkL907NaSq5kG6pa9dPF/sPMnl2PuHvV7l7SlADFvnsvxj8C
	gu5iFu8f6OapQh3OC0oH57IYEuapRrKEKXnZu2NYMjUkAvLqbCaC2gC5fSPYzeQ9c/gb64vGGAF
	WTTQZJwFCDmoMnuL0cGgVkdBh1T3NVl59c8Ky2DUyK53SzndAVfxdv1kAB/vjeF69I+lwp3wHLf
	GsZI9Ouhxi3Ytw9a/oXJNwkQOc7tc8/thTDlVAHRelEBTCcdZ6FfszdB+hV9sT723O9/g+YLr+2
	u787HFyuxchbYx9DUZD2hMyxpoK62En8YSwIwljrHRZki6bhAkc/q9QXAF5eRaQ==
X-Google-Smtp-Source: AGHT+IHe5lAzWjWDvJCFogBIEALW5gpfBqEkMqvYFQycFRK8V9Sj7RWuB+XR82yqOPaZ8o9Y1wrxQA==
X-Received: by 2002:a05:6000:290a:b0:3b8:d082:41e with SMTP id ffacd0b85a97d-3b8d082070amr978411f8f.57.1753969831203;
        Thu, 31 Jul 2025 06:50:31 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm2657408f8f.46.2025.07.31.06.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 06:50:30 -0700 (PDT)
Message-ID: <b9e7954b-442f-459c-860f-909decd87979@linaro.org>
Date: Thu, 31 Jul 2025 15:50:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>
 <fmn3mrcbih3oq6hgl45jipdofko46ur2sux5p4lf3nzlpahklr@3tm5molhdfdx>
 <n4ivjvd6hq7phwkzbmvg2tqtejc6ufcybslnyh62kegjkhdvoj@cvfjwstrhlwh>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <n4ivjvd6hq7phwkzbmvg2tqtejc6ufcybslnyh62kegjkhdvoj@cvfjwstrhlwh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2025 11:41, Uwe Kleine-König wrote:
> Hello Daniel,
> 
> On Mon, Jun 16, 2025 at 03:08:41PM +0200, Uwe Kleine-König wrote:
>> On Tue, May 27, 2025 at 10:58:22PM +0200, Uwe Kleine-König wrote:
>>> With the goal to unify all PWM bindings to use #pwm-cells = <3> update
>>> the renesas,rz-mtu3 binding accordingly. Keep <2> documented as a
>>> deprecated value at least until the in-tree device trees are fixed
>>> accordingly.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
>> I would expect that with the positive feedback by Biju Das and Rob
>> Herring it's on you to pick up this patch. Or would you prefer that I
>> take it via PWM?
> 
> I understood your silence as "Please pick that patch up via your PWM
> tree" and did that now.

Yep, sorry missed it.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

