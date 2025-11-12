Return-Path: <linux-renesas-soc+bounces-24493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09764C529CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507053B7CCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 13:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AFF229B12;
	Wed, 12 Nov 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOd9VzGK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C651519AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955655; cv=none; b=Lr/ndu847CZsmO2R3RxKmgSX6kdtBA0+MX40ZPOjDRC0L95h+o9whwISM8R1BqEhDIE7N4nwzjOBfi8jdrO1rO90j5vfP8L4Klt2yqSAgrkpjzxDF3XliQ+sAQ2aWcu+TVMc6FDqEeaWSBieD60jxPyHltGhluIzWzznc4xx1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955655; c=relaxed/simple;
	bh=ZdpvgThlfiwd3u9oNnPJuAy5BeihTea7i8A8grWEcSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPThbHK+/Lez6uHYl/VjnNuiYzCAVhcDssueNsnunf/Z8/PrEz7l4XZTMfPV2cM6KZSEDoLPT4RHuNNWMTSXP7T0sBwEqlsZuw9bl/5Fq76D2MKah7suJEG/GeIZmA9fYQFLJI4dJQ3pSjp68vreMohpNNtCKH9hfHbBJr88Ef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOd9VzGK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso603102f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 05:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955651; x=1763560451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG2pJO7jPRo0xTmxSl99J7Grs4OxbY78BhlsbWKxyMc=;
        b=YOd9VzGKLc0O+2W4D+K8Y40BmBQiJGEqZhpbFxcYZ7jyUzLxLgjENXlfOrQo3m2ti0
         x3K20Kyd4A+H2dOnrCpSo1F17G2Ki16vssa7Q3/n4IgY5OztlfE0HvuaM8BO0c4JOy8h
         RUYyJIHHyRsKPKxxUkTaHY3MuvOr6Oi6+ZRXKZ6TG2ahspbZluPbGWXmxX9yjFxtqKWy
         5hG5Ghx2thWPZ0Kutdw2YSIzIIim97FVdkzArS1tf4qS8Tk694VpIuqcaWDvfXL2SaW/
         Nv1wP+6wgqWPjjAsYgUuKJRNnOvlJYg0FhMW1i/vp/PM/1bhAp0XEo1CVirgZ06FyEX9
         veNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955652; x=1763560452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BG2pJO7jPRo0xTmxSl99J7Grs4OxbY78BhlsbWKxyMc=;
        b=UIsOn4bEEWbUzUMafOggoQRffZ5hl1NuSvWCv2KRptbm3/xmlmSIqjJn3KPzWRlp2n
         +RHPa3eiS/XPjR6YQ6PPQn4/3ls0WBgO/fqxG+KJGbllfrCvxtyx3AWMj1ZqzO1Kz2yW
         9/d3RYqQdjqINNJeyxKuD54apffMPHDOhvq9yTEjBjfPXn2CtJ8wmttWL/xv3r6aQ6G+
         uPfh22u/Y6rIothrKckgsLTHZbJOnLyJwnrfkv3RXdpeNOsUqPk9dDOEHYSQZB5ak2iO
         pI/67Hp65lOv4gos1m8mI6M/WwYYu79Sr3M8miIjoi9QoffjBIF2w1Zzay/vavX6f1iW
         rNag==
X-Forwarded-Encrypted: i=1; AJvYcCWF3zuomj7QFHw9h0pt5aZXzlg9YMRMHhHnpopZzlWZ5spiBgCk9lRZiXo6LSjif4yiIMzvNDD848FXPwHTLZBjiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvNpFM25xCiDvNVsKq7u8XNuTrGhVgkYUdAC2QODcM66T9Etg
	vZNAlScG0XgHjUEdXwPjmpsDIlcX/7G8TNf36UhWz6HXc/DXQwr/VtMPesuCm3yTAykhIR01zHD
	owgc878ZiMUeF762xM2i7zMKc0CmQ/Rs=
X-Gm-Gg: ASbGnctCxmGCdCyM22aw3IuQTaNRXi+dzQ+nfLr4+3Sqmlxt/vsKltyXQg3zT4FlI6K
	1jIu07ZjU8H+moYouXtFFpvn0drgcmaY2KZTqfO0NO9M2jQFLtTRXSzE2OZzDHoYQYzkbyGtyun
	/66ytiHx4unvoT0R2Sdt1vuTZTWZUW1zfBvj6brXYeC9tU6k4JMnaIRV4DCjhyNZCVOdt14/V4/
	EQrjbW6tLo2CE+5py118NUsQNPXL3h/Z/61Jcsljm7TjJqKx+r0gx0a8g1Alw==
X-Google-Smtp-Source: AGHT+IGQvmANO6g6m1tUJGuokHeAzYlVewytp8yIQzEUXmmfWbBp3Ex80ahWIr4/EZpwZnUsrN4N4acrbdqR30W2yLA=
X-Received: by 2002:a05:6000:4009:b0:429:ef82:585b with SMTP id
 ffacd0b85a97d-42b4bb87737mr2423522f8f.9.1762955651351; Wed, 12 Nov 2025
 05:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUv7tOc-QC8N_ie7739t07Y5A_6HQPMVR9fxW-jo_d9Ng@mail.gmail.com>
In-Reply-To: <CAMuHMdUv7tOc-QC8N_ie7739t07Y5A_6HQPMVR9fxW-jo_d9Ng@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 12 Nov 2025 13:53:43 +0000
X-Gm-Features: AWmQ_bnAhdX-JqRB4GVcBYO9YoIfqRy_zZn9ftYsTK98IajqIwJsJ7Xdu3GLZlk
Message-ID: <CA+V-a8vQnno3vc8Hgav4m28hwgyf0cosMa_R4ALYkQcTtm6DNw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 12, 2025 at 8:53=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 11 Nov 2025 at 10:11, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Unify the probe implementations of the VSC85xx PHY family into a single
> > vsc85xx_probe_common() helper. The existing probe functions for the
> > vsc85xx, vsc8514, vsc8574, and vsc8584 variants contained almost
> > identical initialization logic, differing only in configuration
> > parameters such as the number of LEDs, supported LED modes, hardware
> > statistics, and PTP support.
> >
> > Introduce a vsc85xx_probe_config structure to describe the per-variant
> > parameters, and move all common setup code into the shared helper. Each
> > variant's probe function now defines a constant configuration instance
> > and calls vsc85xx_probe_common().
> >
> > Also mark the default LED mode array parameter as const to match its
> > usage.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Grouped check_rate_magic check
>
> Thanks for your patch!
>
> > --- a/drivers/net/phy/mscc/mscc_main.c
> > +++ b/drivers/net/phy/mscc/mscc_main.c
> > @@ -22,6 +22,24 @@
> >  #include "mscc_serdes.h"
> >  #include "mscc.h"
> >
> > +struct vsc85xx_probe_config {
> > +       const struct vsc85xx_hw_stat *hw_stats;
> > +       u8 nleds;
> > +       u16 supp_led_modes;
> > +       size_t nstats;
> > +       bool use_package;
> > +       size_t shared_size;
> > +       bool has_ptp;
> > +       bool check_rate_magic;
> > +};
>
> Please sort by decreasing size, to reduce holes:
>   1. pointer and size_t,
>   2. u16,
>   3. u8 and bool.
>
Ok, I'll sort it in v4.

Cheers,
Prabhakar

