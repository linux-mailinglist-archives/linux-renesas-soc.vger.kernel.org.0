Return-Path: <linux-renesas-soc+bounces-11546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566F9F6868
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9504F16E31C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A564C1D54E3;
	Wed, 18 Dec 2024 14:25:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3151C5CDA;
	Wed, 18 Dec 2024 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531924; cv=none; b=iuaUGpo4ubs9wFZK9q2puMSfz0IZto2TLS/dpn44QFe1bvdl0NkH7SNpr5s6340BcxxL+U5KGNcbl+Ali8r6JudpFPa88ysZqmVsXT6PxAf98C9jSsKOGyfu8SSBTvlb4yjNtGZCr+sERgFSms3ORClJO7OICLIJCcYp/k/v/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531924; c=relaxed/simple;
	bh=1PRYfKDFNHYknOgkasH/vn1hDOQDb5VI0ay+a+6dn6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ+SaM8vCo5OgxJLoB4OjYCF4iHgK4AcAw/3GO+2QdqhYHEffzg+Fh8+cFDr6olnJk2Hctv1e4sQyVzbFps+HJQlGhW00SPS+8xUnZ15vON+Lpvllwm8ztkhR4bnWoDt/m+BJJgiW+W52Hb0AZ5uhpQkb8Do51GR7NvhiXBydbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b11a110e4eso1730578137.1;
        Wed, 18 Dec 2024 06:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531918; x=1735136718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yxt1SWi1sXmz7dW/c1lsqu9vq3V5BuLTAKk8e+TgbxU=;
        b=KTTLok2G8AuK97srLGZhlC7eRCVr68mgGAMR8pJmhylawPbXCP22Zp0zFIcAJk5lXO
         g8vhNm4SlffiyW/Nu8wCO+Hg2auGrUXRG49PF4FIarFk+k/LZ7supwFHx4m6l9c0KyI6
         wGAGwX97XlAhhbeUHwNoVUzbkawcs1GFgH+/A8/xih6Ho923Lmc9k4f38NFv6ybS/TWT
         0n4piT74Ku7fpiped+kr5ERNkCWl+oVhFHmeA2B77oVyQWBmwPNDzzqo59EGnJ/GkABo
         iWsvJ0/EMZ4lDEt7PuO5VJcULlTU9+FRMAPdwcfg1gSuLtAjcY9rc295Xk0euBU3NeV2
         FQqg==
X-Forwarded-Encrypted: i=1; AJvYcCWtp0thepiVcUGYkKV1GPYMps41UZswu8pCC5N7BREq2oeucgsh5Z9fKv+hjp5URtzi73FjBw+uerK4b8s=@vger.kernel.org, AJvYcCX7tjKVD18W8nNaogrlEZ5YPsBFuXj0+JH3nK020lHOBlc1emD/VONmn6T3oHiN3D7prTBkvMUaRb20IbcUG5n9B+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCs9u8nFKw4eAxo+pPcvIUCoX0lPkqFpjSVIvrnFgO9B+KmRYg
	NFY6cDspsdgFl4ePR9llI/5z/C4pNjmxDnj7obHvoemSaQE9KnClxN75/idc
X-Gm-Gg: ASbGncsyOw6u1bc4egXqpEAzRbPOE3dzgCnCczT3jnudxm58i5+fdALl5LKWG/dnCiR
	jcWI/cKFHir9RRSwR0ObCOjBNXf7eGrjCBcS9N/7446gn8yzUbBWQQOnlbxpXgkK8EuzGktjdjH
	qjDcE9H1TGSTNb9Shq0A+alwi/4w4ptL9DyNvX0CTytS+x8+gH4JX+SfdOl3qJ7YevoRb/UCPMJ
	BA5HX6NdPALH0+5XOCZQ6F6fNoH09XapqTZEjqql13SLMlWCGEBhxIPL1JUMEplmTewmQjGLtfX
	Nla6D8pNAdrYK5tG+L8=
X-Google-Smtp-Source: AGHT+IHr5DLIiqTjZmY2HW5rx2vKrpxjFE54jGVaPfIMa1jxqeVrHQWV5Ef8K4l49Htb6bg70RQorg==
X-Received: by 2002:a05:6102:3f0f:b0:4af:d487:45ed with SMTP id ada2fe7eead31-4b2ae6fe4c1mr2173968137.4.1734531918100;
        Wed, 18 Dec 2024 06:25:18 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab548bdfsm1585201241.4.2024.12.18.06.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:25:17 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so1635641137.3;
        Wed, 18 Dec 2024 06:25:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcZTSUss4yVOBPOp5Mvl5P//5cIcBT4+x+YAE42VnF0zMEJuuiitGwgMbNsxwK90kl+cT06fpno3w2fH1pbacfup8=@vger.kernel.org, AJvYcCXJry6vvQYPJ7K0oSpEQa08vsjqHrVdLpTNPVbZ/Iy4UhiXRJUafi7JfcxvLtTIX7f8yFrQ4J9IGIle/Uc=@vger.kernel.org
X-Received: by 2002:a05:6102:570d:b0:4af:fa1b:d8f9 with SMTP id
 ada2fe7eead31-4b2ae7270b8mr2457445137.7.1734531916960; Wed, 18 Dec 2024
 06:25:16 -0800 (PST)
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
In-Reply-To: <Z2LZozgxxQuusHVS@pathway.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 15:25:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWoC6SyDCRvBfGUj6CabmofLEhzkxEnEuPJ3mKMCwvw9A@mail.gmail.com>
Message-ID: <CAMuHMdWoC6SyDCRvBfGUj6CabmofLEhzkxEnEuPJ3mKMCwvw9A@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Petr Mladek <pmladek@suse.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	John Ogness <john.ogness@linutronix.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
	Caleb Connolly <caleb.connolly@linaro.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Dec 18, 2024 at 3:18=E2=80=AFPM Petr Mladek <pmladek@suse.com> wrot=
e:
> On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> > On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> > > On Wed, Dec 18, 2024 at 11:14=E2=80=AFAM Jocelyn Falempe <jfalempe@re=
dhat.com> wrote:
> > > > On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > > > > On Tue, Dec 17, 2024 at 3:46=E2=80=AFPM Jocelyn Falempe <jfalempe=
@redhat.com> wrote:
> > > > > > On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > > > > > > On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfale=
mpe@redhat.com> wrote:
> > > > > > > > drm_log is a simple logger that uses the drm_client API to =
print the kmsg boot log on the screen.
> > > > > > > > This is not a full replacement to fbcon, as it will only pr=
int the kmsg.
> > > > > > > > It will never handle user input, or a terminal because this=
 is better done in userspace.
> > > > > > > >
> > > > > > > > If you're curious on how it looks like, I've put a small de=
mo here:
> > > > > > > > https://people.redhat.com/jfalempe/drm_log/drm_log_draft_bo=
ot_v2.mp4
> > > > > > > >
> > > > > > > > Design decisions:
> > > > > > > >      * It uses the drm_client API, so it should work on all=
 drm drivers from the start.
> > > > > > > >      * It doesn't scroll the message, that way it doesn't n=
eed to redraw the whole screen for each new message.
> > > > > > > >        It also means it doesn't have to keep drawn messages=
 in memory, to redraw them when scrolling.
> > > > > > > >      * It uses the new non-blocking console API, so it shou=
ld work well with PREEMPT_RT
> > > > > > >
> > > > > > > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > > > > > > Unfortunately I don't see any kernel messages, and my monitor=
 complains
> > > > > > > about no signal. Does this require special support from the d=
river?
> > > > > >
> > > > > > It doesn't require a special support from the driver. But as it=
 is the
> > > > > > first drm client other than fbdev emulation, I'm not surprised =
it's
> > > > > > broken on some driver.
> > > > > > I know it works on virtio-gpu, nouveau, amdgpu, and even on a O=
nePlus 6
> > > > > > (Qualcomm SDM845/freedreno), without requiring driver changes.
> > > > > >
> > > > > > Do you have a serial console on this device, to check if there =
is
> > > > > > something in kmsg?
> > > > >
> > > > > Nothing interesting to see. Compared to the fbdev client:
> > > > >
> > > > >        rcar-du feb00000.display: [drm] Registered 2 planes with d=
rm panic
> > > > >        [drm] Initialized rcar-du 1.0.0 for feb00000.display on mi=
nor 0
> > > > >        rcar-du feb00000.display: [drm] Device feb00000.display pr=
obed
> > > > >       -Console: switching to colour frame buffer device 240x67
> > > > >       -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame bu=
ffer device
> > > > >
> > > > > I did verify (by adding my own debug prints) that the code does
> > > > > get to the success case in drm_log_register().
> > > > > Thanks!
> > > >
> > > > Maybe you need to add console=3Ddrm_log to your kernel command line=
, so
> > > > the kernel will actually use this console.
> > >
> > > Thanks, that does the trick!
> > >
> > > Note that I do not need to specify any console=3D kernel command line
> > > parameter for the fbdev console.
> >
> > Yes, the fbcon console is tty0, which is hardcoded for historical reaso=
n.
> > Some architectures use add_preferred_console() to enable specific conso=
les,
> > I'm not sure it's allowed to use that from the drm_log_register() code.
>
> add_preferred_console() is used when the console should get enabled
> intentionally. I would split the intentions into two categories:
>
>   + requested by the end-user on the command line, see
>        __add_preferred_console(..., true) in console_setup()
>
>   + enabled by default by a hardware definition (manufacture), see
>        add_preferred_console() in:
>
>         + of_console_check(): generic solution via device tree
>         + acpi_parse_spcr(): generic solution via SPCR table
>         + *: hardcoded in few more HW-specific drivers
>
> add_preferred_console() causes the console will always get enabled
> when it is successfully initialized.
>
> So, should the "drm_log" console get always enabled?

Good question!

> > I will still send a patch to add update the Kconfig help for drm_log, a=
s
> > this command line argument is required to have it working.
>
> I guess that the drm_log consoles should get enabled only when
> requested by the user =3D> documenting the command line parameter
> is the right solution here.

There are actually two ways to request it:
  1. Through CONFIG_DRM_CLIENT_DEFAULT, at kernel configuration
     time,
  2. Through drm_client_lib.active=3Dlog, at kernel boot or module load tim=
e.

Currently both options need console=3Ddrm_log on top of that, which
sounds like overkill?

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

