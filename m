Return-Path: <linux-renesas-soc+bounces-22398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493ABA298F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 08:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20285627E55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 06:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7CD280CC9;
	Fri, 26 Sep 2025 06:58:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD82280334
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758869881; cv=none; b=s91BaArLIQ5aFt1Ifx5YVmkvp9YlCWbw4G3vaR4AaBb3Jd+0XkjDKuFyenVskiXZ9U7PznvPiTPJzjeI18rewiYsW0TYBB8ffxHa8w1LIOM4M9aFr+QU4hElQj/6fk/Jr4qaw4VDCmyTI9eh3impxRt2FNQSLCAlDrY4voXvTQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758869881; c=relaxed/simple;
	bh=dw8VodF5d0G5wyZprT1Cfu9CVLPEqqgX7pSeump3QdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOM+aIgV+4DeW8aN4BKoW8TTtxGt0oTx1EI9jihGa5J+feElaSu+3ZoSAHUNf1WrZhdg+cYQABNPKcBzRIjMMQg34NEhYCzJVWpASEgjaJA6GZaI4tJmaRDeBW3KJ3VnYknz4GL7mnMrXdpO07l63XkV9BIJDmVmsV4g7euk16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-892196f0471so727688241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 23:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869878; x=1759474678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjQDtyvvVNH5A+YlQavoDIDNO01bRK+FCcEXT++J39I=;
        b=L8YIXeoGZiTBg0hm40NKBVCWfOkZx8Npap6uXkwBiWoCps4MpJWXRKYgb6w2P3z0t0
         P1wiO6DmSsMsomtJWZ0SkSvUUfhDnj63+eY9gj3vgI62BR56E/mPH85dTzutaLiNV2nC
         X7TLR0k7dbqzwZYsdXffK+Y8n9jWF3j3hlVaCooThPaWx1wlk3txfGHCtOWzp3jhxa10
         SG8XqlWMgu4XgEp44iQ8ps/Me+RHtiZZ7gCw8d062j3cdNIcstwCnXS69L0SVJ60gd9o
         SYLDCp9hw/8xB3tlyI46u61B5wuX9pDPJnDz54UXXz+9tYEFjP7HLGwDwoBV/TDvZLpg
         pE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTV9WhqoVKUhnHuX7xCYq5Hv9kLOwuxGTcmQptgdq+dD4/+VVSMSbi+FqPI/OCxPpWXAVg7WaflRX8WW8o/A224A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwI1YWO9Nc+2621lQZVk4v3/7VfZoAkwYjxJZHTtX1Uud7cmzy
	myj1GvUJQ4qtJFHYqt7ISumrAjpI+qCLJnhbIuN0wUYB7HQiVlTMoLBzCf3XdV0t
X-Gm-Gg: ASbGncs8TAZRJYuXcOH/ZOUmD2KCGy+c91rlenAwZbeWnekyw5Q8SN4+X8xgMdL7hHi
	RINP03qVJf1iec9CJbHT3QMwwMoY7Qcy9RZnTlij7rQso5kMM1n8nOykD8/n25tJms0TBVHAzgC
	e4nQaXBjeg32pdF+gS9UoVo+S2TkL3tECPcKzCg9HeI6IGBelNhjNqej13lr4T/1MnW+TcHgo8N
	adoGjqT9VtH/oVKrbsE4CrDLiXWEhbN6GuwTZH/rN6mE2lS7H/VCcNmSV+9M2iDlgOxPbyJrPHq
	OfYxnTDYv2yzqzr2Nbfy3J76nzmetY6L7YbIP/TrmN3jdNFOlACNbVTrPE85TD0TZtBmI5uYfbl
	L5KpNLk3u2t0EpxlIzO6nFGeV06g+cWYfwou1hatX9lNUHo1pdLQu622Rmw+x
X-Google-Smtp-Source: AGHT+IEPahhHPFQcUv+QpwxMojIqPVQoF4mfv494DR1ZSZt8/eMpMI7Id5EUNLy9Jix/sa77syCFwA==
X-Received: by 2002:a05:6102:5488:b0:55d:cfa5:9d58 with SMTP id ada2fe7eead31-5acc72a1b1dmr2754785137.13.1758869878094;
        Thu, 25 Sep 2025 23:57:58 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae305d0c44sm1095649137.1.2025.09.25.23.57.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 23:57:57 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-59d576379b9so939708137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 23:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/FikwC0An4Tbt2fUTSmubz516JOlpsPxXyzKKcmjgOcWflbaO7Jc4+wNIqiSDqXf63OkInXLhV0I/CynygZLy3w==@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:5a3:6a6f:21ad with SMTP id
 ada2fe7eead31-5acd0182a34mr2333473137.30.1758869876161; Thu, 25 Sep 2025
 23:57:56 -0700 (PDT)
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
 <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com> <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
In-Reply-To: <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 08:57:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
X-Gm-Features: AS18NWD2sqCNW31Hr76xpW5m_kx80ye1q9D4_pFDoOhvkwDietXEmUuVKInRsEY
Message-ID: <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Saravana Kannan <saravanak@google.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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

Hi Saravana,

On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> wrote=
:
> On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrot=
e:
> > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> > > > BTW, the "pending due to"-messages look weird to me.
> > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > >
> > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.=
watchdog
> > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pendin=
g
> > > > due to e6020000.watchdog
> > > >
> > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > the watchdog resides in the always-on Clock Domain, and uses the
> > > > clock-controller for PM_CLK handling.
> >
> > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> > these bogus pending states, and no PM Domain is powered off.
>
> Can you explain why you call these as bogus? Sorry if you already
> explained it. But the reason I'm asking is to see if you can set a
> flag for the watchdog device so fw_devlink will completely ignore it.

"bogus" refers to "1." below.

Furthermore, devices that are located in an alway-on domain should
not block the sync state.

> It looks like there's a driver for this watchdog node? Why is it not
> probing then?

Because this particular revision of the SoC has a hardware bug that
prevents the watchdog timer from rebooting the system, and the driver
detects that.

Anyway, if the driver is not available, unused power domains should
still be powered down, like before.

> > If I remove the "sync_state =3D false" above, genpd_provider_sync_state=
()
> > considers all domains, and does power down all unused domains (even
> > multiple times, as expected).
> >
> > Upon closer look, all "pending due to" messages I see claim that the
> > first (index 0) PM Domain is pending on some devices, while all of
> > these devices are part of a different domain (usually the always-on
> > domain, which is always the last (32 or 64) on R-Car).
> >
> > So I think there are two issues:
> >   1. Devices are not attributed to the correct PM Domain using
> >      fw_devlink sync_state,
>
> Is it a fw_devlink issue? Or is this a multi-domain controller?

This is a multi-domain controller.

> >   2. One PM Domain of a multi-domain controller being blocked should
> >      not block all other domains handled by the same controller.
>
> This is going to take a while to sort out. But the current behavior is
> the safest. How grumpy will you be if we don't fix this :)

Depending on your definition of "safe".  Keeping all power domains on
increases power consumption and heat generation, and may cause e.g. CPU
frequency throttling to kick in, slowing down operation of the system.

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

