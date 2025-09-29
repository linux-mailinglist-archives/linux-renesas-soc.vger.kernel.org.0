Return-Path: <linux-renesas-soc+bounces-22433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CBBA864C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 10:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EE4F7A9803
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 08:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D68026D4C1;
	Mon, 29 Sep 2025 08:27:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5DD1A9FBD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134433; cv=none; b=elt0Hwtutx1TaGy5fr+uEOwU1CKkYMDVPLg+ozmH2qcte+kEte16MCebCyyEL/HTl5Omz7+5eWP32cOKxJPz+UJQfaNbFxKorsTpDMpQbhBMiAdVcoLkHCcpNlsHum+lXZrxHRfiMgdSqq+hKCGAI11qwZSt+MCg4cXCpCpd8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134433; c=relaxed/simple;
	bh=3wEnJJupgz1SJm2E9By0j/0oQe0EV3tSedp0jhNUmw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mw5urVgRNwlm4e3t17WNbeY5pP0r4ERHEqaCsTzYA2UXldpYnsStTX02Kbw1GtcsBLd9rNl+3jFN1BUdPpG/IEuRQCcVcXDCUxnxDYoN/yObT8Nm5QGZ1+gQOqeNDCZtGSQVTSoUhzxx15YrOqDkEo8Wob9R6DHrMpP48LVthAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso2228642241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 01:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759134430; x=1759739230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjEe7O8j7KCrjhzBmS059atyR4bTunLk3aQjDHMi0Mg=;
        b=qxUpsBqjeAjBJC8hiLU6M5ZJOIVwdp+9qv98lLR24rzDyB6hCnzvAg5znPQkHdEiBk
         vWVq82QuAIyvNQShW04tOPAhaR9RqyOvv4NeP0RtqXoPFVYpnA6WuU+xQ9qkFiBNpEQF
         NJIeuDEZ6Gy9LhsMXHkEN/yS686Gjnnzbrq270jekxCFbCJDEhgFLF69sdlb+vLuAWnT
         mKP5JIeWm7R+ocNZCtTmEEZ2QpsyAtGugovZA9/yK9WDnf3jNd96FlViwo2eIBlw4iSO
         ib94ync0yNgOwZRZR4UVHc9O3paKEenUuXQXj2XguF1emxT3GoY7JrHpqKV6lruFuFhj
         ZsdA==
X-Forwarded-Encrypted: i=1; AJvYcCXUKZWSLrpAOJ1KGF+CM5dcJaIckWci5KJhocVK0eLFIXD1UQVQQ3DPmwExrhH32af2xD16Dm+9QMGp+z11BdwRag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJc5RBKWoyAObAGgvqewdDhOrM7SSMHwTG2bRZH/z7CRx+GbVp
	WluFOYiK/fVe4A1mZ0VSp/BSn71e0+FBh5cNbDGkPCJ+/KZp2GOf2qoDCo3NGyHa
X-Gm-Gg: ASbGncvxK8ykKQ/0oFustsEzZgdzlvAuIGYb+16fm/7HlBdH37u6VaYNKEnsQJpAnYS
	zIw2yNXOlR8cUYQr+qRk26D5xTYHcTaEx7RmdwZpYiWl6yMLrzUhIS9YTstdQFXv8wW2t3nfYGH
	ErqgMbjog1ltF3eHSpUJW5kIrr+MPWFrsRQR16Mamo4LbKFQb/7QFGEUQkpga5ay3cGMVIx1DH0
	UJqPSen7jxl1cSkyzvqqR+bsh6TUfqWZZPMNLR6GFx4PDMIkIyrb2D6MKAwtRlxZexie9ienGKt
	X1emfe7SQSk3UHMLSU4SvPrZGjS34eS8ptVK79PGWKzdbYBzlhyDFaoRY+SbNBjCKJZiDmZomN5
	O77txYIRQWs5anD1QPCF6nDZe5DuIaymgBHkzpl88AkNfoGZkTLGF3apPdTY9
X-Google-Smtp-Source: AGHT+IEzZhVkZOE9mug5wwOZPDJEEjU+CIMy9CGki/8E51/TaX2POdYJTD0FrbXoveKTjGS0q9/UTA==
X-Received: by 2002:a05:6102:510e:b0:527:d1de:893b with SMTP id ada2fe7eead31-5acd4639ad5mr6363955137.18.1759134429747;
        Mon, 29 Sep 2025 01:27:09 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d878c126sm2297333241.11.2025.09.29.01.27.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:27:09 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-50f8bf5c518so3382006137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 01:27:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeNs0+DjPXyDU74h+GEzPWpzQW3z6C8xEv+8onSrvMS5ZQnuyHuAqDr4TiziennfP39BaAJ99nLFjH33q9wTuysg==@vger.kernel.org
X-Received: by 2002:a05:6102:d90:b0:5a4:420c:6f94 with SMTP id
 ada2fe7eead31-5accbcdfbdfmr6816724137.4.1759134429370; Mon, 29 Sep 2025
 01:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756998732.git.geert+renesas@glider.be> <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch> <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
 <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch> <20250905184103.GA1887882@ragnatech.se>
 <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>
In-Reply-To: <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 10:26:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7+F-VdNw+LLCs_WPUsFVNnbsCT-wompswecEmipmhqA@mail.gmail.com>
X-Gm-Features: AS18NWC4L73fMvbY7JVbl7jU9THAB7wi-kzKLyAei1Oc0zvFvsC0lPY-ku9gbpA
Message-ID: <CAMuHMdW7+F-VdNw+LLCs_WPUsFVNnbsCT-wompswecEmipmhqA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Sept 2025 at 16:36, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Fri, 5 Sept 2025 at 20:41, Niklas S=C3=B6derlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2025-09-05 13:57:05 +0200, Andrew Lunn wrote:
> > > > You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
> > > > WoL would be pointless.
> > >
> > > Yet get_wol will return WoL can be used, and set_wol will allow you t=
o
> > > configure it. It seems like EOPNOTSUPP would be better.
> >
> > Out of curiosity. Are you suggesting a compile time check/construct for
> > CONFIG_PM_SLEEP be added in the driver itself, or in ethtool_set_wol()
> > and ethtool_get_wol() in net/ethtool/ioctl.c to complement the
> >
> >     if (!dev->ethtool_ops->get_wol || !dev->ethtool_ops->set_wol)
> >         return -EOPNOTSUPP;
> >
> > checks already there? To always return EOPNOTSUPP if PM_SLEEP is not
> > selected?
>
> Iff we want to go that route, I'd vote for handling it in common code.
> Still, there is no guarantee that WoL will actually work, as on
> some systems it may depend on the firmware, too.  E.g. on ARM
> systems with PSCI, the SoC may be powered down during s2ram, so
> there is no guarantee that any of the wake-up sources shown in
> /sys/kernel/debug/wakeup_sources can actually wake up the system.
> I tried having a mechanism to describe that in DT, but it was rejected.

(oops, forgot to press "send" in an old draft)

Discovering commit af8dbf9c6aa8972f ("schemas: wakeup-source:
Possibility for system states") in dt-schema.git, there seems to
be hope!

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

