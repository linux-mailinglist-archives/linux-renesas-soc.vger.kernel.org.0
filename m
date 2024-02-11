Return-Path: <linux-renesas-soc+bounces-2582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9685088C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 10:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C274B218BF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A765917C;
	Sun, 11 Feb 2024 09:59:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B805914F
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707645577; cv=none; b=sKekM1T7hrGpAsDiHRIPHLJ2XUv+Nk69fu2DSBf93UIlMPg+Gfck6fDQqHkof30dQVqtPUTgC74E0qhVM6FL+S0PWDP60BiYIhhcWtKCFH9pVm9EtLOVm2Kj8tLpTroGNRLCh+/2mZhkxyLt9sVtPVhsmg2jjgq2MLrKxNbLWSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707645577; c=relaxed/simple;
	bh=pyrjNCbZX6B1h6MK1RsKNIOshV/XhQCieqgwW9sUpfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqJTQsLGEK91q+fMDp7YLUJ6MsBT/7yeov8TBFz7VMpsr1Q1CDYxp9VwwqCtluw6XRpBLXgjxiQZQt5l9srBzqnbm5ru5CfqC4IrJcX4Wq1AwKVTA+v1dvT/c5qljICkDysyoGGaiqzgkAy0bchRuc3SwmccNpuSMOE/eY5fJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-219452bdf81so1317152fac.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 01:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707645572; x=1708250372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3KkAxWSRsRVqnLK8aK70Cb5sASB4LcVupWqUX2gQf4=;
        b=rDvZ7O+ff/AgK6Svt3FthiLtomRgGhSUwMK9rEtX4COzINS2+OL8QEqGe1Fmcj5Wgl
         fgl2n/ClcO+71qPiv/17aGr9bmA41zwLRrrzjsnqoUAos4iQgsqjCn/+wK7S1rwnaGcp
         NJQrONc7hgj2sNStdZ2kkxXl3uz+2HEq4t/gv0RZdf9CpWug3joeuS0LhMCco8QwIHIm
         F5oCPxRFnkXMfLmuUhdpEiCdZ3eEErBPqtzU/gXijXy02RCK2idSF6aTBkYhbpTBzCx6
         YnHXVLAwg9M5lKcHfIJszZjhHcDP8fcqjkdirPvTPtgkTnpgCVmagF6pDYCR09/vypVD
         naZQ==
X-Gm-Message-State: AOJu0YzcGygtdi0LxpMlQtL8lgIzsqnKd0bxKHNyB7PEriVd5wdVqT8q
	/INZGvrBR5A4e7cq703hJVaZinxqLDVbq6EoU3XzAsYQN6s9FtWmrP/YxurQS4Q=
X-Google-Smtp-Source: AGHT+IGfPHrmpiTdfYkEBp52Yj5l4qN4mG1+wHvgD1YRk0HUdn6hNovzFpIIzAfjjFiT29kPGIGJGA==
X-Received: by 2002:a05:6871:5228:b0:219:ef9d:2a38 with SMTP id ht40-20020a056871522800b00219ef9d2a38mr4081761oac.50.1707645572644;
        Sun, 11 Feb 2024 01:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8RS5yHzu7kuQ6/vHV+zOwDWpjb65XhnZSLFD3mcyzS9JRNq6Utdqxw7r6MskkBC+oDe4gVoCE7mdPoWQUJPct6Az+5gZOCoMYILzHsEVZj6o=
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id gl15-20020a0568703c8f00b0021a600f3ff5sm2981oab.21.2024.02.11.01.59.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 01:59:31 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bb9b28acb4so1998056b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 01:59:31 -0800 (PST)
X-Received: by 2002:a05:6808:23c3:b0:3bf:d798:7689 with SMTP id
 bq3-20020a05680823c300b003bfd7987689mr4477262oib.2.1707645571682; Sun, 11 Feb
 2024 01:59:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209211535.3313392-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240209211535.3313392-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 11 Feb 2024 10:59:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTUQOogPTGNAa04koock6i=AMa5inO3Q43gJi_O2OBig@mail.gmail.com>
Message-ID: <CAMuHMdVTUQOogPTGNAa04koock6i=AMa5inO3Q43gJi_O2OBig@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Fix broken clocks on all Gen2 boards
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, Tom Rini <trini@konsulko.com>, 
	Hai Pham <hai.pham.ud@renesas.com>, u-boot@lists.denx.de, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Fri, Feb 9, 2024 at 10:22=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> To prepare support for multiple register layouts pointers to register
> tables where added to struct cpg_mssr_info. These pointers are suppose

supposed

> to be filled in at probe time and no intended change in behavior was
> intended.
>
> However the new pointers where only filled in by some paths of the

were

> driver implemented in clk-rcar-gen3.c. The path implemented in
> clk-rcar-gen2.c was not updated leaving the pointers uninitialized
> leading to a crash when trying to probe the clocks.
>
> Fix this by filling in the pointers in the Gen2 code path with the
> values used before they where moved to struct cpg_mssr_info.

were

> Fixes: d413214fb748 ("clk: renesas: Add register pointers into struct cpg=
_mssr_info")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

