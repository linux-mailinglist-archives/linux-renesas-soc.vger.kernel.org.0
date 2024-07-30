Return-Path: <linux-renesas-soc+bounces-7615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A39408E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 08:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8FAEB24674
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067A918EFFB;
	Tue, 30 Jul 2024 06:54:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7AD18EFED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322468; cv=none; b=uq4Kh9HYgW/kRt6x5LD4s5sf2R4lEZBbGPNPDM7T6Fh6eHWJZ+v1GKGCk/VU0yLkRNmfhAKQRuXFEpVlc2I+FWpx1AzIwF3/uIJ3bOhwazWANPCR9ld0vCtPxRbzwik6raS2ELACPgnbspGtHgwql+LKzxC0tz2DMN5+88mfX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322468; c=relaxed/simple;
	bh=jKHYgWVzhVnsTULp8DkNLoDowmiOKg5lak/q2DaU9T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kextYQZ4lOgWWK/ObtgoxE6zx8btGXyRDt0MqqnRLC8Svs26pIuQnmSKM8AjAWm4B5s2i3jw/u4mQ3P6qTqsgWm7mDo+aWOkbGZCbImwWaTvfnNVyLg7MUpwFTZMBs62WQz0uHO7Ej+KkHBgMIXZ6gKtkzvqCcjY4QklHOUtQn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-66108213e88so28461787b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 23:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722322466; x=1722927266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70XTZ0YRCET/F5HAm0ckHwdtW6kQDXKdUjDXMkjz3E0=;
        b=MiVwBt0QIT8iGSliRsesqJ1A9GpdCF7MPprgBXVZBMrDsxEZqEC3lWfQtG609SK0su
         i8fFST8WUJrQCmAHhqww/kj8tyPz/NHsS+E3BbZmIh6Yk8NcrMruYEmTkJnkH8JBtgLg
         OYDBulYv9Pag/Q+cGQiQxO4R4wNFkCzHI8wG8EYEe7fSCt+23P9/T1zyu22bbEj8UeJK
         TqMiY+TYik3oDbuZO0R8XDqt2Bo3db6zQdV2FlXfz0vvKNWXiSNAaSoAE2jaPV8CoYVS
         Z0TwvMRoXIm7bS62Tdi3ucAyWKNGjrtCGqWZ0ajsJAjiKQ/I0y8NOOZeKRVrFzmjlv0X
         8Lbw==
X-Gm-Message-State: AOJu0YwXlb5FzIO7qSarZo/LO+/ey+B5kAUkkPsEfiEK+bl1wl7TXK2J
	Yn8bLWjZje36/Ko72nnmvMPLTRUkOvNLGplQvUUb3K9Ms9z4WKs+Q4q24Cx9
X-Google-Smtp-Source: AGHT+IE7lW0BiJyFPQby8zjkRjCHDsM78mhY+pid1NXRj9q73NM4h9+aLVNavHyocOo7FOA31jE4eA==
X-Received: by 2002:a81:8104:0:b0:644:4b82:bb0a with SMTP id 00721157ae682-67a053e0c7amr126196747b3.2.1722322465613;
        Mon, 29 Jul 2024 23:54:25 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756c44ceb7sm23870577b3.140.2024.07.29.23.54.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 23:54:25 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66108213e88so28461687b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 23:54:25 -0700 (PDT)
X-Received: by 2002:a0d:fe81:0:b0:62f:2553:d3b3 with SMTP id
 00721157ae682-67a095950a7mr119286627b3.29.1722322465263; Mon, 29 Jul 2024
 23:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
 <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com> <ZqfoFdgtSzDMPq06@shikoro>
In-Reply-To: <ZqfoFdgtSzDMPq06@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 08:54:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoMuoY0p5ks=56aybawQXk0Ck4ba-Dx=JQdaSBehStig@mail.gmail.com>
Message-ID: <CAMuHMdWoMuoY0p5ks=56aybawQXk0Ck4ba-Dx=JQdaSBehStig@mail.gmail.com>
Subject: Re: [PATCH RFT 6/6] arm64: dts: r8a779h0-gray-hawk-single: Add TPU support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Jul 29, 2024 at 9:05=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       tpu_pin: tpu {
> > > +               groups =3D "tpu_to1";
> >
> > sh-pfc e6050000.pinctrl: invalid group "tpu_to1" for function "tpu"
> >
> > This group does not exist. I assume you meant "tpu_to1_a"?
>
> Probably. I did test this via remote, though. Sorry, I assume this
> hotfix got lost because the non-working pin got me distracted.
>
> > Both tpu_to1(_a) and tpu_to2(_a) are available on CN3004, but I didn't
> > see any PWM signals on pins 10 and 12.  To be investigated further..
>
> I still assume they are driven low by something else. GPIO neither works
> on these pins.

Indeed, I had tried using GP2_07 as remote-wake-up before, and that
also didn't work. The failing CANFD pins (still to be checked with
the scope) are also from bank 2, coincidence?

Keys (bank 5) and LEDs (bank 7) do work. I assume audio (bank0/1)
works, too.  I had briefly tried replacing i2c0 by i2c-gpio (bank 4),
and that also failed.

Perhaps there's a mistake in the register addresses for bank 2
(and bank 4?) in the PFC driver, or in the documentation?

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

