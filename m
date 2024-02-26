Return-Path: <linux-renesas-soc+bounces-3176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A886752B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 13:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323BB28F45F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A64A7F470;
	Mon, 26 Feb 2024 12:37:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EDA7F7FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951070; cv=none; b=tRRDLVnVQERh8SLm/9shtU3KONsf/qfJ2EeRAuZeGn6qN7tuYbwzSBv/lt6rx5KhU/EVDFHF5fqVpxw/N62w6xcuOHbX2hzEqyELIw9hv7wfYILKVJxOBUprLMzbsmzAwtSLfrihYdfO/qr9rGBa29p1OEx/9zOyP0jIXPkcdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951070; c=relaxed/simple;
	bh=se3NxAUkE5jtt4Zls/aD6FP3m0e7IMJkHd0LOtRliMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5FP3/738Utga7ZVrF5ZVGAwRlDR2Vm3L9sPNN8F71Jpqt6yk8P7I0aYxxoZMXxN9MGXVq71nW0ZG6Nz6NJCAObHHU5StB1Ej8iSMYEgMxmsmmggT+dRL3WmNbgRikT/zp/MMkEAUvxvI3L1Id7WjZpPLMPvFrKQiwogolLmEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2590012276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 04:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708951067; x=1709555867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb+oqShQnZcr3c6uUFRpNjGNmx/DFaUkU5wl/1xPZs8=;
        b=Iuufup6ufc4JInAWZxjXrEgmY47iRwajEFtxoZVfY5t2qI7VzduBXPOpwnX6vdoSfx
         kltwBbrNMUq1p6ZcxRWGpPMJEiif07z8UssgdDIFkBn4DV++HiNL2fOm9VDWWklWFmRR
         QsrN6j9Mzh4X0tz6xBcYb4NWqDx4XRNuiBy2tf7MVT4BHw7USvU6TYkD5BmMgMSEWFuv
         7eUEvM8UypnN2BKW5KYat2QjlRmH/YRoS3w3636KKjt/1Ngptf96nlKwYhcLUKr6T1/w
         Ms4chlfHzbLeg6e99StmQilXvLpXxbArfQPgNBLKD5dOW/hdCx7fl9WtpanTE74yqiAm
         /m4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqd207BTcWZIzRNyupN67fBGxB06HrJ+CPkn46/cooOSASWQKfuSsuZzHaqtB7132GuOxzFWIKit1/6nIm7GAcFygfJsLUsb4B4e9AfaT0r2E=
X-Gm-Message-State: AOJu0Yzxlvfv7uPTbMcvqJIbA0rgIMlIug7R5EkW3T790P1F7Ywqi2Ax
	IwokfkLSVtIcAz64A2lB4b18pWBxKgl4lhDXGpqqbz6Kz6aGmmwzcAGaLnLcCJ8=
X-Google-Smtp-Source: AGHT+IEjY30C2/00ko5taqM5Hu9vIU0GnMTXlUfIt6lXwqjM/WBlqodKF7LGAfkci2xEw3WWsKlhbg==
X-Received: by 2002:a25:6402:0:b0:dc6:9b89:3f75 with SMTP id y2-20020a256402000000b00dc69b893f75mr4202720ybb.40.1708951067058;
        Mon, 26 Feb 2024 04:37:47 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id z6-20020a258686000000b00dcd9e3d3fd0sm872919ybk.19.2024.02.26.04.37.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:37:46 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso2978779276.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 04:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9WOU8DP4qumWYRTAvv69NhfVwRLNCuX1C3t55w/HMMOh6/RJJqpRGwrXNIv4oH2682GtoasCPgqIIRJ0j2Z2f4p6hWU0CMKqxyoHs+CVOQvQ=
X-Received: by 2002:a25:6402:0:b0:dc6:9b89:3f75 with SMTP id
 y2-20020a256402000000b00dc69b893f75mr4202673ybb.40.1708951065731; Mon, 26 Feb
 2024 04:37:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223123646.245655-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240223123646.245655-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:37:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE5q+hky7Z5os0uyC64evFYcuU+2RqTP=wghFf9ux2Cg@mail.gmail.com>
Message-ID: <CAMuHMdUE5q+hky7Z5os0uyC64evFYcuU+2RqTP=wghFf9ux2Cg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas RZ/G2L display unit DRM driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the RZ/G2L display unit DRM driver used in RZ/{G2L,G2LC,V2L} SMARC
> EVK development boards.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.10.

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

