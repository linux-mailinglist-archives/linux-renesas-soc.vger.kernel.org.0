Return-Path: <linux-renesas-soc+bounces-12034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D97A08E43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 11:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EA6B188AEA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A0A20B208;
	Fri, 10 Jan 2025 10:42:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73CC209F4F;
	Fri, 10 Jan 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505774; cv=none; b=dfQkIU4laBNymVMQyisE1MlQ0lCLVm/1BeE19RfWlnWGdVhpObxHLT39SMBk844OPdXtV/jKfSd+elmWtl4QK36L4cwVnvKDen/K/go/pXihnV7hb6TBCxlUNgIP6lHnBufu4IToKQjwDZwi22fw88NUjAb9UmrTccsQdBuFn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505774; c=relaxed/simple;
	bh=5caCxI1y8shPPAFLzl8DZjtaNVMLlVfserm+Tv6eppU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ez7tQUCANMeYUozURTJxLX6hJGA8Z5ey/bC9GpGbpdGsabOsZQfowxHNnjohEHqGNXSqbtcBo4GUUu4D9uF4qPf14h21L4gyMZ5Nf3ps2Gp/PesB50bT5TNV3NAIt07phderF9Hmfs+wMQK4s+smlfgC24i83ySqxd0ljHUe2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-860f0e91121so1583531241.0;
        Fri, 10 Jan 2025 02:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736505771; x=1737110571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzJjFY0iwHvYA8tJMmhS3Tcat34uzCIHXyqerNBSW1w=;
        b=Oql1omIacaCk08t6hnla1uYBT7Db2dx7SwkNoHzLrfQpr+rsH1qwof9HYWbomC0XKG
         YV8I7v7LGxXxAD+7j0nOcE6waU7YymN/nQIiYr8qEyIo7ImDZqQvN7P3vlKNaq83fM2k
         uX6TWSa3nTMAcDlQuKQQibwKABm/CxfPY2ldjfdDNXU/kxSSuywsfQpvhiGO4Iz3KwYz
         kZ6TANfuMonv0cFisz1mwk8tzbyqfqt34m0WFoQJ29Sal3pP2chamWqsBXJjqO/NpO0l
         EDRgC71CCLj0ZQnQU6cY3f7liDFMoki+95R4cZbUNB4QdH5E1jg3b414w8CHFSBt5LRw
         AvtA==
X-Forwarded-Encrypted: i=1; AJvYcCVh+QeB2zPxIx5zyJuocjiqZ5ZqWxXCrhgJTsSnGpLypXjhCvbLea88uAEZo8hShYpjyjUXz1/7CHA=@vger.kernel.org, AJvYcCX+rgmJjfCShckBzZrRHgi7UWkpMbk3jprlidAMvT9DuYYDnIxGG+rs/NsiAaI21mIqAlCq7GPH1mPHI4hmGJ7Cbk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLg5VN0ljL62wmOTo3kO707ou+Qma2kfrB5W/oYVk2RAVQ4kg
	H2q2oDeBv9iBfVnARa77EpIgw071IIadRBzKXRZoKjyCsPu2gh7aBKIzWsyD
X-Gm-Gg: ASbGncu0V9ocfooZpTpJG1NBo7vPX68aNAGj8yv5FxBnmu3AFFsmrI9Ntjz0xM1zUj8
	CN+wD1lQWxYbgNkSS5ShgDZRmU6Moo21OHTIlYTfLi2D2kB/7YcZmrh1yvlLVKV1+PN7X4nSSuU
	zIsTxPJqCQ6KCXxzBdtnkwuRCwehLkS+m1E0pnsSmEkoAx0tEwCXEvzFAyUaEs4MrCyIATGlvy0
	oKSXl8qT96E7/cyQASCMjeaQlq9Mik5JtDsiRXe1WEh9eClqcz3SXsMSAJOY/0OgzSGVs0ndffo
	EPjJ2FlBNL9t7iWxDU9BCZo=
X-Google-Smtp-Source: AGHT+IEayXwlCnSuX2qzykfevCpmlhJzkBSWpJOoGupVXGDpyTEIhBT2Yr+XmUNsteB2kK5ZE09TWw==
X-Received: by 2002:a05:6102:c93:b0:4b2:9e5d:baf with SMTP id ada2fe7eead31-4b60935bd71mr4346912137.11.1736505771037;
        Fri, 10 Jan 2025 02:42:51 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b6091da75bsm2194500137.30.2025.01.10.02.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:42:50 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518a861612eso1389831e0c.1;
        Fri, 10 Jan 2025 02:42:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQ29gkqZrl0yv+wVUbSOMoLKDWhc4BWq1j4sV+z6OhQB2SUTUoI644GbEJI4WXWjp4x/ezjhJZuVA=@vger.kernel.org, AJvYcCVwKqyPZ1tYEBOcW2q74cSyn2stgoYavLtBL1TGNT0iauy2XfR0GyP9W09HDxMsHIMYxUM5b54zHDzLC5PEtSPchwM=@vger.kernel.org
X-Received: by 2002:a05:6122:41d:b0:515:25f5:46f6 with SMTP id
 71dfb90a1353d-51c7c818af3mr4352534e0c.4.1736505770575; Fri, 10 Jan 2025
 02:42:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109125036.2399199-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250109125036.2399199-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 11:42:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVetR7H9s37U2Lsy4p1-rF9rcgjJcMngDQirMB6-PYhAg@mail.gmail.com>
X-Gm-Features: AbW1kvaSWTV36bNtJHhnq1PDXnZ5zt804cJX59Uhqrc7gE5oi37dwoVKa1alpIc
Message-ID: <CAMuHMdVetR7H9s37U2Lsy4p1-rF9rcgjJcMngDQirMB6-PYhAg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779a0: Add FCPVX clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 1:50=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the FCPVX modules clock for Renesas R-Car V3U.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

