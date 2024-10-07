Return-Path: <linux-renesas-soc+bounces-9533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A1993594
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FFCB22235
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEBB1DDA3B;
	Mon,  7 Oct 2024 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/mOLw2o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847C1DD553;
	Mon,  7 Oct 2024 18:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324028; cv=none; b=cLdwBO6/ighbym5v15t8ez6PHMy+8v6WISZl2ED1rK5W3nYG/S3bbLpKd5/fXboh1P1fZx092kZqOPbduzhkq1jFGXFqdDKtPf6PjFz+Dj+a3ebb33zQI7pxodGnlUiFgXdwgEiLMdTPFRTodfQDgfww8sJg7pNknKMofH48Td8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324028; c=relaxed/simple;
	bh=tk3cv7L5K/ON9brdKy7lqOIeuTyI3lNSjGat8pDkP0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoVhuOTZpoPq88X+LakmncJ0M0iqFTDhzlH91Su4PY6u4ijwDuMV0EgTg29FNx8ccxvDIRoSnm1C0ZymrOH5YtobA1lnaVErOqqKYywf7Cq4nlvN8BkSTgegmkLMzBtzEHJZt2UhuWYp1hyIqwL/TZ+jTGNZXOUNzYRfvvz52xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/mOLw2o; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50ca3428289so550383e0c.1;
        Mon, 07 Oct 2024 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728324025; x=1728928825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgpyFQj5epG1SnnpGjVVC4xApBoXrJqYW/Sm10i9KSM=;
        b=P/mOLw2oT2gYtpI0m/jWdacZDtPk9BC9MW/EYQW7j8C9HeZmBoavdPqySnyV3sYXHH
         jGlCU3RpKV4H6ZranUeti/y+glnw6ts28pVzY/75cVpr3oYhSGzhHpIecQtO85wmIHj3
         89wvUxRx59Nww1hF2v0coJwoaJcvzDwcqpfUX3LkkGZ2riEqsQfarRj15+qUxhlbTAO6
         QRs+Y0euIvRaqoloNaOhUJkrcYXlFd0tOpU/QpX49PGQV405bKeoFctfVa9e7C9zT7Pk
         wTxIvGN4ZM3uwLSPuohKh31iwRRZjKgJN4m7Lj4hsvfu608+KUuuSpG9kw1VBDO2khpi
         Gt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324025; x=1728928825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgpyFQj5epG1SnnpGjVVC4xApBoXrJqYW/Sm10i9KSM=;
        b=nOv24M13WuHhYEsl775jK+y4BOK7wH9JokIoajdVdSLxqslHORN1kfFew4P//ej54u
         y1158B2jvSv7IetbKyf0fNhWCmSGEgzEj9J7XABkLyHIIfpZzf0zoAzsSPbCqbnG/FLA
         1l44eekYOTAW5vjGJejGN6AoDSEjzfrRf0DdqQnXoN3ai4iPKoSPyHB8QhOiGI4S3TBr
         EEGB1KMEhODiVPrhR0KKmuNxlRuc0OQo3S5AMK4OUiKGENIwm3rZezbx6BdlbSa+pv+j
         XIzto5reXkOTNj9STqVDIclbiHUmR8nAtnsAQk5nMjZTeC+Gyvi6BxoBDqIoNN0O9x2K
         fazA==
X-Forwarded-Encrypted: i=1; AJvYcCWvKCCEMbu4zlhiLyVLm5NK4EvBU7LwxEq77M4j+wUjHk82aOhaDPE4Ywi1OOI6y/LmSf7bxxzxdVG9T39d4Yo3Svo=@vger.kernel.org, AJvYcCXGm3FHSlmq9Y+N0/lTGFc+jyc2gcPvoKPgje93yupvigL7JqxZ4bfSC/3QcHE5QmBUA3BIrwCsI5Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDcqfOTkI0hi+fah1wtaqv+Otq0xNF9IKrLFBNt/PfR/pR+mdh
	CJ4EJZe0TYAznCXqEMu0PYBUe4psnT9bGrOCelz7H2qSQZa+xphGzRavdgD0zGOEPL7eIvsb+up
	5NbWepQHA2DrVSf3YQBeOQH7k4N0=
X-Google-Smtp-Source: AGHT+IFESr331fWQeGM2KodMeqHL6zszJdNPTbVqNViJSmbFxONQAbTH6mz7Yz3BwXYmj+RK/AzFzZ3CvxcjFPdp1Uk=
X-Received: by 2002:a05:6122:c9d:b0:4f6:b094:80aa with SMTP id
 71dfb90a1353d-50c855522d2mr7511530e0c.9.1728324025505; Mon, 07 Oct 2024
 11:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <f3838c730a8af5a904939929e30a4d892fef8b39.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <f3838c730a8af5a904939929e30a4d892fef8b39.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:59:59 +0100
Message-ID: <CA+V-a8sg93Odu_Ppf=+X8T0z4EyhGNO1fh0npNF0YhuFd87vhQ@mail.gmail.com>
Subject: Re: [PATCH 08/20] ARM: dts: renesas: r8a7742-iwg21m: Use
 interrupts-extended for RTC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi b/arch/arm/boo=
t/dts/renesas/r8a7742-iwg21m.dtsi
> index b281a4d164b0aae8..661cc5357b572165 100644
> --- a/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi
> @@ -55,8 +55,7 @@ &i2c0 {
>         rtc@68 {
>                 compatible =3D "ti,bq32000";
>                 reg =3D <0x68>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio1 1 IRQ_TYPE_EDGE_FALLING>;
>         };
>  };
>
> --
> 2.34.1
>
>

