Return-Path: <linux-renesas-soc+bounces-12550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39AA1D3E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97ED165D23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2319F1FC7F3;
	Mon, 27 Jan 2025 09:55:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6EE25A63B;
	Mon, 27 Jan 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971702; cv=none; b=A9i1xXzQixFmhX3//7t4IIXUOR6UMLBi1Oji4E5O8T5o7k5AH6k2/4hasoSHGPh2m6F2bdw7hsBGek+nzo7CTKCteYL2sTZsJ3azoj2XPdOqryAElD182UckaV6CpG7lbQ/bAsNcaMNJZGgHxV/J2sE1O6CHqRz4xwRBB9jG3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971702; c=relaxed/simple;
	bh=wI2MI1SvuFFSmxkNSztzguAzu//gS6EP7dYwvjoR0Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LN9+x1pLK9cfG64ysDUln4JOeqscu8QkiVVmqOIWYwvrJwnjm7O8sRamgHyQwKSin/nToV2qNMbpZAlvxRKF4XHmzF85+8n22TpL1jkfAYpfMh2aihk1Y1tx2R0JbRPhoQqhrzqbMqUjZTnuxAvnGI1m+xd/isrr8zZv26Me1Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so7069390a12.3;
        Mon, 27 Jan 2025 01:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971696; x=1738576496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whmSZOMUlX7hDwHISdn0Fz19xGI3VMEBEw5rpXP/x5c=;
        b=JG+G2OgHRIRDAM8LoJEKc2QZ37hkZQNJeHzIAp+YKJ/dlArXv5I8JrP5W88HgFse3Q
         wKn4BJgnwmKDDsOmN0xyhTB5UYYJiG/KJXIzQNbTcrf/rzr43aqr+I8vTMadUZN3s7vh
         WA5HsrvgEBe8uFIIFIMqMLP5iKaWVoYdEBFnWYNlzHjws3eh3GR001asjhHKY9IiA3Zq
         3jKkqnIQVQ59j+vRDh9I+0Myc8M21ksdtvBEyOj41/zhHcMivHARVJEsFt9Es0O4kTzS
         oGXhuIJT7jPZlERPxdobhAg3frXNW38R4FCQmw35BRdYSfPypsssXhtJyQJ5CWuidE2O
         BQsA==
X-Forwarded-Encrypted: i=1; AJvYcCU25Be15WOMQLhDQGg+j57ISq+z4wOeADysLmubFAcFFCnuPyXDCaBzzH2zucEFVXjKv6qzfOrRD3eHcA==@vger.kernel.org, AJvYcCUQHuvY0gzr/Mh0rQuJioShiQ9j4Hn50GW/hRV1NkTsADDIF12BbLvS/c7oqdqMW3nqQLsNEZZk7/jJ0xmtERpe0ao=@vger.kernel.org, AJvYcCWdY7PEtXvYZmI7DYkyG2B/8oX0axlE+N+XYE78yCuJfWZrvTM7ZcSROSFZ53wTwX49lCWzjB4q459PwiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiORfv5RupBniNV0hMdQ4RzbTfdaeeP1FbeNh1ulWK4d8LAEB
	nJmj6OHG+XkOtSepN/IK12iTmFm9GSxR7Pz/GYzqSlyZ/qagsqjKMQgSItRs78o=
X-Gm-Gg: ASbGncu2Dh8XiT6oMXKqVZ2jTK+oCteeA9wjHzlUFYqFAYa8gQ7ALadggkrU+uc23Xr
	L+4aNIOAAQ1UcO+09D2Je0h/uYv5EgaG+5FHQZgRD5DTTgyXu0uLQmXvV9d6xcF6Xfhm7g5rx5c
	Wpk+ttFwiK0BlTVLbyoAYIgocXLOPsGSPFj7hPtvTZ3sZOhVCyd5HTScLqn20WyF0KWMP8lRedw
	Apleu9totPGYKW1PvOHgp+JAtlI5ZLUsFjIbQbulaymINzX2IvC3ig4Q2V5idD0gNDHcWM49Bdr
	8EUdBKqbtQiaG++cOQOo9Xoiibu6fovX3xCylkkvJtA=
X-Google-Smtp-Source: AGHT+IFmO08OYPdZqmEb3B/3bGtF0KdzVj3bE2qnCCjdolrGphsSaptR+zS1AW/E0OjYdZ4uUXwZ1A==
X-Received: by 2002:a05:6402:2742:b0:5d9:f21e:ffd with SMTP id 4fb4d7f45d1cf-5db7d2ff8ccmr96335510a12.15.1737971695812;
        Mon, 27 Jan 2025 01:54:55 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186b318fsm4997066a12.62.2025.01.27.01.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:54:52 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so6122318a12.2;
        Mon, 27 Jan 2025 01:54:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/n4pJH8B+V2stmGZTsK/t7wkKjDugN9dv2pC+N9wG6vUo+LblqRmJHZbsgp8tHNWfJ7ulR+7m+bk8B0zPypR/g0g=@vger.kernel.org, AJvYcCWUWxZVSZA2luiOmdwsEK2lCXBMzG1+XyfpMB3biArfP0MlkbXbTMiZXHvHUgDEv9xmzEtIRg9P4SSNrg==@vger.kernel.org, AJvYcCWqjZb66aZIIPVjNIzg240eAnZXk30ANZTiJJhsjtsS/Xl0ih+t4CBzMTgxJ4LaWR6vGvTwDr2/Ra0tdUU=@vger.kernel.org
X-Received: by 2002:a05:6402:34ca:b0:5d0:81f5:a398 with SMTP id
 4fb4d7f45d1cf-5db7d2dc58bmr88994357a12.1.1737971692160; Mon, 27 Jan 2025
 01:54:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126064521.3857557-1-avri.altman@wdc.com> <20250126064521.3857557-2-avri.altman@wdc.com>
In-Reply-To: <20250126064521.3857557-2-avri.altman@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 10:54:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrBf1YSLE-0Nz19HFyYpm=Pi0XW1vXkJZS8eE=7rhkyw@mail.gmail.com>
X-Gm-Features: AWEUYZnsye0rUo3giGsALV-wsrzE0X1pASWTSM0oWu6VSW_ObvApkNRsxBNc104
Message-ID: <CAMuHMdUrBf1YSLE-0Nz19HFyYpm=Pi0XW1vXkJZS8eE=7rhkyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] scsi: ufs: core: Ensure clk_gating.lock is used
 only after initialization
To: Avri Altman <avri.altman@wdc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Avri,

On Sun, 26 Jan 2025 at 07:48, Avri Altman <avri.altman@wdc.com> wrote:
> This commit addresses a lockdep warning triggered by the use of the
> clk_gating.lock before it is properly initialized. The warning is as
> follows:
>
> [    4.388838] INFO: trying to register non-static key.
> [    4.395673] The code is fine but needs lockdep annotation, or maybe
> [    4.402118] you didn't initialize this object before use?
> [    4.407673] turning off the locking correctness validator.
> [    4.413334] CPU: 5 UID: 0 PID: 58 Comm: kworker/u32:1 Not tainted 6.12-rc1 #185
> [    4.413343] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
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
> Do that unconditionally as initializing a spinlock is a fast operation.
>
> Fixes: 209f4e43b806 ("scsi: ufs: core: Introduce a new clock_gating lock")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Avri Altman <avri.altman@wdc.com>

Thank you, this fixes the similar BUG (s/ufs_qcom_probe/ufs_renesas_probe/)
I was seeing on the Renesas R-Car S4 Starter Kit.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

