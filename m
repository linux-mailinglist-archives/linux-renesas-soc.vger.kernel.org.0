Return-Path: <linux-renesas-soc+bounces-22697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8446BBDEB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D21364E4A0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 11:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DF826A0AD;
	Mon,  6 Oct 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2o3Y0+d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920534BA3A;
	Mon,  6 Oct 2025 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751555; cv=none; b=BdTDk4xPmFG4dgqGmKT6o/DOcGGFVbsOvmIGfmFFcZh8VIzbI1h3x6PmNoaR0ag8rMfLNGm0mH2HJD17+AXh6vvUMk3Fczaoj/ROzXyJ53E+11TNksi78RzZ/05vcXCsxlbAvaLhw0z8ODJLdXJ3mreVsahf4taoVADNkmYbO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751555; c=relaxed/simple;
	bh=WDNHLYL18ruyuqTniL/2wHqBfq20g9ibBHtE5bc4e8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbS6L5ZtstbQ86IRlV70rJ6QBW2X71GSrdBVTLgQQHvYntB6Ftmqud6fwMffUR76gXsR/9uAIF/TLZiUXVdroGeSRn2C1SrbIf/90aBYNEp6REF1XG3W1Hx3uXRu2yxug3MCnRoum6s5AMX2Y7HtzN29AhUVV9MxNeX/8C6ITPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2o3Y0+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB21C4CEF5;
	Mon,  6 Oct 2025 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759751554;
	bh=WDNHLYL18ruyuqTniL/2wHqBfq20g9ibBHtE5bc4e8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2o3Y0+d71ZQ+1KEXaDJtJ1wdYD7xpwNVYFyIPb8AuA43hsAOROT5SHvG/ewopGj4
	 ysikdtXKxxdWMmetePkp66bEG8sIExFHJCkSolSFnfxldkLpUfzQfi5pPx6QDR5VHF
	 SM9ceoCIS0dDzXu3oByHxhxZnscwVJfvcNCYKpTvDbvfhB5mihnGzUP5pMZEH0vLsP
	 eDTJmoSdvgVyJ2b0gt00b0hcamZSM82LbzHZmQh7ri6lDCgcqmXvnCrUrnDZ1/OVlD
	 bk0xi8tOqPKw7cQi0uPWZiCEFsEPJLgJMp8vaOnY+v12YSzYCEH3YHFlJxH4PrNXx/
	 V1wvOT7VF5voA==
Date: Mon, 6 Oct 2025 12:52:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regulator: devres: Disable exclusive regulator
 before releasing
Message-ID: <ffc7b0f7-edc0-4e26-ab43-e2010ec58819@sirena.org.uk>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
 <ae2701a5-8662-47d3-81fa-30e832600423@sirena.org.uk>
 <aOAI5cfA1HmEc7Rv@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H9n71XiYCQw6Wbk/"
Content-Disposition: inline
In-Reply-To: <aOAI5cfA1HmEc7Rv@tom-desktop>
X-Cookie: You must be present to win.


--H9n71XiYCQw6Wbk/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 03, 2025 at 07:33:25PM +0200, Tommaso Merciai wrote:
> On Thu, Oct 02, 2025 at 05:29:19PM +0100, Mark Brown wrote:

> I will need to move the refcounting handlingfor the exclusive regulator
> at USB driver lvl.
> The drivers/phy/renesas/phy-rcar-gen3-usb2.c is using
> regulator_hardware_enable() for some USB otg channel. I think this is
> the reason why I need this patch to handle multiple unbind/bind.
> Without this I'm getting some WARN_ON(regulator->enable_count) doing
> multiple unbind/bind.

Are you sure it's not just that the driver doesn't always disable the
regulator before unbinding?  It only disables in the power off callback
so might leave a dangling reference behind.

--H9n71XiYCQw6Wbk/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjjrXwACgkQJNaLcl1U
h9BqGQf+IHJjvI87K9Wy9/VYnI9CsGMrZ4yrHPyF23yCetEbfiUiwl7vytDJW3lK
0lvgL19TpGbshQUehlF34U0tJdC3l/pwZz7ao5r7QTV1b5x8QEtQeXH9876z1605
lrycald/cfrtPbtNdoqYAHXwzPf5AchzZIjQw//xfoEBAR3Ui2LBYCuVoyQMJ7Hb
C9VvLBrqOAJCzWMuc5SWoCxJNGmSs3PHHzdGz/W1KcmQC+l/5653uywN6WkgZ6Sd
d6X3vXOI4kkXicnayiCcZcQ8gLI48mf7G1W3+5/2fy3Lzwi6OgFnVLqbs5uLS9Xi
9OqIfynOPFU/atbjjE5qfEdHxapXgQ==
=IXVb
-----END PGP SIGNATURE-----

--H9n71XiYCQw6Wbk/--

