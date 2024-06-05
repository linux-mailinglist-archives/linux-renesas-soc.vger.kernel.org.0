Return-Path: <linux-renesas-soc+bounces-5843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFD8FC4D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9631F24808
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25B818C35E;
	Wed,  5 Jun 2024 07:43:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FCA18C33A;
	Wed,  5 Jun 2024 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573411; cv=none; b=hV8NLAuXXN/MxWE0V7t00cvamOM5VcZfeFYZaoBUX/fvc4d6ZYLGYDMAHOl05iJikpaWPArngaJpIW20yom9XCI2tjnPsT0XpyCHHmHDHCS7X86rbDncRG1OJbcnZlWvrF1QauzsoIdBGS0pQ1tzcrYqyV27DyJfhJk8PfL+mhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573411; c=relaxed/simple;
	bh=+FTWFdpSh0xb+XUZG7stTNYKFWL76P/rABOHxgYBS+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpdJ2PkTiTKz+CfmMiAVdTLna58yXYcIDWulQppJQv++wZgTCmydzNw9erlpbGgRJnmkEPhyqceynmCwNywdmh6/hxqH+8/upUeujx+/p6+wGQhuL+VIW12InAtdYKa9Rga8kju65yHm8anOKBnvn1a7QSl/N/R+g70l20QM4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a2424ec39so23063797b3.1;
        Wed, 05 Jun 2024 00:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573408; x=1718178208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vQZDoJfLyMtGBiDy8dB7EZ7YY/MgJ790HADWXwqrJ4=;
        b=omFrj+gxFV6/lgFZmEE/Qqjw2O0/9R45yvyEL8uW45823EMAxV6jdJoceJeV8O+xkC
         LzCx4n8ahfMPLSmVMw2fFNOobwJfi6+wtwGYBE/FQ2hhw7g+QWlfL56jNs7bXpqUfqvZ
         dojR5FhNrfaBQcL/MvSCqSO5yREb+oy/3s/O2d3NrfxMsq7U1H8D+smZkKFnC5h0s/4A
         b5bNE/VLsDqPs8OsB+RPhGTaS+bf5w508kn/3r7QdEFy44k/V/PlRWMDLp5LVh+JK0ef
         5D0yGtV0z+1dH9YTGtxJSd5vp8crguG7UrOgchpioqfQt6nQCA7ufjY0BTJ53FthkHBO
         U0jg==
X-Forwarded-Encrypted: i=1; AJvYcCXk+QJ0H1zDcboI1Uu4gCpfrXG5L+75c16Q3aimwm9vnRdxZii//asrrqkRShANpV6l+w0tq7kfR7N7JRHedvMgnz4bTzTZ9FzwpqYjW01URByShlwJGcQICrw9EHGJESQ1AfcRaYbIJpC/cWI6zswMpk6o8+aAsD1gS5IJHwk8urzYPQ3xq5QHPdrx
X-Gm-Message-State: AOJu0Yxa87O52+fq4UkNY8cLEZQU8aBZ/24F9WbJVL3U67qlKU6dwHnq
	fZ4zF1hDhCJWqjaloraL86KRFTKUZWahyihHyEsLFhBkYvVwme3LmzjlKfd2
X-Google-Smtp-Source: AGHT+IGSjnZpyNA9CITWEWP+VC3rlCmEwOTurbJt+tvwrK5/IJdcLgpF/kgQ002pw7ZzBCke4pfXgg==
X-Received: by 2002:a81:fe02:0:b0:61d:fcf7:3377 with SMTP id 00721157ae682-62cbb5ce7f6mr16278657b3.44.1717573408520;
        Wed, 05 Jun 2024 00:43:28 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766b5410sm21438697b3.123.2024.06.05.00.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 00:43:28 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df78b040314so2055842276.0;
        Wed, 05 Jun 2024 00:43:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXx+3svPW7PRZDHDPHFjs6L0Ss7vUMgL/DVUDbYfJGsp/uUWMBIltQSy+Fzlm3qKYyJjSD3gWMEVjJSIs9QyV2O4/0qhUp/phkqJPRwyQUnDF8oYuf5H87xDCDmxvYn6M0p5S7ptrwQ8O3cNZT7myyXta1eS2Fq5CT9rXNc/cL5taG+H19rIGnHXQA6
X-Received: by 2002:a25:2e02:0:b0:dc6:ff32:aae2 with SMTP id
 3f1490d57ef6-dfacad0d872mr1549271276.63.1717573408106; Wed, 05 Jun 2024
 00:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240604173710.534132-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240604173710.534132-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 09:43:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+6_iNQq9x42tmTTEx1DNcT9pEbpMy=UcmSgZtoFgS8Q@mail.gmail.com>
Message-ID: <CAMuHMdX+6_iNQq9x42tmTTEx1DNcT9pEbpMy=UcmSgZtoFgS8Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jun 4, 2024 at 7:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The IX45 block has additional mask registers (NMSK/IMSK/TMSK) compared
> to the RZ/G2L (family) SoC.
>
> A new rzfive_irqc_chip irq_chip is introduced for RZ/Five, where function
> pointers for irq_(un)mask and irq_(dis/en)able handle the (un)masking
> of the interrupts. The irq_chip pointer is now passed as an init callback
> and stored in the priv pointer to differentiate between RZ/G2L and RZ/Fiv=
e.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Geert, I've restored your RB tag with v5 change (hope that's OK)

Thanks, LGTM!

>
> Cheers, Prabhakar
>
> v4->v5
> - Reversed the operations in rzfive_irqc_irq_disable().

I assume you will send a patch to fix the order in
rzg2l_irqc_irq_disable(), too?

"git grep -wW irq_chip_[a-z]*able_parent" reveals a few more offenders...

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

