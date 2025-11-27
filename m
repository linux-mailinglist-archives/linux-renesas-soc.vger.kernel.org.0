Return-Path: <linux-renesas-soc+bounces-25298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E6C8F906
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FEFA3AA128
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD623385B9;
	Thu, 27 Nov 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKSlavmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970F29D266
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262597; cv=none; b=WVny4JGs+JO2lOml57EuvTPDurmx93sAkZFhVQCStqT0PJDvOy07rZbrojWCslaLzWI7vswJLYMWsB0J6bbmZILvJJd8b3f6b8Ox1mZ6y5dIW1OGsbURRkmf3Oj3wiyAXwCCq9XONVNFp9uk1m08hPGljpCtfue8YCilcK00rOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262597; c=relaxed/simple;
	bh=ricWPg4gmeAyQEJhGAmrMHf+Obk3NEgAmtsiibEZdxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWwqtlR0TOdVqwfdZP+Rv0HZgrpKTnglSwVER1+xvIa6lV/FlxmfGEtehKcUJmlq9n9zwcGdcyoTs6YsZRcvFU7sMdQc+yF9ulKG6niGYdz+Sz6/3PBoWcx0zrrQEs5jMArJHe8P/NF5Uu6my2afGRSQeMCDXQFOHILLvJiThDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKSlavmD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42bb288c219so979673f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262594; x=1764867394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wm/zpoAY+MsmKqP3Nimu7rqWi/CqY3cMytkC6Zo7zAk=;
        b=fKSlavmDKMkI892SpkUu6L3QwnJkh2wJqR2WTYOOOJDFhvO5FdUJOx9GztKtOdGn9D
         X6VdFuPy+UJtFvm6hBMJSWhy6BA7IkDUN4LfmQ5qlrPGUah1fhx2vixSj7O7TgF8YL0v
         4DAuZvxqIdmdVkii4e8PyxdROeRNd3Q9zzWpaYxqWGf+DZzXWYyA3Iehv2qiPqy0RF/K
         G/sh08EMkv3x7K0CYvWRl9BH6hxOsOZIKTpcjRwFolIxxoA2bPivl2H/97s0ycHHNoOb
         ZG3Qhz+KJXw4nDKnjhjuDbJMyzqpziovarfLy90ofrmbAz9htQumnQIBSgOiWtSkSkMA
         F3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262594; x=1764867394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wm/zpoAY+MsmKqP3Nimu7rqWi/CqY3cMytkC6Zo7zAk=;
        b=k2CAA2ibxhv92Y/LCcGQwU6H88EXcC2bnFmMl5mCfv176covfQA9d7HXSVO54JpACx
         WWYRrHr7EMb0Rht7z1Nf2mFrl7Lzv4nEiACU4tPQvU2cqw1bf1ciV2+mJmPSgRRfgyls
         U2LHlXaqG8BLYQtL9tGRaU+7fKV4o+qR/sC6jO8iQt5GzaXoBZiUbDgyoXYqMY81xLF1
         HF1Jt4mWHq8BS8tclztYulMy/10E6eHVhNWpH4Ta13gUt2GaBw3Pd1KQBHHCETcoRSho
         V+UvdMo45Wce6gCX4frrk1UoCp3BRYe87Ug6ZBTXwur2n5KKYaMA0Z+aEJDPDKt4dqly
         r5sA==
X-Forwarded-Encrypted: i=1; AJvYcCWHpDxEiSWEpGt/jufsjpA0TTlIMISnZBRKkE7keMtj3Jos5ZrGuihuXVYULdsU3mLFAFm5uhqUvTVCUlnwjBw5eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnSONtDAecaGH9oeuRTUPAgPyjH6BhgTm+QHuHJ1EJluMn7Kr
	uWEoqZzu36O0ry0VwHtH5fW5e/4gI10B12EqqcOpZLT/53uwku9wtqwKXF0uY45dKIAKnD82VMZ
	WYko+B0HLQLH0dmAxW0G9NpvY8OFsHrI=
X-Gm-Gg: ASbGncuz/UPuBC9I+ZwU6jddyvnV2zpb8D0w6IxWYiQdBDuo62o4k77zJrCd/4O5qIL
	NHlGJ98o3FUu6ehVtXD2KCb8hEbZUQOlshLLbDtHbKSGvSX37DKy2sV3d1ip6MGl2G2i3AQfOsc
	mwGQ9VswPmjo6z3Af5BHstgWtlfY94KzICcemlTj0QuqN3GYBSMQI2tIwaV4EytDT1NYwu9R1td
	5YHVlwb8ettlyyeLboo+c8SDmpaNUO9qLz4t43eGUQvjFlKMxb5TLQdozLE4ueXWh1tkcssABgy
	ceKaOo9ZHgNbs0Nvl9+epNcLbEhB
X-Google-Smtp-Source: AGHT+IGdeALr6TB0fYT8DuNo9pkuE5wjONj86pojWXoWljhmvfRwjTFULB1cRs7veVvk9jlx7J4cZn7KQGv39roOODo=
X-Received: by 2002:a05:6000:4014:b0:42b:3825:2ab4 with SMTP id
 ffacd0b85a97d-42cc1d22c7dmr24182457f8f.52.1764262594299; Thu, 27 Nov 2025
 08:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251125224533.294235-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVtrAYrkBWOB5ztNu0E6zLA15NP65L35GZm2+NrRJBfkA@mail.gmail.com>
In-Reply-To: <CAMuHMdVtrAYrkBWOB5ztNu0E6zLA15NP65L35GZm2+NrRJBfkA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Nov 2025 16:56:07 +0000
X-Gm-Features: AWmQ_bkoKJj3E0I8dQYUE3yYBPDZUx871oSHK5tE-PxXfg0uf0DGZswZl_jwUio
Message-ID: <CA+V-a8vKfe8TyarwME3f3-XThTGJiPSOL-qE6YXNDU1Werhbww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add ICU node
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

On Thu, Nov 27, 2025 at 4:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 25 Nov 2025 at 23:45, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add node for the Interrupt Control Unit IP found on the Renesas
> > RZ/V2N SoC, and modify the pinctrl node as its interrupt parent
> > is the ICU node.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > @@ -183,12 +183,104 @@ soc: soc {
> >                 #size-cells =3D <2>;
> >                 ranges;
> >
> > +               icu: interrupt-controller@10400000 {
> > +                       compatible =3D "renesas,r9a09g056-icu", "renesa=
s,r9a09g057-icu";
>
> I will drop the fallback compatible while applying.
>
Thank you for taking care of it.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.20.
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
>

