Return-Path: <linux-renesas-soc+bounces-19501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F2B00B15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 20:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E18818994CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 18:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE95C2FC3DC;
	Thu, 10 Jul 2025 18:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/+bbNPF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE72FCE04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jul 2025 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752170947; cv=none; b=PXohFk7DrXTS03JtKBBUOxEab4MwtPNIGssF9zI9rjFHY/8S7d22pENroGvynnsTy73P7BCsXJ4fxZJ1iQZ6UBbpzGrLB+ec49C49C8BqiK664lWjrk+iAWZzkpzUO7ZZBcYmEZ0C5Aa+ej4lS+NI/fdm+eUI+Xu6XASqCImdgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752170947; c=relaxed/simple;
	bh=X0fGP1Yeoot8PPyVFMtD93Xj+aTtzl/Ny9kf1d3cGGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzwiNylmpGknqxSdQnVyFYgAvi6bn/BhjFNP1GZwaaL4jPGSiHbM/qSdugnh2BVrsSRhns6mwUfpR3KerWDlf6F8Zeck1+KOrLhytiMIr7ybb1Xnq/khEmEBWmnnIe6P858DY7zWgj1Z3KRZAtwKR7wyOtd0qE6eVfYkBsF+Vbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/+bbNPF; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e812fc35985so1103474276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jul 2025 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752170945; x=1752775745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13L8aCLszxX1/1/hvEDvza5uyCXqpHL8e03s93/NbCQ=;
        b=G/+bbNPFZwFpRjjQHggV5c+xtyAeZru1qNuuRrbHbE6cw0Ni7F11F1v9JDP7DZ9yZU
         xlLn/cakSiPzfYsAzn3t/ZGXbzZfPI4ZkSk/HKoCWi7HGj+mV8D35EU2Gg0Ge4BGZ/Y7
         Qsem2ZrUWoqBmDAq2Pj0vvqnEodd8Hd90T0an68AdXEHWhUH6Vk+VSw/LRoDWRWE9Bb/
         g+qxewNMMllpxbZE++WOPA+AZpFNvST17kvO5lU+WV8cNDGBIi7UA7K0yV7qDod8VHqT
         jNjcgfSRF3jJCQ1zDSweQ6ey3tqsGErYWksw3/4g8GUzPIm0KBGNqprZmq1NZPOz9trG
         IrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752170945; x=1752775745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13L8aCLszxX1/1/hvEDvza5uyCXqpHL8e03s93/NbCQ=;
        b=YtQ6ytblDqLwf1S0aOHAU51M6Q4/yWogtHxkmbBQqpFhHUdCLQz9pXUo+IhozBJIS/
         zO5ueGmae7vVpk0MPFlBNKNi8Zr8zVZBXKjielnbONzaYxQCfgcLZFYYO+0JA+9HmpKS
         hHBQbRhyGubn6jxuPdy+i1gR8IpV2uBUAEJGlHwfzjuh8HZ8r9hxSZD9uukZ/8/kA2g3
         fd4C61NCL4RLo2MblgFfk/UN5lweJIq1crzA/HLZQkB2m6rVyH32xwhGkP/9rzpLzWjC
         414mB6kJlPHzzuyKnYZjqzRszliBUUWGnkY1jvBzt/hZnriKPwjEEtIRthYyf3A1m8n/
         vG6A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ya6OsL3AinobnVAZqFR4AVfO+hd1bPyDZmwGgRLND0qlbHKPhEcazVusS07sGfFxTsoY2zL3OOy1aTDGCgGxwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF87Gw0xTCeYnuVZurUJKYGut+4rq5zSuVCcWVRj2hT8+0ab1N
	UjmwCq/RC6pjSLTN1JX8oZpzZgFrej13u70QSarK9+rKrRNarZB+6H1OsZxW3CtwufZCichCw7R
	o6s46UAl5cSZpVrdsyZGXtfbsT0XM3haSK48F1U4=
X-Gm-Gg: ASbGncuDNE9tlMT/FVH+cq3g1GczJcspRsVOpkzHtt66KDC5sb4701e3hfup/n73o80
	eanabZvhI6uTm9tJX6MRL/vKQJwcw15G8t3he0UC+z33quH89BsaPPVYBhvX9kftU/UfmGsUZ+X
	FlAqQyTUl+++GKaLF6W9HQIH9LDjoj2rcMY0Db9PmH+GYpirTk/eZS
X-Google-Smtp-Source: AGHT+IGLPzg5fWebp32z1ut6K/O4BgHsttOgQ284Oa+wn/uLVwQmPKaDP0EPQbe2PBhNuCXZuwp7yjxk0cW51J8vsAk=
X-Received: by 2002:a05:690c:4c05:b0:6f9:7920:e813 with SMTP id
 00721157ae682-717d5b7c46dmr8093387b3.4.1752170944401; Thu, 10 Jul 2025
 11:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
 <CAMuHMdWxZGB4KD_L2scf97Af96TbhjMaS_b9WBoPu+usRYiKYQ@mail.gmail.com> <aG1_DpJy_VS-rK0s@shikoro>
In-Reply-To: <aG1_DpJy_VS-rK0s@shikoro>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 10 Jul 2025 20:08:51 +0200
X-Gm-Features: Ac12FXwi_PJTts8bZIzFgio28O3cMJ_xGtdjtW1SBStTt-AeClXHMyWMwJHpSBk
Message-ID: <CANqRtoSMzB3jME-S0EmwH8SdPdnoeBmsDR5_Y6+cBh+Oj+RkQw@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram and Geert,

On Tue, Jul 8, 2025 at 10:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Removing this breaks the direct-mapped FLASH ROM, which may affect
> > userspace, and prevents using XIP (but I understand no one cares about
> > the latter anymore).
>
> What is the gain of using rpc-if vs. memory-mapped?

Correct me if I'm wrong, but I believe the "SPI Multi I/O Bus
Controller" on RZ/A1 is an on-chip device used to interface to the
on-board SPI flash memories, like Spansion S25FK512S-16 on the Genmai
board. Depending on the board design and the SoC variant there could
be a single or  two SPI memories in parallel and they may be used in
QSPI mode as well. There is also HyperFlash support in some newer
SoCs. This device may by the way often be used to boot the SoC using
some Mask ROM code.

The on-chip hardware device (driven by rpc-if under Linux) lets the
device driver programmer access the external memory either by setting
up SPI master transfers to read or write the memory, or setting up the
so-called memory mapped mode. In the memory mapped mode the SPI master
may be programmed with information such as which flash command
sequence that should be performed for read accesses. The memory mapped
mode also has a single physical memory window that automatically
translates read accesses by the CPU to statically initialized SPI
master read requests.

What Geert refers to as direct-mapped FLASH ROM is probably Linux
performing read-only access to the memory window that is part of the
"SPI Multi I/O Bus Controller". The configuration has either been set
up by the Mask ROM (which happens in case the device boots from the
serial flash) or perhaps the boot loader.

While the memory mapped read-only mode is kind of cool, for my use
case the rpc-if driver (either in the kernel or in U-Boot) is used to
access the flash in various ways. Using MTD under Linux seems like a
pretty good standard way of for instance programming the flash memory.

Also the memory-mapped region is fed into the rpc-if device driver as
part of the device resources but I don't know exactly how it is being
utilized. And exactly how the "mtd-rom" device node works with XIP is
beyond me, but I would be happy to learn if someone could explain.

Cheers

Magnus

