Return-Path: <linux-renesas-soc+bounces-2872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7708576A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 08:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3221F245CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 07:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303521759D;
	Fri, 16 Feb 2024 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVteJRDW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6D175A7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067557; cv=none; b=B1V0LN9hU8L6zgH3rVPy8ZgffUZxei24cxI+9v8Sg4fLSn2XUuEeRsGhzMhxU3es+6SqzBzSUDcUvfjIABxeJxJ05pQAMj3IhfX+D5Df+WVud6CGI9D/2T/KVYZbbr7Nka8bTixVBx6nzTh4TR8yt0SencTgYhw0LydJajZx0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067557; c=relaxed/simple;
	bh=JTP5wcwTvZDE4yReHEggzjAdVbfT4Qb7BaniZGBicqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h5AWBJGE9bwY14Z2bKI+okPrj2wx6/XKHdsmL94twi/heSkHQdTNv468bvSGh8+vYt2rRt6Dn821RXF5JXOLsPnfVHpIPC6hbrcwkpIUQi7YE7d5YWIF/kkJehBhV0WCbezlu15byqz5f7Ehm4EEK4I0JsBhxtfdSF9DpWYMqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVteJRDW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a26fa294e56so251770066b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067552; x=1708672352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ATkurgrubpUgh0fShoFCedN3hGiv0h68AvHCnzi4M2s=;
        b=JVteJRDWpmVz08hXru3lBmNtqRin1NCGBPxmBYfW7SuVjcNV11/qnbpIFSmtyQ+dd2
         MRF8R0yaDVPN61mWMKZE8tIS/O6jJyrN9NjZAf/GKeadYjxyeoN3r0DC58UvyWMJ2EM/
         2AjkJtVldUwCO+5n2XX86b98HFbrgEy0Sb/hoQap3G1HDv1NHTGB+o4hN0fE5U1NYMDR
         p5+Yu4GtNPNrppShTmmzakfEugGPVJSmhVEuIu+mIG5B1v9hIfP4155KTbiH8IvQCe8W
         OOtsNbW0xMnnSpcYDyWTKsl8jONYgspusDCI6ZJpxbVEZ8WaHDnjIvsv0lYt4ibbTLjd
         r3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067552; x=1708672352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATkurgrubpUgh0fShoFCedN3hGiv0h68AvHCnzi4M2s=;
        b=J4NHQeyIaP6t6XMzFg0W47SpuwsYCa0ALMOVnn2NFT9A4uNH9VUJMOuYxuO805gc9v
         LmG7JYAe9R7tYh51PaMCPNbpSAh1ZIKzVj4wHQvrsgThs81dURMKp/0dL8aFnIs0d5Op
         Khmti//AIObwOpfU3t7eGGEkZUGt5HeKYCaOu9EAMSZojIuWToBaYq8/dAPUYzPd9pa2
         D+UsCMZJQhqQ3u2LebTwXcsdZ0sL90wHdogxVLZutCTqHPFNlRwPYuzqccCqHPTIeVEz
         Uz/XMy7TNTRDyKiWLkAfKX6mlnC56Bhge6o7r1O55UE7foZNjlJHvEItugXWR9cMBQ1o
         VPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqAChH+bKyqtOlZHmhehU0WRRJriUeMqCYX/tbNhsnF6UMQT1XdXV+sga1LDnOlVjtUu6VhReHLadH6Xi8rYBtZwkgxr/ZeegA/gXbbjOAl5g=
X-Gm-Message-State: AOJu0Yz61YMa+jtmemXxvl6uNpUMpnOqBUBhkimwBmWdRX1h5YenhEPl
	YFZ68LSSzFzQnkPH9cbiNHOvKNiaS7/BiHCfLs9Et6xo8JD5NLdUkIAU3j99Yuo=
X-Google-Smtp-Source: AGHT+IHpIBqVJpYgmERaWvMTmzuZlC7ldDINGPCwctFY0/xh+c5nNK7lzCpRfEPfDlKJ3PmwCQOluQ==
X-Received: by 2002:a17:906:7196:b0:a3c:7b20:2dfb with SMTP id h22-20020a170906719600b00a3c7b202dfbmr3268891ejk.1.1708067552347;
        Thu, 15 Feb 2024 23:12:32 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id tj10-20020a170907c24a00b00a3dd52e7539sm339695ejc.60.2024.02.15.23.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 23:12:31 -0800 (PST)
Message-ID: <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
Date: Fri, 16 Feb 2024 08:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 00:12, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
>> None of the implementations of the get() and get_hw() callbacks of
>> "struct of_clk_provider" modify the contents of received of_phandle_args
>> pointer.  They treat it as read-only variable used to find the clock to
>> return.  Make obvious that implementations are not supposed to modify
>> the of_phandle_args, by making it a pointer to const.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> This will almost certainly break the build once it is merged to
> linux-next. What's your plan to merge this?

First problem is that it might not apply... I prepared it on next to be
sure all subsystems are updated.

The idea is to get reviews and acks and then:
1. Maybe it applies cleanly to your tree meaning there will be no
conflicts with other trees,
2. If not, then I can keep rebasing it and it should be applied after rc1.



Best regards,
Krzysztof


