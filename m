Return-Path: <linux-renesas-soc+bounces-24423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D8C481B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 17:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D974209BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DF4316917;
	Mon, 10 Nov 2025 16:37:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483C3176E0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792659; cv=none; b=W6G6w/1BlbryQ3CoqGiOFKwElp2o1RMkEvCFhkfZTs9gmBthJnNlFhV9vY/aPH0zWlE0Qx0eUkKZTjmnSwA6JmrbcWu14p86WlSCutdbUWYIiRWjPiyGfa0bf1R8cIksDo2VTFYCwsUmMfOEr0KR80f/ub+XX02vquVp4Y83qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792659; c=relaxed/simple;
	bh=ytHIDgU/qJ2cOfjrTacAh9vt9YGb5WOKdUkBnY4rcBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjkyXTsudaDnAWhs/DGUUrMwdy6fyXqZb0Ctz5GwjfMhQ6WAAOohfcOSKV0LC2NrgF4kf1xizrXuznN7J8Dm9WoiRVYL3beSXA+jeaxt2thplS2ObToFAZccpIfmFw4m02jtLNILZs6e5/+mm6gXFRTzUXDlZGEx5APsWOXHhfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5d61f261ebfso1258457137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792655; x=1763397455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNNWB8RzQw4ag+R4GGbGdNDxdfn6zllvkiSdySRdu9E=;
        b=h87NPXpW/BpOGktKjvaz3IYUXVJSy3tXif4UfY4BGthv4CHH0K8nOaqQ+Ov1Zv0Lp3
         aHHCiE7actE23SFyWfsuHg3sfXw326BT155AAXfZdovYFvfIjoJHBxnVIUmERVwQvO+G
         QR9UqNUPgEpT0ufRH21v3+ff46tHs1zNLmz1EdLYkQYChMRQpcOLede7xbpW7aNFfCRS
         tNJkTznx2bkjCZEMitINF24bTBZY0QvSLZP8o+lq/9O7hnCKgFP4Ef7HHPh7AIDbGpD8
         MBEfNbsfEKZQkhilb2HVjq/gEY3CP4dx1FTsgO46t7/OOEyRI7Yh6/9lvnBmxfuPLgeQ
         8HkA==
X-Forwarded-Encrypted: i=1; AJvYcCXpznftaiGJ0pOkha1JOEdJC3B7DWQ2aBN0em2wlaDo13oITJbRAyQWyyRZ4KEHEcYYpN1FHf7ZQp7HXrtlLN0HmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dRxcw04uIazNUeoe0Q+D7OoiwcYTO+yuo6B723vULkGYzw8Q
	0spTn/jFwCXrU5r36AD+NvaIsjVPppCJbDXARTLOev2SZ/xAwv4CLMckG3B41TqX
X-Gm-Gg: ASbGncvGPcur1gTg9sMYHxHv70+PAoVmxpqleUb8D6AFnno/HqnCTUMzad0wc3i4r+y
	D57lmaR2g3e+28QHafX4SJcDtVbbuIA4kCzkRucb1ZISqQKFRxdREeIR7Fp0lLUk+2gf58se8GQ
	hgP0PBqrXu38slCqgJyR77Tr+mBJZ9peO2hri1qqz/BOWmxN4Y30Tq82V3dc7+JHKZOYWj0l2wk
	Hg9tGGjKt/OTL9DVUKlbPpwIjYggdL4bM+Up/ST6eXgr/UoBcPPzkUXv6U+U3S/XEJePOO850O4
	SwRuRa9hlMPValC7p/iozqPvApigBKDL982+4d6yromwXyQW+ZLWnnZIXmVwLKIQW8w6CarA3T4
	C4NdGhbKF6I7YJGpy2jZ2xUKRMoFZxIeuwVi1U1dCvHIy1+rGWb8Mhjk5tXsN6GccIY1NjIkfM2
	h4CcmLSCpfIrSYYQrBhYY9/8DV1CLLxglPiSbycBFXozMxulG/1QVJAGRezGg=
X-Google-Smtp-Source: AGHT+IENZPUC/g0xA/j4dvhm+pURNhWt5cWcZ4kWunVN3GsKiTXlCWRt1vnahHNChjwfjxWgAJ0mPQ==
X-Received: by 2002:a05:6102:dce:b0:5db:e338:ba18 with SMTP id ada2fe7eead31-5ddc4839d63mr2786049137.37.1762792655487;
        Mon, 10 Nov 2025 08:37:35 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958286c8sm7499069e0c.17.2025.11.10.08.37.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 08:37:34 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d61f261ebfso1258450137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNauI2fpgQNdXFeHRGkIml2IN1P4qpf4x16gh71ujoqhxUpbjCthPSsPRjdm1o1tVz9HfIZCbttBssr5zjmaCvHA==@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:5dd:89af:459b with SMTP id
 ada2fe7eead31-5ddc467f048mr2635129137.7.1762792654419; Mon, 10 Nov 2025
 08:37:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030061603.1954-1-vulab@iscas.ac.cn>
In-Reply-To: <20251030061603.1954-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 17:37:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrngq2P+uPq79Rgi=Ba8hYBftG8ztSGXxyTvppqwYc1Q@mail.gmail.com>
X-Gm-Features: AWmQ_bn0aO0m42o8pyfa9vnXYaa3ntXxxVMU8sBWoUFD7yP4GCSqBzv-mQ8MKV0
Message-ID: <CAMuHMdVrngq2P+uPq79Rgi=Ba8hYBftG8ztSGXxyTvppqwYc1Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Fix memory leak in error path
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Oct 2025 at 07:16, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> The current code uses of_iomap() to map registers but never calls
> iounmap() on any error path after the mapping. This causes a memory
> leak when probe fails after successful ioremap, for example when
> of_clk_add_provider() or r9a06g032_add_clk_domain() fails.
>
> Replace of_iomap() with devm_of_iomap() to automatically unmap the
> region on probe failure. Update the error check accordingly to use
> IS_ERR() and PTR_ERR() since devm_of_iomap() returns ERR_PTR on error.
>
> Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

