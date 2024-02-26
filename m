Return-Path: <linux-renesas-soc+bounces-3175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176886751A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 13:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633DE1C2519A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7AA7F475;
	Mon, 26 Feb 2024 12:34:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F17EEE6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950892; cv=none; b=Mq6XHrWuDVGkD+/iYR2lvFFYfekF+v9DBA8m3d1knpCBYO3uHScw7bImU1N8I9aOK5z3quBAgwpzbAFfEAvyb+hGXCw+NMS7zZpFZAV4Qv1ClB8gQSn/R2GeYyfUTy4+II1yPX+m8XECX0/I1VklXdH00nottBvvB3jhZgyQ+Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950892; c=relaxed/simple;
	bh=De5jFqHOHZHMz8MrR2mH+vSrVIpz+Cc9TEM663LMYkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2EDkcZZQ7OAXek38QdGHQ70nP8O4bhfIAZE+kuOAx+WylYldnZf2sQOFmuXTOjhbQWYm0IVQl8NcONvVTChZhETpZr3Y8EGwINAb9IvUhzU3lhQracwuyDnpKtVMsQ5YiiXkgQ8iGqo1Euf8BUhcFlJac3jzf6gjxifB0Cr+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6089b64f4eeso29634637b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 04:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950889; x=1709555689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv406fLoykgOka6Ip5+0enmvomWxZyc9N2TWMzfwuAQ=;
        b=Or6q8Rzekh9cZKOzme/a6ezDBnZz0XsBNSXl2dQG8PJSF6nQe/ZXxRoPU+tiWFzYja
         /wFxycJN28U7oq1i2+wQJeOLvHSSt/c+XLHShYBZMXw/31n+ZUQ7uPCrfi2OUp58RNHd
         gygOBoqUnnmaoKngdKpYgBV6QLzz7ZtjUJGreQ3XTIauiHw6le1/BbZi3Syp4USIvoBo
         cLY8Fo0I7NtYxZ/OziYkIJoWs0HQ2kEiQ28ylfGEa+OL9XH4m6G+MNdRxG0R0IztY+4y
         40UA6MIAPTmOg2tzAPHOfxW/BuJ0CeP9YZFC+tBF+iprgsH+MW8P10z75UdJ95dfTBqa
         BBKA==
X-Forwarded-Encrypted: i=1; AJvYcCXqM2GxrUZSM9FukZF5gCfvNHlSyN/CBMFKkUNg5eEigNBBOKevCAD/ikt6J+jEi5OGkL9CQlFRIWSiN4TnczRDhUv7L9pp2hBmTrJlUmQRyZs=
X-Gm-Message-State: AOJu0YyGNpI7ZCeyXwOR4U4XNDJx3mRiQUimgVMSV4hvrCW+wiV641k/
	I5yxaSxN+KtBCma9Ex3lnRE3bUzc9fJylDOJwIFyE25pAeYm4mkQgPKADS3CZ5I=
X-Google-Smtp-Source: AGHT+IFIJh14gp7HJzvi1LQqRdgm5fT2b1tg6X24MfchSpi/qb3dLfo/6IWMKsvkwMFytivKy7HvNQ==
X-Received: by 2002:a81:9954:0:b0:608:20d7:90e3 with SMTP id q81-20020a819954000000b0060820d790e3mr5899682ywg.39.1708950889587;
        Mon, 26 Feb 2024 04:34:49 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id x132-20020a817c8a000000b00608b5d24a69sm1158060ywc.19.2024.02.26.04.34.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:34:49 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6089b64f4eeso29634237b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 04:34:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyvQ13JDBvcvNlxoluLsoJLexNRjNKKckrHZKl4xcC9+BoH2DsEa2EVNQYg452HabocW/2MSB/wpauH/fU6j3YJTdiXCLbmZLCiyFP234JrDQ=
X-Received: by 2002:a25:9346:0:b0:dcd:98bd:7cc8 with SMTP id
 g6-20020a259346000000b00dcd98bd7cc8mr4294518ybo.48.1708950888993; Mon, 26 Feb
 2024 04:34:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223123127.221610-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240223123127.221610-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:34:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaK+8bxXpmExbkGGvcKwhLmjZ=ivQo1Xfc9VePbkgXcA@mail.gmail.com>
Message-ID: <CAMuHMdVaK+8bxXpmExbkGGvcKwhLmjZ=ivQo1Xfc9VePbkgXcA@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: Enable PANFROST and Renesas
 RZ/G2L display unit DRM driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the PANFROST and RZ/G2L display unit DRM driver used in
> RZ/{G2L,G2LC,V2L} SMARC EVK development boards.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch.

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

