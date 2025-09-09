Return-Path: <linux-renesas-soc+bounces-21651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10AB4FAB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E81B3A316E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F76B224247;
	Tue,  9 Sep 2025 12:17:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B543156230;
	Tue,  9 Sep 2025 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420251; cv=none; b=d4XAE5gqEJNTOaqTwgtnrFfZ3Qxqv9nqjdTw8hiuVugdtFNpBOu/4q5sHj0EN0w/FM+GLwkvXCCEy4n03+AnKWuEw8009Bt/LkdtNQW9VzVSHzYcEQMODnPU/rbrsF92C6nrdVo5ghQ0IsMFW/Oo8EZevOP4TtTsHzVwITqMmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420251; c=relaxed/simple;
	bh=BfI5kGrRmquweT1FQNY3ANSEjP4os0twzjd9OYhoSew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVkHPtch1jFdqmnEWl1x4l41Gi4VNN2AlsKr1Cev6+QRGNiKaETgRGu2boSE0zl+RlLMZ3smZneOYLWeMhVpkX5bEds6odcbCAcHZKE2e10qsgYymNSp9vA/tQugXhgcT7wz6JGQj0KsdqZlEHcFwAcJYNPiEXlvWqVMBdtcStA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-544ad727e87so4203551e0c.2;
        Tue, 09 Sep 2025 05:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420248; x=1758025048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqi9+rW1r7dpSIH7au+rHrA/y7D7zFiuE6MmzsOkMdY=;
        b=EToSdDJ/79f1cUqxP64YjGJAdqjkPtFLqAd6FkHGLYidex51G82yJrvIZtmBP4SlBP
         WEVJ6SfHI3dplwUAGW9Qch3OckdMa+nUcvAkZQAP2dN+DPuxppvzOmcCK7/PIuAimkER
         QOUHvNkeuPWHSspsWnPOuHP6qyUVdfdJWIy/+pKJhAxfiTK+KwwY8EKsV8GT5V9XlyV5
         ODbFEBmWj5SikuzsSx6ZMABFM44HR0dIoJT05In3MbCbQomBPAf8iCW58Q8mk7ZIOWwb
         dCpGr0W7edpeDrrxiShFHxsIrQWFfq2CzLFGuh1qXNS5DFMTVhVtH6vk8RWOossE9LMK
         a5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUonRkUQm7lBxRTO7nLdqiYopKq96mLi/cQmDR6OR5mNqjWskjd//6147YNXWNaacgcyFcJIBHEexVQHLmpitS1X/M=@vger.kernel.org, AJvYcCX6bTvHleKbzu3FOV/7F9guV/bB7ChZM/Nc+yB9IKXOyr+7TFEL7Rl+h7XPRgJYGcd3ERYuM2avIDI6Pow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79CfMr8gxGkt0AwoRpDug/3j+UY/nHO26ejUszmSUt7D8YwNY
	0wwgBQsQDba61AB6wSWakbq9LGxYDlwXHhgt6aH7S8FEJR/1tPVl2Etttw7/3XT4
X-Gm-Gg: ASbGncsHTyh002whA8O+gUW13YAbrlp+EqUL2KNQ59kF/yaEYzXiyc596HjV92Rpsf5
	lU9LFnRrgY5ISLDh6CCcMIY12ugdZsIz3IEFMHk12tIIrQ1/8Y7yjMn5uslzMEWVrmkei1lf7qu
	7v9wDCJiLn4FDyzftgj3tKSGeGbUbWoSaoO19RW4veXVQ9f8Roab9vJQhWR61cG6f8ZOVK3MMDR
	+ajYSDFmqk18GtrjB6WhPJ6YhAOjUOs1Hk/v+7PDaHu4Tdys8zUOQ+4hiR6lV91Hl9y8Vz8qW38
	/zxTrBSidLDhrpyWCpkM/H1dPqhdgCRBXPOUWtT9PzfUUbNEed+YNsAm5upTJxDnKgfdxS7hISC
	8Jj2WwRmot2rjQymiW4R1nuXgyEcGcbgCaslMLhK4Gw+bgtvHwFqBIPkbL1io
X-Google-Smtp-Source: AGHT+IF59iSwW5yKh0p5bZaXDnGyIrnKE48SD94u2kB5Hyoy8ouwj1t03SitTxJGZDbJCV7rERCmog==
X-Received: by 2002:a05:6122:2017:b0:530:5308:42ec with SMTP id 71dfb90a1353d-5473afc999cmr3687181e0c.8.1757420247611;
        Tue, 09 Sep 2025 05:17:27 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5449131c808sm12813430e0c.13.2025.09.09.05.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:17:27 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8c1e1b6ecd5so179789241.1;
        Tue, 09 Sep 2025 05:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpI+Hd+F5XWQQL4QOSgaMKhKc9/QIjQ1uPBtQP/6U5GhLNOXdMQvoVJiSxpQgEudCn2kP0R/+rTG0aX20=@vger.kernel.org, AJvYcCWsOOfwW15bKcGnYyqOaCmj/MoedFJDTCCvjr6Ry5p30HZArMcCcEt31vQ//d5vwl3nQe8gwiSRdzakuZtylhMeRoA=@vger.kernel.org
X-Received: by 2002:a05:6102:290e:b0:530:f657:c25 with SMTP id
 ada2fe7eead31-53d1aeac1efmr3251738137.5.1757420247203; Tue, 09 Sep 2025
 05:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Sep 2025 14:17:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOXZkffbadZnHEwzohc738W4fyKU+zP0M5Ak7M7n=Kwg@mail.gmail.com>
X-Gm-Features: AS18NWBKbwRi0v-Dm1pNqB_7yebVqbrRfQ9sbVPtDymWrVl0lzi7cL-2DL8uQPk
Message-ID: <CAMuHMdWOXZkffbadZnHEwzohc738W4fyKU+zP0M5Ak7M7n=Kwg@mail.gmail.com>
Subject: Re: [RFC/PATCH 0/2] clocksource/drivers/sh_cmt: Improve clock event design
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, 30 Aug 2025 at 23:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This RFC/PATCH tries to address an issue with the Renesas CMT driver
> design. The driver do PM and clock handling in struct clock_event_device
> callbacks. This leads to LOCKDEP warnings and I think hints at a larger
> issue.
>
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     [ BUG: Invalid wait context ]
>     6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
>     -----------------------------
>     swapper/1/0 is trying to lock:
>     ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_res=
ume+0x38/0x88
>     ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400=
001/0xDCC63000, Driver version 5.0
>     other info that might help us debug this:
>     ccree e6601000.crypto: ARM ccree device initialized
>     context-{5:5}
>     2 locks held by swapper/1/0:
>      #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_b=
roadcast_oneshot_control+0xa4/0x3a8
>      #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
>     usbcore: registered new interface driver usbhid
>     , at: sh_cmt_start+0x30/0x364
>     stack backtrace:
>     CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-ren=
esas-03071-gb3c4f4122b28-dirty #21 PREEMPT
>     Hardware name: Renesas Salvator-X 2nd version board based on r8a77965=
 (DT)
>     Call trace:
>      show_stack+0x14/0x1c (C)
>      dump_stack_lvl+0x6c/0x90
>      dump_stack+0x14/0x1c
>      __lock_acquire+0x904/0x1584
>      lock_acquire+0x220/0x34c
>      _raw_spin_lock_irqsave+0x58/0x80
>      __pm_runtime_resume+0x38/0x88
>      sh_cmt_start+0x54/0x364
>      sh_cmt_clock_event_set_oneshot+0x64/0xb8
>      clockevents_switch_state+0xfc/0x13c
>      tick_broadcast_set_event+0x30/0xa4
>      __tick_broadcast_oneshot_control+0x1e0/0x3a8
>      tick_broadcast_oneshot_control+0x30/0x40
>      cpuidle_enter_state+0x40c/0x680
>      cpuidle_enter+0x30/0x40
>      do_idle+0x1f4/0x26c
>      cpu_startup_entry+0x34/0x40
>      secondary_start_kernel+0x11c/0x13c
>      __secondary_switched+0x74/0x78
>
> This series tries to address this by instead doing PM and clock
> management at probe time, and leaving them on for the CMT channels that
> are used as clock events. The CMT design is a bit messy as channels can
> be used both as clock sources and events. And the design to do the
> housekeeping for clock sources seems to be valid and is kept.
>
> This is posted as an RFC as there is one other driver in-tree that
> suffers form similar issues. I intend to try and refactor that away too,
> but would like to try and get some feedback first.
>
> The work is tested on R-Car M3N.
>
> Niklas S=C3=B6derlund (2):
>   clocksource/drivers/sh_cmt: Split start/stop of clock source and
>     events
>   clocksource/drivers/sh_cmt: Do not power down channels used for events

Thanks for your series!

I can confirm this fixes the issue on e.g. R-Car Gen3, where the CMT
can be used for clock events or as a clock source, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

On R-Mobile A1, the CMT is also used for periodic clock events.
Your series seems to fix one invalid context, and expose a "new" one
(lockdep shuts down after the first report):

    sh_cmt e6138000.timer: ch0: used for clock events
    sh_cmt e6138000.timer: ch0: used for periodic clock events

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
    [ BUG: Invalid wait context ]
    6.17.0-rc5-armadillo-06055-g57d9d685e295 #872 Not tainted
    -----------------------------
    swapper/0/1 is trying to lock:
    c0e5ae28 (enable_lock){....}-{3:3}, at: clk_enable_lock+0x38/0xc4
    other info that might help us debug this:
    context-{5:5}
    2 locks held by swapper/0/1:
     #0: c218e488 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xd8/0xf8
     #1: c2201038 (&ch->lock){....}-{2:2}, at: sh_cmt_probe+0x598/0x780
    stack backtrace:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.17.0-rc5-armadillo-06055-g57d9d685e295 #872 NONE
    Hardware name: Generic R8A7740 (Flattened Device Tree)
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x44/0x74
     dump_stack_lvl from __lock_acquire+0x41c/0x17e8
     __lock_acquire from lock_acquire+0x208/0x28c
     lock_acquire from _raw_spin_lock_irqsave+0x50/0x64

   - _raw_spin_lock_irqsave from __pm_runtime_resume+0x54/0x80
   - __pm_runtime_resume from sh_cmt_start+0x60/0x26c
   - sh_cmt_start from sh_cmt_clock_event_set_state+0x60/0xe8
   - sh_cmt_clock_event_set_state from clockevents_switch_state+0x90/0x138
   - clockevents_switch_state from clockevents_register_device+0x78/0xe8
   - clockevents_register_device from sh_cmt_probe+0x588/0x700
   + _raw_spin_lock_irqsave from clk_enable_lock+0x38/0xc4
   + clk_enable_lock from clk_core_enable_lock+0xc/0x2c
   + clk_core_enable_lock from sh_cmt_enable+0x28/0x1c8
   + sh_cmt_enable from sh_cmt_probe+0x5a4/0x780

     sh_cmt_probe from platform_probe+0x58/0x90
     platform_probe from really_probe+0x128/0x28c
     really_probe from __driver_probe_device+0x16c/0x18c
     __driver_probe_device from driver_probe_device+0x2c/0xa8
     driver_probe_device from __driver_attach+0xe4/0xf8
     __driver_attach from bus_for_each_dev+0x84/0xc8
     bus_for_each_dev from bus_add_driver+0xd0/0x1d8
     bus_add_driver from driver_register+0xb8/0x100
     driver_register from do_one_initcall+0x74/0x1cc
     do_one_initcall from kernel_init_freeable+0x224/0x294
     kernel_init_freeable from kernel_init+0x14/0x12c
     kernel_init from ret_from_fork+0x14/0x28
    Exception stack(0xe0851fb0 to 0xe0851ff8)
    1fa0:                                     00000000 00000000
00000000 00000000
    1fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
    1fe0: 00000000 00000000 00000000 00000000 00000013 00000000

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

