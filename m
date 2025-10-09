Return-Path: <linux-renesas-soc+bounces-22828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DEEBC93B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ABCC3B925B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9644E25A642;
	Thu,  9 Oct 2025 13:17:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721454763
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015841; cv=none; b=q3TUpUulgkkf3vxs6+WeFCfNZ8DX6Ss2d/wrL5uON1Qj7eSeozxPjcZPrSnpWjaFGxKcE1hYwunS2MFBQxCSvzTcm9PZoMuMP2GK46+BjnNUht3ZE6SwPRBT+85XoLU22yd1GcwruP1Ofk0w7JWP9xUgki8MiWkyoF561h4DkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015841; c=relaxed/simple;
	bh=fy4GsUvEqRkI/Ft6pLFNEsAJ9bVUkKA/yCVuL3Yg9xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVSGE71x7ai4HQvKFbzTTbWlr3p9nJWqf9gnmeEF7kE9J5N/ny0opPp9OH6R1B/+Yj8Vh/BEMULCAikqyuIkUCWzfEM98vgktJp8r5G6/bxIwpbDsGmJB2xQ7N7yvHLEYBcoeQSDnyMOT+GuBBIeR8TGXLik0HT7j5xF49JNF1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-528d157a48cso722142137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015839; x=1760620639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfSYnMo7fiy16p3PhjUGaXAHnchMPw7K8V1O2OsfiSc=;
        b=wDc00tn4GvMumfZ1Ta0uqLVFvc9aqz5qnnXIyypNFYMAgNscQ2aJVcrCr7EpUyMYBB
         tSvM28fozFYD8cgNH5CAUoDKsRj2nt2nNnL+1hfH9HSx5OsfcgqYk6/N1EJGsjiTiGH6
         /gn7/GU9tRfq2u2cgvdFqcgbJtA8ttmC9nKaMe7w7dUPHrBMcijamMI2k6xr86VBe4u9
         JQpi1IdnZuUl4FxI9KBPzJI91fTGNYDSbyzcED1w18NLJRZxwwqMoFq9u6SwYd79G0ze
         uRAwY0N3DE/NDGlIItFMlYkjhHcke+JpVN4Z4fai0xNJM4Q4FrK0gM+HWD6Ej+eqvKBF
         8ZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWcYo7foFfVUOBK/ZrGFhVXfxaJ06S2W8UOGyXD/V5EWHV3Gg0X7CX+0AQvw3pZowa+X16PC3D4u+RjFsleXjv7bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYu07whWtTcYWL/Lddja3zjLC6tO+ptcgEscC5bmlntQaQS4Tr
	lUgzBziYWuRWPq9GNf1ewj5KQcIsHxuw4ar8EeNqrPRNGF93+SzoyaBpEIB47hbu
X-Gm-Gg: ASbGncthcoOBAD8tjJzRS1c0+M12WzcRvWnJpJNXtKEd5wyA0pNwKtrE7wYO7arqQwh
	F7avLRtF2eYLPQuRf7tPskQYOXdZivGXcLnndq6QYjE9AB8RsJybuI7i/SoOTMUSMH0E1qu3Hmn
	ragi54Ft7uwRNrcHyX3KnDcTlNyZN2FtTXg65gDdoVZp2jxpaqNphQmmhcJv+QE7e6fpFGwwWfV
	8KJwz9lQKaZjgQ5UswicaB4MYBIA0RniMTheDGxNyqaW9+HA6TuyCe7GNv8+ABn2DVQPiBFPR24
	W8rsy1m/KTyNUGsKp6/oNOQ0cOW7NBmucFvTQxhbHB7r1FOLXNER4jt6slyG61ejQ2WRFhuMRVG
	SyyYT+VnIMUDUMOpEIf5IWUXsjNRQL7xEMMxKjx7l7tmAQn2cKEWCIJ4xgTsdGdUVt0pNQPlQUS
	UXQon2OtXf
X-Google-Smtp-Source: AGHT+IHPlk4LmnJuKNmkVTC6ypZoocnT0rwMF/3Uws6G5kI478uYiP2lNGJy5VdyZfS8x19rh26ONA==
X-Received: by 2002:a05:6102:1482:b0:5a4:60ff:80c3 with SMTP id ada2fe7eead31-5d5e265dd52mr3574837137.14.1760015838729;
        Thu, 09 Oct 2025 06:17:18 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d38a0777sm2292405137.8.2025.10.09.06.17.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:17:18 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8e3d93c0626so797758241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjG3u0ppgSXXsLHlyJCGdskIO1lMJd8HyJkHeLuQSW19eyUyt7mJd9Y/pGX2UsvFvFf+8XZPShdWkPX0KC6rLIVA==@vger.kernel.org
X-Received: by 2002:a05:6102:1a06:10b0:584:7aa3:a329 with SMTP id
 ada2fe7eead31-5d5d4c81309mr4270060137.4.1760015837455; Thu, 09 Oct 2025
 06:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251007121508.1595889-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251007121508.1595889-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiyQjab-zENSnJsb0F73ApHK5pvA8ZiA1+1pB8_wzyOg@mail.gmail.com>
X-Gm-Features: AS18NWAB-kAJIRsXlBWFwb-rCqWpfJug0iWQY1NUZ_QF1SbJ4tlp4bCFSXh7Wxw
Message-ID: <CAMuHMdWiyQjab-zENSnJsb0F73ApHK5pvA8ZiA1+1pB8_wzyOg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 14:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the performance monitor unit for the Cortex-A55 cores on the
> RZ/V2H(P) (R9A09G057) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

