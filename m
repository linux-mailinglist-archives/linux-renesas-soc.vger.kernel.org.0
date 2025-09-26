Return-Path: <linux-renesas-soc+bounces-22419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2DBA3987
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 14:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6449016C46C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 12:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEE32E9EBE;
	Fri, 26 Sep 2025 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDmkgecg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1810E3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758889428; cv=none; b=sVFG/xJu5UnHlMwKT2lwPSujceXbAG03MV7a7OFXn+JCch+q3kPukNr69juPoGf9Hc2RgwaqOg2+UTdVpAKQwnVZm9Z0xrlGTczkJVHglGH2JqDSkLXrpqsa9KfSIBQ1wxGlZyzuTDK9NurqXfkx9h2DWZsDmS6vDZ1wkxKudJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758889428; c=relaxed/simple;
	bh=cFWxzYyz7vK4hyzmjevExbsE5H22NU9YQrR6EsuHvR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3MtWqFUQW+PqL0feGJjv+LlUEcMeDeCDQ+HZur7ky1RecOVsa676W8CuRFgVpcdTuOmHnIeUDZ+xTvUi3cxaIVd3Ladzj6LH80hlsIzE3Ax8MQ/Os3194nRDfBj3qH49az0crpYlXiBpJb6Ev1Y8fpPM8o7oRKZ3EMn26xHx7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDmkgecg; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d60504788so20170767b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758889425; x=1759494225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA8ToaN2ec5XOHTlGwPSdrVYzEewX+q+dK/4ilZO5fw=;
        b=uDmkgecgfhiW6tzu6JKRZ0AkcghTUMzXG1fUkFY+P0tV9yx+y36fnonuD8tkf6+RzF
         1fq1Ivlw7isgJHMujMyUFuwLZnyTceVbN12y/WOOZoRHcrPUjBVfNhmQl58zQ563mAIP
         X/4RIltIEtILFuwf6M8vvU9YuYxD4sOToFjanVwXFP0tuIfe1+kesBqKNACiAoXBmdaf
         QcHZN8lbL+TjfksqsgnY6tURK1XkQ7Zs/wPTN9Kr/L0MktIv/vyVr6EBUz6lGNKzDenP
         CMQlOHYBDj8Q8IYAfHt5xc21mm740AoBJWIgbA2wsqOoqMCSz5b4F+PVzQ0rIMnxwPBz
         yVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758889425; x=1759494225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA8ToaN2ec5XOHTlGwPSdrVYzEewX+q+dK/4ilZO5fw=;
        b=fejK5n/upsAkxMfbGtgBhJ79tIZW61BpEfKMd2esuZ5LPrp1iVwvzkvEnreaVtAJx8
         +4RoHklGOB5fS/W09FExvLfC4gwz6KNJ8VjIOLl5aZEHzQ0pTex3PL0j8e2qN1RMubWB
         m1aW/F2G2ywqJnuqAbr1tEGcUonr44ZEeIZzq231oO/OVHUIYYPBAOjPjeXBJaZMUIe6
         QK4QwTiTceAdxBD5UPRbced5AX+VjejPZBBI0cNsAYWDBHiPFhJNoW6TAy32yyAAZsT3
         lzc0vEsokq5Fkj/YlHqozej0JlDRCPkW7GMV9soAvepYjEh/WAQdOsPEOoJIXNIsy7Lx
         OUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXBglc9CCpQNV9huqbDMsksMPxmz7A9WLshA/ZvYx9FvOk+WJ9cFU//Nsy2/d/GvXR4UhzAcKvIs60vovc3ek39w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykfp3dWab7s0haI805Oh9pNuhEpGOsXDUaRRqS4CGm2ATDEq4t
	clO/FewP6KaiI9VO/iJ2wGcOKD8pd9Jz3lW3FXQziM2ED6nBK5WPKcDNmhLt2ZwI0J/RQJtdAmG
	i7GUZsaJfWcKVsykPFzmKwQwvkTgmczv2ch+i2Ij7Yg==
X-Gm-Gg: ASbGncs4ibNEXiyYpq6S2khY4+L9viK7AEUOOee6yNNpq4ebAAyOJ9KG+G3znPbk+j1
	hfx0vFKJND8b5b40WSAEoLIkJvVj5XmnjOp7rPkeBqJ1cCvtHeT5CrUnZDLxF/3Do8ZZOyt6V0/
	QvzQGKiJ4Mtd2zLB++IKqjVN7ewOCsqf4pPmgMGIG7WJ0FiUylFqs/+93QHAxwnhosrXLqgh7kI
	Ah6Ki0+
X-Google-Smtp-Source: AGHT+IFJfK2kUvEQyP3qdusE32Bwrz6NChuV5uHdpq7CNKn6u5E7zONMkQB12h0of7GT99uFXskvFX7pQWW6Gu7R1Rg=
X-Received: by 2002:a05:690c:6087:b0:734:e6d4:acce with SMTP id
 00721157ae682-763f9e75c51mr63338287b3.3.1758889425304; Fri, 26 Sep 2025
 05:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com>
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
 <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com> <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 14:23:09 +0200
X-Gm-Features: AS18NWAxOQyvszuo2I51LVHpZP8o6Fd_G7IyAwpQbmXUa2S83iiTdpG_DODSHHM
Message-ID: <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Sept 2025 at 08:57, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> Hi Saravana,
>
> On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> wro=
te:
> > On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wr=
ote:
> > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > >
> > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e602000=
0.watchdog
> > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pend=
ing
> > > > > due to e6020000.watchdog
> > > > >
> > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > > clock-controller for PM_CLK handling.
> > >
> > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > > these bogus pending states, and no PM Domain is powered off.
> >
> > Can you explain why you call these as bogus? Sorry if you already
> > explained it. But the reason I'm asking is to see if you can set a
> > flag for the watchdog device so fw_devlink will completely ignore it.
>
> "bogus" refers to "1." below.
>
> Furthermore, devices that are located in an alway-on domain should
> not block the sync state.
>
> > It looks like there's a driver for this watchdog node? Why is it not
> > probing then?
>
> Because this particular revision of the SoC has a hardware bug that
> prevents the watchdog timer from rebooting the system, and the driver
> detects that.
>
> Anyway, if the driver is not available, unused power domains should
> still be powered down, like before.
>
> > > If I remove the "sync_state =3D false" above, genpd_provider_sync_sta=
te()
> > > considers all domains, and does power down all unused domains (even
> > > multiple times, as expected).
> > >
> > > Upon closer look, all "pending due to" messages I see claim that the
> > > first (index 0) PM Domain is pending on some devices, while all of
> > > these devices are part of a different domain (usually the always-on
> > > domain, which is always the last (32 or 64) on R-Car).
> > >
> > > So I think there are two issues:
> > >   1. Devices are not attributed to the correct PM Domain using
> > >      fw_devlink sync_state,
> >
> > Is it a fw_devlink issue? Or is this a multi-domain controller?
>
> This is a multi-domain controller.
>
> > >   2. One PM Domain of a multi-domain controller being blocked should
> > >      not block all other domains handled by the same controller.
> >
> > This is going to take a while to sort out. But the current behavior is
> > the safest. How grumpy will you be if we don't fix this :)
>
> Depending on your definition of "safe".  Keeping all power domains on
> increases power consumption and heat generation, and may cause e.g. CPU
> frequency throttling to kick in, slowing down operation of the system.

FYI, I agree that we need to address these problems, in one way or the
other. I am trying to summarize them and have also proposed a CFP for
LPC (power/thermal MC) to discuss and try to solve them.

Now, as I also proposed in the other thread [1] just now. How about
changing the default behaviour from FW_DEVLINK_SYNC_STATE_STRICT to
FW_DEVLINK_SYNC_STATE_TIMEOUT? I think that would solve a lot of
problems for us, as it would provide a more similar behaviour to what
we had in genpd originally, hence it would be a smoother transition.

I think this would be true when trying to add ->sync_state() support
for other subsystems too, like clocks and regulators.

In the end, when platforms are ready to move to the "strict" mode,
they can do that via the command-line parameter, for example.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20250925115924.188257-1-ulf.hansson@linaro.org/

