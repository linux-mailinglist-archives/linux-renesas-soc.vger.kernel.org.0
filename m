Return-Path: <linux-renesas-soc+bounces-16662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204CAA7BB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 23:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F561C02659
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 21:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408BB20F09B;
	Fri,  2 May 2025 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUXrmiFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6A20E005;
	Fri,  2 May 2025 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222974; cv=none; b=TjnbYdZ6yYTWpY8aYu0B1MfBArQF+xwgD9Sf+7vFZZnJUW5gvjhJ8+KXeknDTOFXk3lhiBuGQIfHvySQ0jAqwtqlIrsvK1t+QmAnLv5+M+8LDK9ckOpqKu7BAjpzCs00ijTs6867rx/qCkNODtmNGuNt5l4sYyJI7nto0oNJq54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222974; c=relaxed/simple;
	bh=RFMMW0zo3tJcBelMhJ5cpUBwQWvY1hxI2Mtm6NmWcEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdis0lDyHv2M21k9efkteTFU3rV/ljqXf443TA2SNr35Ejlx937KrPPqeaVtfigFMJjreuPRbM95i6I75ohMsp9QRhpnUKwxOo+QSZ9z4y3aJuaV4xkWNIILApJSLiNax9hPpUeudCh/UlHAmEMXppjymhEuXJO4refEfbvay+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUXrmiFY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee623fe64so2393002f8f.1;
        Fri, 02 May 2025 14:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746222971; x=1746827771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
        b=gUXrmiFYwayzopLe2aQj9eEY0pvJbXnk8bi0u+oC2Q9eEuX9rIoEXtLothMPvN8+qH
         Jq88LawCuND0UlZQv/TNDVWfL32q5fF/zPYUhR9uWP2V8Km4lSp9pwyULIihLhgl3mu4
         1quC4FvL210A9rgp8TG4K+x/fSegOB8UWJg87Lz86POQKGAeCCKEhb82uAU4p0cq5LFz
         GQvld2TJtha6GJspe37PVmW3jZ76sA6Bqkjjd+B1V7ymCz3wE7eViYGABMo1GQT4Jgou
         XECd+b8uDONU1aPmzVRnZ5pSwjA2kQL1O+dhpsHa94aVQrHT4qrD7wAH26YwlawBQR/y
         ET3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222971; x=1746827771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
        b=vY7kV4g0DEoGQ/K3LVwbKWllE5LM0iaWmB4mDpfQu2z1fPJH9vvhsjSCVXYKAASBRa
         A0XZCTB8Dwrx8MTZX4no/0V1WP6OMVH/TdHqZSrIsf061Lp3Qp7/A+LfR9GrxaTApFvz
         23IfiUmjbc1bzAh3k9mwN2IZhV1B5Twtv1JPbKfTDVsyR5PsS1cjrlrxPhrVSP0PG5MF
         jBfaL7goCDtZhBNxDUjS6u3c1smqZ4C7H1vnyAl/LyZ1MtXQptIv9HiT9nIJY+CtPbRZ
         v5u7/pGc+6hVmMrfZDKz04oiNQkNrbZKnS342J0uCc6/R4n5UQn0b0jtuVclKKuTDAGC
         dbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZJ3dfrzz3vIAWp0Om6EUy5GSThNWKCQG5eZAvfjHX8ab8J21BgH6LHCXWYy3EPlPe0I4qpG1MItQR@vger.kernel.org, AJvYcCX4IGB/m08HsyCmO94+IPMCrvWu8pAHxh3KvrF5YfwXs70koe0D7IzvCPGgY79SBIYdef2UDUgsZMf+nro7@vger.kernel.org, AJvYcCXcbGgy5fXgTdyL9kePpd/33btghfprHYfJxnS1TXHKRTmGimf0+hweB2X1Dis6q+1oE4oSip/Skj9iSRUmAVyznao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYSlhb7KDy0v8Jh9p2rdTC84hz1Cav6G0RIe28lgNJkZMnlV9f
	oGow/rKcAijTRbnFqVsj6/8EhAHyFHvr8HU7NlamwIXhBdWjo1f40oLM3dN+n3weiK93iiPQ/eb
	O+Dt6zsV3ownPy3tkC9PydwkO3i4=
X-Gm-Gg: ASbGncs84gajTh1QTENp17mqiI+qPUlYdgE4N//Lnk7RYObVzYZwcfz43fsM2S18Ncy
	4eBoDCeaVm6IW4zpSQFM0KEyT5gUeLrDnSFlip+enhXvwrkEj0fLmlGgFBlr0HE4WN5KbPye2RS
	v7/s3zO5QKGKiRtwbBtG4UGP/Y0vAVjqRCxA==
X-Google-Smtp-Source: AGHT+IFl+MRsV9J9nUptoXNbXZiIMrW6eP7y6f3wW7mfpaU2h2XmONvIp5/7UcNAkL9ozkcXMiTtg4dCMT3oBCA84EE=
X-Received: by 2002:a5d:47a6:0:b0:39f:b604:4691 with SMTP id
 ffacd0b85a97d-3a09cf6af9emr452963f8f.58.1746222970638; Fri, 02 May 2025
 14:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
 <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com> <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 22:55:44 +0100
X-Gm-Features: ATxdqUE8T1Mu-5AOrIjt5lex4I3-3FPgX7a_P5_IZCEHoJrMGwqdxjz8WFgR-To
Message-ID: <CA+V-a8tsjXVirSK8_Jnx6MQpkSPbxfiri_8b4-gU8hoKfVBZgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, May 2, 2025 at 6:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 2 May 2025 at 18:10, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that =
the
> > > > platform driver will defer and reprobe on any ARM64 Renesas SoC onc=
e its
> > > > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P=
)
> > > > were covered.
> > > >
> > > > By matching on `CONFIG_ARM64`, this avoids adding a new config entr=
y
> > > > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (AR=
M32)
> > > > are unaffected-they still use OSTM but do not define a resets prope=
rty,
> > > > so the deferred reprobe mechanism is unnecessary.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Hi Geert,
> > > > I've restored the Reviewed-by tag from v1 with your suggestions app=
lied.
> > > > I hope you're okay with this.
> > > > Cheers, Prabhakar
> > > >
> > > > v1->v2:
> > > > - Instead of adding config for new SoC, changed the probe condition=
 to
> > > >   `CONFIG_ARM64`.
> > > > - Updated commit message
> > > > - Added a Reviewed-by tag from Geert.
> > > > ---
> > > >  drivers/clocksource/renesas-ostm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksour=
ce/renesas-ostm.c
> > > > index 3fcbd02b2483..6a5785f9c9c1 100644
> > > > --- a/drivers/clocksource/renesas-ostm.c
> > > > +++ b/drivers/clocksource/renesas-ostm.c
> > > > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node =
*np)
> > > >
> > > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > >
> > > > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > > > +#if defined(CONFIG_ARM64)
> > >
> > > Sorry, I've just realized RZ/Five also wants this.
> > >
> > Ouch, I missed that too.
> >
> > > "#ifndef CONFIG_ARM"?
> > >
> > Im wondering will it harm if we have it enabled for ARM too (I dont
> > have RZ/Ax to test it)?
>
> ISTR it caused issues on RZ/Ax.
>
> Oh right, and those got fixed by commit 37385c0772a4fc6b
> ("clocksource/drivers/renesas-ostm: Avoid reprobe after successful
> early probe") in v6.10. So I think it is safe to drop the #ifdef
> check instead of extending it.
>
Thanks for the confirmation. I'll drop the ifdef checks and send a v3 for t=
his.

> FTR, with the platform probe enabled, and 37385c0772a4fc6b reverted:
>
>     /soc/timer@e803b000: used for clock events
>     genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs.
> 00215201 (timer@e803c000)
>     Failed to request irq 16 for /soc/timer@e803c000
>     renesas_ostm e803c000.timer: probe with driver renesas_ostm failed
> with error -16
>
Cheers,
Prabhakar

