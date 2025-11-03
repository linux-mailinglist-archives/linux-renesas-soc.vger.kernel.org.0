Return-Path: <linux-renesas-soc+bounces-24032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53317C2C828
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 15:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56C263BA51E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82BE3101C9;
	Mon,  3 Nov 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8j/TBa9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1BF32F778
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181644; cv=none; b=qi1fKkDfk8wuP9KXP7qSb1DUyCriyoSJpCF08YaCQQMAhSDKq1L6x+O4+YQES5WJVC36xZKGbrsqTNdojIJ6+2lohs4JzSTTGRUtyezPyGM8tV8/M3HWIlHUdkeYKq24sxtMAx7hycaAWKOMaaMd7rNYOnpgfvOoS/JgXgPzQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181644; c=relaxed/simple;
	bh=sNB4DP+NVKXfzWy4KvGH+U0xLYuWU5BMgcDVvPR0tD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIWxRC6h5WUhrfoVIOS9QZiToSvI4bm/ifQv7RC56f2TLSyrVMNtF5pXKg5KXKqWTE8Byl4QNJrb4xH1nb8Jfj0eDTbByv8hyre+qksVl19IWtbH71yFLu79shsKY7tUOPSwwFyI+MOm4mwb5bld2NxqxMA9emth3hx+5+B3dpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8j/TBa9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b70b40e0321so9970766b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 06:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762181641; x=1762786441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4zlt2st3KjNZknlasQR1Pvl9k7Noif9jYfvKheX0rRw=;
        b=Z8j/TBa9CEOKFgGhEmcBvF6+xrXhyp+7e4+45doPV/GnHh1l9Xr8g7vxRgk8XuVAC+
         W9Ln0w8p/En/44QE10BpgpWogS3dSYAKn3/J/0RtVarOtSoyKOwW6u2rhRCMGpK+ZX7k
         CVXOTkP8DxyR4AasSc4nASUDUgNb54RzUBpDnqAYD6JRo+ebhC4boefvUwMF1L92G/7E
         K3UwKX0jppjl6sJUEyuuX7yz7I9TtYnsTexhiI/l0qmx8huSxijbrP/th5dmThuEgWVm
         jidvkWReHsuUDawoQ1tBZs1iDGwuyPHWVb15/qK9j2X7waJTPph6pBYmwWPrWTCQQkSl
         k9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181641; x=1762786441;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zlt2st3KjNZknlasQR1Pvl9k7Noif9jYfvKheX0rRw=;
        b=L/qu7MQCk5UxGltWDUW0hV1w69c3ZOQTcmRAv9AxUl32ncQKu1/adAw24rLxIZrSNO
         O7U3MbWeMQXZruu+FF960Xtne2HHf5YMcdEBpJwc3rIf/jOY3bDEbFoURhp1yII9wMxa
         IIYpai/JebO7ohTDvPawhvimrcATqid2d2MbrDiVRwnCeEFsnciuOOQ5mUIy0zBU8dra
         fdcFVmFPke6CFiyexCTzpvHRjFWzwW/Uk1Knjym6zMzB5QICbVo68CYavMkYlKlOoqKw
         gSyqZ1eEQj9jUkwkFMbQBgP8TjAid7m0kN/Nba79UzY/GIvSmJkl+B+h0xRumizZVyLA
         JxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLv/MQ7lSayf7/Yj7DPD2q5v2pkXrA87bLsWtGpbFndmfXvFVm48oWHfnco+UvY0KvURjdNRjTKP1ssA9ocLkonw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Be+cV3DOchzSxGCDaJM5rga+C6xOT+CpuONUHSMesoij/zO2
	wZtxZWzMu1ZY/qn0ee7FI3bxFY9gkWCvNx/EdBMJsxD8gfWj+R6qUfia4Cy5AQqneQw=
X-Gm-Gg: ASbGnctDjyW2FmI70wG9VnNd1IbK+pDcwvgAwywg4cs9dklA64pHkyvKbglQOL28u9M
	3OUAQgK/lJ+hcNVNFZazQqmQGwZyOuh6qSU6AlIj5FUwc+hQQUJtA+eVgNKkDQDQU/oIgM1Fp3D
	rIk9I0Q1lo4dbbHdx0ik5qrkMVAiesO5NtXdESG0RMfrdqDT3XkRiuKUbGwRoFe+jXwvfdXRg+L
	V5GnS82rVUZKVjv6bR3O/5tP6pRiyQD/rfrgZ8ZJ6G8HfXc61ZGURRqaTCZzYW8PX0d3URCpH3W
	6JBFWkVlOo4UgxgjZ70RD66ztfhWKDI9YERErlKRrTo3jKzlRO/u29fN3WlZbMPagqklQTPCsdu
	FnLMKbQFP3l1LdENnOMA8cvuwNwE4Dt5PXs+faR8ZTS1TGbaPdmeRITw4gZrcvXzdxyZuBJCdo9
	33Iwk4ERCrk8DwstQqYyJpJ5UlVj2p3mk=
X-Google-Smtp-Source: AGHT+IGVBnoTQ9xShtHQPuNgDFxzhq9iT2DOmRpjcKzOwC3rwuitrkgjDREtQp/1G7SD7UiehflV7A==
X-Received: by 2002:a17:906:1450:b0:b70:b002:9dea with SMTP id a640c23a62f3a-b70b002f002mr239321266b.4.1762181640994;
        Mon, 03 Nov 2025 06:54:00 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b2b4a802sm476080366b.23.2025.11.03.06.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 06:54:00 -0800 (PST)
Message-ID: <9ba9f4b1-5bdf-4242-aba9-8035571caa1c@linaro.org>
Date: Mon, 3 Nov 2025 15:53:58 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] reset: always bail out on missing RESET_GPIO
 driver
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-5-wsa+renesas@sang-engineering.com>
 <35f619a73a83207b83de095967014b03b7d3e8f0.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <35f619a73a83207b83de095967014b03b7d3e8f0.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2025 13:54, Philipp Zabel wrote:
> On Mi, 2025-10-15 at 22:59 +0200, Wolfram Sang wrote:
>> Optional GPIOs mean they can be omitted. If they are described, a
>> failure in acquiring them still needs to be reported. When the
>> RESET_GPIO is not enabled (so the reset core cannot provide its assumed
>> fallback), the user should be informed about it. So, not only bail out
>> but also give a hint how to fix the situation. This means the check has
>> to be moved after ensuring the GPIO is really described.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Patch 1 applied to reset/next, thanks!
> 
> [1/2] reset: always bail out on missing RESET_GPIO driver
>       https://git.pengutronix.de/cgit/pza/linux/commit/?id=25d4d4604d01


Why? This wasn't tested and wasn't reviewed... there were objections to
this patchset and long discussion.

Best regards,
Krzysztof

