Return-Path: <linux-renesas-soc+bounces-7403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D469375B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jul 2024 11:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA9072823BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jul 2024 09:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E6455769;
	Fri, 19 Jul 2024 09:27:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1080046
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jul 2024 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381239; cv=none; b=r77phBrgxT9RxfXZ256RnoDJ6ii1qsStEkt5jd20nyubSmNKUu1zz5rua0axOcnyOFq9nZfNI9WKDuyKraChqF6aIWiAusu6VqmER4rs1FivfaFVMSKp282K/zvg2iSc8WcSiKzSgCJpzb+jwextvlsdW88iC2U9R7g/AqYzoJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381239; c=relaxed/simple;
	bh=IU3mO+eflIRvC0cljnLDQAU3tY2pQn9r6aqWcXQnG6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DW+tF2kP3+qpL9hlDL8NzCbwtyZj14798HLCdZPAn2V8KbHw7H10FKemkg9opoatkzfqr/qt5rWJ7feZ8UYJO5KfJZQMuNgdDZuZeiZ0whj9TyGcTFk/I6U8KyoEeP6VSm9aS9+f6LGecP67H1yx0CQfPkwk9VOvFvoTQOOoJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6512866fa87so17630767b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jul 2024 02:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381235; x=1721986035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQQH9zQ0KuEmDvyjHiQws0xpaW4ALn+Sbzd9aHdjFFQ=;
        b=MhyZF3okhH/IVfx62MiT74XZ1sBy8udCCozk8gQH0zCxpNuVdzjmL58jDY+V4ZiF/j
         IybFqUpoHFvmsDlclMJ4aWZRarKfiCrc5GSQfVEuz9o9PYFljNKsmXmqjOSkRqWft/Ok
         fZH/3+sh8Fm8FktabfkuqEKjpe3PqPEjUfj1lOr9PCIr3MQBLuPUvTXh4idfSFj4cJBD
         DV+40X2ZiH+hjc2eSp5DP5n+7qmCgKoIYYrYGu3hbwNWcHfvG57rXg8hjVHekO5DVlat
         g/5UcsL3SitG6MTSE/qK3qM36LhwOnJzIDD3ZjBcIMH8AzCaAO4p0KO9mC6wQakB+HXV
         fKsw==
X-Forwarded-Encrypted: i=1; AJvYcCVxw22wjjDdriJuayF47z1ZM9Gp79GRcmv4pY/oDEnN0e/lW7N5GizFtLztZyf2bNcj5z9i9CTis4Co4C96HrY6Z8dmEV3X6z/deZZf7byKU6A=
X-Gm-Message-State: AOJu0YwN+Dk17GQ6XcR2zh3tNBtjvn5eUWNXh0pDGhJH1rin+sVVRJfI
	I71Kw4ltdaRX0L3NmnTfmLw5kUNqFW3V71nukEG+OIxfSgUE3Pa6kbuucnri
X-Google-Smtp-Source: AGHT+IGji8SIALPSg3h6kloW2z9UbzUcHx6ofgCdAIemSG/Jb1CvQCaBx0LyIyrqZ3byROz0nEbr/Q==
X-Received: by 2002:a05:690c:7108:b0:62c:c5ea:407 with SMTP id 00721157ae682-666a5b7f1bdmr56508657b3.29.1721381235556;
        Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695293ffdfsm3550917b3.61.2024.07.19.02.27.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso1861569276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSO4bCkZ683PgyPI3Dy9uci4WoWrnydky9++ewnKfDKvtmFEJdl74b172wRzZkXWW3n2HDfkUtKyEmvFV9PWGDWUaK7aYwKIyj/QzIwSl5f4w=
X-Received: by 2002:a05:6902:218b:b0:e08:64ff:9ff8 with SMTP id
 3f1490d57ef6-e0864ffa3famr708853276.32.1721381234832; Fri, 19 Jul 2024
 02:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407170751.LGZlPmUL-lkp@intel.com>
In-Reply-To: <202407170751.LGZlPmUL-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jul 2024 11:27:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUff1zMWzghwmP1QwF5Krt2aSF=cYe_Qfc4Mw-woCunDQ@mail.gmail.com>
Message-ID: <CAMuHMdUff1zMWzghwmP1QwF5Krt2aSF=cYe_Qfc4Mw-woCunDQ@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:topic/rcar4-fractional-pll-improvements-v1
 19/28] rcar-gen4-cpg.c:undefined reference to `__aeabi_uldivmod'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 1:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git topic/rcar4-fractional-pll-improvements-v1
> head:   f5a672b0ed67fa75083e13e5f82832cbe7a55e20
> commit: 4557d64e7540f8fe383458738b45f317e2235f7b [19/28] clk: renesas: rc=
ar-gen4: Add support for fractional multiplication
> config: arm-randconfig-001-20240717 (https://download.01.org/0day-ci/arch=
ive/20240717/202407170751.LGZlPmUL-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240717/202407170751.LGZlPmUL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407170751.LGZlPmUL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function=
 `cpg_pll_8_25_clk_set_rate':
> >> rcar-gen4-cpg.c:(.text+0x29a): undefined reference to `__aeabi_uldivmo=
d'
>    arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function=
 `cpg_pll_8_25_clk_determine_rate':
>    rcar-gen4-cpg.c:(.text+0x392): undefined reference to `__aeabi_uldivmo=
d'

Thank you, I indeed missed two 64-by-ul divisions that should have
used div64_ul().

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

