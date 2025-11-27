Return-Path: <linux-renesas-soc+bounces-25289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF5C8F7D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 28AFE3547CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E834C2D3A60;
	Thu, 27 Nov 2025 16:23:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF42D249A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260580; cv=none; b=fUQxEayLntDgfLFmSYpC3ZCu6ebAuq0I4BY7BFgoHp5gyHjIf3k0B7ko9HXKvq43wcQ4kT0iTTth3Tza5xx4BPscEarKo6kSxt+BNzAgox1Fcbf+w30mbI+Ukr4+83j5Pw3cQgyagYwTC4hAfaGSLvN1V8HScWYy8qhwXOM0iXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260580; c=relaxed/simple;
	bh=agy4wfe5yMOlZ80RTHEPimJTmIwgD5IqH2V4pPzePc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4AdP+/yBrrtwa+fBiaCzgsIXkxFsrQgCMFIjIKSXc4TDXpOCItmvgc5+L9TKbPFjAnAKJdz2QGDdENABptQ2iNkTQey5/ameflbyrrA8I1hkECZl1Rgdjd97pxghh748Klj81WCSgAIcKD/9w/VwtYVJyr/TeyuY4ObYSS1hys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5e243d73cebso654300137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260577; x=1764865377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwd6PiHGiN7G8dmfLRTmVhxm7LG7hgnCi1AaWs5XSQg=;
        b=r0OUh9PHHZZ0t9Fv5Z64aGN4u3AAcdM/D//ktsftKTwV2RMOz0R9HdgB5toX16EHn0
         vdh5h+vJZdnYi2oMXnBIwuA6UJaApDqd/+KnAVMaHvgeGxKGl8VTd2sjg2R+f2Lx220V
         E7me36CirSPZQb9Y/ccTTP9kiOTSWSTrrIu/ZMWDSWKaRNy5f03CJ1MWdHKCUk5EqX1U
         M8t5o0b8FSNEsNgNRkKZ08LYrei6/Q+S4clQLo/Y7EYYuyHpzxM5Yev93Rh3GzD8k10x
         sbQsORw98+wXcGAZ4DVDvIQkomQacFzKVaLTXRSYqDi1q7OMVo45F5gztZZAqKShDk7i
         rYQw==
X-Forwarded-Encrypted: i=1; AJvYcCX3cX7+37dh2U5YrNyQjBX5fA13b4Z70KiWR1XwgtA5DcvoUL8vPpllG3ZVKuYUMSrTeYUZS52keRRMbHL7mOGcgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJtJBnNZCGFyOh6HYDHj9D5o8qVHWWYJgjV+1JZXZ2l8R1w91v
	qkFrcsXJEjyoECemXVImT0ovwtu0tmwE5NeLrSfLa5vtcrMk8ioplnZx2oeWAAy3
X-Gm-Gg: ASbGncsfBFBNroPMGbE4cQS3vFLZC34Nqk2UzO+IoN8A6RQ5fpnz5FQmOuMTytSpvVb
	M7hMZB60M2gkxhTKZBIWmS2EiFstp2v5M6jVomokTPL+Qzcf69pCx1K7e++hONVFtUWi1EcOQ5h
	zZjWSPXAJKCZwopESoaUz5X09cCXp2m6JF/Qn3bw3ktkxa69h7PF5jQCTdma0RDA3JwXO3wsq33
	fEfuF53BhZsVISlCQSmp97RUiQgiTAy6q06YnAZDhtWyOLaEB6+mQT1ufW6XiF3IOsdKUrBVHiC
	sjM1664iTtLg32bYUo0yrbbOkLr+mkZcxBIZJc4W3sHl4aOO1vOvO5DlgHphPhpC5SkIz6tyEMS
	8vKmgvZLQzO7jtHkutCnGwwHByaM8V1g0PyB++4H/ElrFqYP9Z5l174VXVgi/UNtn+C45us+Coc
	yazsFoEQJJKs9+swP5CltqwYn7WzB2IpjNrr1Cck10GrSnxI1GQNYB3nIyzoc=
X-Google-Smtp-Source: AGHT+IHl0eW5nHHjD5X3kDsx2k1kipEhRiimQHvgFBPG3aQs94FHVGPvpl6dPZJlgxx6Wvvy/gg5/A==
X-Received: by 2002:a05:6102:2b9a:b0:5df:b4a8:fbac with SMTP id ada2fe7eead31-5e224394a04mr5034337137.20.1764260577377;
        Thu, 27 Nov 2025 08:22:57 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d934eb9sm635216137.4.2025.11.27.08.22.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:22:56 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93754419e10so592477241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:22:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSVhHyI1BhJk5+81/9CXGBpwLC+8T1fW0487a1xtWb0BTz3+4dGeSuyJDbys8P8PVOLPJymeN9+ouiBA8Vw6SURw==@vger.kernel.org
X-Received: by 2002:a05:6102:149e:b0:5db:e851:9395 with SMTP id
 ada2fe7eead31-5e22420add9mr4138332137.7.1764260575667; Thu, 27 Nov 2025
 08:22:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251125221420.288809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251125221420.288809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 17:22:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzGxc_dsah5hi2jmRSr9TJKq9X_rVjiT+Z1gUqurpRtw@mail.gmail.com>
X-Gm-Features: AWmQ_blFxOhLY-anmrJXWsRICbdAjkUcuKXJXEm_S0V29_UGHptWp5vm4FvLiuI
Message-ID: <CAMuHMdUzGxc_dsah5hi2jmRSr9TJKq9X_rVjiT+Z1gUqurpRtw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a09g056: Add entries for ICU
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 23:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the ICU IP block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

