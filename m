Return-Path: <linux-renesas-soc+bounces-11385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381109F3310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 15:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7712616B9B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D132F202C5C;
	Mon, 16 Dec 2024 14:19:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC0200BB4;
	Mon, 16 Dec 2024 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358757; cv=none; b=KzdddXbLNA7yBbulAxPijG92MDWsVOnlu80jbS08DjGt15T30gCjo58FT0netLfUFmr9BikZvi0UjHkAnVeMw53UsP9G1KJNOU4BnDwiKLXHQkEoDqrZQ00pihf0M2WPvT2A2pjHHxoz+4jN2Lai1/1VwHn4TWwuVLAi5VszCYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358757; c=relaxed/simple;
	bh=hbJjJ10Qx6rPPaunl4U2yfn5+uPVjKpyIX3hEhe2B+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui6r3fdmAFJmdJH8qIoFGSTzWes9YTY8OZ2XD8vCdhLmcqHiC5TAaUJI8xT40qCbhfT90R6FOVWh+/m2OGyLYizR4IBCIaz7MFotPA4/EITp6YyORV4JiRccdBw6VoGZJrYkIEIJGTpklTiJ6uHX0yDzYBGxUPmuhi4enHPbjUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46741855f9bso35430861cf.2;
        Mon, 16 Dec 2024 06:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358755; x=1734963555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wESSXoUhaijYrcKx9ELMIxF1dfcwV0KBed1CdWyPwXM=;
        b=eE4vbEFH5Tw+rBzGzc/hl4frq2W8u+SZ4pdmwOa6OzqwWk8t6U850AIUd1dOXFT0CZ
         fuluVXB3ka3ZJcTNvkj22/viFy6fMjf5ytZXd8bPVu4hQzRLkN9LZ9kfmExKZxzrg/5m
         rULTydxZUo9CFEEpqqv04QbmiC7wojGhowqb35P69RrnCAYOuwGPNKuE6qdrihG1aOJ9
         OhmelQEiALLV631UkWcSnC9fLmdQ3FVUsA3+hfnfoJ1UBKwzbe1+SVnwR2WXe9jtt9R3
         yoFxS71sv68OvpYaZq2oWxZq7fGgXm4qiN5jN6n3KBsVN0j0mx07AXHjM9KK68WuYb/Q
         3nXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt1IkHvXfaQnX4Cbm/Xf0ILRGx1H71KqnCfOq6Z1bJBUnmR/+LYV1NCO2VEm2+oa/dA22Z3Gbl97M=@vger.kernel.org, AJvYcCWVURWj8ex/HO6W2+0z34IPBS8Cg0XcoYrn+ke88EdEjfEJAxQDy2BHIffJRqPU5Y1AMCZQqMsTPIwUxMawQQfm/YU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VCSiugk79cHANyPXbq5HewclJSHqhs5iaAWaZEklj3HG9RBC
	vY3H2fultFDEiO0FW5V654KHVzBvP3j2Idx/MPTbLaAeiSqtOSqNPQDAnyAz
X-Gm-Gg: ASbGncuP7WAWlvRVVFx0vGDVDA9iNJXrX2hrTgkBacwg/+x5RFXTkR107v1qbWdLND1
	oFYKoDuRZSs8/6Y7wfh5RcxagQViVHczpX4D7sNBgFHBXJKtVopCUk25tOctK0zlknahWBP2DuK
	ZNWzMMZi4PqafBXQPyTB0WhoZb3wV0zBfvJHeoEEXV24tHKnpoUHB0zpqBoSKZaOoDrgNyWYT8x
	Us8vgqA5+pn+M2oSl3hMmFZCs6MvTbNeGzlLt1retSTczHbYX7L1gu6gAhm0H5ywD4ZjSvrnZ5J
	x/E7rApVrzc3vanYZXQ=
X-Google-Smtp-Source: AGHT+IEL3ZjMdC8TSiXbAOZKPsjm5A3IN2IAYm/8F6NrO4+63mfGFS/LmUHImos2OwX7H5KZWkGPQg==
X-Received: by 2002:a05:622a:11d3:b0:467:61da:1ce2 with SMTP id d75a77b69052e-467a576e88amr207016601cf.16.1734358753229;
        Mon, 16 Dec 2024 06:19:13 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2cbc2desm28119181cf.42.2024.12.16.06.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 06:19:12 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8fd060e27so35809106d6.1;
        Mon, 16 Dec 2024 06:19:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqY58MPE09tlkPM03SaP4ye40VLh/pdST4SqLDbT/dINIXOqmGfVouapIsUNvM7OT9IhPz58g3GfQ=@vger.kernel.org, AJvYcCXNN30rUU8fVw1gYEQRGn6cquFLDnr/SYXan4Ya/bKujfx6JMYoDBuCmwQt1CRF9U+8wBk5nW2/XY9t3DqHAPJUPy8=@vger.kernel.org
X-Received: by 2002:a05:6214:124d:b0:6d8:9127:e71e with SMTP id
 6a1803df08f44-6dc96853451mr250211776d6.41.1734358752741; Mon, 16 Dec 2024
 06:19:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com> <20241213123550.289193-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213123550.289193-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 15:19:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWH57Ts3=dD7Xc1uVuVLBvDPvjqXaWRmjjKRhrAN-ei0Q@mail.gmail.com>
Message-ID: <CAMuHMdWH57Ts3=dD7Xc1uVuVLBvDPvjqXaWRmjjKRhrAN-ei0Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: rzv2h-cpg: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The clock structure for RZ/G3E is almost identical to RZ/V2H SoC with
> more IP blocks compared to RZ/V2H. For eg: VSPI, LVDS, DPI and LCDC1
> are present only on the RZ/G3E SoC.
>
> Add minimal clock and reset entries required to boot the Renesas RZ/G3E
> SMARC EVK and binds it with the RZ/V2H CPG core driver.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added Rg tag from Geert.

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

