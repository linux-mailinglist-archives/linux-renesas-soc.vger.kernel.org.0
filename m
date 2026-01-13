Return-Path: <linux-renesas-soc+bounces-26676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D96AD19709
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 15:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7245C309F779
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 14:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17938202F9C;
	Tue, 13 Jan 2026 14:19:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7827FD4F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313971; cv=none; b=cEXGcya11bpZ8x+yG7aZiTSD++WhldMP7K1swQicLmco0ygvm4nGiGx7z/FOVXr3xwM54Xax5yBUayJTPwOFlfc/RPPFamoZ9lBQofgSGq13a8q6zuL3hWgmibyu3lJrgaA1ZqOId3HFQdU7gPpvt63E7CIpUOGUrN48FPyq2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313971; c=relaxed/simple;
	bh=uIpqQqtA/lJKBwjwwDPXE3suNhtvcxttY7BDb8S7rWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmjSSJ4mlZZzEzexCBQSzoRQB+FZQ921+N+CtTXNlPvtzAmIhXSelitW8QYszhAnepNxRamdejVPmCwnup0hp0X4wjVqOlqv9EAUvK9bPOXeIzU+K7yXDSjH8jmv2opTQPp8UOom9DkeZVCyW6vygDqVj5RQYqcKGsvT62C10UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ee99dec212so1841382137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 06:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313968; x=1768918768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwGbtz4WHBgjbaUVUACc9YQ7tp8fqM7Cfldv3SNB0Jo=;
        b=kvMl5SCl8YKjoQYa6bas+5+e6CSjKlcxZkbAfRG+aw5K6TFLeAqC+aM9jSP3YTIIiU
         xHaNO14gAPTBfXli8V2PCgoF1lzQ4ahjnG2zl96vCqrAerjJUzwGANwZ2/0e+EKN1WnV
         khBD5FzIKu6nM5QVKaEQPZJK0Za8zEismxXd15moknUYHxPNwOm68SbnySX8oG3UQHO9
         AMeLWwfcMczJ1fP0lcZPzO/5uXK+RGUhQZr+uM+PQMPvxACdjlwj3M/6tVpCnFEj343Z
         t72YdByXn6EMzMekPr7ibiGcd3JBQf7E0WIC6R7IU+PZvdnlWy2yjkfekKNyGDwOa+bo
         6roA==
X-Forwarded-Encrypted: i=1; AJvYcCWM4gNCPt5BBnRd/3RenjAbX7sEz+zhZhQgrXOyAz9LGKJVQvapeYWhMJZAI0nfZTXQdUD/CMmcdHb7CyK8bjw6aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6vt8bDp0qtwcrQVh/6fJMQYgNvd20rR6hG2UO85xWZB6iPnR
	cLFUQXuiuSHLMAXfPrq7WVZ73MkfMr6SyeZJgMLVlFRVq9QLZTlx7ee+kNtQQKnK
X-Gm-Gg: AY/fxX7IgP5PWEDxQICjHW1bC4c45wiPheoWyjMr67X63/KJvR3uAIKjac0PpmSPzwL
	f5Nt4w5Czgf5op54PWDbcVUGIUjYiMCpccEPC9/yo+V+1mCIg/glo/8HDNoXIJfE4c1U5OxWd8j
	0XYt/jZ07M6nshfHIxkg5t8WKT1pKQLK6Uptb3bsc5kaCXtOcrxI1U/hjhJrsGmrtDFAqB4gOZ9
	RME06lbMQUsNv1HRvECgrS8fcjGQ5bEpu4Sad9uYAZy2XRZ90JofqL0cyqfJ1RkEcxXo/2Jt2jj
	+hQsgZCAA/9uC7W+Oy/yb40mUmYkvsWyUgv4aZU4XX+E1IQusKxR8Dt2KihyvGC2/quQ+EbQ+0+
	ZYLTpEPtRM0iip3Xdeu3vaHjsDoenaRMIsIFlafPigd6SB8ewqmcBwuLGf8i2NwWxHR0YSW4lDY
	WWFM2BOAtntqCYGumY7snDXhtPRCU7YA5eQ19Kaih+C1qewignmocC7JUxfrU=
X-Google-Smtp-Source: AGHT+IG6W9wrZZ2z+CJp6qp6PXsTM+wh5SwgUgODpGcADQxoXB3wmXYg4DoCU829e/X4CQxF9ueAuw==
X-Received: by 2002:a05:6102:3711:b0:5ef:8ad:a3c8 with SMTP id ada2fe7eead31-5ef08ada5b6mr5673934137.2.1768313966559;
        Tue, 13 Jan 2026 06:19:26 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ecc521d7b1sm19701974137.0.2026.01.13.06.19.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:19:21 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f16fbbdf98so241154137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 06:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT4LzBmlVoFJLHCtKLfhCQkd2F5HOIEi3qhQigoHZo8pXUd/9LuxW843T5q83TLCYZxi6dhOz9+DP46JED31ZO4A==@vger.kernel.org
X-Received: by 2002:a05:6102:5120:b0:5f1:55c9:11a2 with SMTP id
 ada2fe7eead31-5f155c91443mr2213235137.43.1768313960828; Tue, 13 Jan 2026
 06:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 15:19:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com>
X-Gm-Features: AZwV_Qgc2H6REA8fgJsKnqRk5KR8TM9uu7EdHnPsHrNotI7sbZvhls2j-N9ukmU
Message-ID: <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 1 Jan 2026 at 21:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on various
> R-Car Gen3 boards. The clock generator supplies 100 MHz differential clock
> for PCIe ports, USB 3.0 PHY and SATA.
>
> The series effectively has three parts, the first three patches are part 1,
> which fills in the missing USB 3.0 PHY on R-Car E3 Ebisu and enables it,
> thus aligning the Ebisu USB 3.0 support with the rest of the Gen3 boards.
>
> The second part is description of PCIe root ports on R-Car Gen3 SoCs where
> applicable, in this case that is H3/M3W/M3N/E3. The root port is used with
> PCIe port power control to also control the PCIe port clock. This is needed
> on Gen3 boards, because they often use separate clock output from the PCIe
> clock generator 9FGV0841 to supply clock to the controller and to the PCIe
> port.
>
> The third part is enablement of the 9FGV0841 PCIe clock controller on the
> R-Car Salvator-X/XS, ULCB and Ebisu boards. The boards use the PCIe clock
> controller outputs in a slightly different manner, all use the outputs to
> supply PCIe controllers and slots, as well as USB 3.0 SuperSpeed PHY. The
> ULCB board also uses the 9FGV0841 to supply SATA IP, but this is not yet
> described in DT, therefore it is also not part of this series.
>
> Marek Vasut (11):
>   dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
>   arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
>   arm64: dts: renesas: ebisu: Enable USB 3.0 PHY
>   arm64: dts: renesas: r8a77951: Describe PCIe root ports
>   arm64: dts: renesas: r8a77960: Describe PCIe root ports
>   arm64: dts: renesas: r8a77961: Describe PCIe root ports
>   arm64: dts: renesas: r8a77965: Describe PCIe root ports
>   arm64: dts: renesas: r8a77990: Describe PCIe root port
>   arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock
>     generator
>   arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock
>     generator
>   arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

Thanks for your series!

This causes a crash during s2idle on e.g. Salvator-XS with R-Car
H3 ES2.0:

    PM: suspend entry (s2idle)
    Filesystems sync: 0.014 seconds
    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000008
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    user pgtable: 4k pages, 48-bit VAs, pgdp=0000000504be2000
    [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
    Internal error: Oops: 0000000096000004 [#1]  SMP
    CPU: 2 UID: 0 PID: 1000 Comm: s2idle Not tainted
6.19.0-rc5-arm64-renesas-04116-g331b300b41b0 #3416 PREEMPT
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    pstate: a00000c5 (NzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : devres_for_each_res+0x60/0xe8
    lr : devres_for_each_res+0x48/0xe8
    sp : ffff800083263a70
    x29: ffff800083263a70 x28: 0000000000000000 x27: ffff0004c125aec8
    x26: ffff800083263af8 x25: ffff80008167bd38 x24: ffff800083263af8
    x23: ffff80008071b2f4 x22: ffff0004c125aed0 x21: ffff80008071acd8
    x20: ffff80008071ad44 x19: ffff0004c125ac20 x18: 0000000000000001
    x17: 00000000ffffffff x16: ffff800081b93ac8 x15: 0056c6b8a4d0b0e4
    x14: 00001998170d3e20 x13: 188a4fd930ce7024 x12: 0000000529c8ad17
    x11: 00000000000000c0 x10: 0000000000000960 x9 : ffff800083263a50
    x8 : ffff800083263b38 x7 : 0000000000000000 x6 : ffff0004c0dc36c0
    x5 : ffff800083263af8 x4 : 0000000000000000 x3 : 0000000000000001
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     devres_for_each_res+0x60/0xe8 (P)
     dev_cache_fw_image+0x5c/0x1a8
     dpm_for_each_dev+0x50/0x80
     fw_pm_notify+0xc0/0xec
     blocking_notifier_call_chain_robust+0x70/0xdc
     pm_notifier_call_chain_robust+0x24/0x40
     pm_suspend+0x13c/0x1e0
     state_store+0x7c/0x100
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x78/0x8c
     kernfs_fop_write_iter+0x128/0x1d0
     vfs_write+0x210/0x390
     ksys_write+0x6c/0x100
     __arm64_sys_write+0x18/0x20
     invoke_syscall+0x44/0x100
     el0_svc_common.constprop.0+0x3c/0xd4
     do_el0_svc+0x18/0x20
     el0_svc+0x24/0xd8
     el0t_64_sync_handler+0x98/0xdc
     el0t_64_sync+0x154/0x158
    Code: f94004dc eb1600df 540000e1 14000018 (f9400780)
    ---[ end trace 0000000000000000 ]---
    note: s2idle[1000] exited with irqs disabled
    note: s2idle[1000] exited with preempt_count 1

I do not know what is the actual issue.  Adding debug prints to
rs9_suspend() and rs9_resume() shows these functions are not called,
while adding 'status = "disabled"' to the renesas,9fgv0841 clock node
in arch/arm64/boot/dts/renesas/salvator-common.dtsi does fix the issue.

Perhaps you have pending patches for the rs9 or PCIe drivers?
Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

