Return-Path: <linux-renesas-soc+bounces-18924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195AAEE2AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 17:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94BA167735
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9FB28F519;
	Mon, 30 Jun 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7XaFWli"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE928A1D4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297672; cv=none; b=ZKSItPhYJN4RJr+OKq3v+l9CT0pb9OBH65Efnz9IoWVV9fGEPUrbYyAoCaPXWpoNaawrHlulTBlfaYElLZswXnTaVTC81Z5h2gznaQsNOaLmep5j0QU6HdX0JX6hBMIOQ6dckuhXKU1UQm9qbYhdDiknen9vzfzJp2XduxRzPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297672; c=relaxed/simple;
	bh=x36TDPEuTbBgvceBNfq2Dadxx5ypYe9R/7kAxnbk/yw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XMPj1dBKX/jydqZyEOSXjmDSuPTHzqfAZKXhV73HmsSukkyuDkQVQwlrz5F8oKiT8v8O+IV+2oETYB1pacISFtSfpe0hx5QVna3C56l5R7n7cIc6YpIcU+8yda5ZcnA+jBXJu5S1zO7wR+54tEMZiFjT7ybkaKX9zAdJIpG6Kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7XaFWli; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45310223677so16020545e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jun 2025 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297669; x=1751902469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NbWFirpIKBP3IzXTFfaq+ycycNGcBK0e0jJK5acRo4=;
        b=m7XaFWliEtve6i3tvbsFqdnOQuOPOgpiiwG2dYyPvGbbx7JQCegpmgCiY6tSKWo0+n
         f0Er5cUyID4J0e0/R/nAI4zIbZOpNDFYCRxpLMBL6/IefQkr1cdXIxulApsyV8c+Wert
         yA1HNtPZhckk2zf0ejvh04Urh2uxSeezUl1VcgZuO45HNRm+jyMi80uxQd8aG3TXlfu/
         XcDLyNUDIp54ZKrHIijMI/HKT93CTHYbizXQZ9nh8Cyjj9rLF43tvyEdGj/zIbtPaTwJ
         g1SboY/a4dGBf/uz/M5b1MLMpRa0il5GvGMcGb5GpDyjkiz6WunZo2/GFpix+34vxd+3
         gx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297669; x=1751902469;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/NbWFirpIKBP3IzXTFfaq+ycycNGcBK0e0jJK5acRo4=;
        b=c9eVMk1z6WKH0NMgi6LTmgFNUWPgciyJ6neebs+hPm6WBW80zV+8u6uhTlBSHBna9X
         mMCZGLkpPHiRSGBlByxt/W8dCZkOD8737ZK+L5Gurf7tuhTuZNY3HumPq7AlEbkWsGCG
         7hRk5mBc4lkEP1VFRsQ/FMtTsrdIW2YTobEeIPIKzvF/HCGicEvP/G7Ug5BDkUTUyyJx
         5wkDpNfHkLX95gLdRThRc4HaFtzGhnUwrqqLaVi7rHQWC/SsfRwrLkvzXbUtmMK7SOe8
         XcG/RT/tRfgUOgChjhqFFhi0SPJhWND/1SDSaECxXaRgelx4Nzs/S4LxwkYS++EE83yN
         hiXw==
X-Forwarded-Encrypted: i=1; AJvYcCXvmQsoC8Kbv66YFhkLpeAj8n9ZxpUTyCpwUys/s2a6Ke2SNVSpzOmlnzyjOB5dic/FpIhQASo89FMl4sa8iMflFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQvfSpzSeECVHs9LxzhP0tgC4tKrX7i1heCuOdjnD+fW0kKtU
	QmKLjAJScQMzae/bYkpd0rWvw0jEfmmrUaWieH4cyC9vOMK+3HHqkRhLAhRNc0f9y/w=
X-Gm-Gg: ASbGncs8T6HEjF4TLujHunoFgNEty1MreIPGTnPh2d7ouRz/XFmbWg0x9CI5jgYbVOt
	MN2ll19DEKZAlpaIVxMulUuhcGbuSWk3lBjFWHO4DKzVLUuNqCCQeXWnf79vejIWdU8eck8qFdS
	zeNvR8ydDGEKp5BrFgPiW0PdpxS5xhBL88YaB61T933ro9RzjIa9BROFBwkXN4zSLYznu6qoAFf
	5jP75zYMcatdv/VjVuB6AjxgTGMC5iyBAPtCJCXjMfkpH9FRkKO1uKkV9UR1c4WU6DXcrevgoH2
	BfpREVodoluWhHM+1xEc7InHEu83kQEecgucUR88WL+ymxaQqPtgpQalO69TCS//totUfSKLhoZ
	sRRaKZK59Z7BWiXWUuSk7b7SHLSNYriYOsH5BA6A=
X-Google-Smtp-Source: AGHT+IHc2LFChK6nKJsc7X9nBMScmXFF/jGKl+Q64KebHtgermLdzgFXssJvaq5SKIfgcrAoui6bdQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a5:541c:b40f with SMTP id ffacd0b85a97d-3a8f435e1c6mr11770341f8f.9.1751297669218;
        Mon, 30 Jun 2025 08:34:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm141654655e9.4.2025.06.30.08.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:34:28 -0700 (PDT)
Message-ID: <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
Date: Mon, 30 Jun 2025 17:34:28 +0200
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
 <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
 <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
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
In-Reply-To: <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/06/2025 18:03, Marek Vasut wrote:
> On 6/16/25 6:26 PM, Neil Armstrong wrote:
>> On 16/06/2025 18:05, Marek Vasut wrote:
>>> On 6/16/25 1:45 PM, Neil Armstrong wrote:
>>>> On 13/06/2025 12:54, Marek Vasut wrote:
>>>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>>>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>>>>> alignment gap between default_address_mode and lanes members.
>>>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>>>>> there is no chance this value can ever be larger than 4. No
>>>>>>> functional change.
>>>>>>
>>>>>> The u8 will still take at least 4 bytes and cpu will still
>>>>>> do at least a 32bit memory access, so there's no point to change
>>>>>> it to u8.
>>>>> Assuming this layout:
>>>>>
>>>>>    40 struct ili9881c_desc {
>>>>>    41         const struct ili9881c_instr *init;
>>>>>    42         const size_t init_length;
>>>>>    43         const struct drm_display_mode *mode;
>>>>>    44         const unsigned long mode_flags;
>>>>>    45         u8 default_address_mode;
>>>>>    46         u8 lanes;
>>>>>    47 };
>>>>>
>>>>> I wrote a quick test:
>>>>>
>>>>> $ cat test.c
>>>>> #include <stdio.h>
>>>>> #include <stdint.h>
>>>>>
>>>>> struct foo {
>>>>>      void *a;
>>>>>      size_t b;
>>>>>      void *c;
>>>>>      unsigned long d;
>>>>>
>>>>>      uint8_t x;
>>>>>      unsigned long y; // ~= lanes
>>>>> };
>>>>>
>>>>> struct bar {
>>>>>      void *a;
>>>>>      size_t b;
>>>>>      void *c;
>>>>>      unsigned long d;
>>>>>
>>>>>      uint8_t x;
>>>>>      uint8_t y; // ~= lanes
>>>>> };
>>>>>
>>>>> int main(void)
>>>>> {
>>>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>>>>      return 0;
>>>>> }
>>>>>
>>>>> With which I get these results on x86-64:
>>>>>
>>>>> $ gcc -o test test.c && ./test
>>>>> 48 40
>>>>>
>>>>> And on x86 32bit:
>>>>>
>>>>> $ i686-linux-gnu-gcc -o test test.c && ./test
>>>>> 24 20
>>>>>
>>>>> Maybe there is some improvement ?
>>>>
>>>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
>>> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?
>>
>> 4 or 8 bytes less in a dynamically allocated struct which is by default aligned
>> on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.
> It is still not zero, so why tolerate the inefficiency when it can be improved ?
> 
> Is this change rejected ?

I won't nack it since it's technically correct, but won't ack it since it's an useless change.

Neil

