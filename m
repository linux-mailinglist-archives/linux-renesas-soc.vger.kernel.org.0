Return-Path: <linux-renesas-soc+bounces-24593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E329EC5993C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80433AE010
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0403B3168EE;
	Thu, 13 Nov 2025 18:54:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078A316182
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763060098; cv=none; b=NFRg3Tkca8+vWlbqIdYeAVkMr2MZuiuzRdsPK+L17aNJHI7hpzLST9RuICx1wWnpkuTUUuqgbk+J0SgW0duZZIhpJ/WWvSfPMtJTFYgER6rtg0+TGHVxAMvbaNDPrYt+hfwkcN+EmIWXIHp1u+kpd1OH+LeLOBHqJuSfuya6oIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763060098; c=relaxed/simple;
	bh=aTL/CvYlXBXlKqttDnMbVw2A6aaApMbe0Ys8TkKMMFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0fAkT9wxXAtvbFHAo69s/sO8YN+uYdKpQ/uBaGGSUUEcBePBvnMDq4WlIp6VhEc3o5lLfTexBBzx6jErAd85hkuRfTxzBJEOhfetQJ36ROtnP3zyZNbB/suhwiY9sHUamXFyFb5c4elWiWDqcvhmACBxDtNxMABDfCAW5QIVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5598b58d816so784135e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763060096; x=1763664896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/YE8T+hus+YJz4kOdEnC5RNNB3F9EQPBk/to49jz4A=;
        b=QZxQrtEAsxXk1Ab4ULjSDTHsYYmfUzS0PSTm9DjSPpo+4kYvZWdevykCe8BRw18/n8
         1+n14fHTEy5FInCYd5AoHms2lg4eUv+gHJSBkPdnyHKlOVqHIKI4yqv3KFtbRqFoRZgD
         QSAOa294LoVafJAw/iI2iLSgmnKm7Jn7iMCiZI/zShIylZLiRD716TzlZOUwtpHP1Anm
         PGcGoNjsdVeLlTz8YIMD7PA/9ttGXEgRw6rk+aPnLFUD0ufQq7mzfccRgvO2HtIE4ItY
         7EjbJJi4TuMMn3xMK2lHA7YcuFk4wsUv1oF7lYglQPZo/aHAefy3h3aQGHWi+ZuOirAV
         axpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZLSP3/mNTY9msId6xruf5S2zw6seLj0nigP/GFvyieKMiYa2mXanAUfIiGWpNmNCVbbS42KoCJ9osohbyAMKDzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwagoXY4YQkHe+CI4/ZkCFHtcvMp7FZlAzsHSnDsvYe4E1SkW0D
	ikw4Mw/2vzxjIspBqMGgFhPjwVI8HKP2FMq31kX4zUB24j2prxoUrLsQTRvTYI3KQ2U=
X-Gm-Gg: ASbGncvQZ724V2lgffjs3xeaNhobN1rHiLLUUjiNoQGj59xAYmdL5xKvf0qtATb2dcP
	81FdB6Ps+0SCiBQ/9gEK92TTu1LlXmboi8+mfLZXNFQebd5wP5GQZ+7zrSVQ73YrbktSpPPhXRN
	rbNXQAI6DkOOBG8rWWckqb4/WU4zUHzCNzKR91j20BDgsCiCsTgxXSBGOBvK+Xh/vSsfJlBkv++
	CtZZA1lDclkoqxBwfCtlJLzlpNlZJzGpHKGDzaTgDw/Ax+mMb8VMWFj11D0/r9p0g9hEUAEXmRu
	RmQ2igVBcN6nBbri0OIIbrKfWyvjlXOqIg4MdkZ4wPRQOEX1e47adrUNBfWoqZwCZlxvKR+9hO4
	FCbu42KV1m8VpYUpAqsGFvG5kdYrsq3KoSyKnSZg425RDzigC/D0Q1BnHwTm8ml58SqMs0v5fWl
	kB/pw4yMgTHBZwlq1gaHkX/38odY+JmkxXzY2rcQ==
X-Google-Smtp-Source: AGHT+IEIkmhwXdpyzfQ/Lzt4HqLtyFQ5CJBqH/Q0GLGU1v1wHBS932dF/Uj+omgeflXSxKT6SzabzQ==
X-Received: by 2002:a05:6122:4d83:b0:557:ca69:bb83 with SMTP id 71dfb90a1353d-55b1bccc118mr367904e0c.1.1763060095576;
        Thu, 13 Nov 2025 10:54:55 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f463cb8sm932808e0c.19.2025.11.13.10.54.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:54:55 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfa9bfa9c7so723552137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXs5UMNEKA5YQCr8lvzwLD9E5ydhEi1/qL9yHfDRO9oKp5Umbf+5tCPM7tjDld+3nD62LcnV9a6Qjb/n6IenGUtlw==@vger.kernel.org
X-Received: by 2002:a05:6102:4487:b0:5dd:c3ec:b5b with SMTP id
 ada2fe7eead31-5dfc5b72883mr385433137.31.1763060094990; Thu, 13 Nov 2025
 10:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com> <20251105070526.264445-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251105070526.264445-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 19:54:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6jBKuQ+7bkVwXDmHS+9gUqtHVofyH-WuSS-Rnp939rA@mail.gmail.com>
X-Gm-Features: AWmQ_bltKghBsZLySw-l2vh9sgIT7XEySbfTSJhtupfmI0PXdUgVSCq0B2b-psM
Message-ID: <CAMuHMdX6jBKuQ+7bkVwXDmHS+9gUqtHVofyH-WuSS-Rnp939rA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: renesas: r9a09g056-sys: Populate max_register
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Nov 2025 at 08:05, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Populate max_register to avoid external aborts.
>
> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

