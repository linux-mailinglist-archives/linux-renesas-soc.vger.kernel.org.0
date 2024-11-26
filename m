Return-Path: <linux-renesas-soc+bounces-10712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C24289D9B72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 17:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01017B22405
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 16:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480201D63FD;
	Tue, 26 Nov 2024 16:27:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647BBE46
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638475; cv=none; b=N4TQwsaNLOQDFq82ZQdxLq3Bxy8l1NbpSSgZNt0NdMzOydFZjexoZprCXBj+4vhZihuoiDP7aT6/RClwhiMDPC3lIFT+mTEm9XcMm+sXkYPYJ35hYV2XgL+QuNl3Xk1UEM81va1m42vAj3ujW9EbeqBOFVfuLXEBAWqJjU0n1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638475; c=relaxed/simple;
	bh=Xc3C4EIWnUIg36OVKlPum6OLz1OHNu3RilSm0BWvTmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HudKtlSvw3bVyYjgFdScJDEoTeknKGfVJaVBTqSvsycr3kua0YBQOmPGlzXoYvzyLHr3N2mKbAR7SmfaoVKMUfa9X0lsshruUBlGOA+TC5H9sHB9ozBebaJpVH/WH9Q290ToesTE5phbk+m5HSNM0vW4q+PpvFk+L5e4dXWcAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eed41d2b12so44743417b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 08:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638471; x=1733243271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+5DDq0nPYaDZ7/iDkRHOSxBIvXFA41dAtcmb4ui1Fw=;
        b=ucDCloTPVYLNCx75LLyDqrnitHQsyI6Ij0WiXkjymThT1m7JqobPNC1d+V1ztNp/Wa
         YQlKqzFOtgFSQoE4d8BSafQm5xmPO8fBQGEOgsvRk6OOSmkZnG35yKPXyX2R2L4n4/qe
         mz2zXZyFIQgXWVyhhSfb1VrbEkLI1Q6es89bVBiXstwptdg4cy67T61+rAY7oZvboh3e
         1jOTZZ6PjfskjFaBsZGTEHaFb4CO1QcBX7Tk70vSdMxtsvnrd3zoX9ankTPPeeGtAgXQ
         fcxKmRkWKFieS8jZ2oryr46gNYRSpgLUMf2FaX4r7Ov8RFnT7HBZbM5tKlDJpnJb+Fs3
         YyBw==
X-Forwarded-Encrypted: i=1; AJvYcCWdTUZfjyutQul+0hXK2DP0R/ITYnzkUWw0FBaFf1lsyAjZy2KSlwHqUokDbyjxvjX+1jGoukPepYXU6zrddjz0ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOJlTkeeTQU++LXG7s2Kfq/KHAOliBbf1HiHvih+7zKNRmNRy
	p2+jDvVFmKU+031YdmpWQZ4xsxlLxWAjX3YguTBs1uYjfu5ujWnBlEZfmzBT
X-Gm-Gg: ASbGncsyPQZJJFJAJRKNlJmuY46brEOxr/tbBKHWUiGUKeE7Af2/ObdTjsrvfopJYMc
	2X9ghkgaCdC0WSD6E7mQvRCS2ARv/tYTtuc1vY2rAQ9gtf42IQdLXJj0TisnARPHjDGjGcmsRSn
	u5TCMU6+tg1zv8e7MrRSxbtEzEJOuJD703BdeF1cvQYe2rdroQxKk1Ilb6ivwqMy5OgKaWeWkBQ
	Sssd/pbU24fp4WJ2XUrTwDpnQnBhOS4s28NdVijlpPyk1gqOtk6YWV1KddYT1OdQSOjtdY6goCU
	duo2NDuAF9d9EjCL
X-Google-Smtp-Source: AGHT+IHj3zoYPQ26SCXm+GZIJuq6ssdMzCZmKcv70HKfrYB+ETOVqYHwOegxJP9s/Hd/QCnOle02Tg==
X-Received: by 2002:a05:690c:700a:b0:6bf:1ca2:f6ce with SMTP id 00721157ae682-6ef23dc58ffmr36347357b3.11.1732638471273;
        Tue, 26 Nov 2024 08:27:51 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe2ccbasm23631337b3.47.2024.11.26.08.27.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:27:51 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ee79e82361so57113137b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 08:27:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX78wW1LSlNBjnYW+0XEcNHzKPJQc/vY/XwnsiqiyLKlSH6SCbZPjoCw8Gb7Z4+mWn6XxXKv46ZZ3uQ2qSoK6vdiA==@vger.kernel.org
X-Received: by 2002:a05:690c:670a:b0:6ee:8088:831d with SMTP id
 00721157ae682-6ef23d80cf8mr37132617b3.3.1732638470834; Tue, 26 Nov 2024
 08:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be> <8fe8294a-b785-449e-850a-db334211deba@ideasonboard.com>
In-Reply-To: <8fe8294a-b785-449e-850a-db334211deba@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Nov 2024 17:27:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8e6m2CJuEL2HAZV69gWPD0nVG33_O1c9Gbmdkj8Qwkg@mail.gmail.com>
Message-ID: <CAMuHMdU8e6m2CJuEL2HAZV69gWPD0nVG33_O1c9Gbmdkj8Qwkg@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, Nov 26, 2024 at 4:58=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 18/10/2024 12:32, Geert Uytterhoeven wrote:
> > As I had to test Tomi's WIP patches to add mini-DP output support to
> > Gray Hawk Single, I moved my (old and new) DisplayPort gear to my board
> > farm, and thought this was a good opportunity to test mini-DP output on
> > White Hawk as a baseline (CN5), and add support for the second mini-DP
> > output on the White Hawk BreakOut board (CN15).
> >
> > For testing, I used the following hardware:
> >    (A) BenQ BL2420PT desktop display (2560x1440),
> >    (B) Joy-It Joy-View 15 portable display (1920x1080),
> >    (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
> >    (D) Passive mini-DP to HDMI cable,
> >    (E) LogiLink Mini DisplayPort to VGA Converter.
> >
> > (A)-(C) are known to work with my Intel desktop.
> > (D)-(E) are known to work with an old Dell XPS13.
> >
> > Software-wise, I used the frame buffer text console, "modetest -M
> > rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
> > 86:2560x1440@XR24", and fbtest.
> >
> > White Hawk CN5
> > --------------

> >    1. Mini-DP to (A) DP:
> >         - 2560x1440 works but flickers (flickering shifts image
> >        horizontally; perhaps a cable issue, as 2 below does work?)
>
> I get a stable picture with my old-ish Dell monitor:
>
> # kmstest
> Connector 0/@86: DP-1
>    Crtc 0/@83: 2560x1440@59.95 241.500 2560/48/32/80/+ 1440/3/5/33/- 60
> (59.95) P|D
>    Plane 0/@33: 0,0-2560x1440
>      Fb 97 2560x1440-XR24
> press enter to exit

Good to know!  I'll see if I can try with a different cable (the
current one claims to do 8K, though).

> >    5. Mini-DP to (E) to (A) HDMI:
> >         - SN65DSI86 behaves as if no cable is connected.
> >           Expected, as TI SN65DSI86 does not support Dual-Mode/DP++.
> >
> >    6. Mini-DP to (D) to (A) VGA:
> >         - Detected 1920x1080, black screen / no signal.
> >           Perhaps this adapter relies on DP++, too?
>
> Hmm, are these two mixed up? 5. should have (D), and 6 should have (E)?

Yes they are. Sorry for that.

> No, the vga is an active one, but does it have external power source? If
> not, it relies on the power from the DP connector, and I'm not sure if
> we're providing any/enough.

The VGA adapter does not have an external power source.

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

