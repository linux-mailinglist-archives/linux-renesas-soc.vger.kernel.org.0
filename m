Return-Path: <linux-renesas-soc+bounces-9532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8527D99358A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C20C1F238FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5585D1DDA3D;
	Mon,  7 Oct 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpu6PTVa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C01DDA31;
	Mon,  7 Oct 2024 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323983; cv=none; b=TTAA6FO0eE6H7VVNSgh2SSWgSuaxwuIvUgqmtG8QVftBA1wkdHCF46V81Mqr2sJ8UeYEyiR6294cvzXoCPYDZnesgvJgGq6jxKEjRa/dR7cQGSVXBGyhlboUMGWiOPv6gVVBQfYBpOldlJIAcfzE/6JMvr+5KEvPmkIaslU3iXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323983; c=relaxed/simple;
	bh=KLT1H+Fx1aMg2zNRAYF5tmhgbEdWQeOLlQNCyFwNhoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWJ542S1PWPJ20J3BIRpyBJaXbQWk54PS/owrYCBmPX0JOrj337KzcrM3Ikx9Tb4mKA9Il7r2uIETF1zGHpos0yM6EnaC3GgnWfQhgZ0dVPfAYQhvtxRizCIWfAanVgLcLoiMxcrnXuBWu8gETjyuxT9LPguFWXZb9weJvNBAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpu6PTVa; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50ca646f545so525180e0c.3;
        Mon, 07 Oct 2024 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728323981; x=1728928781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7HRmRPm75tniqQvFQN+BpLwRF1tpZhZcDbz5mu4hsc=;
        b=lpu6PTVa02nALPnMlumI1vrnLDkf/qxORBv/asN00FYsaZvXlPrJA+UhGJCMmRQvFc
         /Z7RlMcdwxulL8wfJad1sqpsArK+HeYPTkGB22jiisoQfv2YFhH6ZbV4Jqs8PGvjZYYD
         rDwOGI+kjzKBJJMDNVjC29mj2rv7Bsv1qxTQqjmYx+4RNln855tUQYD21NdYr2hLFR0F
         nsqgCCOj1hioY4DGWezAy6azcPy+jbC5QiPC3LX4beoTcYAOjZhvX7fxuL+GPdb8/B57
         KBJ5Nw69uDTSCFHliwNdgjZSzqwKx0oEs/dCt2HVVkfRsGTSctR5kkZ89zj2CEqAvz2C
         3xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728323981; x=1728928781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7HRmRPm75tniqQvFQN+BpLwRF1tpZhZcDbz5mu4hsc=;
        b=akjmT6piv4WeFgMK8uDdr5FHVeK8OKy4WVSuH4li5TapLhJlWce9cu8wRTb3fepU+u
         SZibxYaYjjS3WsY/zMElQ/zkgYXvineuaJOSId3fLEv6rhj1ze4glshf1NId+7f+bDRh
         N5fxzkhuffzOy6CohA1jRqk6uCMtSnsTwr4WXKqPjr5E1liq8c7/yGTCO8hPKEn8vgTL
         CauX/+Y5YPsITphILLvB8drm9lyNPBNf1+Kom4byDvr5oTlBSzg5aYsNJjlnjGB7UvQQ
         mfQWpr7viyHdeD00I2vJzjgLoWE4EBvAHRg/PH7JjcoLKUFaDfyMTmNiEOcPaNotgIWn
         X+qg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqupyhnnLZgZutK9xzv1SLTceqFF7jZ1kAtdRyTMrN6EFUtVQyoCOf4FOL1n4IMdwBA1aFnsPoQUYlr4e/j0DYEo=@vger.kernel.org, AJvYcCURNUoCshvbUnQrlTwp3L8Blv6RPRWGMcYPaMbjZcRfUdEWxNWj/1NvVQ7yNRFhwjPOnn5LgwO+IPgO@vger.kernel.org
X-Gm-Message-State: AOJu0YwJN1Nvn3CRZyPrdZ3/sX3qVBjjwhHK52VFI72y1fG3desjW6TW
	UCJOfv89slUZHvdGseBMdpkunV7L1NmTaaaV/59NxKjI0XHg+Q93tkGvW2kuZsKvw6qVd22qAGe
	lH/jDK135Zjv7XBL0VnFzwMkHknc=
X-Google-Smtp-Source: AGHT+IG7FeaOHjlMq/OhqC7UeojX5/lHqZmcx9zfRuBDgqv9IXWc6Xric8WedtN1Phafp/RYvoI3JWJPE9KZQmOktzg=
X-Received: by 2002:a05:6122:a1c:b0:50a:c52d:6baa with SMTP id
 71dfb90a1353d-50c852f36d7mr9464614e0c.0.1728323980585; Mon, 07 Oct 2024
 10:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <835b5e851939f6fa2c9567d6850a7e0c2574c1c7.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <835b5e851939f6fa2c9567d6850a7e0c2574c1c7.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:59:14 +0100
Message-ID: <CA+V-a8uMpdT1isuZ1KAX7WEzW4XpQ9mZGkt1H=GcJnUgsTtXvQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] ARM: dts: renesas: iwg22d-sodimm: Use
 interrupts-extended for port expander
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/a=
rm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> index 24411044ef6c4f0b..3ac2526a24a1e130 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
> @@ -185,8 +185,7 @@ sgtl5000: codec@a {
>         port-expander@44 {
>                 compatible =3D "st,stmpe811";
>                 reg =3D <0x44>;
> -               interrupt-parent =3D <&gpio4>;
> -               interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;
>
>                 /* 3.25 MHz ADC clock speed */
>                 st,adc-freq =3D <1>;
> --
> 2.34.1
>
>

