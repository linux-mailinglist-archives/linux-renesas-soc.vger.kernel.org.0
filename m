Return-Path: <linux-renesas-soc+bounces-24749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0614C6BA05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 21:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A56F84F76FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAE0944F;
	Tue, 18 Nov 2025 20:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQMHKd1W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1D3702E9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497597; cv=none; b=EhAbgF4jERVz+WI/6G3Yk3wPvcKd0Gv8VvUYOAk8CbjiyxXmuQRtqmgrhTO20FXjCmdXN55CT+e902BiW46QhVX6hMu2RfWi39k4F6BM32VfTi9ujo+HLtFYDeVjE5kL7C1etWIFnBp28n+37SZZoa7zlA3ySDUMU5Y9I9Xr5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497597; c=relaxed/simple;
	bh=JfH/6+KMmEpgi/KytGQp/GzL6YnN5/2Gid/fMV44U4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjH9kW0FTHscPhGYxYb9u+K+Dltv6nMxWL0QrthrWfh6uk+1gzPMHugg9Ey/Q4NjJkWyEM4gec1JrhvOZK4Cu4VENbwn9cMyqKyOK2jhzcU+CvUn+pNLrR1ljVjycrVsJJ1FqLc5VzS8YrQtifrO5kgaaKHxsQQZ0as+81HfjFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQMHKd1W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso39738485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 12:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763497594; x=1764102394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58n52squ2NHcZXIzl0xnBGsU14M4nY74fB892TyckGI=;
        b=NQMHKd1WvmGvGv67NkDJctyyAGUfwgRJPXamrgy0VRrmU5qKOvR+faexDUvz9/bJer
         tD7vEItfvClIqreyVAZ2iN4A38FnvZOJKKEdwZluqh2clfpAI+JRyEGr2xAOMxqr5V0U
         MS6WMWtk7hTHcSgW0Z+lJ6gF+hPI8aR0kcXdJiyZM1R0za0t8c2UqTSh7wzpF+QhPXxR
         9wU0/v+R0FKvS7n1HfNVp+O+H5OyP/xLLqs6K5lwBSSLV9SqfgZihHY1Rq1rPMIPhKlY
         Yi0HkKnw0M3SdUTjE3j8nq7+CMBpnoESBh5Uy9pcB8oXqcmxdPtV1e48JYAgq/SLO59M
         wkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497594; x=1764102394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58n52squ2NHcZXIzl0xnBGsU14M4nY74fB892TyckGI=;
        b=Pv1KcOJDlI0EuuIbHHd/1Mbd/yaGZ0huK7ERdoh7idDGjvJonVcmPiEJxGMO/6noox
         O6sFgBHncafdKBewix7yfMG9vuJWa83l4x6EVydomYWKSoJ8GHIS3v7I9nZDSPCIXeA4
         MSmgJZooM+yrn2dxitdhuE4kMaZresyANJM3n3qV/UBEIzSnJPKDCZv22z5lhlFIZkPp
         rqrP19UTadyVp+QM3wveOg/k3XWbm0bbazlDn9MdBZpEnp28CfMqXi4uhXxfH/XHvRPi
         Cu4yQ6V+JOFswGACSCX0TYvtcqvhcK2eB/B5FlJVpoJqzLZQzFe7+dpdvyqc8r/xSffU
         1bog==
X-Forwarded-Encrypted: i=1; AJvYcCWgOWfghoRjwdvhtRH4OQTDshq33v2/ZS38Kb5WHJSpMjepIRei0gDXfyiMiGJ0/ZZrX3SnqWuDpNpdJHANe8Bvrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUp4Fy6887f2DAMxKEBdG9gwpAXM8iboBZi4CKtjFYeu0pQxMq
	R+URK5RvVKKDjyGyEkeGECRuzDTRu6TXnO8hKjfyizHqifen28wGTPeeAn+uorBRJ50=
X-Gm-Gg: ASbGncuhYTA1eNRmmLAAgbk8IQY26RvRjON52ImL9oaBHbIV7+uddCCiLVs18To9LSD
	JYtNdFbhYBSnFss9UvmKQZUzAqOEnWsWdFrceAXskQS8PQLQfWwvGoqb8i7U10PMxMQ7c5TMG5n
	El688fuDQNGqmG7Fh7LbPEorRR34vnDWauijmWfO5BsKPzR5zgGjbXJ3HK3JiIYzJNfhameFe/t
	f2w4EJqrOoHKKqXrjHhslkbRej7FOdkMW2u5VIZWWj0MvuPVOHrz+dB56gPxo2t+DsqkH9/WaJU
	rGio26VlNBl/GWXb5lohy3sXyMQvobzahH3GwCvuOhpEILTP2TNa/E3W2JPLB5yeGvYOnFlVJjG
	aKbSP7Gxf2P5CfQ20aazwWZ09U0UrqblMS2zddB6h3eMCBw37bkrROQhltcf7yEnbyXLuaiyCTH
	i4VHwIA4atbQapqzQ9mW9zWbimoB4DmZIjF+sc+cERRxqeL7xEgYYRp2Wu+RjSa6dtJieRl7ntQ
	gaL
X-Google-Smtp-Source: AGHT+IH0txy5CpznnZoAGNS+P2qcJ7HfIT9ifhZPa4GAvx0Np/wl2WDh4w8/FlUPTsF5BHdHPWzAtg==
X-Received: by 2002:a05:600c:a43:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-4778fea84e4mr148216745e9.32.1763497593816;
        Tue, 18 Nov 2025 12:26:33 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:3006:e9fd:4de4:66f6? ([2a05:6e02:1041:c10:3006:e9fd:4de4:66f6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b1025707sm8390165e9.6.2025.11.18.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:26:33 -0800 (PST)
Message-ID: <b80861d1-023d-4b07-9af0-a42e32e6d9ee@linaro.org>
Date: Tue, 18 Nov 2025 21:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
 <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
 <20251109143708.GD4126953@ragnatech.se> <20251118201832.GD505486@fsdn.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251118201832.GD505486@fsdn.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/25 21:18, Niklas Söderlund wrote:

[ ... ]

> Just wanted to check if you plan to take this patch in this cycle, no
> rush. But I don't want to start trying similar fixes for TMU before we
> have agreed on this one.


Yes, I picked it up. It should be in linux-next


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

