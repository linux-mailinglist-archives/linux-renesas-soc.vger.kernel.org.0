Return-Path: <linux-renesas-soc+bounces-21321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EBB4379D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E98166BB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C0B2F998D;
	Thu,  4 Sep 2025 09:52:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D322F83D8;
	Thu,  4 Sep 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979521; cv=none; b=Av2JcZKpC67Hdxjnu1j1lZh63LUV/8tiEDusAj92DyicxzfW+ZjEselAYu7/ckOl+msUtnV2jMbVjyNgQKxAEi0rFYjEkDfxUQAN5zw2kE5sZP2vSlf+DR20EKOfCmQBatd6Xvcy9InlPdfBlDiuRjFE7M7GI/E2WmUu5kGVIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979521; c=relaxed/simple;
	bh=aRh9ECIvCZ+BSu3p11lpn1TnBSepXTWeXORdoXjYepE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pImU/QAZcO+yJDsCh89DDnr0U2ZmYe0JZKKZyg9ug/Z07XwpR3h7x1WVJY0LZz3rO5x8g0E22wzsUHY/2AbzRVRf276EsTw0AS9EMkKSr7hqocum/LLwUSaL0dusFupMaptVGsZ71QMGdcz/f4dCqED48tKNo/5KfizUWgadvc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89434e44afcso504952241.3;
        Thu, 04 Sep 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756979519; x=1757584319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+4vrH2QO8CjdsLy8N7yx+23YHCO6qODmfoFZkVh+xU=;
        b=CNzRIRZu0ype/gjs9H/oZB4HKXaLxyYa7I5QNJ49sLenovGyF2WuoDvTwE4foBVied
         7Sbt3yzUeZPNe2knSWlF8dypfYbPGNnkmp+Ze3bWVpcxFNEvzQKMhmb8Hb8/k0HSrefY
         UrHYYECSA4ldN/EHqPwH+WlIG8EN4i/SJWU7vEf6+4KN9ZPItitCKOOM2OutckxBRqaF
         knqRTMxmz4juXWdwJRBdEChAhb9i2mQzGFK5fUQHiXwGN+bm0XraWaoMIL/juYPAEFWn
         AEx71sgATBYUYJ+5VvoWau3d+LMEnbhyn7D/TX2SASdS1swiS9EpTvH3+Qh5Yx5J+lDo
         liuw==
X-Forwarded-Encrypted: i=1; AJvYcCUCEUkZ8NOfqUzXR4wPKQ/iJEHMgEiF2C8DaOm85xI8iQxADO1WX7/vdcZEm6bh7nZfFUQTU5OP7wm1@vger.kernel.org, AJvYcCVgEvxyemE7uu5sDoO4h4lrXMLXNciODkd4EraVSRXRJqnndPuTBhonZzyoaA132/uqfP+SAX+RGrdEaOz1YlU13vs=@vger.kernel.org, AJvYcCXiiJNTjCfrGYUlq/8kWx6+Su7AIXRe/O7gicgYdGVlNoljn+APOA5J6cuinexUsqNVIuq8oNKn/xA1/y5e@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBZyqvaIpDDUTeedG7ejfVIMQv+BRtwYio+kt0ue64xoM+w3L
	Wuxi+uWFJQxxzOMcbYOv6LOylGiyz9U2u1w5x+86X+5vJOOJu0rRLxhD+kDE4aO9
X-Gm-Gg: ASbGncui0Bq+w6BI1gpT6mW7Q8I+ILCtpAJYLT4GP0AAWmA1MEAD1QbpexV5pnx5dTw
	MQBUeXlq7GJobAOwykTT0IiCNwJLBjlHynNqBCUyYkWKBK3qYNN2p0ovM+zjUoyQ/7QrZ74Vb2m
	egxKts0BsvEg5CNHile1n2UBen6KoD8J8Br2xhAaF6WbGZpv5itRSB5vGS0QFBiyGuW07Eo3ZS/
	1AmUfebEhdx5PQMlstC+HlocyrFTqRgOSCy5FnyOLvUyveX0DYC4AC8z6L2CteoH409JUruhPzJ
	xrmx7J6eFkz7zBuM2Fm2lGuq2ziQIc8ff2wyOjfwIxTCKxDDayrXPYyjNQyr1EaEBWzKt7xbkbe
	p+px10Z8N9Gg0vboQOP+rgYOmRXAGsYZLQpNXasU+Ds8iR8VXoI7Ijxfo/f8i
X-Google-Smtp-Source: AGHT+IF5uzLnV8WSshDf+gXCFiLlvmuDBnlLEA9YOUOp0iJFBNobguAAE5tQCqVakEcKZInDyQH4Ew==
X-Received: by 2002:a05:6122:a1f:b0:539:5cff:8070 with SMTP id 71dfb90a1353d-544a0254443mr6348094e0c.9.1756979518796;
        Thu, 04 Sep 2025 02:51:58 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912eef59sm7988926e0c.8.2025.09.04.02.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:51:58 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8943761ca20so536860241.2;
        Thu, 04 Sep 2025 02:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1reHDZbY+6ujc9e/JqHtZ6G2qoFWLeDlF2Mbz4PgEDr0WxW4Kb2+JJGfN1C/igXj07SJucJsA9q0/@vger.kernel.org, AJvYcCUuiv7I/JtkzXMDjgiu428yThoM6LocpYrky7pwTHVB2iogFtzbjcmJiKiLro6PTEFtdvOGlr7iOTRSbjwe@vger.kernel.org, AJvYcCVb6rWmjE0PnQiPGHoOHlUyhBCDqVZIYHjTK6Q36c6TABESoMcCBI7Yx7DPgdyBENTcW7qQx6tfYAbikhp70bmKWTk=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:4f3:1d:6b47 with SMTP id
 ada2fe7eead31-52b1b8fe837mr7122022137.25.1756979518360; Thu, 04 Sep 2025
 02:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXoaz8ZJS5==-6_5ojFg6igSg+VUaXuDyus=2365g-9dw@mail.gmail.com>
In-Reply-To: <CAMuHMdXoaz8ZJS5==-6_5ojFg6igSg+VUaXuDyus=2365g-9dw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 11:51:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5RZFChUZPkNpiB+55KXX+4KbTUg5=Z543hPiuYsAgZw@mail.gmail.com>
X-Gm-Features: Ac12FXyOlu_dZieWgINxQelvoG77msqMY2GyW7rtdIO6qK6sGu_JVE2fDK5WslY
Message-ID: <CAMuHMdU5RZFChUZPkNpiB+55KXX+4KbTUg5=Z543hPiuYsAgZw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: rzt2h-evk-common: Enable WDT2
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 15:49, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable watchdog (WDT2) on RZ/T2H and RZ/N2H EVKs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.18.

FTR: s/rzt2h-evk-common/rzt2h-n2h-evk-common/g...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

