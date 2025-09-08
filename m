Return-Path: <linux-renesas-soc+bounces-21576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435BB491CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 16:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971CA3BDE3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 14:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2773730F805;
	Mon,  8 Sep 2025 14:36:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4FA30EF63;
	Mon,  8 Sep 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757342204; cv=none; b=nspIklDa0buRZ4aUm0DgLOREYNurmKjVey52Lxp7bQFcc3VPkFO5ZOC7ICbRF7eBHuM3efNh6kpFiDM9y+U3Dypp/JN8dpAvqsTAFCTGtfMwtNy4IGEuMYWHi76+k3UH9RCMrWoaTcGsWMFmZYAdSkihpKbnf+50x2wvGAK/k8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757342204; c=relaxed/simple;
	bh=aWBxujX2uYswv8B0XTROSnJb0N5sPNs7CCncravmT00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ok0HB1k5Z59fz2NShG5r5bPrZ3ukjtyT/RiIJlNDjrG3EFVOLU/Z6zptfAFaD/UYSkUdEigJYM+z53g1+MLqdk3GuoveffxMJg1TaPRSQC07MbROuy6Tx3U6i1GDqkBxJv+tPjbqFwZll2doeZvSuuSm5Geror8amG8KTB1RWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-545e265e2d0so3618010e0c.1;
        Mon, 08 Sep 2025 07:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342201; x=1757947001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDyB2krlIE8rNxZZ8p/2zgSgW+1lAkY0Xa1KiP3J9sQ=;
        b=p+1tIXBt/7YfvWAaPFksh6xhG4jBhHXC0n8M/xgFAd/CYPLmlxYQcBPoS0+Da+iaam
         8KyN7zKLycO06A250Z3BLV2YBopLeXazatQgwa+mI8MSiFuBaFBXgetCRupFncJV3e/f
         ZnLBeIOaU+444uPg2knuCSnE9RiLArWOh3nmlp5HfJnA2THVl2BlW02bYTD+9kjTAPcS
         cfR0J3ntd6sU3yphp4bgrF5NcQC8JqovgnvBQ0CLWpI4mO63hej5m+AXjx+kI6twSXk9
         6osyV0B2Cg/+vEve2lx2Lg+EIN9U5rZBLe6z0gJx1an2L6lbVJ2s98NBs4Eda2+EjqPl
         l8gg==
X-Forwarded-Encrypted: i=1; AJvYcCUTZxKkfNbPgOt3SOjTXALpQhNHdQwkxSVd7D64wcreA8KnDnSpYfuPeXGsunt3dKsF7aTzyhTMAbg=@vger.kernel.org, AJvYcCVTE+bj21w4rrHpu75S8yTCC1DS0q88UKAjw46aBsIZwL3+rcxAj//bGQPALoDA5oVsW8Apw7rl@vger.kernel.org, AJvYcCXdqHIYigTZh6Gb+sf3PJ/KhFJXknAFpwDBtHz39mXFuKfiN3lqhpfs0AIuLgczumOhcyEQlBL9UoO/nIWx1l+W0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2+Yq5r1PIUDiEIdeRwcG16YskrmfADMuT+XR/lnaPHhTXGSi
	e7+Fzcgb2q9JG56dThTcWz47fFDC9MxXl1DhBqZZT+fCuRvpx7KhX993SiQESIN0
X-Gm-Gg: ASbGncsbRmjUbQI5NVLLpgp6Vp7NVNaFGzJyOTRdQTLQO8JaGod9FEwHzLl18tEfBjL
	CixVZMPJ/F7j5nTm6k07gOG9faUDZaTgVByDgJFEr5yuPBFbZxI/CFjY2Iuofij1Z32QKuu7O8K
	HxraoD0F6JEetG9ib5nc55JD2Aas9z8dyMgdvweNzPrfvjYKr+8XKgOPPP+U8JBOa+93C2rGoOP
	TurIkZ4Gjnns61Wmn2kUIuOi8OlGqukwG7bAheaYciM/bmjfK2sz+3Ydt2ud3tWDm6TI/hInZaq
	66AcCuIWoSbDjo+ItFt7FSofOscDva8JaPsjNKusJ9I+kzITdtMpZreBovIRbhWFb17lmLVz6x0
	zteum8PpQkbXvbG6dzduD9D35wcuNivI0tWtQyVIMHtq83LOr8Rjncg9hylLIyDg/8PkzlAg=
X-Google-Smtp-Source: AGHT+IFyFzZ+1rzFiWdnVuKdvfkF+8Uef9QTRxeTkoYkaS24GMFPbRpF7hxbZ/4CBNOa+1o8AJ287w==
X-Received: by 2002:a05:6122:d02:b0:545:d9d2:a832 with SMTP id 71dfb90a1353d-5472aeed8f7mr2320048e0c.7.1757342200877;
        Mon, 08 Sep 2025 07:36:40 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491467546sm12196184e0c.17.2025.09.08.07.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 07:36:40 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8a1d640b50eso2522974241.1;
        Mon, 08 Sep 2025 07:36:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVG6mRLW//aOmwuBlo0Ccpo+48/euHSxb87O+Avm6WFHmWKS67WD6FYSmcIo2XF9axe58rcPWHn@vger.kernel.org, AJvYcCWCNXOih9ET8HbzWXwDSEm4m4PaEhtrJFn3tAOCZHOaXBWNoWFpfpSFVAboDpkSNts61olX3/Fpx28=@vger.kernel.org, AJvYcCXb7bo7/dRyP0BoC2f9x7vjaJr0SidF6UqedTUTMF8Uz1QiJwP8REa+9MAw8nNvkcyo5Qa080hGqy//B2gJjTxaTw==@vger.kernel.org
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-53d1aeacabbmr2149246137.5.1757342200407; Mon, 08 Sep 2025
 07:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756998732.git.geert+renesas@glider.be> <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch> <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
 <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch> <20250905184103.GA1887882@ragnatech.se>
In-Reply-To: <20250905184103.GA1887882@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 16:36:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>
X-Gm-Features: AS18NWDDiJDUM99OjCO1NTM5SZENlk5h_nA_Wc3995eUm3tBgaiRGG6RUKZyn0U
Message-ID: <CAMuHMdU=Q6AZcryj1ZBGW+5F+iYvZCL=Eg0yPw0B4jnczmA8nw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 5 Sept 2025 at 20:41, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2025-09-05 13:57:05 +0200, Andrew Lunn wrote:
> > > You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
> > > WoL would be pointless.
> >
> > Yet get_wol will return WoL can be used, and set_wol will allow you to
> > configure it. It seems like EOPNOTSUPP would be better.
>
> Out of curiosity. Are you suggesting a compile time check/construct for
> CONFIG_PM_SLEEP be added in the driver itself, or in ethtool_set_wol()
> and ethtool_get_wol() in net/ethtool/ioctl.c to complement the
>
>     if (!dev->ethtool_ops->get_wol || !dev->ethtool_ops->set_wol)
>         return -EOPNOTSUPP;
>
> checks already there? To always return EOPNOTSUPP if PM_SLEEP is not
> selected?

Iff we want to go that route, I'd vote for handling it in common code.
Still, there is no guarantee that WoL will actually work, as on
some systems it may depend on the firmware, too.  E.g. on ARM
systems with PSCI, the SoC may be powered down during s2ram, so
there is no guarantee that any of the wake-up sources shown in
/sys/kernel/debug/wakeup_sources can actually wake up the system.
I tried having a mechanism to describe that in DT, but it was rejected.

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

