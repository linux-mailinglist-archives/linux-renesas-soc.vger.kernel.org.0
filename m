Return-Path: <linux-renesas-soc+bounces-13076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45313A32673
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 14:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E3E1881266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 13:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76263205AC1;
	Wed, 12 Feb 2025 13:01:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C7204F6A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739365280; cv=none; b=jo4ZA05QWB98s9wht/0qcBqLCCvAqQanJYKieaIt54O2AK1ykPBFYa+t8Yc2DWpwfe4RsF7XJ8li1Qbt8PNSh1YRJs5ni14NrhkA/Qp3PcyxYEtlYZSWGqZYm0V0ckrhfs+B+Cy9LY3X/u2GYEC3R+a4N8GI1kmihr5QBS1JJtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739365280; c=relaxed/simple;
	bh=3GwdOqa6Huktj8Sk4HWI3OLgpYkeLDMrdbIh/o3/XfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnpxmmxOvUyRzAjiHmMwHavbE9QoF0lTWPe8EEPMeDSSAnABZE0rMSphmGWs9nIrSvMsJ44OfWrVoru+wTLiHn64ugVBEWL4ErBogic4QRjRH3WkMatksdp929Rk0bYk/Mbv8uF6lfFYPw5VHw8EzZEibzLieTxMNnya5xoR98Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de4c7720bcso8314971a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 05:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739365273; x=1739970073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqwlo1LIhmw+DTyrdXQy6aDFaKpUFdk3sRubAy+VYoQ=;
        b=C01bTphPUNh+VWgxmxIClz8y88p51Uy7315czwKFb8TddeeLoEhFJCYmyTfCC3rOu7
         gLGtRARfufulP4oQKnfFpPUkCEx5VUzq7mVgipHo6xguuAR7b3iVUZEx4TIZGerzhEvl
         1pwmQMg11xR/lKehbc3Ccm1/sESgnw7S+PovEH8KwZ4Cg2u+expikD1xBBiQKXGu+Eng
         g+fK4KMixr8u2ME1e3sqoD8DPCRTzstwx/0kdquclNSU4Z0+g2MCJrEkTL+Fy9AKCHcg
         I3/u610c3h6v70PYxtoJgFUedbjP0qsoF3CaY/9FOQYKEsxUeYWBOgUsHPU8PLia4wYQ
         9Tsw==
X-Forwarded-Encrypted: i=1; AJvYcCVCZ6JRAG++umOMgWWJw9EVhKFkcCPwwwGMAauHjD7xhZRuvr+Uhs5O7bUvxQdaL8aobX8j7V30gfZKmM1f4jo62w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3FZOqRujARX9hBSfVtJIyHdaW7YrbzFCzZObh8lsfh9OVk4d
	H0j8QT4OwHoM0RrvX7lCkW3Crs59QGYUd4dLpmZLS3blDltoLWFufQVFuF/squ0=
X-Gm-Gg: ASbGncvf6twlF8XcXvIpD+Ckfd+QEAQVirJcZeaiNPdDyFQbw5GOEANmUzzRXl+VgFM
	grcg1VVITh10RkFRsVcKVToeETjbllu7DQXq6sBR/6ba+ZQ62K9J4yiVECHq1aWiwAOQD6K/CIm
	NBQoihd2su+DNM75StlYv9Lwa283hDStfuhze3t+xa7LaBYQESO0cV/DsbsWtlusGShjRnzuDIC
	qkMACw+wHOPAAKehgYNX7DDPJoNOgnN1BBguCssRZIASifNBFJ7PI0Bpo2Jw0JSUKzOH+XilSIE
	02C/Jubn2x+2iSyuXvPhwzoTDfl4hS5VeWO/+yxTCnSCrXpG8FQVTQ==
X-Google-Smtp-Source: AGHT+IHV0v/z91b4wYc0vAMD4EwVbY6K+kMEaiXB/aU3ndxIr1YD/tdL+VwepWe9JPyYV6eBaTfDeA==
X-Received: by 2002:a05:6402:354e:b0:5d3:d4cf:fea0 with SMTP id 4fb4d7f45d1cf-5deadde030cmr2482273a12.21.1739365272768;
        Wed, 12 Feb 2025 05:01:12 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ae5asm11493861a12.24.2025.02.12.05.01.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:01:12 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2599087a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Feb 2025 05:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQsG5VH5ixw7sc6brlv7RKZLsptlekpQD91/tXvU8SXGKshFFqs4EUhLraFpqcZOaLLYzmCQtZ7uASy+LRVi1/GQ==@vger.kernel.org
X-Received: by 2002:a05:6402:3510:b0:5de:44b1:46c with SMTP id
 4fb4d7f45d1cf-5deadd7504cmr2883282a12.7.1739365266080; Wed, 12 Feb 2025
 05:01:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com> <20250212111231.143277-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250212111231.143277-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 14:00:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXyQC8PkLs41Q_oz_M+8V2s5bOHzZvBk3i+5xczj1idw@mail.gmail.com>
X-Gm-Features: AWEUYZmv832T5hNNa4kf8fQJCfU-QfK-A-eTWcNkYD7xYLZES2nypQoNPsfWVKc
Message-ID: <CAMuHMdXXyQC8PkLs41Q_oz_M+8V2s5bOHzZvBk3i+5xczj1idw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] irqchip/renesas-rzv2h: Fix wrong variable usage
 in rzv2h_tint_set_type()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Feb 2025 at 12:12, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The variable tssel_n is used for selecting TINT source and titsel_n for
> setting the interrupt type. The variable titsel_n is wrongly used for
> enabling the TINT interrupt in rzv2h_tint_set_type(). Fix this issue by
> using the correct variable tssel_n.
>
> While at it, move the tien variable assignment near to tssr.
>
> Fixes: 0d7605e75ac2 ("irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

