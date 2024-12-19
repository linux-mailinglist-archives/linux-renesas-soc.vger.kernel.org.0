Return-Path: <linux-renesas-soc+bounces-11571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 333309F7DC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0BF16E344
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D427225799;
	Thu, 19 Dec 2024 15:12:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E61225792;
	Thu, 19 Dec 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621136; cv=none; b=tQ6uGHGgCQFkPdyLGJm0d/h8IrjggRD1pnGlg60lFX+MSuxy+TsHMFI+e3n+ZDGU/xSRBdQpvVm7+R3mDts7pd0KDm7O+c9eUYF8nkCrNyNsEtjGpsK4jNouLShB/2P4k5fgtRCDNnHU/bls0P6r5VBPBiqtaCl4migCuv8D+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621136; c=relaxed/simple;
	bh=30ebvmdQU3I5+AnRj8xDVGa2948TzGVMLuPneGnzufA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSf6qrhYO3It3ggRPqNSNGcwFl73EJ7/nG+hlEZ321VoU9zKlDmCsON5LpXRr/0TNoFb6jvqOeh6PGwAIRtwvG+1YTxMbOWqGe5rYZxQamH4mp0j6B1aDOlgYPbKPc6fYHryZcA2xXWny4tvjEn9TwsltC0ZBzh78YVZPhmcba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d932b5081eso7234896d6.1;
        Thu, 19 Dec 2024 07:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734621133; x=1735225933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaoJm5YDGW+ylIYgzYhRUhuYE1K8KDsCdNkbwVarueY=;
        b=BWS0g8f3bi5FHqdDKhmOkfFkgteR9kEoulP6DDgZDTwSS3wa2r9cC/jqDulXTfyBG0
         SeQg0RkVVIPCn8Xobt1PSGrtdTBVO5+LB7hK3p8igmGYVqIxbZ6aKTIkrqRlVVdc1Flb
         LjWhC4Qr3WM57ORsDLpWlICzx5DEtYfIIBA01iPcNqFnt6XS1AWJ163WKDHR6YmJnQJm
         LGzK9Jm2uFxGrrzeTv/1RG/U7p1gO1mf2aC98rUUkx5Uju81ImrMWD0qlkj/UB0bjNTV
         HIeeuwm43Je6QQwuSdiBlO6PdE98p9tylBhdQhS3DR8n1Q0W3kP13U4HnrO4dXUU4rrw
         jW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkJ1POW5aITwZilufUKL9vpCT7uwSp9HVTSjsRElihnpMHMSEVSrxgDQSLKZZF+nJnWAMc3J3G1mJHhDjP@vger.kernel.org, AJvYcCVeWNbE5XdI9vp9d1ouUeSLZv6+PPwi4c5yS7WDRUxf01mHQseSySiNcLm0QvF34hb2SvVO+6zpqy7hGjyLleW27l4=@vger.kernel.org, AJvYcCWy1W/I0+CMiDFq/laxHJYK2WN2yFKQDB5pv0/NMEa2obO9vask7jo/7/GCKIE+YM7x25PqXakbsw2uV2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyanDYj3vNi5X1PK9LuP7DaRN+wrNs/p1WeImaGJBZkSBKgv3h
	CKa+2rkjXHf4+g1/b66wTckUcfFxu5QZ3CRIe7QmLbKRvG1evFsSkxjAorog
X-Gm-Gg: ASbGnctZN3CmySGzz0lqMNW7gDKtNwbPIvtKE95Ks1MdamHoA5MQcRu+5kY9wZ+cOh0
	70OLUE2XHA7ILCxDGYUHT3lI8/VLtAuRksicCSfCZBgs4nVN+I1wlpCnUSLNlHJTrfHcgK7Z3Cn
	Yo+T/pd3R8R6Kj3aFpvi5rvVfWuYCKm/YfjEkMYOUXxCwZwuQIuJS4rQPLMghPJSwKH+YvFI6EN
	oQkDHjDuXXZNTH0BVmthtopKbXT/JqIWZ/WJIpBKuaR83fThdkqiRVxgyFBEpzKtE/FAsl747YD
	xrSn2wd+B+Zog0l9Oxc=
X-Google-Smtp-Source: AGHT+IHzEZf/m8fokWcI0u4cIvTjldSIe0s1wM0MKlHAK1zDnDVvpSJOe6mgKjkVqFc2Ucn4yUEWJQ==
X-Received: by 2002:a05:6214:240d:b0:6d8:88fc:c0f4 with SMTP id 6a1803df08f44-6dd0923d0dcmr114747176d6.33.1734621133270;
        Thu, 19 Dec 2024 07:12:13 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180eacb8sm7272956d6.20.2024.12.19.07.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:12:13 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8e8445219so7550016d6.0;
        Thu, 19 Dec 2024 07:12:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwPvxd6a/KY2LvT+4EE9f4fWIXv1n+s7LXPfJh8/Wmic/VYG6aBsIJiyEuWh6/CRdMASjkwnDzQLVXBcA=@vger.kernel.org, AJvYcCUyG8qvLEE6B4kCTRaaJ7ZVXdvOG+GbR+JAKV8t0OKe3uriR6JAW2N3kcpYZTaj7AQsPai7CWNKhDwqGwkA@vger.kernel.org, AJvYcCVPhLzO7usxRV6ebVQIAU+W5InK29jglYCYxxfQcCaQ5HKZx0ZpWaZSoF5O9FCynWH6yDDZhJVfWAxPDiIMuwPJEo0=@vger.kernel.org
X-Received: by 2002:a05:6214:246d:b0:6d8:9872:adc1 with SMTP id
 6a1803df08f44-6dd0923d37dmr120772646d6.38.1734621132892; Thu, 19 Dec 2024
 07:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
 <Z1DLyQdzUzJzRUJJ@shikoro> <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
In-Reply-To: <b6c7b4d3-021c-4a4b-9e91-316603b348c1@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 16:11:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWx97OnPWnQn78oL+vVuQXmeaJP-byc_4ZwBMZhMOorxw@mail.gmail.com>
Message-ID: <CAMuHMdWx97OnPWnQn78oL+vVuQXmeaJP-byc_4ZwBMZhMOorxw@mail.gmail.com>
Subject: Re: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and keep_bootcon
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org, 
	mka@chromium.org, ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Thu, Dec 5, 2024 at 9:39=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 04.12.2024 23:38, Wolfram Sang wrote:
> >> in the following scenarios:
> >>
> >> 1/ "earlycon keep_bootcon" were present in bootargs
> >> 2/ only "earlycon" was present in bootargs
> >> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
> >>    bootargs
> > ...
> >> Please give it a try on your devices as well.
> >
> > Will happily do so. Is there something to look for? Except for "it
> > works"?
>
> As this code touches the earlycon functionality, of interest are the 3
> cases highlighted above:
>
> 1/ "earlycon keep_bootcon" are both present in bootargs
> 2/ only "earlycon" is present in bootargs
> 3/ none of the "earlycon" or "earlycon keep_bootcon" are present in
>    bootargs
>
> One other thing, that I was currently able to test only on RZ/G3S, is to
> see how it behaves when the debug serial is described in DT with an alias
> other than zero. E.g., on [1] the debug serial alias on RZ/G3S was change=
d
> from 0 to 3. With the new alias (3) there were issues that I've tried to
> fix with this series.

I gave this a try on Koelsch, which has two easily-accessible usb-serial
ports, for all three cases above.  Originally, I had CONFIG_VT_CONSOLE=3Dy
(tty0 takes over from earlycon rather early), but I had to disable
that to exercise all code paths (ttySC0 takes over much later).

  A. CONFIG_VT_CONSOLE=3Dy: OK
  B. CONFIG_VT_CONSOLE=3Dy earlycon: OK
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [tty0] enabled
       printk: legacy bootconsole [scif0] disabled
       early_console_exit: Clearing sci_ports[0]
  C. CONFIG_VT_CONSOLE=3Dn earlycon: OK
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [ttySC0] enabled
       printk: legacy bootconsole [scif0] disabled
       early_console_exit: Not clearing sci_ports[0]
  D. CONFIG_VT_CONSOLE=3Dy earlycon keep_bootcon: OK
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [tty0] enabled

So all good, but note that these cases worked fine without your
series, too.

The real troublesome cases involve using earlycon on a different
serial port than serial0.  As I don't have any Renesas boards where
chosen/stdout-path does not use serial0, I tried exchanging the serial0
and serial1 DT aliases, and updating chosen/stdout-path accordingly.

  E. CONFIG_VT_CONSOLE=3Dy: OK
  F. CONFIG_VT_CONSOLE=3Dy earlycon: OK
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [tty0] enabled
       printk: legacy bootconsole [scif0] disabled
       early_console_exit: Clearing sci_ports[0]
  G. CONFIG_VT_CONSOLE=3Dy earlycon keep_bootcon: SCIF1 missing
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [tty0] enabled
       sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlyco=
n!
  H. CONFIG_VT_CONSOLE=3Dn earlycon: SCIF1 missing
       early_console_setup: mapbase 0x00000000e6e60000
       earlycon: scif0 at MMIO 0x00000000e6e60000 (options '115200n8')
       printk: legacy bootconsole [scif0] enabled
       printk: legacy console [ttySC1] enabled
       printk: legacy bootconsole [scif0] disabled
       early_console_exit: Not clearing sci_ports[0]
       sh-sci e6e68000.serial: error -EBUSY: sci_port[0] is used by earlyco=
n!

Case G gives a missing SCIF1, because sci_port[0] is still
used for earlycon, as expected.
Case H also gives a missing SCIF1, but should succeed IMHO, as earlycon
is no longer active.  I think early_console_exit() should clear the
earlycon flag regardless.

Note that before your series, cases E-F worked too, but cases G-H gave
an initialized but broken SCIF1 instead.

Now, can we improve?
  - Can we use a proper id instead of zero for earlycon, e.g.
    sci_probe_earlyprintk() does fill in early_serial_console.index?
  - Alternatively, can we use a separate sci_port structure instead
    of abusing sci_ports[0]?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

