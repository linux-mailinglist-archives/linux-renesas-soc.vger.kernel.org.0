Return-Path: <linux-renesas-soc+bounces-12451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E12A1B330
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 11:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8E83A3E65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4070218AC1;
	Fri, 24 Jan 2025 10:01:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B61BD504;
	Fri, 24 Jan 2025 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737712863; cv=none; b=qc1fy6iFxna5QTYxqODJVr7u4ctbGTq1ReijLKvDLggvYerIZcM86vrKr6v0hNGfVWdXHR3uiYQK4locieGBPdSSdO+t7+kQjK7KAnQCpBgsgCdbURUXqsmvij+5BtDgBx2E+aHjOdWQ8T2TXljiqAt03FN7waWuvwAV/cVUOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737712863; c=relaxed/simple;
	bh=9xPnkIRvyUKIbebzNpOh36TPopZWm47xElGwKwL3Fs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dInXE+GT2lR/l94xRsyFOy9jTL4feb4zDkSab2OPdmZ+16hLYr8Mw62GTreBSZLw4CGFNkhOykkkbmj+fzxmkUDIt+ilOYf5CHSu43J+Xc80Ucs3mqHTCw8K+LoM1KMmXYMZalghYk575sJNKfX1D/Dq0Y5RHxC0GQrYd1NzrTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51889930cb1so573532e0c.0;
        Fri, 24 Jan 2025 02:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737712858; x=1738317658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCXYxtEOmN85a3oqwY7Ex77YaQHE2iiC5mU4J2Q7BHI=;
        b=da8k5F7VHSZkr98aGpTySDpnX3QqO7v8Fmsy32lDyecV6zUL7V8w0Oc6XBeHCRPD2B
         d2+eK2tw/uoFl5PqLVKCBZUT8E3SJLVNoQ7xUVWpthMsGhYj82KRgR8ysYa5Lrfso92i
         ECt5WlfiF99n+2oySwjUAXpYB92o43VpH0xrCqjhbl29JoxdSJYkVYsvGoGWocUGcsq6
         fEL7P2nq/84oTG7tHn3o1gDcFfYKH/82I+YuUpqBIkavhgLBSv3Pje1CrUq3ghzqBdQE
         mhoZASZ77ZpubLnmy15hvEjnEkg2atqNuGCUtswAgLVf3S8fJZ1TfRlulLupxTBOjLd+
         C4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM0l6tu62QvvVkK3YktuObUx2CmJhMW3lXrXbyCAK8HnPlG+JW0Q4V/KHz5PF5Obp7OfRpJL32/Ao9iQ==@vger.kernel.org, AJvYcCUOYJqY+3hes/bFquXN2cuGNXYbUAPqtWMK2MKqu45YBmXhUo4xO4hVs/W9jYsEV2CgpFmjpnTmcEDAg+k=@vger.kernel.org, AJvYcCVHKCYK0PL85s9nZL+PL4YcWkWAuV/P4pmMaHn7AAF1xqI0YuHVbgO70b2jhEN23sPzkOWeBeMGQnJ44Q9BKsSaC7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04GBtisJ9rXdTJ2sx/m5Bs+OD+g/9MIPbkXtsQdo65k8mlTZo
	/9UZTbsCbrwS2S593DX97vzM5rKJxWpcdcE0cGiinNrd/ZdE4M9tInAXLeYn
X-Gm-Gg: ASbGncu9BYSLhBte9KI9wSI5PNXBjJ0cxXRx5uE8lGHm/Ndkj4SMpfjUwueIyZITGqa
	FA2XKDAP81vyr4Dw/2uR5fUaCKy2EAKe45J5lsnPTXtqHl3d0dV60FOYm0KKqR3hsgyZjoaP78O
	9ZZPfJ+SmANTYjKzOUquvCAEp7r8P7n90BDwfXMgWddlP/Vhg+2/okVWhLNDygEw2dsOO/5xxS3
	KjsuziQcda3WrBiXS8Nv4od1VfOg8w8aCIlnn0gOjnf/bSHjwDYoJjJYSPvxGPJAj1i8GzDHo6V
	ogf1JdrkkOvUogm9kthT/jk4t/35EsL5bxFhkaO0dgVG3/Y=
X-Google-Smtp-Source: AGHT+IHzgYGv2lP1P6wU+0v7sL8lFUdJ52nBFMplW8cNT0BXXrFCae5HYAvJrgg7q9fOvYGkm8uTgg==
X-Received: by 2002:a05:6122:2109:b0:518:859e:87ae with SMTP id 71dfb90a1353d-51d5b2c385bmr25198194e0c.7.1737712858068;
        Fri, 24 Jan 2025 02:00:58 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebea379sm313138e0c.42.2025.01.24.02.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:00:57 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51889930cb1so573521e0c.0;
        Fri, 24 Jan 2025 02:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6Xkv3Whnf6oNeqvrkFxsGpoRLaO/B5ILPUMFWL0mftIxNwd4hi2IuBPRYteBWrbV3/uX557+tKAVmAuM=@vger.kernel.org, AJvYcCWUggGnqlsj7sjl3UKuL0GWgqHiOqJIGdrSONi5aI2a5gCbCTrotbUDQ1ubWG5FaHzYfwkzoPq8Mj18rQ==@vger.kernel.org, AJvYcCXk41oeDNpgGQUHk1nhV5uU89opu7oWvzGxghuMyPZDJYZUPYqgDYzaLG0yPwip6cw/ZuGovh/mHeqBgp0N7sr/MKA=@vger.kernel.org
X-Received: by 2002:a05:6122:2109:b0:518:859e:87ae with SMTP id
 71dfb90a1353d-51d5b2c385bmr25198072e0c.7.1737712857106; Fri, 24 Jan 2025
 02:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124073354.3814674-1-avri.altman@wdc.com>
In-Reply-To: <20250124073354.3814674-1-avri.altman@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 11:00:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnjKJHtWoNfxTTtm2HD3h3wXbpYPbBsky-PcD+yQTqOw@mail.gmail.com>
X-Gm-Features: AWEUYZnYu6cDV1dHP9duL1Fo6Alz1y8ixJePXejqZeDq1qjA7hHFACA7SR-do0Q
Message-ID: <CAMuHMdUnjKJHtWoNfxTTtm2HD3h3wXbpYPbBsky-PcD+yQTqOw@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: ufs: core: Ensure clk_gating.lock is used only
 after initialization
To: Avri Altman <avri.altman@wdc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Avri,

On Fri, Jan 24, 2025 at 8:36=E2=80=AFAM Avri Altman <avri.altman@wdc.com> w=
rote:
> This commit addresses a lockdep warning triggered by the use of the
> clk_gating.lock before it is properly initialized. The warning is as
> follows:
>
> [    4.388838] INFO: trying to register non-static key.
> [    4.395673] The code is fine but needs lockdep annotation, or maybe
> [    4.402118] you didn't initialize this object before use?
> [    4.407673] turning off the locking correctness validator.
> [    4.413334] CPU: 5 UID: 0 PID: 58 Comm: kworker/u32:1 Not tainted 6.12=
-rc1 #185
> [    4.413343] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (D=
T)
> [    4.413362] Call trace:
> [    4.413364]  show_stack+0x18/0x24 (C)
> [    4.413374]  dump_stack_lvl+0x90/0xd0
> [    4.413384]  dump_stack+0x18/0x24
> [    4.413392]  register_lock_class+0x498/0x4a8
> [    4.413400]  __lock_acquire+0xb4/0x1b90
> [    4.413406]  lock_acquire+0x114/0x310
> [    4.413413]  _raw_spin_lock_irqsave+0x60/0x88
> [    4.413423]  ufshcd_setup_clocks+0x2c0/0x490
> [    4.413433]  ufshcd_init+0x198/0x10ec
> [    4.413437]  ufshcd_pltfrm_init+0x600/0x7c0
> [    4.413444]  ufs_qcom_probe+0x20/0x58
> [    4.413449]  platform_probe+0x68/0xd8
> [    4.413459]  really_probe+0xbc/0x268
> [    4.413466]  __driver_probe_device+0x78/0x12c
> [    4.413473]  driver_probe_device+0x40/0x11c
> [    4.413481]  __device_attach_driver+0xb8/0xf8
> [    4.413489]  bus_for_each_drv+0x84/0xe4
> [    4.413495]  __device_attach+0xfc/0x18c
> [    4.413502]  device_initial_probe+0x14/0x20
> [    4.413510]  bus_probe_device+0xb0/0xb4
> [    4.413517]  deferred_probe_work_func+0x8c/0xc8
> [    4.413524]  process_scheduled_works+0x250/0x658
> [    4.413534]  worker_thread+0x15c/0x2c8
> [    4.413542]  kthread+0x134/0x200
> [    4.413550]  ret_from_fork+0x10/0x20
>
> To fix this issue, ensure that the spinlock is only used after it
> has been properly initialized before using it in `ufshcd_setup_clocks`.
>
> Fixes: 209f4e43b806 ("scsi: ufs: core: Introduce a new clock_gating lock"=
)
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Avri Altman <avri.altman@wdc.com>
>
> ---
> Changes since v1:
>  - move the spin_lock_init(&hba->clk_gating.lock) call from
>    ufshcd_init_clk_gating() just before the ufshcd_hba_init() call in
>    ufshcd_init() (Bart)

Thanks for the update!

On Renesas R-Car S4 Starter Kit:

    BUG: spinlock bad magic on CPU#6, swapper/0/1
     lock: 0xffffff84443014e8, .magic: 00000000, .owner: <none>/-1,
.owner_cpu: 0
    CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.13.0-rcar3-initrd-08318-g75abbef32a94 #896
    Hardware name: R-Car S4 Starter Kit board (DT)
    Call trace:
     show_stack+0x18/0x24 (C)
     dump_stack_lvl+0x60/0x80
     dump_stack+0x18/0x24
     spin_bug+0x7c/0xa0
     do_raw_spin_lock+0x34/0xb4
     _raw_spin_lock_irqsave+0x1c/0x30
     class_spinlock_irqsave_constructor+0x18/0x30
     ufshcd_setup_clocks+0x98/0x23c
     ufshcd_init+0x288/0xd38
     ufshcd_pltfrm_init+0x618/0x738
     ufs_renesas_probe+0x18/0x24
     platform_probe+0x68/0xb8
     really_probe+0x138/0x268
     __driver_probe_device+0xf4/0x10c
     driver_probe_device+0x3c/0xf8
     __driver_attach+0xf0/0x100
     bus_for_each_dev+0x84/0xdc
     driver_attach+0x24/0x30
     bus_add_driver+0xe8/0x1dc
     driver_register+0xbc/0xf8
     __platform_driver_register+0x24/0x30
     ufs_renesas_platform_init+0x1c/0x28
     do_one_initcall+0x84/0x1f4
     kernel_init_freeable+0x238/0x23c
     kernel_init+0x20/0x120
     ret_from_fork+0x10/0x20

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

