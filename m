Return-Path: <linux-renesas-soc+bounces-9679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBA999FA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 11:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34670B2337B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD8320B206;
	Fri, 11 Oct 2024 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNA9MPug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACE20B219
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637297; cv=none; b=qb6rtm5W5hFeC4TlPbEBwqDKvnLLG0s/h3yD+/NUSCc1U6Zp+hW2C854XQk58RFp82ANqxLpS6nItt078Nt8NnerK+ItBihjQO6jWaEzMCqfYaxk2ZJLZhrP7zGlMyVF4t4Oez9cMQi+cZcc7vsc81yo4jC08GiYxDWvTF/6vzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637297; c=relaxed/simple;
	bh=Dyvc1hT1flFeIacwdVSAlue0XArB/366D9AA2i7L9S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IH9fDmF1MTyrisYarQOq381UJ/qWUy43m5/Pr1L820DFWylP5ngOqZgyjBZ1bgZWeIp53slpMm5+JBeOFV0UwOHS6utG2Q4k5I4KcVVoy9mt0XudwgseuOM+zzPMgBaIKK6SCnwJVT7JYoRiQQoUDIMnyfnWeQH0IBe9qNxOAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNA9MPug; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50ca026e121so554249e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728637295; x=1729242095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uysJ7g+c/tt2dpBPUV7oA+MLpFLA1hU06tcG89yiU7Q=;
        b=GNA9MPugbQY/2MmrcNMyC1JyBSCRsRIan5+t3D+LPtEzUTbPvqoUNgBtxvIAVVvjIL
         8gQsH56appXShD8f41U1HOq3PO9gbVpNwMvD3HHRvZ9YJs8vIMYHvgefEFElCu9DoMCF
         CiIzk9VKFKV0r4EPN9/xqTKDM14gHUvF9ATJMj9CHZ7wkhDjCYHJMBvh5nSTivovpyQX
         CcXPvGuahkk+EseiLlBR/olyZn20fjQgxcWdT7UU61SJtlQw30VV1czkMjKJQy4rroDQ
         wQ089l+lHYkwxBpU21YgtznivS7bsGIBLkMYEKgMaJA5VcsMxIXOwnIuLOyPKLC1u4Q8
         Th1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637295; x=1729242095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uysJ7g+c/tt2dpBPUV7oA+MLpFLA1hU06tcG89yiU7Q=;
        b=EKpAlDMdd2HR/gfRuNJl8y/rvCaiIfVWB5/20JWWOU6gZdZTpXoNhdWi2uAkQO2DH4
         nwtM3wro4EAh5kcu9D5v41E3wMt5W7y2Ka2gNLz9AY1UKx6QEHvqxRuUzw+U1dquihbp
         2jKKgLRBoldTIUV8uVEIqHKeqkzXlnzfyjvqIgeY1wB++ZKzMj9zVc6OAk8pmMtRWLZW
         JgjKUcavWseUQY45xLC8uunGEb31lvT1lc9Zu3XQLas5yosKE28wFRocDB142p7COKdH
         zj+YorUMzfqUoOnSpAy6JRm8kGHnL8xoYf/924SJ1ReU9ZA2I82a3GgiXVQYEmnzwpYI
         Og/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6/iMS4NGCvBmxSvSQa0DPykhQXaX/ESWVuUkCAYp0BFx19o551oM2NGTxCagN4BUj6OcQeDTgWZNw/SoIALFn5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUP8Ihk/tTJU0M77Dpu8ISxEo4OOTszkhrYN6C1dnz7qO3eJl
	lzlXQwYulbEQHJXQcTKwuvJ0Uh2nqQo3P03NFqlZ0mhgFr3MEO63A3EieoxDxXmATPQF3VKYPL9
	yluvZ6wAQL6tpyMBhCZfrfiuvvMQvE3Jn
X-Google-Smtp-Source: AGHT+IFBEvQhqZAmhiXkT2DRgMS3AuuEHdltOVaoqYhXUWN+hvc3GaO0nF1TMt8WnObwooqUeHJIKhvjoPeOe/Z9oKI=
X-Received: by 2002:a05:6122:c87:b0:507:81f0:f952 with SMTP id
 71dfb90a1353d-50d1f56e250mr784275e0c.9.1728637294709; Fri, 11 Oct 2024
 02:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
 <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com> <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
In-Reply-To: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Oct 2024 10:01:08 +0100
Message-ID: <CA+V-a8tAmhb4fGo3xVSo5NY2KmhKL8iJkL3W8qKOcOuNmHMj+g@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Oct 11, 2024 at 8:26=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 11, 2024 at 12:19=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Oct 3, 2024 at 1:36=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > RZ/Five cannot be supported by the standard RISC-V defconfig due to i=
ts
> > > dependency on NONPORTABLE.  Hence add a separate defconfig for Renesa=
s
> > > RZ/Five boards.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Not intended for upstream integration.
> > > To be applied to my topic/renesas-defconfig branch, which already has
> > > arch/arm64/configs/renesas_defconfig.
> > >
> > > Tested with OpenEmbedded nodistro.0 smarc-rzfive (eMMC and nfsroot).
> > >
> > > Any other options that should be enabled/disabled?
> >
> > diff --git a/arch/riscv/configs/rzfive_defconfig
> > b/arch/riscv/configs/rzfive_defconfig
> > index 31483a1d520c..82709dd712e5 100644
> > --- a/arch/riscv/configs/rzfive_defconfig
> > +++ b/arch/riscv/configs/rzfive_defconfig
> > @@ -3,6 +3,7 @@ CONFIG_POSIX_MQUEUE=3Dy
> >  CONFIG_NO_HZ_IDLE=3Dy
> >  CONFIG_HIGH_RES_TIMERS=3Dy
> >  CONFIG_BPF_SYSCALL=3Dy
> > +CONFIG_PREEMPT=3Dy
> >  CONFIG_IKCONFIG=3Dy
> >  CONFIG_IKCONFIG_PROC=3Dy
> >  CONFIG_CGROUPS=3Dy
> > @@ -57,11 +58,7 @@ CONFIG_CAN=3Dy
> >  CONFIG_NET_9P=3Dy
> >  CONFIG_NET_9P_VIRTIO=3Dy
> >  CONFIG_PAGE_POOL_STATS=3Dy
> > -CONFIG_PCI=3Dy
> > -CONFIG_PCIEPORTBUS=3Dy
> > -CONFIG_PCI_HOST_GENERIC=3Dy
> > -CONFIG_PCIE_XILINX=3Dy
> > -CONFIG_PCIE_MICROCHIP_HOST=3Dy
> > +# CONFIG_PCI is not set
>
> Disabling CONFIG_PCI explicitly is not needed.
>
Oh I missed it.

> >  CONFIG_DEVTMPFS=3Dy
> >  CONFIG_DEVTMPFS_MOUNT=3Dy
> >  CONFIG_MTD=3Dy
> > @@ -124,6 +121,7 @@ CONFIG_MFD_DA9062=3Dy
> >  CONFIG_RZ_MTU3=3Dy
> >  CONFIG_REGULATOR=3Dy
> >  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> > +CONFIG_REGULATOR_GPIO=3Dy
> >  CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> >  CONFIG_SOUND=3Dy
> >  CONFIG_SND=3Dy
> > @@ -141,8 +139,7 @@ CONFIG_SND_SOC_WM8978=3Dy
> >  CONFIG_SND_SIMPLE_CARD=3Dy
> >  CONFIG_USB=3Dy
> >  CONFIG_USB_OTG=3Dy
> > -CONFIG_USB_XHCI_HCD=3Dy
> > -CONFIG_USB_XHCI_PLATFORM=3Dy
> > +# CONFIG_USB_XHCI_HCD is not set
>
> Disabling CONFIG_USB_XHCI_HCD explicitly is not needed.
>
ahh I missed it.

> Did you run "make savedefconfig"?
> Some more options disappeared after disabling PCI.
>
I didn't savedefconfig, thanks for fixing.

> >  CONFIG_USB_EHCI_HCD=3Dy
> >  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> >  CONFIG_USB_OHCI_HCD=3Dy
> > @@ -210,6 +207,7 @@ CONFIG_DEBUG_MEMORY_INIT=3Dy
> >  CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> >  CONFIG_WQ_WATCHDOG=3Dy
> >  CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> > +# CONFIG_SCHED_DEBUG is not set
> >  CONFIG_DEBUG_TIMEKEEPING=3Dy
> >  CONFIG_DEBUG_RT_MUTEXES=3Dy
> >  CONFIG_DEBUG_SPINLOCK=3Dy
> >
> > For some reason when CONFIG_SCHED_DEBUG is enabled, the USB host on
> > CN1 isn't working!
>
> Strange...
>
Indeed.

Cheers,
Prabhakar

