Return-Path: <linux-renesas-soc+bounces-20603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6DB29A26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 08:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C0B3AC03E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 06:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99A1277CAC;
	Mon, 18 Aug 2025 06:51:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B95288A2;
	Mon, 18 Aug 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499860; cv=none; b=arNnCO069OE8KANRFJkrFQXAyMvp2LwSVAzQ7bawAVFITj4zzymwamiSQF2n0lRqJ3P5VvoosnTlv1GXLbBhvkRFMJdIICAFACUcqo+9P+7tP7aDwokteycY1XFRi2QS1BKUtv/WmJj55/f3iFxbPFIkzW9oMNxhX2dcH6miLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499860; c=relaxed/simple;
	bh=dv7vP6HjulK73743xQgGsIS5YpuaWGE248Lc3XjufAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt/GREphcgX9sTTRdLpPbw0jKsLKH2FO02aL1WaC/yB/c4gZzxnRX+2/6waNl1LKR3FXJr0bYFDf31imEcgqkevL4NHZZ2LjL55lWtdLHDEBlh3tkua4T4gt82eoJOe734m97MJf12kK20cZW1gWpFeCnwsdgfn2/xK1Ppo1gA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b1757a920so1073745e0c.3;
        Sun, 17 Aug 2025 23:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499858; x=1756104658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLPQBh7z7ZjgVyEFkGxLLskZOTy+0tpS2U/GhDwl5OM=;
        b=Cglj8snnkEkmBcUBw5PHq0l2ZTBsnReeesqOvv27deNtgfPwIYOOdYuDtNQJ0SiLHo
         KtUQTmgCC/gU0lR1ZnnKpTDjP5Tc59XzcaL8l/adXPq6tYi+E3tzhzmocRSH7SA6XSpz
         /Qq3B3TbtzDQxsK1doeXQe/DNy1qPpYV46hmrcZzVXiLfbOLbOgtUpHU2akiKcOtMoHu
         jBIUzdt3a4upb6jsX05oCEdWdt49OoOKFAs+hs1FmyYj8nhh5Z5V+1rl+PAqFcpjLGja
         GJH+JGMQ8m61CnhrY/iarv0tkAJDiytBtps5iyt7eMFArUMhXvHeSG/5CcsRNybAzHzR
         80BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKQmd4lgJop+O1hwATC/C+0TAf87OtSBOFiJaNAIvDgnF8TGVQtQdL+JogeY6Sau1E1WDGrXO4l8N9enr5iQluQuk=@vger.kernel.org, AJvYcCXVWswv1oSK1fzNLq/VSGcjOY/Ejp5Ul1N7tkMCx/6ENzurlAyj/z2YF+5rIOtdWLGwaQk3oJ2KhGS7@vger.kernel.org
X-Gm-Message-State: AOJu0YxClLwLSt+ilyLV8Dlv005VMPAx4AcPzZAUAloy8nw4jBPOqfz6
	C9Wx6RERskw+pspFLx+UWX/3MSMLJmr+H/9Vrzj2Dq/gcmEvkNX3ljMrwPj0b2pM
X-Gm-Gg: ASbGnct1xAzhpr1/TUoDI4im+7xTFKSu7PeTMZPvUWl37lkz7QDYWpz4qmC6ScrYm/S
	w0SJ62qHaEj/ZxmhoMewASuuVu7S0juz0bL5bvsq6n7svs2belSU06vR/JJ4OhTL/MIKRx6tbPQ
	XWK6NcZ9Kl9u5rguNZMEe8fBAKLPmOihmo3tVOXw4kUZqeHId00Mk+P+nnHKbNDgAA+rDpj5IAI
	2AWf7c84v4a9rWo8IZGoIooqve13sDzIxlwcJ+nZJGr3L7Wvh5lTgAQkK+tafjSmzHs/KBQv7BF
	8+SGlBRZJr/MkLL+Bvy2yDomQJbIkZPwC9UO7B6S36QzbJdzXYgPC2vAQWYQ0T8dZuWyDsbnBeA
	kHeSEwsoFx0VZP/Vnv0Nvm2+70eyQk7ChfR3C9PIiWPQ3fAR04I48UmNWOXD+HvvdkG5geXI=
X-Google-Smtp-Source: AGHT+IHyKmLf0sqtQ8/b9wpDn4zKjMsBBOVKQRxBD9xLLPiuB0YZGlQS3KceG6L8WvY229OjjAi5Dg==
X-Received: by 2002:a05:6102:5805:b0:4fc:670:fbf with SMTP id ada2fe7eead31-5126cd385f2mr3409331137.18.1755499857884;
        Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127cff0da4sm1951721137.2.2025.08.17.23.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89021b256eeso858896241.1;
        Sun, 17 Aug 2025 23:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGiXkd9vYutTMnHifBvL2DH6C3wKZbK3DnMcazFh2aTKXYx1UPfJOYExjXM28OJUS5rH+Wi/gKvZqW1EAnnMG6OCM=@vger.kernel.org, AJvYcCW2+EGdoq+hOPCKK/scS4FQ8QkCG/9i++7wWPk3qJNUSlggSvLojL1r6BNuGR3dhla+WHliYtjlrmCa@vger.kernel.org
X-Received: by 2002:a05:6102:951:b0:4fb:372d:6d70 with SMTP id
 ada2fe7eead31-5126d8e0ba3mr3829721137.26.1755499857391; Sun, 17 Aug 2025
 23:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814233529.191874-1-marek.vasut+renesas@mailbox.org> <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWObPb97mYrPDBikjHsy_egsPqmMvoTgq4p6y=e_HE75Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:50:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC8+X=WcOdHsgh7XsR7WhVEHW8FZxFKpbbKuyM9jav7w@mail.gmail.com>
X-Gm-Features: Ac12FXw5y3Zk8kHXrn0gTEdDmk3-f_blnVhZq2OxDNottOxmur1Iod84ZDlawwI
Message-ID: <CAMuHMdUC8+X=WcOdHsgh7XsR7WhVEHW8FZxFKpbbKuyM9jav7w@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Aug 2025 at 08:48, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Fri, 15 Aug 2025 at 01:35, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> > to generate more heat. To prevent potential damage to the board, adjust
> > the temperature trip points.
> >
> > Add four "passive" trip points which increasingly throttle the CPU to
> > prevent overheating. The first trip point at 68=C2=B0C disables the 1.8=
 GHz
> > and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> > trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to=
 1.0
> > GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to s=
tart
> > inserting idle cycles into the CPU instruction stream to cool the CPU
> > cores down. The fourth and last trip point at 80=C2=B0C disables the 1.=
0 GHz
> > mode and limits the CPU to 500 MHz frequency.
> >
> > In case the SoC heats up further, in case either of the thermal sensors
> > readings passes the 100=C2=B0C, a thermal shutdown is triggered to prev=
ent
> > any damage to the hardware.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: Add RB from Niklas
> > V3: - Sort DT nodes
> >     - Update comment on idle states, note the 0..80%
> >     - Add RB from Geert
>
> Thanks, will queue in renesas-devel for v6.18.

With s/r8a779g3: Update thermal trip points on V4H Sparrow
Hawk/sparrow-hawk: Update thermal trip points/.

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

