Return-Path: <linux-renesas-soc+bounces-21915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC3B5958F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D343211CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E05304BBE;
	Tue, 16 Sep 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCg4Zc0X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6342D73AD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023645; cv=none; b=qMj0Die2Gcdso/qSqOKC5UUdZsdKoYyigWgNZd+F1nRg1KGjA3aN/ZTS+eC4MWOU9mASY9WAjDAOxHmSe3AcoW8J3ZcgasCRwdrdpNgP7E1x38ktjPVuGLL762q3aEpIHVDX5IjXMpunZXYBBbB9E368z+a3uTNs5Upvh5jRn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023645; c=relaxed/simple;
	bh=g4MB33NR3PbcK8D+73Qqhkpr/ylBdmSUXuAuK1QMeuA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UmVelmShyVsJWcWsqixaEpEPw0Etfbe41bVNE/rWj7NYioDGPxcO389neAvb6mzZgQntpY4T9TOsuF9X4ufnEwsg2d078HDY8wYHIrGH/2Hp7QThwM/6JKyCkhYJX3YUrAzYNiPDQyMTW1nHyMUIZDn/H+zMhLDIr118xeYLe3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kCg4Zc0X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ec44b601b8so666951f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758023642; x=1758628442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4MB33NR3PbcK8D+73Qqhkpr/ylBdmSUXuAuK1QMeuA=;
        b=kCg4Zc0XL9lLsMVHRLzlxw+K1kLwfA25NDvxYRLVGRKeKuM6TvW61UWyvRnBmCjsS7
         ZECAtlxjB+lMOjCZmbP7xTsUlRUb3YWmcqQ1fD0VcEtdzZwvm9Y9wndsOZQfL0Rqu6iY
         4Y1vGhAFZdYc4ah9t4FHMO2zEnWovcZbGUfD338gS5gOyvzvlak3nRXkJcxWCmjtc6bu
         UOg0rBDq/VCqVFMKH/5zFcG2bzenrFnxiM8alVCjvrLxR3ATP3sWTkGPxJCdNaa8URf/
         TsOzWxV/wO4XG0MkmlRLOrP+lwJykn6KbNt+lRWQXQWVs4yRnU18cMap1Gvk/w5wx+lA
         8xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758023642; x=1758628442;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g4MB33NR3PbcK8D+73Qqhkpr/ylBdmSUXuAuK1QMeuA=;
        b=jwoMkg7ou7PVkjeQFPlzMGxi3hAMtR9kOfu0hAQCfq4wrGf7elSWzRI6L0+l1H10TZ
         9pA5ugGA0R5w8rfscWm9f6QUuq5YOCBGNQ4PKFCLnvCWLKf+Prhp/JcRzoF48dXFF4+U
         iWU7Uj/OuyJbIylfG0gnVqurQNHrq8fyUn9FW7e5LJGOBm9Mk2tNzmfPG5WDpXypIvhE
         t7hg0v26DJj6eV9wEGWXzYSe9QbLLvrjC/U/TV5Pc2FywuOmRD/wra3pSswHtPC5POZ2
         qSUgYYLjS9GFZsZUo2Wo7bPNWWPoSy2zg9J5x0lRfsGaZUY1x0M95bs3LH/V56/+krpN
         UpKA==
X-Forwarded-Encrypted: i=1; AJvYcCVVK6H2YnW1VClzHmtZJP72MZiInWHKrslcrQlDv/Jta9u9h9nVyApHZrbXd+3oSMsGtGIA2AvjPMkOgUUvRWkQtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSJI3+4vwh5GkREMi2U9+1x5HsGc4nZ5tgmxRlL+WYFHPrPfY
	vmXtfmSwyrrlSqcW6x6oqGXVlj8ClIgs/d2wLtFOZn/wQ6t+KbkYBq7dT+dDeBgfvdM=
X-Gm-Gg: ASbGncsEshqRau7iaI+WBVS10hQbZZFP6nuWVoLnXWBes5WcMlSuQlU7rkfBPhAkH3h
	ctZZwgFh5BtEyjfFVmwLN9lgRzKScQvaPQGyXla4PYIJ6tdtwLQFTPaAPrta6uXrJKMysDoeKdb
	RSfIstcarGvPs34clFLSsj+Z6HhQP16Up97ru+OyU0MQuj0Fz/I5yBL/9QB6jathYLqGCbzsUTv
	IGICnlIsMbGt+nKiijafPGOp8TZiAvI+K/G5hDWbekrrdnulW5WV4V7ydhu2yA2vPR3j2ij2quG
	yFvZYQIBoNsO/AxwTzhJCd/3cUC7G/sael5U/y/ZnzGoWmtO829hsDlhBvkfj+2QkYo58C6r7mB
	/OmkjUa8Vg+Z2xav5+yLNCdKoctJZoOlabQU3XA4eDXZVeQOEYujqUPu+Te5cCqnOSluxa7/cU+
	O5hB8r8ne2vg==
X-Google-Smtp-Source: AGHT+IGMOx5ictt0icl9kCJ36rSKAXcHFTFJOF7dvqZ6AWQW6ws8M37Ea/BmRKcUrJgElQta8CF/NA==
X-Received: by 2002:a05:6000:1888:b0:3eb:4681:ac9e with SMTP id ffacd0b85a97d-3eb4681b05bmr7775394f8f.5.1758023641810;
        Tue, 16 Sep 2025 04:54:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec? ([2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372bbd3sm215676865e9.10.2025.09.16.04.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:54:01 -0700 (PDT)
Message-ID: <bbd0e55d-aa5f-4ace-8c5b-074fbf1c46f7@linaro.org>
Date: Tue, 16 Sep 2025 13:54:00 +0200
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
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
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
 <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
 <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
 <004e4b73-b695-4e37-b484-4fbc340701ea@linaro.org>
 <0cdd321a-4eb0-42aa-ab7f-71fffb96ac73@mailbox.org>
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
In-Reply-To: <0cdd321a-4eb0-42aa-ab7f-71fffb96ac73@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/09/2025 13:48, Marek Vasut wrote:
> On 9/16/25 11:52 AM, Neil Armstrong wrote:
>> On 16/09/2025 10:15, Marek Vasut wrote:
>>> On 9/5/25 9:51 AM, Neil Armstrong wrote:
>>>> On 04/09/2025 22:01, Marek Vasut wrote:
>>>>> The ILI9881C is a DSI panel, which can be tied to a DSI controller
>>>>> using OF graph port/endpoint. Allow the port subnode in the binding.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/ panel/ilitek,ili9881c.yaml
>>>>> index 434cc6af9c954..cf0aa996e072d 100644
>>>>> --- a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>>>> @@ -30,6 +30,7 @@ properties:
>>>>>       maxItems: 1
>>>>>     backlight: true
>>>>> +  port: true
>>>>>     power-supply: true
>>>>>     reset-gpios: true
>>>>>     rotation: true
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Would it be OK to pick this one up via drm-misc (and possibly also the other ili9881c RPi 5" Display 2 patches), or shall I wait a bit longer ?
>>
>> yes it's ok to pick via drm-misc, bit it's too late for v6.18.
> That's fine. Will you pick it up or shall I do that ?

I'll do this later this week, if you have the opportunity before, please pick it.

Neil

