Return-Path: <linux-renesas-soc+bounces-11530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D44EC9F643A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 12:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920A7188C96A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600BB19CC3C;
	Wed, 18 Dec 2024 11:00:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89D27726;
	Wed, 18 Dec 2024 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519629; cv=none; b=W7mFxkbLspEm0uD714yxOos+qPPUAhFmuyE35BiNKbl/ekgfLybLqYbIsuB00CV0lHkUKUYieQDsAf5Vu4nnrvIpjK9PsnEL4E7/JTTSLKBcXqhuqKpwCZIQd471TvKjK26yeQAWAFu6sTwx0RCVP+C9jldBWFc4Bms/IKJEOpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519629; c=relaxed/simple;
	bh=GdujWMjNE+GcwXHY8I5gZpl6Uxr+E1FBTrOA0Fdm/5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zvd4F5PNN8Wss3bgVuRpuJRoSIgtoqyQiieWjntMPg2mUnbJY8Q1BTVHExsitansp3BroFEZ6b8DO8DYY0O3lhSY6oZuatT23GFRlqcobSNTdCiMtr1Nhz/d0Wm8UTjFVu7tYpPRUn2lusLBCBghb6HmE09JL91MSE2HVAPOpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso1988520e0c.1;
        Wed, 18 Dec 2024 03:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519624; x=1735124424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/U69elco9zkiQh0yXZq7MKvg1aCO2Nz91Fs7NLtUtc=;
        b=p2+6OwlOwZoDzjARsTqOpcyWSfyOG4NJ7CUEiAl6UdNBU9PFwV9sO+D9GEos7SdlUs
         W6CjVbg57efQ3rNtdopTK/shgkwXJGFUXV6psn2HdXTIYSvtnbJCyV8/2hNfCcnjF4Qs
         5gnbXK6p9rLzgJuFkcDARt6HZqEOB1YtT8x7veLINi4rku4CBHDPdHSK82Mkk1mbaxaa
         a5vb4gp+cusOQJcfMXiOzfb/AiIhRwPNjx38vrhXIJIFdBngyJtCFBD8Ac5XanNAEzP9
         VdJURBJD6ryYz7oqk5wwD++g6j6smcS8ljY74VkPmc3G/HMJL3IZP7fkUZrFII94dzdB
         VvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuKxcTUTRDLWrjFsg2m67j64Iab8RFK+ScgL93UG2q0OE2GlT0OROvdTn8MzBl7ban03Iooe7l3ddPG9w=@vger.kernel.org, AJvYcCXmoxdYnov476pvJy2F4lDW7jsmL2m1cwiZRu34JPQ3yZinQ07Np/5EH5n2uld8Tlyw2gPdiqSmocQ1WGnyIIWZc68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDn0a5s04yLXVx7Yyj3rA/6pRrNaGm/8RF17luf+etf6IIGIQr
	APg1fg4ycd4RjehDDdxn8IDgp5noAIpqRycncA3zexbozAh/H+26P8EjHOgf
X-Gm-Gg: ASbGncthQer+DFI49f2jKhJGkezimmfsqBCJY39p3jdNeOqacfVjOxGeG5a7D20cbaP
	pNgfHmyjAB9sBWfY1km4HJ9aOgl49o/8kIpfv4MTZGmk66sKs5BCZCy1ubSVf7y/xO8sUn/31Fb
	XH8HcZlzuvsJ/vLB9hDYiDp1L4R44oYrAS7iTYBVoIm3NccgUdyT+xp1i87xiG3j82Gly1MO6fn
	bGfbFKfkZkjxoi2NZcJ3ehz/x+X3fi0pp76uOLkwU6nXQU5VbDsK3ZzAZai0MmjkFR+N7O96mgs
	wG2ZrbUC96kGimSOhX8=
X-Google-Smtp-Source: AGHT+IEOY5tWBCTBHXqZptkZs54FEfrQsxJepcBz9/AKrrNN+qpk3+Ljf4jJcjCQ9wv65tqxkXS+MQ==
X-Received: by 2002:a05:6122:220e:b0:518:9582:db90 with SMTP id 71dfb90a1353d-51a36defbc3mr2185909e0c.11.1734519623757;
        Wed, 18 Dec 2024 03:00:23 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519e35dfc11sm1090104e0c.20.2024.12.18.03.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 03:00:23 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c4b057596so1364341241.3;
        Wed, 18 Dec 2024 03:00:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPm1Y47OujdxViTl6JW7eQBX4NH05xde/dKSjmKvAXYelEnrgElEnF4o+FEhN2n8kPC01Ew76F3aAsKsE=@vger.kernel.org, AJvYcCWGPoyzUtNHkDTuyrWd7a2OPK3CUYlCDQibdLif3+NeXH12FwScwDLRY1Nuwlc8IhyaD5fqDjWzef2+z+0Zc3K6snk=@vger.kernel.org
X-Received: by 2002:a05:6102:32ca:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4b2ae7774demr1552774137.15.1734519622627; Wed, 18 Dec 2024
 03:00:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com> <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com> <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
In-Reply-To: <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 12:00:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Message-ID: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	John Ogness <john.ogness@linutronix.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
	Caleb Connolly <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Wed, Dec 18, 2024 at 11:14=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > On Tue, Dec 17, 2024 at 3:46=E2=80=AFPM Jocelyn Falempe <jfalempe@redha=
t.com> wrote:
> >> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> >>> On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redh=
at.com> wrote:
> >>>> drm_log is a simple logger that uses the drm_client API to print the=
 kmsg boot log on the screen.
> >>>> This is not a full replacement to fbcon, as it will only print the k=
msg.
> >>>> It will never handle user input, or a terminal because this is bette=
r done in userspace.
> >>>>
> >>>> If you're curious on how it looks like, I've put a small demo here:
> >>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> >>>>
> >>>> Design decisions:
> >>>>     * It uses the drm_client API, so it should work on all drm drive=
rs from the start.
> >>>>     * It doesn't scroll the message, that way it doesn't need to red=
raw the whole screen for each new message.
> >>>>       It also means it doesn't have to keep drawn messages in memory=
, to redraw them when scrolling.
> >>>>     * It uses the new non-blocking console API, so it should work we=
ll with PREEMPT_RT
> >>>
> >>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> >>> Unfortunately I don't see any kernel messages, and my monitor complai=
ns
> >>> about no signal. Does this require special support from the driver?
> >>
> >> It doesn't require a special support from the driver. But as it is the
> >> first drm client other than fbdev emulation, I'm not surprised it's
> >> broken on some driver.
> >> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus =
6
> >> (Qualcomm SDM845/freedreno), without requiring driver changes.
> >>
> >> Do you have a serial console on this device, to check if there is
> >> something in kmsg?
> >
> > Nothing interesting to see. Compared to the fbdev client:
> >
> >       rcar-du feb00000.display: [drm] Registered 2 planes with drm pani=
c
> >       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> >       rcar-du feb00000.display: [drm] Device feb00000.display probed
> >      -Console: switching to colour frame buffer device 240x67
> >      -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer de=
vice
> >
> > I did verify (by adding my own debug prints) that the code does
> > get to the success case in drm_log_register().
> > Thanks!
>
> Maybe you need to add console=3Ddrm_log to your kernel command line, so
> the kernel will actually use this console.

Thanks, that does the trick!

Note that I do not need to specify any console=3D kernel command line
parameter for the fbdev console.

With

    CONFIG_VT_CONSOLE=3Dy
    CONFIG_DRM_CLIENT_DEFAULT_FBDEV=3Dy

I see all console messages on both the emulated fbdev console and on
the serial console by default.

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

