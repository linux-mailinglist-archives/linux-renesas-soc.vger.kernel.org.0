Return-Path: <linux-renesas-soc+bounces-15577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA19A81272
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 18:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19BC13A9B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 16:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D721DF749;
	Tue,  8 Apr 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA00jMCX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1C22D4C1;
	Tue,  8 Apr 2025 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129831; cv=none; b=QX0EBWKBuPfK6n8m5n5jm1r8apOPybu7vj6RZj/0a8dNoNKGycnSVqXNWmE2QGO4+iUqJbLTYXMPTo1sessnHc259xujmwUCjxTI1n8GjcGdY860hNllfoGYbu4hLL0Q+nfaktIj0e3eICZ5lGYmehu97n1rszuaTz6LlqMzqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129831; c=relaxed/simple;
	bh=oNUYEMgGqJ+3wGse3jpH09pPTdEyTcpXIxcUBN0Qlxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSFw2vA06z5aGgXkD7Y18Hylzi+nt++ypx+scO3sW+BSTTjdaSadgjoCA1k/k4E5vqIZwgJ/CRX42FrWm5rI8A787ymYM8dng3w553CmmHqalv685o2mRP+VKJri4I4NrZPlyf1aIXDmOccq68Vcg3lg8tK7wd2s7MhFKMp+QGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA00jMCX; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523edc385caso2401823e0c.3;
        Tue, 08 Apr 2025 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744129829; x=1744734629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wJ4YLUkXoLkwKjpRqxcQiGAxIAwL7Wsxqtgcenp5GE=;
        b=PA00jMCXY81sVnE/gO975e6BiJz80jFF7SxLf5MWhFMIbGzk4JjcMZRNn+Vi83a/No
         3L8VYORtrf72yiHZGnRkfX0qpWQuWJo3SiGdyl1AFDorAE6/yfwnQYEXQPfuvzrbIpkJ
         JK6EI09oQ0XGvGnYypbaQyv9Xl6ajlL1bvKfuMwAToHcPO13ejHCRrhoH7LCB2BCzH7a
         uqynQerO1nsIuQfXLmiYDR4SVCxVElxoVwfIGfVNRVh69AYe7lNrIMqVstA1GKp9ois0
         4CrA+0vmCa0JdvfqXnAIjphNl3B/mmdCfx+v99WBpGZPn+mJZ0ahkAuMYEE3NwhqBY21
         bNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129829; x=1744734629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wJ4YLUkXoLkwKjpRqxcQiGAxIAwL7Wsxqtgcenp5GE=;
        b=oNtnAVbIra8fQDCllu8VL2zwWFrbbEKfGTd7aRQhu5Jphjuwnanpqz8XuJPQ3SoN5h
         L1DdBEK7EO0ZbMzoBRfj6ZT3Q7NQK+/9pVOc4V2kSbQF7ZEXiizskuL4Xinou/Osakge
         egqW/Duw2EHwTcevzCDbFriH6YR5Uo6iA7vHBEiN1Qj3sJTM+mIHVqsWVYPCRoeziULH
         0kxCQpp+tGDeT7M3aoIjkVycxi2imTNISzvrEvFbcOWiYRo2T9cvqg5ayW4qpGxlROMF
         fbVfxDtEfGz0nYy+cII2DGRG/NkCZcFSBEg4va5L4PQfvIliRjIrw5hwhNk6lBzbdJSJ
         9lAg==
X-Forwarded-Encrypted: i=1; AJvYcCUhdSbEgA7p5PjG4xoZ5OHOLnCdVLjMAVvydkq/dj7AWJfwr3PXg6cGU7R9gGhZ74I3HFebIs9fLXW7WVQ=@vger.kernel.org, AJvYcCV0ckyFy+KJG3pFvsaaaHckA+s6j7WcHvRCqr28D3Lr7iS2d41BtLCKkZ4ja0V0YgzKVRfMspLEqCaP@vger.kernel.org, AJvYcCXU2bmT76iaKM3XYJVHUALGWKNo4wyWoyFoCZGM1BmrVhRTZPw5jKRBfFJgQnVTdFpN7ecukHa4Y4hpNmg0Qln5OkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9awA1hZRenNZ14SjtXztqgB5VEJA31L6J10w/jHWvAdSZmcHe
	Wm7dlZVcTuZocC9QmQDqt2xPQDTcAmhf+Fz1e+sgeIQUwjlyvpugPWorXp5/7aDt+auOUuc5TH1
	QxEmBTkigEWCFOSlv7PXpr8pL6ok=
X-Gm-Gg: ASbGnctslidkNkpWYDsHAzkLqceZPUF9LgB+phpJgjUqI2KFmja1xz6LVhL54DVr0/2
	C4KjyFfC/SEJ0ZVFNJz7ynrcG14am7nwRIbCJnI9abyK5bJNKjpA0XgWXT+1tBcLXPs2LX7KbU0
	KcdY5jrRjlFgDT/db+14PwTuUeyQ==
X-Google-Smtp-Source: AGHT+IF5vpxNNPgG48KmSP5YzAFbWLkv5ORwKd1NXBIFcwfuQX8RWoaUye5P4F2J864AgBaRoMtNJ04iAsqmgY0QlTc=
X-Received: by 2002:a05:6122:659c:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-5276443fba4mr13910530e0c.2.1744129828922; Tue, 08 Apr 2025
 09:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Apr 2025 16:30:02 +0000
X-Gm-Features: ATxdqUGgIgmcjOglWViw_kzyabRFOC_xMFbdUJNoeHkDgkQfHaMF7v3wcEAvb14
Message-ID: <CA+V-a8v=AtYbFwTtTzFfkf3S126HOioU8jZvcKo1uKkkF-rO+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Apr 8, 2025 at 4:43=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Shimoda-san,
>
> On Tue, 8 Apr 2025 at 12:40, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
> > >
> > > Reorder the initialization sequence in `usbhs_probe()` to enable runt=
ime
> > > PM before accessing registers, preventing potential crashes due to
> > > uninitialized clocks.
> >
> > Just for a record. I don't know why, but the issue didn't occur on the =
original code
> > with my environment (R-Car H3). But, anyway, I understood that we need =
this patch for RZ/V2H.
>
> On R-Car Gen3 and later, the firmware must trap the external abort,
> as usually no crash happens, but register reads return zero when
> the module clock is turned off.  I am wondering why RZ/V2H behaves
> differently than R-Car Gen3?
>
From section 4.4.8.4.1 of RZ/V2H HW manual:
In this mode, the frequency of the clock signals supplied to specified
peripheral units is stopped to obtain lower power
consumption.
This is achieved by stopping supply of the clock signals by the CPG
and, through the given CPG registers, switching
the bus MSTOP ports. Error interrupts notify the system of attempted
access to units in the MSTOP state.

> On R-Car Gen2, you do get an external abort when accessing hardware
> registers while the module's clock is turned off.  Has anyone tested
> usbhs on R-Car Gen2 recently?
>
Yes I tested this with the patch applied,
https://gist.github.com/prabhakarlad/3d1bbb6f745d8d867c8e6e009ab93f8d

1] For R-Car Gen3 looking at the r8a77951.dtsi we have the below:

hsusb: usb@e6590000 {
        compatible =3D "renesas,usbhs-r8a7795",
        ...
        clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
        ....
};

The same clocks are used for ehci0/ohci0/phy0 in  r8a77951.dtsi,
probably by the time we reach probing the usbhs driver these clocks
may have been already enabled hence register reads were sensible.

2] For the R-Car Gen2, looking at the RZ/G1H USBHS node we have the below:

hsusb: usb@e6590000 {
    ....
    clocks =3D <&cpg CPG_MOD 704>;
    ....
};

Same clock is for USBPHY, even in this case the PHY driver is probed
first due to which the clock is ON and then we probe usbhs driver..

Cheers,
Prabhakar

