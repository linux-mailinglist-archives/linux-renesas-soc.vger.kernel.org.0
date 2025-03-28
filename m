Return-Path: <linux-renesas-soc+bounces-14947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77FA74560
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 09:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E5BC7A4BA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1D6212FA1;
	Fri, 28 Mar 2025 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3vHdw2T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A42F30;
	Fri, 28 Mar 2025 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150580; cv=none; b=hSBY054qWERLpgiIQb0D9Nw8KYMCpNamnjJw34nC1SX4v6f3HFZl9dQdeDYKIQ1LeDaFZTHurtBpVbxEhZiS7991NV9zhAKRK8QRs/MDV10RCKVrXsfG5c79EIkx3ji1VLbLphGRKcgOsk/IiE4Oy4tFL46c2RgFuAs0L06cnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150580; c=relaxed/simple;
	bh=pDffGY4oyd0PxQ/KRiEepC6qUycajp4F52W0w2SZ/tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUz979ApfrtfTsnLVjdZpjGwq3U5ZV9OMRR3cnQBMsRcPwTHsAgxVhTqMfQoCQgLRA65HHDlCZjFL2QbAZ7Wxg51mYNU+3nIcobWXeAlrNkecTSA1DV9PJ7gWGzReapMfT9xU2tv/Hz/Ouq82MUxUYIymr6UlG0C1HYWp7dwMzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3vHdw2T; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso1954403e0c.1;
        Fri, 28 Mar 2025 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150577; x=1743755377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d30QttJ3kFYJy8HLYJ11ejVcMVaRpYa8Jw/DEhp7CDE=;
        b=K3vHdw2ToI/3KkME74ZrWriaWSOxfVvpVOggJzJxJXN7+KZXYMdw3xEBfR5snOIYie
         +vwf1MJq+lAfYQihGvI7NjAcUgWMxEJxztRp9lrw4C/D0KAT29Ivhsi/OhBWsvwlY76m
         5pHmRDYyGP3P7dz+BgHRvZnq1TaK+QXuWDzuLe1zB5xyjuWpqyeqFJSUVW5OKNRwZYTe
         BlqGLDFg45RvIReYBDru3hO+diLznKyECmUiBm/hJZtgoZaZ9K82Z2YRyhBYWeIPqCtT
         /byHGlLvZvr5NwoALKgVXx0WYJT63jiDTBrSRf3aPI/ZVD2qi/+/A3WSnlAHE9q/eqzZ
         RPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150577; x=1743755377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d30QttJ3kFYJy8HLYJ11ejVcMVaRpYa8Jw/DEhp7CDE=;
        b=WnNhdMaNjXCzzP7cx4ijwq62FK4a4tFPm1u8a+071TXgWRV97Vjb1H43TwcmIXIhje
         PSG9pQK/Pt5aqjm/2gj1Ihom3+NGG+8+/H+SnzAzbJfjspMUy5X5pBSxHKVOZT+lU90R
         iAXnH9ZywTFCh0wBvM0g7/KvlAagvmmKnx4vkp4bQp+c9qprRbYTx5xpKdfv7iGFGL7p
         D5fIlZv9gT26DHEZUjuBuppH4UCUWnMBcWtyT1jCo7gYHO/qhW9xBZhaDxPiXz9veUG4
         sOs34IPGoaKR5ggdXuY9PHh8ifpuf7GwmivP8vKQjp0jI5THk3GyaiJxVXINrGUKDrR5
         /K5A==
X-Forwarded-Encrypted: i=1; AJvYcCWRDzCftlQWrIT11YJvH8563qJtn42YEJGaHMMRZ5KYErTxnXeN6wgwpLFJMJI0FaTCvZGYiKfUyAdW@vger.kernel.org, AJvYcCWyiinilmubQuLoStquIb+a6+tVQy8wuxD5a6+Ov8sqkNU+KfFzrJ26rBKMg7bk/3UbGCn/7vTViBW67II=@vger.kernel.org, AJvYcCXAc47ia1LZ8ODoEy9QKLAD3aR/T2xoy0zC8YLSuJATrTiua37Bazs9WphBOxl9bRJE73IyRTuQjQ4/DGLBwIaMp9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrv9+MWmolcJaF2NX5fzgd6LnN4ae9DWNBou19fITCI2VGxew3
	nC8XNHa9VuENJzr/pKHPY6jOd6on0kKXngZWZndgX6lHw96ONI4IvaJHmRu27e6+EULkk/UmP3U
	uPYF3oulr966ht8FR9YIrU0+tfdg=
X-Gm-Gg: ASbGncvTodvN1TRFNOQI/rA9L9eJXLk7nYVo/SV9uisDf8EASrO+7CnRbRIDUg0HNfz
	nZ89ZMPZL20BNnYS7MQuMUrnSQpb9duOG5izw2/7n4S5ACijptYJfyVmGg5OvT29Q+Lmv6SVpCo
	Ef3+y3BkuksqG2egfTHegiBTPO4A==
X-Google-Smtp-Source: AGHT+IGZ77jAnCPj58lcIOJ2aeLE8UITLEP4sbFyGAVQzdIYVYm+ol7wyVpnwzDXQjsf77RFfGZI0POt5vvPr0pP8OI=
X-Received: by 2002:a05:6122:3229:b0:523:a88b:9ac5 with SMTP id
 71dfb90a1353d-52600a8064dmr6686071e0c.9.1743150577435; Fri, 28 Mar 2025
 01:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <87zfh6yoly.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zfh6yoly.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 08:29:11 +0000
X-Gm-Features: AQ5f1Joz0Yl2NwlX4vM3SMZ2TTdDb4hpY-z18HKFBqEEH80xIsYDqhUbtNNTT8w
Message-ID: <CA+V-a8uwJasrQZ+3Y1vgTKz+b_SBULXpXdGYxULUOpPkZgXjFg@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Reorder clock handling and power
 management in probe
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuninori san,

Thank you for the review.

On Fri, Mar 28, 2025 at 12:40=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Prabhakark
>
> Thank you for the patch
>
> > Reorder the initialization sequence in `usbhs_probe()` to enable runtim=
e
> > PM before accessing registers, preventing potential crashes due to
> > uninitialized clocks.
> >
> > Currently, in the probe path, registers are accessed before enabling th=
e
> > clocks, leading to a synchronous external abort on the RZ/V2H SoC.
> > The problematic call flow is as follows:
> >
> >     usbhs_probe()
> >         usbhs_sys_clock_ctrl()
> >             usbhs_bset()
> >                 usbhs_write()
> >                     iowrite16()  <-- Register access before enabling cl=
ocks
>
> This patch itself is not so bad idea, but basically, we should not assume
> the power/clock was enabled since kernel boot.
> In this driver, register access happen only during power enable <->  powe=
r
> disable (except your issue case), and this is good idea. So, the strange
> is usbhs_sys_clock_ctrl() call in usbhs_probe() (without power enable) I
> guess.
>
> According to the comment, it is just caring boot loader, and
> usbhs_sys_clock_ctrl() itself will be called when usbhsc_power_ctrl() was
> called anyway. And more, if my understanding was correct, Renesas clock
> driver will stop all unused devices clock/power after boot.
> So maybe we can just remove strange usbhs_sys_clock_ctrl() from usbhs_pro=
be() ?
>

After dropping usbhs_sys_clock_ctrl and removing the clock enabling
done in this patch and with  `CONFIG_USB_G_SERIAL=3Dy` I hit the same
issue.

[14.318626] g_serial gadget.0: g_serial ready
[14.323923] Internal error: synchronous external abort:
0000000096000010 [#1] PREEMPT SMP
[14.332107] Modules linked in: rzg2l_mipi_dsi rcar_fcp
renesas_usbhs(+) drm_shmem_helper display_connector gpu_sched
drm_kms_helper fuse drm backlight ipv6
[14.346025] CPU: 1 UID: 0 PID: 187 Comm: (udev-worker) Not tainted
6.14.0-rc7+ #99
[14.353578] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (=
DT)
[14.360775] pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D-=
-)
[14.367711] pc : usbhs_sys_function_pullup+0x10/0x40 [renesas_usbhs]
[14.374082] lr : usbhsg_update_pullup+0x58/0x68 [renesas_usbhs]
[14.374107] sp : ffff80008278b460
[14.374110] x29: ffff80008278b460 x28: ffff800079a355f0 x27: 00000000000000=
0a
[14.374122] x26: ffff800079a35d00 x25: ffff0000c3c26b40 x24: ffff8000817bb1=
c0
[14.374131] x23: ffff0000c33cd800 x22: ffff0000c221e480 x21: ffff0000c221e5=
40
[14.374140] x20: 0000000000000001 x19: ffff0000c221e480 x18: 00000000000000=
00
[14.374148] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000000=
00
[14.374156] x14: 0000000000000074 x13: ffff0000c33ac680 x12: 00000000000000=
00
[14.374164] x11: ffff0000c33ac680 x10: 0000000000000aa0 x9 : ffff80008278b1=
60
[14.374172] x8 : ffff0000c33ad100 x7 : 0000000002307a83 x6 : 00000000000003=
2c
[14.374180] x5 : ffff0003fdfb4388 x4 : 0000000000000000 x3 : 00000000000000=
00
[14.374187] x2 : 0000000000000010 x1 : ffff8000825a0000 x0 : ffff0000c221e4=
80
[14.374197] Call trace:
[14.374200]  usbhs_sys_function_pullup+0x10/0x40 [renesas_usbhs] (P)
[14.374220]  usbhsg_pullup+0x54/0x78 [renesas_usbhs]
[14.374236]  usb_gadget_connect_locked+0x44/0x8c
[14.374249]  gadget_bind_driver+0x198/0x284
[14.374256]  really_probe+0xbc/0x2c0
[14.374266]  __driver_probe_device+0x78/0x120
[14.374272]  driver_probe_device+0x3c/0x154
[14.374278]  __device_attach_driver+0xb8/0x140
[14.374285]  bus_for_each_drv+0x88/0xe8
[14.374292]  __device_attach+0xa0/0x190
[14.374299]  device_initial_probe+0x14/0x20
[14.374306]  bus_probe_device+0xb4/0xc0
[14.374312]  device_add+0x5c4/0x7a0
[14.374318]  usb_add_gadget+0x198/0x220
[14.374324]  usb_add_gadget_udc+0x68/0xa0
[14.374330]  usbhs_mod_gadget_probe+0x218/0x2c4 [renesas_usbhs]
[14.374347]  usbhs_mod_probe+0x30/0xc0 [renesas_usbhs]
[14.374363]  usbhs_probe+0x208/0x5a0 [renesas_usbhs]
[14.374378]  platform_probe+0x68/0xdc
[14.374387]  really_probe+0xbc/0x2c0
[14.374394]  __driver_probe_device+0x78/0x120
[14.374400]  driver_probe_device+0x3c/0x154
[14.374407]  __driver_attach+0x90/0x1a0
[14.374413]  bus_for_each_dev+0x7c/0xe0
[14.374419]  driver_attach+0x24/0x30
[14.374425]  bus_add_driver+0xe4/0x208
[14.374432]  driver_register+0x68/0x130
[14.374438]  __platform_driver_register+0x24/0x30
[14.374446]  renesas_usbhs_driver_init+0x20/0x1000 [renesas_usbhs]
[14.374462]  do_one_initcall+0x60/0x1d4
[14.374474]  do_init_module+0x54/0x1f8
[14.374484]  load_module+0x1754/0x1c98
[14.374492]  init_module_from_file+0x88/0xcc
[14.374499]  __arm64_sys_finit_module+0x1c4/0x328
[14.374506]  invoke_syscall+0x48/0x104
[14.374516]  el0_svc_common.constprop.0+0xc0/0xe0
[14.374524]  do_el0_svc+0x1c/0x28
[14.374530]  el0_svc+0x30/0xcc
[14.374539]  el0t_64_sync_handler+0x10c/0x138
[14.374546]  el0t_64_sync+0x198/0x19c
[14.374558] Code: 7100003f 1a9f07e2 f9400001 531c6c42 (79400021)
[14.374564] ---[ end trace 0000000000000000 ]---


Cheers,
Prabhakar

