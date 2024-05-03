Return-Path: <linux-renesas-soc+bounces-5078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BCF8BA855
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 10:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 924D81F2234C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9D2148853;
	Fri,  3 May 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkMRn9rF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A490219EB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 May 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714723737; cv=none; b=l4t3Kx2qKdki5hEfNOzr9ih3QYbaRKBFKwjICJS4IxY+z/iGkjwNTr6+0gthnnJmhv0PFdG1vWX+aSU89hcZ8b7xf8GQ2/IfuEqccwN0Z/9ctm0H16+jO1yKmppPJg1T/aeuHjhnrNcvgAujDEn5qRlKHetmwOBOSMidkUOolOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714723737; c=relaxed/simple;
	bh=7qQTzG9i8KLzJJyyK6v5uKKev+BF4EWHDk9zrcLv0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ay7RvBGMV2EjEvPhS0RQpVhKsnJ3N2SPssxwTBRvmFr8ZliSaOp92rUCTh4rHyQrKs5g0cN7tlcup7L6xKWteGgwQ0RuN+qJKiUBoxZPpjDSsPAnta0tGE1m2JCW6Ey18PtHI4hljQTnY+Ht5VozF4QcUUIjLHk1xhz9oKW8rKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkMRn9rF; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e0b2ddc5d1so58745531fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2024 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714723732; x=1715328532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=PkMRn9rF+tpXpYn2yYPeTlN0KUIZGIQerhBQQ33P+TJOAxT0Iey/nbhLiJ6dmD2DdH
         JViZ+tIzWlzUkxV3gkjIGVh1ayzYy2usZPN8CDj3tJUFa3iU44BP0ukqhvT8/9FwMvK7
         psMKjDC/GPRq53BEEHQxGpaFP7CC/oKmrCY/q4Plf4Aod+YQexyZnvwEzb+675PPozvb
         EirNhLy6p6BOJv3n1B1JFKY7lx4/vd7Ea5i6BofxOGQi2NQ+KvdYb9YGvqGgmA66P3qB
         cfxg2oZq5TXSf1mgjbchm7NSgy1zrRp7WLrtsa9lgVPbyLX+msvh0bb+vnEXp0puWc/H
         NMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714723732; x=1715328532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F32g4MjpRz2uIAU44wJHuksonJ+RwP1zeSV74QN6B0=;
        b=r3JiyXbh9Jh7Vp2xgHg40SydHyq0PX8ns6Hw7Kio4Khix1TdyRdGGzydDk71FH3JVH
         90Go3U5eBqG7uJB4jPpfliZiE+cTrGIb63bod0/BX6/DGukU/Hu1cFTTXq1A5eQ2gj2G
         ds4nhALLvMSVSZmw7Kd9p9EOCwfWMrqxvpEZog+viReaO6Jf5QqiuGmrvnV7BSa4DCH2
         qwrCyqfF9mm9FAUxeNaS1aoRx18uu7w9ZM29Qd1gsPJvtEteYnMOmck/bzceBLZFanC5
         1xgQsjWVOFGz8tixvpw1zme3YcUgMXaHFhptAbNGIqnoP1Hx/OeVWM2oXSlAwi4WSUxO
         020g==
X-Forwarded-Encrypted: i=1; AJvYcCUgQ4ftiDtW0ZwwSn8fQr6KDFjJM3FXi+KzbP2W04XW2Cu07V/WOOuTCErtPBRR5iRgkKTtXdJcVUe60BiS2P7cXxZLC0Qk3kn3eU3Xlb3eEIM=
X-Gm-Message-State: AOJu0YybLw8WrX4g/GbNbX98pqbKIBNmTUCgRCoTD9ezrnTNmz9xBJ86
	35jfrWwJZpLgHrjNshTh7IJPZLG8uaG5oAwf2/rfS2ca1wBLXHnCzSlUCSN+TxE=
X-Google-Smtp-Source: AGHT+IEyVSxtgBjxgwR445qD/sr1uxqCDskSMlyg7yV9YjhIzBtojmFjs//+3uZsQR/8QqR1GYTL8Q==
X-Received: by 2002:a2e:b0d5:0:b0:2dd:7712:efcf with SMTP id g21-20020a2eb0d5000000b002dd7712efcfmr1255172ljl.10.1714723732369;
        Fri, 03 May 2024 01:08:52 -0700 (PDT)
Received: from [192.168.1.119] ([37.251.223.213])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b0041bf21a62bcsm8456940wmn.1.2024.05.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 01:08:51 -0700 (PDT)
Message-ID: <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
Date: Fri, 3 May 2024 09:08:49 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Use full path to other schemas
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/3/24 08:21, Krzysztof Kozlowski wrote:
>  .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
>  .../bindings/mfd/samsung,s2mps11.yaml         | 12 ++---
>  .../bindings/mfd/samsung,s5m8767.yaml         |  4 +-

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

