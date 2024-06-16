Return-Path: <linux-renesas-soc+bounces-6297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D823909CBA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 11:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1613C1F21286
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 09:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6996C181315;
	Sun, 16 Jun 2024 09:12:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E255774;
	Sun, 16 Jun 2024 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718529157; cv=none; b=FagMMqo+lyToataxIoxIUx/j6PAFADLgrAwJWhr3JQlr0oIi+eWemaDmM2I4o1yiBghSCKf0oRPgY5T/OWqA/GDqjAY3+/8lII8Ung2k+hpDxpiwXJ6AKGXyFLJaLG//B7Pdhbp9UjkiJ9XEouE3vQW47C5ncA8K2Tetrcoc+fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718529157; c=relaxed/simple;
	bh=+z62tjy2vxumRKSsg9vWvPyWHPQ8iFomJ/EHU/Jefjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+9wcYM1ZZikFT82hg0LVmUAMtoLrsqJTlfjN4boRpZMM/LLp1zdRy7yfeesPLH6KGXaDi4NJ+hcyvqLi946o2xRiUi+j7gjSIcgdOGVEcdWJdZQXyQL0BdqzJHFW/TAxn/8idDf0HfWy20UQq83IsmxAdK80+tCX16iErtt3CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dff302847a8so883424276.0;
        Sun, 16 Jun 2024 02:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718529153; x=1719133953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By6v0+YnSgsH+RWah/gSqD/GguB9CLtqyolfWDQlUF8=;
        b=tVmCO0S9AHuC+SzBT1D4t98iMLxQhfZEkMMjGxr6TpkMDNERR+3q0KzLBH2a4BZC/4
         l8cVqi+WXF9CxdI/DAptn8SEFHZ4nXwP8CZ5k13X0NZwXfHKyB3LAhpedGcQkwoDmoec
         VfAQ5SduBcbHeQhvpapg6M59PYhjNtvLfemVhMrNPh1A3kfRKPmP46X8xQgG5LEdSDd6
         bxVhMhBdmFtLmc+JuSeUuAM3SQyDuracRmgPyV16B9Q2ZqCqwM8mQ5mxIKcPQc+98pvD
         7UVJqK9EAkaokR3KC59LjSieUbLcg0BwDcOFejn7d5NqDphnu6Kcw2gK9H4q53RkFu27
         SbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO2bPyLYo15lkveDbjmAAx6OjsJ3SvoA2Cp+bpeGk2NBDEqVYSZnCgZ5vWrrrX2YN/PyKSlz0ljBkpEeij9NXbLR1vWmgOIxeMEIIw0h8zf1WhZNIW3yUfcyPnjaJKPxsIYA8KiKPBmsb5ZN44WA==
X-Gm-Message-State: AOJu0YzsFH0glSgUYc9cLXkcHJDOD96HuvU3Pwd1S5VuSJaSsFHXtkfj
	uqzSOl2oYExqvrtWYQtiuQ3vCzQp/gQdiUhhYnQMNalIbwalSVyL+OeM598f
X-Google-Smtp-Source: AGHT+IGdgiCG5UeJ741weymFR5T72ov0qoDsjkBZABsNPzknwhGNEEjATunXmNXlLf6Z+klfyxPgdw==
X-Received: by 2002:a25:2e04:0:b0:dff:2e49:50fe with SMTP id 3f1490d57ef6-dff2e49572amr2726110276.38.1718529153494;
        Sun, 16 Jun 2024 02:12:33 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048832c6sm1283980276.26.2024.06.16.02.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 02:12:32 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff302847a8so883414276.0;
        Sun, 16 Jun 2024 02:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVH8ClFyyBhmaRka7rFsZ3rjlMQYuFf4AD2uKAzA8XIggniPxzEIq2ZwJsEUwLYjtJXzoXZlVgYmrmWivTslpvHEC0KTzlOhKZoj7e07/OMXJmmrbVGd0aEWbYV20RIn93dTNuZ7L8QqdZSjkR8Kg==
X-Received: by 2002:a25:3dc4:0:b0:dfe:32ba:a877 with SMTP id
 3f1490d57ef6-dff153c36a6mr5976090276.32.1718529152591; Sun, 16 Jun 2024
 02:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com> <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:12:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: kernel test robot <lkp@intel.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on drm-misc/drm-misc-next]
> > [cannot apply to linus/master v6.10-rc3 next-20240613]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoev=
en/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-=
032053
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9=
b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
> > patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset(=
)
> > config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci=
/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> >    depmod: ERROR: Found 2 modules in dependency cycles!
>
> Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
> selecting DRM_KMS_HELPER was wrong in the first place?

Q: So how does this work with DRM_PANIC calling
   drm_fb_helper_emergency_disable()?
A: drm_fb_helper_emergency_disable() is a dummy if
   !CONFIG_DRM_FBDEV_EMULATION, so I guess no one tried to build
   a failing randconfig with CONFIG_DRM_FBDEV_EMULATION=3Dy yet.

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

