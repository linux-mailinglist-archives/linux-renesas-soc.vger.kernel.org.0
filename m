Return-Path: <linux-renesas-soc+bounces-17151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBDAB903B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 21:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF891898A8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 19:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030EC266B66;
	Thu, 15 May 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoKWDcnI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483931E480;
	Thu, 15 May 2025 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747338844; cv=none; b=i3ZNXiJJ9uaRZe1NWx4VYBdNd372khanUX5Rla33wcZkg0OZ5MuC2CPoUQ01hO9Kpr/Ad60fb3jXbZaVP93l4lrYofKfy4K4Olp1irRPSmDWKErPBOOzYuro0SMoJm/iDwn9XWf3EPWLlXbHKVdRrq0ShiVWPa2Nw8IZyfSeJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747338844; c=relaxed/simple;
	bh=Qkswu8ueaXe8iFWpGCysr/lnl/OObmpOx3mPF9UNa/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NhK14UJf+W09JtMJ1GtwZh/TRPhb6t+GNtNDveCrZxwi8EmLdpk63mJteBoxGSRaIrC/CnQS+rFwHpcZlEt8+CVL6hMnWGmEep9FaGERCMxmTeu7DelhjL0R6qaq7naM06ikfziTw+xcihy1NHDh+OiSGLZcigPY7eyQjvdskcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoKWDcnI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so2567606a12.2;
        Thu, 15 May 2025 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747338841; x=1747943641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2Rd/PEEQGJgWudCDjVM05iahq1IhHT9MZFa3pCPmmA=;
        b=QoKWDcnIVqKvMyTHHZxeTjvbwlh8kgtA02VTHs2XZsjVEm7PfZxBZA3htKeltIO0kl
         A4bHdbCjpN36Zj0ijgpaBbv4qvk0C3bYj7F1N9JpFBRGQ3Wpv2GGAwAtEeFjhQr2tRuw
         OImmwkUBHGdUxhtc9D9TF2UlVvkmA+kNQ9cakmYqH6HUSm04z15DaH3i6UriwzLxHOJj
         LzzAPvHClZyfO76EuDx1vEykGfH2a6p0piQm9VmyTvGyx1RmddHeAlpHAYbjSnHz5YWl
         NphxOZOuZqidpmgqj7Vf5vkXVFMxUP+9pnrR0tsQ/J6x27vJ7lA9+A6s8qcuuJM0KIap
         4tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338841; x=1747943641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2Rd/PEEQGJgWudCDjVM05iahq1IhHT9MZFa3pCPmmA=;
        b=sTrCH5qnjLe/w9h9tmgGXr6CNXavzx35Vp+LXGE2qVxhn321DWhOta54Uwq0ZdKEGk
         SXk8KTwnEOrUrwdB0ms+/nmmJtYCaKD997Yq36swVALs4MDVEM2YOZx0C7tI0MqGMLTB
         McrpsmQTmFd+efB60eg1OhiV3aZuuYNwbIBBcIPh52Thd5u34CjykVY0REISwsKfQrDF
         KNTXAxjpWBF+/sN6nTNCgkLR13iV4K3/92RJCmJmQxeC9Cxfa7X+V8eMw+05FBjUnOcX
         9TNrVvdT/OiOTMgLo1nG1PiOazNHSDALWXJRKBVToZtrhetCtEXi8qSlUma3sPrV4djK
         B1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUby7ZSFZ+fogfKeNUNiB+WeuH1e8fOgc8hWOfKhCe00VQSmZ0qy3DWYnvMK6cJXL2VtEoh/WEaJ60e/4iWPqO2VCI=@vger.kernel.org, AJvYcCUqkcY201CivevtzRFsx34JjBajfJkmcyh1sAyz+VmAD3mcFVrd9wf4Myak9JdHDfz3Do5kxHx/ECX6@vger.kernel.org, AJvYcCVibu5JIH2qoUnyDei3FUffKV8BRTQe0BAnnn2+0Kw2uPTyZY8wlJ3c7tfn9rxAppwh0vGPCdqox/puqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIwBTG6Y12YRcLjdpH5+2cE4+zvIGUp0SgTUmWg9VSutD1FlF
	zYnM+Ff1CPYZyMgkGGrr/LnHKTT+QOzFHaXoEMlzVHLtERnUKZCL9s0U
X-Gm-Gg: ASbGncuXy/Umn6S0qLvWVmWASX1g16WvxSjj89DMVrN87sJiQwL7j3QCq3dxfR2/igZ
	fRH0Y5cHArupK766swN8aGXGxkB+5q9mX+fuMb1qfJUBZwgOMmcEjC4LuWm0HgfX8OGjk9SC1lg
	L89IvMxuJHiwzbX5qdIog5jid0Gd4BJFLCM8Pq7iblLC269uRNkhYIbWLSyROQenarZ1Q6PRwN+
	qHU7o6lYvY9eYfA9zH9BLUPKL2aeAHxdz/NSN5v2T52nnU5OQoZmmqak3gdCoA72tQ7DyHgvKzj
	OFvI7uuon1y5pKvS+Opy+6Y1Ni1wU0nRyM0RXoDNO78pshADkQqXmTU+zugg8N11
X-Google-Smtp-Source: AGHT+IGsRjuQopXhMad2zCDx9I1i3hVya5ii9kcbMVH4RCaOBV8ojym80d9AHpekvnGbGugM4XsMbg==
X-Received: by 2002:a05:6402:5245:b0:5f4:cf0a:84a1 with SMTP id 4fb4d7f45d1cf-60114069957mr15413a12.7.1747338841269;
        Thu, 15 May 2025 12:54:01 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e019asm251735a12.36.2025.05.15.12.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 12:54:00 -0700 (PDT)
Message-ID: <1945f0d2-5e29-467b-8208-adf4e8560e8c@gmail.com>
Date: Thu, 15 May 2025 21:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>, linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro> <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
 <20250514152852.GA2936510@google.com>
 <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com> <aCWlenAtx2uaQhcE@shikoro>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <aCWlenAtx2uaQhcE@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 5/15/25 10:27, Wolfram Sang wrote:
> Hi all,
> 
> thank you for providing all this input. I appreciate this a lot. And
> please excuse the slow response. I am currently at the EmbeddedRecipes
> conference which needed a bit of preparation on my side.
> 
>> So the node would look like this, for the pca1 LED:
>>
>> led-1 {
>> 	function = "pca1";
>> 	color = <LED_COLOR_GREEN>;
>> 	default-state = "keep";
>> };
> 
> This looks optimal to me, if this is acceptable. I totally understand
> the advantages and desire to unify LED naming. The main problem for me
> here is that the GPIO-driven LEDs have no 'device' part in the generic

Actually devicename section is expected mostly for LEDs that are somehow
associated with other devices. In most cases it can be skipped, see [0].

[0] 
https://github.com/torvalds/linux/blob/master/Documentation/leds/leds-class.rst#led-device-naming

-- 
Best regards,
Jacek Anaszewski


