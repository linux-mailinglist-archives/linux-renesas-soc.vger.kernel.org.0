Return-Path: <linux-renesas-soc+bounces-32499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFumGodfA2r65QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:12:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CCF52589A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9343F312E7D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EFE385D85;
	Tue, 12 May 2026 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HESgCCZL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB8385D64;
	Tue, 12 May 2026 17:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605617; cv=none; b=rsMQm8xW2YQq6bTNdu9F6DTLLGZ32nYlaPTwt8PetSWX+BfWodZ8yGFnftn2LrDI3pSceaM5sKGq4LbrDlJk++/zy24bICHS128m8BirVFApVlqbPeLARK3skb+Kiv15FtsUL+GeHR5NpdhtwMGNvXhhaNZF6NKyLvrr+s18ExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605617; c=relaxed/simple;
	bh=krsqWN8Jbk998u6+0SYuHWsqDOelHDwjA16BeKx7UZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY1l6aBNaIK+7PvTGzS6A+yX+zXTL6s7G0X9k+EgKQy7b1gz7RpHHRtDToJ2wI3eg4MAiRE3DpPKxXdU0gzkJs50M+bbYH8g63/CsqbCo4RwV+ydjaYEh+v1ft5pEyEh2hkvdNcUxW1rWXhlZSY8JoE80IqRPrR2PzaUbA0/yrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HESgCCZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C9AC2BCC7;
	Tue, 12 May 2026 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605616;
	bh=krsqWN8Jbk998u6+0SYuHWsqDOelHDwjA16BeKx7UZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HESgCCZLVs3aWYLXH1wk6W89ju+GR/Wg9ny4ZNdVg2jaRMk5qgGQm4Zd6U3RLBRAY
	 y7agZntCZuPVTPmBn/47x5cWhiwTIFcW6p4CITXOkeBG+O6R3UUY7IRqcu2L9FhiD9
	 XIQ9VwaAyb1jUFjXX9zsSahfy8E0zuKA+FxDtSGZEtxo0AOkMSBD9W0ZZZrLO/53bz
	 8oUucRDe87ZtGy0enRtfGlBaAITWb62LKYOX9KjiZ64er4BUJzjYvB02kJ5BacGhqg
	 Il9UdEVwhTCuxDIY6ZNQtIizZNa6FU+UT05Y+75aurIliCOqcXE8+3obIPf8Tv+Fxc
	 BIeEdeq6wJEVQ==
Date: Tue, 12 May 2026 18:06:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Message-ID: <20260512-roundup-graveyard-08846d29007e@spud>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
 <20260512-rzg2-sr-boards-v3-1-f033fc96c906@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfVhLrAEUTpcwfUJ"
Content-Disposition: inline
In-Reply-To: <20260512-rzg2-sr-boards-v3-1-f033fc96c906@solid-run.com>
X-Rspamd-Queue-Id: D7CCF52589A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32499-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[solid-run.com:email,solid-run.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--dfVhLrAEUTpcwfUJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 03:00:05PM +0200, Josua Mayer wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>=20
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>=20
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>=20
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Did I not ack this yesterday?

--dfVhLrAEUTpcwfUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNeLAAKCRB4tDGHoIJi
0vqBAP0WA61kRroWtgRay3Qmcy/3vH86GWnSoU6hXDjQ/m8aJgD7BgCpEuAR29vC
Y5LuoLCumaFLBjW+YGNYtKvgSx4qnAE=
=0rqL
-----END PGP SIGNATURE-----

--dfVhLrAEUTpcwfUJ--

