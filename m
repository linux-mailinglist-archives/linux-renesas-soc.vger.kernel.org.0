Return-Path: <linux-renesas-soc+bounces-10732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B39DA8F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 14:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43605B21172
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD411FCF62;
	Wed, 27 Nov 2024 13:47:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7E1DFDE;
	Wed, 27 Nov 2024 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715275; cv=none; b=IZS+BeF7NOsPB3uHp4MXWJHkxogo8CI167OhbJ02d2X1aRGxXPHM6WgE532D6OALX3jQd+UWe/6DTKuhjQtZsqQHruKwFk8+eV0J+tED7RoZKVG1WSaCoqa+0ZIpRHg/XZ0qKGUHX/em4GWoPtq9E0rWk1aHZv1ACQXY7qDoi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715275; c=relaxed/simple;
	bh=GMeNJUeKIH74OIQqZz8ticgxl91qaKmUpjSuQL11qks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLvcyrzntt/NEXG/or+anNIKYt6cL8yIZiAmLrtiGcjpY1Uoq8LsY0Qlb4aqfndcFdVoirlOFHCfzlP+XV9jMmKxnRQ3rrVSwMzKidhTzWunzNwTAooGTpe/5NTtqeB0Gj1x4ZMBUgqeS9F1gYT7IQqs7HN16nKqhNLGtc6rWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa578d10d50so249555766b.1;
        Wed, 27 Nov 2024 05:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715269; x=1733320069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAjR03XVJXXLUF0zOK613hs2F6wmaKzXb/bysHrmExA=;
        b=p9WKGsxrUDmC3xJzFxjfI3vmxyA8DueqJscSQYL2AeR2LSzQxi9oNsUnNLKxp7kKgZ
         WtHTT0gXj83ZvSvwjLbx46+jPLQEZOTmq5GYKcIMyigSPb3yhXm0JtJ1JBf+bg7IZS0S
         CKZolAHRk6Xp8h6razb+aGVdOHKvEaMQNAyChLrvakWS5p26J9xPBLZf90qmw0qBAXBm
         8uU4267ikef7qfJWFVBb8H5BIkH0FT57brjcEpmUKrsmXWGJ0LOBNnS6dsztshDIkim+
         5QBhcqNfsqPE24vXN7zgjitsvw8amTWGYi1TGJkBsiwcLwvKWRoKP+GVuCRWhBz6ybLZ
         HFlg==
X-Forwarded-Encrypted: i=1; AJvYcCUEd3V55izyYkkPiLTI8yzkwaZ8AjnyvqB12IjaK4lSw/y2WAwODQ1YfijM+IxRY3Z6rMlLtZfSsGHJbRiB@vger.kernel.org, AJvYcCVD3a9D5bIJTq0fepyVABnTi73jvjo1irQ55mPuWWFiAeuxAfUkDH6nudJAkUTUhUDWtrsZU/Vdj3VEEhhz@vger.kernel.org, AJvYcCVN/aM5fcZmKKbMP03FAatQVQK1eY1oq9qONftlXOI9qsYfkhtu8EGo1CN1cUbQ4YDcZ9ciRhyrqGB2@vger.kernel.org, AJvYcCVno4He2vqflmED8ec2VQ1m1tQrgmPI4ccvlY1GErKd7KJHKegYC1IZYor9+mEAH3GM9vYyq8XmzD3MKu4nSH1HX/w=@vger.kernel.org, AJvYcCX85nhjH/dCna31jWtaE60A6esuQS+afZWW9liQkXCeLEz7iaI9jFeFwrtSGi9HLBnxkbD3fKjo@vger.kernel.org, AJvYcCXbeFITrqrNzOOUy79nkB4hp2Rht33piNSYY9Qforo1oknUr4zKgt+os4jXT2JTgYcYzZJSWGdg6x0M@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3pdBRirQUDMXEsR890tA2jWdgs5ZPAYNsi45und3soXlshox4
	g4bfEzsFDS/WEzM/SrolwpQkzIefHYHcpAL1RFKu7U1a42o4aX8DTKAVFXonZqw=
X-Gm-Gg: ASbGncvnjlm4gwyR6N/cFefOkxLmHPoyso0FgWM+xBoc/+wfGkxTBqNH94LCn0ALS3j
	VI1tVAo0kfvfj34ZDTke4rJDpsmHaMOg2SrnayCwQFIUk0mYBs5URTzgK9xwtA7+hN07BVf50nJ
	/+8DFcF2HPkojqPzURa8MSWmh8ogdXxDND+osGogcva/C+gB9EQ97s9RvAziIVdC2TKhi8LCuhV
	5TglYzW4J0+7UlNymMKZZ6mqqLVUgFj9xrxXgPzm9f2kfC/7lpUiMvUw+NEW9rG+htGvloQ8Ep3
	1GEsPuNECQZ3
X-Google-Smtp-Source: AGHT+IFk74Jd7HGAuPoPVGW9ZDIyRg5blPHtr6vRUXIqyoU6fhAEcUGtekmOVKcwI0lEBUVjRqNpbQ==
X-Received: by 2002:a17:906:3d31:b0:a9a:646e:d2f7 with SMTP id a640c23a62f3a-aa5810a363cmr253311466b.61.1732715268662;
        Wed, 27 Nov 2024 05:47:48 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28fd44sm716699566b.26.2024.11.27.05.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:47:48 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfbeed072dso8853086a12.3;
        Wed, 27 Nov 2024 05:47:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUassfeUttgqhJClhkyja4vLvKqpRhqBZqHWoq0uf8J1hKfM+LzzXJXyg1i72o8pg9sZv98RyFg@vger.kernel.org, AJvYcCUdHUrv0lbneQvDGppc6RFY7ivAQnelGs4bQ/h28DFXWpTrV/Iry4J4vPxLaMTGsftnbzU4dfRwtOMnWAwBLtfmEOA=@vger.kernel.org, AJvYcCUlL8GDY2HYCPx23DNNMFNGFwFg8Gukxoa2/WvebBTVfb/maaJjA5zaBa3v+svo+9wGUfdxWm7AUG28ubzr@vger.kernel.org, AJvYcCX4ERYq9JeqFPgn0h1q7OyrfYWURGChOOcukqr0szek/NAIrdjNAvPIqVNHR1aQk1XEWHM6W0RzpVLi@vger.kernel.org, AJvYcCXAA5rYqBmfq5q+KkFyEqwNokWA1/3sarf0WXX3GMBvEPT9pTZNJo/+Wa2RZ1Vzo1hQrKSSzs+4bE9K@vger.kernel.org, AJvYcCXCRELPqiTp+NH5KziDQ5wZGESlc38boRDCJvnNtnvQ96hfXQOI8oc2QnAut9VpBQbUfA4v6ozX4qS5FG3k@vger.kernel.org
X-Received: by 2002:a17:906:9c1:b0:a9e:c446:c284 with SMTP id
 a640c23a62f3a-aa581076ae5mr297522266b.55.1732715266220; Wed, 27 Nov 2024
 05:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 14:47:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_xp0o-_bg7VqcT2LQUCWHawZ_hdA+B2KwMw1NGpu0HA@mail.gmail.com>
Message-ID: <CAMuHMdX_xp0o-_bg7VqcT2LQUCWHawZ_hdA+B2KwMw1NGpu0HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Nov 15, 2024 at 2:49=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
> is called. The uart_suspend_port() calls 3 times the
> struct uart_port::ops::tx_empty() before shutting down the port.
>
> According to the documentation, the struct uart_port::ops::tx_empty()
> API tests whether the transmitter FIFO and shifter for the port is
> empty.
>
> The Renesas RZ/G3S SCIFA IP reports the number of data units stored in th=
e
> transmit FIFO through the FDR (FIFO Data Count Register). The data units
> in the FIFOs are written in the shift register and transmitted from there=
.
> The TEND bit in the Serial Status Register reports if the data was
> transmitted from the shift register.
>
> In the previous code, in the tx_empty() API implemented by the sh-sci
> driver, it is considered that the TX is empty if the hardware reports the
> TEND bit set and the number of data units in the FIFO is zero.
>
> According to the HW manual, the TEND bit has the following meaning:
>
> 0: Transmission is in the waiting state or in progress.
> 1: Transmission is completed.
>
> It has been noticed that when opening the serial device w/o using it and
> then switch to a power saving mode, the tx_empty() call in the
> uart_port_suspend() function fails, leading to the "Unable to drain
> transmitter" message being printed on the console. This is because the
> TEND=3D0 if nothing has been transmitted and the FIFOs are empty. As the
> TEND=3D0 has double meaning (waiting state, in progress) we can't
> determined the scenario described above.
>
> Add a software workaround for this. This sets a variable if any data has
> been sent on the serial console (when using PIO) or if the DMA callback h=
as
> been called (meaning something has been transmitted). In the tx_empty()
> API the status of the DMA transaction is also checked and if it is
> completed or in progress the code falls back in checking the hardware
> registers instead of relying on the software variable.
>
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - s/first_time_tx/tx_occurred/g
> - checked the DMA status in sci_tx_empty() through sci_dma_check_tx_occur=
red()
>   function; added this new function as the DMA support is conditioned by
>   the CONFIG_SERIAL_SH_SCI_DMA flag
> - dropped the tx_occurred initialization in sci_shutdown() as it is alrea=
dy
>   initialized in sci_startup()
> - adjusted the commit message to reflect latest changes

Thanks for the update!

This causes a crash during boot on R-Car Gen2/3:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address
00000000 when read
[00000000] *pgd=3D43d6d003, *pmd=3D00000000
Internal error: Oops: 205 [#1] SMP ARM
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G        W        N
6.12.0-koelsch-10073-ge416b6f6bb75 #2051
Tainted: [W]=3DWARN, [N]=3DTEST
Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
PC is at sci_tx_empty+0x40/0xb8
LR is at sci_txfill+0x44/0x60
pc : [<c063cfd0>]    lr : [<c063cf74>]    psr: 60010013
sp : f0815e40  ip : 00000000  fp : ffbfff78
r10: 00000001  r9 : c21c0000  r8 : c1205d40
r7 : ffff91eb  r6 : 00000060  r5 : 00000000  r4 : c1da4390
r3 : f097d01c  r2 : f0815e44  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 30c5387d  Table: 422d8900  DAC: fffffffd
Register r0 information: NULL pointer
Register r1 information: NULL pointer
Register r2 information: 2-page vmalloc region starting at 0xf0814000
allocated at kernel_clone+0xa0/0x320
Register r3 information: 0-page vmalloc region starting at 0xf097d000
allocated at sci_remap_port+0x58/0x8c
Register r4 information: non-slab/vmalloc memory
Register r5 information: NULL pointer
Register r6 information: non-paged memory
Register r7 information: non-paged memory
Register r8 information: non-slab/vmalloc memory
Register r9 information: slab task_struct start c21c0000 pointer
offset 0 size 6208
Register r10 information: non-paged memory
Register r11 information: non-paged memory
Register r12 information: NULL pointer
Process systemd (pid: 1, stack limit =3D 0x(ptrval))
Stack: (0xf0815e40 to 0xf0816000)
5e40: 00000bb8 00000001 60010013 c02bca80 00000000 95203767 c1da4390 000000=
04
5e60: 00000001 c0637e88 c44bc000 c59f7c00 00000000 60010013 c44bc0b4 000000=
00
5e80: 00000001 c0625c5c c44bc000 c59f7c00 c44bc000 c59f7c00 c216b0d0 c388d8=
00
5ea0: c2c002a8 00000000 b5403587 c0625e20 c59f7c00 00000000 c216b0d0 c061e3=
c0
5ec0: 0000019f c2c002a8 00000000 b5403587 f0815ef4 c388d800 000e0003 c216b0=
d0
5ee0: c28923c0 c2c002a8 00000000 b5403587 ffbfff78 c03ae2f0 c388d800 000000=
01
5f00: c21c0000 c03ae450 00000000 c21c0000 c0e6f112 c21c07a4 c13b1d18 c02440=
30
5f20: f0815fb0 c0200298 00040000 c21c0000 c0200298 c0209690 00000000 c21c00=
00
5f40: b5003500 c388d8b8 beca19c4 c0243e6c c388d800 c388d8b8 c2177500 c3b53c=
00
5f60: c388d800 c03ae134 00000000 c388d800 c2177500 c03a9568 00000002 c21775=
38
5f80: c2177500 95203767 ffffffff ffffffff 00000002 00000003 0000003f c02002=
98
5fa0: c21c0000 0000003f beca19c4 c0200088 00000002 00000002 00000000 000000=
00
5fc0: ffffffff 00000002 00000003 0000003f 00000004 ffffffff beca19c4 beca19=
c4
5fe0: b6e68264 beca19a4 b6d48857 b6bbbcc8 20010030 00000004 00000000 000000=
00
Call trace:
 sci_tx_empty from uart_wait_until_sent+0xcc/0x118
 uart_wait_until_sent from tty_port_close_start+0x118/0x190
 tty_port_close_start from tty_port_close+0x10/0x58
 tty_port_close from tty_release+0xf4/0x394
 tty_release from __fput+0x10c/0x218
 __fput from task_work_run+0x84/0xb4
 task_work_run from do_work_pending+0x3b8/0x3f0
 do_work_pending from slow_work_pending+0xc/0x24
Exception stack(0xf0815fb0 to 0xf0815ff8)
5fa0:                                     00000002 00000002 00000000 000000=
00
5fc0: ffffffff 00000002 00000003 0000003f 00000004 ffffffff beca19c4 beca19=
c4
5fe0: b6e68264 beca19a4 b6d48857 b6bbbcc8 20010030 00000004
Code: e1a05000 e594020c e28d2004 e594121c (e5903000)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b ]---

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

