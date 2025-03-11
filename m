Return-Path: <linux-renesas-soc+bounces-14268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD090A5C651
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3419317B81F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E3A25E82D;
	Tue, 11 Mar 2025 15:21:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038A25EFB4;
	Tue, 11 Mar 2025 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741706461; cv=none; b=tS7V0uhZV9XrgzUldNVyZM+uGB6n8QmtJbwXJY5/3IchgDnnangaM4dVZZrk4PCP4mPmCp/+gx8M2W5I6+h0WknWwfyb/nS/YCRJFxxoN+yXQmmJmzMLNcc96AXCHW1pR48O/EH4sICiGMlNc5i7ZYOIkdgiWyP0JGpOdbe4zzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741706461; c=relaxed/simple;
	bh=PN02Sl/bF+57BkEv8uEA5QsYCHO1zi9p/ej9QStXJq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N1go4vh7/Serl9D2yZG7vcT/yklg23fs1/Fe/3Kg3c8Soudx9BZ6EE3yQvdPuWCp4mPAatX8WhNGz2/Teze2De/6bgxzrvATnlf7J23jkVBkFqrA+32AalOi91pjUFqTd6BAaJrcExoUPELuCSP9NReR/r2Cm7qGX1R3TOmV5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c081915cf3so744970185a.1;
        Tue, 11 Mar 2025 08:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706457; x=1742311257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAZ5WY/+AZg82voxgpoZA7Yb7kIn6Uh4GFZ7o1KdBUg=;
        b=c4sw7Ua2t6FSY7WpygwPenC+5OyV0Z/Mj7xJ2jkwYV4Ey+9bc0GNgQtiSer1hjSpKv
         YANXw/QjQFHNyrD55LRFckneFX+z9HbLVUSznVONVUaIBnI1IXZ5kVMxNjd/lax3h60l
         QrpCYa7MkcXRFWU1es3mw1NiAs7tMopw7vcQIlJp2g5i2EvPO19YoBkeunKC8KS6gGxD
         mBzFZuraR3rvuSPcMQ7Dyb/Law7SDhRgDvBbLtXpNouog0kgjdv1y4wC1RjGwmW/dHS6
         Afx4jDU1WdMrR1BmY+Cq5u4bNkA17g9mncFLL1NCs+qaIGF60LWY6pgDwk1mF6BAeFwS
         dMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzL5PRbZqvZDw3zvmv0oh5Wtuhvi3sgMY5OOxGNMmtsnmonp9BMR+I9kfVXnj0fZ5wsW2HLjGBuabFe0I=@vger.kernel.org, AJvYcCXiIlrTyuo/T7onpv3i6O06XCe3o6zjmpJBOdEmePy8bb3A7J1ytwDk98ZbCXE0lAbVb/5FqJxq0kxfXT7OGaIcCXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/dcW7B7VmzuTLr2AT7glXjS3V+sHhJxjgJffRivUEeIZEj8J
	LxbD9s9hwkrRgNDOyVb2bprTK4FANh5xIn37ttCVvc/IAqGndEuYh/XXFWJ9
X-Gm-Gg: ASbGncsFgEyZWPccvbctRnPCYyfYwRCnobUVRGhexWOR3tCQ63otLLmQARX65QjD8vt
	0Q4WAPyc0KGjyL/BYlBbecbrY7LmkKfzMEMu6VddckGl7L1OzDP3eMaJ2v++rjBRIxei1MI6PPu
	HorX84/vWeNDBAHeP4HvxvMpWFCP4p3355wXyeh9NE/GyGvX5Ftaf5+rrL9/irmXxrPloidRgrY
	0++lVFIB8nxo3t3NnrNUS1cf5jOOONzsrrnorIaMJ23LotHTGnSwt5aGiR5/FqxMPkvyAxqaEZD
	Y1fvizQVnInqM899JCfSXS26+DNLiHh77bmMnn9JDandBjQ8kDCUOVlm51y+J0FRGce1+4bYvim
	Z+gbJJB/Ofz+EsIN9PhZREw==
X-Google-Smtp-Source: AGHT+IGsH5SOIyP/cdE9RbED1AzzwX7YN+i3LTiqbGYcXsmnm1O16pwj+TCPHgNr2hATP5sRtX+WQg==
X-Received: by 2002:a05:620a:6501:b0:7c5:59a6:bad7 with SMTP id af79cd13be357-7c559a6bc8bmr772782385a.17.1741706457499;
        Tue, 11 Mar 2025 08:20:57 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c54b916f6bsm428129785a.30.2025.03.11.08.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:20:56 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c0155af484so768399585a.0;
        Tue, 11 Mar 2025 08:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdvlemPCfvXV19CZELaxiURp6KeW4XjXdZuOIdIA9avPTIv+bcUsBwZRME1tzdc01SgjZSYsN9VIcaUSqjATgRiNs=@vger.kernel.org, AJvYcCXjvBnsLK9eb+VzmTRMSXpzWWdOumzaqkbTi5Re+d8QPJnwGjirsXRFhwTCXQiRFZNJmG1AH1S3wyXK9S4=@vger.kernel.org
X-Received: by 2002:a05:620a:2581:b0:7c0:c046:7c6b with SMTP id
 af79cd13be357-7c4e61ed9cfmr2913292885a.53.1741706456479; Tue, 11 Mar 2025
 08:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
 <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
In-Reply-To: <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 16:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
X-Gm-Features: AQ5f1JpeSxFRSkFxS6bR3-g2Fuibv6APqy0-HXmtfiaxTjbbrF2D0dsaDVIBB70
Message-ID: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 11 Mar 2025 at 16:11, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
> > When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> > shmobile_smp_arg variables are not multiples of 4 bytes, secondary CPU
> > bring-up fails:
> >
> >     smp: Bringing up secondary CPUs ...
> >     CPU1: failed to come online
> >     CPU2: failed to come online
> >     CPU3: failed to come online
> >     smp: Brought up 1 node, 1 CPU
> >
> > Fix this by adding the missing alignment directive.
> >
> > Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn, =
arg}[] from .text to .bss")
>
> I wonder if this fixes tag should go back a bit far as I was able to
> reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
> when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,

4e960f52fce16a3b is in v4.5, so it covers 5.10-cip.

> RZ/G1E failure logs:
> --------------------------
> [    0.006719] smp: Bringing up secondary CPUs ...
> [    1.040749] CPU1: failed to come online

> c154d5fd B shmobile_smp_mpidr
> c154d61d B shmobile_smp_fn
> c154d63d B shmobile_smp_arg

Bang!

> > Closes: https://lore.kernel.org/r/CAMuHMdU=3DQR-JLgEHKWpsr6SbaZRc-Hz9r9=
1JfpP8c3n2G-OjqA@mail.gmail.com
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-fixes-for-v6.14.
> > ---
> >  arch/arm/mach-shmobile/headsmp.S | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks!

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

