Return-Path: <linux-renesas-soc+bounces-6296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFA6909CB6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 11:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FC5DB214FB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0E17E464;
	Sun, 16 Jun 2024 09:08:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B855774;
	Sun, 16 Jun 2024 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718528924; cv=none; b=AkV4N2G4TsyKl3yi/Bhu+1w1lGpRFS7DY/shGv9cP9E7ZkZx16KkYH8zUiP4UjLUebZ7NOfwdV7encnrSJryFt76G0lbSAFpvlYxw0gF1Wbc3/0sG1xYYVMpsVmiZqc+VCIsN8H3O31TnTKQbCW+2iHm0V+gWNFjIxjIdF+kcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718528924; c=relaxed/simple;
	bh=IXt0T2dIV4D47RVWneFjTLBpb2BX9j6tjpPDQQN7Aq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5Bm3zBup9bI1LBNlbpY+Fc9bZK5noXa5cLcmZJkU1g1basPQ+joom3luyRqdK8DqdGAwHKf6JqWErkiwYWAL3SbkkjNDjJT3wweSvWLS4205ZLOU7/MFYPa15Rm6Y/lPI75M//7gsNMBzxdeAvGp96Q0wDbuoQjXwpBjjEzM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso3435919276.0;
        Sun, 16 Jun 2024 02:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718528920; x=1719133720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtpOZr/trZtltPf6YFqTeIEX30vShCauXV7YYWeLaM=;
        b=rPPhcyYIOCnl0rGq+FH1d8m83c/MMWgBCC21VyP1fxYDb383xSjtvpb+7Jwkqy/Gii
         Kls9quuNT+WxDGXihI+msy97w15eJ51yOkQ9/bPkM6r8WI7p+9K0wooAh3uRuhM9wuzo
         x7Z65T08Urpn2kl7sBE43DZhZl+/mT9sIci6U/URbJRiJEDzMLOdKOatT5BlEn3q0NTD
         iyUZRMFiarDn9q0+OmRSQU7eo85Mb4zuIVTFK1U4iuwBEkJKg1q3W7f3XoXBb2ckn3dl
         ksSKX8Ann4+pUR7c4XyG2VcdBV/gwzK3io1D1V9JVKGRTQcEMNA7X6m/IXlUROyAdvoF
         4I3A==
X-Forwarded-Encrypted: i=1; AJvYcCXwrmIMTwfTLoTGKDbnt5H0XPbCYfsFDVU9znOpjkuxktUB5chsjz7dMQBew/ZRAbP1g5mfH1IEGNjCHhfGJ/Z9zhorucIjxsJ2+dLW7EYd4Zs7OssOKX9TgxzYuo+CgvunbnX7roauE20H+6bY0w==
X-Gm-Message-State: AOJu0YzTw58LnFD+uLDXVxknpytK+tXC/2Jp0CCh+Ec/BugEPedxHAb2
	ctx5d+hyU8t+1aVmIh6LihpH/NvCKnsQVg3xfisELYGv2ikLsX+vPIWj0d1y
X-Google-Smtp-Source: AGHT+IFR7wWLTVzgxSqllqGmIjkA9gRmREAyRWuKJgrYa3UPCdXNkqvvp/f1IAiqb1sS2OHOzL6Flw==
X-Received: by 2002:a25:df42:0:b0:dca:c369:fac2 with SMTP id 3f1490d57ef6-dff1535459emr6347185276.3.1718528920266;
        Sun, 16 Jun 2024 02:08:40 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04a8ba45sm1314667276.58.2024.06.16.02.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff13c4cec0so2699479276.2;
        Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjtBNcvxPfD0Xa9FSIqR52XRWOqfjnTsMVwIPvipVQxSSLzxlkJvRVas5ohUHIzhmv9vg8tVL7Ul+o68e305P/iR2CURCTmok9EDnqln1R3XVnLyx0y0QA9VdYUQcsgaI5PeFAcLfIw2qTx1xIXw==
X-Received: by 2002:a25:fe0d:0:b0:dfe:3e88:3649 with SMTP id
 3f1490d57ef6-dff153abc7fmr6851815276.20.1718528918970; Sun, 16 Jun 2024
 02:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
In-Reply-To: <202406151811.yEIZ6203-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:08:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
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

On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on drm-misc/drm-misc-next]
> [cannot apply to linus/master v6.10-rc3 next-20240613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-03=
2053
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4=
286967ee.1718305355.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
> config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/a=
rchive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>    depmod: ERROR: Found 2 modules in dependency cycles!

Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
selecting DRM_KMS_HELPER was wrong in the first place?

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

