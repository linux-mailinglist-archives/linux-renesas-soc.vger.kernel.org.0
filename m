Return-Path: <linux-renesas-soc+bounces-19779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB6B16209
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 15:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9303ACEB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B7C2D837C;
	Wed, 30 Jul 2025 13:57:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF8629DB8F;
	Wed, 30 Jul 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883830; cv=none; b=jCMpZrsybnQdg26hOPXL3zBn1biBp5II3baDz2YnTHWfcpthW44/oIT1avoPKwd1enUPzIkVSfWRcDFAe+FxLCEQcF6rldLL01WZLYbqX6E8elBHPTePQUpewQy8qYOgf2mOhdOecRjhlD6wDB+XfRhlRcClscmhASxpcABrb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883830; c=relaxed/simple;
	bh=pnXS+ZeQrAV806NHxF70MyvcJe+ytbXZbl1EeUCQArQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNnS4Ua0hbPYXsoUZ7LAKHGiinyccPi8toJi+6oFNbbofcqGHzrYFzBfet+RwdJp7Wva4aVj0/Ri1tgo3xFy3JcF29gtHqfdzPL9J0roWHsGtrLOjkL10EHKYSWbi0YN6/EG8jN//0mW8AASd/7L8HhXTa9/dQLp+rHKyqSeRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5379498da7eso681974e0c.1;
        Wed, 30 Jul 2025 06:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883827; x=1754488627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tXb90Hs6p9aqwd3uCfNog+BrrHi7uqFWUQ414hzBWg=;
        b=JjJ+0vFPgZdFC44u4WvQa2Cq0sDot/hdnsicaY7TXS3DY63anrCy9f9hlGJpw4awKE
         KM2hdznu5hvqo9TMKLKaDenHHfADsaiJWuTYIzYXdTk8EyEhYCRKqwfko+AMPCfVm6Z8
         ghTzYCy9irRAcfkX17Xpco/MXmJ+gD94ed9KQr2RNKZ5O6E+rIlATizASqw/RFowuCnu
         bulpjDnms3BYvgNb/LjB9VgJRyxBJcf2RnzNcegt6r07n4c+3O1HMhxMFglD0MIB9Qs2
         Jit6zillTb9/ZihOshc0knpCex59ilUlulMUpmtr0vytwJEk0F60HrAqlfbXA8Py6SGb
         w/+w==
X-Forwarded-Encrypted: i=1; AJvYcCW2GY50b4COZp/v/blrE8EIFuf9C2tT3XKH5qYowqUfUe4Ja7cHheaU50no8ApnQa6RKN5H/V4QSoejbdkmn7TMBWs=@vger.kernel.org, AJvYcCWGxS8AiTTWXIEbS43p+8x4JzLlIXyfT3SrMJIBpuxMLs+94K/belgHSehJ4sNqs6Fh6h4vfNHFsTZX@vger.kernel.org, AJvYcCXVGAitdQ/ezL3U0Qx39MR/elQU7ioUt9ICbyIqd2hIjQM18DnYJB/Hcg4bfHvYXlLmvN/zPfRLze3lmj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNj7sfDTa+Crn/ewAWZ5Tb8xPgNQVwcXEJYz0FqsCS4bwrT+y
	b3hbSa4yBAnf5T+Cc0kI01BI3eCRXaM4nBlesz95WVAMpdOVmGRF5ZenD0ApT+ZW
X-Gm-Gg: ASbGncsAeK4SoOfqH97H+TVSB944HdGhETi6/+YA7mBY09H/x2unryyKa0hIwaNGi9Z
	vkWxMboNfdrq6jAAE8sw626MmYUV5cnUYzUglmFIWHD/3QPTav4eKH48/f/COUk62FMRKUzO7Va
	49Tn7sxHSduPZu8fFl+bmU/6AT+GidM3tZKnqqBGCJlFz6PeACfk0hDsl0Dv4IAI7fiQKnmYRow
	3x1qtNva/Xc4Mv2W3LKTAKBzfP5RozAmp2nzfBOlHqi0hdW5xnlvyao95V2zCjc1VQHUI6tVD8P
	PH/quYRaB7amZb1rgSzu7ce4BJCUDOrMK4PAOzdCb4i8gxKS5IFcTqOFH9CzPqcq/9lDxp8p0Zg
	xmDgt0JNpbJ7Gz0tI0UObnYK7tqup+YlbEHYGO3goyJs1zb6cNgfHNEjncIA/
X-Google-Smtp-Source: AGHT+IGF+4fTgVGbY887fRxjZOiCsKawtz8flH3PkdMnJRiWOB+EN9J18XFayk4YBksdoxvob1ok1A==
X-Received: by 2002:a05:6122:201a:b0:538:e454:ea8e with SMTP id 71dfb90a1353d-5390f5fe1ccmr4555224e0c.7.1753883826931;
        Wed, 30 Jul 2025 06:57:06 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e28ca2f0sm2749361e0c.36.2025.07.30.06.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:57:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88ba6bb90d6so525156241.0;
        Wed, 30 Jul 2025 06:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw7/cDeLJaSECwSahl9l+An8fR3N1odvOyIHFQRlDd1QioC35IGe7xNHtBL0Xkbjaeqlp4cgoFFePxDkA=@vger.kernel.org, AJvYcCVwU2r8kVgcBx9R0LPd2RQsLwtnTzUhIrxkRD+HFpI/MmQJQB1zVXmMyCnxuygVF0TCOTwgernVovZm@vger.kernel.org, AJvYcCWweix0x9RJhj0X294XG5VJCR5EgSEaAf3mIEu/Fq0Q6qmxb1guhTuh3WDZEo1CoM35+QwIIU7Y2zGidri9MeR85pc=@vger.kernel.org
X-Received: by 2002:a05:6102:30dc:10b0:4ef:a46d:dcaa with SMTP id
 ada2fe7eead31-4fa77918e19mr2727446137.6.1753883825406; Wed, 30 Jul 2025
 06:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
 <202507301421.AmWhOZBk-lkp@intel.com> <aInjE-sduVbBRmJx@shikoro>
In-Reply-To: <aInjE-sduVbBRmJx@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 15:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
X-Gm-Features: Ac12FXxXrlohX7L8lLksOtpqFo1L0Wc-yLeqGDDQ2dNNpRDdPIsNf4pmzEDKaN4
Message-ID: <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: kernel test robot <lkp@intel.com>, Biju <biju.das.au@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 30 Jul 2025 at 11:17, Wolfram Sang <wsa-dev@sang-engineering.com> wrote:
> >    In file included from drivers/mmc/host/uniphier-sd.c:21:
> > >> drivers/mmc/host/tmio_mmc.h:249:2: error: call to undeclared function 'ioread64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      249 |         ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
> >          |         ^
> > >> drivers/mmc/host/tmio_mmc.h:255:2: error: call to undeclared function 'iowrite64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      255 |         iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
> >          |         ^
>
> Sigh, then the guard seems to be ARM64 after all :(

ioread64_rep() is defined in include/asm-generic/io.h, and powerpc does
include that.

Perhaps drivers/mmc/host/tmio_mmc.h should just include <linux/io.h>?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

