Return-Path: <linux-renesas-soc+bounces-26272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3605BCF2A9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 10:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C40FD30010C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 09:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED22274FDF;
	Mon,  5 Jan 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9Noocu4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B21D54FA;
	Mon,  5 Jan 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604563; cv=none; b=Yo5OTqKsBHueMMF2CX3JyWaC/RQ6PTbY9KeWeHUqG/I5rR6diyeGAt5oxVDicuQbEvRYo1DIJ9YxFbyqZHXN8U0X99pMrQHE+NEIKnPTybOcv4gBiulUefGTmt5oj6AY4SpIHrkpc5/CiEucKJaC/NUQCkW00ZLw6ZYSiUZDDYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604563; c=relaxed/simple;
	bh=n3n1ogRRBZiZuZt12caPjzWwwOYVxcP6xD181Du7Bj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bnm6zQBxiNenP7LV1IZEMn57QXdt1j3rasQq2Zp8sF5OykCdWp388mMu2YP6pKDxACN2mZe3LMhXPLmdu6o+Yavs8yeZ/rGlmiOZX3wu83FayB2p0hrF+k0dG6vjtZXKtDoKtfM//tSrH0Uv08qyKJjJIBIq9PMOlP6KPIbiU4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9Noocu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CB0C116D0;
	Mon,  5 Jan 2026 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767604562;
	bh=n3n1ogRRBZiZuZt12caPjzWwwOYVxcP6xD181Du7Bj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9Noocu4rh9AKItfoW1Kfb21KExeTxqgyqk3L0lpRyp0YAf+50sjYoJLE6F5v/fIo
	 LyfUpsvbgsguSZJnwFLrp6B5r9DCFtm78hglxtP5aQM+z1zSBL440P9/4C/UmgR6ac
	 BtNX3amIDl95KRSqTZ5zkXEOFDNpRkXpx9jsOdwv3g38yFH4bpkqGkLpFEWowk0x6S
	 /GA+Ep5N2OnFWfosm+/qeJvsA3md8qquUFHFzoogU5C/NI+HpVpjdnOPuw5hXTQn7e
	 T/fd2dUL850L7srY5dcvDEINxptDOOhKrCqgXrczQ8JmlX+ROOkuTMP4ie7CMfp3Sz
	 EKVVh8lnoB5fA==
Date: Mon, 5 Jan 2026 10:16:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
Message-ID: <20260105-unbiased-bat-of-charisma-4fde3c@quoll>
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
 <dec21ad6-c87f-451b-bdab-9227d457a166@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dec21ad6-c87f-451b-bdab-9227d457a166@mailbox.org>

On Mon, Jan 05, 2026 at 02:30:59AM +0100, Marek Vasut wrote:
> On 1/4/26 11:26 PM, Niklas S=C3=B6derlund wrote:
> > Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> > present in Renesas R-Car R8A77995 D3 SoCs.
> >=20
> > Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> > it is always on. Extend the list of special cases for R8A77995 to
> > capture this.
> >=20
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > ---
> >   .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 86ef68985317..2122380561e4 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -25,6 +25,11 @@ properties:
> >                 - renesas,r8a779a0-gpu
>=20
> > +              - renesas,r8a77995-gpu
>                                   ^
>=20
> Keep the list sorted (995 goes before a0)

This is already correctly sorted.

Best regards,
Krzysztof


