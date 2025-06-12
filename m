Return-Path: <linux-renesas-soc+bounces-18197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8BFAD7432
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDF647B2845
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908F125486E;
	Thu, 12 Jun 2025 14:38:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3324DD07;
	Thu, 12 Jun 2025 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739095; cv=none; b=Wp3IJktzlyX43FU9YNRkfPKgR54pdpeF6GoLDvxogNPBhjIZohF6+C292Qn7ypQ55DDQ6zcP+JAnFoPQ/khLEpEeK+xaQ7+2Jjfe0ZlsK7X7Db312NOw4KFixkz0g1wgYhjBETsXw+xfzkoy8ECnHvd1lykBz7CEf+f7upVM69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739095; c=relaxed/simple;
	bh=FSNolgCo2R9x2c7OnQAlyMZXM9PpTf5JpDSQjiA8YD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyerP+lcjdrJtw6ft/OccVY96k3tLZNDPyuD7ZYiV4mUkEu8jznTiJ6gU3iw9At3UcXHdwSLKhsmKtF2BCLbknM6Frjri9HJ3uxG0BWm7BRlioShwcDRlNadMSiEZRkDkCecT+8wV2gI/GhrbBAfZoCsjjUz5wvAkspFB1yzdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7b52428bdso286316137.1;
        Thu, 12 Jun 2025 07:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739092; x=1750343892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASkjY/ivreF81t3g44riYsoYENAHV17aX4Xm62bfr/I=;
        b=gRU7bDMz5KunVQkR/Clkjn0tVOG0bb1YYCrzE68ICAFYS7hbMCmSdR+2Ybvcog5r3q
         gQkwc9IdRgqt7ZMhmOLTF3v+OInjT+MyMV4lCnaktXXttSGXKobdKglFLz7+Vr9iUdkP
         UjSohfzPs+tGpKw4Is2CdL4tGDTm3TBeib7PpATig4NCsX6eNR4VBAFyr1/k6gHHzRni
         qIdlEO+WkkZap9ltu/E11xIRncDhSVjjgMMJG02ZmChsFuxwAxJwilfqhYQOTz2wJjl/
         6Q2ARUOkYE1gt+rnBtANrxY4Nv1zrwMfiW4LYr9HiK5K8Ldhv4uvJueslqg/i0YALeXm
         DnJg==
X-Forwarded-Encrypted: i=1; AJvYcCUa4m+WMCBHfJbt7Z23EMUrzmJYlbF8wFfhlHT/EsNSOcJSO1jsrFJ9uLlKiKo7LBVYWWl54ZsVziSeJHqV@vger.kernel.org, AJvYcCWT0JRPloyJDxMYOBXigxOmN3pm0CNmRti2HtO2bVnEWQ/MVWmTblgcsoU93tyIcOobkP1KX3brt3Mw@vger.kernel.org, AJvYcCWuKTL+WxzBFTfudDtObbRvchzMRUtxil2z8U8HOGCdVpngLt9tgDbPvR80IbIqFWL0kwGyXi+vvXKJJEN6XPXZRdc=@vger.kernel.org, AJvYcCX/9gFiZbhbkPUbGNdiZDsYttTv1X+/4ZH9Q8AO2px7mFqHQo2ZRARoqG4fAmFTZGctfdlW3CbpuT1r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ue7h2xO+yKY/rzY7ZzWyft0Mns17xa3sjrYO4NRhXmkflF7N
	Od0FyyS5F4jmAzdjcJUPMRM+y78c1/W4x25CrpdyY8fmwWaLC8uRLq99Zj28jrRD
X-Gm-Gg: ASbGncvRVTqYJYCvMkoJ3B/CrgPuwCpyDIcdNITHTzklgWCvYWpEnkZctz1bBbTK/LA
	RmsmSXnFCmXfWtz+wf4QdTXH2LXg40fCeaCGiobK0jFPKrKVKeRGJlyRJ9/ZHLk6I73Y+Zhcktf
	K2N98qqPr6s0FVjCbizVHK02faHelhwWtUuqW424JOuPc4vhDmLChIP+OhWrVLe53wu6im1lBEa
	LqnGJJUFs7sPbX9VLk0F1PV9nrUq2xStrfyhbGMdRcCIwGgQVOZ26uPcjHimRCPhJYOj+LSODNn
	5Ud64jO8R4ewJmGOd77Iv966Ng3TRHD6GZzpO87EYuGpk9f0UJHYymJK/o6njBHIGXwh0JUmuDq
	W2m0SuUSwPgXJkkTO3HF37zXX
X-Google-Smtp-Source: AGHT+IHhr04g5n5QZTaFxp2wokPXeuNikqb+uVqnhnpUu68x6V1WvXIbYxfIUF4ClgM3SmINAXcg5w==
X-Received: by 2002:a05:6102:3ec1:b0:4e5:9426:f9e6 with SMTP id ada2fe7eead31-4e7bb00fde8mr7097189137.23.1749739091938;
        Thu, 12 Jun 2025 07:38:11 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f013a28dfsm308766241.29.2025.06.12.07.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:38:11 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e7c7b6e5b6so285691137.0;
        Thu, 12 Jun 2025 07:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkoVm+bgiJ/mgHql7kPF6AVipTQkxy4DDSv0EABHM5KNTFNfTSUl9bJSNPUbDHI+0Wf9YxGPOKQszTU63ybcqv3pw=@vger.kernel.org, AJvYcCVZS2NcAacBIgYImiTOCuKmBVQ6G07HNXCf/iudMS90cpoYCZ9SokR5Fl9cBjScicK4odHIA8T8xSaL@vger.kernel.org, AJvYcCWqulXehcmdtshWDHrsm8lwWMMSNc/HaAeRNyPeSJplVRa5ChxZnCelk09T4J9eWU5y0GhOrX1VQ6KXB0Dy@vger.kernel.org, AJvYcCWwZCAC2AcMgbzvy9USPYiHSzlRrFlgc8rqPdYKK1VMlKXFFOtxbBb6qaWQFKfqRlV6K/klOahetmYF@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:4e2:a235:2483 with SMTP id
 ada2fe7eead31-4e7bafd8a74mr7710793137.19.1749739091288; Thu, 12 Jun 2025
 07:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:37:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMiTx3w2kt-jK06HWGhqD0vAnKKTyk7jGkhOhaXyf3Bw@mail.gmail.com>
X-Gm-Features: AX0GCFuXPEy5n__IAMIjncI2-4nRqyp0tPdRMuH0vbaujk8byf_dgqhxO33ikdk
Message-ID: <CAMuHMdXMiTx3w2kt-jK06HWGhqD0vAnKKTyk7jGkhOhaXyf3Bw@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: renesas: Add MSSR support to RZ/N2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

s@MSSR support to@CPG/MSSR support for@

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock driver support for the Renesas RZ/N2H (R9A09G087) SoC by reusing
> the existing RZ/T2H (R9A09G077) CPG/MSSR implementation, as both SoCs
> share the same clock and reset architecture.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

