Return-Path: <linux-renesas-soc+bounces-11548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF39F6968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 16:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07C81886A53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714AC1E9B1C;
	Wed, 18 Dec 2024 15:03:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3117F1BEF60;
	Wed, 18 Dec 2024 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534200; cv=none; b=WVlPcmu/bjXWGjiKVlT+0zAV60ZVZVWTmNHTwj4BzpkmsaYb+TvmsogEnsJ89BpB+g/TwiiZiU9mcyWwFD6zDSN/Ez+pOl5eQzLSvsgRqwjIWfOPDltD5m6QsmBRgjwnWO+aAZcoyTtqXcR/d8Mwranmgh3D3OjOMJ61PYm3mQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534200; c=relaxed/simple;
	bh=ludXqneOI+vd6XZMGMq+RJqP3NaN83INdRKiHzac32g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBC3a00t2pLGcxCR7GJKyV3sNcf0cp5xshgDAJii3rvbirx15FTp0CWSkuvXXkWv9mlgTZcPn2nlueWHqHmvJMZD+R0dxfHKp4Gshmqa5XzJk8wiQ3bQzDQNXgQrYjvODWW+nOZtbAaB+WPZTm7CJlo5EtME1CocUvposfT6Gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3988fdb580so5164194276.2;
        Wed, 18 Dec 2024 07:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534197; x=1735138997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41Dg+d3rpM/D/LUeai2lXI5h2a/eE7RImpqgvXwmFNk=;
        b=V4388OFJpIbSa2JqSLQILT5IbjKnGGcyNzz27U5MtovZRZl3C4FFOCkOJT8ICanAHe
         kdIxOUA2Fi80VWDRQKmTTJU6jf9Gpwc8eklpyEcOoXC3v8RyAEfjhB+K+qw53rzLtRMe
         a5BCeIiyfEit5wpE662AC/2ORw6PkhMaUB5gf4HK3VJQ4Znv6HBg8w+D/wE3FNbNwQS8
         vx0xAQcRAJpQReYF7SEjz8oIxlmow9d+2olvbsumgOKYfcMnP68Sy3q+l1VC+nt39hMN
         4PkDl9SCVHmXWDDsTwKpjOrmjRZ1aXQIrw8PiGsvnP+lpBwwgRjztv/KHY9z1DIhU2ZD
         QjKg==
X-Forwarded-Encrypted: i=1; AJvYcCVAhaY847EkRlhQX50Y/ZuJmYB290p2sgtRFWJyCjLcJ5jzMtw8VGx1KkRxWwlwmrp5/rqGvqz3Y0UpMzO8DtkxbVw=@vger.kernel.org, AJvYcCVBF9ijB0fqzHh52knfVHqhHtwbTIMy9rnfyKgEo/OCA2++o4iMvO1TFcnZ/QLowqM7pdjW8jmYku9/Yu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+DQne7iSpz1DiTdXC5XAEY9XijhKqigZRfrM4Q+Ne0zqmGlJh
	oIdtM2IVX9TVy96gNJppS3oOyTWktdgnuNZUH2S6yGhr7CvQi9EDZB0wUwAW
X-Gm-Gg: ASbGncsW3T6oQpOd1Edx2MprYuI+m2xE8RcnrXQc/iSXAznk4UxDaDm0ZkHqHMtGP1m
	Xq04g/oGF8vD8K5jsUgbEWnDzodABwQDnhMyWvtHaPT0UsUG6utqjGDZmST2L9jezEatRg/SwYl
	K2LeZsEpPZNxkLwUQDr9am5Kov3LNaQP4/84E0LGh0+EYEMUZqUz+mKnLlUNdeH2jwkCqC+8F4p
	Y+rEvVrCtzTCGRz3FCQLaOpFLhNMp9APBnYhusTCKTxkst6uG3fPR17L8OPo9FKAZZb1MQD3Q9b
	eqURwLbUAazWBeuPu3V+TK0=
X-Google-Smtp-Source: AGHT+IHmm//lbkBGKmNDdY4PymVSfu4zEIB2RtUJrBOo7zASNuU7PKQHLqXYRRFs5rlrgd+fDC+uZQ==
X-Received: by 2002:a05:6902:2184:b0:e3a:5820:febb with SMTP id 3f1490d57ef6-e53621f6437mr2491377276.32.1734534197271;
        Wed, 18 Dec 2024 07:03:17 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47021f943esm2307164276.3.2024.12.18.07.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 07:03:17 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso5033833276.1;
        Wed, 18 Dec 2024 07:03:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKfOqd1+WUUqhmAK/IGyW30mwzABfl0JNyawxWzrEfamgRIttRKeMYFR061ew0MP0IBhwAHRr8Hj7eEi9nkjOm+NY=@vger.kernel.org, AJvYcCVQ1Im3rBsb/u7p9iyhiIxUJAEJbz6HKHCCiROMhQS7HyDjyb8oaF//jEnOi+tz8XNNTB2S/w3hj0PHQ5Y=@vger.kernel.org
X-Received: by 2002:a05:690c:6304:b0:6ef:7372:1131 with SMTP id
 00721157ae682-6f3d26a0a22mr25108847b3.41.1734534196588; Wed, 18 Dec 2024
 07:03:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com> <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com> <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com> <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com> <Z2LZozgxxQuusHVS@pathway.suse.cz>
 <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
In-Reply-To: <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 16:03:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ1N2N5WBfG3KeC1fPz+ez+fzDriKm8omHxfhe6m_Pfg@mail.gmail.com>
Message-ID: <CAMuHMdXQ1N2N5WBfG3KeC1fPz+ez+fzDriKm8omHxfhe6m_Pfg@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Petr Mladek <pmladek@suse.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	John Ogness <john.ogness@linutronix.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
	Caleb Connolly <caleb.connolly@linaro.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Wed, Dec 18, 2024 at 3:58=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
> On 18/12/2024 15:18, Petr Mladek wrote:
> > On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> >> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> >>> On Wed, Dec 18, 2024 at 11:14=E2=80=AFAM Jocelyn Falempe <jfalempe@re=
dhat.com> wrote:
> >>>> Maybe you need to add console=3Ddrm_log to your kernel command line,=
 so
> >>>> the kernel will actually use this console.
> >>>
> >>> Thanks, that does the trick!
> >>>
> >>> Note that I do not need to specify any console=3D kernel command line
> >>> parameter for the fbdev console.
> >>
> >> Yes, the fbcon console is tty0, which is hardcoded for historical reas=
on.
> >> Some architectures use add_preferred_console() to enable specific cons=
oles,
> >> I'm not sure it's allowed to use that from the drm_log_register() code=
.
> >
> > add_preferred_console() is used when the console should get enabled
> > intentionally. I would split the intentions into two categories:
> >
> >    + requested by the end-user on the command line, see
> >         __add_preferred_console(..., true) in console_setup()
> >
> >    + enabled by default by a hardware definition (manufacture), see
> >         add_preferred_console() in:
> >
> >       + of_console_check(): generic solution via device tree
> >       + acpi_parse_spcr(): generic solution via SPCR table
> >       + *: hardcoded in few more HW-specific drivers
> >
> > add_preferred_console() causes the console will always get enabled
> > when it is successfully initialized.
> >
> > So, should the "drm_log" console get always enabled?
>
> drm_log is a replacement for fbcon, which is always enabled, so I think
> it should also be always enabled. Otherwise you won't get any console as
> fbcon is no more available.
> drm_log doesn't really fit in the architecture/hardware model, because
> drm drivers are available for a wide range of architecture, and a GPU
> can do either fbdev/fbcon or drm_log.
>
> >> I will still send a patch to add update the Kconfig help for drm_log, =
as
> >> this command line argument is required to have it working.
> >
> > I guess that the drm_log consoles should get enabled only when
> > requested by the user =3D> documenting the command line parameter
> > is the right solution here.
>
> Most embedded linux specify the console on the command line, but for
> laptop/desktop distributions, it's not the case as fbcon is the default
> since the beginning.

Note that on embedded systems with DT, the console is auto-selected
via chosen/stdout-path. No explicit console=3D needed.

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

