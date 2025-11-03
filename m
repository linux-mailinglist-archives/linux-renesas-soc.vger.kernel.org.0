Return-Path: <linux-renesas-soc+bounces-24040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CAC2CCF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 16:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A6A189FBF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434E5313E01;
	Mon,  3 Nov 2025 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8cwaqOJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBB4320A34
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183572; cv=none; b=UmqD+qEVQ2DVnAp07S8Hoh0AoCvWo0rzivYC6C7FHCjTUcGWfzlQfYmgwfML6gIPh/aC4U0MR/YXJK54MTai0JVs8ybP7HnXqJhk85VaxVpBX0yiRzkEOEDSHXqo692n9dJvumKlcq+L+xGgzISAyMvzgALC7/aqo3miEpRR9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183572; c=relaxed/simple;
	bh=D3ds/ErQYUeUim9iowe0yUVn+i3cOriaf5Ex8lux6pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R63vb8evUNyObNOlmJI4uaxsq9T2Z9wB9/eoUXhb/uRRuTgWyYq2n+Qm67iJIzoCdiIkqW3WaIiySaMDN8cTC2Oq7CJN+Po8d8LdwBIbulP3UNF8f7VCQxxxhJE3+0B1d8ah8PO8xaC7W2ot1HX+n1iOthFyvgbJt9F7yvd3l9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8cwaqOJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6409cb34fe0so427183a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762183568; x=1762788368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VdUAOQ9UfYb10NpKHLkwpV3JaSley4T2F3ae70K4wwQ=;
        b=B8cwaqOJ0ENcNb6RN0kA/DvDkwiyBcC/MsvhznfdWZZszrieoVyz5Rc9Fg/q2YO1zu
         2jsT1Z48ryYe909d6l7k8+5ZnmCq8oExDNZs+zUUeVFadqV644UsV3d2Gnsk0YTU1u2I
         4QgZdHWjIUOcRDjzhauhFmY1VEWgAE/x3vguozQQ+fMXqyIW5gYMm2RSjSD/cZ1E42v4
         AWdvWS+iqsWTD30aLzlvyml2UzEIVAAHs1OA+1+MTze/LxDW5YAT5XQASS+b1BbWHhrb
         VcGXCB8mPrVCM3nWFHy0Jnk08wUIOK8b0QQJ+FAzy/Tjiq2hcBy7S9qF+PTNQ3/I/e1r
         2OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183568; x=1762788368;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdUAOQ9UfYb10NpKHLkwpV3JaSley4T2F3ae70K4wwQ=;
        b=bsv2lDTobpdry7KtF/z0xfIIXdKiTn5XzzJ7IEv3qqxIbbhuUiyxnd/3sOAMwHnUOF
         q/xNapYMK/z6kplzIqSBPFY68SgutRt0y2MEuFNF+Z01iGSNF01B+nPRwlwlsnmNgpam
         nmnCLSvbuSKV7hgS/DkX+d9yD3TtU6JbY9MhcP1Ul8E8ypqe2x7ZeqFCAyRYBmOw5J4K
         xfiwfI1YHmnpf0/jzzfGLobI94z7+UW6NT1897hj/Mq0Nvx3OgSVulsNs/anVYYd5Z11
         /nxmCsOezZ1lEYswMHfQxjKigyf6m+wGNr0/WVUXCNg4cHyDj0v4S3SbPDhMuXA6oM1m
         x4mw==
X-Gm-Message-State: AOJu0YznHB4hAKKjg3m2FAOqkHeR48uYb56nv4ILTo216C/CD/CWUq+e
	8GyPU7CFxOQKBsfIyzunk3JqPUsJAss28Q5rFASlGmGnr1ho4Pz+r2ETnvgG5mBPe+cuvBacv4D
	DNXzp
X-Gm-Gg: ASbGncstdFsOcAb3uUaN8Upp/UKT2EMgA5GWy+XvvrmH8Ou+q80gXu/US9Dujru35pa
	3gZ2uWRbL/hT6GPotNE6PfhfX+IOWLf+h1iKDePrLYz8jl2ty/x866asf4jtpJyiTMV8obghDuH
	On+P7Deck+JUr2TPVcmHfteqqgo4UoEfYNDxQwQAh9xMcheJNwdgyZrS8kQtDJCmDwkY5aSTnh3
	yrrdwVPTepuEtMd6iNsoInfXaUL8NJdClRJc6Rn9ilNKAHoB7b2lUaa8NBKaD0VSGa3ENFbjc6W
	N/gaomvv6myBABf7y6rz5T4R6sLzUXn1N6eMflubIPW8AAWyQz6tUUVwBtiHoAs13zXOiYsE6RQ
	WTw+qTW+s1fw4uhi4UO+XMFJd91q3Ub2WTM4GqIy84WEXOik6bR0AUTZ63o5gJvrscZUHIIZNdV
	r2PucdIT34KZqnhzDJT5B6
X-Google-Smtp-Source: AGHT+IEy5eZgEtJamv4eN74TVUTPfYhXuXEbyjSf3Zgujp3MHg9SizhKmfU6gaqx4CLBvmHZq4yLNA==
X-Received: by 2002:a05:6402:26c2:b0:640:acc8:eff6 with SMTP id 4fb4d7f45d1cf-640acc8f300mr3184665a12.0.1762183568505;
        Mon, 03 Nov 2025 07:26:08 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b71a332a9f9sm115987266b.38.2025.11.03.07.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:26:07 -0800 (PST)
Message-ID: <ee8db6df-76e2-497d-8718-b0ce5affff05@linaro.org>
Date: Mon, 3 Nov 2025 16:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: handle RESET_GPIO better to provide the
 fallback
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <e1fd975c-56ef-442b-8617-d63237bf795a@linaro.org> <aQjI1m0yYs2t1hYq@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aQjI1m0yYs2t1hYq@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 16:23, Wolfram Sang wrote:
> 
>> You removed RFC and entire rationale. Your earlier commit - 690de2902dca
>> - is broken. You must not do that.
> 
> Wojciech was told to do exactly what he did. Dunno by whom, I trusted
> that after seeing the handling code in reset core. Is the required
> fallback documented somewhere?

Yes, by stable ABI document and by standard rule - we never break the users.

That commit for which I sent revert effectively breaks that rule -
affects the users.

> 
>> Broken 690de2902dca leads to this broken patchset, but that is not a
>> correct fix. You need to fix the source - revert 690de2902dca, because
>> it is obviously wrong. You MUST ave fallback to reset-gpios, that was
>> the entire concept how this driver was written.
> 
> What is the benefit of having reset-gpios handling in the reset core
> optionally and required as a fallback?

Stable ABI rules require that, it is not about "benefits". Please send
email to Linus and ask him: "can I make a change which breaks users of ABI".


> 
> What is the drawback of having this tiny driver in the core and provide

If you have squashed the patchset, instead of making this non-bisectable
mess, it would be fine. But because you made it non-bisectable and only
one part got to the kernel - ALL USERS are affected and their boards broken.

See four reports from Marek Szyprowski.


Best regards,
Krzysztof

