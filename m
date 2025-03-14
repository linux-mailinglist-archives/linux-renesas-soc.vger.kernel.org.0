Return-Path: <linux-renesas-soc+bounces-14373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1160A61222
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258138812AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34171FF1C9;
	Fri, 14 Mar 2025 13:11:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A002B9A6;
	Fri, 14 Mar 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741957904; cv=none; b=p9xNLPB/NxUGRLgHtMmdXpyYQyzQG4IG4fOSJLf2eGjcJNSpVjvFcwaRR7gs3LXVaaAtoSJzRfJ618pi3XUbmDHsF3oyPMiCh524Nol2tVYggoMnPLemrr8ATH12GX1Vx14eOg1arha+rJ1Y+D7MXlttI7UkbWeh4aj7yqgkL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741957904; c=relaxed/simple;
	bh=NSYTNJ5LL57V21x+L1DLxd5qspeGvQVZf38LlJfFLCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ/IMOBCPAq+VDx9Ptn1aFAXdt5hG4Vlc9vJ/ug1pmoL9yKkCa8QwNAutj6SI+fC7j/rJx6CqgjM8qHsBWGUt3lzPkqoPw5DGeu1OZ08471sm43E6ij1UUQ2fFXTFUDO5+4UomZproLSGAaX1nXzsIp65WLtu7MPklZmGGPVpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769bbc21b0so20718651cf.2;
        Fri, 14 Mar 2025 06:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741957900; x=1742562700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLH57wE5+szvegzTPkshZrPoehwl/7DXCYMMg2YeFZ4=;
        b=dOtHvCUKFg3nfMS5l08J3Z090vqoR4EUyeVLAPsKQS5Wn9X+fpbqJtSbEAx948VE4m
         Xvyku0GpWD0bejE6cNk4sqPE7u32qddOowEnZ4bjJfvJO1vPBrS1XT8sggG0gj/nNZou
         9WjfGjVz/jD7SL85X4PleZm9Kp3xReJcv1G+9+1ieCIx0LTwtec64wtheey9nUqssoIu
         QWyfsBd4ZGrFXAHSKoO1MGPjhtLJPzntCMhziqhTyloit5meVQeqhxeNpGBQ2TT3WBIs
         HbPbocVhqaQ+L74aPL94Yx63MorDUPC9S1yH4OizCtQ72K1ZRqbnjrUc6tPYRQjgOFyc
         lwwg==
X-Forwarded-Encrypted: i=1; AJvYcCVneSfEsCln/7h/+UHS0RlKlXKJjGhplk6AikrJrKqcINqWKj0R9fqk7/+yZVfcqqf3/h1JuhUzYvTsLBsbIJ4BL1g=@vger.kernel.org, AJvYcCXNYTafAD7M4pba00dio/sIGtlltUq+9+S9N/trBYb1VtkfMP2ppR9lZOnu/6hKHUMvtWH0Y9BNipA=@vger.kernel.org, AJvYcCXvn67zwBs1IpoLub+F9UfNlO77adCxBmt6jmb7IFguKzzkKkQ04UWHG8q/ZEpOWpziSwLCn42ExiHCo7s2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/fFJrtznNp9d0sXKJ3wVZqxccCF1wC+BeCJKGGBdqXP3tBRMV
	i8VwVtHPyT9cbO5jkRH5m3k2GuwCAVnUhy7fZaPgHG6NGUvJXIO1zK8ITX3+Ls0=
X-Gm-Gg: ASbGncsxo68o1k5Nvj2RtoAs/kaZAJBWjPKi8W+qQJe2zXTah+6NOuFNpDdY72GB4tU
	/WKcEA7Ci8nYEG2on7z7tjqaiUGcpsg3OvBJ0LjrvzeyhvoexGgHLZC/NEYzcx/Jbu0Whl0n68z
	2lO+myHFxdcTy4rn1pLBh9uwf53mx2Bm3XZkm91FeFHVUol9f+VqacnDI0NB1QvIbJZ9do7U4M3
	PAXiw+mluBGmjrW/Vp6kd0JWdV+h31pAO3QbgMv+K81RsWDw6fB6kTBTvb1RqAaI2uey9hHYBAc
	rgvDl6o+TjxpGas+/N03fWz88HoP17mz8P22d+k46UBiCFh2ctls/Q/hUkFxdlF0X1+hcYyjxmZ
	shjbLnnRGH04=
X-Google-Smtp-Source: AGHT+IFr/ZoYE/bM8f4TNb1gmkqlpzAa/gcDKU5aKiyKS9fIt/4MNi2S2uh4wPgcf/eVheZA7VMJrA==
X-Received: by 2002:ac8:5a43:0:b0:476:a6bc:a93a with SMTP id d75a77b69052e-476c800e062mr34086201cf.0.1741957900424;
        Fri, 14 Mar 2025 06:11:40 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-476bb63ab9fsm22856931cf.26.2025.03.14.06.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 06:11:40 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7be49f6b331so194898985a.1;
        Fri, 14 Mar 2025 06:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2MPVg6Ss0nCG/MBRxZGs9iTTif1g9QTSm9/ikL+yNUkA79jRnhNNQ7Ag51NNoyFfC9YGJ0qoflBQ=@vger.kernel.org, AJvYcCWlINeF4v23QB84oItCmlGrV/T/UUtLl+z3aqK8BiWT44ZlwoZ3iC2LqSEBBYixzuJKvbK5ah4sPQYImLr/5/UKh+U=@vger.kernel.org, AJvYcCXb1xaGSrh6x6r/jYegGMxvcZca9D1lP2wN7PHmoPRSB3tLofCMyAjT+tpt9nCvDrQMeKl10gPnYII7j/jB@vger.kernel.org
X-Received: by 2002:a05:620a:191a:b0:7c5:4eee:53f8 with SMTP id
 af79cd13be357-7c57c8abb12mr277499785a.41.1741957899329; Fri, 14 Mar 2025
 06:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250309211402.80886-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309211402.80886-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 14:11:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6DPJ3NzyEU67w0yWOdyBe8F2LPA1LWveaFV6XQ26zNA@mail.gmail.com>
X-Gm-Features: AQ5f1JrcZ7OEH-XsS3Zz1LNRLwLurlTFkJ_x1OU9Uk9XKOFyuHsQsCWJ0afZEiA
Message-ID: <CAMuHMdV6DPJ3NzyEU67w0yWOdyBe8F2LPA1LWveaFV6XQ26zNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: renesas: rzv2h: Rename PLL field macros for consistency
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Mar 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename PLL field extraction macros to include the associated register name
> (`CPG_PLL_CLK1` or `CPG_PLL_CLK2`) to maintain consistency with other PLL
> register macros. Update all corresponding macro references accordingly.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

