Return-Path: <linux-renesas-soc+bounces-26425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A671D03083
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A7ED3018373
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D20441052;
	Thu,  8 Jan 2026 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdR70xF1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4E4534A2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878777; cv=none; b=WQ7RCPc2v0s9Xmu9ijc6szfJETL1nO0lYhsgp+ITm47AxYNn1FMv1NQi4GfzuxI9JWW/j2IT/HrYbNvaLuKTniu/ufpmcXjSpZw4wOgTHFMo8wMW+LKPPp1CJKmoabIT9VTDVU05WXXUDKxEmg9e1q2EOMWg0EUIOGqk/89t6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878777; c=relaxed/simple;
	bh=AhWB8FeIcZOb6oxQqNzP/hgfhN7GxABAnKUpTT6vcWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s99rPPdEEXXX2krd6qqN2T2g0hCxEh2O/0mYiDSf8p+wd8Mf1I5timdhqg6JxpvIjuNQZOF6PSAKQfhuFa2Dois8QPTFIO3zNqpFDvwVp2gKrUixyte6xnvxhD1rPJBBu1FwSMSzrMzLQ+7ao3+09/eTEKmjvnwVEcKh7ey9bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdR70xF1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so27313995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767878769; x=1768483569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcQu9MgsYqPcPRxHwtVvdPBUpRPuS0gMQ6xD2N4xZDw=;
        b=mdR70xF1Hw8lJZwl/8H6pFoZlb8M7Rj5Vf/XK4ytHVTBrueCETUTJHkW5Ru3djtwa8
         QYQIaVcxr4vNAoAJvCms0sOf4HkjHG/AwqolvP7ed8hW84KlwoIudPHb069UDkuBKX4F
         43PhpeI2NGGCWY/qpEbIik0zgQVw941dsWPN13yVOKPgSOpyryIZkSheU9N/3xLciUoj
         X0RJ7On6QY2VxiLnmxm3Kj5K/CZ8jvyqw4b9CQ5u5sfi+RturwL9pkCvmD4BMNcvXFYD
         7+ncezeOw3n4eSNF9aNusrgh7RWlcOiwc62i/W1ucvybL4NjR5ywIQNbIpx0yU9sEQYo
         fxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878769; x=1768483569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcQu9MgsYqPcPRxHwtVvdPBUpRPuS0gMQ6xD2N4xZDw=;
        b=EirVyvuojZXQw/hL0jw9LGPhWOv/0uytLJL7wpGHyadOuBT9j+8X4Sgzs0+3B5x3ct
         pT19hULv79Ky9UnsXwKNbH0vVvHOD+40bfTcDy/9gmJPBy7BnueQqLWHK1RZlp1BGvrq
         CMg8BDjvdz5tskmmwKELV6b90TaN0KQ2qE9Vl+cEMJHz/koyrri7I5lp2Ba0xcvXdUWe
         PtlQMea0Gg/KCQdv/DQECl9+YRmRhbwdwnhTZQ1cYUKM5c/7gXgxHYTCucvxvosqR6La
         +zrGzNwMtvCTi6bl1W9+6BEr1hAIQJHbV1f6DvB1SARw4GGcNCM0NMvBy8af2ITsL13F
         ozMg==
X-Forwarded-Encrypted: i=1; AJvYcCU11abTfxuuJm+lR8Dw99eFWHmAUziqPQUlvfCj3IP4lv44V7hxjOd3C9rCJjDSHR6yI05dwnwuHv/1lnAWQ3j32Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZPfGnuVycsP9lsiRu+reBsoqjUW4Gumz5/WHDtcU2hdubkBF
	JyJ2Yrfoon2Ydwk165Uk0y753wc7VNNnfzAZDT+6YEHtCGwlClLw606q0Z0ctR9WJMUR8lK8h1x
	FxA5snRcFyuD9CGv3/IEgy2lfWAHCaNc=
X-Gm-Gg: AY/fxX5+Xv4EsuxgNok35saotGGP8caKq/NRaWbpCd2ANrPOArZmSNpWDPLrCK2Ra4n
	nw01zlI0KGjWqbKB1E5RQ3t8g5AKBUMpEMHDqVK2TA64j9s3/pLLx9n3eG2bT/bdAGG/qAk6nT3
	l6LoZIFHh4iwXFkImTo2RkO5WhQwbCdvRWdZIhEGB4dTMGzYljzpekiQh67FpW24s46Jj2gwvcY
	hkaH6ukHsN7k51AgGvJqWprfqOAIHZ02jV0E5Nm+h0vU2Rx2+i0E8hcZ5emtVxw1nSyf1zt3yLW
	7nip566TxcK3kqUj7Xu4XxJcPSwltujXfCP7QQKT+UShJHDdlz8X9Ce6hy8M8vQZuzCEuvH2C2S
	9dKmJHNG8ZDMmZQKoD9fY2WuT
X-Google-Smtp-Source: AGHT+IF7Lo5XViCZxQx+HFdJfTIACGfh2fExkV5wgmD+uVl0l+uu/OYSxOaXLyzeOhYCc0lfHxycdUiMVb8IEbrLjzA=
X-Received: by 2002:a05:600c:1d0e:b0:475:dd9a:f791 with SMTP id
 5b1f17b1804b1-47d84b3bc9emr60164745e9.28.1767878769158; Thu, 08 Jan 2026
 05:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251215163230.227849-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVeB0xYbnHx-RYf3F4aw4TQOzC39A_MWc8PoROo8-p1mA@mail.gmail.com>
In-Reply-To: <CAMuHMdVeB0xYbnHx-RYf3F4aw4TQOzC39A_MWc8PoROo8-p1mA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Jan 2026 13:25:42 +0000
X-Gm-Features: AQt7F2qJu7YlTe_s7httbFzp-RrC1xn212O6qdhDNe3hJAJbcx71VTTHqtZOEcA
Message-ID: <CA+V-a8vqVm9-kO_hMhN5WcsEXamUU8=hafGFzmsbKXFwv0UL_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add DMA support for
 RSPI channels
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jan 8, 2026 at 1:18=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Dec 2025 at 17:34, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable DMA support for RSPI channels.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > @@ -679,6 +679,8 @@ rspi0: spi@12800000 {
> >                         clock-names =3D "pclk", "pclk_sfr", "tclk";
> >                         resets =3D <&cpg 0x7b>, <&cpg 0x7c>;
> >                         reset-names =3D "presetn", "tresetn";
> > +                       dmas =3D <&dmac0 0x448c>, <&dmac0 0x448d>;
> > +                       dma-names =3D "rx", "tx";
>
> RZ/V2N does not seem to have restrictions about which DMA controllers
> can be used by which SPI instance.  Hence shouldn't these point to
> all five DMA controllers?
>
>     dmas =3D <&dmac0 0x448c>, <&dmac0 0x448d>,
>            <&dmac1 0x448c>, <&dmac1 0x448d>,
>            <&dmac2 0x448c>, <&dmac2 0x448d>,
>            <&dmac3 0x448c>, <&dmac3 0x448d>,
>            <&dmac4 0x448c>, <&dmac4 0x448d>;
>     dma-names =3D "rx", "tx", "rx", "tx", "rx", "tx",
>                 "rx", "tx", "rx", "tx";
>
So the driver would choose the DMA channel based on the available one?
For example if all the 16 channels are consumed for dmac0 the driver
would switch to the next available one dmacX? and this would be the
job of a consumer driver? Or do we want to let the board user
choose/override in board DTS based on the available DMAC channels?

> Note that this requires updating the DT bindings, as they currently
> restrict dma to two entries.
>
Agreed.

Cheers,
Prabhakar

> >                         power-domains =3D <&cpg>;
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <0>;
>
> The actual DMA specifier values are OK, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

