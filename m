Return-Path: <linux-renesas-soc+bounces-30753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRYMA1wzmnxngYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:33:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEB389C98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 15:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457F03005764
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DB72F2607;
	Thu,  2 Apr 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1nEGBxJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439A2ED17B;
	Thu,  2 Apr 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136028; cv=none; b=X7eSoHcW1V83plk4cKkLb4BxngHkW6pKQjpquYnw8GYyieiIuIrv/YhnQLFibMg1KkupSObToK4viAEWBLYzXtxr6UWnHsRnSFiw9hI7MxXlEN9xdOIBeUkW2MR/vtk89/7NkJ1MQFQQiuipXi6uxN+7Btyn9/SdsOu7WAnS7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136028; c=relaxed/simple;
	bh=kxfvKNpnPUSSNDsRLFTl96/5/ILvsbADfQ2wGRvooMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr8OPlVWaIwJGeud8T4ToF8VxtyWLFEhys7slAPGyqWIEYFTvQCE6BcnICZpmxUmUfi+ihz3yn41wwyRhQvBni+URkYoNapw/yVqMECHlaOfnFLr+QUbg6sLrLgM2EmxL9oO67Na1+a4bOtEQbOR1digUkjaP+yDa7/BbS5IQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1nEGBxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D92C116C6;
	Thu,  2 Apr 2026 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775136028;
	bh=kxfvKNpnPUSSNDsRLFTl96/5/ILvsbADfQ2wGRvooMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1nEGBxJ9Kfliv4fWM09v8L1FScradPi6PiRsS/6ogQ3RwdA1Gjp6lfjzBzdddWRg
	 6dUpBO7GsS3cApLkha8kV3wYuqRQK6RYvNsy4Twgjbj5GY4jUFkZH9V+5oxDusaCYt
	 3ihCHmFu6VTxoeKR9EwWLpB2hsK+uYmtH5siRKH2l//4G7HuE0QThOKHmxrxtMAvlb
	 Y71RWM70hG2iYuk9gwIGoLnfQ+yvE1AV7hPQpPajhVdPLvhlLG2n3j4gpv1jWwudnR
	 m6jJwpSCrtVlNFoDArNlKIO4PVA6jcASWne/TLofayzEfmcoY5WiTk4KKeMsXwCwB7
	 amiabYDqEOBkA==
Date: Thu, 2 Apr 2026 14:20:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/2] Add Renesas RZ/G3L RSPI support
Message-ID: <f6fd2e18-d5f8-40fe-a4d2-7894bd232da7@sirena.org.uk>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMZYnA4LzdkTRpE/"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134614237922A87C70AA685C8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Cookie: <doogie> dpkg has bugs?  no way!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,glider.be,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-30753-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 3ABEB389C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZMZYnA4LzdkTRpE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 01:00:28PM +0000, Biju Das wrote:

> Gentle ping.

There's strongly negative feedback from Krzysztof...

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ZMZYnA4LzdkTRpE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnObRUACgkQJNaLcl1U
h9AIlAf+NGIq1DfBznaGP8gy3kdvIvyTbdfendU94b4R9X/2C0az+sqVo5OWIeu1
yNl+4sURxpch24eD1Iub1KIrchQhMVYQb2PtmPi0xAAhx5A/Ro5TZ9E+kUC+0ecb
4DHxRh1A1vTia1GRfulmFl4FkkcTo/rTpVCEMeCf4XBlUPRyb0BURaM2i3vISydn
UyetbA2E8hw5cEh+NQvBqymwSKUnqLW+4C03COpHzfmYf0jepr9c3hgutyDiCDiz
hV2fkR5OXi7FO/rOy07Psnwogcc9CxRjUlC/XbnvhFPWLPbCVcDgDL0DuRTgW0LV
42LGxWjN2q9eEpbILnU0OWW2J3G5Xw==
=ZThu
-----END PGP SIGNATURE-----

--ZMZYnA4LzdkTRpE/--

