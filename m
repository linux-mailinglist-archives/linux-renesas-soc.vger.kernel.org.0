Return-Path: <linux-renesas-soc+bounces-9804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 033559A11C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 20:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F921C217AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 18:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339A42144DC;
	Wed, 16 Oct 2024 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPpfLtNg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094262139A1;
	Wed, 16 Oct 2024 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103844; cv=none; b=X/V+5rISkRfbijUx/eaR/97+ACuXsj/I+UwerhgpmWETvHuYwXCSOrGzxUXWbDDjFeoVISXDkTXsyXOiJicncvSzSHeob3mAzhAK/0iS8hnh3QkQaTKUTskeyIF0ZuVCMt03OYzSB5QJSmR1uf1H3sUozlL4T3WvHpI4clAuDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103844; c=relaxed/simple;
	bh=dVD/78WBe1bYdeVZ5uGtzNpfOZo8qj/W0AE0OeUqkoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+fv+hjANAZrlElW2tiAr7osmVMfY3kU95fZ5CE+lnvsWff3P5UxoBhjk9tLEqDixfBw/X62Pyv0Atzzs0smOhFz76fKaCe649dXeS8dyxwMS94fzfYM1+fijux6QxxjZVZj5RfxQAnH7Bwih2T6vpxaWgHr+NkXF1GgFRym9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPpfLtNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B8C4CEC5;
	Wed, 16 Oct 2024 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729103843;
	bh=dVD/78WBe1bYdeVZ5uGtzNpfOZo8qj/W0AE0OeUqkoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPpfLtNgtjyxWDWq1zMCRwy55+nkRnY8F6ndRUH0LQjNnoY0BjtUnLxUU15NktmN+
	 6gWH1VcL7J2M4CG+VAGJYJ/dJUPoS4Fdu0QGl1IMpPrges99HsICrOR+km3j4khE30
	 rm2d0ZZqS68R3uS9wCnobpV8TZnMmudJqvqSaWnrzy2C62ykCxZgMEmvdfhqtUIS+o
	 OsEZxh+aHsy2L33pRBdr4p1Q3pIMgVdkKPPJwjCM87CwoaBBu/iUd3plSBMSxjup1h
	 Fv1hZfft1C5IPPlN40yesHo/nKEnuJCo5FnGcBeaqWAm9vVDggwLW8bC9+QgeMllrn
	 Jj1pil4gDWukg==
Date: Wed, 16 Oct 2024 19:37:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
Message-ID: <242a31a6-8a0c-4db9-97a5-8a9c9f5c29b4@sirena.org.uk>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
 <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47EfpzAZQNSZ/aR2"
Content-Disposition: inline
In-Reply-To: <87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Snow Day -- stay home.


--47EfpzAZQNSZ/aR2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2024 at 12:28:22AM +0000, Kuninori Morimoto wrote:

> > I was intending to add the below entry to MAINTAINERS file, but wanted
> > to make sure you are happy with below (I can send it as a follow up
> > patch),

> I can review / comment for Renesas driver, but can you agree that
> you continue to pick the patch instead of sending request-pull from me ?

Yes, there's no need to send pull requests.

> In addition, I wonder should I be for simple-card/audio-graph, too ?

Yes, you should be a maintainer/reviewer there.

> Please add/remove

> + L: alsa-devel@alsa-project.org
> - F: Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

Should that be linux-sound@vger.kernel.org instead?

--47EfpzAZQNSZ/aR2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcQB90ACgkQJNaLcl1U
h9DYbAf+NqKn+CXp41DFHgGpFeUexB+xp4tTVrdnNjx5ApqvL+cfxx2SMoGJpURk
QbQTY3lTlnPTTpDxHtttGNP66E+beQl6z2GvtXTekF8Z+aT/+4kPqo2oyjttRrLW
x6zsMbyRG+J23CAizKQC9RFdSueuOxG1+l5dK4jujaLcs4rxvGCVemn19SojOyGO
zygmuPOpbd7Gfc1XIvzOm4slPtGfP+eOdgtnZWPpO2Jep6+WK1jjDfuK4hXXr8c4
3E07UpzK3LWB5lEb+oz0lskfg4+orYuudVtW9UfJAfvs9kerPkxvl3D42/PIXbM0
GZB3lsHH0UbIMlbShFDkIQuNuRSIZQ==
=uHkG
-----END PGP SIGNATURE-----

--47EfpzAZQNSZ/aR2--

