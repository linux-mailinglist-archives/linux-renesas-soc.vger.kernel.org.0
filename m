Return-Path: <linux-renesas-soc+bounces-7872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC23955E55
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB0801F20EC7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E699140E30;
	Sun, 18 Aug 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRqKvVJs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83361136E0E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724003068; cv=none; b=fEQnT3kL+3ijjEGd+aPE1cF97gzpC6JVfUQzAtAFFJnAnEpp+2RjcB3TZRb7JDDU4K+hCxGEZr6quM/OZ5Frlydo4F17ABD8JvDA1jqfqY20tacLPaUQ0CFZ5BMM+Oc5DpJalCoY1LQqW+ZWaK9HXVaOsq1HrscNks6kFWSXV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724003068; c=relaxed/simple;
	bh=BDpZ73MWeToDgSmqGHCmy26vNOPYmQKn3qYzqfYVsAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6DuBd2onXjshTKoljiPeGEvv+LyEiL55rC4Tc2Jy5tOT3J9F4OoPaz+XqyZjzx+45RleCPDsWhRIkFT6duLddq6ZIcg+QKrB6W/Zrh4/XTgtwBZPPS9ZnP5ySx+HFVLjRRtrIpGUcgccAyEwKLENZGc74QUtu1M9ThQwruuAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRqKvVJs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429e29933aaso26426635e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724003065; x=1724607865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BYbCw7CUmTWunEn/B4FlROJP6k28hQrr7BrfwnyNLuY=;
        b=RRqKvVJs6k8RMvez6tAaZBI37MWFE0aOXqYCbPMYd9XicO7wMi8beBj0z/qFgBuP+8
         ZBrUUxBnpf08ogOQJYlz0QAsR+nMg9GsZugvFCnJTbVpS4o3YDI/QrrcyS/VmtPfWQW8
         BQkw5e/Xbf4+sdCCApAK9olj8ZqlvhjPh1S0qHqafdULrBhBHfRHIFQW4oIlE/oZqrdV
         vzCeF8XiTTQONk0v01IbXcaCoXxVNxFX7xHu0Bio1pTII6nHfdGMPjer4ikQ1y8910vi
         XYF4e0If4168zBHBMqJZiShb04EJXuq9BJot2EN6N0RfXr0GTWmn25bM1+eto5dzr1rh
         xzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724003065; x=1724607865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BYbCw7CUmTWunEn/B4FlROJP6k28hQrr7BrfwnyNLuY=;
        b=F7QeGcTpelzhJCh2K5Zy/Nkt0+eRs50XxthokHZiNmP0Ec/AWTLhxArzpPR7XGggqR
         xM9HAwHmsklhQbFU2L78P57lKBJ6pwgd3A/spll6AbJTDckg4KPYvnWW+LiJerpXJJ14
         OBTnE8d6nJDF3OPbZVzD7dZCfYjdEgcKbUTHvoMpIfiMlgGxhV0VmpKh65D/19I8J/uI
         /G1HSfJh2s7GusE8EMdMvyDRAUIbJSisdffD4023zG39kKoSWp6rV80+ddyrZr3yP64Z
         AB2NmicWSjPqE219m4nLP0ZUPWqLWnzTGfmibNqioKspR8i2/OGO/eMlBKcc6NBK10ym
         iCXg==
X-Forwarded-Encrypted: i=1; AJvYcCW+h0fktPUm0lBz9i6G+xGefHkf12SOGkvmylsSC1/hqyclBoVjtAwtKdoWI7dHxAK22ioTr3v0fTQKisCwpXUqzvHVba5C28KFKhbX0SvTwZQ=
X-Gm-Message-State: AOJu0Yz1LbCgYqV7jKo4W+qif/imF5idjuP6ngG6p7ifkE19heDFoVt2
	ukTIBZ+/fTY1i0N8aScPlx9zPx4sU66YC8RMEg2vWhqjhzREuCsCdAm6b5uRmrg=
X-Google-Smtp-Source: AGHT+IFmN95r9X6M16tvCUr+ZIREwm1BAuXHHfwirqSfLEIKcUMitP1q8kWidiePGbwru6Nfucf9jA==
X-Received: by 2002:a05:600c:310f:b0:426:5b21:97fa with SMTP id 5b1f17b1804b1-429ed7e432cmr72440235e9.29.1724003064777;
        Sun, 18 Aug 2024 10:44:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded17cb3sm135389655e9.10.2024.08.18.10.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 10:44:24 -0700 (PDT)
Message-ID: <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
Date: Sun, 18 Aug 2024 19:44:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818174137.GC29465@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <20240818174137.GC29465@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2024 19:41, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
>> Each variable-length property like interrupts or resets must have fixed
>> constraints on number of items for given variant in binding.  The
>> clauses in "if:then:" block should define both limits: upper and lower.
> 
> I thought that, when only one of minItems or maxItems was specified, the
> other automatically defaulted to the same value. I'm pretty sure I
> recall Rob asking me to drop one of the two in some bindings. Has the
> rule changes ? Is it documented somewhere ?

New dtschema changed it and, even if previous behavior is restored, the
size in if:then: always had to be constrained. You could have skipped
one side of limit if it was equal to outer/top-level limit, e.g:

properties:
  clocks:
    minItems: 1
    maxItems: 2


if:then:properties:
  clocks:
    minItems: 2


Best regards,
Krzysztof


