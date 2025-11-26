Return-Path: <linux-renesas-soc+bounces-25206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55458C8AA3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 16:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFDC84EA446
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37EF3321BA;
	Wed, 26 Nov 2025 15:27:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD503314AC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170869; cv=none; b=GNgfKarMqxhgPNBnLBa6DjEnMI1eGsxMDUcnBrflbYZUI8UcuqNCR3tkEbnI5lqJ456dhHUxafWio3+IUVS9YGJGzJ+z3PbrB42LFAshqabulg7R2GrSD0c9gaO3EOgfkRldT8/0zJmmgeGrtiaBDvOXJDJpOUM5tnrULVbKvwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170869; c=relaxed/simple;
	bh=R77P5H+0napBHQF7WYxYhxSxunHs7tm0aIKrBHwZEOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnEH42MRtIywcs/CBo9HyjhVcGHCzCDmFZqcjjwflt3h6SAmz8bptrPVPY8oFk17mvRv9Ng/VW98hd3vRdQDsa5+RL16c4W/MBgQYEQnSi8MZJKvBDfJUo5N6Y8xTp6IRapwv2gGkU4hwh/lASMnvUVQY9OmGwkxVJJ4yXBIezA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOHQW-0003GK-KL; Wed, 26 Nov 2025 16:27:28 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOHQV-002dCd-11;
	Wed, 26 Nov 2025 16:27:27 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 02F794A8DE4;
	Wed, 26 Nov 2025 15:27:27 +0000 (UTC)
Date: Wed, 26 Nov 2025 16:27:26 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Biju <biju.das.au@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Tranh Ha <tranh.ha.xb@renesas.com>, 
	Duy Nguyen <duy.nguyen.rh@renesas.com>, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] can: rcar_canfd: Fix CAN-FD mode as default
Message-ID: <20251126-large-mongrel-from-jupiter-c96915-mkl@pengutronix.de>
References: <20251118123926.193445-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xbjhdh4g6anmg4s"
Content-Disposition: inline
In-Reply-To: <20251118123926.193445-1-biju.das.jz@bp.renesas.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--3xbjhdh4g6anmg4s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] can: rcar_canfd: Fix CAN-FD mode as default
MIME-Version: 1.0

On 18.11.2025 12:39:25, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The commit 5cff263606a1 ("can: rcar_canfd: Fix controller mode setting")
> has aligned with the flow mentioned in the hardware manual for all SoCs
> except R-Car Gen3 and RZ/G2L SoCs. On R-Car Gen4 and RZ/G3E SoCs, due to
> the wrong logic in the commit[1] sets the default mode to FD-Only mode
> instead of CAN-FD mode.
>
> This patch sets the CAN-FD mode as the default for all SoCs by dropping
> the rcar_canfd_set_mode() as some SoC requires mode setting in global
> reset mode, and the rest of the SoCs in channel reset mode and update the
> rcar_canfd_reset_controller() to take care of these constraints. Moreover,
> the RZ/G3E and R-Car Gen4 SoCs support 3 modes compared to 2 modes on the
> R-Car Gen3. Use inverted logic in rcar_canfd_reset_controller() to
> simplify the code later to support FD-only mode.

Applied to linux-can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3xbjhdh4g6anmg4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmknHFsACgkQDHRl3/mQ
kZwh8Qf+PLxcEuNKgC2msmGRIQsmXqOhjCQ6UhjoDSuMe8je8L8biMJwT01kClJa
GwxXOUN6B0WxweFTsVqMjoP2kJXIBsDC+Ys0Xv4q951U8tBu0qJzH5R+j+uynyAK
mWyfjU+pXHVmV79TLjRFh1fqky67CPQ3rBzPAEX3WO9XTFpvaJYFwP/M/9ovfl8t
ao7/zwopZqaBa9xqeY2U3qtHEcW04hZxPJsmg2NO/2n7AcmUs4tZdiEqLwLQVyYx
qM0wH6GvdoF5u7OsAR3y6OQLw/+Tq303FagLL5l/V18jHnmuNScC9/nWrpTvJ9g+
8nEjBSRMLh2vKMur+HfwzMJiDERRcg==
=PwmH
-----END PGP SIGNATURE-----

--3xbjhdh4g6anmg4s--

