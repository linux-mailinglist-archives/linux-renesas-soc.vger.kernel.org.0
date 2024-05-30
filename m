Return-Path: <linux-renesas-soc+bounces-5714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877C8D4CF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 15:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E351F22F32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 13:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F7917D37E;
	Thu, 30 May 2024 13:44:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D117C9F7;
	Thu, 30 May 2024 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076654; cv=none; b=j0Hg8iI145m8mDaU4Xo9OrUVgGGYk/r0EPSI+YaNi47r+kY0elsqfdVWz5dpEuGAbd4QIABkXEeByF+6B1HpvZ5aFT7RArLmWIOVUjSQTncNF8J8PAIFwUJiYeRHp6unKWdgCWm6Je7Gn2R8NBqaZNWYBLNecXVnmxn8EydVjYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076654; c=relaxed/simple;
	bh=WAQ94FAkmmst5XBLICAuOBXkPx+QebudViPIoZrjHDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b379SvXzsc/415G59T5g63cdh03TTGUoG6a8xNJjo0f7gwK7ctODPilKGRe/kBDck0zALwUj2xN98BY9URT3SI0YGs65DHa+aKjuWoi0XdQas8JZGY9UjSJQ1X3A9dTCMG7Vv6pFaxCYh7wfXCZPeSDkg7+PjCAL68X6zOJHT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a0873c6e4so8403807b3.3;
        Thu, 30 May 2024 06:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076650; x=1717681450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCmfn7QmN2YKSjQZBi6juMoZ0F7gpnZynmpI9+bTokI=;
        b=CkCDUuJtIg5q3J7j93G1V2yc+kDtytPStm5orfk9PfgyGu5+l338CBtRwjuUEhtd6W
         zV0ztHD0GkZXOIc3D+sWGrr6dix1SLTjzl7jsZD4pcZo0NwSvy6g/58Z21SZ3q4kTs6f
         3wILNIkCDefdzE4uHq+vSublEq53DGCvC6ebtC4NIFmw5nAjlVQQ+Dm1J58TOtH09e2x
         lrFzfg4UbZxIRktQZERESd1vj+LoQR7Yav7bXN9MtrgDR33zufr4ZBCDY5u77crv1YiX
         Bu+X+SfMXMgjjrzlwVmoxL8p1cpE4tXt+OKBMhWNUBtiGwRIgq2OVQJ+tgqW6IA1+E97
         vwTA==
X-Forwarded-Encrypted: i=1; AJvYcCXTIUbsQCLKoGVUWfOkfqR9aVHs62ZnyPmdQRtP5zSMRkHfzghJkfH8lDGGNGGSIwbxlOqrgKdUj4d5Wuf0LIPSPZ0Ef9+s102V0LSNgodTDbbMrh98ODGTrZOz9H3ULaigYz+y7ZGpAQXkn5Ocl8Y2WVoa4bSdzOl6HP1UYShWXAQRmM5Q60HMEKMK42PpwynLGbUEdLzOCf4ZwvGty0Eoilih7ntC
X-Gm-Message-State: AOJu0Yyb7IewndNT5yvppWlt1UOJ+MqeLL81MM0IPiNcBIWAokQdzWEM
	ABbd9yTPP99w3l3JoOZhj5nwz84tUsG/lmeffwv0mWdbeG0evPczDPaI3vy9
X-Google-Smtp-Source: AGHT+IEyNBEzUGHmLljO3yP2xLsPffWKWyvzySlz6S8yeefOCiRCUBNulQlH9Hg2keYjmNnGHIQu1Q==
X-Received: by 2002:a81:4327:0:b0:622:f785:5499 with SMTP id 00721157ae682-62c6bcc59damr25507207b3.37.1717076649734;
        Thu, 30 May 2024 06:44:09 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56a5c3sm27797017b3.137.2024.05.30.06.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:44:09 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfa59545e0fso878973276.0;
        Thu, 30 May 2024 06:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFq2BEtDUup3xKrj2hh7SqXMv05OV/0ioMCy+1Yh/Nopzlo9mJCec1MEUyvu+v+ZGm4ju/IQ3A8zKkD0x58i+Y49h/2FJPBNGA58LvpDkV8jxvhJmAastH32Y+XG3vj4UslaoPLhBICF+4KklYoSjKBeELoGkJx32U9Zr/IHrVk7fLM79a0kxkyXGHzGCn4reRqnZyltnu2+YfM70HD7QODLb1LAS/
X-Received: by 2002:a25:d8d6:0:b0:df7:9bf8:a5c7 with SMTP id
 3f1490d57ef6-dfa5a7ce112mr3001630276.57.1717076648680; Thu, 30 May 2024
 06:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422213006.505576-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW3YQMUOe9pP6TLjWTTkS-UNmzz21eqgW0nMQ4SUkwxGA@mail.gmail.com>
In-Reply-To: <CAMuHMdW3YQMUOe9pP6TLjWTTkS-UNmzz21eqgW0nMQ4SUkwxGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEL2PJZ=wKse2V2KyBW=XEt3FFY19y4UD5k4tQNjOJtg@mail.gmail.com>
Message-ID: <CAMuHMdWEL2PJZ=wKse2V2KyBW=XEt3FFY19y4UD5k4tQNjOJtg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Update compat strings for SD/MMC nodes on RZ/{G2L
 (family), G3S, V2M} SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 8:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, Apr 22, 2024 at 11:30=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > - RZ/G2UL and RZ/Five ("r9a07g043")
> > - RZ/G2L(C) ("r9a07g044")
> > - RZ/V2L ("r9a07g054")
> > - RZ/G3S ("r9a08g045")
> > - RZ/V2M ("r9a09g011")
> >
> > The SD/MMC Interface in the above listed SoCs is not identical to that =
of
> > R-Car Gen3. These SoCs have HS400 disabled and use fixed address mode.
> > Therefore, we need to apply fixed_addr_mode and hs400_disabled quirks.
> > 'renesas,rzg2l-sdhi' is introduced as a generic compatible string for t=
he
> > above SoCs where fixed_addr_mode and hs400_disabled quirks will be appl=
ied.
>
> Thanks for your series!
>
> > Lad Prabhakar (6):
> >   dt-bindings: mmc: renesas,sdhi: Drop 'items' keyword
> >   dt-bindings: mmc: renesas,sdhi: Document RZ/G2L family compatibility
> >   mmc: renesas_sdhi: Add compatible string for RZ/G2L family, RZ/G3S,
> >     and RZ/V2M SoCs
> >   arm64: dts: renesas: r9a09g011: Update fallback string for SDHI nodes
> >   arm64: dts: renesas: rzg2l-family: Update fallback string for SDHI
> >     nodes
> >   arm64: dts: renesas: r9a08g045: Update fallback string for SDHI nodes
>
> The DTS patches have a hard dependency on the driver changes, right?
> So they cannot be applied in parallel.

As this dependency is not i v6.10-rc1, I will queue the DTS patches
in renesas-devel for v6.11.

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

