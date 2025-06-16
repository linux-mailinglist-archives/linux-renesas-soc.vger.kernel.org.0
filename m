Return-Path: <linux-renesas-soc+bounces-18378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F572ADB6D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 18:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9A03A0525
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 16:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9E01E502;
	Mon, 16 Jun 2025 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFKvjkYG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A241FFC59
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091201; cv=none; b=fL9IJc7mio7dx1urzp37v28D7eZQlYJEQkeOZxxZdw8GOWSXqMtStfVWj903117liMxrOhYT5lQ7fCMicvpfH7JhPuGbolNrTow9A75CuKjrWwjVCaADM6kH5f40MP0SwFQ/uPxHV8FfyMlUtGbVEl+aiWX4LjLzCwplT+O0ZyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091201; c=relaxed/simple;
	bh=vmnHCgaI282hq5PTGqcYx/EtjiMY2Bi1AAenUCB2ygA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g5mJhICzNdZwyAAWqN9uOPWjxNWMf5gd0t6n5Sck0/KQ4Z6aQP86iVDw0UXo70Svb1idGw3guFam1xhGLGSCKB0m/dDPMF3CoEPkeLy6Wjvo7YK5b7/QSiolOaYTmSIm1BnOl5oWktsaiZMKcfmrXZDWRpYSOU1sVlTXVRRtIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFKvjkYG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3945760f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750091197; x=1750695997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmnHCgaI282hq5PTGqcYx/EtjiMY2Bi1AAenUCB2ygA=;
        b=iFKvjkYGPJwPnZwix+tcYHcSv44pnMEvV7u6Wtj4CmtZ8xd6q7eLMg4LzMhaLi6gdD
         gwmz3hzATFdgoRLvUm552C09neoYYAG6xzvqVDSNi+EuH358ksovs9oLTA0owPmIeYhI
         nFLMXFS4Xocz/xbieYBtmrOLZOQdPVnOmRI2Al6HlIMYm/J7SJC1Brr/KvoEpV5PL7xC
         VKwuLC6ACQ+dWzo3NMPxYw5TZl7aKaspMP9JAUMNRxv5HAjqFPFK2HQKdwgtdCeNyb+o
         Xo8ZI6mKPa7i1qHKHx9PUHyTZZtmULIoTIdrWmaMPpIKBIco9knm8fOYkibqHIX0dJYz
         vNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091197; x=1750695997;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vmnHCgaI282hq5PTGqcYx/EtjiMY2Bi1AAenUCB2ygA=;
        b=TyHuVud2dFIkaLl4m12AeeOHHSN8mYgzFQ8pxEWwQPWE19iIzcdF2CtzxUS5okw7lL
         7jO6TjHU1UWatL2uq+DB5HnSKMPgcWRjLnZndrXGrjgaSZwOwHIyl3H2xQKeU9RV5k/a
         ecPHl7t796VBSbtpb8jfulloflryvVwUodh5r+lHQl2aYIbQqSR6GXl9ANSkMWON6V4b
         4eowXkTRY0MUYsfAD9aNZtLsu1Rr2xm/X5ZE/dn6dKMSLj/++KdzZjM4Z9PKLEa7kL8H
         M6q0ir2zCTTKq5kERLZh4EWVARlhoa1rC9Tn+EiIofNi3HlXPeLV84P1aqaXbZAZdI7I
         Deog==
X-Forwarded-Encrypted: i=1; AJvYcCWy/yB5uYYSxNI0zQ9MHs/ngXotSa2KUgq+hE/JSeKKrZS54nvyVXYEQDwUZxunRQw7D3a8LUN3+1DivEraqzM7OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKo/DS0xLS0oVZdN3DGdPSeBDarBfNVXWlj4m7sWDnMTplou4Z
	8apMB3sXTnTpko4I42KZ9k9kLJS/35hXRB6p311R0UBAJr0JQcA7MXfYBabC/0VnfZU=
X-Gm-Gg: ASbGncuymWxywNZI7c2XpNFLxCk7yLx/wRI0X0vZy0xDXfJCMWybIvDRg7kho/NManT
	/C8pWzTmBGrS55ea4CFmzdc0hfgp6g2yzWV7fOTenKN5MJZ0TaVe7psbkmFHugW5oYOmOHnzrmI
	yNe3E96YT65o4bb8RXBEc48uAqO6T2Cr10LXpvItfPEUzGD3d1Ky6LMbzO+5ngRu0Cff8ftqPGO
	RpemkctLpMwYzCqjGxMJRgHs4fTRjqfM415OI1hedZStCa/6tBVuaBLqWeyxM+G3drJAmNLNFP8
	jyDUpBAqGhphcDEPhiqaOSUouGk+xPZBO11qCXoIXpO3dUFy0L2COl9T88Ywii+6ifzQarftG2B
	yMt9HZm956WH8b9W+RYu33kFgjRvaycq5FS4cuwA7knFAAVA=
X-Google-Smtp-Source: AGHT+IEBsVprmiQDzo7Lhhgb6lnLHo5f9u47o1+S2nphrseLHkPh/y+JSdd4Hu/+yocYYy7Vn5IDbw==
X-Received: by 2002:a5d:588a:0:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a5723a3abamr7848727f8f.32.1750091197126;
        Mon, 16 Jun 2025 09:26:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a? ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm11619355f8f.94.2025.06.16.09.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:26:36 -0700 (PDT)
Message-ID: <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
Date: Mon, 16 Jun 2025 18:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
 <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
 <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
 <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
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
In-Reply-To: <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/2025 18:05, Marek Vasut wrote:
> On 6/16/25 1:45 PM, Neil Armstrong wrote:
>> On 13/06/2025 12:54, Marek Vasut wrote:
>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>>> alignment gap between default_address_mode and lanes members.
>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>>> there is no chance this value can ever be larger than 4. No
>>>>> functional change.
>>>>
>>>> The u8 will still take at least 4 bytes and cpu will still
>>>> do at least a 32bit memory access, so there's no point to change
>>>> it to u8.
>>> Assuming this layout:
>>>
>>>    40 struct ili9881c_desc {
>>>    41         const struct ili9881c_instr *init;
>>>    42         const size_t init_length;
>>>    43         const struct drm_display_mode *mode;
>>>    44         const unsigned long mode_flags;
>>>    45         u8 default_address_mode;
>>>    46         u8 lanes;
>>>    47 };
>>>
>>> I wrote a quick test:
>>>
>>> $ cat test.c
>>> #include <stdio.h>
>>> #include <stdint.h>
>>>
>>> struct foo {
>>>      void *a;
>>>      size_t b;
>>>      void *c;
>>>      unsigned long d;
>>>
>>>      uint8_t x;
>>>      unsigned long y; // ~= lanes
>>> };
>>>
>>> struct bar {
>>>      void *a;
>>>      size_t b;
>>>      void *c;
>>>      unsigned long d;
>>>
>>>      uint8_t x;
>>>      uint8_t y; // ~= lanes
>>> };
>>>
>>> int main(void)
>>> {
>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>>      return 0;
>>> }
>>>
>>> With which I get these results on x86-64:
>>>
>>> $ gcc -o test test.c && ./test
>>> 48 40
>>>
>>> And on x86 32bit:
>>>
>>> $ i686-linux-gnu-gcc -o test test.c && ./test
>>> 24 20
>>>
>>> Maybe there is some improvement ?
>>
>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?

4 or 8 bytes less in a dynamically allocated struct which is by default aligned
on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.

Neil

