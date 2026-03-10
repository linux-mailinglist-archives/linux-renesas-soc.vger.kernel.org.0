Return-Path: <linux-renesas-soc+bounces-29114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF2/LSvVr2kfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:24:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03A24740F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 09:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C1FF3013A59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 08:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803FA3EDAA6;
	Tue, 10 Mar 2026 08:22:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356F3E8C64
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130925; cv=none; b=NevOGyN7IQSEnNXQWC3TyzyOEsnMCgs76la+yvIRXQJsySGNOI9ztUvdkYLe+3Hz/Mt06x9VaUuatU6g++Mk0jPNwt6cYKwbJ7YAYGdPh/7Jvmhp9LB6qvskot5WdVRC74WKfbh+rgHaSRN99e9nKAH+e++d7b64v7FrtW70b5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130925; c=relaxed/simple;
	bh=8eG9h4oNIHd3WkVYJ0CiryGcrS2dUFm0LrdqFBGuGHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDia95PeIvaxdUAT/QXEgOLqg0YgrcL8JK7rsN37Od65X3GWGjUI/nJEuZC1NF/XxXk5dAGxRItP0psSc26LlAHtTHEorrncMTqjLVk0wIqUSMEDVBmssB62GMcAdrvQkm+WQM7en+91i18K45eguepGpytFOIBmxuDvR63SaWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fff77ff69bso654047137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 01:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130923; x=1773735723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ME7mYFO5cSxoraTNGXEpjmzWMS/MMckOG3Vu7nhm3yw=;
        b=xN5BiMl0DeLLRBuAq/5TYiVoXLyNIHyf/WbXC6wF20CCP5DGVkHPzpqNZ+80y2WFLn
         GjP+sEg2fOzt8mM1YP9IxcwQXEk2nXlZTCsm4aKZ6kkOGk2jxwrNwS72zf+k9juezEEa
         z7KT13a5wn88vqOUdDjLnf4DpGAyfV7DRtj8HNKf2+18pEHX70xU2syNulAv7NHfsIJ2
         6lfu0KdbSwOsC0f0tx6zLORB2mgEoybnv/+Ni91wCvL8Amx4YXVSE8LxiPwlGLCV7ZKC
         p64Ti1AgyTNM5uylyl7VA1TsXdKrXQuNcpBFOt32oLcO+ORJR27HdIY28DTxmlpl11Jg
         dOXg==
X-Forwarded-Encrypted: i=1; AJvYcCUNEHy1aO32tGGlcC+scBasq3okoK0R2rEQn3YEsObVOf81b9NcflPq44vn4u3KRAlVVxiKUlvC8wwnylHsqe7lrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUZnli1XVH2dnIvw0gnFgVd5FPYewQ6ahw56hftw1zdZFam3m
	++dflosbpsNzr3KuY0ESbAvgS2zdhnF7U8Oz/v0LdZfD2ZHy9IG52Sti+TScd0qD
X-Gm-Gg: ATEYQzyhDEvGgL576iCAXu7MIIF1FXlb4VRoPjxP2hIVlLEVuDzOJHeJ+/MBQ/sfhFM
	+itnI76cxI6OqEBpS4d0CuIQ+6xBTrKF6PUapXU4R66mVYliZIvxq0g3PXqQLL7cJi9D5kMwyKI
	rSNUWIX1KhZNaalBlEecmgy9EPmKZtRfNi3DEo9a66Wfq5Jh+OoQhdeU6/ISTu27m4ab3tx3/BN
	iI0Ph5LWyWjcYxjRRI1S7lowE27oe4zEyKh8V/EIx546lWS/EcRGzntlYR+0cKS2S4JOCsF2rdu
	K2VRoq4pvTuyP/vHWAYc8vTvcH+U6KFV5cfI+yG1Rl50O9xu8D3nAujbpIdlQWyquRVgd5Ej+gi
	svm7gcItojftPK4Xq+f4vrnO4ESdWsLkk3RDIc0OwAdxvVl5lT9sxfLqyJnEC6wHjwObUn4PLYh
	wSEwrP+YmBewX2A6zvtKu3zt75XwLCLH1zlSxoEvPsNGvWc/gUOi1I3wyqEBJqPcaC
X-Received: by 2002:a05:6102:3583:b0:5ff:17bd:9e83 with SMTP id ada2fe7eead31-5ffe5f567f0mr4668493137.14.1773130922448;
        Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b35f67bsm9573872241.5.2026.03.10.01.22.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56af30dde0cso1898843e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 01:22:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU43jfpOcBYYCEcYcpwkTosWMUSM256V+1NgjIsaqKeUO+ABMvfhP6cn/Ff8CdiHvrIvRNK7K9gZRucSY0RTDsrOQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:5ff:2391:45c0 with SMTP id
 ada2fe7eead31-5ffe619f7a7mr5819578137.31.1773130922022; Tue, 10 Mar 2026
 01:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYnyl-Nf4S1U2yj@google.com> <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
 <aa-3BYKrONKrHvTq@google.com>
In-Reply-To: <aa-3BYKrONKrHvTq@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 09:21:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtWf8vp4mDu5RaWQs_YQ4w5Judk-GsQ4ih45DMEKQ7SA@mail.gmail.com>
X-Gm-Features: AaiRm50gcawarxu3kmNtLb8Q9J-FKWy-3ateeFJv7I6B_cUkGbMzYEJyPcISy-c
Message-ID: <CAMuHMdUtWf8vp4mDu5RaWQs_YQ4w5Judk-GsQ4ih45DMEKQ7SA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C03A24740F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29114-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Dmitry,

On Tue, 10 Mar 2026 at 07:16, Dmitry Torokhov <dmitry.torokhov@gmail.com> w=
rote:
> On Tue, Feb 24, 2026 at 10:04:15AM +0100, Linus Walleij wrote:
> > On Wed, Feb 18, 2026 at 9:58=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> > > The GPIO get callback is expected to return 0 or 1 (or a negative err=
or
> > > code). Ensure that the value returned by rza1_gpio_get() is normalize=
d
> > > to the [0, 1] range.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I expect Geert will pick this up, else tell me & I'll queue it.
>
> Geert, will you pick it up please?

Sorry, I am seriously running behind with patch review.  I hadn't
realized this is a serious issue, but apparently the 0/1 behavior is
enforced since commit 86ef402d805d606a ("gpiolib: sanitize the return
value of gpio_chip::get()"), thus rendering the RZ/A1 GPIO driver
broken since v6.15-rc1.  Unfortunately this doesn't show up in my
limited boot testing of RSK+RZA1 :-(

So:
Fixes: 86ef402d805d606a ("gpiolib: sanitize the return value of
gpio_chip::get()")

Oh, that got relaxed again in commit ec2cceadfae72304 ("gpiolib:
normalize the return value of gc->get() on behalf of buggy drivers")
in v7.0-rc3, so apparently we're not the only ones...

BTW, that's all info I would have liked to see before ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.0.

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

