Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6750B1D9698
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 14:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgESMrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 08:47:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgESMrR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 08:47:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 601DC20657;
        Tue, 19 May 2020 12:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589892436;
        bh=Wn7kODNP87IZf6dtuMn2zAhZvTFZFFR+j0VrIcOiyxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=taffVJzCdPeEtwdctDn8/MnZeoZdx+teX9CrwsziO3D/ItvSp4IIOIxW4GbbaBlgr
         GeU0dkQQy7fcNlDFk9UjAaUdBSzRsPCThsAAhLalYteBisGF00e7Az5Bn53jaHZVMq
         v6/2FcbM/jmvzuQPnDnkS99JAbwUon6f4iSc0GsA=
Date:   Tue, 19 May 2020 13:47:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: fsi: Add missing properties to DT bindings
Message-ID: <20200519124714.GA45550@sirena.org.uk>
References: <20200519075858.27869-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20200519075858.27869-1-geert+renesas@glider.be>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 09:58:58AM +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
>=20
>     arch/arm/boot/dts/r8a7740-armadillo800eva.dt.yaml: sound@fe1f0000: '#=
sound-dai-cells', 'clocks', 'power-domains' do not match any of the regexes=
: 'pinctrl-[0-9]+'

This doesn't apply against current code, please check and resend.

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7D1VEACgkQJNaLcl1U
h9DCyAf+Mts3phRcq2EK6k0s7OwrITSyZjBcJSn14GIEgkGBkpkNQr+QPKPL+eo6
idw4I53ebOG/syRplLp/sOLf65GzGWjQOouCjygXM5g6sjIisoKQX8VrRuJLhrf1
V1XUO/SLkgA9So+6fmIib9UamvwkuwnABP2qrjNiKv0ZV9C5wLasbKs34hDYOuVd
U5WmBI8JGlRefRLM5NAE1kDVOtMbyM9UWh+t1X7Eoz2dKdObHhavKPiiFqOdqkrD
3+FQ/BiaP5TtCd7Cg72GQcz5iaFORB02pOUT+nf9/804g/hPqxAVKXnuMP2QuRlg
+bPQrkcD4c5VhPHNQrQHKdem1jVOEQ==
=CChR
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
