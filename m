Return-Path: <linux-renesas-soc+bounces-12459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7BA1B64F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 13:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0793216A109
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 12:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D4C5223;
	Fri, 24 Jan 2025 12:52:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8A20ED;
	Fri, 24 Jan 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723135; cv=none; b=j4+uZtwhApm48hlczzuXDQpdfE01dChN6ssLWCyFN2Ux08Wb3Oq1sGvDEpVOQ5PH133SteOigSLRt1gYKHm+K+Fd0RBn5afjL9AYbEShAvp2IvelecHq2cRw5/SUA8NrY1UJNPprWkRw43AJIAcMr6A3ayXifut7wXZjUVemrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723135; c=relaxed/simple;
	bh=LmUgDWigoKreNEfXiBDNvFSj/48QclhHVtIubVnAteI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKk8kw+QGBHBKAOqrX+SdFaLU9ddJ/POU+4fDrx/pxm9nUvHqNSOvvYaBrVJgp0xiFqSBea639aY4zvfohZGVk1lQPffA0XjFFkhoIosKlKMHdJ6z+H0loxn65asEQ1LFgZHGQeImJewGM+ma8Npz9tDFK9bVprmjLQSxKncB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5174d53437eso1165261e0c.2;
        Fri, 24 Jan 2025 04:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723131; x=1738327931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9ViOWMG5jKFCBvlpYS96nIlMfkNruTXof4tCvSO09Q=;
        b=pZjIZPAZwAXrIl0Dg2YZOzWST/Wuybq8ff94IItIxUqA+Ltza6dW+6vwmgXwiVyIhY
         H2aZ+PB5tJZ/eBo3VkDT8AfVaoSSArfXzAqkswQyjmHs9a2Rex6Jr/9U45aXeY4qymCl
         hL8pjzrRImfOYb8nMeTxYZpkmII5++JtA3lRH1HYGNqVG0vyotC1Ot4HdgeCN4lBQYNs
         bEygn/djXd5vAR0BvRqGATyu/moGX8sSkOAhhaoe6yYNWJB5yBWSJIVdhV5y6O0yOKlN
         bz7PH7OPfQabQigxuRj2ojL67rkk7J4EGa2MZi3kYxuvpBNVDao/5TGRw8yFju22rOrJ
         DmEA==
X-Forwarded-Encrypted: i=1; AJvYcCUxsEMe47pHXkgy6pKHX+p0pNZxGwXwabaiHNNijolDr7V96VZ3ekH4UXnROX8ZL6aHyp6H4uq34RgH4Sca@vger.kernel.org, AJvYcCWcE5wyzgAnZTl0K70LiUTEGX8k97Se1rQJW2JgOBvDAmb0Z2pWZPFCl+TusueTDcPtFNt1+tMMw7GKuIAMRR0iEVU=@vger.kernel.org, AJvYcCXOSjiRQlCVbyqqT5Rg7NzPqWHkld7th4+lJ5lSvZp4FkU75cho8BY333M9CEu0IXNKYJ37T/HQqkY9qfcO@vger.kernel.org, AJvYcCXXOCT6qfsC/Sgd0qWdQ/yQceqjhomVTEgSJraqg6oCT9R7S1eVLOivLrTulyMvK3a/GG4wloA3GDsF@vger.kernel.org
X-Gm-Message-State: AOJu0YwM33tk/3hkglbLHMEmRwe/4Gcgb/6YU6diKe1s0IhWsYVVH7Nl
	KZUElF+bh1MUhUaNPZ/GgdQIp2LwRB7i/Pl79Xcz6qQGoPyM0GqWaE6bhvKq
X-Gm-Gg: ASbGncv+b3GsgqQaJIY1DoqpCQswXc9kXmw3/YTW+MIRfeWWDX8X0Ibs533PIYtwVU5
	d0kmlhD+w1TxU8zJF0lwxgTOsbNxm7p81kzvYolhsCEAiIAEFXfnr8fpTvl1M/7v6zIvtTaYNyx
	C4Pa+orbugfhei9igNt1YFQdVwlRv4T7Z8j2PQou7p9AqmKXviJnC47CBZ4W5ae4B1ijgHPRyX5
	Lj5mx3atq62Dn85HjC/YFVhXMTTDdWCIFoaD8OUyk16FteK3NQWf5CtMnioTHPChFeU/XyEWhXV
	bRJShd1h/e+JT4L0fysFSR2C/1EbiX28Uq64WWbTwxk=
X-Google-Smtp-Source: AGHT+IF6y5S6KWMXiRp35/8+JyTI+3Ypr15YkKFEvZANiCl+3YjkTEs+oYzAxSACz1ebUUQD6cXBvA==
X-Received: by 2002:a05:6122:3c90:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-51d5b2fd549mr26305079e0c.6.1737723131402;
        Fri, 24 Jan 2025 04:52:11 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4eab083asm362009e0c.25.2025.01.24.04.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:52:11 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b60c221587so1174508137.3;
        Fri, 24 Jan 2025 04:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu/mfarSd1dDpjwQ9CG4+NHo9ajJLQ1FJP0+XAxkTTyiddxFwFCFi56qhNAfRP9BFbbMr8KUR26W4KOmi9o9wXev0=@vger.kernel.org, AJvYcCWi6DlGvUCruzq7dtKViiW+T7I86KLOw2PXSSN9uiSr4i4GdAXxVKVbB9E9tXEIOE3kuYLkGBowYg5e@vger.kernel.org, AJvYcCWwrvGLSMxt6yiEWmGRnSJN99rJuCJDQasy5JTnKtMAD2kt9Rb4paNhY3cSKWBiGAsgXnQb+US4mDVdh0Rf@vger.kernel.org, AJvYcCXSuIX73ru/jmtisLMcvopZ2Eapy9YtR2j9/QgJSqkwuENrVBTas+b9BfXj079rKINx06zwnDskLwFURXB2@vger.kernel.org
X-Received: by 2002:a05:6102:14aa:b0:4af:c5c8:bb4c with SMTP id
 ada2fe7eead31-4b690c77448mr26313856137.16.1737723130990; Fri, 24 Jan 2025
 04:52:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com> <20250120130936.1080069-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250120130936.1080069-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 13:51:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUofvZMtcEK3t5HMbqVDgU438Jc7KEcjJHBPcvkx91Y4w@mail.gmail.com>
X-Gm-Features: AWEUYZnLtL6lUD3_WqVfbNgRZnKXNQLHeNVMFMY8Nvy7QcgsKzbRYc6SjAr-r2M
Message-ID: <CAMuHMdUofvZMtcEK3t5HMbqVDgU438Jc7KEcjJHBPcvkx91Y4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: renesas: rzg3s-smarc-switches: Add a
 header to describe different switches
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There are different switches available on both the RZ/G3S SMARC Module an=
d
> RZ SMARC Carrier II boards. These switches are used to route different So=
C
> signals to different parts available on board.
>
> These switches are described in device trees through macros. These macros
> are set accordingly such that the resulted compiled dtb to describe the
> on-board switches states.
>
> The SCIF1 depends on the state of the SW_CONFIG3 and SW_OPT_MUX4 switches=
.
> SCIF1 can be enabled through a device tree overlay. To manage all switche=
s
> in a unified state and allow users to configure the output device tree, a=
dd
> a file that contains all switch definitions and states.
>
> Commit prepares the code to enable SCIF1 on the RZ/G3S overlay.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - adjusted the patch description
> - used GPL-2.0-only OR BSD-2-Clause license
> - used proper description for SW_CONFIG3

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

