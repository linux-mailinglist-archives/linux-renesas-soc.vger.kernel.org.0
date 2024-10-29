Return-Path: <linux-renesas-soc+bounces-10192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C49B442F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 09:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B69BAB2107F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 08:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB61202F85;
	Tue, 29 Oct 2024 08:26:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF6202F73;
	Tue, 29 Oct 2024 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190394; cv=none; b=mFLkBNEP6hnNd72ihzGIoBFj6aynSYh+1zdAIOZOtowfoFA0QYwP3zuLUnw581ZZW2Smiwg/7KwSatal9QFVYT1k4vySFdX2YxOog3k1z9ugsqqIE3cKz6eaL2qjaHLRAC2wudzT5d0FKg3lZA7Q/I6ha1h3DSRr/fDXfCcg/rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190394; c=relaxed/simple;
	bh=RnC4qfgRFE/VGLW4zf6D5NU7aKDjGz1UsagAG8PysoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrZeHX8L5i2/ouWMww6rdA56m6KRbp5Ykx0vB5Yd04yZ6NbJorZwiFN5cfxb1UKR1P+gUqFASNoT3Rs2RQ3/s6LWjiJYidDeJ20OoCWea/OkwyOvgc9qLgnUlf9hR328xo/TBRhQpGWcc8BPxUTm6JAJH914GPlg/QlzjpscuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea0b25695dso14396987b3.2;
        Tue, 29 Oct 2024 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190391; x=1730795191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcn+xCFrCB1z2Eqed9r9UGtyl6NqPSUyL74P3CcxFOI=;
        b=a4loAd8kYXHVb8pewHNkwtfqVAZ/emQ8dHJ+Ge+XMUYS6pazjgEzy43Y9Jq42pcvRS
         gV1Ucj+bafLbKUp0I7ye8QcXcdTReuoIJrD4v76WtdCDWf7Lg3MGQjUmbpoDLFPpZFzv
         mjX/eGRw8/bCZgJdUSaw+yyg96ZHBe5WqNvVRuLS9TEavsgZHr0N6x5v9//H/r9nFsic
         SCVMOxGwkC0j/XheLpvDGtAyiqt2Q/0xD3v2JsnjyyTvs31Y9xmcnf/CLqVEa7sTuJgX
         a+cGtkFN9ePw/PaS0JggTBQihzX2kkfv4WTb2io8Bd6u3aIeO3TW7snsgyYgWEgYNGOY
         aCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++B5SYoqUBJWYGbMzO5hxcFp+9o2i/LLB+oPjJIabC2jef9H51rh2t/qKkF6pOWqHl6ihn+w6/Pu7Ae3OJtS16Rc=@vger.kernel.org, AJvYcCU3SgQ2AR/yPw1FkbxHhN8/PS3S9eX9aAQLi4uLJiNTqPNeKlIVAiOYbddDw0J/biq1mnOOICeuzGG7@vger.kernel.org
X-Gm-Message-State: AOJu0YzO4ilAvBpbTLSo3EGXacO+WqOVt9hpdSz38RDM6maNWlcLiHJn
	cDhB3iiZBjOoFK+1CUdI+Ki3hhNkwLz5xxtnL0N7Do7c1BXTd7whPPryghpl
X-Google-Smtp-Source: AGHT+IF6RjD78W5A2jVyi4z9PpUu+bQMfvBwcKvtxr0spcKPjOepXQt17y1cNHOhZZHQ6XuZP0ZmVw==
X-Received: by 2002:a05:690c:60c2:b0:6de:1e2:d66a with SMTP id 00721157ae682-6e9d88ee00emr116022087b3.2.1730190390723;
        Tue, 29 Oct 2024 01:26:30 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bde218sm18560777b3.53.2024.10.29.01.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 01:26:30 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea0b25695dso14396857b3.2;
        Tue, 29 Oct 2024 01:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS3yPdOAHgs2ZCoJJbSyV6Zlo4SiE8228KbkhG1hPERINwh5sW+vl+MRwTpDA0IlQEjcRNL8bz/uKl@vger.kernel.org, AJvYcCXGl4vH9xbEcdorgsgqHhdsNyvYOdCTeym6zR2Q/0YHtGO0tub+QGz1H0Ebtrp1slYdgdaHE/x1AfyGgyIoq2zeOLo=@vger.kernel.org
X-Received: by 2002:a05:690c:6c0e:b0:6e7:fb87:7097 with SMTP id
 00721157ae682-6e9d88ee7afmr118796467b3.8.1730190390244; Tue, 29 Oct 2024
 01:26:30 -0700 (PDT)
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
 <2f9df6fa-2474-4f35-af29-a1c280d5fe6f@denx.de> <CAMuHMdUH32upHwwY7dXqk085LDWzkOz9cBv83FezVUbi27Ygpw@mail.gmail.com>
 <4d7d6a7d-cbe8-4cbf-9fb1-2cdec0f11ce2@denx.de>
In-Reply-To: <4d7d6a7d-cbe8-4cbf-9fb1-2cdec0f11ce2@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Oct 2024 09:26:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnJPMLx=39=f+7S4vdRAC-0q0hKS6Ww=ELYEaLBx+gZw@mail.gmail.com>
Message-ID: <CAMuHMdVnJPMLx=39=f+7S4vdRAC-0q0hKS6Ww=ELYEaLBx+gZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio
 to mdio node
To: Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 7:58=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> On 10/28/24 11:13 AM, Geert Uytterhoeven wrote:
> >>>>> So, what would you suggest when the PHY nodes would not have compat=
ible
> >>>>> strings?
> >>>> I would suggest keep the PHY compatible strings, because that is the
> >>>> most accurate method to describe the hardware and fulfill the PHY br=
ing
> >>>> up requirements. If the PHY changes on this hardware in some future
> >>>
> >>> That issue is moot for KSZ9031.
> >>
> >> If the PHY won't change, then we can keep the compatible strings ?
> >
> > Sorry for being unclear. I should have written "the PHY bring-up
> > requirements are moot for KSZ9031".
>
> Perhaps, (*) but odd erratas do show up every once in a while, so unless
> you can surely say no such errata will show up for the KSZ9031, can you
> really dismiss the bring up requirements ?
>
> >>>> revision, we can revisit this discussion ? Maybe bootloader-applied =
DTOs
> >>>> could work then ?
> >>>
> >>> So, what would you suggest when the PHY nodes would not have compatib=
le
> >>> strings?
> >> I hope I already answered that question before.
> >
> > Sorry, I may have missed that?
> >
> > I really prefer not having the PHY compatible strings, as DT should
> > describe only what cannot be auto-detected.
> See paragraph above (*). My take on this is the exact opposite, better
> describe the PHY in DT fully, including compatible strings, so that if
> the PHY driver needs to do some sort of bring up tweak/fix/errata
> workaround/... , it can do so by matching on the compatible string
> without trying to bring the PHY up in some generic and potentially
> problematic way.
>
> The MDIO bus is not discoverable the same way as PCIe or USB is, so I
> don't think the "DT should describe only what cannot be detected" is
> really applicable to MDIO bus the same way it applies to PCIe or USB.

So you think this is similar to SPI NOR, where most FLASHes can be
discovered with the JEDEC READ ID opcode?  See commit 4b0cb4e7ab2f777c
("dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles"),
which clarified why no new compatible values are accepted.

Any guidance/opinion from the DT people?
Thanks!

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

