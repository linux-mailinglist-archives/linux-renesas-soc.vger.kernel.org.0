Return-Path: <linux-renesas-soc+bounces-16017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D343DA8A12D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7880E3BB19A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E46729117F;
	Tue, 15 Apr 2025 14:35:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C81B0434;
	Tue, 15 Apr 2025 14:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727718; cv=none; b=YSmdvypC8kHJLpwYBPXxSPA0XfTCC2bKXPQI91WH9dUA3uD7UTWORd1tfWkUgNfQz9S3Axt5Iji5eT0CzgFhNpy4U2KSVVLslDQdf0nCBPi7/XaznYFOlDSbqWDq9AQyYGMlAU/uUxXoIoSZZN+4kzTS/buv51FX4Z8R/+HOT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727718; c=relaxed/simple;
	bh=BmeNpD6gN47Mw0ToLG1Dl95LsB7mfYntHPYpIrUyuSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcUdMMZvEwQCJKq/cE3FTyySS+GityOPWKkphs0F69Wru4//1Bbes8Cu3OkIhsz1b8CQWBJmZhtn4kjsSvZO9S3fMfxteorpLETUI62azqNSTwx7QnuhvfYqJB0Nz1Pw5FtFLpxTFO+L154wWCo3S9DmpWxUkhKCnAuZlIvKxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c597760323so531243285a.3;
        Tue, 15 Apr 2025 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727715; x=1745332515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLCFWC0SYZ2kMqnUFrfemVztn4zcEmkyw5gshI87NcY=;
        b=kjzqREqixIhjbSHsdl9WQoJ6gGO3ocHPzecS2zfdAK3np+n6QoTQcpuSySbX/DAGru
         HAthWZYIUzlLYSe6Nj6Tn39hEKjJh0d2TOIZ6gMKuVljLt2485E+qBdZGB+kxuRDQImO
         jdbt4mcIFiKRJZrJ+DSCuJdWo7DLIQLrduBtzbgNtvpXLbgM6TTJIueoF64ZAWc3vYyL
         TNuRddQ8kMEJ2BH386IKoUO0yEwkRZX2VhZhJ3PVRRvROHB1QGzKUWRV23M66hyQ921L
         G0z8wVAyXciMBiTeFGNk3VIAHfQkALZlRb8Cb8W23CtUK2dbCnD5AWWoXLeA/FP2e5Wp
         w7dg==
X-Forwarded-Encrypted: i=1; AJvYcCWXwBNhRxXb4zk5LnYY0FcFq8Kn9ECmSX7ytFnuVN3oImIfzFqpzbREgskjFklTJ8nE+J+m+shmXd4Ole/sK1iM8rw=@vger.kernel.org, AJvYcCWt23EzBNeYmFWdEMubnsC4us8zIcHycXVsyG4xC0ii8ZapbluPZNjF6RX0CbJmm97bMlWsTDPQErB7@vger.kernel.org, AJvYcCX0rzntcj5ykTbBbZt1Q2+D7GDGtHrNsVla14Do6fFW6ZBkB2X72RjPpTg+QGARZ+9NwokXenvc2HnS@vger.kernel.org, AJvYcCXKBnifVwFdDCnmBx/28mc//Xn2aPxlvFaFkPe1BpWNDYvv0RWQJSpgGSvjIkEseREmpjJazOaD+jQi0H8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Hqxjvs0AXzafYl1UZlyeimz1xzbkkzY1OPw2+elZ5mkJRRjx
	6cnLFDXrV08BNKWApWGOE9sXS+lBYQDDo9VLoitltf9tRsKpfUWhHz1O6gRF
X-Gm-Gg: ASbGncs0yQshl0QVu71HUnuPS2AYoHxubaZXLH7OF31/FZUzcP+JyZAv0chS9i/6QbZ
	XG87WGl0Y9Ktd0+o5RLHnnb6kBDwwwYlD8dpxlLHJBz+bzZXCBVPz6JnOZaf/95y0jSoij6TRqC
	OGMsAUQxvjfkURoFDiYOKMBO0KcCdZsC8F4cZ6X1KVH7XmsZmEuH+8ghb7qOv7cXdhpw+klX889
	Uq7WlXnVp2yVJuwKLFw9cgPysQnu3BK4ZUzXAOEYIoYO8NgwEfpjTx2aNdjwhp6TwzSPk/pVO2v
	PsXXHdo04mO2+FpgGiPAMRV7e3irS3FWzHzkINJOzmzAzliifFWthFttDSQVBG22KLkwr3BvwHr
	IaBmJ5sA=
X-Google-Smtp-Source: AGHT+IFtWA9iDETJoRFSCOw1JiOo7FtelkiyR4pwzLyZyr/R8wgjr8SEVWZbZDH8f0zR7coOZRSpiA==
X-Received: by 2002:a05:620a:178c:b0:7c5:95f0:e776 with SMTP id af79cd13be357-7c7af116654mr2584973085a.1.1744727715028;
        Tue, 15 Apr 2025 07:35:15 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951759sm918056885a.31.2025.04.15.07.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:35:14 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c542ffec37so569442385a.2;
        Tue, 15 Apr 2025 07:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6F8p4YPPvlFObdhHsrnGaTNgWGLS2M0bkHynSmUU1cv+7e3xwrpz8EExOq4mS3yB7hz+b1S5C9niotW6j@vger.kernel.org, AJvYcCVhQ3biKLRje57eNcey5sPJ5JE9emHK5GQ7ZgbMwFK4P2HQ9e7n91+7rMR8b7JqMV2vCopfbjuq0DQT@vger.kernel.org, AJvYcCWkShq8Ci4ZDwNb4zrYccHDgV7HzDfAaXNSpu628Rzx4DctNzCYj82UB23TGFrPTb/CQoQLT7CZ4oAy@vger.kernel.org, AJvYcCWzNtdSYzREfg+J9vmsUE0CH0uiAZ5E8nTyYaq6UM6akIOVc/oyf7jzNEVh9JJqIL2nUvbJ8XIB2LDadAKdnOPAS+c=@vger.kernel.org
X-Received: by 2002:a05:620a:4492:b0:7c5:5d9b:b626 with SMTP id
 af79cd13be357-7c7af1f41camr2861018485a.36.1744727714618; Tue, 15 Apr 2025
 07:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:35:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpqw-bSmg1FZU72wvyH-bGCs4FwZKF6=aWkBVDnUEs_g@mail.gmail.com>
X-Gm-Features: ATxdqUHAP61mByLcdD3tXFG3TQoztyO8bwORqwuOtvT7EqjQHrsyUlKYn38EFk8
Message-ID: <CAMuHMdUpqw-bSmg1FZU72wvyH-bGCs4FwZKF6=aWkBVDnUEs_g@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] clk: renesas: rzv2h-cpg: Use both CLK_ON and
 CLK_MON bits for clock state validation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the clock enable/disable logic to follow the latest hardware
> manual's guidelines, ensuring that both CLK_ON and CLK_MON bits are used to
> confirm the clock state.
>
> According to the manual, enabling a clock requires setting the CPG_CLK_ON
> bit and verifying the clock has started using the CPG_CLK_MON bit.
> Similarly, disabling a clock requires clearing the CPG_CLK_ON bit and
> confirming the clock has stopped via the CPG_CLK_MON bit.
>
> Modify `rzv2h_mod_clock_is_enabled()` to check CLK_MON first and then
> validate CLK_ON for a more accurate clock status evaluation.
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

