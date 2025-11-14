Return-Path: <linux-renesas-soc+bounces-24632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3DC5C580
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8133ACEA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E692FB60E;
	Fri, 14 Nov 2025 09:44:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481F308F3E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113443; cv=none; b=THDHvUp26hwe20O2SdkR0UrCHmIgNziD+rKrevngpGsuFEO6GtQ6S0vFR1P40mGwAX4Gnb0qluHkO19UdxDu7uuWSm2kdCU3EHJKg09bKjf2O1uEka8GM8g+z2oj27+FrQNTvFYbDsOqA7I3jpJK4snkH353ZhsiM/T+DXMwUeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113443; c=relaxed/simple;
	bh=aJYAANABEoAIUaBHYu+sSW9iWPPXWILQHtV10sDxaJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isOpGkGZFqwJ2Q+rZqzfT89HNxf4Tr4hE2eceLEhqmJr44lKvq4VOtjDppHjq/K5GSZuELOUOxzjov7UxXdjdAM88iuLkm+cFh8bb4S7MEvaIjZ0RKtukSfj7OzMXkELDZh4+Yyjjc1ezzfO1PgF33CWvGAmw6YQycpyJ3BJZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b728a43e410so276350266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113436; x=1763718236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqtFvU4gpaBQABprw6muXyurqIeH68Zg5kpC8+rY5xs=;
        b=qGYMyERq40LNRfHp6sAVdOq/37ddsWFUuMO5txEMaiSXvSa5OQ7wW1CtnGYCR0OkSO
         880LSksSxuIna1QVr9UMC/388KzgaWTgW1A+KMOs2ZhEnauSEn+JT8xqwVuDGeGjlX4y
         WPdOxlPUO9chXfsCuh6+mlKAwIIV4RrX1/htJqQAz1Tq6p54RyoMY2R5Q0ZrsI4x0dOY
         WGUEbcf/cmoqC2003v8E4NR6FcOyGcZifkKcm5C9/y4PMi3R0h3DRrb4FKjl9BsEjSbi
         U6GGBDa873p9+N44+aZLVju2Iq+ySYK0Xwy1GB1cwbTZFdWxBkYfXR+Y1/oZ3gn7SWIZ
         ZzuA==
X-Forwarded-Encrypted: i=1; AJvYcCWcKuykWE+YIH+Cjer4/My+dpeA3qDaRbtcKFpckY+UKvc2CH7T/dLnkXj+V48CUm2fGThBILeEWN4kbRp/x3UsYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/0q+XZiHEExEWs5EnEJKsnryV+bwVe+l86x40dR8XtQcqHsO
	ueQMK1wmQGTUfJILeoSMYGh4LXz1btwWO4c1L1DD0p+ZlXSRlMsdAKSe354sX6s9/mI=
X-Gm-Gg: ASbGncto+uzabwFpYD5tgjbJdFomLRlFOo5460i83h+Py8arP0efJ2YWQKLsK3DnhIk
	ZjjUePG5uJ2QVr6VVOPYv1Ylhi0g9FdojEYFKt4hIQYbOLiL+Fr9Slg++mljcSr018O3foSC334
	OOjt0YGApZGEfWCzNlG1x2KWMfO4KEhbKZJWdZVFo2NfCoNDuBwcRrv3giJpczNhX1QwQaOuGsq
	hoMnOiou8+8/TnsuPSaIzrw1IAoyDIPYMkBYXx9DLtpiZaj4XwWdPCRV5HcMMjIBJgUPbKY0FXd
	fOSfSqufbi/U+H9mEf7zDEf6KDGxCT7TjgN/5BGRIYkTn+RI2VIJdwbPVp95Hc86J/8GIijnJTn
	3aQDwYATsafQb4CGGHivW43sXjj1R4gz+TrmQiiozNJS60hKAyEnclz2J8zospyPWBfiayNIYrG
	0TQUL5myRg5b2zrjgFnj792ISYcXzEtc98FRu46A==
X-Google-Smtp-Source: AGHT+IFcNni/6zDktb114tAtBZYwOyGhXiXxvfeRUIinYegkqUAsBEY6GTfc1/EWsmcE8YDmS5gbcw==
X-Received: by 2002:a17:907:94c4:b0:b73:4bc5:b3c8 with SMTP id a640c23a62f3a-b73678f2e3fmr228852766b.29.1763113435568;
        Fri, 14 Nov 2025 01:43:55 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41cesm345610166b.16.2025.11.14.01.43.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:43:53 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73669bdcd2so136654166b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHMOMBmhj1RDqs0XcyiaREBgWFl7rM6QjGhTdJNLrN/xtVxuIvpQrf1WMZOpWM2Zdvj/27ZQRn+n14zpNjRek3Ww==@vger.kernel.org
X-Received: by 2002:a17:907:a01:b0:b73:278a:a499 with SMTP id
 a640c23a62f3a-b73678adc4dmr231482866b.15.1763113433482; Fri, 14 Nov 2025
 01:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251114084122.01a0d281@bootlin.com>
In-Reply-To: <20251114084122.01a0d281@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
X-Gm-Features: AWmQ_bnEaFxu73Nj-q2Cezfl_7HYPeRWF2OfC8CAOM6WAXmswGw9ath66GQ6N2M
Message-ID: <CAMuHMdU1NmeCyNu8mHJ=Pb5WKjLkCucZ-XyNKPS5t1Kmt90bmw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 14 Nov 2025 at 08:41, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Mon, 27 Oct 2025 13:35:52 +0100
> "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
>
> The series seems ready to be applied even with the minor feedback from Wo=
lfram
> on patch 6.
>
> Do you expect a new iteration from my side or do you think this v6 iterat=
ion
> can be applied as it?

Sorry, I only realized yesterday that the GPIO Interrupt Multiplexer
driver resides in drivers/soc/renesas/.  Before, I mistakenly thought
it was part of the GPIO subsystem.

Anyway, it is a bit late in the cycle for me to take more patches for
v6.19 (I am about to send my last PR right now), especially given the
patches touching the DT and irqchip subsystems (with the DT ones being
a hard dependency).

So I suggest Rob takes the first two patches for v6.19, and we revisit
the others for v6.20 (including late review comments), without having
to worry about dependencies.  Does that sound OK to you?

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

