Return-Path: <linux-renesas-soc+bounces-25492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5DC9B8DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 14:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8527E34469B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 13:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229533128D0;
	Tue,  2 Dec 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iajKt5aG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7630BBBD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680851; cv=none; b=IV1ziNiDo4wzokdLTEOCp1v/GYkAAujGFoW+F/npHAaSQasIhbgDPwf+2DrHDUU89pc7nHEINfQBUzmt6glh7yfxrQZBKHFJ8aVqHTEXJZJqXbormopUYsvV9k64ifnaOmLL3lhi8te2tWsojywG+nZVRz8bMEx6oKGHrKdTxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680851; c=relaxed/simple;
	bh=tNOJoqOtu81sqKG/lr2dAsJI5dtfm6oZr1MbH4zUCGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2Vl6ug90CILd6tHq2g7VDx86JqqmjirXtCGJgCLtA4NOmMM13/hQjmlGIPxAm6f7FPu94mY/kgq6N+2LDEr/MmGi4rZHG+GBV3pBIZrmJXDOEvkE3Jb3CNNcBu//xHNsYkYjq8MhpDbF3pYb1CcZShASzcUxQRs9bVdyLvPooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iajKt5aG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47118259fd8so53192435e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764680847; x=1765285647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdmicvdI6LvDwBq4jGS/aF6+e7Y5AiYEqgDkbGF73h8=;
        b=iajKt5aGm3TI/IVfAy9Ud+GssaUXzl0wtDbZLJF8BaRP8xZxx5CAZWmV12o5ABxAB6
         uMOIx7tHzla1Nytov+7N1MzLbTG9uKvwRQ9y1JGe7qdb9Xm8Yw8gonVlAyI6SGUpp5nc
         YWv2UbklPn9/KbESZpsVrQdbt4PXvGO2vnv8D6AfhRxSVFD/qGq1Q8ikoe6bA7DtW+Gn
         tCnnx2k9VdX9aYjp3zRXoLsV9vaJWMwjW5E8hlC1Gh4k3cRP3sTjg6N5pEtBz7j7qx8o
         R7AMgOLePxto4yZvXw9Rli/BOzOe8Zbv6Q5pkSEcrorwQBIiEzLI/yVmEPa+6YgPkFOE
         7d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680847; x=1765285647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdmicvdI6LvDwBq4jGS/aF6+e7Y5AiYEqgDkbGF73h8=;
        b=kTRNarmIW8KVIlBE3orYHSm2rIMIfTFMfBCG3gtpd+4b2jp3eQRQ5xLbpnV+Dsvgsc
         o2VSRiqIPSgIaAlA5P3LPddwePzsjKfqOu9Wx5vWP4OH9yTkEbifvNAl808odpsIHwtR
         9X7bS2RCBVuF2/p3tfILwrj897cmoRwDmLuK0RqlVk/Uem7k0P8G28i717WLB/IGz4gP
         OLrG9MPM/xATpTEsvjhybbGhhf4/rkmvmpBhMPzLSXEyts/ZrFVNe42/UZoGKUtGluSR
         BZ8qwuwHlsaF4YKQAMxFe4fw+Fdh/5qhHx8dWP4cOad3h1ZNTMbtPdp+JrBZdylNws4T
         esFw==
X-Gm-Message-State: AOJu0YydoW1bMhCK6sGDVtmXTJpaZuBzjSA/Qgs139zsc+mWUmWT3GWd
	YAhTpsOV/A+cGM+K5UNvpUhnWE237LCbf0h/LFUNqrV1RiSOVRHtXqeb
X-Gm-Gg: ASbGnctvH4RBkRUAjjldldlfAbZ8YpJOX0fwN/XNNd+gBwDfaHHteuieyGFBcArx4Au
	fzE3+wSMEZV3pBpeQZfAEV9Tsch2Na2qj41oxc2j2o+KM++cd5i+C+WZXk5TAiqkkMQlhkIum+e
	e63+7ONjQ1q0XSqkKrKjFbqlw5YG1DL8b/Fujp46LCFlhQMj3nAocMb8HMW6oibGa8VNvFpgSNW
	sYo64NGuAeqs/PtAw8Dqr/ZdHr9HuT21OOdGXkEYNZUlPQjEX2PuELW3HZvTh03o+i2leUFQDdi
	XygwC3YLoguK5W0WnR0z5rRLjek8ZoLqmUs1IHWO0WMSl6Db9L+qxiTlL+CvfST9Xd4it7RIRdF
	4JLnbvCsdsbrYYd+RUUhD55peLUs67tpzcTtE+YGQ+nhakTeVL+UEP08ReJm2K7AWUokLcaY6u6
	D4xbEd1kHUDgGkeOhsIQ1rT7tS
X-Google-Smtp-Source: AGHT+IGJNM1K23jLf3CUzH7hm93uVavrY1rHzN3a4AlHQzRCzjrr4K4sOdr6bNk5SmO5hXzDZcV9+g==
X-Received: by 2002:a05:600c:354e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47904ac4380mr280957655e9.5.1764680846874;
        Tue, 02 Dec 2025 05:07:26 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc186sm355959705e9.13.2025.12.02.05.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:07:26 -0800 (PST)
Message-ID: <83cbba4e-af8e-401f-9bc4-9799a3fec551@gmail.com>
Date: Tue, 2 Dec 2025 15:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add versaclock3 support for RZ/V2H EVK
To: geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 biju.das.jz@bp.renesas.com, magnus.damm@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, Ovidiu Panait <ovidiu.panait.rb@renesas.com>
References: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Geert,

On 10/21/25 8:53 PM, Ovidiu Panait wrote:
> Hi,
> 
> This series extends the versaclock3 driver to support the internal
> freerunning 32.768 kHz clock, which is used on the RZ/V2H SoC as RTC
> counter clock. It also adds the dts node for the RZ/V2H EVK.
> 

I wanted to check whether you had a chance to look at this patchset.
Please let me know if you have any comments/feedback. Thanks!

Ovidiu

> Best regards,
> Ovidiu
> 
> Ovidiu Panait (4):
>   clk: versaclock3: Remove unused SE2 clock select macro
>   clk: versaclock3: Use clk_parent_data arrays for clk_mux
>   clk: versaclock3: Add freerunning 32.768kHz clock support
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
>     generator node
> 
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 ++++
>  drivers/clk/clk-versaclock3.c                 | 126 +++++++++++++-----
>  2 files changed, 120 insertions(+), 31 deletions(-)
> 


