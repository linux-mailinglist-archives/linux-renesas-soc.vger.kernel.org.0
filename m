Return-Path: <linux-renesas-soc+bounces-26351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD4CFE33A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 15:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 168113080089
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 14:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A4532A3C5;
	Wed,  7 Jan 2026 14:09:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00E032573C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794981; cv=none; b=QnTMJRsKGETFiIXdSh302GKG9Snf/FV7h0yuNAmvuw/yJi71nz5sajHf3ljWK8WrMlg0gA3Ssmfu3/2m6thMMBZnR2rbzdUvcObeOnxFRS0CWkiwKajfb36biM/wFrTmxT2SuWLlGdS0IvfCxBdm3S/56cl9DKfqSM7p2LHw7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794981; c=relaxed/simple;
	bh=e8rwtFUQUxqJFbG3O11kFAVcDgZHEDgTDWHmsZOo5jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDKpORjFg25haR4VFWJmDAeZQrqRmeQJ0UOqvSvH38LsfAmMycoRBhGj/+2hUufaMg1jf/Q4ANhhu2mKJAxZLTPLTAd0qAq76Aw/XMi1PmzZSlmONBE5+b9y7wkP8mksak6GcHhqkoC2DDE3LHjL724g3q9x58/R0ET88AokBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso568655241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794979; x=1768399779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pEKLjYKYbgGDORfYlp1Nej6aE1A32wXkvoWEkyhoA=;
        b=YvueclawJ/OREtDPFNpYAgp+70SKPNMv+Hcy8HNeLhlB+IRuqML8z3KnMMTi1uBmVj
         SM+Bk6PKWRlr4Zl2zOgs9QEXODlwj33oF+YVfm51XBEL0z9lIfdnxEZRON2GBAa+itG0
         yRPe+qEEkN7yhAXI1kn97ptJG6haYKaREEfoij+hWF9J0DWTSTBwkfxfIqwr5OgL5oRU
         Yii81UzQr1hAjAJ7wEkrDFKXbL9Ifzk2dVFC2z8podHy0TO/1vadDWrUVCrSgSQVRnFX
         y43jaw5784sLTcqk9zSloS8McTC4bQvt8CKPgBiYfezammEo65otuGQ5fCk58ubi/prs
         G/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEBaehM1TPlatKC9FqQHXPjruBH9LpIDFqeRTebCV3Npk8TwyDcXAjHOwfSFrAr9CeNCsvannbXDcm8r1YyLtOWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoIqnLKXPozUqhiySiGfZ+b1wRap6MAlmypUCCej21UndWd5O
	KD4ifvDsY8Gpc6q2gGNLexmilVk8EMJiJDaqlA9QNWEeUEDY0cSVce+jtE+opDiR
X-Gm-Gg: AY/fxX5q+GYTevMVZv1OOeboP5/Q+WzIijuOsd/KS1CYss9ZdBJlC6JBO/OCKGMlHOI
	Zagw4tPTR3oMEMZbExN/v/KCmql/juzFchNEL5D6weczHDfClIYk8nNfRcXMM7NRw64OdmPiSBy
	XK6qNQz0hizPlmHmKvCXkaNxTVQWAQr+P58LIMpvU8sw/1l6tPYCJYSHHdXjZepAUWEsYkSfiiH
	pHvpebx2l0/PA7t+bsS/SGw9qL/K04I/FL1wUc1y0XL+R8mhYil7IHjqQgRo2lLtl7SHVyaD93o
	ZS1ZyokQaEBPtKawJtulhyapbPMDpRUEqjnSLMWu1TvbcqzergWJy3hZRHtoffYzkiz0nKncSdT
	/CQSMDi6AnVVDOxZGVUiFUHnL7a7Cf/xhRsQpC9j+VUGJ8BAH6lmFfESKgRB09VqlsYXRaP29YJ
	x8V4/Yf5gKerZkK0G2inujhR0nDc6uQ3gupCARF+m+WOLCjGq7
X-Google-Smtp-Source: AGHT+IGahIPXA0sd8J4N01R1NHn+UUWrkZnOEqOKvZYYO26DXoqvrnTa0+/0ESuBniQRmClL0EUPOA==
X-Received: by 2002:a05:6102:f9d:b0:5ec:310b:7ce5 with SMTP id ada2fe7eead31-5ec8b94edcamr1207446137.2.1767794978557;
        Wed, 07 Jan 2026 06:09:38 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm3009904137.13.2026.01.07.06.09.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:09:38 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5deb0b2f685so568865137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVB0munf792OqCM6aMkk3YONxzOo+gXwZ8A+xvy/4tFZQntg1FdGlvt7kZJO4R6ZHuE6lxLXQoHF1s9UufK29h3oQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6890:b0:5df:d4c5:15ee with SMTP id
 ada2fe7eead31-5ec755c7741mr2420114137.9.1767794978191; Wed, 07 Jan 2026
 06:09:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251127145654.3253992-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251127145654.3253992-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:09:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmqSev9wc+ERBaA+3gvckDgfqKdR=NbVZsZE1Y1SSW1w@mail.gmail.com>
X-Gm-Features: AQt7F2qoVMWYkGk7pUc_vae9K5a8DHzPmjw5pSS4p1G1bF06bJoFVxzAyNbudPE
Message-ID: <CAMuHMdWmqSev9wc+ERBaA+3gvckDgfqKdR=NbVZsZE1Y1SSW1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: handle RZ/T2H register layout
 in PM callbacks
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The register layout for RZ/T2H is not handled inside
> cpg_mssr_suspend_noirq() and cpg_mssr_resume_noirq(), causing a memory
> abort because the wrong code path is taken, as shown below.
>
> Explicitly handle the RZ/T2H register layout in cpg_mssr_suspend_noirq()
> and cpg_mssr_resume_noirq(), similar to how it is done inside
> cpg_mstp_clock_is_enabled() and cpg_mstp_clock_endisable().
>
> [   90.052296] Mem abort info:
> [   90.055420]   ESR = 0x0000000096000007
> [   90.059553]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   90.065697]   SET = 0, FnV = 0
> [   90.069211]   EA = 0, S1PTW = 0
> [   90.072834]   FSC = 0x07: level 3 translation fault
> [   90.078109] Data abort info:
> [   90.081405]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   90.087427]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   90.093169]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   90.099008] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000c60b4000
> [   90.106756] [ffff800082816318] pgd=0000000000000000, p4d=10000000c69ef003, pud=10000000c69f0003, pmd=100000024002b403, pte=0000000000000000
> [   90.120727] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   90.127058] Modules linked in: sha256 cfg80211 spi_nor at24 renesas_usbhs bluetooth ecdh_generic ecc rfkill rzt2h_adc spi_rzv2h_rspi industrialio_adc gpio_keys fuse drm backlight ipv6
> [   90.145201] CPU: 0 UID: 0 PID: 307 Comm: sh Not tainted 6.18.0-rc1-next-20251016+ #47 PREEMPT
> [   90.155006] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
> [   90.163041] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   90.170777] pc : cpg_mssr_suspend_noirq+0x4c/0xc0
> [   90.175983] lr : device_suspend_noirq+0x6c/0x22c
> [   90.181309] sp : ffff8000838d3af0
> [   90.185026] x29: ffff8000838d3af0 x28: ffff8000825c016f x27: ffff8000825c01a0
> [   90.192973] x26: ffff8000809feeec x25: ffff8000827bebb8 x24: 0000000000000002
> [   90.200815] x23: ffff8000825c0190 x22: 0000000000000002 x21: 0000000000000000
> [   90.209058] x20: ffff8000827bebb8 x19: ffff000180128010 x18: ffff00033ef92a80
> [   90.217100] x17: ffff000180051700 x16: 0000000000000001 x15: ffff000187afc310
> [   90.224847] x14: 0000000000000254 x13: 0000000000000001 x12: 0000000000000001
> [   90.232793] x11: 00000000000000c0 x10: 0000000000000ab0 x9 : ffff8000838d38b0
> [   90.240540] x8 : ffff000186387410 x7 : 0000000000000001 x6 : 0000000000000000
> [   90.248600] x5 : ffff0001803240d4 x4 : 0000000000000003 x3 : ffff0001803240d0
> [   90.256460] x2 : ffff800082816318 x1 : 000000000000000c x0 : ffff000180324000
> [   90.264208] Call trace:
> [   90.267019]  cpg_mssr_suspend_noirq+0x4c/0xc0 (P)
> [   90.272450]  device_suspend_noirq+0x6c/0x22c
> [   90.277375]  dpm_noirq_suspend_devices+0x1a8/0x2a0
> [   90.282902]  dpm_suspend_noirq+0x24/0xa0
> [   90.287428]  suspend_devices_and_enter+0x310/0x590
> [   90.292790]  pm_suspend+0x1b4/0x200
> [   90.296811]  state_store+0x80/0xf4
> [   90.300676]  kobj_attr_store+0x18/0x34
> [   90.305002]  sysfs_kf_write+0x7c/0x94
> [   90.309232]  kernfs_fop_write_iter+0x12c/0x200
> [   90.314115]  vfs_write+0x240/0x380
> [   90.318041]  ksys_write+0x64/0x100
> [   90.321862]  __arm64_sys_write+0x18/0x24
> [   90.326013]  invoke_syscall.constprop.0+0x40/0xf0
> [   90.331445]  el0_svc_common.constprop.0+0xb8/0xd8
> [   90.336554]  do_el0_svc+0x1c/0x28
> [   90.340375]  el0_svc+0x34/0xe8
> [   90.343900]  el0t_64_sync_handler+0xa0/0xe4
> [   90.348426]  el0t_64_sync+0x198/0x19c
> [   90.352609] Code: 8b040042 b9409004 7100049f 54000240 (b9400042)
> [   90.359639] ---[ end trace 0000000000000000 ]---
>
> Fixes: 065fe720eec6 ("clk: renesas: Add support for R9A09G077 SoC")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

