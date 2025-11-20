Return-Path: <linux-renesas-soc+bounces-24883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC1C749BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 15:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A41F4E8794
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 14:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD7123C4FD;
	Thu, 20 Nov 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rwL7wWdI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BB1DE8A4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649187; cv=none; b=Kai2wzUPYMjs7EGDk4adr5V5ruFj2IGP8/5Tbdnq2Zm1sSzDQxdeEUUD73TJb2KW9kiXpZTH/omJpXzbXwrhdcf0oNu4fYtiK0MALlnsorpDuocfItCrouK3+Eb4AdbvjzBcsVsOZ+M8+AyX/XABHR4fbXUBTGdNMkfxfuWvtHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649187; c=relaxed/simple;
	bh=g94W2Q/Kh6Xh7xJQTHuKAVhkV024rb3AUOYTPf2JMdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j00AVJgdufNqLG6d1Wg0sI9Ae74XbCTsCQHp6zTVjfYv315RYw+qihdllDfB4P3V9KeWzJ5HJaGqBE1hpKQcTijGHwzUveQzlo/usMk7rBwzJzDcBLcb80iTuo5KI+Mjsgp28Dii6N1HYxeljWcLct7I2uidKa92X95Pv3Hdzug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rwL7wWdI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso9359945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 06:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649184; x=1764253984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjRZENQ+4nAVbqIuxdQaWCBPLWKLGcvWPo37O81CXX0=;
        b=rwL7wWdIeGJ/bWutTMbSJYCelDrPrMNqMljH5M3WJzYd7pwQVd4LBKlB1pit4MyEJs
         i8xVAfhepbECjsvhK/cQefgx/UDSLC0Cem3WZ30Ijt9fOZ9RyjibHMAiXNSmqdUU/Cul
         ctQcgBcwjiTvWe95Ec7KGsuZ67pQxQG+WGEhJmHCSO2EMK8aItWJ+v4VyooeWNVLfYeP
         dNc8AXGw1FvHw73RnckLNufcelH9ei3Vc1iTyoLabANTFD78itLxzTt0S/UAKg6d9Rqc
         Y/ybG6gLC4KEzVxGBQmWQCAsQZG8d6QAJFxgxOIsKB8NneelfJSZs6ap8v8eb+mf0GFb
         bLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649184; x=1764253984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjRZENQ+4nAVbqIuxdQaWCBPLWKLGcvWPo37O81CXX0=;
        b=oDLTWV4IiZXRqJtNOe66Ce0W2e9C7XG4NXC7Pds2SVWIb6crM8pER99MxM+K/LLzzz
         wy+LpNUxctabXpz5vgh5DqSS8Rozm6bTxv4kDBaoQnRZCxbrfbXpDaTu6PJoK1/yRCpf
         MUPyVZzBqhe/6FRfbgxEwOjy03HZw7FIs5yGgIhISj1Wza5Xv9W+sJSzbzeheN2EmCCk
         SF+OYkly0uWb/9SybdBdj+F3EsSCDnfGc0e8GRe/8s/WJ4GQUkUpgvPL2uvISciUvcFt
         LwGzL4X9gkf0NOeBRVk1gesMRZnlUfM74FwMtyplHxtPxoobuk6eTn28lb1czzw1N21+
         y4Cw==
X-Gm-Message-State: AOJu0YyjUlrmYMOhuHb/MGIUsSjFs9dl6pMC0GXyQQ05hAQNRiXLU46V
	BpPR7TolcsddBjGYW2NN98EtFPENDBn6M3SdGvYt8Cnnnf3XdOh55G872WKDTcCtKkHN7cTSJw8
	uu5NcJvA=
X-Gm-Gg: ASbGnctu+L+OKqHXqRufBTwvgIghE8mybRqhAW/v3Q1n6q55q1O9aI6ZzCNnJhDEgOl
	B2amgx8t9SHEGCb1topqmqGmIBr+B9brU+FxyORCKwXlRJkqDRt3Oxlr8inlGscONtxGZJ6cWg4
	fmL9l8L5/zKvBQ9UqWW615yfmAxT9kYGF3UVi4aN6K3ttO1PwJw13YE5YmfT00vaeL5ga0nm/hR
	MsBSI9QQY0UEj2anR1osk/gWENyj+2L7UhJyHPY4wWsQpNmoJ5m2UOf6DqcPkZW0GaoWpC+Gsfv
	aPrUPJOoYCrWcV7dsuyHskYk/kRvXm5AO31eCm+vY0QRy2cz7JS2THvnCFP894e6MXp9NVdBPSc
	BVdeOu/7uceNh8eOetY3Rt4tEweHdbvxGduxMuUSuvO9AaTkKN7jbAEaDMe7FweYY6VixPz2Tjn
	1xMQQGJCwA9lYupxnkwHKaFn7HodcjfOh8Y+PQTmrAMkqzNHaXh/jfhmkGr+3KavALqg==
X-Google-Smtp-Source: AGHT+IFrm7f3D4ZpMOXc9Qkx58CciFrYbEpo9cBF72r6dlhpL8LKHFoMnR3Nqr9ZhUCz2EUoKnZBLQ==
X-Received: by 2002:a05:600c:46cb:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-477b9dc06d4mr31332835e9.7.1763649183596;
        Thu, 20 Nov 2025 06:33:03 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm68949695e9.0.2025.11.20.06.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:33:03 -0800 (PST)
Message-ID: <c9166508-88ce-471b-95f1-65a6bd5152b3@linaro.org>
Date: Thu, 20 Nov 2025 15:33:02 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <ee03ec71d10fd589e7458fa1b0ada3d3c19dbb54.1763117351.git.geert+renesas@glider.be>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ee03ec71d10fd589e7458fa1b0ada3d3c19dbb54.1763117351.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 11:50, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car thermal driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled, while increasing build coverage.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

