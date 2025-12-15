Return-Path: <linux-renesas-soc+bounces-25758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC51CBE070
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 14:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 529FA3020344
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 13:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE4F2F39C1;
	Mon, 15 Dec 2025 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb9tVV5p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDD2DF6F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804795; cv=none; b=gCZ1zDgDmRn0g5lpuQU0Gei1Jm63h708VkjieC0xAoZC/yXIbpCbYn/Yp1t5FHoqfKIAT/5bgk34u0y7MLYyBx0zSB3+3pDVHifVA2Vuh0aKezFdAn5aFKVGNepODu+ZR3rwkTBvZzz3sb5G1Q6mQ0qwcL3QBEG3r/ZH6cWDnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804795; c=relaxed/simple;
	bh=hfkZKQ6kZ2ALUO3EknwHIRe/aZmDZKnZ6J+bcZnhcKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmom+B4iAVw4AZQViTDppCjq9gz1ANFKkcOPZdjrLXfz7J70DkIIyFSTpu9mWz4zxsQGyiwpM81nnLo6G6A/GFSDpXD8gMLkosnQG6xWymkQYwqLax1l/k56hOPYL8pTy15VIDrwDfXQRFinyffsWOGGf6rh9pneIDHaHuf8NaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb9tVV5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3176C2BCB4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765804794;
	bh=hfkZKQ6kZ2ALUO3EknwHIRe/aZmDZKnZ6J+bcZnhcKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hb9tVV5pS2WD0fwqXbl2W6+Ngcy7NOS7lrVcZ2hJH2Udne0Q+Jeh7cFCKdBqvdHVZ
	 b+DSXt7kJuQzgi3T2sD3CrV6x5uRxJg4loWnb76m5WqfC+C47xCivGbSrW8bvqAW7R
	 KsuEoefteQmZ9xPPuiBy70+Ay9VuUk3cvreKJ/+mAk2Ws7Ija8KOmW35uhYq+jWQ7/
	 /Ab4b96d1RCH6PTLPoIrlQn/2yeOuaRYORTYPA7s2p0p1ilbcEGAinH8hV08h2Imc8
	 RR9P0w1ajpw6xUivrS5lvV8MDe9Y0YiMSPalphPMr+iFZJuNFfOeINETLa5hH7u+wf
	 veKXXf+BbG2MQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cee045187so679334866b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 05:19:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUou0nGhnsAABrm/lu57aBonHkk6/F6XCUYRPHCWIdGBVAtDEkWoKV944VrqFKn7dsr4aEYA3cMs50OSLOWCYhWIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzROdoBQyNsX+nXGyUSxNEMdUfGOnjHyibw8MkU6ZVUmwpPQefd
	7OcqnfGezWdTxIm9wMgPorAA90SEjTIpaSPY2bcwcgR52JuzBjlnL5ADdty8WckSFjamr4UWuN+
	178slaqieZekER2n+F+nc0ylZouS26A==
X-Google-Smtp-Source: AGHT+IEaZQIxv7Nl2cgSuGF+MuRz1tulODHXJWPXvk9aG3zDlBRYLjWOqhmBRmgFkMwWOyy+FjF6ofGRGpyNQ/ZT4I0=
X-Received: by 2002:a17:907:3da1:b0:b6d:5dbb:a1e1 with SMTP id
 a640c23a62f3a-b7d2166d01bmr1197208266b.5.1765804792671; Mon, 15 Dec 2025
 05:19:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-1-robh@kernel.org> <20251213062037.GA30577@pendragon.ideasonboard.com>
 <CAMuHMdU3xB4sU2tb9B9Pt+D2E_ZNEyRd0e=vQr8fBgOaa7AuNQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU3xB4sU2tb9B9Pt+D2E_ZNEyRd0e=vQr8fBgOaa7AuNQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Dec 2025 07:19:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJk1PfEuH6VeMkoZdU7v5AsfdhWczLj0uVx=5qWt_OJWw@mail.gmail.com>
X-Gm-Features: AQt7F2qwO9NiBuvX_Una9RRaSneSTL_STJujyvrpd_lUymxYdlVXx_-EtD3jA-s
Message-ID: <CAL_JsqJk1PfEuH6VeMkoZdU7v5AsfdhWczLj0uVx=5qWt_OJWw@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 3:02=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Sat, 13 Dec 2025 at 07:20, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Dec 12, 2025 at 02:32:07PM -0600, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Thanks for your patch!
>
> > >  arch/arm64/boot/dts/renesas/r8a779m0.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r8a779m2.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r8a779m4.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r8a779m6.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r8a779m7.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r8a779m8.dtsi     |  17 -
> > >  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     |  12 -
> > >  arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  25 --
> > >  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  18 -
> > >  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  18 -
> > >  arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 -
> >
> > I'll let Geert comment on this :-)
>
> While I do understand your point, these might be used by customers of
> the SoCs.  Hence they can be considered part of the "stable DT ABI",
> and removing them can cause issues downstream.

DTBs are the ABI, not .dtsi. The compatible in these is not validated
and isn't valid. We could simply restructure .dtsi files in a way that
breaks downstream and wouldn't give it a second thought.

> At least for the r8a779m* parts, I do have local patches in my tree,
> so I would notice any future build breakages (most files are rather
> simple, so unlikely to break, though).
> Shall we just upstream .dts files using these .dtsi files (cfr. the
> existing arch/arm64/boot/dts/renesas/r8a779m*dts)? AFAIK none of
> the missing board/SoC-combos actually exist as products, but someone
> might create one locally by replacing the SoC on an existing board,
> as they are pin-compatible variants.

You probably could restructure these where you include the subset
.dtsi and then add nodes rather than delete them. For the ones that
just override the compatible with an invalid value that has to be
overridden by the board dts anyways, there's little value to them.
Just drop them or add a proper board.

> There is a similar story for the r9a0* parts: they are variants with
> less CPU cores, which may end up in actual products.  We could add
> .dts files using them, to make sure no build breakage is introduced.

If these are all just binned parts, I would not have separate SoC
compatibles for them.

Rob

