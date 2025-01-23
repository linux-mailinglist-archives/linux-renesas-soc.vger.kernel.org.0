Return-Path: <linux-renesas-soc+bounces-12397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3974BA1A6E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76897165061
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C192521129D;
	Thu, 23 Jan 2025 15:20:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2079D20B22;
	Thu, 23 Jan 2025 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645626; cv=none; b=eQlj0Jkm4aS95iptqt4QuIaDhZJUaklXv4tSzqitlRUdyW5iLMTownkeS/bDPm40GZBVqwSuizEHyVTbPU0KruiCw7sqX6YrsxRiMGyxRo1FqhaBrWU9AtgFdo9YMNwmNfD99beB0GhV02HOBr/CSpb83R5naKvopsHIVA84ylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645626; c=relaxed/simple;
	bh=6b7K0F2+DPxLZSZiwWCQwiaEbv/IU3ujcWyDwOiGmUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeaIy09ozBuO+v3s0EpT/8hWahpS3vZj7jOj0HeTF+turIzJ9ClUHaeHVPL6NDvfvD0tnfSXdx57WA3M3Yk4TCtO67fmo7bn7IB0YZcl/HsjsNg2iGXUne2MFnSvwO9cs7XExJakGk6/vsck6jLa1Bhu2LYLxTkXWgklXRqXtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b9bc648736so98980885a.1;
        Thu, 23 Jan 2025 07:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645622; x=1738250422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30OZtwxQ2Itb+J+KK0YcGlPbVhIYYPq467lmmLUkEwA=;
        b=dZpgVN2G5upg188/Uho9ZJA36eMvZucvhyGbXTXphdJ6QsX6UefqwEUCOzbHhOiYyb
         7xLn8FidnMK9Z58ravNRvfmbirnPcO7ZJc4RxYSZzQteCPcdS2BlPYjUX/JHDgEZLtNb
         ItKxkAcRqEHK6FP6Gx+IgwQCr4ZNosjd8KqGyrXMn7gsfepemHGjVY6AeZITTYI8N/hM
         77xvzosdT8Bb/JnDCQoKIbiJrmQ7BCG1u7kpHz4BmKIIU8XcB8hi3ysXctbrAJh8hhro
         Omrh50ZTpCQ9AGz/+mDEKbk9yvWMW1d/qi6lN7DcUsUM/7bf38aM70PIUppm5JEdxVeE
         OyUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzP9Iv3Ox2fVSyP2BclQMtIWiqCDOFqHjTO98Zrat5aYnbNStvUjbcOb1QN/IA68+WFNSqzgmfbSMf1g==@vger.kernel.org, AJvYcCVhFkeBCxoVUm9Mqvy7vCVIICsmI0W38AR/WFWdY7AWBdrmiSoHJzky8PTnk/kyp918M/rjzors12n4vcY=@vger.kernel.org, AJvYcCX559pAxWSbm0NP0oYd59Yyf/Kb/UGF5/JdqZVAhO0B56WAUX6BPLDPd4tMa4IHcOpzaKeRvyd/ickDqPbnqdRJI/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbyiYAMUcrOJmGNqJOejPRQq2gMAWR6X98iF8Fyh7qKhIDJ/F
	LVmkRBL3+4Ixy9Eaaaut93XblnsQIdHbQ4LBEaqvxSKX1A0XpdMiYUwAjJi0
X-Gm-Gg: ASbGncu51dAnu0Jck/lh2j5QY5iDRqG+BNfa6POgfrKrou/nbwB+kw7U0ITVbGuUAO1
	Zqs0IAjBWho9XY1V0eGftW4Ggar5LZ1gfX1rvQ9sAjMdic4PrxNU7fNrWzL6W1hL7GI0x/6sa+9
	NPLtz4HmjJI00cTC2pokODt8kn6gwb8pT38gwHlZtOD9IsRRlL99zxTeaudbOWxwP42sUSZn/eK
	9hECvJtuGdIdJPXeErd3u7ZdUDLe0zTjeCsGtORg33DxVg5F3lUemQ8NFwprzllWElOUn7wfiCW
	5ipqK5DHd9uZXMMjMTTJ/TRyyJiFP99fVjW66AUKjkm5Owc=
X-Google-Smtp-Source: AGHT+IFflasDmdaMxz/Q/243jHx3mehZk/s401QCVVlNzb6cxZjMiYgccnG1R9/2IXZNfxbgGWxpEQ==
X-Received: by 2002:a05:620a:46ac:b0:7b7:342:a0a5 with SMTP id af79cd13be357-7be6325c750mr4760313085a.55.1737645621944;
        Thu, 23 Jan 2025 07:20:21 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147e315sm778296685a.29.2025.01.23.07.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:20:21 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467a17055e6so11099621cf.3;
        Thu, 23 Jan 2025 07:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoeW/r+lWUNxEXKuqzhHpCmcNHUuVDNlPkFaduv4vLia4Hs7MgU8k0BEaTQQPBzvoxTSo24CNXLPoOmYIs5Pjongo=@vger.kernel.org, AJvYcCWz+28/tAq6IHUzAHNgjbGOKFAfzDnOm8WL/Wj8oIqxBbd2bQGFLx2SExoNCI4+gtx9evToKldazEP3Xg==@vger.kernel.org, AJvYcCXWavkags0HG8yQ2lGOGu5GIXvXmZDQaDyam8byvkOU33uRNvfsZWtXMGjQSYKvfVcaSSNfHOHnmYSZu3g=@vger.kernel.org
X-Received: by 2002:ac8:57d1:0:b0:467:5082:74bd with SMTP id
 d75a77b69052e-46e12b5d0d0mr369967901cf.34.1737645621355; Thu, 23 Jan 2025
 07:20:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122062718.3736823-1-avri.altman@wdc.com>
In-Reply-To: <20250122062718.3736823-1-avri.altman@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXB2NLs0yVSf_3RpUip4pAW5kC8Y0Ow2G_GiZirZW1Yjg@mail.gmail.com>
X-Gm-Features: AWEUYZlQesBH4fbpGEQSzgNmsnOvmsrLyVsCaCkWD61GGGoKz7G9_d-4RwZOlH8
Message-ID: <CAMuHMdXB2NLs0yVSf_3RpUip4pAW5kC8Y0Ow2G_GiZirZW1Yjg@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Ensure clk_gating.lock is used only
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

On Wed, Jan 22, 2025 at 7:30=E2=80=AFAM Avri Altman <avri.altman@wdc.com> w=
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
> To fix this issue, we use the existing `is_initialized` flag in the
> `clk_gating` structure to ensure that the spinlock is only used after it
> has been properly initialized. We check this flag before using the
> spinlock in the `ufshcd_setup_clocks` function.
>
> It was incorrect in the first place to call `setup_clocks()` before
> `ufshcd_init_clk_gating()`, and the introduction of the new lock
> unmasked this bug.
>
> Fixes: 209f4e43b806 ("scsi: ufs: core: Introduce a new clock_gating lock"=
)
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Avri Altman <avri.altman@wdc.com>

Thanks for your patch!

I just ran into the same issue on R-Car S4 (S4 Starter Kit).

> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -9142,7 +9142,7 @@ static int ufshcd_setup_clocks(struct ufs_hba *hba,=
 bool on)
>                         if (!IS_ERR_OR_NULL(clki->clk) && clki->enabled)
>                                 clk_disable_unprepare(clki->clk);
>                 }
> -       } else if (!ret && on) {
> +       } else if (!ret && on && hba->clk_gating.is_initialized) {
>                 scoped_guard(spinlock_irqsave, &hba->clk_gating.lock)
>                         hba->clk_gating.state =3D CLKS_ON;
>                 trace_ufshcd_clk_gating(dev_name(hba->dev),

This looks like a very fragile solution to me...

In addition, while this change does fix this particular spinlock
warning, it just BUGs in a different place later:

  do_raw_spin_lock+0x34/0xb4
  _raw_spin_lock_irqsave+0x1c/0x30
  class_spinlock_irqsave_constructor+0x18/0x30
- ufshcd_setup_clocks+0x98/0x23c
- ufshcd_init+0x268/0xd2c
+ ufshcd_release+0x30/0x74
+ ufshcd_send_uic_cmd+0x70/0x90
+ ufshcd_link_startup.constprop.0+0x70/0x258
+ ufshcd_init+0xa38/0xd2c
  ufshcd_pltfrm_init+0x618/0x738
  ufs_renesas_probe+0x18/0x24
  platform_probe+0x68/0xb8

I think you should initialize all your spinlocks (and mutexes) early
in ufshcd_init(), instead of sprinkled across various helper functions.

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

