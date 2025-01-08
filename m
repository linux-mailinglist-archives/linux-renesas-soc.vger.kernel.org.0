Return-Path: <linux-renesas-soc+bounces-11949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618CA05711
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 10:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8FF67A2ACC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 09:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135221D958E;
	Wed,  8 Jan 2025 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACNpvjNc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A341EE7D5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jan 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329127; cv=none; b=cS/afHgois3yK/MFjoFV6T9EuzQS/VCy0asbPtH1iKqH58lMP8vPJdF0/hRt3OrbpfwcQ8ZV9ceF1kCukvKAmKHRYQs9/LVv9FallyqvMONAxgD3hfnaWCxyoiQIC45Z/yjZLLo9xWhyVSg0quUCGFAw7orjQpOGYmZSZSDvCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329127; c=relaxed/simple;
	bh=fz1smqCQB8ex4yyzmTLxdzKTkRi8YQAovOMZKR5iB/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=By0ZiyrrGMvmB6/ObBhYfRZFY1WYoCPADC/FkIh1Axa+AeyeQ5K4BNV5S6pn6ycFF8MHq2Dykw9rsue9GOY6EN43eP1OrgaxUOGpfdErQ4t/AHjvZQrcMncrQAJHssybbh6xlWImlIntxTdT4Tye9ZxVl+OfPhDInZwnaCDXu3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACNpvjNc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43634b570c1so118189155e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jan 2025 01:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329124; x=1736933924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=ACNpvjNcsHqJ7HFRYOM4D54vFEaw9uFUQpSH3B/Ou0XPoUO8WG6I4k+UbW9NWvOSKP
         lPtbi+HhPWUx/uZ9A4XYxMddBet3qZC9dcwV6FpWVtzTvubtJh/j/J6Ou/LUNYOQ5jtK
         SHFCg4z0HTAfjZU0inxYl8OXyrf4KnWUKvlSRLTJV0IM0AJYO5p2PNES3eXJnZIURYqc
         NO7RY6+pC/9MeDutu+Od/7Hu58MiY/f3q53KJXHyGNXTypWZrUa0aABs8n/6b/7pMcv6
         DZ5zRUq095y6LjhKDk47QHymDOBXGSpy9PEawgRn5Z+bc+bAGxpwhRhcngksPNh7AQF1
         eHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329124; x=1736933924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDL559tBrr/c+O7uNT1qWo/LHQ82r4NDbguV4lcJTVs=;
        b=lD1yISPncc0et2KQaAUFpE2tLwRsMzf4nXgaOxRgZ4F7jIpx8e4iuLV6zE26U/NyPz
         S6WD7R1ZNiL1hVv3b/QUK5H74Ifesgq+zrfOqOs14ZJ1KeBchk6QNULZNXosWPOt92ob
         08BR0hHAgNYjx2hda26sAS72ET+X0RRQLnkrcGGmGppTMpTNdRTuowMekgFGCT0+y4XQ
         FJa/gcO/W9ZlD1trvDaF9tzYyhjx3w3/VGagxxF/UVlWuu3lWKPdtFLoNVP8kRxZcwta
         eWE0kBjRLEyur5+bry8tWqmVUT874yrLuhy8qb6ogf6a4KTnkjIpoW/KlGyWOgDuZTwu
         ZjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6d/eewlz9OsN3xNg/C6rAOth5TgV/GOusMqepF+rbFgaowA9yj81/iopv7+tWKee/s+ebazDLB29FHXryaUSieQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxonSOs9T4z0qkXPwLFGBwc0nmqmXLEhCTiYI0kJXvd/z2t3HT
	jEPjWK3mK5nfvpgXQjmAWLk0NwXiWQSyh3WXq1uauBDt1TL0abXNBnGluBU7WJM=
X-Gm-Gg: ASbGncsgYMNs+xqiveFsoBA6oMRPLED18aWAJD1+BxnDmbluti1VCmWBrYnRpAsiEqB
	O1v31ODx2WlynvQArSQvhmKhf5hl3q/xUGkz/1FPG6ixd96WVyNgTbIdu2Zvr9hAowx6DANHxaF
	q/M8XO1vIuugCvfKy9lEDUO7ZUHgVnx8707TDKhqhoNAZJHUTGxQPOjF8yiKZcVbpjqPZsokRw2
	Lq2Kthdo2jT5G4W9A2w/O3Psc2mte4h2+jtZUDPhcpYyOcFaTqfGt21We+X0phT3J802lzTK+Lx
	PwjmfzBA3KBeePm5wRPU
X-Google-Smtp-Source: AGHT+IEYud8HXrnnBRfQKSjaBRvM+YCl9Bp382tGy2B0NHlzlfFxJe7Ru+DWxpOuAvFe6cE/t2KRgA==
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38a8730dcf2mr1495919f8f.27.1736329123722;
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8a636asm53864908f8f.88.2025.01.08.01.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:38:43 -0800 (PST)
Message-ID: <71aceba7-d610-4550-a8a8-352c8dd4b44f@linaro.org>
Date: Wed, 8 Jan 2025 10:38:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250107131024.246561-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/01/2025 14:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

