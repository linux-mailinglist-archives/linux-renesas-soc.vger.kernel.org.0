Return-Path: <linux-renesas-soc+bounces-25753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D0CBD1EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 10:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6D4930161D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 09:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B0E33121A;
	Mon, 15 Dec 2025 09:10:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1584331209
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789814; cv=none; b=dEnnY7I+os+Dyw1FJyHm4aYB+tcIvsSFv174ttjB+bt91Oxb8IacIVTtubqLdxG9XgMNRTMUuqrEipg8mY1PYrpxwDMQqUmuJ0fAuTt3Hr9WY4pHERNWhC97+JxBFo9/+B52PVTzzpzBhqiET7aqSjg0iW4sDMzQE8U2QGuadJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789814; c=relaxed/simple;
	bh=0VuLjbWfKZlswWsTt2YIzqj9wev3+4KYwfJwvvQ8x0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGjJLJMqy3BkdgckkpgHaKYr8lJW+cxsu3f6vFZ9oxaBEZ6alRV0VhCh1EY2mMgKt0LqJDBxfvdcR14Kt6ETzA3Mj35SnsAS40DXWuqVI8hewv2ILhkv7top0IqadTRuoiBEO0vdG88rJblxsqti+wsUmQrUw+C7TC12Tt01e3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5e5478f3dedso2627171137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 01:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789812; x=1766394612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtIRC3MyviLTPqCM69f+zv0VbF3Lmw8K3PhfPWoMgDM=;
        b=oeuuL30NzQeb80IlJrtLCfWLvQdP56WZf2IgsqcWi20ZQiOJYG0fFQJ1kshhSl667S
         +0otwQ67c/YpGHWY75Hb+xvrQEBtBvdGj62L+3GV6LFxIzwUM76z9wjMD9cS/cDZaCL3
         IZFjYd5pT5zLSnAkr1dI2zI3pytA+xF5nBdREZNqDkN9B/yZL0CC+N4+VyjZAGr+002c
         VLWbsfDci0lPfTiILI5B+s5hHGNt8U31kM4fy8Acnl42cgB24fslXi1FQOjJp5CNTRQa
         ZDusxLmM3vPmLE+tuijLEjhuSpY8FBEQIxSEOAi2Ryjxxb/knQxE+aw6UBrLztG9pxPI
         vcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUStX3u8alXpez6TLGnzvyqL5ibs6llTXYkcAnnDXSqpiwduV4wpsyWcwOpz2mbyLdAXpNhLotYPAXrlEmb8kRVQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyopsjtTebcPJtBf7P8cEYdChLD9uXiKD9b6sUi3+N7lyvIPR5x
	Z8jsBorDVaW1I5U2ImGM/jM5Cn8N2QM+dfuX/Ss2cEKwCbBDzVfnLLUkDZqCCVizITM=
X-Gm-Gg: AY/fxX7g0+CazJiuKst/jIQLJiK6pH466eWwa/qzWSv/XGVcKmsl9v8wPNDb1NbAn4i
	67LzC1ttQ5H06b3DDajz9ro6Ao+qRl87KoUAKH2XTjXc+1s0WvvG/E8HWCt3Fk4AdYFO+e5LlZ4
	4zBhdQBjV3JfGYQOdRJYpsh4ggxN7Ss+YYxgUtpS871fW8f+CTiUdxzyfgRpw56K4T9Y1hThV/p
	zOkzGTpSjet+JiT8HwaslvYoBy3DOAFBO8jKaOIn61u0ZOnxQvjXKpH6EuFddzqKOBEjqPt6O8c
	2HZQz6/v1OuB60qcMmvekY/yMJePtTN4h+KO1S02u+BM82w2sLQcL5PgqxCM2caOK1/Kb94OzNE
	Bq26HQl9BJtitUdrQ06T1vSFYLV0CWYy+ZGG8+nacZg7A0bC1cRxweVnmL+LSLMW2uFEhdZf1LZ
	arrMPNT1n26UQDnf2m8kE2vHge+42Fj3BRrYvofnEx/e/P4MCH
X-Google-Smtp-Source: AGHT+IFuNaxjZzBXMJv2pv1RDxC7toMriAz9A0xkfz3GKN5AsC2Dq7QfrFtpPBI0+KhPuH+kzxeGdA==
X-Received: by 2002:a05:6102:548b:b0:5dd:89af:9074 with SMTP id ada2fe7eead31-5e8276a084emr3628221137.12.1765789811772;
        Mon, 15 Dec 2025 01:10:11 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0ecf428sm6123565137.5.2025.12.15.01.10.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 01:10:11 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5e5478f3dedso2627155137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 01:10:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRNHZlw3Bm5Tmgr6NIqqEQD6eno19m9CURbQDpnf+srzE/pIj0i19vrsHGuoM5clTGnnUPASfStWU7dr8w0U14zw==@vger.kernel.org
X-Received: by 2002:a05:6102:6a94:b0:5db:d07c:21a8 with SMTP id
 ada2fe7eead31-5e8277d7832mr3318810137.25.1765789810860; Mon, 15 Dec 2025
 01:10:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-1-robh@kernel.org> <OSZPR01MB81234597C5AA9B5C17264990B7ACA@OSZPR01MB8123.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB81234597C5AA9B5C17264990B7ACA@OSZPR01MB8123.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Dec 2025 10:09:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkCJ6=gchr28XYoKMLZytnGnPUdq7WPRTfMUtfLm4ROg@mail.gmail.com>
X-Gm-Features: AQt7F2ofpDDDvHt9BHbo70vFl9nRHpJuDgAwlYdCKurqGQ2MPZBlr-HIJbB2Psc
Message-ID: <CAMuHMdUkCJ6=gchr28XYoKMLZytnGnPUdq7WPRTfMUtfLm4ROg@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Sun, 14 Dec 2025 at 08:04, Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
> > From: Rob Herring (Arm) <robh@kernel.org>
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> >  delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
>
> The lot of the above are for SoCs that exist and there could well be users using them who haven't upstreamed a dts.
> I'd convert them to overlays but they all make use of /delete-node/ which as far as I understand isn't supported in overlays.

Converting to overlays is not suitable here, as these do represent base
SoC functionality, not an add-on.

Besides, overlays also have the "must have at least one user" rule.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

