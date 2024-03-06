Return-Path: <linux-renesas-soc+bounces-3491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C78873029
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 09:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44501C22A89
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 08:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C25CDE8;
	Wed,  6 Mar 2024 08:00:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446235BAFD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709712031; cv=none; b=S8ERdrbKCSi2uY+POGrVcqsE7tY4AUpFlPfNNke4BNE/Zlsno8FImmLOUnQukO3Q2ls3RxjHlZuRTtpzY95qb5j78s21shjzUVdK9pfTKG0WUVlilK6UhxTxcDTEdjn6r+9FspISvcYh1qjc69k4BbOJH09TgRguC84L7BANvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709712031; c=relaxed/simple;
	bh=P8YwVMpnErwixhUR1Mbw5c5QEH9e2xTfI7Qrxmz/VcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9LD98Zeu723F4m/qYBMUr5tmoLTApDghdbySVTnlwpUU655Pt8ZLfUqNdjAKpkyqlYcuoIXIwOmEtfgm0xmp+uZJaZ4Ehf8QtbDUBejVNRqVAuvyCa4gs47TKZlQFwykHmK0h+OLab+hhJAkDnRCCmdbOlUnAFirZ+T2EsLv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60978e6f9a3so67978267b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2024 00:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709712028; x=1710316828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIq8A3I+hnCbTkrRhH0vKNCZiun3rTR9oQdT+6QQC+0=;
        b=jsfBVNvI7kvmW56feMfv77QfYtUnciurXb1cOpYD4sg+nB+GCVrQJLBDc98KgsNivm
         pFU8e5BgGwNzmC5JYhf2dWJ4ULkJgPRCItWtMT391pewMYM4LrvJIeFQIoFzzHSU1rPV
         4aDo9ciz90o0Y8qplQtUJvfPth47xICn+JU1uPwrDLNhqzB9XK2vyGFwA1YrtLrpfd7R
         GrCUHj0B4mtah/ig+Fqaxb2Lbcttz25LnOX8d5jFIPtLD2MCifmzn5dp81MwRkMv0HX0
         NAigORCDyeWkTLhzVj/VSB9YlcSyVQBiNC4Kimq6qhhgn34hRv7ilJX0ZpJQuATqwoHb
         O2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT8rP8II0qLsc10sSBKw1K1Aw21AwWiDPGsGYeZyLaZYV69xQCa15z/jhsYjvcTKQ2adO0C9zw+I9fmHRmprvCHsc+hY2jXYrdQ8wAr7Mn06A=
X-Gm-Message-State: AOJu0YzMbhlZOnF2YZZ6d03VARRfSvUxHdZv/Iv79n7fLKKQfxW+xtHo
	YzOMuVi7F7VzHhVKzpXWKrTBX1NCHWrZSWMzbdwBaPzSUfi1wsvHHL/SIC10Xd8=
X-Google-Smtp-Source: AGHT+IGh3uzO0jJSCLwJUVq20l9+AcVmL99uok/NXr0cl+ta4NFLFJIF17UEW46DLJwbA8R/Ww1PuA==
X-Received: by 2002:a81:5e54:0:b0:608:aec:7deb with SMTP id s81-20020a815e54000000b006080aec7debmr15245526ywb.6.1709712026478;
        Wed, 06 Mar 2024 00:00:26 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id u125-20020a0deb83000000b00604ad97f2d9sm3594776ywe.110.2024.03.06.00.00.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 00:00:26 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609408d4b31so65610987b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2024 00:00:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/WB//yL5m2yndws6+m8TRT/7GRQIz/zPS6dm6ZGCf64E13fY6u1gzijJGyP1RPfuMuh5ByDKL34tw96GuZa5WTZzC49mS3F4VnAxw76ENwug=
X-Received: by 2002:a81:8494:0:b0:604:9b50:e973 with SMTP id
 u142-20020a818494000000b006049b50e973mr13895375ywf.44.1709712025743; Wed, 06
 Mar 2024 00:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202403061131.zzApAwRB-lkp@intel.com>
In-Reply-To: <202403061131.zzApAwRB-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Mar 2024 09:00:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7mAzU=a3wqpsBaE0fo71-_=66X5NSvsLJDTiiZ5_k=A@mail.gmail.com>
Message-ID: <CAMuHMdW7mAzU=a3wqpsBaE0fo71-_=66X5NSvsLJDTiiZ5_k=A@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:master 34/52] drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3:
 error: field designator 'lanes' does not refer to any field in type 'const
 struct qmp_phy_cfg'
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:47=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git master
> head:   0a76003de2b9029d5898c23d23ddbb90f5a74580
> commit: 98177a93f8e405ce41969db23f5bf4766aa6a1f4 [34/52] Merge remote-tra=
cking branch 'phy/next' into renesas-drivers
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
40306/202403061131.zzApAwRB-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
25f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240306/202403061131.zzApAwRB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061131.zzApAwRB-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):

> >> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3: error: field designato=
r 'lanes' does not refer to any field in type 'const struct qmp_phy_cfg'
>     1340 |         .lanes                  =3D 1,
>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~
>    7 warnings and 1 error generated.

Oops, that's a bad merge conflict resolution on my side.
Please ignore.

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

