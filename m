Return-Path: <linux-renesas-soc+bounces-11830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B40DFA00E11
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 19:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A2616331B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 18:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532221FBCB7;
	Fri,  3 Jan 2025 18:51:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C31FAC49;
	Fri,  3 Jan 2025 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930270; cv=none; b=m4OndKrnitr8K9lWJ43j+6Rj+t9lO/uKLAyWbp0Etv8tTTvrk0c6ZPaRCgsT1p+5UC0WkfJ2noXYLLEbuCKNDoX/e/rp8GomZSyozSZuTHIR4KYEcZpmM1n7i1bjNWqZHJ1INwugBE735ey+km7w16ic090VaFuDhct0MgJ7z14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930270; c=relaxed/simple;
	bh=lsLX4qYeKAb24631zopSYoJ6Q0SrcybHLMWdD7B3sRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWyv4nAqtYKEgSzJ2NDz6fPK4JzZl8YgSICcpYBjdX0kytQ7p3pxGJYL/wEm4BS6Qhuo/P5lPkZC95BUkBk/rj5ZEeQ2foFJO+ER0qUSkSiacs/DRlpdVPA/d7cA28jdEMRD1Fpe43XGD66igvRnaGZ0spsHExZqxwzh+BhpVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afdd15db60so3439989137.1;
        Fri, 03 Jan 2025 10:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735930267; x=1736535067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90iBzM9CiUnTjBwr5JRnTyjNCTsf/E8rczgaLe1DLyQ=;
        b=POt3j02U++iNa/Ejbmd+xSsNXcUDeqlTG3sby+kk4feK4taPYHAV4H27c1kL7kfqa/
         ruyNQNtueF5glPItfH2mvwY7xevVVTjIuPQEz5twCXegT7cssjsrcYv8sS0OkrH7FMSO
         Ad40fuY6KojxDO8iX7lsW90nXS+Da4Jgvvu29rDV2alTo+XLNGYpec/hDOEHcuaot8WN
         sqMAOp279trZZMRjnJrqeOJODfkupNtCPNA2Xvij7XpE/fI7XIJ0QV1vGpflM4HJKxy2
         3IlYtoz9KMzBmZulvhxNeixlGCsrF7h3ESTtjs+uOIEgFs0EjSn7sukPjGQ2sCUdQ5DW
         a/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV/eWM4TUN+Tf3fp9/nRxm2A0+NhSRxI8JUmhYbYQ/QZPv1wYCvdP9Si76v5gHkDgFxXUyrP5UCI6/1@vger.kernel.org, AJvYcCV6Jeigl/++5H3829q5Owqsg7SCaW2vtZSll+p+MDTpIbkdFGYwfX5ScZudSscPF5fV4edTDa7ZK5Rx65/QXcsYxns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzds18/gDM5Z/sdPMoHbpPMeo4aT0dYllMvsyk9ckXORcu3/Bx3
	YrSIU55Q80CiU2bRW+wp8VoSqsdyn/h9mu94XNqsETpifayC4Je9+/rJZqgdR/w=
X-Gm-Gg: ASbGncvZZGLoZ3az+yDz1E000rEO3m/66Px9ET5e1OHPGC/A4ypkGoOKpaCRw4TvEI7
	267mqbugMaltYIwiTIfy4cY6mIerB3znGEUzzTwlEA1wiBjJDG1lvWJuQRzRCiKnipFFFNdDlqi
	rCPS6JfU6cK/JDVTx+rq+IHwsnAX/JBo0sJBm/gmgZeRgU7SOpFP8Z8PCh29bTWNz29iI7FkmYy
	8jQjNVVibSaDWeFAzX9ozoehBp22W3LeNCyR/0NeBLRKwecq7AbHW7BJVIL5wo/X5kM4fJooxSd
	JMGGzo0X//BxsX3iBKk=
X-Google-Smtp-Source: AGHT+IG5wEo4MODLig4y/l/8P3OvbnPaEC718E0zOqIsFh1PTB7ijfsIWVEGrNZeCZaNDmbW16vmGQ==
X-Received: by 2002:a05:6102:50a7:b0:4b0:4d6:bff1 with SMTP id ada2fe7eead31-4b2cc387a3cmr38210217137.14.1735930267362;
        Fri, 03 Jan 2025 10:51:07 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3e808sm5645606241.24.2025.01.03.10.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:51:07 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so1900519241.2;
        Fri, 03 Jan 2025 10:51:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGAcIE/KG6oUMj0/0EjiND5nU/I7EoXMNBBOQHSUS4crZ3/j9oyPTdNX48iACzCjtwTKahgHJiif0QhSho3UWZpgk=@vger.kernel.org, AJvYcCX1JFGSARHJbfE5tuF28EheQE0U+N1zm0x4lQHkcwvZh+r913Y8irCHAYtAt1nr9AH7ICrmy7Weazxk@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:4b2:9e8b:54c with SMTP id
 ada2fe7eead31-4b2cc488c39mr36901780137.24.1735930267007; Fri, 03 Jan 2025
 10:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:50:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcPpgUd9+zDR8U+EdxMue9KBtgzharErn6sMuoDzh5-g@mail.gmail.com>
X-Gm-Features: AbW1kvaPcxGFOcG43Ucl4mzkXSNU0BUW1DVIrTqazk-ZFVg4xEvm9LStdSwzV9Q
Message-ID: <CAMuHMdUcPpgUd9+zDR8U+EdxMue9KBtgzharErn6sMuoDzh5-g@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a09g047: Add pincontrol node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add pincontrol node to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * No Change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

