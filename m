Return-Path: <linux-renesas-soc+bounces-19775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262EB16142
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 15:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62498188FE2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 13:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210ED14D70E;
	Wed, 30 Jul 2025 13:18:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6ED15A848
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753881491; cv=none; b=WVHn9A8RWLs9v/8MbuzWW6+Tb1fa0K1sPbVmznuqXWKwbkSHOK3umoaQono3JaS3aAldwso55XRIQaVcp/pKwrNkycthHmU6ExhCJTj6Tx8X4VKBvwNtONSFiyHyXKO+ergpVHlUi6CE5Dvq5OLGytQjPNy8BJopmvk7GslHqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753881491; c=relaxed/simple;
	bh=uQmmXA1UOtrGcTl6vm+YRoYqk9+Fdq7m5UjNgw/jdGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2aupxzr55yyGhQv1kP9kpAZ6fC4jeeIz+m9StLzx3/PF6ju8DMllp+Lcpm9iM/uX8bbcl9ecMVVMTN2qEokFqwNnHQVRHNFYb1NrU1R2YQrEmA0Fate5nme0+GwcLbN/GSke7Usev5dBuJunfQ9xis1pTF/xl60g67hA6k4Pdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fa771716aeso1276256137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753881487; x=1754486287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6GXwB3HYRWontaCo/6T3jVhZmsf4JGBbKy++SiQk0w=;
        b=dRH2nTcepVlzZOGyfx39cZfeRhsFi/OIben7pkMACSGbY7SJao/yNvGAVL2zuuXPEv
         IVvVmYzymA/c+WH7rgeqfHqAMH1szMRKY95PZgySqGUOkXl9wUhETG2xq6F260Ux8eWu
         FnmeTrE7KVMJITFa/mL/NUKZHzRkjC3O1hKmJRNUTl5VlQBD5UEibdo7+dicqIb2Idiq
         29l9EGXV4bmJNyTv/2PrMiRhiWsA3X74uYNEZeMiMRmwTj0rk70L3lwwQRvprUvdAImX
         /n7JQ0Z4u8JXWnAHpmXXTMYbg5hRx6hYsWILHWTn7UUgmyc/KPcqa2/8Xy0q8iCGztON
         9aLA==
X-Forwarded-Encrypted: i=1; AJvYcCVDRuwzUzF3V5ger2fFLk4h9qU8lqocF9hijaHREtvOcjkyz4fwXpPG8N8yj5Vw7iH/CNEnAojKqR53fnihbgQ2rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd2wio4RQZOq7fZebKITxA4EXxYbK9wW85ZPIipc3Ls/vya2re
	ogYqwY/0XSwMcWJBu92kvi6m+fLIyeaT/zbNSUzJW1KyRMYp2XFPDS+Fo8hGSGCr
X-Gm-Gg: ASbGncsSo44OVHs/hjOsqVoJ0kq3/ChiniY4MIDgRDU/BUquxl/aWCrTkcZgzjDsxiG
	ZV3N19nT5C+PAs+HFOKaKhGs9EDtGx5wlpb89EpUuQrq1rwE+gndQu2aoTvf1lKsEIeVjylwU0j
	u8FN9w3KpcZHx6eN+tEhOeLR/9V9uW4JVmvpyUZWL5/4LehrM9Leb/6ndBb8RGiEOP3UVtP5ecG
	gizK5IRskto6S6DlRkIUKVh01TetND410ClE2R/D0W/EEggNR2rgIm1G6bUS3TvgDk9FNYz7Rbn
	e2g01UKOCmkfmBQRgrKtBGB6bOJFKTN0UgdLWUN+DbA/ITvdvZFPSgiJiuWZ21A6338ILWumosK
	a0K7MUdypQo3dDxz4PmSXqMGFHd7VJl5xGcoCMxKeqoyNK99GwXdZcdmORSzR
X-Google-Smtp-Source: AGHT+IHZxeAURjrimR/u3W8Vb3Hl7wlAM5+hrgQe8iWyV8TTi7HUZSzTNsxOpjda4bfHhiAnrQ8Www==
X-Received: by 2002:a05:6102:5686:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4fbe7f376f5mr1955561137.9.1753881486698;
        Wed, 30 Jul 2025 06:18:06 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46bb9020sm2138769137.0.2025.07.30.06.18.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:18:05 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so3607453241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 06:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsi4iuk5cODCnv3SIf29WANnr2jUJeV1KGwROaWMvCDGUMotmQJDGPwQBCunjDjouGlGagPFMeNZitRSQkvxlT0w==@vger.kernel.org
X-Received: by 2002:a05:6102:80a5:b0:4fb:142:1ff5 with SMTP id
 ada2fe7eead31-4fbe87e7dcdmr2576568137.26.1753881484059; Wed, 30 Jul 2025
 06:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
 <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com>
 <aG1_DpJy_VS-rK0s@shikoro> <CANqRtoSMzB3jME-S0EmwH8SdPdnoeBmsDR5_Y6+cBh+Oj+RkQw@mail.gmail.com>
In-Reply-To: <CANqRtoSMzB3jME-S0EmwH8SdPdnoeBmsDR5_Y6+cBh+Oj+RkQw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 15:17:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtwbpH+mfEDCPz7+0tccBGAhs-iQAetmU-D_jEcGZ+Wg@mail.gmail.com>
X-Gm-Features: Ac12FXxo_rhXOvPB03eVtIkuqHZ8F1BQuweWhRPYh5wg6bGaHBAUrxnmF7L6E2c
Message-ID: <CAMuHMdXtwbpH+mfEDCPz7+0tccBGAhs-iQAetmU-D_jEcGZ+Wg@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

On Thu, 10 Jul 2025 at 20:09, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, Jul 8, 2025 at 10:27=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > Removing this breaks the direct-mapped FLASH ROM, which may affect
> > > userspace, and prevents using XIP (but I understand no one cares abou=
t
> > > the latter anymore).
> >
> > What is the gain of using rpc-if vs. memory-mapped?
>
> Correct me if I'm wrong, but I believe the "SPI Multi I/O Bus
> Controller" on RZ/A1 is an on-chip device used to interface to the
> on-board SPI flash memories, like Spansion S25FK512S-16 on the Genmai
> board. Depending on the board design and the SoC variant there could
> be a single or  two SPI memories in parallel and they may be used in
> QSPI mode as well. There is also HyperFlash support in some newer
> SoCs. This device may by the way often be used to boot the SoC using
> some Mask ROM code.

Indeed.

> The on-chip hardware device (driven by rpc-if under Linux) lets the
> device driver programmer access the external memory either by setting
> up SPI master transfers to read or write the memory, or setting up the
> so-called memory mapped mode. In the memory mapped mode the SPI master
> may be programmed with information such as which flash command
> sequence that should be performed for read accesses. The memory mapped
> mode also has a single physical memory window that automatically
> translates read accesses by the CPU to statically initialized SPI
> master read requests.

True.

> What Geert refers to as direct-mapped FLASH ROM is probably Linux
> performing read-only access to the memory window that is part of the
> "SPI Multi I/O Bus Controller". The configuration has either been set
> up by the Mask ROM (which happens in case the device boots from the
> serial flash) or perhaps the boot loader.

Also correct.

> While the memory mapped read-only mode is kind of cool, for my use
> case the rpc-if driver (either in the kernel or in U-Boot) is used to
> access the flash in various ways. Using MTD under Linux seems like a
> pretty good standard way of for instance programming the flash memory.

MTD is indeed the standard way to access FLASH via a file system...
But to run kernel code from FLASH, it must be direct-mapped.
With traditional NOR FLASH, this is easy.
With FLASH behind an SPI bus, you need hardware support that translates
address bus reads to SPI read commands, which is what the RPC-IF can
do transparently, once configured.

> Also the memory-mapped region is fed into the rpc-if device driver as
> part of the device resources but I don't know exactly how it is being

You mean the "dirmap" register block? That is indeed used for reading
from FLASH by the Linux rpc-if driver.  Note that it is limited in
size, so on large FLASHes it serves as a small window to the full FLASH
memory, and must be moved explicitly when needed.

Obviously the window must be fixed for XIP mode.

> utilized. And exactly how the "mtd-rom" device node works with XIP is
> beyond me, but I would be happy to learn if someone could explain.

"mtd-rom" is just simple glue for a direct-mapped memory device.

If you want to combine XIP mode and MTD writing, the driver needs
to be aware of that.

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

