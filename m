Return-Path: <linux-renesas-soc+bounces-21540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FBB47C7F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 18:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B1E1899607
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 16:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA7C284B35;
	Sun,  7 Sep 2025 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5jUufKK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7891C6A3
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Sep 2025 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757264039; cv=none; b=VFFE/QJUR1hTdELRe6SR+0VpoZCGfFSyO7WLwHIJyqPRVegL8+jHf6gZ3HayXq711NKFtjibpIFkzVxKp2U8AJoVEkJPsVQQD843cL49b/a66DrT5ng9jqtpUNvs3Ka/3IkbjlDNLuGNME08AmpUZaAHujTvKajWgNuIw36a2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757264039; c=relaxed/simple;
	bh=kzO1d26CjYIrrTQIe92/xKi3tFUly9oOjSkcbnkMCuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOBaoMfdbaRf+tXgf7NCSVOhcuOcOJq4etx+XNnGFpXsNEymBel5pPgTdodsraE1bJjlC8WrQIITx6NiqS6BsnIlqqQbrFGKJyXzla2hE9ykPUd5YhAyYZuBldNGNLGaeHJSnUvzksf56Dhh/nPsYXtRZtQExTwFORP3QUy5cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5jUufKK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de64f89a9so1408725e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Sep 2025 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757264035; x=1757868835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0b5aHuLlyiXUNt6Qliaxf44IrLT4IpJ+TTQE8S1B838=;
        b=x5jUufKKaz2fg4T7KLHxacq3SpZEncYofMIMN9RYugNzKWbEQbLWQSpXV6Uiz3pYIY
         i6jrbQ065XWDBfZKe4sdmMbaMD/k1OBG3GG2OWh5/5ZE09iTXvvfiZ8ej6dzLb4lf63y
         reMlPlZNWD9o2302KtCUfJw/HbLp5yBuG1n1zoji9T7oQHXhcuR4LIg/86cb5VDEnzxK
         zBkdHHTF40jPpVQZuj7hSXhuWBxHcNQH76fV0+VCWKxRdHA+YvOZz0sgfjGQkXWqyR2b
         c237cn2jYlgQBTKO8Kgq4pHuhp9PqBRtmbxrjO8x/+xkDITn6Oa7JgGlNFRRw5EA7YW/
         PfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757264035; x=1757868835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0b5aHuLlyiXUNt6Qliaxf44IrLT4IpJ+TTQE8S1B838=;
        b=Xf2chpNFyJtwHiUpcYuLO+/7+cVFSLhUrPGL+gf6iwgo8cl5GplP4GWb7hdsPSJVyc
         9m0iZSuffEBLbttO374wIgCtjoRvD33rfREVaZ03viCpbMwY2mKuDqpwgROt+jXZp3Cm
         FNMCi/KyWa5EHsUNaT5PHoL8PcPmODApc+USoazuj77VIFEpTgtVSyHMjEixmWO305fy
         WYNEHiK+6Uf+yEfeGkTU14C7nhV4SXkatOTevAcbUdmj0BdjT+z4kSamiHILrEEHQVDv
         XPzjrQrjy9524INrzFoJQceZuBQ2DF3w+rYaSUoSc4e2+Nw9SrCgVYohzf/X9V8X+4fp
         mVXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3pciHtmxC9UYwMLc3lWM4aYJuNFf2iy1eJouPbOdymt5dJ6eeNH4x492idZmHbW0FAZmiewu1Ci38HavuYkyJ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvtouEnOYGxQCse0N0lFQC1FkNcARaVXDXGK8nzZ2Eg2Kbb1W
	aU/wT3mP6iDNqPkId2V1ZYcOYuqocVQUZLAxMpXVxi+jXghOj85wUWw3CZsaI9XEgOU=
X-Gm-Gg: ASbGncuNXo346HXNC3/44kxNs9x9ctGS2cK0K6rau6LFSatZT+bofbcB19BkRxDguUR
	1Vp1F89W8E/pTXprPSHED73OvfKWOM4xgK1xJ9ralArfhuUoXskRPN1cwxYSC7PKZOiaMXOXIr+
	VIjviuwWE4RjpwgNBzxjpMNokGBPJohjeJNswBHENE8/xYMx44PxzgiAEtmCN6o41wCiJmoi5LV
	01nt0/Fd5BF/2hpuYB2aBB+m1Q/ZNOS4LxeM/3OGxIt2KoJ1Kj6DKuY1iJ+tZt+goBHhY9Zqv33
	g6/FwJlnJUYVkW+IBA+7P1lxcLUs9ubocdsT2SBmdoFX8T63orvC/etXbZbsgMQa/SOyA5S/JhX
	wea7BUJKzttmxlLLayYA9OVX+tytDEeSAdYgsyurJANpzXgdL9PE90hD/BNXY9ZdMCxUVe1/mPX
	2ZWVqXtEw01w==
X-Google-Smtp-Source: AGHT+IHNZ94fIVYGX++WYDXw00yX2U780C0UOGQJV6w/oRpb58iICGyHaYRvQiH/egvhusf/eVZNpg==
X-Received: by 2002:a05:600c:458f:b0:45d:98be:eea6 with SMTP id 5b1f17b1804b1-45dde1a8350mr46418375e9.3.1757264035469;
        Sun, 07 Sep 2025 09:53:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:60a3:7ee0:86e7:cb8? ([2a05:6e02:1041:c10:60a3:7ee0:86e7:cb8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm135438545e9.17.2025.09.07.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 09:53:54 -0700 (PDT)
Message-ID: <c3dba3da-800d-42f6-83d2-1b1be050c5cd@linaro.org>
Date: Sun, 7 Sep 2025 18:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/rcar_gen3: Fix comment typo
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pm@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-renesas-soc@vger.kernel.org
References: <20250907154148.171496-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250907154148.171496-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/09/2025 17:41, Marek Vasut wrote:
> Fix typo to millidegree Celsius. This aligns the comment with
> another comment later on the same function. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lukasz Luba <lukasz.luba@arm.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

