Return-Path: <linux-renesas-soc+bounces-20624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20EB2A748
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB3476808C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A281322556;
	Mon, 18 Aug 2025 13:36:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1F32254B;
	Mon, 18 Aug 2025 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524206; cv=none; b=ZFqA5pyDJDGpzwaOVQ88v0rmd4rK3da68usrED10iPyFfXic5IIRiBLDxYTUyrkVDDSHXVL2xAgkB136hIJjyKxKe4cGyKVyUOe9XzFjAhSceASBNt/FHFIYeH1xmXweP5LDuccJGKxxJ6S9qHura+z1xuOMqD5Wrooyu4eftRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524206; c=relaxed/simple;
	bh=iitE9cxFCL8viQi7dflW1wS75cnB5f4/LhQEifgQ09A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h21SHtsR4p9swH3lnyGkSaP4ytZkYrQQWHKYUcmnxI8Q5uGVlZIzZfERAhmxRzaqmm02zij7CIPxs3xV/+DQnyp5kcn2LlFxJ+8h4cy2EXMtsv4LueEXKk1Ht/f5b9g4vKahl5h6/n+/xncO/S4T+TsH/pHbMeFtFxDw3peUo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-50f7e78cc12so3006033137.0;
        Mon, 18 Aug 2025 06:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524203; x=1756129003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60NgU9++L5F+WLq5tudRSAfbM8F/hMncPRsDdxmuZVI=;
        b=u5R7LjclMfdBOTGvJy1YE2O/Pw0RohTc8A5UDHzgi/qfyEcriPZOrhrCserNYNlnsE
         tmndEzcuRjUHRtIgD6jJL94TkSKIh+A/ydJrgZi0o+GocoDmkHn3SqS/2UOh8IuqvLLk
         H5aW4mVuUkov9VrQr3km83IaWYSjQg5rWKKtUQTipRu4+7wKT3icKpsCFvgiDZPPALGc
         gOLsGp6O0RMOipGckI3uGFsJNMxB0vMuPm0YGi8JyImplCvEzE4oVCLYcbdfiYjQe1GT
         IM245YfRlPaa2nvWk2MsRyzsePgE9dPTaeBEPhMlOoItW6TrxoS1igMQdfZt0KICo5vY
         oFRA==
X-Forwarded-Encrypted: i=1; AJvYcCVCiON+A2EAY/IFK44f1nlf7gRf38rmYQG5YIuj01zsO8ayS18TGkQ6N7LuhanGzd5R00liVHM7xo4EDEd3z8Vn7wk=@vger.kernel.org, AJvYcCWDtAuMgaLvgRYOPSF6hv1VWJTtMvrgfnpV9Gk35T3xvWus+92QciGsEZ2BQvpUqspkO56VhQg57dZZ@vger.kernel.org, AJvYcCWKBzYH6pnCLfixu6dJmPlATz8ykf9asvlwe2xrDfw31FtIaPrfwK81pfLmO/iMjNFMYWwfQhtey9vhkpJc@vger.kernel.org
X-Gm-Message-State: AOJu0YxCeMY0CjBR9FSE9uiaY+eptUQbT5SEAUaXORVwgHmwcu10nNwZ
	zprf+AKmZkc2FVJRtUpSYwx5Yzf8/QInxD1I+e8RrbkExbe1ls3Ja1cbYQBFyVOu
X-Gm-Gg: ASbGncvV6+Q2LeoorvgXMVdTn53iYGorYIB6jWBubHfYj5/R9cU/q/zuIvBXl9fWuL9
	oMWJS4k6s81Xskt8C8kuL4SirExI5U7pHK0NE/ulKouV3BpjVIxkaaEes8qGso8ZrCIVhxkVfKU
	LnHs4fYFK4yIxT9yESPbu5qTr4aihkUXBQ/6S3UayVUvPr9OGJZ9k6RJ79lHHvCTv5Sm34DEsUd
	r5VO4944vqJQRAdsHlSZIbgSJV62U5t+QMAXsIlhH9JPfNbp8lAfvdZnoDZNItnW3nTz8trmvto
	9ANyGJuiZ6uiAO6//74wqW1CrD9J9OaxUmnJfz27mDWwkZWeOog0n0B4CkZBQkH2X6ASENChhWi
	xCt9TeEWfNU2LUXLiGKhlaEwM5zNahtUoe0fqE/IcpxFyICCsKS4QvT6UIrR32XXcYyGxum8LTQ
	Y=
X-Google-Smtp-Source: AGHT+IFtMT2AY3M/63OpMNL9PzM8fkvj55ts/68oQraQermyGGYVSfXkLpULEanlSuHziNEriSDPaQ==
X-Received: by 2002:a05:6102:d8c:b0:4e7:866c:5cd9 with SMTP id ada2fe7eead31-5125169aa80mr4993574137.11.1755524203051;
        Mon, 18 Aug 2025 06:36:43 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127fb10254sm2125552137.18.2025.08.18.06.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:36:42 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53b1740154dso2978559e0c.1;
        Mon, 18 Aug 2025 06:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnOw3l6Ec+Jyl3rgxJociaF2XMv4lnFQRZE+2tKsHdWK9dxlGEPDThm4pqlh0lfbfw+EmwPM2AvG7+MQKL5MiN1RU=@vger.kernel.org, AJvYcCW+ooQ41k6YJpgK4WTWHQKf+6GnnDTJBJelTL+ORb898WOOfz0zbDAGIR1MzTWEeOGi3GGj2W4ot/lRpeN2@vger.kernel.org, AJvYcCWyvbtJMBQlnHB9D71melEAsIn4/pTg/jhxALKytCLFfTs5kJ6qp5evBnfdr6R4l9uRT/26GSQXxdAx@vger.kernel.org
X-Received: by 2002:a05:6122:e6b:b0:53a:dcb4:79be with SMTP id
 71dfb90a1353d-53b19d86818mr4604029e0c.4.1755524202625; Mon, 18 Aug 2025
 06:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:36:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWdihAk0rH1sBZ+Qy_ELTXaxmgR8SNYk3qn69RX84a3jw@mail.gmail.com>
X-Gm-Features: Ac12FXzRQ9sok4MaAZ3ctbZ_-pnyiU9yBxn6s4WJCBnmSdgnvZf9q7POnyEnjtc
Message-ID: <CAMuHMdWdihAk0rH1sBZ+Qy_ELTXaxmgR8SNYk3qn69RX84a3jw@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl
 for SCI0 node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Aug 2025 at 15:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pinctrl for SCI0 node.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -5,6 +5,8 @@
> >   * Copyright (C) 2025 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
>
> This relies on RZT2H_PORT_PINMUX() == RZN2H_PORT_PINMUX.
> So perhaps it is best to get rid of the latter, and always use the former?
>
> > +
> >  / {
> >         aliases {
> >                 serial0 = &sci0;
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.18.

Oops, this has a hard dependency on "[PATCH 04/13]", so I postpone
queuing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

