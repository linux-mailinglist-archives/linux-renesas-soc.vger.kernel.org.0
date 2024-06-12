Return-Path: <linux-renesas-soc+bounces-6097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A327904CBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 09:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6EFA1F2543D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 07:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BACA16C699;
	Wed, 12 Jun 2024 07:24:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1445948
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177075; cv=none; b=X/uxsI7ya0InNNpgIYjEP5xR75G7bNq7cI9gPVbNffY7OAimqyv1WbrrRUqEI7nF1xbqyCweQo8mMr5k7KuRebNW3lfncgzpddb164S/3xpZUXtxb+RoUbVZMdJf0ou9xCQTzc7Xta8n9CL8srmf5q115p3gcww7Q2MTQECQhUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177075; c=relaxed/simple;
	bh=ZiI9zFu9SAsTDLyEX8WMXV8wWVi87xuH8/Kufw4nTNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhljBeWUDdR2zOBbU6eYBOCkRQegKJU/q6oYLuU2tIpXzAxOCHdIL8L2VVNDm01SyHcS44R3GCr1KXk6dYCo2fLo6gjJ4CMqgES7+mjg+FIXKnfwKcF+3XUPHfiLqvt3KYo9X/y6Vl2/stZyKn65slQtFIpwzxaFCdNcnd31SLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfdb6122992so1121750276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 00:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718177070; x=1718781870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeFPKbreJch0TwgOsbnEmSQi8HZBb1Xdf2vs1TiCa/E=;
        b=Fowmp/Z+lnQWNOT/zoY0FxS/mxajSc8YvGXm+1p4ZAC+0rixREpco7ytJ3p2SC2tdN
         Jseqd50Wu8Yr/ik6FjAQXb0KdxNqA45kSifflQ3Hqs7D23O/2vQAyG/rQnxGHag54/9x
         1At1p/or7mPBjMbgCbO/aSBWYM0HDKaLZFBe1hHkwVeLFCpVb6B5Z6oxfv1qIvDdZf/u
         z0NhbprvOyGL33irLCF+ED+6v1w6FGm86YnjQCW9Z1iCZHSyKuW4HCSMRynMF+UdAbzZ
         SAOi2myAWeVQmftFdUa+yIAGxT+MHs45LX8XIfZAu/WB+HaZgNvFvlca/0ksNSGrTSr3
         UebQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2knNFWeRwWVYfJdHALzA/RMzJRElXktSq/XfARdSyLrGGsjBm2JYV4LSLX4dEBzTgkh2XruNRrZK3ZCYxGdvhkmg/YDqzAtE119oMBFp36Mc=
X-Gm-Message-State: AOJu0YypBw/p/3krPPup26IwFNrfoMTb5UTavOkijuU4uWnEtZ78I8+j
	n2rUMST0jS7Rc/JtVkCbUSmLyfhNeiVqib7I3+3RI1uet5X5kAPNsbnUnc9e4Mc=
X-Google-Smtp-Source: AGHT+IE3m7ahCI3Y0KLg3bamU0V707fhsUYMYtRD4iRgKb6LAPdkEtjYX/iQhB+C//8bUpUKPlyX0A==
X-Received: by 2002:a25:dd02:0:b0:dfa:57f6:d629 with SMTP id 3f1490d57ef6-dfe670644d9mr818452276.25.1718177070521;
        Wed, 12 Jun 2024 00:24:30 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfae52fe97asm2215060276.34.2024.06.12.00.24.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:24:30 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso522308276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 00:24:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXq+Ju3lOh1llxYpyOIyxFq0Jou0Sn5ReKy8ehgK35eiDsu/XINJP8AhxfmMksBlrIAdbz1lof8+bVDhSACiDobrw1+CxwMcTKHpc45qmNGorE=
X-Received: by 2002:a25:b125:0:b0:dfa:5748:124c with SMTP id
 3f1490d57ef6-dfe6606d5famr828847276.10.1718177068915; Wed, 12 Jun 2024
 00:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
 <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2024 09:24:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQkrLkwersttFEoR-oUsb4-EMEVXHs8JTdmz31X+DeAQ@mail.gmail.com>
Message-ID: <CAMuHMdUQkrLkwersttFEoR-oUsb4-EMEVXHs8JTdmz31X+DeAQ@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Doug Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Tue, Jun 11, 2024 at 7:33=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, May 29, 2024 at 5:16=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > This is important because drm_helper_force_disable_all() will cause
> > panels to get disabled cleanly which may be important for their power
> > sequencing.  Future changes will remove any custom powering off in
> > individual panel drivers so the DRM drivers need to start getting this
> > right.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case o=
f
> > OS shutdown comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c30=
7a6192efabb4cbb06b195f15@changeid
> > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > v2:
> >   - Add Reviewed-by.
> >
> > Tested on Atmark Techno Armadillo-800-EVA.
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> FWIW: I've created a patch to list DRM modeset drivers that handle
> shutdown properly [1]. For now "shmob-drm" is not part of that
> patchset. Assuming my patch lands we'll have to later add it to the
> list.

Ouch, keeping such a list is ugly ;-)

> [1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> I will also note that the subject/description of this patch could be
> adjusted. They still reference "drm_helper_force_disable_all" which
> should have been changed to "drm_atomic_helper_shutdown".

Thanks, v3 sent.

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

