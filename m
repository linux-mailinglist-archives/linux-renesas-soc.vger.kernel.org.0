Return-Path: <linux-renesas-soc+bounces-21442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCEB45040
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BA9C7A5BFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DC7244668;
	Fri,  5 Sep 2025 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYs6mVA8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AB26B951
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058674; cv=none; b=ej/B5jCDY5UH3t6XH+WiRQhmnvvd/JD2UwLJtOxVXeOCvv55Dd+wLNeDCCqZq/hQK9hZUzI4KOpYoBC8UCFQySIjTMSIyRN72z1wuLm/e3FoDsS9tmwKu2lINmNbCSxTRhtDxjHkc523aQs02gPnREgXTF5v5F3j7j5Dh/XI0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058674; c=relaxed/simple;
	bh=HpBW9ztCphu9D+zh6vwg7+g+3DgPn5GvwtPmpzJhpi8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OPVzUPXKKttNvPi1+RORVUn4rgVn+mxyjJRfCshiQKeThYndaUCRrUW2Q8SVMB+fc+6yUWVNWnZr/mKFFLzOeU22jJghCuhjkNMnwjebYs7TuEATboCKw8QrxMTIUU61W1v+9NPuNk0gG3VVAr+oIBh+Rv0PlSJF6K79GVkt5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYs6mVA8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0449b1b56eso284144266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Sep 2025 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757058670; x=1757663470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Fek3hgFv14ByAC4ENYyA/aKvGhAef+q+BWE8UMW+V8=;
        b=TYs6mVA8qUAOJDcjx1oFJDB9+voGqoTiYCWyYpGHpUqShLSELu4YduRGUjg5J7tN16
         OoJtIkCjFNFbC7P9JvGkUgFo3a2mNz5lsYFbT3XqucbHAJeSy7zYYuXJH6NL5MRsoCdy
         jksNw9gq0SLS1JRvApINjgb1/k9RMuhPt0uxrVbjxHo6cExDg0YyCQFX9Z8s6kfQC74G
         7yxHKnRfAHmWIYLAmNTgKqkXaCkL+NGElBgwqJw9ZjXtkM2uRSlDeEt0Twe/OIOpFaS1
         lzXN4TTqK+nI+T0YpW56Q33CC+1AjCag8Iy4FCeeOuQlmc9KcRIbCAhgNOBShhaxbqaP
         e04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058670; x=1757663470;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Fek3hgFv14ByAC4ENYyA/aKvGhAef+q+BWE8UMW+V8=;
        b=WqYPYwJVQgz6To8j+rK24B6yE2KHpayo07X4PxKC6hfq8SwAGgr3+dIBmpq3uoQmLV
         Snfm7WqruCCe5LE+WVI8rORAy96vays+VSjXHknys7LxwFpStSuVf0NGlSMmbn0KpYd/
         UORp4PlvI37UabEvRzZJ1KF+Eb+tT7kq+fJM/k7yzcWdk7BBR/+MN6OQwP+zwCH6ALk8
         /0D5r6sXvjw1EPgdcY17To4uhkZKmbS/ixoSRhqCD10gnqHmvZrrlnvqvwYul9yNK4As
         U6WYMhbTKO5k+jzHUICuz7d7M15ZVTwUxZjjOYog+WAA/gXVj1rHtx7d+GL3/ZgQNlt6
         Z3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfBvUETfEu6jDZ0+ht5f2bbwDdfD2dl0vsLvbIDOVSauEWE1u68UY3fKTw8ll5V4ZEveHCYAoAp+x3pemyDnMLOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZeLTrtKTvH6uniwj9Fs2tswyFukUZmI8vhJgdMY0eoYTXDFh0
	+Cao3rCWn/hNOQtGKZSRIpaXMksSeyVCVe/QUVogCbr9bkNkE/bQP3WpdW5AGlJPqMQ=
X-Gm-Gg: ASbGncthIfjFLVid2Yr95gj7T0R20ia/EbKcLpq8d2ejICcz/tZspTygK9AgkxXKEPf
	oMNag33fr4jMeo7C//+qLw6ALskjkPFg8h9jEUUuabv9SNQr54wPkN7Zis4GOFrjOSLLb+x0Vso
	yliC8l8/h0xnE726jr5jLqtJGht43dgc1u5+hTpii0w8bsDA4+rX9CGWnCaHrljwQPQ27jaTI5Q
	bG+c5fDJdOaBYbhJu1aEQTuqiAHDOZCYSQsJTH6m+b/hBk9BrSJCoCuWiv32gFOx3ZuScc0Y/9U
	dP4i7rECdY/cViLCo+lUY3rMXkJFbMJBk9FJMqCqy9OpYqnEIrrEormcPCeL+sJy2nOGsc1fHU+
	XEI8KQEURscNKpmX6s1h9j3xagsXBnroTvLpe1PDfjSt7
X-Google-Smtp-Source: AGHT+IFgzgqr54lyZk759VB+wCuCumNakupjTyV8q7KH49ewQeYz3V4LPh1SGAWQQZu32+3dH/7N+w==
X-Received: by 2002:a17:907:da9:b0:b04:7880:3e88 with SMTP id a640c23a62f3a-b04788056a3mr725297266b.18.1757058669532;
        Fri, 05 Sep 2025 00:51:09 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042fcae867sm1132057866b.58.2025.09.05.00.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:51:09 -0700 (PDT)
Message-ID: <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
Date: Fri, 5 Sep 2025 09:51:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 22:01, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> index 434cc6af9c954..cf0aa996e072d 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -30,6 +30,7 @@ properties:
>       maxItems: 1
>   
>     backlight: true
> +  port: true
>     power-supply: true
>     reset-gpios: true
>     rotation: true

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

