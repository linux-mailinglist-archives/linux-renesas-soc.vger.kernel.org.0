Return-Path: <linux-renesas-soc+bounces-27041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F00D3AADF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F82930006D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16AF36D4EE;
	Mon, 19 Jan 2026 13:56:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D136A01D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830969; cv=none; b=mxa65B4IimDxp/luZonLP5p+xdnco52JFb2GAp1Q7ZXTDpF+OpBXtpK7bjCaXayI7SSsGdtQcvs+s9qWWFX6oEW8yPDiZgKly0l6MmXz6DJNmQJBl779CBBxov72TE6dMmCHF127kjMbUuyMXr/ilWPGuZQeYPlHxERZJoV6uqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830969; c=relaxed/simple;
	bh=USU2dfqEi8y03HM3f87V6O1i0tfjkLsCH5ivCaeDP4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYrceaKGH/p5qouDPOGtNxt6JVZhNtX2WUI/ZfK2coDDasIhv92IvzmN0LHyLbgVibTtaIFPhsX3jlhM/dcJik4edwWolmITZhDgpMChKCw+FdAPzZGkeDimykPla8kSEKvupVEoUH6hLw9aiC+vB6Fa9k/+GBUj6x5fMGMpM18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-560227999d2so1219869e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 05:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830967; x=1769435767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r64VZF3kohfXXfdlR1Pb964pfqiX29JMKKPRtqCraU=;
        b=izJD664n6XezRl9PuOkKBzSoMdIUDRY9K6z1+gEuP8j5GHa8hm/fX/BxriRyuKJ00j
         tMWL6Fi292KDVczF2ltv/u/MbpOeHNm7TG0dTT+iZgMsK2d7Tu8PFD1a2mFV/z3jBjht
         e5CsU+RvQ6hLna3jaZ73cgtaLeQyjREtibrJIAuTVsQ/MLLx4tdCMAUDrSpErV9Kl8BT
         XkPDhLQgAVnalv/N+PhY7vV9/4I32tBot9ytlKbnB1PqtB+I4M7/0CYUIEIU6GgqXrUA
         LrGnQdP4AgFzBaD6Glrb/0IFxD2m7caIny8O8FY+/3klzu/16RJw8K3FHqi4eBoVaGBy
         9TZA==
X-Forwarded-Encrypted: i=1; AJvYcCULr9MlXtlHrh1vbYOqEN+LQ7HDqS+OXf3ublIeo8aVuGvHspBZdw/HlpKiHWL88XWHn+L1BCy3EDMVuxlhR1OA4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6fjMpWE/aaiu1Nh7pSjokThwCXAJYVFLdlYwstMFxEcMWnAC
	+M9uKzBTH1IWfs6owE9/7duM3CT4mFiMJLeJMu6XOQyYoFzmJ6rtwdXGAftb1DPW
X-Gm-Gg: AY/fxX5Jussa9jBf/sBjZOWDUrCv+IhrYmAiDcx0ls4wvKyKn55E772dpbdaJsbyaN+
	uxaKCVt6UcSrz0U51/w6XLyMq1fZhMIWL6w0XkYU3WcWHwYbOcGoc/qn7NQCab3pwVrudr9b+OU
	Hsz0XF/cyDD2mBLttgIamwgN4xO/qTysEiXX8od6Ra3JyRCWIRJXLp0Rty1g6/EMBsrQQDPrIwU
	YNg8IwBP1qbn8shcvG1gJHodwSpKpO5/P1bG2OyLG+kqQ6YeVyh5trF++NI3b3FKljdJTtHvKhK
	1a03xo/LhQ4EJYCajbEjqnTiEA5wK9OsbId5t+r1vLeMNAYFtESGmyUHu0dG2ZjI4UG7PSO/6AH
	GRrJym2mmFlUK2iWmi1HFYJhy2G6ZrvjszPET+xcWnXM4Zhc70ZIYNbMCVBmYWH5napqMq7Pugl
	+NSzm3XHlai5abj6AMGbapa+ulw0iH3E5ftrnYJxgpcny2XP7uo8/G
X-Received: by 2002:a05:6122:3a10:b0:559:65d6:1674 with SMTP id 71dfb90a1353d-563b738c18emr2498638e0c.14.1768830966910;
        Mon, 19 Jan 2026 05:56:06 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6eae96asm2927559e0c.0.2026.01.19.05.56.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:56:05 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-560227999d2so1219849e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 05:56:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2XIdVGp8WXlOHgI8EpBRRjUVNysYQNrQF/APcz38bmQOQ/cuc512hQVNKkycNPS3QDlGaYIQ7eRgQ3tNCIbUEjQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3a10:b0:559:65d6:1674 with SMTP id
 71dfb90a1353d-563b738c18emr2498607e0c.14.1768830964978; Mon, 19 Jan 2026
 05:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 14:55:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
X-Gm-Features: AZwV_QibGyBfaw9ULWtL_BEHCROa8nfd8JZ0JnZ6LzEfFQ4IkCqSKKVBJv4Vw8w
Message-ID: <CAMuHMdVkYUwYHOCtFb==YJ=1TK9+Tz1X=teaoyoooxe42eBYFw@mail.gmail.com>
Subject: Re: [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 18 Jan 2026 at 03:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields only corrupts the
> struct rs9_driver_data content, without crashing the kernel. However,

I am not sure that is true. As the last 3 fields are just bytes, up to 3
pointers may be written outside the structure, which is 32 or 64 bytes large.
So any buffer overflow may corrupt another object from the 32-byte or
64-byte slab.

> the kernel does crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

The crash I saw is gone, so:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

