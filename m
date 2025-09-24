Return-Path: <linux-renesas-soc+bounces-22340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C77B9AC2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 17:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858B5162241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781F23128C1;
	Wed, 24 Sep 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ERxaZORr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B32749C9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728720; cv=none; b=d7gIIl0mZQRMahc7nBD59zX+V6jZaHgqBE3Va7NIp2sr3iz+UJ8Zt70bxBhw16ISgxqe5InBM7po9t0VE0afzlblVg2ji8gzn+NxUqfm7kbtrZosK/x+EqBJWmyRlhl9pb/pbahrymz9h2DyFWMVKIgKNAK41sF8Y5M3JTesX6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728720; c=relaxed/simple;
	bh=wxoRaReO4bOkEJ9wqUi/JezN7CZUe2yebO48RziHfMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AO2LFQNepkX4xmZNDN3z8sSbOtdR+zr2bMfizTnXfIagSaMu0xLy/iuMb7JWgE6jcoIMGao/BrKLguIdeOQFPdG7ObubyaEBRmkkwEMnqH1ACGPcruboxJXGaTY+K05q1pYQQaMQrdP1Uoeq+rnJa2c38VdUjtsjIlD1wLM7aGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ERxaZORr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45ed646b656so61015375e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758728715; x=1759333515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHM+dPg5CzcBzObOI9Pf2b6r0LMdTdXtJZQ6lv1PBkc=;
        b=ERxaZORrYnw71Lp37+kNSzcbYIUefU+tY/3fOWArGMxmn6OudbkpdSRNAfuWS7kvc4
         rzmI0SPQvN4NfZMqcWvy9g8CZRekg5qeHDNQBifXQLBxhxyDfyNibSngfi2tMHspvMdV
         Qs76yC/95q0qCvoQeV9F16BvC+HhkfHSIm7CGiJoMKo8D9zmvL+751FQIzQqISwvrCkC
         I+rQobLiLivQx1qqx0SUcC4zNHUbP4HuCyXQ/zvlMZOT1GiDOrB4dm228z9139+C/I+A
         v6kZDBCM73eXBc5x62WmBpj/wxGFGTVOGBnc0HwfmTmQ/24R7R6ue2CKBslSviNzNW7O
         KTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728715; x=1759333515;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHM+dPg5CzcBzObOI9Pf2b6r0LMdTdXtJZQ6lv1PBkc=;
        b=ToRv4BeoohLfGfhPjcKlN9Rp/O3fqAS6LSW4eiHQRO0R5nJvYhHTiW41q0cI8e+Gb3
         7HUIjv9mGh1+svN1n4JW4eOxd6yV+XPBw0H6ZoYViItEXEN1Bjoxy4IEKIxiJ06XzDGJ
         EiNLkogfQP7Hwa03hj2zWfkHZfBBFZhQNhoV/hZrmu80/XLZnI3Sb6F1sSTK8JzJ2wAb
         jzRt/ic6nhOe29gn13bXL36hA0E0KqMcHRfE6NokbbvXcBDgBUgfE8lw4p5cNk+BCxNq
         vR5CwY6S3i44VBqj0PyCPk40IkHhYrA2qa1CI5VMMkS7psAqJ0+gj3kUmkRVJ/slb0WG
         qiqg==
X-Forwarded-Encrypted: i=1; AJvYcCWxSxqUSnY8wHy8LR1x5JXKPuN/NZqqLA9iwuuT83wuEK2Efbim5LtijqvmG4zsc/6OBc6ZcPRiIzd37Gvh0bKbuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgTnuTyLR5RltVutyuujxnhv/xB2u6ES3b2Z4qBIKIiCT3oxH
	0itqmqz40cjE8zfHV9URCdhK+u2jlGnpYO8yrx0dpWb6Bi7sJb9qAr1BOJZ5B09QmZQ=
X-Gm-Gg: ASbGncvHsPeJmluV6pBj4Ys37oRhgaqXmiB75l19CJ6L5qe3mdS3ZLcJgF0Z5VtBOGl
	3ezDYtpnuKKe8xONm9J9ir2qDJ8qiXunw5CRsLgooaqQ+R0tRTRnZPyE9VhjaCpOQOCywu+vcNl
	5gIQDHT26vGfZ92lcEREesa+FQU5b4VjhdOEo4VdOGjMtkF7UnQB4xWt1QDUl823vImWIxXQSNd
	M2lQ/pl0raOfMloqF12J/3H0w3hdNT/uahMGGdNCwSuMKXfZnBLfeS4g1GJeLgF/YTIGZ5jorZL
	WDwL4VWpPC5Q9WVTVVX1IJkxElzS+J4gS0Goadbso9Yf7YmuYGqa12Gc57p87mLkE4FNufxtiab
	zdzM143JSyK5KNWuALG7+BabJylCXBi0=
X-Google-Smtp-Source: AGHT+IHMnyFMvGG37xHm32Yaa55kvxvWk5ho63VASQxzF/DozMTzRSP1c41ESBWFhl0MwyfSWac6UA==
X-Received: by 2002:a05:600c:4e4c:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-46e32a51741mr2647965e9.32.1758728715341;
        Wed, 24 Sep 2025 08:45:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07408433sm28236778f8f.20.2025.09.24.08.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:45:14 -0700 (PDT)
Message-ID: <e19b5006-c6b5-4e72-a3bf-42fa6833936a@tuxon.dev>
Date: Wed, 24 Sep 2025 18:45:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: renesas: rz-sysc: Populate
 readable_reg/writeable_reg in regmap config
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXKbPGqAnAcL2kFyF6K3hH9=gr8ECAFVpkgj-OL1mB4eg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXKbPGqAnAcL2kFyF6K3hH9=gr8ECAFVpkgj-OL1mB4eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/24/25 16:44, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 22 Sept 2025 at 09:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Not all system controller registers are accessible from Linux. Accessing
>> such registers generates synchronous external abort. Populate the
>> readable_reg and writeable_reg members of the regmap config to inform the
>> regmap core which registers can be accessed. The list will need to be
>> updated whenever new system controller functionality is exported through
>> regmap.
>>
>> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> How can this be triggered? 

I found this issue by reading the exported regmap debug file:

cat /sys/kernel/debug/regmap/11020000.system-controller-rz_sysc_regs/registers

Thank you,
Claudiu

> AFAIU, registers are only accessed as
> obtained from syscon_regmap_lookup_by_phandle_args(), i.e. based on the
> register offset stored in the DTB.  If the offset in the DTB is wrong,
> there is not much we can do ("garbage in, garbage out"), and the DTB
> should be fixed instead.
> 
> Is there another way the user can access these non-existing registers?
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


