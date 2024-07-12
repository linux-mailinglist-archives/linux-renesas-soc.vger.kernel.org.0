Return-Path: <linux-renesas-soc+bounces-7296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63792FB68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BB9CB22EAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC3C17085D;
	Fri, 12 Jul 2024 13:28:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146116F91D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790896; cv=none; b=Syfo809n/5N7+t6E37/OINhEIjGUKlOYJTLCXYlc7lHyMXl9RghSND0E53gai0olUgF5I2PrFuP7q4Uj5arodCsTjuiUDygP/IMZEwdyyh4oz/ZQatx/7bsGh1AG+EIP0T6gus7x6gKCG3lU++Uf0qbBGTq/j5cix47pbU3lIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790896; c=relaxed/simple;
	bh=lfoDNOkkVUHiSrP32QEiT0Mm6i+5Kk1C2isSMTutf5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJhMszXIpjyHrpy6MK7P5sqNTJn6BRrCShlNuWx3plrTn8Z6TWY7GvpkslHEO/C4hrYTNwug7wUlRNm65V5hRWPAVLHZWamIbwgfMfZJJKFQQ9kHh2NbsFMHbc0llF1y0hX+abMsOrzY/MpbcMf811ICNEspiU4Pdb+ltpPgv04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-654ce021660so20903477b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 06:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720790893; x=1721395693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxBtdSm6Zqwrh4tSn4IlmxFumkG7Umxf3i9y/AgSBZg=;
        b=jyehUqy60kAF4cZN88VX2r/uSi4O6pKGqRX4aJPz8PlVJtUjSorbf0MKgDGsDlbNGQ
         sZyZJSwS0iuh+O9B+/CK8K/8MNX9rjb3j4v7ZdOIP0+Np5qFDC3D4o1rOQy0TO2O695w
         te+wIHJHreRni9SyAHvIsUiKVu9Ho3S5fWzpSOpWUnp7fWKrtFqX0oosYWcPFlE9RqA1
         u1a6njZNpLJxGdXyWFHmLD1korEskB7Ic+l0KN5Cyy10dszYKmax1s8lPRmXBuDHqnsE
         /ZOmpknk0mKhwBhPRMH45cDtiid2ffiYWLrDQ0Ztu32Avjfn7u5v9xlJ95vajxDvtSAL
         uYtw==
X-Forwarded-Encrypted: i=1; AJvYcCUlCYwJeu4SkqV9rZ8YxwkBP9NNYSP4aRI/zieZMxmqHj4xYHJwkGk8TNDm8PrLSShTKG6kIzA6lWzlH/s5MEQ1t5eGkc/tk17D7h9n45JLIb8=
X-Gm-Message-State: AOJu0YzLUK+lRBXNg6QNhvgOWqEWq3onWtcywusUPyjksgQVONAlt4+C
	eHUuBoRRyJN50/VL3ZwYsCXW5zlGPb8VJSipn8XzUEqEwpOLIt++P8S8bfub
X-Google-Smtp-Source: AGHT+IGttYN5mIn8/juCVK5qw3LHotO6YUQH/qgHaAazsb8RICU7Fa+2iNaY4ob97To4ZegIMoVNGw==
X-Received: by 2002:a81:8d13:0:b0:64a:7040:2d8a with SMTP id 00721157ae682-658ef2494f0mr127008817b3.23.1720790892824;
        Fri, 12 Jul 2024 06:28:12 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e483ed2fsm14852217b3.24.2024.07.12.06.28.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:28:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so1940991276.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 06:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj5s/lle6gjUxQlV/IwjPIkOnLYbPrw8/KjR34yYRVgg1r1jOh/3oC4clboFZCvCdKspVPfqd5PSR1PobBFKkl/6lXNBtC/yWXt2YXOQCkab8=
X-Received: by 2002:a25:8748:0:b0:e03:b580:fa31 with SMTP id
 3f1490d57ef6-e041b03520cmr13434676276.7.1720790892103; Fri, 12 Jul 2024
 06:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704061720.1444755-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240704061720.1444755-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:28:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdHRJJwCss9OC-YXqhhQ+Nax23n72=fBKOH4WCxKOMDA@mail.gmail.com>
Message-ID: <CAMuHMdUdHRJJwCss9OC-YXqhhQ+Nax23n72=fBKOH4WCxKOMDA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add PCIe clocks
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Jul 4, 2024 at 8:17=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add the PCIe module clock, which is used by the PCIe modules on the
> Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -191,6 +191,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
=3D {
>         DEF_MOD("msi3",         621,    R8A779H0_CLK_MSO),
>         DEF_MOD("msi4",         622,    R8A779H0_CLK_MSO),
>         DEF_MOD("msi5",         623,    R8A779H0_CLK_MSO),
> +       DEF_MOD("pciec0",       624,    R8A779H0_CLK_S0D2_HSC),

/me enables his magnifying glass

Actually the bit is called "pcie0" in the MSTPCR6 documentation (Rev. 0.51)=
,
so I'll fix this up while applying.

>         DEF_MOD("rpc-if",       629,    R8A779H0_CLK_RPCD2),
>         DEF_MOD("scif0",        702,    R8A779H0_CLK_SASYNCPERD4),
>         DEF_MOD("scif1",        703,    R8A779H0_CLK_SASYNCPERD4),

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

