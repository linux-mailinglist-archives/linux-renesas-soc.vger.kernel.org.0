Return-Path: <linux-renesas-soc+bounces-3894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F6A87FE03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 14:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718A91F2264D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 13:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5695C40857;
	Tue, 19 Mar 2024 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAduItP0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0BB40842
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710853488; cv=none; b=BVuKeFEYBIZUhcQET7KVUdxL5ObyTQUTh9sokR1TWghjd+sUJx7D+u1N3Q36hQrNO6W4qruc//vQeQzVy/mFD+UdZiy5oyCubZziMEMKu+W58/TkIR+Cu7+JH0UPXUbi2L2dpy4OM5l72revy8TMhzJ1asXCcF1Gz2u51/vmuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710853488; c=relaxed/simple;
	bh=5j6LLU+T9lzh+ci9F+I5/exCIH4PR8lNUwTLg0hQ8YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phGjkQiAObweJ2zKS0AloGrDSjyGEMYRF0+mFAL+QxOkbFOCMmygBJk302l1hBbMHa81EYFFfyYEtJPZ86bUFv8ZIRhyl41NH+OyGRe/9fsojTtyJnQnJY2L1E1buWXq2ijf90NNBDls2UIi374lQ1CKUBfBEhoBKpiV/Kc+gLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAduItP0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a46cc947929so238557566b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710853485; x=1711458285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fFuApKGpwwDDsLJ4XW84yYeMLnpQS/jszlc6/Bf+AOU=;
        b=dAduItP0CEz9sAyWB02L57aPBtbF8tuextX5rf0Hl+c1xXhmtHgPxuucZwdBlfYwUO
         r/w/Yts2KzWxZjnGJwGLOnuwpnlupNKvC157AFfpjcjkRSpqwRltMnKKbRmuZ2bKAj/Z
         y9GRn4d0sRgDSsPapFgP4wbLDqe7p0XqEllRAVwumiG3fbCspzcDmMRNk7+MXHQ5gCDZ
         FixfY0vZ59dKREvhmGERnTN0wX6ONkZ5C0SyajhQBAmuWON12RFh6Rkk1aPiet/pZy5b
         5psogZFTR8zdxPd01TmxmoGTGjnDfOeuGLjmuuxULuA9fvrNI9wrRI2+Ko9GnY2AW0H+
         Dmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710853485; x=1711458285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFuApKGpwwDDsLJ4XW84yYeMLnpQS/jszlc6/Bf+AOU=;
        b=bDYgTm7jShak14zfr8RM7B9uBwFiDiTE4krbZZ0lmHumSc1g9kFIKgmV0Ia3M1j1Nc
         O94LvICy0AjmsOQk34PUZLTuAmqFxOJF/GefTZuMS9dtpmHt8wlMTTCFk2lDaJ88LDMI
         h9NRb5XxBJ/sbdbuVU85ihoJ0/1nkyZc25lHv3Yz3kwjl22sffDDypTZPDU/olChIBuj
         KUWaPcqgGIROMEGxp9ZZW5VpVwY29ifCdO5OK353WHTCgLcaIqGs+xUnmCRC4Dl9Hzgv
         E5iWgUFUUfKyfDe5RN3K9T47usxQth761RR/gwqdxyJ5vIBuU4DpS/pLCKBqVVV3lnox
         dqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0kDzDx0uh5zcY+8ZMQ2UipRZX1dvxdvDw0QcUzfxH0PIN9jYmQ9fEOfTwsqQv4BEMUmgwccezUvtMQg3Q9A9Z7HhAGdeJF5bE20kyOj3M+os=
X-Gm-Message-State: AOJu0YyQX2dtRf39zkuhI8tVXwnoPPar00fpCIJSCWId3l9gIQaRf978
	GBCkCIbNnGak10YCnhqfM6zk0uPWPjXFz1vF7jv+DDwCy/WH/KPdH5ibxNvxWEI=
X-Google-Smtp-Source: AGHT+IFYJHEDoCt4LkXaMh02VPj7VZ4POM3RoepzRqjS47BbdSZ2Rwi/itrj0ZFFo9svq2X1tRXafg==
X-Received: by 2002:a17:906:bc94:b0:a46:bba6:b06a with SMTP id lv20-20020a170906bc9400b00a46bba6b06amr4192175ejb.12.1710853484826;
        Tue, 19 Mar 2024 06:04:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b00a46d58fbc11sm1165263ejk.118.2024.03.19.06.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 06:04:44 -0700 (PDT)
Message-ID: <51743788-3444-4817-864b-404205a06137@linaro.org>
Date: Tue, 19 Mar 2024 14:04:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: renesas,scif: Validate
 'interrupts' and 'interrupt-names'
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240318172102.45549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240318172102.45549-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db13e305-adc4-4990-b9ec-b1cdcdad4406@linaro.org>
 <010e4742-438f-413f-811f-a033ec104832@linaro.org>
 <CA+V-a8txP39HJJrJcNqCUgw2NkdA3uSvBrbdSzw0bN6r5LpNaQ@mail.gmail.com>
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
In-Reply-To: <CA+V-a8txP39HJJrJcNqCUgw2NkdA3uSvBrbdSzw0bN6r5LpNaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 13:43, Lad, Prabhakar wrote:
>>>> diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>> index af72c3420453..53f18e9810fd 100644
>>>> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
>>>> @@ -82,38 +82,6 @@ properties:
>>>>    reg:
>>>>      maxItems: 1
>>>>
>>>> -  interrupts:
>>>
>>> I don't understand what is happening with this patchset. Interrupts must
>>> stay here. Where did you receive any different feedback?
>>
>> Look how it is done:
>> https://elixir.bootlin.com/linux/v6.8/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L44
>>
> Thanks for the pointer, as the above binding doesn't have any

Yeah, that's just an example to point you the concept: top level
property comes with widest constraints (or widest matching items
description) and each variant narrows the choice.

> description items as compared to our case, to clarify I have updated
> the binding is below. Is this the correct approach?
> 
> option #1
> ---------------


Yes, it looks correct.

Best regards,
Krzysztof


