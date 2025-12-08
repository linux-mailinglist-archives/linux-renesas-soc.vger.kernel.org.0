Return-Path: <linux-renesas-soc+bounces-25650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A45CACEBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 11:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F81430001B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA3C2D5926;
	Mon,  8 Dec 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz9+bBmm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B225A34F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191233; cv=none; b=rYWltXESIE1FlhHbmjrkhDzVNcaHusjqAX4jvO6nxPkikSMfhf7rtr1TLmggHV44ylGt5hVBjWJX1N/0M7bvf2e0KWJNrqsp7/+nXIwmaUe+0TeGea1TYXAnwN8TxnEyX0yq+k8GV8l2Ms9wVv88WoxtXuJiV5cAie3yqafNVHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191233; c=relaxed/simple;
	bh=itfWHF3hQ3r6lG6FL0DO3ku0sYKhYu4kPhpKMcbklTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyxmvLko/t0DBnGp4pSprR6kDRt/jt1Fmq6ur4UzEQOy01s9o9OkSzg4ttlqhlfSU6JJVlChn6IgH1kJpoSR+npckXAzEFChpp2FKoQvzKh+mgK+5Yze/D96TMiPSMfNNgq/eaDG3Zfrpfhl6c2POjuNd28QsWMDn6H4lXdQ+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz9+bBmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC10C16AAE;
	Mon,  8 Dec 2025 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765191231;
	bh=itfWHF3hQ3r6lG6FL0DO3ku0sYKhYu4kPhpKMcbklTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz9+bBmmcn7i4CITSs/ntOeAk/ZrBaqZZfSxZFM9QW/BWW+eugb814i8jVHpfiiFn
	 RMb5vE/HVvN/VgtAf+bH1dI2XyEn+PWf7SzJnHx7ZRoID884w53QlA/mkkFh9ugijd
	 6aY5BckQ0WEbZC08NVsjVDuwlIjHWPWJDrAkMDHjQjOhWL7pLHVypvZIgJgd9QMjHK
	 OQ6VQTv9Brw3vvPDJg/ZFm/MWKuSluSshnfrH0IDLl0OdUEsZxgoMv+OPqYFTt5nV4
	 0GDr1Ba9xBP3iziypINQwRpiYW+TFXWaBoo3AK7+QbIZt6x4+AyoB7qGrVuCQSRUSW
	 TZ7zMdV40qDJw==
Date: Mon, 8 Dec 2025 11:53:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, 
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
Message-ID: <20251208-sceptical-wolverine-of-grandeur-7bcf8f@houat>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
 <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
 <20251205-strong-dandelion-newt-a776af@houat>
 <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="daozjir5beio7yqw"
Content-Disposition: inline
In-Reply-To: <CAD++jLkjMRQ3piayZYdKEMDmiwzARfxY36b3=PVUepw0PqUyTA@mail.gmail.com>


--daozjir5beio7yqw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
MIME-Version: 1.0

On Fri, Dec 05, 2025 at 03:11:06PM +0100, Linus Walleij wrote:
> On Fri, Dec 5, 2025 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
>=20
> > - We need to figure out the bridge ordering mess in the first place
>=20
> I was thinking about what we can do here, adding various flags was
> discussed and deemed too kludgy.
>=20
> What exists in the kernel are things such as the MMC power sequencer
> which can be found in
>=20
> drivers/mmc/core/pwrseq_simple.c
> drivers/mmc/core/pwrseq_emmc.c
> drivers/mmc/core/pwrseq_sd8787.c
>=20
> with some DT bindings in
>=20
> Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.yaml
> Documentation/devicetree/bindings/mmc/mmc-pwrseq-emmc.yaml
> Documentation/devicetree/bindings/mmc/mmc-pwrseq-sd8787.yaml
>=20
> So here the approach is that the specific sequencing requirements
> are added to the hardware description (the device tree) but there the
> resources are really flat, then the driver for each type of sequence
> takes care of the semantics, i.e. the actual sequencing and ordering.
>=20
> Maybe we want to look into something like this?

It's much more complicated than that, and it has nothing to do in the
device tree. The DSI bus has different power states, and DSI devices
have various requirements depending on the power state (in particular,
when you can send commands to the device).

Thus, there needs to be some synchronization between the DSI controller
driver and the DSI device driver to allow the device driver to perform
something in an expected power state.

It's been shoehorned into the bridge API (with pre_enable vs enable) and
hacked a bit with pre_enable_prev_first, but it really should be fixed
once and for all.

Maxime

--daozjir5beio7yqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTauPAAKCRAnX84Zoj2+
dmz4AX0XKtwdSoAwh+t9DigQkc8ZQajElAV7XieU8wYCMFVs7Nygtevvo1OepRbr
VPRpdpgBf2QMwTql5B2ViLTRcDHt6iuCvGF/dDLwIg8XQgJIp8/iN9Gs7rUR/qWG
dDba8i3DWg==
=xrEh
-----END PGP SIGNATURE-----

--daozjir5beio7yqw--

