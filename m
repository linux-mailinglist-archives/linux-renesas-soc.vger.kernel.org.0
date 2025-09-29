Return-Path: <linux-renesas-soc+bounces-22432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0271BA8534
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 09:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A206D3A2F7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 07:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B847260588;
	Mon, 29 Sep 2025 07:53:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101991E9915
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759132423; cv=none; b=ef6posbMuBraXqubWGs0Am63HBOh5ogRtoTrSglZ5fETxAxmXNqy2+rnbHTt4jFPP1jx5T3NmUDcc9sK1LcNnmMeAWl/z3Bku5t/bIjXcKvK+RBuX0p1iQTHfV1W1ND0jGvqx4S+Ub/U1n+RGDzJt6eq9DedfGRTQy1g9bEkjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759132423; c=relaxed/simple;
	bh=SmgJ4nQra9wq+wT+HKrmsX9lGBzE0orNDzbN6LeqaVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfeoaFDgXBy79W88DC/+I+lco+GdNpu5yi+fDk8OogqRZPFPY3dMuIoHj7rznX7+IsSfCtXx9QUK9xKBh3WZ3rvvwPerHgjLHhw0V+dxtCfU+FTYYxp0ISqvaL+Tm4uOOCvR+EuiYRiztL3JnTEig6E/udgKl8R/RvdGdYSe/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5b59694136bso1919718137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 00:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759132420; x=1759737220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUXSFceWb25g9n2jWqeSmoB7pNwdYGNyiAtsuATGVG8=;
        b=CALE5ArNXcXDzuDR/MnM5GJ+SdQMJsNuvgUtJ0qd6nZTjjQ5/PoBndL4xC73xrynpT
         AooGYqzD0GzPbHoGJQu4SUKu9BwjYi8m/JqfIV6noWDdI+RzSQtr3KMQnmStGcJjnKHJ
         VJ8xMWZRozXgQhBUN4P94K87G+pbY7DQn0PFl4lSiHAMccKrh6TzrpYJ5GMOsXKsLbUQ
         TjPLsmaaxqr6EEJ3f3DrtulTR51zPOuj5blI6fp/DYOWkMrnqKO70TQUN4wk6CeXbvyN
         ehfyuHh8ui7IEUvs/wnhBSND9Mn45E79m+hT9FLOGp7ZHVea4RLxiYOThmNGpW/cQtFT
         10Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXM7f35ECPx1QmG6dx+76W0/90rz7305PhoTMbIdrw2cxNXD5ViigXPH5afXUMsJeCCJ0S12By8Sz4hgogVa+BDPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxapDmXmtLQsX6WA71lUu7uwVxkexyqee4p0pJfA+ynGxUBRAU9
	Ljz0sm6geBHL4FgpeEAEACy1OfLN6naUxYTE0onOnr/rXQTuWpf70soYwiGJW1LT
X-Gm-Gg: ASbGnctZSRlutOSV7EGp11oy5EdTVDDiAx0L1D/wtGUEnX0YaCD9Zd1lxqc5xVlh7BF
	j1rhngLGpg+jibO6Kvgp6Zg/Vk7AaLLViZFa0f801+BGSbTudGOC0HRZGFGSZwrw/lmPA3MnI9B
	pOistxPdDhA47DC3f6tC/+jaC9m7RZxh9kOGYd2JdEmmPcw5XovZwdqP4WcQij34HAEz/HPA276
	Rb/aCst3UjsYKqd4+fxVaXp9fCZeMCQKTv9X5Pfym+rapCTyrhn42ym3sc4OaHLvbMkxS+VgURx
	gj+OXPZ38ZuUFoA0njUD0DGL2sMiPeCaE37IHeQYxBgD0i9ugTbQs5Pz8TaTI2y4y6oMD89ioY9
	Kk1G2mn2sWGevpVNmw4AM3KLvLKh2SJRXSfU7oXlQ3I6y3lxtX8vSz+k5qZkeYO/wyOQJz/0=
X-Google-Smtp-Source: AGHT+IGFFgp9aKP0ed2WH7T+33G1c6vmfNrI2LAE7buGdqvsOvpU2gdD5saebUQ3bfPhQGaIGJJ/Vw==
X-Received: by 2002:a05:6102:3a12:b0:555:ef1e:49bb with SMTP id ada2fe7eead31-5accce39442mr5439393137.21.1759132419893;
        Mon, 29 Sep 2025 00:53:39 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3b232a01sm3193214137.16.2025.09.29.00.53.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 00:53:39 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-59d576379b9so2185098137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 00:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp+c7UjAWqcYe5lgzTSrn31VtxSGISdN7w65sQ8y9c+It1sqyrKA2WREBMju6i6/pU9zkvWfYul/0mSilDCz9Y7w==@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-5acce758205mr5685599137.23.1759132419534; Mon, 29 Sep 2025
 00:53:39 -0700 (PDT)
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
 <CAGETcx-L-KypYZEkdKRBfZHDhFMTUuwKEGVQ-7QPv=++6uwLSw@mail.gmail.com>
 <CAMuHMdWjhXjjw9wFw5Me-wAX0nA+gK2mdGxLyBJJCWDHZ58LeQ@mail.gmail.com> <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
In-Reply-To: <CAPDyKFr4t7KjV+bSB2_4wRM0tsSNB7fosoJHAN+yDgc1g=7FgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 09:53:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYs1w=GtQEQ=iMYxCfAnY4MDrrEQYV+_dNc_sKWCz6zA@mail.gmail.com>
X-Gm-Features: AS18NWDHIeKax_oc2j3zUm5LN96ZK89sUlSKJb1MXuYCTNKdArFExfgAY_xANms
Message-ID: <CAMuHMdXYs1w=GtQEQ=iMYxCfAnY4MDrrEQYV+_dNc_sKWCz6zA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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

Hi Ulf,

On Fri, 26 Sept 2025 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Fri, 26 Sept 2025 at 08:57, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Fri, 26 Sept 2025 at 00:41, Saravana Kannan <saravanak@google.com> w=
rote:
> > > On Thu, Aug 7, 2025 at 2:43=E2=80=AFAM Geert Uytterhoeven <geert@linu=
x-m68k.org> wrote:
> > > > On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> =
wrote:
> > > > > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> > > > > > BTW, the "pending due to"-messages look weird to me.
> > > > > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > > > > >
> > > > > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020=
000.watchdog
> > > > > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pe=
nding
> > > > > > due to e6020000.watchdog
> > > > > >
> > > > > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > > > > the watchdog resides in the always-on Clock Domain, and uses th=
e
> > > > > > clock-controller for PM_CLK handling.
> > > >
> > > > Unfortunately the first PM Domain is "ca15-cpu0", which is blocked =
on
> > > > these bogus pending states, and no PM Domain is powered off.
> > >
> > > Can you explain why you call these as bogus? Sorry if you already
> > > explained it. But the reason I'm asking is to see if you can set a
> > > flag for the watchdog device so fw_devlink will completely ignore it.
> >
> > "bogus" refers to "1." below.
> >
> > Furthermore, devices that are located in an alway-on domain should
> > not block the sync state.
> >
> > > It looks like there's a driver for this watchdog node? Why is it not
> > > probing then?
> >
> > Because this particular revision of the SoC has a hardware bug that
> > prevents the watchdog timer from rebooting the system, and the driver
> > detects that.
> >
> > Anyway, if the driver is not available, unused power domains should
> > still be powered down, like before.
> >
> > > > If I remove the "sync_state =3D false" above, genpd_provider_sync_s=
tate()
> > > > considers all domains, and does power down all unused domains (even
> > > > multiple times, as expected).
> > > >
> > > > Upon closer look, all "pending due to" messages I see claim that th=
e
> > > > first (index 0) PM Domain is pending on some devices, while all of
> > > > these devices are part of a different domain (usually the always-on
> > > > domain, which is always the last (32 or 64) on R-Car).
> > > >
> > > > So I think there are two issues:
> > > >   1. Devices are not attributed to the correct PM Domain using
> > > >      fw_devlink sync_state,
> > >
> > > Is it a fw_devlink issue? Or is this a multi-domain controller?
> >
> > This is a multi-domain controller.
> >
> > > >   2. One PM Domain of a multi-domain controller being blocked shoul=
d
> > > >      not block all other domains handled by the same controller.
> > >
> > > This is going to take a while to sort out. But the current behavior i=
s
> > > the safest. How grumpy will you be if we don't fix this :)
> >
> > Depending on your definition of "safe".  Keeping all power domains on
> > increases power consumption and heat generation, and may cause e.g. CPU
> > frequency throttling to kick in, slowing down operation of the system.
>
> FYI, I agree that we need to address these problems, in one way or the
> other. I am trying to summarize them and have also proposed a CFP for
> LPC (power/thermal MC) to discuss and try to solve them.

OK, CU there! ;-)

> Now, as I also proposed in the other thread [1] just now. How about
> changing the default behaviour from FW_DEVLINK_SYNC_STATE_STRICT to
> FW_DEVLINK_SYNC_STATE_TIMEOUT? I think that would solve a lot of
> problems for us, as it would provide a more similar behaviour to what
> we had in genpd originally, hence it would be a smoother transition.
>
> I think this would be true when trying to add ->sync_state() support
> for other subsystems too, like clocks and regulators.
>
> In the end, when platforms are ready to move to the "strict" mode,
> they can do that via the command-line parameter, for example.

Thanks, changing the default to timeout sounds good to me!

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

