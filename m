Return-Path: <linux-renesas-soc+bounces-5844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5888FC4E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9869B284A01
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6C318F2C5;
	Wed,  5 Jun 2024 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJHdtUGC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F714AD2D;
	Wed,  5 Jun 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573609; cv=none; b=cB+O7GtArjecVBDsiByevFSUQX20CX/shLvi+XatqaUONHpZb4hTY1K8/q0MtDs0BjsgwHboI/Nq1Kgy+dUrkQSKRp8CFrSX9vIHWILjFd0LouDB//l1PkGxVG2KPPKRoBcA/vhmRMJ27nyEyPKpRHcg7I6pwmBr33XtiagaNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573609; c=relaxed/simple;
	bh=9qtlehYFxffVoi9gYPxfAx8pfIPMGIgkGjyptaofgPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPE4HJuyyXCkYAtzz/x8F+1hQBpS+/K29lsGb5cUSPuYCa8t74iQGQ7HwKY5dO4KYLoMAn5Yd/j7lCJ2M2fRvmbYP1pykAvzMconHPormpScyvSgrUc+ehdNGLYrAXDukrRusEYlaPn88dbUKVTHFdPc2RHwe0vptrzinxHPvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJHdtUGC; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-80ac54220ceso1973433241.3;
        Wed, 05 Jun 2024 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573607; x=1718178407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qtlehYFxffVoi9gYPxfAx8pfIPMGIgkGjyptaofgPM=;
        b=IJHdtUGCffGht77FOxveWRRCDUgPne7C8viC8gaTAvAZ4tjht+CeZatAlSohHGr0k9
         15BhNg9H9C4HRjLnDwRbBHMuz2OH6IGY5Kk/B+m1WWdyTRz6oVUtYhdgwAv3RqxMXbIj
         dV1e1Kxhgb1HpKz+1sP2ebuJN62q2R+hTK27NKFnMisGjLUr47wUnvWN0KuYoSia5EzP
         y1qgqV6hrVG+UMiaVdeOha5qYFsXyD7HzUTryP9sLO+q5cbnd82l6GEhey73kF30KiJn
         BJJZFYr6pvWN8Igvw6AwHN3tcxqOzqAu8NuEJLvPDXFVnHL2wwgqxZIZrLbhvhhpE49y
         Bgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573607; x=1718178407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qtlehYFxffVoi9gYPxfAx8pfIPMGIgkGjyptaofgPM=;
        b=rNbLJkETUQ/Y+HaSz1VvyU7IJ2O7THgATHKK2kvAPGzP3as2B2g8l8lzISpp7sXS61
         P0lozv+M17mJVkI5vrQvACipxPNiFIWqSx+k1+udmlwlRfMwZRV41oYAHj6mUh4//3UB
         5MBTFkBhOr4D4wXH9BtVzspX62AMlHu3vQhUv6e6dlLJ1yz8W+cDlITGZNl3bjAoWrlF
         geTSp6P3g16cIG67SXVLj6vlPpFc/XhZZ8htwsh9GplgGFyG+CT122GP2De8hSQU5Z1p
         qEzSRP3+jFbgIZ3s8pSma41ZQ3zku0druCtHq4mxBlBjjPZCgMeZAEdS5q5XYPS9zHuH
         TEHw==
X-Forwarded-Encrypted: i=1; AJvYcCUtBdXHwApx/PX54cYL90zOXpJsSXzLlC0kpModghM9gO1kSyITGK72e3s0P9OdoTcb4zhcPURCVfeITEM51Gv0X2Ywhu26PzBgdmFUfK6YpFPULLOY/JEAGd5ZdcHgrYFD5ew+3KRApAnuKGfgQf0UhxPvUDk9nKFBN7zYeSiOPhT3hnCNuvppDrWy
X-Gm-Message-State: AOJu0YwkN03QKbhEWxgsjCWjZmAeiyvBzE+SQpTLrYggBVPH9Mi1sU1C
	zOjh3RWbXQQC6QtiUF627V2H2+fMHTVS1UlYeng1LkLWXWumNKnwyu4jyBRrCZ9Em2aOK+bCW1B
	dgLDWSAxVqtzhbAqnSYTVBzhCUMY=
X-Google-Smtp-Source: AGHT+IFpRsUgGbp0YLBYfbSm0P3HeaxQiJATKA4u9qy5DsN7l7+FPFsht/Bz7ZxT+zAXLbKNk1w/Wu32BD1C06Dn2Ds=
X-Received: by 2002:a05:6122:2f8:b0:4eb:25b0:3d4b with SMTP id
 71dfb90a1353d-4eb3a3e7df9mr2085920e0c.4.1717573606561; Wed, 05 Jun 2024
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240604173710.534132-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX+6_iNQq9x42tmTTEx1DNcT9pEbpMy=UcmSgZtoFgS8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX+6_iNQq9x42tmTTEx1DNcT9pEbpMy=UcmSgZtoFgS8Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Jun 2024 08:46:20 +0100
Message-ID: <CA+V-a8v0u8EQ-eY7zLMXHcqYeKv9+4UZwMR57=mP8noty+OBqg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jun 5, 2024 at 8:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jun 4, 2024 at 7:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The IX45 block has additional mask registers (NMSK/IMSK/TMSK) compared
> > to the RZ/G2L (family) SoC.
> >
> > A new rzfive_irqc_chip irq_chip is introduced for RZ/Five, where functi=
on
> > pointers for irq_(un)mask and irq_(dis/en)able handle the (un)masking
> > of the interrupts. The irq_chip pointer is now passed as an init callba=
ck
> > and stored in the priv pointer to differentiate between RZ/G2L and RZ/F=
ive.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Geert, I've restored your RB tag with v5 change (hope that's OK)
>
> Thanks, LGTM!
>
> >
> > Cheers, Prabhakar
> >
> > v4->v5
> > - Reversed the operations in rzfive_irqc_irq_disable().
>
> I assume you will send a patch to fix the order in
> rzg2l_irqc_irq_disable(), too?
>
Yes I will. I was just waiting to do some testing before I send that patch.

> "git grep -wW irq_chip_[a-z]*able_parent" reveals a few more offenders...
>
Yes there seems to be a few.

Cheers,
Prabhakar

