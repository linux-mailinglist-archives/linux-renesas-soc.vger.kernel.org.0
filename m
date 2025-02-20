Return-Path: <linux-renesas-soc+bounces-13438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAD0A3E118
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5816E7AB324
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0682E20F062;
	Thu, 20 Feb 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Pvci0Of5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D8204F94
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069717; cv=none; b=dxw235nxiWMTl6G9SabdjeZH9xXuL+wJ0mas/HVSSQ0/WhP8xIJbzolrj6TNr6sx/IxPEP1UE046asqtLuBMdi5GtuAQB/hUAb/4ahxlYg7jBVnEXYa5jUBKudkptwFpv3+t3M/kjZce1cLlhomB2oekxXkXoym31W/zTKG2J1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069717; c=relaxed/simple;
	bh=hd00ma4pTGcrV8uOUJcNNlxDYUowsX9K//uXWoKKs6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWgSc5460HKgtYEenDCe8y+Ko83JLctgzrifCoWCY9ZK1/WW0vJUD4tIOxvK+lIr59VftJe/bmgPVKVM2EvkFiQbB7siMcOQ/+3HC+TjP0wh8sKvvHVkORHXgO0mWSFTD1DmrBL+sbP6os8BHeOeg0DaWgrRgcnV73qO19Pj7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Pvci0Of5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso7679115e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740069714; x=1740674514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdrq9JfSs7AdIS3P3Dy/vFSMWNEesz5Pa+4AW9E1gwY=;
        b=Pvci0Of5ibypY8nHC5Xch7WuSuV+J0zlqvBAU0KLJAdQ9fNDCbtBLDTqViq2wPWPPN
         hvTVog7QrLuqqQiX7C4PjnbE/e4w3f8LdCkYaGQlpv7RblSyOa/IeHb/k+MaPAWQzEyJ
         PQIDXJZhVR9KaPKR7Z4kGgyQvFUnrx7PsTJoDS2J1qokqIyYen49LXxxPkfHYpoEtb1M
         ShoT6ejPw4GDTQD+tFrV0Uuu+2Fu9SEOoxy3wb6ZvRHKmB6sArFrbAYL87o03ShcidQQ
         E5Pdki+a/GVV7F3/BL8G1NNp/FItf5BNqFE/21ffcyM3DGsKQodgPYruA3qUYa9dch1M
         xVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069714; x=1740674514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdrq9JfSs7AdIS3P3Dy/vFSMWNEesz5Pa+4AW9E1gwY=;
        b=rEUeVTOCPHTcQKjL9MDpLa0hZJtY/GmGQ6/pGpgCtWGwWQyVeLCIjDM2I8xuPsLy+L
         EhbA+MOGMAEZucKzfWgQ6G1NMZB0tT1eqvHFWDuDCYjEQezWy/TUf3jVebDKY6Wc1dxY
         8eLL42DU2yHnEo+15gNuCZxE8Yh66jPP3U7mZh4tMKc85oMOQMWmtJxGamMCBOPrUBOx
         zFrGTt2jUqHKaNvnbvDKJwn1yjOQkhfu5C0jRF3XonVPJfxySX71qtBnduFsyxOq5m19
         ngJlV4R6H6e2dS0VsmyufZXVjjVzxylP5wgH00Zidu4rEU6YWEAZ2L5qbEgQbZWFQ6P5
         EtwA==
X-Forwarded-Encrypted: i=1; AJvYcCWUxA99zsjBZDVPUHOuEbjVa/FT5OrdxD4te++rpjtvdB3IWeq38txCJKLjsgCz7TzN3jE3cBASRKQIi5GUf9PCNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ljRYIY8sT4DpMbQESPgtL2BkNCaCrWfp/DBE/Sa3M5RiWZnX
	wPRbwDY55Ie8JkzfKFbLLaRmjvqLTpN9cvtIoXmsi63lyIp/lQLPlYipZxamHqkCjfUNHqLRS/d
	4
X-Gm-Gg: ASbGnctowjiI02tcL9aVD7MzSsUOhJJ2TW4GtoUhoAJ0h39Rtk+K+LtbpfC0WZpju4Y
	E67ON3T2ZHPdRtXvbUe5FTfWBRmQkJZ6cXib14hlKq0hbA4ppst0c1T4NP6QDWQcfkRz/J9GMAy
	BhB/VPzMm+YCcG9+xMISjX0L1/RpRPLOQijpt1FZ0cTGJWoH9KRj3DhPmHfQWGp0HPasLBRGA5u
	xFUNGv93OpI/1wawooAuHWEOtIRpJZEzCfSRp0jMHbEO9/i1axp4i6kNySwLvt6KIxEOg2ent8T
	p2kPHZ/j+oZlRragnDmD5STs/5H0mhmgKPDjNo7eF+qhy05lEG4KIJhAJgsoQ4++i1kSIlY=
X-Google-Smtp-Source: AGHT+IHHPbIgLzsY9HofrGkO4DPp/RmzIGelc/5vMOj27bC0JuqiZhNs4PGwRa5UJ9lkSCt0p2Ofow==
X-Received: by 2002:a05:6000:156c:b0:38f:3009:61c1 with SMTP id ffacd0b85a97d-38f33f50a65mr17685085f8f.26.1740069714054;
        Thu, 20 Feb 2025 08:41:54 -0800 (PST)
Received: from ?IPV6:2a02:2f04:6203:2100:5146:3c6d:da37:b887? ([2a02:2f04:6203:2100:5146:3c6d:da37:b887])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm20668988f8f.6.2025.02.20.08.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:41:53 -0800 (PST)
Message-ID: <f979f814-cf9b-43b2-a928-5faa3996724c@tuxon.dev>
Date: Thu, 20 Feb 2025 18:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 2/20/25 18:00, Geert Uytterhoeven wrote:
> On Sat, 15 Feb 2025 at 14:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The matching data for the rz-sysc driver is marked with __initconst, which
>> means it is discarded after initialization. Because of this, attempting to
>> unbind/bind the driver through sysfs after system boot can lead to "Unable
>> to handle kernel paging request at virtual address" errors due to accessing
>> freed memory.
>>
>> Since the System Controller (SYSC) is an essential block for Renesas SoCs,
>> suppress binding attributes to prevent them being exposed in sysfs,
>> avoiding potential issues.
>>
>> Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.
>
>>   drivers/soc/renesas/rz-sysc.c | 1 +
> Looks like there are more opportunities for similar changes?

For the other Renesas drivers I wasn't sure if this is the desired way.

Thank you,
Claudiu

>
> Gr{oetje,eeting}s,
>
>                          Geert
>


