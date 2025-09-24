Return-Path: <linux-renesas-soc+bounces-22332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D3B9A14F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6451B23A19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3D0303CBD;
	Wed, 24 Sep 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmKt0Jgj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180DA303A1E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721409; cv=none; b=T2w47703uYAtsC7hpSv9bsk1IevLcBtSjn4LphKp/Dffokf3npE913FRFl1qUKyg1qENY9Z1Go452TW9LUQ8KM1dGLhTjkHvJE0xhqpIgbmp3BbOUu6yl0DmXqRYw5q0t3GRqnmszKsUZywQiltvMx+MethYERI95VAPrI9r6T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721409; c=relaxed/simple;
	bh=362mok49h0ojJfmh7EylXoAruuBtJNGAh3gG39mc09M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbMUDVtG7VWeHZxCHljZ23O0abXQNtZ/ERZHsqcM9KeQeadFzLHpSyfU/CC2rPBU1rO+LQEWWRLH384bK6KIewQg2RlSzZT0wKEfRlyCnn84892SARcpxFcaTb+0t6LFMln6UibT5WUGrbcxxP0aQJot35L9yIt8LLLu+bRmNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmKt0Jgj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3fa528f127fso803602f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758721405; x=1759326205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNtYnYusjvosApIQjeQMJVd6fwCQkpG8X3XVdnB9O6Y=;
        b=BmKt0JgjYRQ6Q1TwxQoiZNMhSOt/dQmk9TbqqedqstNJ3jYiOU1KnPLNampvP3bbq1
         2T4wFrHWpOhi9yB33HdV++Oz6euazOGf0+X3eKAz3/F3vGpZoJAsjaVbuiwEaYySu2jT
         jYvglYOncPO1GHcEH2jtGO3PSSGn954UoxMLkvmHhmwCvsqrSm1d0NvFz0pcEy+iiVS0
         2JfF67aUkFPk7yS6CyZF2TMMSflsIfnPhTiJQKbs8pTuKmFqKfYfmR2iJ9JCllmJaHSD
         1bBNts2vYBAVue8w6tpErp3orj+PMJpLfszumD/CXxJr4oWbRr1tIgscG3AUAOQumDGW
         EB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721405; x=1759326205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNtYnYusjvosApIQjeQMJVd6fwCQkpG8X3XVdnB9O6Y=;
        b=UidgC25bVzUWrMGWixI4RfcLLZXGAlv1NmGB4xf1FD0q9MYkx25joNtGbVDABFyRBV
         wuQs9ccww2xfJAVxwQq7fhbstXZVCm4DJSiwPB9ii6mhbZ1Si71Kpn4ZPCwHUBwQhJDl
         MLsstdNqWCkwIfCmYkZPXGaNHsZStKuk0XSDlZptDngieguSxJ2B2Nz0qUoW0+/cE++o
         KqsMAInN5wAHxt/Kqlh0Z9gGtKeE71U2Iza6wqYfa4MH7VmnvKTClERqDr5PDG6FTXr+
         XJDbJ3K8mUXl04AFdOxPYzavSNvl22Jwg/Ck2NhGwHA0zww4fMxl+YvAKT7thcw7e9x+
         DVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDfwlWt/VzqiTJiHhmGG6QQ5g+Xjp5kiav4wqF8IeVoIkyLmfcXQMz9nX/H7GP/m4H0oYLIBbHxewgl3xVCHN/NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyW0zX5oKVlzoD0qAWygAMNCl5SOOR1ZNV0LTeL+/Eq3oB0bH
	JF4jaXnu5hIAW8h/u6Ya70ICXamkuYp19FPGal0q98oPHFlAzGC7fU/p3L501Vbetlg=
X-Gm-Gg: ASbGncvSKsZs8uT3Qmm5LlQ37kZPucHX/IjUQT7UPN4zfHDk9ovxfF3wCsEned1tumx
	nEZcwKDkV2ga/0uvEICsWRRAF0UWk/HGstuxmYeF06qK9U+YkxdJOv5qbr92AAT6sxOHPYTTnP3
	pFdxrlyjYV/2j5VK74efbs7ZZ+v8ySNBYwwKxg244NKjVA1h11XSq3DSgZaEMLFxfQaNwS+Ha5b
	hsTRJ8Qy73t02iwU6icilqz5M6iPyzE0yCrDxtqpaLDEIYcOMrDFyXVB87cXcgkSSwaMmmGqp9d
	MqBU6xzKmbPaawkhfnbUt3u7XTJK1f6gMu/JdpK+t4kxUJqQpw8nzdCCflvpgQZbEmMmy3k5v/b
	rcRKEt3+vEsfjxLZV5G5P8gZVgo1YFAWL/Nb+TnjlbEDgAqR1izlAptRl7GY5/oisENwbA3lBgP
	5GMg==
X-Google-Smtp-Source: AGHT+IGNAydMr50yC2b0MrETOTGyItfTHurjxG7B/vwv3DCmYmEvjQ5clr88rehB9F8Xk9KRZUcVWQ==
X-Received: by 2002:a05:6000:1865:b0:404:2fe4:3a80 with SMTP id ffacd0b85a97d-40ad1605104mr1803335f8f.25.1758721405328;
        Wed, 24 Sep 2025 06:43:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bc4b:2611:54b0:29a4? ([2a05:6e02:1041:c10:bc4b:2611:54b0:29a4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm33284845e9.0.2025.09.24.06.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:43:24 -0700 (PDT)
Message-ID: <69f09f55-fd2f-47a9-887a-e9c2cf7c21df@linaro.org>
Date: Wed, 24 Sep 2025 15:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
 <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
 <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org>
 <20250924093132.GA1062104@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250924093132.GA1062104@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/09/2025 11:31, Niklas Söderlund wrote:

[ ... ]

> If it's not too late I think we should drop it. The issue this work
> tries to solve is a lockdep blurb which highlights a design issue in the
> driver. But the driver have function properly in the past. So I think
> it's better I work on solving the blurb without any regressions.

Ok, dropping 2/2 but keeping 1/2 is fine, right ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

