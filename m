Return-Path: <linux-renesas-soc+bounces-16658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B7AA78B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 19:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBEC23B5FCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A10122FF35;
	Fri,  2 May 2025 17:36:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6711A3174;
	Fri,  2 May 2025 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207389; cv=none; b=F51rKT/RlCkYaCDONg6aW82geDqG0NjvE/k1QjBG+JURgjFMXYx7SN7gTNEw8ju1TvtZGeXmJvjmgkeAIv/0zYqGjewFort3SV1b3JYO0PWwJBRh7qmB5rVf3AmOzmNTJ4qe7bVWpnBrlW3ytA7Xa4cHy0TmVQVMjrrHbHbOxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207389; c=relaxed/simple;
	bh=vtPK6m5XpKhEihh2pff3mlMzWnDGHslh/32bZOjAEOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGbln5xJSZOSbNfGFY7Rnyla5RRoJIOLrxEHmBkdF7DMhsOMWAhwOR/6pvJBAnMEKmuDPxgQ7UR+9FnSix527A+X/7jMOIzGLOkiWDT6tsdp/knKPLo78DiSjFMWXCnuoUcRmG/++3kragXi+ni7jW3fbnxl+CepThZXN/wv7HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so576043241.1;
        Fri, 02 May 2025 10:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207383; x=1746812183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTBU8KDuaw0MZ5mo3TpQxjrSQh6hNnlJMMU6puM7atA=;
        b=tY1rC/nQokQt4ESR1L+EXLdGpZIvPA3kkpuZ8rxgH5Lm26+FW9I24iqJA2NYSUs114
         l11fg3OAsoWN0ORM2vZpWpdDl3Onknh12kch5mMEPjmOvUpuWPa2wemCjGsq4StmKq9+
         KbnUwTYh0ADOrcha+BPXjty7iNgNoddr1WBIsBZ5ce+GUZgh1Ss9SNzSdeMsxlZj3FOj
         jw3ctjgkP6K005nfyMrX1KwUZFK2ulQNN4HuRB4AqB/sYx9eCOlhxs4PQBvjtp4ZvCNx
         jEA2jYJy8oPT3CX+NCQAOPENDDHFtRSVdw2xs0gwDDJjgFKtUP6pNKN6t0UDoJo31SXy
         UiSA==
X-Forwarded-Encrypted: i=1; AJvYcCUv870mDMB3mL4nrKoPEAW9pJkmLzWDAWh1eBZ05f72XVf9vWl0K/SiqLnmlcm3f8bNrXTNECdIh+f4Ygp9@vger.kernel.org, AJvYcCVp/xWhc4jGWahu2BPQy0MUmeIJ0CMowFWpPGCaus6uTLWUflLPkFkE5PcQ/CFurq4g1M3o2JfNCP2zKPR5FX9E3TY=@vger.kernel.org, AJvYcCWsZNtfJvkoNINtA/sf514nz0fiI41biqiYuilxrBYRwoa3jntRHJ2iGi2QfkrQ6P9Rix8SghWVRtmV@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSGnJ1kTmRz6nsX0aI+9b+iteTQLOdU6cAT45itCE4zvsTCtm
	RXoiRtzW8YnESo9lSpYQOhOJ9JADpIdmHGfwO6Fwch5tvuz3TyuuFMP4wojx
X-Gm-Gg: ASbGncvNmMndWBGCBqTBlP3dXtkxAXVfFRzfp1WsLrrSBPsErWTH92FO3gvWe+BIpJ5
	4mtqbDMvTQYrB4BY3h+rss+f4pl22XIum/iX4NeBAMRhYH5QJn1+QRMv9wCjlwom0efeiFnYHK4
	eE8eKBhxrd+ICkaKV8b3TQjLDRq17e70nYcV42u/qQfsbtQy3yF7ZtD+rhEViWUTu7F+cATVjQM
	8xg2QkwdUQUeXJKl+okUURjYbSZEvxj+niyZGJ/PgEHIDwMyJ5X8KU5XuCw5FHsNFDCzTVkmCpJ
	ntIFesLPFuu4c1UqN7Gxas0ZBb/SmIYUsihhASQjrUZXEEJq/ZCpV5ix67h/dZw2+8viCLHVsJJ
	jvb8=
X-Google-Smtp-Source: AGHT+IHMT9hckZco6pPIcNAE+qYbm4+cDyMMgSx2eP/wg1bFfNwbrmreUxsalHA2m3HUaBz3a+7SgQ==
X-Received: by 2002:a05:6102:8016:b0:4cb:5ec2:52ea with SMTP id ada2fe7eead31-4dafb6e514bmr3239952137.22.1746207383420;
        Fri, 02 May 2025 10:36:23 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf2318292sm459339137.11.2025.05.02.10.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 10:36:22 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4c32ba00861so610895137.1;
        Fri, 02 May 2025 10:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqn4maUK0KUzt4jD4H83NQqabgZWGVi1J0N0lnuFYsksZ4SBrNBxwsPA/p4x32z/fl8wmYG0wYCarn@vger.kernel.org, AJvYcCWG2GM6fhc2IEYllyvOTODFGr9AIZPpkdHL20oaV7uAyaKjW2gpZ3wSV03RQLxax0dqmuYyD2tZp7nX2nZX@vger.kernel.org, AJvYcCWgHnv+u2zpco9o8J2znT1V0YJzzE6FO3thuakJ+WujZiYJgF5eV3uc5emyZ7aSCpGpf8thmFjrFcjsPU/ZV+m87B4=@vger.kernel.org
X-Received: by 2002:a05:6102:14a0:b0:4c1:8928:cefb with SMTP id
 ada2fe7eead31-4dafb568c8fmr2928071137.12.1746207382273; Fri, 02 May 2025
 10:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com> <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
In-Reply-To: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 19:36:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
X-Gm-Features: ATxdqUFl-CkBYyUk_oNIA07GJwlne1SaC3Up0FBSpuVt_Yz_D6ZlhAvA_mVeIEQ
Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Fri, 2 May 2025 at 18:10, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that th=
e
> > > platform driver will defer and reprobe on any ARM64 Renesas SoC once =
its
> > > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> > > were covered.
> > >
> > > By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> > > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM3=
2)
> > > are unaffected-they still use OSTM but do not define a resets propert=
y,
> > > so the deferred reprobe mechanism is unnecessary.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Hi Geert,
> > > I've restored the Reviewed-by tag from v1 with your suggestions appli=
ed.
> > > I hope you're okay with this.
> > > Cheers, Prabhakar
> > >
> > > v1->v2:
> > > - Instead of adding config for new SoC, changed the probe condition t=
o
> > >   `CONFIG_ARM64`.
> > > - Updated commit message
> > > - Added a Reviewed-by tag from Geert.
> > > ---
> > >  drivers/clocksource/renesas-ostm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource=
/renesas-ostm.c
> > > index 3fcbd02b2483..6a5785f9c9c1 100644
> > > --- a/drivers/clocksource/renesas-ostm.c
> > > +++ b/drivers/clocksource/renesas-ostm.c
> > > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *n=
p)
> > >
> > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > >
> > > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > > +#if defined(CONFIG_ARM64)
> >
> > Sorry, I've just realized RZ/Five also wants this.
> >
> Ouch, I missed that too.
>
> > "#ifndef CONFIG_ARM"?
> >
> Im wondering will it harm if we have it enabled for ARM too (I dont
> have RZ/Ax to test it)?

ISTR it caused issues on RZ/Ax.

Oh right, and those got fixed by commit 37385c0772a4fc6b
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful
early probe") in v6.10. So I think it is safe to drop the #ifdef
check instead of extending it.

FTR, with the platform probe enabled, and 37385c0772a4fc6b reverted:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs.
00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed
with error -16

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

