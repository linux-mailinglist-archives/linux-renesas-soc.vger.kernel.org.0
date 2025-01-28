Return-Path: <linux-renesas-soc+bounces-12677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D4A20CCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 945331884913
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85ACE1990C3;
	Tue, 28 Jan 2025 15:19:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7126AFC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077572; cv=none; b=au/tPhWtdBpctXXyDvginDYu82GHPYXY7v8PPKLOdDpCGNrAHzLCkLNs+S80o0bknC5w+alotEavlJcZkrD+teDWeJqetu8uyDljvd1XpJL5W2ck7IbF88lE5mlBKNBiyuuFmqDDsj1K474609duOj4eJz8gmtLth0f8ykT9T1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077572; c=relaxed/simple;
	bh=Md50N3OOe/DJiCqaIYGHMSMRHrBCyTEQifs29FhJyeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf/xouvSrM8cnQr/PVMGoYcfn5aR6V0zroSh64JX0eZ86ich2yxURsToAwWU/Kma+7aYTRbzm/d8d+itGXK/p8pw/YZNEwFWMZFLcJSeNu2vC9Af0Q9oaY1xm486/088fcT02o6nbqNWjdR09xpRRQH0q+lm2GM3RQuebLUxM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467918c35easo87584691cf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077569; x=1738682369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov234j+InBbwLn2qOZtd4twDb5X8vkqTeD1wmIriT24=;
        b=Z7ZdAEDTG4FE82VmwQi/SdXvE+sVs+ackyVmq8iUrF0TAIu+ElJ9WEOw6j17HsYXDY
         w0JRokSCdchQ5JKGq4YVT+WE1w/7oyKYeo2FciYEu66AT6QIu9/SVIxct4GY3IaCFA0F
         U9zwUvsT/3Lwu7uFivemloJ4n7Vxy7Dpqtvf0qaMTBheZMO02v2XrKv2vnbxTikITFEm
         k2N5a20yTD2qvLeKF4p2wj4CyDKiYU+aV+rN7+7V4j7f90SLQ3yFGcF6JHoN8ojqjTcd
         L1njqMyxEEEoWwng9jB2Oa6zKsYp4mkLTEPWDB2+ivfUT+JVVOgJItO+PFbnfvfDlOx/
         Xybg==
X-Forwarded-Encrypted: i=1; AJvYcCWda9TYP6H1uEx73bVxUAA78r047pMvT5smSFQYM5XQYqYzlEbDycr958SEr1KNvYL28eMQR02OrSpz2T+Jmv+K9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZRvve2YvYfL8bMM9VUZucjQh9/13sRvQaJEIAEATbKZMC25M
	piq5P0cxUvEKS5ZkL7O+JcZt0oJf7DL+Ne+LMWk2BEzs7/lEyuQsiwldqcK5
X-Gm-Gg: ASbGncvyEu8PLFe53KRaxAEhPcoGXZjTWCxWI6mI8yk3PlulT5tZWtX4OclITIbRDyR
	acwwaPZbADOZ0HG4M+dLv/NgShhaAOB9+y5RT4XPCmGVQM6h63LdX4dU4WoG3I9LsDqTf8I8yKN
	IO1h2ngpH+KWPzdhsMZzBU6xZG91GndGZajUm3EofMyi12jXpLppIXwqloc2l5NAFa9L5U59wlI
	nVUtYyJhvYSYtfVI6NxmUjwPUD++Igl9h+68BO9ius7sGtcd19XpIHnQlKrafgjF2+H2Rno+uY5
	i+9UToDMnvzAFIszypfrcy19jxZtsLwV/tc+xYhuyJNkKU8OizUAavOAgQ==
X-Google-Smtp-Source: AGHT+IF5ayd64LQ30IJdSMvcSUThiGv2KIwAhnrZv8+HxBdiulENJ9JrTlrJxfslug4sXbavIeWTrQ==
X-Received: by 2002:a05:622a:189e:b0:467:6e87:99e8 with SMTP id d75a77b69052e-46e12bde146mr746687791cf.52.1738077568737;
        Tue, 28 Jan 2025 07:19:28 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e6687e614sm52426821cf.20.2025.01.28.07.19.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 07:19:28 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46c7855df10so93851661cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 07:19:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvGwJDWVuFXLxnJ5gujuaD+qx5GWW5MIulGBFWYWU8UTCiLHaQxQZWUwvB4ccQsxx7i4GIgI1yWmeWciWMfRd5ig==@vger.kernel.org
X-Received: by 2002:ac8:7f4b:0:b0:467:7fbf:d115 with SMTP id
 d75a77b69052e-46e12a621a8mr647926671cf.12.1738077568420; Tue, 28 Jan 2025
 07:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 16:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7fQUORYBG=kHK_AHyvkrk-VpLEdvjMU6yubm5A2PV-Q@mail.gmail.com>
X-Gm-Features: AWEUYZnmDaAvP7kacNKm1tldBgfrhtIdxhf1z8HtwJlT0nUVfocHE5o2n_yEnzA
Message-ID: <CAMuHMdW7fQUORYBG=kHK_AHyvkrk-VpLEdvjMU6yubm5A2PV-Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] irqchip/renesas-rzv2h: Add struct rzv2h_hw_info
 with t_offs variable
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The ICU block on the RZ/G3E SoC is almost identical to the one found on
> the RZ/V2H SoC, with the following differences:
>  - The TINT register offset starts at 0x830 instead of 0x30.

The first TINT register is at offset 0x820 vs. 0x20.
Perhaps:

   - The TINT register base offset is 0x800 instead of zero.

which matches what the actual code does (.t_offs = 0).

>  - The number of GPIO interrupts for TINT selection is 141 instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8

16 (oh, also in the first patch)

>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>
> Introduce struct rzv2h_hw_info to handle these differences and add t_offs
> variable to take care of the TINT register offset difference between
> RZ/G3E and RZ/V2H.
>
> Refactor the code by moving rzv2h_icu_init() into rzv2h_icu_init_common()
> and pass the varable containing hw difference to support both these SoCs.

variable

>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The actual code change is fine, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

