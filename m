Return-Path: <linux-renesas-soc+bounces-8492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755FF9643C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 14:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99ADE1C22AAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F401922F2;
	Thu, 29 Aug 2024 12:03:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375AC18CC08;
	Thu, 29 Aug 2024 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933001; cv=none; b=OyDGy67hPqvUW21wd0xyWpDSPLQggALMishoOEi7pNabEBCS+nCC6kq5l/G8YVcMrYvdsluoF45bLcAxxtE02+wl/pRzO/IkkcEEU3Px5PtA1PlqfQvEOREOYfXHR0U77HpkQkflIkwGCB1sj9IeQu9hfYGFjeWDRjud1sN62OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933001; c=relaxed/simple;
	bh=MctYYbur645rv9lxw2KQjlHPbSLQjT9HGLGlr5z+OO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNppPYJ4qXcVDJsN2AZZOkOTzT3Bwcs22Z8AKqyozrF7RkjHsX4S5GDW69gFSHiOufuZDs/nXVlJOBSe94r4u3rJll9T/9Hcttn2NnAuMOwGP6s0uOy8PehgIvWd2ISIFytdWTcy7jxNtZ7NbXrplunBOnT8gEWPFWbNyIlxYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c3f1939d12so5464627b3.2;
        Thu, 29 Aug 2024 05:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932997; x=1725537797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFyMaRDC/FvMbkKau/2HLi9Ip6QBbgf6GUu5Go19DeY=;
        b=h89UDh/3fVnpqao/CSv6Hjk7uJSCuSiICWCgpR+IyIfbbqCS3o44zf0Gcfpzacz1hg
         fx9aalUSrN0mG1qXgvkKHapL/FmGCzCjWhkPRhIpcz6nMIULacCgkl7D20BP/dnIqBno
         RMi43jH/ntzwY/QM+yiadEnPFG6HAbKh9S2S6uhcEhCGkAxlfdfXuKNJwzwUR6sSxavf
         H9OyGz3H1Dl9bCVHM07nN8wiZQhIFsS1rVk1ordHyIgE2MAu390HKMRgrqLEQPUVwzv8
         lmFCto2N7N9DNkhyPl4prmQu6KpqgPDdWJ4qnm3lhCfhFVpm8+Me17PYQCt3fAXmUOPU
         DdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU76aDZsunuVxguu6q11fgSbEyZUEPhY3e8ZLTtAAAIwCcRudz1FWdzERKrx2hItyfW8GUOVVZYA9HZ5TUP@vger.kernel.org, AJvYcCUkksbu7RM3iaTpwMfo0oMmSzh737ig7Hk8rUNrYK4mBxPNrVpMfwMGm6NGB9IUi6xym3yJ1QLEZ1x1LjIPzm9/iHc=@vger.kernel.org, AJvYcCXJ7RakNsU7pba8cE6JeXSpqm1GdT3NUT3rnEuQsZlJt42z4Ub4xjt6WPHPu16tsZYdO42groiHl1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbsovH/MBD6Bx2R9CrIffZEcuAM8sXj7W5JfWXfJfr+zEqMol
	yt9LSbrruXehcSe4L77gTgVdGb7+csRcVMp189RUuZ/gRxCQbaBwKxeduCVs
X-Google-Smtp-Source: AGHT+IEXY76t9GaekKIKAqIAHe6CYsysFns/S+JAWK9tOwVJCcXRNUPG729ErLp2u1E+vkdij1+QCw==
X-Received: by 2002:a05:690c:4c13:b0:6b4:3caa:e842 with SMTP id 00721157ae682-6d276404c82mr26567017b3.18.1724932996414;
        Thu, 29 Aug 2024 05:03:16 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a6265754csm214663276.3.2024.08.29.05.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 05:03:16 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e165825ebfdso589715276.0;
        Thu, 29 Aug 2024 05:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBlSZj5icxgWYXztXv+slQIxDjVOv2ESccKZRrzbBrupyGT8cvCxhpT0MWVWIEEIt5u5dJkZft41TnIlL8@vger.kernel.org, AJvYcCW8LShFf7sui+KUFDAGikK8AFecjMz0zkaYjel3F23l2EbQSsuxsyyk5wLaNF42hiWLw/xNNhMq5GvYMJiKq9Y4BNA=@vger.kernel.org, AJvYcCWgBsotdjC4NBJIHqY6KEWL7N8yb6uIzs7Q0Mgol1pFGm4LRvp3SpvwzCsp/inZIXLEBYS9uXeGCtE=@vger.kernel.org
X-Received: by 2002:a05:690c:fd6:b0:64b:52e8:4ae3 with SMTP id
 00721157ae682-6d275e337f4mr29637427b3.3.1724932995959; Thu, 29 Aug 2024
 05:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 14:03:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsae21fK4KJp5xaVCiLftn+u4ibjN23MfsS4hZbEpSrQ@mail.gmail.com>
Message-ID: <CAMuHMdWsae21fK4KJp5xaVCiLftn+u4ibjN23MfsS4hZbEpSrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:38=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Moved DDIV_PACK() macro to patch #1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

