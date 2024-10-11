Return-Path: <linux-renesas-soc+bounces-9674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB02999DDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9142B1C21599
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 07:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A16209670;
	Fri, 11 Oct 2024 07:26:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A31CDA19
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631591; cv=none; b=Q8R5bXTSmzsTotlFsoJK2tRgmnqROPPYYe9d+DmpawYjxansnPjBnE+K3PtoVW9/amANlZjRf2SpI/eawvPurrG+YL+/Fjg2+tJcBMpOUe3rphvbueg4QuY04ZGPxUF8+Nh368tcpwRYqn6xcZXAI4dASp+BoJH7USaukFZCasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631591; c=relaxed/simple;
	bh=uFiwRxs6CtwvVV4iG6JqilAz/Wh+2a4T3YWGPyqxuPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpIvLGs9JMDWhGSLlWgfj/E5szxqM3CBwjnd/BzDjoC38AM0EPcjb//xK4xi8aE0XCADJtbr1aYgMSYA7XXqPk/LS3lVJxiXzLAIUy3WTLptziacAob/bxOkzyLYuaEYCILOpdVlU3Q2u+ToZLWoJaVSksoc7z9BJ+ix9QCPTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2ef9af517so14179047b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 00:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631586; x=1729236386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQQ1VEp/hWCoHnkuuRaXbGE5WhacSoFckCw5LF0pLDA=;
        b=L4I620ucIq3qQCt6c4O4v8PdOgS9/9ant09Y57UaGVXJjFMSf/x1cFL6bgoEK19agf
         ZZMRRjXlw8skmUa1VY9XpnHNgmlX7zIbc7A0b9TiV7I0s0Ak1NmjV4PL50kTwSn4amTi
         RvyWbFjCiqTVEm7j3v11+hrA5EDm4Y5ceXAtp0XxEtoKxaDRdiiRVed2j4RvcaJmQ561
         i7ZkpKBgDMDFvpI+c+QfWManmpr8KiM+3319vE3XvcF2KQ1s4OiPfzHzsWxW0pGQe1pN
         SA2SPFk5ATz/bsG1gpfzPi60xxgUXp9nPKLYGgrDisf9gUXBjq8+x7OrDrsZbxB/fW3K
         zABA==
X-Forwarded-Encrypted: i=1; AJvYcCX2kLGTULcbLfcWdzU9qSisrTPq4aVoeqFemTtUftPwgFU0V/P79OtqcP4GofgCvawyvLFIenZS+UqLEfmnc3dIng==@vger.kernel.org
X-Gm-Message-State: AOJu0YybGeiduJZqhivBp64cjTGaEBa1FuMMZ0d6fYkbzQvWb65l3ifK
	rtlD573pnzquAEFx6xQFyUatcW1Yj/kxF4hGoTyboCFZdySiPhjm0hoTKnZ5zJM=
X-Google-Smtp-Source: AGHT+IGKyOQgmj9hVQyC8bX8zTr7MHgivLo/wLNcjRJhACXQdEpanI9GDE4P/zUx+mqT5nJg9TTDCg==
X-Received: by 2002:a05:690c:718d:b0:6e3:23a4:9cde with SMTP id 00721157ae682-6e347c8fc3dmr8334427b3.42.1728631585954;
        Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c6de60sm4821607b3.108.2024.10.11.00.26.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db20e22c85so14375857b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPPCIWhUBrcmJ0BXtdtQtTPiCMqF7mF76D8IiEZUt2+j0blAsnKfCvSLIarSMg/OkIpqxGmw39OOYdSR4qQQpjmg==@vger.kernel.org
X-Received: by 2002:a05:690c:7686:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e3479b9566mr12010507b3.13.1728631585096; Fri, 11 Oct 2024
 00:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
 <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com>
In-Reply-To: <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 09:26:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
Message-ID: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Oct 11, 2024 at 12:19=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Oct 3, 2024 at 1:36=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > RZ/Five cannot be supported by the standard RISC-V defconfig due to its
> > dependency on NONPORTABLE.  Hence add a separate defconfig for Renesas
> > RZ/Five boards.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not intended for upstream integration.
> > To be applied to my topic/renesas-defconfig branch, which already has
> > arch/arm64/configs/renesas_defconfig.
> >
> > Tested with OpenEmbedded nodistro.0 smarc-rzfive (eMMC and nfsroot).
> >
> > Any other options that should be enabled/disabled?
>
> diff --git a/arch/riscv/configs/rzfive_defconfig
> b/arch/riscv/configs/rzfive_defconfig
> index 31483a1d520c..82709dd712e5 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -3,6 +3,7 @@ CONFIG_POSIX_MQUEUE=3Dy
>  CONFIG_NO_HZ_IDLE=3Dy
>  CONFIG_HIGH_RES_TIMERS=3Dy
>  CONFIG_BPF_SYSCALL=3Dy
> +CONFIG_PREEMPT=3Dy
>  CONFIG_IKCONFIG=3Dy
>  CONFIG_IKCONFIG_PROC=3Dy
>  CONFIG_CGROUPS=3Dy
> @@ -57,11 +58,7 @@ CONFIG_CAN=3Dy
>  CONFIG_NET_9P=3Dy
>  CONFIG_NET_9P_VIRTIO=3Dy
>  CONFIG_PAGE_POOL_STATS=3Dy
> -CONFIG_PCI=3Dy
> -CONFIG_PCIEPORTBUS=3Dy
> -CONFIG_PCI_HOST_GENERIC=3Dy
> -CONFIG_PCIE_XILINX=3Dy
> -CONFIG_PCIE_MICROCHIP_HOST=3Dy
> +# CONFIG_PCI is not set

Disabling CONFIG_PCI explicitly is not needed.

>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
>  CONFIG_MTD=3Dy
> @@ -124,6 +121,7 @@ CONFIG_MFD_DA9062=3Dy
>  CONFIG_RZ_MTU3=3Dy
>  CONFIG_REGULATOR=3Dy
>  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> +CONFIG_REGULATOR_GPIO=3Dy
>  CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>  CONFIG_SOUND=3Dy
>  CONFIG_SND=3Dy
> @@ -141,8 +139,7 @@ CONFIG_SND_SOC_WM8978=3Dy
>  CONFIG_SND_SIMPLE_CARD=3Dy
>  CONFIG_USB=3Dy
>  CONFIG_USB_OTG=3Dy
> -CONFIG_USB_XHCI_HCD=3Dy
> -CONFIG_USB_XHCI_PLATFORM=3Dy
> +# CONFIG_USB_XHCI_HCD is not set

Disabling CONFIG_USB_XHCI_HCD explicitly is not needed.

Did you run "make savedefconfig"?
Some more options disappeared after disabling PCI.

>  CONFIG_USB_EHCI_HCD=3Dy
>  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_OHCI_HCD=3Dy
> @@ -210,6 +207,7 @@ CONFIG_DEBUG_MEMORY_INIT=3Dy
>  CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>  CONFIG_WQ_WATCHDOG=3Dy
>  CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> +# CONFIG_SCHED_DEBUG is not set
>  CONFIG_DEBUG_TIMEKEEPING=3Dy
>  CONFIG_DEBUG_RT_MUTEXES=3Dy
>  CONFIG_DEBUG_SPINLOCK=3Dy
>
> For some reason when CONFIG_SCHED_DEBUG is enabled, the USB host on
> CN1 isn't working!

Strange...

> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks.

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

