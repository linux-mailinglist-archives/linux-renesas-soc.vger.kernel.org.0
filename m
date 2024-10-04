Return-Path: <linux-renesas-soc+bounces-9418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FB990439
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7968028286D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88688215F51;
	Fri,  4 Oct 2024 13:23:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3B210192;
	Fri,  4 Oct 2024 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048200; cv=none; b=UOmmAH2ZO6HKNM1EWgUT9FARFk85UiVNgLpLFnKmN6QQS3+3YDbV4dNioMRfbIPSr/dxSJrIByEv+OFKY/zrzvPZsX8OEdqJ/zR34StovldeHCZIWCVMkRq77dUsz1Edq4FsXnG+PIdEOlsfoBNmPJTvTPGAWv2zH1uDjYYlaPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048200; c=relaxed/simple;
	bh=VlMMcMWBY+CFC9p1czL4QY7YB8tCBylgl8nevSuEBdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paZaouMfr5fcgRdT8TE0zoJaA59NrI0mhUgKn7/p9kdu92vUNTdEFR/Mvq4QngRAdgTm9GsRg2gMXoc6iS5zeJhQqXP/U5psBojKF9G4b7VH5+NmoalrBWFWwDnF7AsO2n/Q4Bihdw0+giGE+lbGGq253WI57U7OrM/aDVOdtkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2772f7df9so17625407b3.2;
        Fri, 04 Oct 2024 06:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728048197; x=1728652997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibDVe5YLvXt6rhsGA+Avq1cvNfhpTx9TUAZXq8QnDj8=;
        b=cxfDGcDnC9J2A12NR0vrR8B/9u+/V6RXmGurBzxFuLH2cOyHRrPmCSqkIrXPp0gD/B
         XVzdB+en2PMw4xAxYI3qlKiSzhaiH58W2uNxcDsCVeFbllhuFJxnrgql/TNSaE/XdsMO
         XZTou/1+3f0UZe38h+dyjxGI88J2Sbp7o5nIIMTAsw9a4O0j7lVwZNEjQ8mnZ40funUQ
         bkKWRX/YVRGKvKrdxtcjKNFkNz0AyKQidDwyEFQTRdFVoW2g6yvGrqnPtlB4XHtasi3l
         6ddHBLfFmBDeZdpCecgSE3dsy98jSd5agk0A71RF/fQ0zNJUu21dUD7fyMkGhn/tQZnr
         7CGw==
X-Forwarded-Encrypted: i=1; AJvYcCUM3c5BO3dXL2GVbw2214RzgXLKBtLBWn4S9mhXm1M2UYdPyaUx/nxZwrNq0YcU8fFMvyaDnLLqExZU@vger.kernel.org
X-Gm-Message-State: AOJu0YywbF3EUcclSRcKnW0swzpZ0nWeJOSxn5/nL3QD7CSy7iBBYXjQ
	++D2ky4+29q0BK2lxhWPTdgFFBRnaIPjYW/rLEadFvBew6F2ylUpFJmDsSb1
X-Google-Smtp-Source: AGHT+IEVzNyP13tuo5xsrZlBmqQgBKXItbD/+xyacY0beR4Sc5036mX5k1Y6Xq7y1rhF1n85KdDFjg==
X-Received: by 2002:a05:690c:3186:b0:6e2:ab93:8c68 with SMTP id 00721157ae682-6e2c7238ef0mr19327457b3.25.1728048197328;
        Fri, 04 Oct 2024 06:23:17 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2c7c67186sm3285137b3.108.2024.10.04.06.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:23:17 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e262c652f99so1787210276.0;
        Fri, 04 Oct 2024 06:23:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM96c6jqSC+UVyS7Fh9cm6ppJHzDJl9rcwlYEGN8nn/QApdUNRrjyqLy02slX7HRgKMEFlFo7aJR28@vger.kernel.org
X-Received: by 2002:a05:690c:7209:b0:6e2:83d:dfc9 with SMTP id
 00721157ae682-6e2c72b2ccfmr24871017b3.41.1728048196920; Fri, 04 Oct 2024
 06:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com> <20240926102005.15475-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926102005.15475-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:23:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjt6raMKqZEms0ZkZcS7O0mgThNVoQnGOrK7_gRoOJkw@mail.gmail.com>
Message-ID: <CAMuHMdXjt6raMKqZEms0ZkZcS7O0mgThNVoQnGOrK7_gRoOJkw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: genmai: enable SDHI0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 26, 2024 at 12:20=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For this to work, User LEDs must be disabled because they share their
> pins with SD data lines.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> @@ -76,7 +76,8 @@ key-1 {
>         };
>
>         leds {
> -               status =3D "okay";
> +               /* Needs SDHI0 to be disabled */
> +               status =3D "disabled";
>                 compatible =3D "gpio-leds";

Pity...

>
>                 led1 {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

