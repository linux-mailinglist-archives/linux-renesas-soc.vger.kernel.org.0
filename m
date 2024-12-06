Return-Path: <linux-renesas-soc+bounces-11017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCE9E6F14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 14:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B14418840A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 13:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CF4205AA3;
	Fri,  6 Dec 2024 13:10:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1D46426;
	Fri,  6 Dec 2024 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490639; cv=none; b=hre5i+fQaX3m9OqTQ1n9tkd0zilDICHB0tNLOiunRx40s6QxaAqya8yse7mpQxN0vYOaWh5AbF9jRC+4VSF16Sk2vOxyodUqjbrrdGEpfRYxgsjeJcuhmn/gdgFVmvNaC84M5Su7FYe6IuGTUWYGfKHTfbyROdIEnyQL7dUQHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490639; c=relaxed/simple;
	bh=SH/3j3ECeyymb8PH5w6WyujIUzyrcGJY5HcoMo+irDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN9MfDXAMvGGVDceoTJeP2XyYXJrlvfBVKH3C+3KWeJSdR11Dm0KdwNJcZfS7hD0CxdkJ6OMk7UZPrJ9bOk5b1MYj8hLppuqTnRsyV/Z8GDwqj5CDMefjiS4XB5hjINXn9jnCIra5nSHb3/x//TcuPlrOYPh1XH4mLvniq/QfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b678da9310so169289585a.2;
        Fri, 06 Dec 2024 05:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733490636; x=1734095436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlZO4imh3EMKTA4D3V2rJMtFJFhXruDb91eAxWihna8=;
        b=bF2Sk4WSogn3qTXC5mGPfO327z80rSzMb5sMgiD8ei05PApaKEJr8zaqq7p3Kk8iRH
         xMrLPbz3xj/W7VPx4UDLLaGE11DSmnrphMwJmHMhuh4LR9tKk/9D0F2AotDHXY+Kh+Gx
         WYcpeXyyC5L7ozPJt0Fl/7LVrVllUlglqF3HUaRbawmnX2I3UUOEnLqs/H7OQjPNdZGR
         S+rMznK3w4pz4cyiGjVUsDODKq/6qNdVbt4warQNWlEba//vFOm1PNTumXJqu1uQquY+
         dwiStTdKxDfCMIYWb3m5ChsRixqv45dHoS3egwHoFxpzdhc/S3VUcbppsJw9lCKay3ln
         ZvFA==
X-Forwarded-Encrypted: i=1; AJvYcCUxxAxy6+gSxG4fQprkSp1dtZEuuOP+H6GvePZaSYU1aFaclvSLiM1Y89GmKt06x1jhVqBFCagdW0TzAIh6RGDBHQE=@vger.kernel.org, AJvYcCV5t1719b/klJKeAnmMV2IBB113ZM3SmPtZgmKAeO4eC2Lj9Tfoc7beFbRezYmOsPnrrGAFe3zXhZs=@vger.kernel.org, AJvYcCWzlItkS6sLhNq+s4z6nywlOyxaokRuPT8GkbBJdukKCXu9KUWsZOAnZ8nCPC/5j9q4XcdTk+fpUzhPFODt@vger.kernel.org
X-Gm-Message-State: AOJu0YwkzxoNS+fZvu4BcHfzSHjafLhEd+PEkcTDNMqOJrvVSEYVVhZO
	s6hXGxEd4OXbMzWSIwXZBdwey5PF5gdyCWVg/B0vYmPjL9DB2ZI0g8vapPlT
X-Gm-Gg: ASbGncvrWoNbUne7ECXUM1pdlmYXQyx1BPja5tBoIPFbx2SqO/wit6BJsrFWn3ZI8xU
	qPuuM98inHscOoVAKwwh3OR3d1BPgVbbCdG/AJWOPP9+pD8AKAUE2sABCW1PnIKwgUkqKrN98Nn
	ADTnRQaGaHMM+Hxc4pmofkPeNzhph1oVApDS8ey0Ec65kYcefWBZsfpWfKoPy9Slf1szSMVkPnb
	fDG3YeFbKkxO7HToWL82YCObnqqDTVYtrqq5RyI/r8JpawoYvYQyKZDYwOppUL5NzACoYO2+9iG
	6kwCwkkPTxxVde3Q
X-Google-Smtp-Source: AGHT+IH++JFF4X4EYNnVtINeoZVUsCjbU5XPPts5RbzU+FN0HbrGI2gMATQri7UmEjH2oU9tnwsU9A==
X-Received: by 2002:a05:620a:f14:b0:7b1:113f:2e55 with SMTP id af79cd13be357-7b6bcb973c3mr492844185a.58.1733490635886;
        Fri, 06 Dec 2024 05:10:35 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a481a4sm171699885a.1.2024.12.06.05.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:10:35 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b670de79e6so133135785a.3;
        Fri, 06 Dec 2024 05:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8kjFJic+N0CCobroq7YeNJ2MEo/nxbxqDt6WkltpZBRJFwCvL+3g30qDjTftXpZm2uYy9aGUb2i3e+bMpKCYdwkI=@vger.kernel.org, AJvYcCUKykYBzxuF+66tUb+ys+ibymcGAs0FwJEu8Ae8UFMqYi977JDG003rzpJ6wy2wmkNM22Q+TWXzWyRWFr0H@vger.kernel.org, AJvYcCWjMQ7gNv4rN4dozV8LUZTTJPAwGvXpNYKDSd2qpItsdeNrIgBXPXRyAfhl3ID11oDFdpOVa9pqPHo=@vger.kernel.org
X-Received: by 2002:a05:620a:294f:b0:7b6:78e9:1ea2 with SMTP id
 af79cd13be357-7b6bcac8926mr507291085a.4.1733490635494; Fri, 06 Dec 2024
 05:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241202203916.48668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241202203916.48668-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:10:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWc4DLN0Frr+S-Ri2oJNYtViJgpxBWuwhFdKKJzHp1NiQ@mail.gmail.com>
Message-ID: <CAMuHMdWc4DLN0Frr+S-Ri2oJNYtViJgpxBWuwhFdKKJzHp1NiQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057: Add support for PLLVDO,
 CRU clocks, and resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 9:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the PLLVDO clock and its related CRU clocks and reset
> entries in the r9a09g057 CPG driver. Introduce `CLK_PLLVDO` and associate=
d
> clocks like `CLK_PLLVDO_CRU0`, `CLK_PLLVDO_CRU1`, `CLK_PLLVDO_CRU2`, and
> `CLK_PLLVDO_CRU3`, along with their corresponding dividers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v6.14.

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

