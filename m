Return-Path: <linux-renesas-soc+bounces-27055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41458D3AFE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 17:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4BAC301DE0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981A8205E26;
	Mon, 19 Jan 2026 16:00:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142851F4615
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838410; cv=none; b=SZyHJLnjEzO9n9X3E19m8zMNtQM+8dX2WzZixT3DNy4PoSUOFTfj6XwiG55O3OwKqJIDAmHQDu8kO/bhlCkqF1H1wahGnvlyIVhtej+J6YRIildRD8gLXz98ZAkqX4KcJ3/CoYSwAoCZiXcyQ3eC2Wck4t2JxyvNOsLnyC2miq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838410; c=relaxed/simple;
	bh=eb6D6/a55vm9al21kajs54FVPI2y4Ag9eZRWr0kdwgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJGltvrjEpPMgF704eAVZm2s4nSihVGcb5Q8+cCeDMzhRGLw88xRLGMdZlHU9srXGa5RWa97ulLi1DUo1h6wWFP0p3LlG1S4956UyIOhAwieUNn16pwpz+ivMm8TlKpN5px5xv0xIxyF2k7a1WRGe9BvVkvHgPsTnqsUiqeg6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea75115ceso3973086137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838408; x=1769443208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hT58BDTF1pvqexWRcVDA+bO694WnbhM+to2RCxxMZI=;
        b=WOEQJw5LgYuHvvYvow0tC2PdAcujCRQo4azclMcgSDTecR8c5IVxZ2C30fuSFv637s
         17+BCW/CEHxNHRkbo2Ol6FddJS2B3tXn87+3406GPIf6Z47wLG4o/iHR+wqZbLJgMmim
         rT3HnO/LJ+iUX6Q/Jt+i9/o6ZIqGrzxCXG0RcsuOs3Jd0kAK8jx5IzJHRcIlf/gvph38
         230uAq9stwolkY8d6F17pEXvYep366obSIS6OBIjKoV++MDunm48SaeIF3EpiIvCCWuX
         BLWW54IwzEqwayScj54zmQHoEVGKPYhVB223lJLdNxXxtXjaFw8zmPcTUim4iYgT/rLi
         RoAg==
X-Forwarded-Encrypted: i=1; AJvYcCUqqGKwzF3XnO9aQOOACqXz1i4Qmb3q+EQQC0F5G0jF+bShtDDHMD665x2fJNkspaXDNhbGt99vh3UZamcnWO3oXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqN1rVnpmaNX785k2FkjoFMGHzgFl+hXrB0bT392d5wFxYOFHA
	wlnHSDbrpqzhDLjo192t2St4D+oHDVs5jcXE2NugqCdYvOLnd9UYGTg/MbspsUe6
X-Gm-Gg: AY/fxX4ZipBXHaQQP9HyZJAwQvwCgaF2/h8pmAHy2Cq2iQHLSQZlM2BHI9v2ihRGjOm
	A/e6rZA48SXKCcAogd2KxNaVhCJ2R8f/5MQDooEOPxJi/dC/93BIhSF4++Zj1thhXST3n1PDtf9
	Xrex1MCFd0ppk2CyRJamdQzgYz8jUU7Q4u39nKlWgDeDVFDcD7ydWkQgDHeZxifPyIgfrGQ8ceR
	QRVcL3dRTRpxIezXghVjmXde3q4JUpCH69/3+wixfrCzucaI027W31/gIovvOS8+xy7RnjZSZJo
	AFk2SwHY/Z3KmP4LKIrDrNoAZDcKamX5Em+/hEPT4PKqzrwRDQNeWRvhLHeGrW1je9EfjlVzpg2
	Eghe743PPrTnJxDwLZI0i9bPEh52CsLMVa57RGjoT157281I5nrj4V1Q5aaVLwhKBynPuC5Z42e
	A5pQH11RjcAECOtCtdwwo5oo85Hf2REJRsYBUrIodP25bnEgo9
X-Received: by 2002:a05:6102:1a11:10b0:5f1:b685:e654 with SMTP id ada2fe7eead31-5f1b685e992mr1916301137.8.1768838407975;
        Mon, 19 Jan 2026 08:00:07 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6772b70sm3688206137.0.2026.01.19.08.00.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:00:07 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ef31a77afbso3690825137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:00:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXY8z7yjkhj1UuXBZk5pNM5fSRgybJYrNSssjch/g+Y8fNh8tdNAjkuh0+smwEk8QqWCMYVCwlaBQgAlGrLrr8psw==@vger.kernel.org
X-Received: by 2002:a05:6102:c54:b0:5df:abc1:e6b5 with SMTP id
 ada2fe7eead31-5f192539aa3mr5432025137.17.1768838406940; Mon, 19 Jan 2026
 08:00:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119150242.29444-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260119150242.29444-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:59:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwD9+hYbut37gnJML-Fhz+6kDqUWOcgKSo1eycZRgsvw@mail.gmail.com>
X-Gm-Features: AZwV_QiLc3qN2dSh2kpzFDVeY21PCd07Pkeq9W0NJqI963gYqgaIk1PGN_jervk
Message-ID: <CAMuHMdUwD9+hYbut37gnJML-Fhz+6kDqUWOcgKSo1eycZRgsvw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jan 2026 at 16:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields corrupts both
> the struct rs9_driver_data content and data around it, sometimes
> without crashing the kernel. However, the kernel does surely
> crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Update the commit message crash paragraph
>     - Add RB/TB from Geert

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

