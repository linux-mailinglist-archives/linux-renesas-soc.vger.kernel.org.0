Return-Path: <linux-renesas-soc+bounces-12651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F4A20950
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 022A816930A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65B819B3EE;
	Tue, 28 Jan 2025 11:13:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5A192B96;
	Tue, 28 Jan 2025 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062804; cv=none; b=LP7TzsktIGhdXrGheocDnL3s14MmRbaS02q3mlnG8ST4IF/oxWmyi6Si1s0HCZEU8uT++ayUY3CVVAG2WeFAvlwv08poiJU0uTRxOs4CAoAeQFRGbwx9HZ6vBjn17/XuPVGp1tlARm6NQC5xCxfW+wUl1EWScozfJ5aVsfjQcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062804; c=relaxed/simple;
	bh=vbTSwssScmF9UEQBKNFtUOOB3aLLr6ha1FGp7jRmvnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+x5F6AA3WRaHPSLtBO8AEX032lnF9XBxqshG4V88UHDVBbbl77oDKjhuVm89vrHuQaB475NEDoe1Bm1T8peOM/Qc8bueryfgpmxl68GLfYc7wJTiHqGr9i+yuMOfKJLKa2efFzcWLWyJl9WAxNEuvC9/j8GteYxpKGYPlv2puE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe70b41a8so1499144137.3;
        Tue, 28 Jan 2025 03:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062801; x=1738667601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snPkFe8i0apRMt0aO2ZKTL/I7IaqgPNsHKrYT0oIYUg=;
        b=c7z90xKbcyxKarkedQ2/AqMQdPCigFr8MNAIaAbG7Z/rfEkz96yyPeeynONLJ93sii
         fV7wacWc0YqIG4WoqEnknEuosp2Zhyrs811tAmnoo3SaFyWzTSilMtnF6BW2+18dtgwK
         3hYsMKL1zVjVYcfFoR2aFxaIZIxgYrb64S26Ba6UpI1lYa3SX0R6zyT5148+Vq+XmqA7
         I3D6f177CgHYTxar+5ITKHKSWs3wWyp7sAmKJ0y7fUT0ai7vocuXG09nOp0RYv8Po3ip
         7rl2jfR81xdTVaJUXn9sJ9Eg0LOrRFnji+rFiBIEUgOXJpyiT4XrN7weArnsGoFmeFe5
         JDPw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBNqEURu91nyE3q49IueMH0U6m69KmKD8/R0sZ8d1uBkTsGduCKQIVfk2evqECfGmTSAa6dLqBa4=@vger.kernel.org, AJvYcCVQo904aRsa5sn76t8dL8SX4chWAGKPDwr1UMD3uM1pENfPVLuSthN3VCUYSXYU4lo3+gtQvs1ldst1mVwow7+mWaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1dlEewukrHN/bMyapL5fQ6g7xTwrqU+Wkb+YH4Qx6rocxW45
	omvNL09ZexpJIxtmLK8eGOEOBuutIaevf54PcQ8oX+ILUuTIg99HoO0ARYS7
X-Gm-Gg: ASbGnctwIoBOUse6Ypxsl5uP4qmUmg42HvwYTB3CazZFwLnmz2QZyi1hAecTsnrcZ2F
	kgi2haAhjdtV51TCdE+S10kfKRPeE6bprGTxVM8RW/LNnrA0JOn5YFWoMp0eIgcvpuqAGIuV7oi
	WPEVuX7EguTK0SOoaKm5VWX2WXQhhNQNKJ0Ivk+IPd/wo9H1Ra0hguXGcjS8s3tgWGOxlb0sWVc
	XPAausgwfWrATRgT6shYWsDHasiRdKv05iHyDYbYkU3/fKnIFzJVAT/MC6a7ugP39NrNEmsmNeR
	TcxIMGEk39VYBVfWfdF4ktlVSRH35A8r74NrgJarlnz+DNwLiZ7jdgSOjBv3VyVi
X-Google-Smtp-Source: AGHT+IHRl+V1EltSZHPtM5coW1bCp/Uxq+5rqbXvMIFtc1yy7o6v5FPgK+A2yP1Ciwf+eotcyFxJ0A==
X-Received: by 2002:a05:6102:334a:b0:4b6:d108:cabe with SMTP id ada2fe7eead31-4b6d1181205mr28223938137.5.1738062800976;
        Tue, 28 Jan 2025 03:13:20 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c40d58sm2453754241.32.2025.01.28.03.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:13:20 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afde39e360so1428564137.0;
        Tue, 28 Jan 2025 03:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIgTQb1QfE/FMTuTL36HfKKjHIfegB+/VSJASze7N7KRkEeKXw8yOVRNXHOX444LVDgqx6eqB/afK5sp/JuFK1Ktk=@vger.kernel.org, AJvYcCXs8FtM5ZmrYGForM/Ws8nREmqIsoaaCsN6pAy59q80PgY17NZ+4u9uSdsT55XXiDxR4eLAs2DqcMk=@vger.kernel.org
X-Received: by 2002:a05:6102:3e0f:b0:4b2:45a3:59f1 with SMTP id
 ada2fe7eead31-4b690bd3ec9mr40245549137.9.1738062800520; Tue, 28 Jan 2025
 03:13:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 12:13:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmUoSyUABdjj-ri4hGkzPv0=HT1sTsVKKS_WjqPZZAtQ@mail.gmail.com>
X-Gm-Features: AWEUYZkdNe5EXQGO0xFD9CJ_bJY1ibPRPF7lyAKToLFphKX1KWQNsE1vRXGxdWs
Message-ID: <CAMuHMdWmUoSyUABdjj-ri4hGkzPv0=HT1sTsVKKS_WjqPZZAtQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: renesas: r9a09g047: Add SDHI clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0..2} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> ---
> This patch depend upon [1]
> [1] https://lore.kernel.org/all/20250120094715.25802-3-biju.das.jz@bp.renesas.com/

Which I haven't reviewed yet, as it has been superseded, twice...
Anyway, I don't see the dependency?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

