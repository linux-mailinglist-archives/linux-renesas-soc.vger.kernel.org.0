Return-Path: <linux-renesas-soc+bounces-25607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB5CA7D9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 14:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50EF4303E01F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB173043C8;
	Fri,  5 Dec 2025 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE6wwOer"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860C325724
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942816; cv=none; b=f9vzqmcNCQhtTBgDqpd2eW3mYGfVsiI35FgerX+ndq6ayZQZWDXt2HPaK7IxNA9wgjVm8BICZ9svyjhiaFkc/dhzeljQNK3zecihkwZDTfw6R72XWSzJ+/xd0JP9jup9VIHFmJ04ghn/BpNcUTtdZuSNsIJdefleq4ZaPgxSytM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942816; c=relaxed/simple;
	bh=/hC7rd6Y9Vayemn+Pbfyjg5j0j2kUQXBmQlPRF88pv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/xkLhm5VNMP67dfvFHwUhp85h+MdEj7H5Q+3RcRm10wFy2W3IlXChvkLhewStsDS5hIGbRzTAfTK++Am3UPOm+d2PFB4W41t403pD92PIXtS+8uY13MVhN36ddeDXhDQhlpSAO5IptntX2uqEIK6tnbykqwZllT+PfuAGVl2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cE6wwOer; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1585C4CEF1;
	Fri,  5 Dec 2025 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764942816;
	bh=/hC7rd6Y9Vayemn+Pbfyjg5j0j2kUQXBmQlPRF88pv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cE6wwOerfX3UoSj7qH/joVItak7wgZUJHkz4saNXDBRE68r3bpyMVs9MIGAaG5gGK
	 kVSCHiFU5FQp0Hwq++iZuDsjk+oWuCPESMy0RTWg7XlgbnGeUWcXJaGShs3fjOQY8X
	 v34WXO7ugfQxY1V3adH6MYyqnmsy+c3rg+d/Fjyx03qZv952LRGyIZTXlE/ZVhgHXO
	 USllvUH/wYi7aZr+n7cAtLR4HDblMEfc6GcHTMKHylhDS8k8a0XbK/zpPIG+j5GR4s
	 F2keNltKuktIqOn0mzCAE+Ce/ds71Ig1Z+9OZbE//S0+984Y1fNJ51XvNnjfdoDe4I
	 I/SLuRHZHf75g==
Date: Fri, 5 Dec 2025 14:53:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
Message-ID: <20251205-strong-dandelion-newt-a776af@houat>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
 <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="iiu34guk5mzq376l"
Content-Disposition: inline
In-Reply-To: <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>


--iiu34guk5mzq376l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
MIME-Version: 1.0

On Wed, Dec 03, 2025 at 10:54:45AM +0100, Linus Walleij wrote:
> On Wed, Dec 3, 2025 at 4:10=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chip=
s.com> wrote:
>=20
> > It seems that multiple drivers currently depend on the CRTC being
> > enabled and they implement the same atomic_commit_tail().
> >
> > Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
> > Or why not use another common helper function for this?
>=20
> So my v2 version of the patch series added a new special case
> helper tail function to do that:
> https://lore.kernel.org/dri-devel/20251118-mcde-drm-regression-v2-3-4fedf=
10b18f6@linaro.org/
>=20
> It was politely NACKed for complicating the helpers library (short story).

The longer story is that it wasn't NACKed at all, but if we want to do that:

- We need to figure out the bridge ordering mess in the first place

- Improve the commit_tail helpers doc to make it clearer what each are
  doing

- Probably change their name too, since the rpm suffix is a gross
  simplification of what is happening

- Create a few kunit tests to make sure whatever order they guarantee is
  properly implemented

- And maybe create a few helpers and convert drivers to that.

None of that have any place for a regression fix, so it wasn't a
reasonable ask.

Maxime

--iiu34guk5mzq376l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTLj1wAKCRAnX84Zoj2+
dtfvAYCK0e7SvjMsHWvvtqMA8laxNk1TCzat/WvSag5cJ2DIKG3nBapeYk829dYp
QxYNjv4BgNoX6fyZdnio672A2YVqlQlALPbN3Vl1yb6/Z0LaoBMuBgYSg1VnIeut
gSBrugWVcg==
=dmYT
-----END PGP SIGNATURE-----

--iiu34guk5mzq376l--

