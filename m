Return-Path: <linux-renesas-soc+bounces-24036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BEC2CB85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 16:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EEA4189EB5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6A0310647;
	Mon,  3 Nov 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NyZE1lec"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF37314A69
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182780; cv=none; b=WNR+Wg83TaTPUYMSw1KppW57ok5L6oCVRiQQ1uk7PFN6ZglMb4077XEz84VHSfHkPZprQsfurSGq1q/FFZGqaKBHCKgZS1YkaiQrObp69nech9vzZe5kDFkwsCUMgX9K74Mpx4WohS9aRdiBDET2apSNMNlNNv2QduQ4cBlLs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182780; c=relaxed/simple;
	bh=lEqb1GUFMvQ7VdnL95g8TTom7dtfyhWRmn4zXP1UzUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROUFYLAZMf/6L7bCLaVxkHh4/xa9npiiOuwFG3MXkN5F1NoDZUOosRaGJDWThNn8xJBLz8m3qGUpvBwavyVb7tmJUHfyG4YrWHk+0Ubxm36PbBPgCgv5GF5nn42vYG9XHgHpjIdEmfI9/bcZmnXwE7xSmgriUkxTdJncNfYDgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NyZE1lec; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6390fdaa1f4so964597a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762182777; x=1762787577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XDDh0lrTya9yiTWU43FpNJTzo/gayb2J46TWmEc0sDU=;
        b=NyZE1lec2T24QmW8YLqbmOXlN7so17+X0Usznsa4MG+/iEvuMz/dNVEHYHgVVQePoZ
         B/hMhP0DjHYczsOehhZxO9VcuZ9NMSbIrHlLyijKlKYnakCj0iYnSXkamF9w/l0bstnE
         C/9yiKffcSx/Nol5sXyx5/hviPfCfpLJv0KCRfEmIH8IEF5/DEr0qCxMGOq7q/eCVR8c
         zobhJrs5h6JBDJNB9jBzgWx4EY5MvhfW2PU7DhdPJHlY54o/514I5HswqWFfox4Tvj+H
         2Z507HKNCqeB4cHDydcWNijJiv33i6pP/gppCYwzbWelLrY0tlVPqNsl6YohAcyoK46q
         01zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182777; x=1762787577;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDDh0lrTya9yiTWU43FpNJTzo/gayb2J46TWmEc0sDU=;
        b=TcGy7MBy8eA7KCVCGpxtajFu/fDdaPsyp8yLcN9Bu8fOMfqY13fZgUhuN9CNwbAjhW
         yoW1mmysctf0r5b6d68Kza9/cC7iAhr2F9KAVLrJwFsVEmMU0UYyuHGIMtYO1zlfNjgk
         h5233THRDjV07DzqMgbamgJwq+rCYXweknPOeaZH/YkE31bnbIkYpk88NNgrWwS81IjQ
         5AXK8mhn7Pt1OqU7LptfqdqMBujfuvgMUyfuPT0JkFLY1KajsvBlT5+t5iniOmYbbRsu
         v0ckj6XVsBBKwQR0cd0r84pcij2jsksocKS2WMsWxelGlnQ8cMv4GG78O1aRs09WNbzw
         Vl3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg1u++Y1VJW4souIDZKuPgY+M9c3U2X51SQdBrGkZAAQLMZ3pI0AkKjJKJglb0reATiQE66gNTXs5sePhwdX5OFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w2M6SOSpzcbmVGfJ94fJ1mvCIv+0HYC63pOXS2nuw3r/FlBR
	VkKYGSzQgzK8NvNNfPjomU68wLBaNdyOcUjFaKRdMpIBQ448VauiTef+jZGrgWGWjgdkI1ICBLS
	5YaQW
X-Gm-Gg: ASbGncu658aXri9fJo4tAsu+B4K6i5g1N0ULbtw0sKyRGfSAjrN0HkfPOudC/8Ohjyi
	egu5TQfUT34PpRVIbyAJN/Jg9ro6QuG/XPKBK1NqfxPu6xyuLJ7jJZ5AZTa8EnUR0MUa6zabspw
	evnF0Mx01sn9TygYeWuscO5KBocuOArX+KQ87x60RXCSxdf7IQqpAHcBjhslXEagtGTq14b/DNZ
	gFcdwVSpiqD6/jJ6UOIJ9FDTJwZc0ikmKB2LKVtONfjebP0ghtejf4irWPi2Nx4+25pN/VMVcJx
	GlMkAL0gI6Yd6iyg3CO12Kvd2Zh/jzSHu4f3+2/cWDtzSgu3ZpqZRlrBJSCPe3+XdWVab5/s4My
	WyYHRub+E3oUmOk3ne2oHOfYU5ccSmI/wau/A1Uvu1JGVBvokvcJMREMrzAXxwBRFlqVASJiYbB
	yPP1LSuxngrBJhsUeFQTZLZmCSyndIQr8=
X-Google-Smtp-Source: AGHT+IGyuuVqkbdfL6ilqB6LRD3gKVH1CjBZ1W7MfSNyNGDoOcsUpzUrduvZUo8NmsnyGvBpoTDHEg==
X-Received: by 2002:a05:6402:13c7:b0:640:abd5:864f with SMTP id 4fb4d7f45d1cf-640abd5878bmr3335386a12.4.1762182776881;
        Mon, 03 Nov 2025 07:12:56 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b710709270bsm277022566b.21.2025.11.03.07.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:12:53 -0800 (PST)
Message-ID: <e1fd975c-56ef-442b-8617-d63237bf795a@linaro.org>
Date: Mon, 3 Nov 2025 16:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] reset: handle RESET_GPIO better to provide the
 fallback
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2025 22:59, Wolfram Sang wrote:
> After the discussion[1] (Thanks, Philipp!), here is the updated series.
> Details are in the commit messages. Please let me know what you think.
> 
> [1] https://lore.kernel.org/r/20251015112921.19535-2-wsa+renesas@sang-engineering.com
> 

You removed RFC and entire rationale. Your earlier commit - 690de2902dca
- is broken. You must not do that. Broken 690de2902dca leads to this
broken patchset, but that is not a correct fix. You need to fix the
source - revert 690de2902dca, because it is obviously wrong. You MUST
ave fallback to reset-gpios, that was the entire concept how this driver
was written.

Best regards,
Krzysztof

