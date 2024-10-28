Return-Path: <linux-renesas-soc+bounces-10176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128189B2C89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 11:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BA6EB24019
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 10:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D8F1D365B;
	Mon, 28 Oct 2024 10:14:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C717C228;
	Mon, 28 Oct 2024 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110454; cv=none; b=rG7/QCXpKG2jq6zQRhRlFiu/GC3k8GgVRcYuVZ4tAuwSFcmAW9lb75tPzeW7sBh00FX6iFUqM8Xkt8SxJNOzPepp63Pk3OW/qmDs9FdTJKl9BZ83gSZUO9tgIy6kOeVo/OX/mqG1adTHP03BF27qpoOKBwhdumONuiL4f15f5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110454; c=relaxed/simple;
	bh=88Ec241n+L9Smv42jzOgrXuaM8DlAkJ1QBbKqGzpaIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYFVE/OIbx2J+u3sXq3yWQ+EkoR7CsRQAnKjzDEswi2qFssAo7Zp0CcGtP1kcI4WC5QTtU8hlSPHm2rY6N6ZOx9zb4lGC/rflFGe46kvYvs/JLJHII5885VSZFZDQ9WOieBqCp9u7RLqGwRsCKBZX0azdqecBqN4QDoJJQ62byc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e59a9496f9so43576237b3.0;
        Mon, 28 Oct 2024 03:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110450; x=1730715250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eV9vOAyreIHhOU/6r4fcoru4VyFAxcI+tjp3Z8Sjng=;
        b=hcUo0eH251w1cVDXAKJ+xLDWfBwheO8FOB8ggQBc9PUK1iXVfxXd9xP32b3E/mqVvx
         YbOLqk8KW1xD4GKsEpRmsPdaqUyDTAsOh+p6MVBplTVOgtGYF+sMKR8CAjY5yFz/uYFS
         PyYaofwV7CLVXSxAC47ZJRQTdqKASaa9Dfc0OV7S+DCrrpfTDZMh+Vp4+dYf4uGl6ebg
         riW+VngfcH3VfDL87gbZYOqsshrTseFCkaROzFYBXqTzlZy+bXBnvuSuhmQx+IvYpuBp
         DVw5Y5ZWzW0KrPeKkpUMwrM2tnf5hZ7yqe65rjg0asq3ekqFs+f+eA8BFe+eosh/q3gh
         XIIg==
X-Forwarded-Encrypted: i=1; AJvYcCWL7IVOfxcdpRomqp20ojH9NAm1VCTyxUex3GRXeumFcrDfjuNPAhgrcl45y/WYsLCbnhHKNhOtvTPyeljGK40sPus=@vger.kernel.org, AJvYcCXD+0+C56QHvcqULKhk1G8BS7xoZsjPIP7woVdR4MjTmpF4XwfERogFHF3ptgiCYevdbYCtRbduhm/w@vger.kernel.org
X-Gm-Message-State: AOJu0Yyufe6lYfykTC1u9yGQEf8NH+xuED5Xo5cG9+FcYlReUfYwQhjA
	En+so6ei+z4WAeW0MVSpLKROCPJ/bL0th5FK57KwTNt9rSrxqEZptQ+xA4cO
X-Google-Smtp-Source: AGHT+IFqjqVCjYtkQaTDCn49C81ORMF42HHAXASPER3cNeSZh1zLN9ubk0wpD+VISbh+2t6+zClg3Q==
X-Received: by 2002:a05:690c:94:b0:6e2:f61e:c53 with SMTP id 00721157ae682-6e9d8ab3cd6mr54993837b3.29.1730110449711;
        Mon, 28 Oct 2024 03:14:09 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c769fcsm13450877b3.78.2024.10.28.03.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:14:08 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso4116333276.2;
        Mon, 28 Oct 2024 03:14:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU3cjimdYXL5UBg1gW56W7s6lh3z3aOM7z31H1hxCJNIoT7kXLy0UoeZIrG7z9ol+7TGROsCaQmKPY@vger.kernel.org, AJvYcCUwrziozT4CdPyM1Qr9std5YHV5Ifx3tqkXsFheFxNrbpQsJPFcbC8agqUOANF9bJUIohnWKmA22tD1wx35zEkEPiE=@vger.kernel.org
X-Received: by 2002:a05:690c:2502:b0:6e5:a8ce:dd0a with SMTP id
 00721157ae682-6e9d8ab9a94mr69559197b3.35.1730110448580; Mon, 28 Oct 2024
 03:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUZAVAkPVus2T_O3sWT7f1PciRYjxm6ecLy0QUyh50OEw@mail.gmail.com>
 <d1b36858-da21-4e2a-bc54-175524a7d3b4@denx.de> <CAMuHMdXRhUr1My-w0+hoAhQKgOq9iwecjow4iZTh82ED5DEfdA@mail.gmail.com>
 <50b37c36-643c-4307-9d4e-ad49b306ba8a@denx.de> <20241015144810.GD2838422@ragnatech.se>
 <825e3b22-340c-4618-8d80-5d1b004fc0e4@denx.de> <CAMuHMdV9XoJHHUM42YFwackdM+oRgP4k-SwZOTwqg0RJGETViw@mail.gmail.com>
 <d6b35a1b-3f42-4071-99c1-dc87999c5cce@denx.de> <CAMuHMdXW332YZahLw=vzfB6fZwc_9jL8uY-Uxj=Qyfov5vYQFw@mail.gmail.com>
 <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de>
In-Reply-To: <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Oct 2024 11:13:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
Message-ID: <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sun, Oct 27, 2024 at 5:09=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> On 10/22/24 9:38 AM, Geert Uytterhoeven wrote:
> >>>> I was hoping Geert would comment on this first, but seems like maybe=
 no.
> >>>> I think, since the PHY node does have a compatible string AND the re=
set
> >>>> is connected to the PHY, I would keep the reset property in the PHY
> >>>> node. Sorry.
> >>>
> >>> You are inverting the reasoning ;-) The compatible strings were added
> >>> because otherwise the PHY core can not identify the PHY when the
> >>> reset is asserted (e.g. after kexec).
> >>
> >> ... or because the PHY requires some complex sequence to bring it up, =
it
> >> is not just reset.
> >
> > That is your hypothetical case, but not the reason behind commit
> > 722d55f3a9bd810f ("arm64: dts: renesas: Add compatible properties to
> > KSZ9031 Ethernet PHYs").
>
> We can stick to the "reset line in unknown state" here for the sake of
> this argument, it makes no difference.
>
> >>> If possible, I'd rather remove
> >>> the compatible strings again, as different PHYs may be mounted on
> >>> different PHY revisions, causing a headache for DTB management.
> >>
> >> Will that ever be the case with this hardware ?
> >
> > Dunno. It did happen with the Beacon boards.
>
> Let's cross that bridge when we come to it ?
>
> >>> So, what would you suggest when the PHY nodes would not have compatib=
le
> >>> strings?
> >> I would suggest keep the PHY compatible strings, because that is the
> >> most accurate method to describe the hardware and fulfill the PHY brin=
g
> >> up requirements. If the PHY changes on this hardware in some future
> >
> > That issue is moot for KSZ9031.
>
> If the PHY won't change, then we can keep the compatible strings ?

Sorry for being unclear. I should have written "the PHY bring-up
requirements are moot for KSZ9031".

> >> revision, we can revisit this discussion ? Maybe bootloader-applied DT=
Os
> >> could work then ?
> >
> > So, what would you suggest when the PHY nodes would not have compatible
> > strings?
> I hope I already answered that question before.

Sorry, I may have missed that?

I really prefer not having the PHY compatible strings, as DT should
describe only what cannot be auto-detected.

Thanks!

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

