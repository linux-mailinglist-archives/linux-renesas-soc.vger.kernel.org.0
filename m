Return-Path: <linux-renesas-soc+bounces-1621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53929832AE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jan 2024 15:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F11BB23A92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jan 2024 14:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F52052F97;
	Fri, 19 Jan 2024 14:02:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D14EB4B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2024 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705672940; cv=none; b=c5e6UiRvJMb7XBCObms9/jm/9c1f/lt4F3v16XZFkTjA0pCEP4Pbt8z+8yoeP6rXygGUYR5xPla4Q/uPBRPP4FJBqkSbA+6ypvpBn9x0NqZgUSEJ/odJGPV0ymmWShsJ2pbMMsg43B/9M0QOJw0JNGRrSKY746f+QvBr0VGeSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705672940; c=relaxed/simple;
	bh=NBWhqZpL3bnUQx+gDX3WOHPAsmG8A+ayw581UpQYjkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRmWBeXqsFGF2Oe/kyFKduj77f7EzGRwrRxre4AwgfTnf4LNSYbQQKBk+1e/5ZF6B4TH3mOvHGiSe2LcFN6uMVSJ3t1tpsF7vfl2al0fY3cSjaJz00eeoIYEIZUbRTkSX7TesChO2yTDEw42X7I10RuQD3B8xmvP0xcFrLttHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f68af028afso6724877b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2024 06:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672937; x=1706277737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPmOnRQasptCicfyYxyrzQK4txgf1yyc2TzPZ7CJsy0=;
        b=uB1M8CCGJluqcO3EbkEXCRns1O/S9djzRbKbRr8Xb1+BagL1+dGPpeUxMX1ccv1W5o
         VxvfhJug/4TnLiyDdzYI3IffcMjaj8w14yTiMcSuMZLCBs7CnI1v9pcY5mVXfjLsMijG
         2Lv/4pdzHQTh3NQwElXa9evG9RP+KoYWYlrIwGwULmQE7y5nyxnmTQ9xjSYhqMvkBJgH
         2yqPPBqMe3RSNnj0SdCA3AIv2QAdiBO7+2lkp/BrOXCc4hv/79h28qx1tu6SjTxwwe2d
         Vg1zFpCNF2AQO+hh2MGBd81qtrNlxM5CYUhJD2BxwFMsRLQlSB+bgfGDnipH7DuMbk4q
         2ymg==
X-Gm-Message-State: AOJu0YyZcZEXQzgJ16G+OWw7gg6IkoQAfEtUenOzPZrr3RahztLSshLO
	93zMRSggFkPDm+rziLShEn1I7wf13gleKsN2L2YTAy5+y8QeMw4t0XYggP0ZrJg=
X-Google-Smtp-Source: AGHT+IF0ERbHxeNqzZLqxJlaKu3IW+yfFV1ttTZqgbvXr4YMgOv4f6iFGxJ7MzGhXxGwVnGykY7X/w==
X-Received: by 2002:a81:6f04:0:b0:5ff:6c4d:fe34 with SMTP id k4-20020a816f04000000b005ff6c4dfe34mr1936077ywc.48.1705672936915;
        Fri, 19 Jan 2024 06:02:16 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id bf22-20020a05690c029600b005d0fea7ad01sm7386100ywb.122.2024.01.19.06.02.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 06:02:16 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ff45c65e60so6865277b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2024 06:02:16 -0800 (PST)
X-Received: by 2002:a0d:cc10:0:b0:5f4:8b0c:dff6 with SMTP id
 o16-20020a0dcc10000000b005f48b0cdff6mr1946059ywd.83.1705672936598; Fri, 19
 Jan 2024 06:02:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202401192114.sNB5eWkI-lkp@intel.com>
In-Reply-To: <202401192114.sNB5eWkI-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2024 15:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuMChWnnEOh=8k-Q9yK9g7b17-Qb6x0FdR3dP3hNp3PQ@mail.gmail.com>
Message-ID: <CAMuHMdXuMChWnnEOh=8k-Q9yK9g7b17-Qb6x0FdR3dP3hNp3PQ@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1 17/22]
 drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain
 integer as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	Simon Horman <simon.horman@corigine.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel Test Robot,

On Fri, Jan 19, 2024 at 2:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git topic/renesas-bsp-rebase-v6.1
> head:   f23d103b0a307c5339994c410f09ac77b374629a
> commit: a7e448b5460131be0eab090896030c6259b32375 [17/22] can: rcar_canfd:=
 Add transceiver support
> config: powerpc-randconfig-r113-20240119 (https://download.01.org/0day-ci=
/archive/20240119/202401192114.sNB5eWkI-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240119/202401192114=
.sNB5eWkI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401192114.sNB5eWkI-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain=
 integer as NULL pointer

Thanks for your report!

> vim +1852 drivers/net/can/rcar/rcar_canfd.c
>
>   1849
>   1850  static int rcar_canfd_probe(struct platform_device *pdev)
>   1851  {
> > 1852          struct phy *transceivers[RCANFD_NUM_CHANNELS] =3D { 0, };

This is fixed by commit 8e85d550c127d8c5 ("can: rcar_canfd:
rcar_canfd_probe(): fix plain integer in transceivers[] init") in
v6.4-rc1 and later.

As this issue was reported in an old stale branch, I removed that branch.

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

