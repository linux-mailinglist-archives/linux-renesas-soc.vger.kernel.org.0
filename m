Return-Path: <linux-renesas-soc+bounces-23881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED3C1C786
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 18:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9BF6E4D60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E883D33CEA3;
	Wed, 29 Oct 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjE37pNN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD12ECE86;
	Wed, 29 Oct 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761754500; cv=none; b=g/VWG6+1pIIq89KorSbW6mRnHS+rFojA/GGZ5dUcPmY6xJYUvgtQwryVU9KeDX1BJviO0FHPgVe+g19UoEBlGJq7NSjw0cL1eJu3YBj7nDfLJetoZKcg/wKGOdszBqZsdSybnzj/n0KjPJ6yHJnqOQ2qVfyAGacRwZuS0EisxyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761754500; c=relaxed/simple;
	bh=MzDiNBwjOd5bG+qpBunqHUPL5TbDLkEqeHNOr5ncI3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIZs+SS4rpvGAtrximgLZwMy3Pf1+tPfenLl49vM9sMw7i6EXaa/n1wKkIvNRbkUm/zBDwT9poLyxsc3DhE2TADlHOsI5iyaqaEEq+3SxlRi9Ztn3jwwsy/awY0wLaW3+yeYIbgqVpYEFOKS6CQ4UViCN5LV9bD/hArWKh/TJkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjE37pNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E76FC4CEF7;
	Wed, 29 Oct 2025 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754500;
	bh=MzDiNBwjOd5bG+qpBunqHUPL5TbDLkEqeHNOr5ncI3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjE37pNN/L94+0MLl21IS08uJ68If0bQz6Nldnoci1SWL74a5JkjwbGiXLqZBK6Cv
	 3f77yW0B2+xKct/DP4OFLB6B/MDEmlMZJ/Im+RzJYLT7Kxdl4EoItpZcu9WEUPbjhx
	 7wbSgeOp1IkG6gqY0wLC7QitMyN6pUXzJyty7urTyi/C/Tf0XE+Oqo0he9Es0uUo0J
	 zycg7LRL6yN2spgA6gBOiOrBjQNRhTULUdvrG/w90LDoVakhV9uaEXZr7VTRwHwDNi
	 KQUmoMx/Ltsm/rjj8vJLGIsdCh6fg0SSt8YuQMnKSHtniDuiP+KHFwPR4X8Tc4wyZ1
	 CvdB7/RRxn4xg==
Date: Wed, 29 Oct 2025 16:14:55 +0000
From: Mark Brown <broonie@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
Message-ID: <56911e0e-0f25-4134-92fd-f89cb47fd9b6@sirena.org.uk>
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
 <bdb14543-e611-42d0-a603-300c0ea17335@sirena.org.uk>
 <70362ac1-244b-43c5-97cb-ebe8f5b90c3f@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JpTtvZk+/JgRadlt"
Content-Disposition: inline
In-Reply-To: <70362ac1-244b-43c5-97cb-ebe8f5b90c3f@tuxon.dev>
X-Cookie: Goes (Went) over like a lead balloon.


--JpTtvZk+/JgRadlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 29, 2025 at 05:22:26PM +0200, claudiu beznea wrote:
> On 10/29/25 16:37, Mark Brown wrote:

> > The theory here is that the power management core uses the device
> > instantiation order for both suspend and resume (reversed on suspend) so
> > the fact that we use probe deferral to make sure that the card
> > components are ready should ensure that the card suspends before
> > anything in the card.  If that is no longer the case then we need to
> > ensure that all drivers have system PM ops which trigger the card, this
> > won't be a driver specific issue.

> I also saw the behavior described in this commit with the rz-ssi.c driver as
> well. The fix there was commit c1b0f5183a44 ("ASoC: renesas: rz-ssi: Use
> NOIRQ_SYSTEM_SLEEP_PM_OPS()").

> In case of this this codec, I saw the code in da7213_runtime_resume() and
> soc_resume_deferred() racing each other on system resume.

So I guess we need the more general fix then, with everything calling
into the core to suspend the cards.

> > If the device actually lost power during a runtime
> > suspend then we'll end up having a bad time.  There was also no mention
> > of runtime PM in the patch description...

> I had no issues with runtime PM, but only with suspend to RAM, when this
> function was called though
> struct dev_pm_ops::resume = pm_runtime_force_resume().

Calling regulator_disable() doesn't guarantee the regulator will be
disabled, the constraints or other devices can ensure that the device
retains power so there's no effect on the actual hardware.

> Would keeping the regcache_cache_only() + regcache_sync() here along with
> populating the struct snd_soc_component_driver::{suspend, resume} be an
> acceptable solution for you? I think that will work as well.

I'm not sure what you're intending to populate the component with there.

--JpTtvZk+/JgRadlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkCPX4ACgkQJNaLcl1U
h9DVIAf/cAd0aKUG7ztZYiPY/cyhA7SyqjfnlvJMZkM4AqWOp+nc2Lq76IWOKckx
esVqlDB71tZI+wtddbYyDVc8G4OQUAFnftjSyFl97/CYACADQ9FjUzWpUgbaUo0h
9KbIQUFejzoao8zsg6jIfMgeh8F90M9JaxoMjNjpTfpLfpGw0XHGZZPfRq7z1v41
B1Oxl52EIMC9enrkF8sKEOJ3WQwNK9w6XjAY9vctTbSgkAdb/twf0BQEmWOxcOkU
U1zK/LTjNfbBtl3ZMhXcupoyLVBXOuYdNxT76ZH2ziGhB3hGvl6UYVorkXf9+kzY
foTIXsTVHNwWQz6ZpmpwcgZmwCzIhw==
=MYlh
-----END PGP SIGNATURE-----

--JpTtvZk+/JgRadlt--

