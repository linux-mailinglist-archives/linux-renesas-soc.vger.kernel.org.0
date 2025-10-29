Return-Path: <linux-renesas-soc+bounces-23850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28CC1B31E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D411C26652
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418DF2E5B2E;
	Wed, 29 Oct 2025 14:08:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4B2E5D17
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746903; cv=none; b=AGjNOKrJyutGvsKkpTbB5lduQFBldGbzFfjvXaDWVar93a0gXEoCdQiXoEITOqI791rBMLDy/LCjD8EvKu6O2pDltlCK2cJzgGUfg2KKiY1P8WwnlnrQm9IhDnCG3uMWzv+m1w+AIpE3rpXe/RRv8rU3+5S/JqNwTnYqmJTOtcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746903; c=relaxed/simple;
	bh=wRjdY7ZG2QLMLshIoHWPsaZXMglT8RAa2hPK7jmpnJQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QRNO5rebfO6obOwANiDO/zhty30zXNGitKy1f+xF4Ka/pvO4IK/j7F0m5mQtQt9wjJbytenayTS4NgfsMhgO3WnnMK4nFVWaJSlxaJtH0sNlnmxDRCBp0+G2Z+r4q6+kHCt66cYaTQTlU0RejsCAnP54R6NtkKDDcRUfg+CtfIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db3b074f58so7340061137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746899; x=1762351699;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOPVCmUJ4ZNRYV3mHvcjLSYwchRBNgJJbT+F/028/Ck=;
        b=Q35Thszdrq795G3ggESL9nO4u2NYQd+WYqK2Yc/aLDoIMN+xIExBmduOoIc4h5ow2/
         K5dCtBko0GaKmGF6nBLQysl01RM7Fe4Rp2Dure8Gyt0lXWDeTXpmpHFmFHNsQvATZ3dy
         bxLd2ozEP3J9emKZiEjkz123YQF7KpLBFKcLbggFUkorcw3bHxE1NINa69IrY7koDP/a
         HyqylC9IiQuEIyadUKseYWVMnpBSG1cB585KovGAsoxOqwjS9KLrS4M40YG1hA/spAoI
         jHvr0hm7u/xH5MXXb6TlWURYZ8tq9qPKy4OdjEBvbRN55Rc023qWJooyWkRdiWRmM7lv
         dLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBgZKHvIUUuawlKkeEwfzAwTLs3agg8nejIbu7mjMsNglLepIqCoep392XQz4Pp5rGYjmGpUnAdH4OT8vrc87awA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Sh6P7lJkcHnR8tBXUe+PKDS0ZjCP4ys0dSHCYEKAokcePvDo
	RKKAonRjXpV+OwCqfaEz5WOfXqrA3fuUIQ2udk5OxGoVWGMGsdms4B+rXrXPGwHg
X-Gm-Gg: ASbGnct3u1AnwYlYlrOFhLzQrizyGIsHCCBUVt3hqkC2PF/rI1xwkMgc2g03PHTP3gS
	FGpK5UZf8CI1lv8keG16jMwjaReo492SmQGeNJvEHZfoCFjfjGRyLkwy2GnbG5FZlR1JdTBEv2S
	ipE9de8yqJ/YB8c7/fGWEWUr8ujqLMkcObtmgDfoT7kGQUhG1uMLJvm7kzi4own+mFVwNjnlwkw
	+WkJ+ATCN5bLEc2IFSmSEKr074E0Bl8RJ0rtlYdRajwNBENueeCvGyLTxvfUvlEWHeOgObJcOOL
	JKwQUdv5KMVg8bv/ZuXhjybvjO/0L7ah8YzEDS6VkQjYJ0SbBZjTXNipj3vSPh0fEFO99IcG5iW
	zHpaboPXF24aQS/ZjJIF3AVnAqvXRyiDZRYNK+VPGsyPbEO/PH7PE3oiLIsMhVq/ZWhTQuIeSud
	PE9MMhnwh4anKkyUu/Mhr95MJQwSzXN9i7+zKoixIOXsOfvUnpsGDw
X-Google-Smtp-Source: AGHT+IGfrvlvXAz91ezcnnhTA8J07BCKx15nbP+TP7gT2b8Y0tcGGNRqDC3JkH5U77tzkoJIZvUMbw==
X-Received: by 2002:a05:6102:3fab:b0:5d5:f766:75f1 with SMTP id ada2fe7eead31-5db90601534mr1043833137.11.1761746899372;
        Wed, 29 Oct 2025 07:08:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e5922a9sm5032699137.12.2025.10.29.07.08.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:08:19 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5db7dcab01bso1921866137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkm34hb/4jGdQ4IjaGCmSXyTUtOwYW/QQ4n3Qzb/U7iUdt1xfYpirrjyC2E6b5bYzJGN1N8V2XOTD9Gz7jVyb+cA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:5d5:d1e1:73e8 with SMTP id
 ada2fe7eead31-5db9060234amr888440137.13.1761746898835; Wed, 29 Oct 2025
 07:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:08:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnMfLsD6ckHkiLwQYsmzX9C30w05ySYiahP4F0MOeUnduw0r08f34AHIpM
Message-ID: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
Subject: drm/imagination: genpd_runtime_suspend() crash
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

While playing with the PowerVR driver on various R-Car SoCs, I ran into
a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
the GPU device node to DTS, the driver fails to probe due to lack of
suitable firmware, as expected:

    powervr fd000000.gpu: Direct firmware load for
powervr/rogue_36.53.104.796_v1.fw failed with error -2
    powervr fd000000.gpu: [drm] *ERROR* failed to load firmware
powervr/rogue_36.53.104.796_v1.fw (err=-2)

However, after that it crashes:

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000040
    Mem abort info:
    PM: GENPD_STATE_OFF
      ESR = 0x0000000096000004
    PM: sd_count 19
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [0000000000000040] user address but active_mm is swapper
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 2 UID: 0 PID: 46 Comm: kworker/u16:2 Tainted: G        W
     6.18.0-rc3-arm64-renesas-04934-g585255656363-dirty #3296 PREEMPT
    Tainted: [W]=WARN
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    Workqueue: pm pm_runtime_work
    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : default_suspend_ok+0xb4/0x20c
    lr : default_suspend_ok+0x9c/0x20c
    sp : ffff800081e23bc0
    x29: ffff800081e23bd0 x28: ffff800080e2d240 x27: ffff0004402d8bc0
    x26: ffff0004402e2900 x25: ffff000440b554e4 x24: ffff80008108bb70
    x23: 0000000000000001 x22: ffff80008108bb88 x21: ffff800080e2c568
    x20: ffff800080e2d258 x19: ffff000440b55400 x18: 0000000000000006
    x17: 2030683937376138 x16: 72206e6f20646573 x15: ffff800081e23510
    x14: 0000000000000000 x13: 3035616234383138 x12: 3030303866666666
    x11: 0000000000000533 x10: 000000000000005d x9 : 000000000001b64f
    x8 : 7f7f7f7f7f7f7f7f x7 : 205d373032323131 x6 : 0000000000000000
    x5 : 0000000000000030 x4 : 0000000000000000 x3 : 0000000000000043
    x2 : ffff800080e2d258 x1 : ffff80008108bb70 x0 : ffff000440b55400
    Call trace:
     default_suspend_ok+0xb4/0x20c (P)
     genpd_runtime_suspend+0x11c/0x4e0
     __rpm_callback+0x44/0x1cc
     rpm_callback+0x6c/0x78
     rpm_suspend+0x108/0x564
     pm_runtime_work+0xb8/0xbc
     process_one_work+0x144/0x280
     worker_thread+0x2c8/0x3d0
     kthread+0x128/0x1e0
     ret_from_fork+0x10/0x20
    Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
    ---[ end trace 0000000000000000 ]---

This driver uses manual PM Domain handling for multiple PM Domains.  In
my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
NULL when psd->refcount reaches zero.

Later/in parallel, default_suspend_ok() calls dev_gpd_data():

    static inline struct generic_pm_domain_data *dev_gpd_data(struct
device *dev)
    {
            return to_gpd_data(dev->power.subsys_data->domain_data);
    }

triggering the NULL pointer dereference.  Depending on timing, it may
crash earlier or later in genpd_runtime_suspend(), or not crash at all
(initially, I saw it only with extra debug prints in the genpd subsystem).

As the driver mixes automatic (devm_*()) and manual cleanup, my first
guess was that devm_pm_runtime_enable() would keep Runtime PM enabled
too long after the manual call to pvr_power_domains_fini(), but
replacing that by manual cleanup:

    --- a/drivers/gpu/drm/imagination/pvr_drv.c
    +++ b/drivers/gpu/drm/imagination/pvr_drv.c
    @@ -1424,7 +1424,7 @@ pvr_probe(struct platform_device *plat_dev)
            if (err)
                    goto err_context_fini;

    -       devm_pm_runtime_enable(&plat_dev->dev);
    +       pm_runtime_enable(&plat_dev->dev);
            pm_runtime_mark_last_busy(&plat_dev->dev);

            pm_runtime_set_autosuspend_delay(&plat_dev->dev, 50);
    @@ -1450,6 +1450,9 @@ pvr_probe(struct platform_device *plat_dev)
     err_watchdog_fini:
            pvr_watchdog_fini(pvr_dev);

    +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
    +       pm_runtime_disable(&plat_dev->dev);
    +
            pvr_queue_device_fini(pvr_dev);

     err_context_fini:
    @@ -1475,6 +1478,8 @@ static void pvr_remove(struct
platform_device *plat_dev)
            pvr_device_fini(pvr_dev);
            drm_dev_unplug(drm_dev);
            pvr_watchdog_fini(pvr_dev);
    +       pm_runtime_dont_use_autosuspend(&plat_dev->dev);
    +       pm_runtime_disable(&plat_dev->dev);
            pvr_queue_device_fini(pvr_dev);
            pvr_context_device_fini(pvr_dev);
            pvr_power_domains_fini(pvr_dev);

did not fix the issue.  Calling pm_runtime_force_suspend() instead of
pm_runtime_dont_use_autosuspend() also didn't help.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

