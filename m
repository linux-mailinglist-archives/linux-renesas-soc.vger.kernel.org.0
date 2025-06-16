Return-Path: <linux-renesas-soc+bounces-18377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01350ADB61F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 18:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295EA16FE5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256731CAA92;
	Mon, 16 Jun 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NEGfm5OI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wiv79ZhW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A6F285CBF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089934; cv=none; b=SkAepeyXaaB9iG4vdm0ElsmfypCUhW3Xv1K6kTsp3wNW3ELPFFcJnoZhuPM64bQS8nuQfTKDxDn+wthAwFVHvRJNTkyRzcD1WRLg1CMLDyQwLC5nrQW6nxFhB6187TJ8VYEcawlhCie2SbfZalIJOR/+C3Fy7Sb3uPeuXP4aqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089934; c=relaxed/simple;
	bh=UDowOu3OIAklHqNz5GzkJ0s2Z3qXDm8uPxDa28cG7Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYjWjVeoUPNyAKzZvwf8DT3DV9hEaqkcX2plJglis+p67769ludQiSOFpUKEblSZlDZxTyACn01w8oKeNFG2YqPm4yK9K1wO6xBo/ijsewWJTrXgyHcouQ2/VcckjwYfk50tWRMMPXN57T1iXKARCve+qJYpXVApddv9IRy92gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NEGfm5OI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wiv79ZhW; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bLZbZ1X6Cz9tZT;
	Mon, 16 Jun 2025 18:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750089930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUyKn+KNUkQsExEifEck7guNUldalSigDR2Ao58orTk=;
	b=NEGfm5OIWtpYvf2lCnLXIDqrsQUAawHzxNq0rjjuIV/96LEaw5AJEktYyk3+tBvitSM/yc
	5aDJrDzOZeAx386XsMiSTCfSmU8CyAZGddXbYPvM+ZpxgPWVQzbclAIb2fprJQByFsmPx5
	IuvQHCn5xs72tQUCQQxG939fzp20gqSTK8cJxGQeH2wnw+gWsZj6PE0f2hiblXKBfMxWgm
	WYqv+cMZulxcmpektkSYFBsd1YH25cgbpjnJqkf8ol6aB8Io6Bkyf9LbhPdoVh/9y2pWX8
	QA9tL4K/cJVlClQItLIwK/8c9dD/Wtqn9L5cV7XQ1h7E2ieQhJ5+JxZELnur1w==
Message-ID: <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750089928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUyKn+KNUkQsExEifEck7guNUldalSigDR2Ao58orTk=;
	b=wiv79ZhWmZTqxkJVt2kC7Mzxws0LvgFVPjzcRdMIO+e/hrv4IKpfv4RBc9mBwkHIAA7cqK
	8ekxsppOELlHLLwmZhEJ7aJNZxCxolXF+xXm6ImwkywXIP4bILO9Nof9/MtVlX9ddR0DKV
	QCCG+WIkwT6NxJVIwWuSCpZaIFYtVZDda8Tc2vQ0DEAmCRP8zRIhcVtowBfeT9GyIu/niR
	O+5sHwx3N4+ZHOtvCU9/FLnG87Udk2vg+nxVsVgOT2IVPezWfi7Gvu1RQl9Ek8fcQT+wYZ
	wcFI5MeGQE2G0YXLj3PKOD2tc1aYW4Q6eKHFDHdNntVcIOZ3G45cZMPjw5bQow==
Date: Mon, 16 Jun 2025 18:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ymmzxqrt38hfyau94duu1s7y3efjq78n
X-MBO-RS-ID: be874eff82ee2f5c952
X-Rspamd-Queue-Id: 4bLZbZ1X6Cz9tZT

On 6/16/25 1:45 PM, Neil Armstrong wrote:
> On 13/06/2025 12:54, Marek Vasut wrote:
>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>> alignment gap between default_address_mode and lanes members.
>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>> there is no chance this value can ever be larger than 4. No
>>>> functional change.
>>>
>>> The u8 will still take at least 4 bytes and cpu will still
>>> do at least a 32bit memory access, so there's no point to change
>>> it to u8.
>> Assuming this layout:
>>
>>    40 struct ili9881c_desc {
>>    41         const struct ili9881c_instr *init;
>>    42         const size_t init_length;
>>    43         const struct drm_display_mode *mode;
>>    44         const unsigned long mode_flags;
>>    45         u8 default_address_mode;
>>    46         u8 lanes;
>>    47 };
>>
>> I wrote a quick test:
>>
>> $ cat test.c
>> #include <stdio.h>
>> #include <stdint.h>
>>
>> struct foo {
>>      void *a;
>>      size_t b;
>>      void *c;
>>      unsigned long d;
>>
>>      uint8_t x;
>>      unsigned long y; // ~= lanes
>> };
>>
>> struct bar {
>>      void *a;
>>      size_t b;
>>      void *c;
>>      unsigned long d;
>>
>>      uint8_t x;
>>      uint8_t y; // ~= lanes
>> };
>>
>> int main(void)
>> {
>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>      return 0;
>> }
>>
>> With which I get these results on x86-64:
>>
>> $ gcc -o test test.c && ./test
>> 48 40
>>
>> And on x86 32bit:
>>
>> $ i686-linux-gnu-gcc -o test test.c && ./test
>> 24 20
>>
>> Maybe there is some improvement ?
> 
> Try again with code size included, and other archs since 99% of the 
> users would be an arm/riscv based boards.
Doesn't that mean, that one some systems it wins us a bit of memory 
utilization improvement, and on other systems it has no impact ?

