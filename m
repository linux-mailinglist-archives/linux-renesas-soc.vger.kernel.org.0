Return-Path: <linux-renesas-soc+bounces-19565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1147B07D94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 21:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C48170ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 19:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC33829B20A;
	Wed, 16 Jul 2025 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY+543XV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0C2AE6A;
	Wed, 16 Jul 2025 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694013; cv=none; b=hyvUhAzwUzd8/wu9+xqBbiV6mbKXuwOEcSc7zKxN9jYbM4tzmlOfSrC0wc/SwT8rrg68mPI5GJoHNPWWfovB96Ue0DLSuBaronJrDUqlNfxwEc8gNazPFx3ewdo7b/VFBwpQ84Q4hYFai0y8kPGOnAck1Cyr64OEeBQ5cwMSKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694013; c=relaxed/simple;
	bh=VP3X54e1B36Xv5PL/K+L7jb542DADGIk7+jcWaWteg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8o46diuGzPcTShzhZVmmoWtKYYDLB7maY9DBAh/R2S836jpy8pkRuPUq8fSnjec4O+ZY/2gZrbCYzItR/q2ugSswLo3QhtTWLseTutkCpjuM+Q11hzEgL8P4JsLCgRl8BDHhR+8GgS3LN0Xx+iEEm+JBwDZrMv8ABspjtuA7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY+543XV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4561ca74829so2316735e9.0;
        Wed, 16 Jul 2025 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694010; x=1753298810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
        b=BY+543XVrXpcPubzie9W9kYi20gTBHSYLTrSjfGa29afubzxv7IjJlZDt9HrlCSd37
         1jyFkjs5yyc5tY8ff1LXM+CS4l2XYPLb6ABJPLnId8Fr+QRycA3oEd8+Jliw8Rx6xCS1
         SuIduHhTTRnYJL4I4htVN5uW/6BrC5y3e2iuOq1LPBDISHjecPTkQ7q5LZ99fNjyX33R
         8eY6pHM1GQySxJ8UR6iPsfIIoMybBxcAaYwf1GB1N4QJJufsUZXDe5m2zXSGL01VlpB9
         LCR8G2hK8+oo3T+AZeJEwE1/I98+Rs/lVNJNcrT2hWwBJy5uPn7NXfWTmMf3x1dGF4Vs
         5WmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694010; x=1753298810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
        b=OiC0ywhrxcTcXuQhyW9gCYxiFVxNZ/qFBl2WgWLNI8APnvHSiwhH9Cglp8et/1DSi2
         yI8mtZUSRSdg+RUyMKXgAFD9P4jXIwOymuok2AGfQ+K5i9e7JBkKSdrCTYKzP+Vw7pJR
         fjnugXocg6+3Y3GmQSyKEsS+vnUCxhH0knvyFZtcI2bhrV07kUCdrF296EYMoJGigbQj
         4o6uZOO+UhZGWJt6tafMtCeIg/g1Ehb24ghyIgylzBgSYPAbFEOc8R3oEV6gnjtTRVHb
         Kry09ZaA/BYNjlV/1xGmzmPNCUzs7PsxQrV6bRrszPpQJTDKm/lZnVo8zpEndqckb2PA
         JYTA==
X-Forwarded-Encrypted: i=1; AJvYcCV//Uu//z/FvVhZl7VEoJKBPb6YEBgpIFHMaHj/YJW1oHxKwuxyjaVi6/8bPcy75O7bO+cJUUi6uCcyCbQZ5LXmdTM=@vger.kernel.org, AJvYcCVaCce72pv1WmVIHqM2zGtEg5dRcKNrYvZ/nqLfd0RlUZyojPnFrTavXAQeuMWnpm/ffRfQilmd@vger.kernel.org, AJvYcCVnIOIJwfViAHVUJe1XZ7zUV/huyq2spdUKvHdw921WFXuBREaPwhMAY83JnMXQcuvN/mco9Ac3O87SGTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqAJ6EzBSWAM18Xa1n15FBlZScFlp8oPqJEq1peZvM/XA03tP
	KjgXXDoTCCIcql2U2Pvbil/2H1iBvhpNdWVJDjmAjGwis0y7ooI6gZbFpZbtACXolVeIoRaTvkw
	lE7n4oAWkSPxswoN+Tz2qbKvvQDbul04=
X-Gm-Gg: ASbGncsKNLbMaVJFDdC4J59CjGAU7smWDtlq+6ozlKaWCwLRCDrICSOZR5V6wWRF//Z
	XAzXr9MhJ8n1BFeppXLT8544rKlsTX2hLpQXGsjf0JIM2/ikdlk9R2yf9awbhVk7GSjwqUb5Kki
	aFcyd+Jo8qhuEdWwxkDTVSG49GjO/6STlPh2tCc1PZZ3/gdJBq67i0qQDf5DFa+QW4EO2+BPbUG
	UQn0zEzuwPr0b6XiT8=
X-Google-Smtp-Source: AGHT+IG4hycp+esWmsd2Z1+rpj9/YEraQLvhtZn7APofxtvpj7YLxfhmQfzBkZnpCvMDICpuYr9ivl1mVrd1KFZdmyg=
X-Received: by 2002:a05:600c:8b67:b0:456:19be:5cc with SMTP id
 5b1f17b1804b1-4562e38a883mr37986905e9.14.1752694009872; Wed, 16 Jul 2025
 12:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Jul 2025 20:26:23 +0100
X-Gm-Features: Ac12FXzHx2y0J4y7k-9UUt0aRslx85AqxD4tqzLHcP623nHbyWD8RXhTbillqKI
Message-ID: <CA+V-a8tZKMfDjxmrkTJhN+=WoGBR0711yoZYgQWDKd361f9q_A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 5, 2025 at 6:03=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
>
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
>
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
>
> 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
> root@smarc-rzg3e:~# ping 192.168.10.1
> PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is tested with out-of tree patch for save/restore
> ethernet OEN registers in the pinctrl block.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index 9a774046455b..df4ca897a60c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver =
=3D {
>         .probe  =3D renesas_gbeth_probe,
>         .driver =3D {
>                 .name           =3D "renesas-gbeth",
> +               .pm             =3D &stmmac_pltfr_pm_ops,
>                 .of_match_table =3D renesas_gbeth_match,
>         },
>  };
> --
> 2.43.0
>
>

