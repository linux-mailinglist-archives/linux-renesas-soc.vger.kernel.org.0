Return-Path: <linux-renesas-soc+bounces-6340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF490AE2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 14:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A63282B2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 12:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2923197549;
	Mon, 17 Jun 2024 12:49:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA6186294;
	Mon, 17 Jun 2024 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628574; cv=none; b=c37oPe9H5g8B7B+RYPFDwns4Ze6iBTs8UmMdqbusj9NRblzmmxDwgcJOGm3tpn153DjqRjYRVfTcJXDyA0fGzxqO0VUQm4HY5aT91lXP+GHFEmdBYxgjbEzJQSS3BLFg458ql/8BBGEQaOwKhxl/6uXhIau0xSpNdM/JJdLo39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628574; c=relaxed/simple;
	bh=xsa79N3UFMsp5ymHlsRvrImlmmD4hQWT4UnHTtH2kNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvFJBtp3OW2HFH8Ufn2FnUkto2L2A5w3TjtCM3d3WjXMyg4mKcI5zchni/8oMOT5jAGeO/Nedz/x/BJcziAY/jd20mNXhvPqIdn38igX6hhoux1y1kUV5ySCM03xtjblP/HhpOjU4tixeFGEceneHOlx6Lc8QHhTPyiaJ427uio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62fe76c0a61so41008117b3.0;
        Mon, 17 Jun 2024 05:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628570; x=1719233370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MInDILVs50Qu8wliYXAyjIL0mV2etkuFS+an8Yk00+w=;
        b=AtfeLWd0JhXuMYl5BpfG4JdBfRC+IHF1GqQI8wQ3ny8acPTWELgQspwS4MxlU9KURj
         iodpsy2/LmHW3Ul+CI5Oabf8MJF4M7k+dlpELJkakjwaqT+rZdAu8NN6HxFx248Eb5q7
         NFSrBEtAorqXzmmhFcSL5zq8qsp7n2vEPdYwsDEeLhexxH0MS84oXfq0d3UIOBLccgrE
         SBhu6B7MeI3Rdr+dJ6+BhCWVw4w+6uk9GMBuMgTLR3C17EBK7Xv8IlhapEAPUiZxZiee
         6sqptTWqjEycaxTgiRVA6Cybpdj44IZZUS06uUKtgNgVYmjolZfP+20LOQq9FzeM3jmK
         gOjg==
X-Forwarded-Encrypted: i=1; AJvYcCWWzyZEw5lMOTOpzrsDxOthedhD38QrmS0wboQGhD63PjHyQ1PIiu89iwG2lpBCdGi2J8eJWyZzfj1PpXGvGnYhz9JVwiCH7aBE+67OSYsoplKNTIXpQCjfLgnpzVqwJ38trZFNlKF5ThXjr1EDHQ==
X-Gm-Message-State: AOJu0Yz8P5B66CGG7kH2C2jKAkkILP2bUQZaJ+NhUiqgF76FHlZJnhl+
	yHjgmnspZ0OOXUVgGwwVi1gOk+4qTrkLNAsdWBye0Mzsy9FbQpomPJhNc1JH
X-Google-Smtp-Source: AGHT+IGnHi2iKlqVwYdQEwNwUaR8HcfBXaWg5bDL+MijFs9r+5v34lTdO9GeHrh/Eh/2MEVb+8K38g==
X-Received: by 2002:a25:ab6c:0:b0:dff:2d23:962f with SMTP id 3f1490d57ef6-dff2d239ab3mr3443047276.19.1718628570495;
        Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a8dad2sm1881465276.61.2024.06.17.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-63036fa87dbso31796397b3.1;
        Mon, 17 Jun 2024 05:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWEsx+bbckvgrYVRnVDwC6Dc57ygHmZs1KY3Do2NCrmQ/zuTphfT9t4etTBfKrmp+OrV/FxTmLzegvl3CQ+HU2Hf4Ma3c4/DB/6pgVSq7xjks+0TxCnb55hYuY29rnTP0iIe8vD1AIaJpi+Fntow==
X-Received: by 2002:a81:920d:0:b0:632:b001:cd49 with SMTP id
 00721157ae682-632b001cf08mr51601307b3.19.1718628570046; Mon, 17 Jun 2024
 05:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718305355.git.geert+renesas@glider.be> <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
 <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
In-Reply-To: <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:49:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Message-ID: <CAMuHMdWNUhQqmbEELwbmSomLbwE-xgmVZ2Hv5WqDfw8Mku34+g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Mon, Jun 17, 2024 at 11:59=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> > Re-use the existing support for boot-up logos to draw a monochrome
> > graphical logo in the DRM panic handler.  When no suitable graphical
> > logo is available, the code falls back to the ASCII art penguin logo.
> >
> > Note that all graphical boot-up logos are freed during late kernel
> > initialization, hence a copy must be made for later use.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/drm_panic.c
> > +++ b/drivers/gpu/drm/drm_panic.c

> >       PANIC_LINE(" \\___)=3D(___/"),
> >   };
> >
> > +#ifdef CONFIG_LOGO
> > +static const struct linux_logo *logo_mono;
> > +
> > +static int drm_panic_setup_logo(void)
> > +{
> > +     const struct linux_logo *logo =3D fb_find_logo(1);
> > +     const unsigned char *logo_data;
> > +     struct linux_logo *logo_dup;
> > +
> > +     if (!logo || logo->type !=3D LINUX_LOGO_MONO)
> > +             return 0;
> > +
> > +     /* The logo is __init, so we must make a copy for later use */
> > +     logo_data =3D kmemdup(logo->data,
> > +                         size_mul(DIV_ROUND_UP(logo->width, BITS_PER_B=
YTE), logo->height),
> > +                         GFP_KERNEL);
> > +     if (!logo_data)
> > +             return -ENOMEM;
> > +
> > +     logo_dup =3D kmemdup(logo, sizeof(*logo), GFP_KERNEL);
> > +     if (!logo_dup) {
> > +             kfree(logo_data);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     logo_dup->data =3D logo_data;
> > +     logo_mono =3D logo_dup;
> > +
> > +     return 0;
> > +}
> > +
> > +device_initcall(drm_panic_setup_logo);
> > +#else
> > +#define logo_mono    ((const struct linux_logo *)NULL)
> > +#endif
>
> I didn't notice that the first time, but the core drm can be built as a
> module.
> That means this will leak memory each time the module is removed.

While I hadn't considered a modular DRM core, there is no memory leak:
after the logos are freed (from late_initcall_sync()), fb_find_logo()
returns NULL. This does mean there won't be a graphical logo on panic,
though.

> But to solve the circular dependency between drm_kms_helper and
> drm_panic, one solution is to depends on drm core to be built-in.
> In this case there won't be a leak.
> So depending on how we solve the circular dependency, it can be acceptabl=
e.

So far there is no reason to select DRM_KMS_HELPER, right?

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

