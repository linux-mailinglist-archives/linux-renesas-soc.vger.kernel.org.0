Return-Path: <linux-renesas-soc+bounces-9111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D86988238
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE9CC282C1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 10:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC741BC063;
	Fri, 27 Sep 2024 10:08:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AD185B7C;
	Fri, 27 Sep 2024 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431687; cv=none; b=aHARCXSjFKTlv7KYHmhonSwAxS2i/E0QKTeC5PZd/TMXXPSX1lI/BWaagCc5DHkdRmm53wLCR/u6XNEqL8B3kFKb1db+/cQEJ/1M1HUT3yUJH9yVXG0CU2v2SHLlKOL387qlxBL10P2QPB42Nmej28kOsnWWq6QMkOG9dMrabhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431687; c=relaxed/simple;
	bh=S2joWCU6hUCjgmqEoFTt2ye75YB6Gh+l7UXQjvfV4Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgDvUuRM5cKA9Suhe6fGnh5QiSFzCLnCiLjCIXhdAxUlyMRuPGl1MOtxnwucDwF1Y95o2VEoLz/hvau7zWtVWip1bemEe9RbnCH2mnGq+9S4bV8rkY8bt8T45VnnLYJXVmU2DTUoceB2DaQQ+j7Ly/eskJ81kHwkbXiqqfYFC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e25d6342837so1180744276.1;
        Fri, 27 Sep 2024 03:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431684; x=1728036484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9jFqo+XfSXsqB7EAnslsl8zonehgOa3+GNAG8VGEt4=;
        b=HGy+/CzGSOHCEz/aJmI9w36kNfcAgtDTdw/you4lsK9tHyu9lhkkOIqu77OvfPXeWU
         PQoC7teaWsh/d8g2DjEBztz7W9F9RQ+jOqcYnK8ossZJbDLMLeB0dB6CQ09RfKGGynbh
         dRJB5jgkHMXiZSe7ui6Pybk4uea7T1AO5k/hlLEwdlcxgg2JLeyVvPvHBQP68Rfwjgyn
         26ZazSUUOssWe5FfoVqtau62peh0joIWDcgZWv4Urky+AufYtBlH0MmOKdY6eGck63DY
         oACtTzI/Xb1/MK8o4BnbD6K7aT78hRuPGI5hVizoi//EKEbeHswKZgwX6vRZaL5tFKTM
         KwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRwzqWZ5Xlh4Ftpuv82eBzQRBrjd0DMs64a6xfLPkdC2ewfi4gF1OM3PgMj5ZXtiAwc2Z9BlE8H2CmHNyJxvcywRY=@vger.kernel.org, AJvYcCXRpPvjc7h3fQqv096Sy7esovDUA0iD9RG+tTn7QMEf9YazwTtnM0Wq5tpkDU+TMkT0+IkYTMi0FnkE@vger.kernel.org, AJvYcCXaXm9l6bLc36/bIcIbcYQpSExgTzSnDP3wTnYBuuXQhehw7BMrbag0wnEa8qGinlpkAqjB4Oe8kJpc908J@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDlaaFeD0d231gPQEQtdZ/a4Dy4eMzeZlUDkVYExZdwi1FIgc
	B3x9Jivr4UuunAOJXh8NgTZQwYg4Nk+WAG00ir+rPWFurvlGlcgzEwtKPcqx
X-Google-Smtp-Source: AGHT+IEb6jEQVnZMR889ipxa9PqwLjKHys1haNjKcWik2FAtT1yARLt5iCaqj9YXEyrtulqmmZPyXw==
X-Received: by 2002:a05:6902:1027:b0:e20:2ad3:570e with SMTP id 3f1490d57ef6-e2604b7d6d8mr1575496276.40.1727431684479;
        Fri, 27 Sep 2024 03:08:04 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3ef8ef5sm369281276.11.2024.09.27.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:08:04 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c3f1939d12so17087637b3.2;
        Fri, 27 Sep 2024 03:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk0l+ArMQ4MkZi/4/J8mHLxasMOi4OPulRbl0aAWXBk5WDx0YH7s6fmcRO/XHca6Y2GqJXVlbhXsnUvcpc@vger.kernel.org, AJvYcCWIguPQVw6o2p27fxUQkRwKjZ/pRf8ImQTL3PtjYnmLKdqNzbg0aRyQL37xKyphGITq/zWlbVNmMyZHah1VzO8xqww=@vger.kernel.org, AJvYcCWyepAwCH73ZZ/6xmbaxOBcgcVMbHiTdyQTn9CNRSmReyuw0psnUm8eljZgv0WXwf1aWIvA2WH4ymx2@vger.kernel.org
X-Received: by 2002:a05:690c:60c5:b0:6de:1e2:d66a with SMTP id
 00721157ae682-6e2474f4adamr19241267b3.2.1727431683946; Fri, 27 Sep 2024
 03:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev> <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev>
In-Reply-To: <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 12:07:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmf=BYrVWGDp4kjLGK=66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com>
Message-ID: <CAMuHMdUmf=BYrVWGDp4kjLGK=66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>, 
	Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Thu, Sep 26, 2024 at 8:24=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
> On 9/26/24 14:09, Sean Anderson wrote:
> > Linux can configure almost every part of this clock generator without
> > relying on the OTP settings. However, the correct configuration for the
> > SD/OE pin cannot be determined automatically. Therefore, add the
> > appropriate properties to configure this pin.
> >
> > I have CC'd some people who appear to have access to the following
> > boards which use the versaclock5:
> >
> > - Salvator-X
> > - HiHope RZ/G2[MN] Main Board
> > - Beacon Embedded Works RZ/G2N Development Kit
> >
> > as I could not find schematics for these boards. You can help me out by
> > (pick one):
> >
> > - Run the following command and send me the output:
> >
> >     $ grep 10: /sys/kernel/debug/regmap/*-006a/registers

On Salvator-X (5p49v5923) and ULCB (5p49v5925): 82
On Salvator-XS (5p49v6901): 8a

> > - Inspect (or send me) the schematic to determine the state of the SD/O=
E
> >   pin during normal operation.
> >
> > My suspicion is that all of these boards use the same configuration
> > (SD/OE pin tied high) owing to their common design heritage. Thanks in
> > advance.

According to the schematics, the SD/OE pin is indeed strapped high on
all of the Salvator-X(S), ULCB, HiHope, and Renesom base and SoM boards.

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

