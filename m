Return-Path: <linux-renesas-soc+bounces-11159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F89EB43B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87C62160FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C4419F43B;
	Tue, 10 Dec 2024 15:03:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E72594;
	Tue, 10 Dec 2024 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842996; cv=none; b=tfF3x+w8bZLO3bO1uWlfl/vzlQREEWocADbs7Ii4gyQd5hLORYTaje0kLKGKvIVWlP13ICMDzXx8vKvaRBZfn/5Oup1CURySn9ynxOHlP/zbgodNNSLFj2TSvND7tXxO6KxFs8Snw1QMJIZse2+zkRyOtsQLu4IJt+06BybxADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842996; c=relaxed/simple;
	bh=1qUAv5xUzSWQVgmia95BYdwuUMFaxJbpfUOGDDpzcqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d29UjfDuScncWtTjXXvDQ10kUvBU6nodqo2Udfs/F80mfZHkfkfhsrATglyjwPVRtzitrQUbGnJemoGUpTJX1XUKxjMp62CFnn1bCE2gI0ikOhSCUAuHG9dm75/dczCeMXZGM9LGUdTUjLIvh1FZ/qdiwSdVwuTnp8tLgR9Vvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4676f1a43dfso12625081cf.1;
        Tue, 10 Dec 2024 07:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842993; x=1734447793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmXqIocA1G1xcFIUFx0xQafi68mSgezdKyyOt2V02OM=;
        b=naXMs3sCDWyh379jYbUIbAcrJFM8Q0KxJct6cpusJW8VXs44aVMsYugh8EfM5MutGJ
         dy0DMG8agWcAf10wN/roz9qdTuX8mBeAhK3GiBaPplRP8biLPgwjSSWDjas9LgzPzf7Z
         HfSGnqoEnvDbuvf03I5XWFUK1hil1zrnFsu6rdDPgDh7/JG91ASAqdoHDRRIvc3/xTCK
         tF4sEytAUVICcwx8f2U1yjisxquIZDnnKCbB7ntZ7vNxFEcUOUL6Yp0XKNe9kYBrHM9o
         AJYXjSVzJSaiQHUxogYuLVgE5VCLqJdybkrWq/4P/nleijm3uEHNGhuCT0dqSNKY2LeC
         ivbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtNh0OknZ9soW7MoR97LF5+yA6vR7DzF3vgtzpnbTVM3cuZX9AIwgm0mrY5W89yhNDqYKPwtsSze+V@vger.kernel.org, AJvYcCX9/YXgme3rA4TXj/P1Budff9/fSIBvfkNGlnG40qCHlvbMM/EUFjoIutTi64EEQPdRd5gUtnZCANh1QEqq@vger.kernel.org, AJvYcCXHKIoqfFJg3s/NA3JQLIsFafHT/U3LirsOMslF/N/JpA5pdqS2yCI3kKRGyx2LZppXSIVBpCNadHLx@vger.kernel.org, AJvYcCXNJChcOCxj3wXFLIBSNspKR6vbzQd/LhAYPCG6J1roAAERkj3Kt2hY/j2GnlKFLBrBQtZI7epEvvnQ2OgIp6QxO4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65itc/UL1bOKCPcfNyEYJVERloXq8Sa++GgMwrrXFJIsewXwq
	Y30G9vTXj3qBTIlyuQH3Rq4U/yTOYK/UNet1XZjXXSxi/L4phXKBaRbuCOzU
X-Gm-Gg: ASbGncun6muq9eD1cOH9RZuVR8C3oqhfeGtqFqvGjLFjo0SRpQR+vN/DHKlr0bxUprC
	+udL1LQdJHrGRFVUeXiQvhJgTTCavCXbGlDQOHvGtOZte9/GQrLqM3yyVLUvgadEpGRREtbnUtF
	lFv34q0Cxea5km3LozKZN6jY/+A6tlXfJM+pikJV3fpZVKv55G5FQEpYZG7Q5wkx/NFeEU9KDaH
	1qMz6JQooWRm41Ume7jfEzBwWkHfiQ5R6cJCXhMx42Fr0d/6DKNhn5lQViF+5mBMOiZottcZ4Wa
	bBEcJBvzwVJzHk6x5cy5
X-Google-Smtp-Source: AGHT+IHTetl2rKi2oI/g2tTcm8EQ209Ws47CSQK3qwBFCvePK1Iz1WdtILLF3SYw8cYxQihQNY+GZw==
X-Received: by 2002:a05:622a:1206:b0:467:64eb:f2f2 with SMTP id d75a77b69052e-46775234f5emr46114361cf.9.1733842992632;
        Tue, 10 Dec 2024 07:03:12 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467562a36a8sm32076431cf.79.2024.12.10.07.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:03:11 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b676152a86so653443085a.1;
        Tue, 10 Dec 2024 07:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6pOes1sdssYIMVNpm/9Cy8FZYwnD5K8Ieg6emapNpPAdNbSzEsqT57X6Y5/29a80u2cS1EKlJZkt4hU9Jb70gEX4=@vger.kernel.org, AJvYcCUXoV9u9HTRO8JQnj+bdbi7AGl5HujJ/OA+v4lOPg4g8TiS6ZK66Th/6POIqC06bt/uaxUz7r1I/6o9Ycgk@vger.kernel.org, AJvYcCV7c5xR2qRQ3nZ/xPOf3bucgEYovuw5aFbkJvZZPaqrLs9C6dMoRk2yZYCN1d2UOnO6roZoBECkhzpt@vger.kernel.org, AJvYcCWjCFvr8BS7MoC+/SH8wtrjnveZ+tey/Kn18VtgfZnR8t01HtkcixuzxTyoeYDMn4uLAro3J/s0g5XF@vger.kernel.org
X-Received: by 2002:a05:620a:4408:b0:7b6:d611:ce6f with SMTP id
 af79cd13be357-7b6de6e6475mr504839085a.8.1733842990849; Tue, 10 Dec 2024
 07:03:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:02:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRtmEhKwXHBb4yAxmSBX6G0hmi=7eZ4koOptHYx4kbng@mail.gmail.com>
Message-ID: <CAMuHMdVRtmEhKwXHBb4yAxmSBX6G0hmi=7eZ4koOptHYx4kbng@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] dt-bindings: phy: renesas,usb2-phy: Add renesas,sysc-signal
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S SoC, the USB PHY receives a signal from the system
> controller that need to be de-asserted/asserted when power is turned
> on/off. This signal, called PWRRDY, is controlled through a specific
> register in the system controller memory space.
>
> Add the renesas,sysc-signal DT property to describe the relation b/w the
> system controller and the USB PHY on the Renesas RZ/G3S. This property
> provides a phandle to the system controller, along with the offset within
> the system controller memory space that manages the signal and a bitmask
> that indicates the specific bits required to control the signal.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

