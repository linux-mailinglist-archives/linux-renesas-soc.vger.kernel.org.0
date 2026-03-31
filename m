Return-Path: <linux-renesas-soc+bounces-30615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIzkJC11y2k3HwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:18:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCC364F7B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 09:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E2F311F260
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 07:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E5836A030;
	Tue, 31 Mar 2026 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FMufHHwc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930B3B7767
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941016; cv=none; b=PuZamAgNisNv+rzJchK3h7G6Yz1Sc0SkJhTxhW3LK2ISfwq7VZnC9IPSfjmufaOYnT2gfzQSaOJLy0q/LemET8XDFOuxHNqpej38HcpLEysEHhbtHy24yhHvJnvm61j+BD9Ib5SPUswHnyQ5Q+cW7IcPv6btUt2BiEefJJ/JFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941016; c=relaxed/simple;
	bh=hZfnLbBHSdjmQXLsaISPFrjvepFdi9IT5UTmD3M4Y+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvPT0k/03Te+/L+jmekI2SI6WHL/zssKF90K4NzQTKxMnMZUOWeK5BMlxss19sR/W3Whm3QbCTDEuvPp8xNZiqFVhzPc/85rp/XY/7LG2HeZuWk6YKb4DHHkuFWsIOfFJo4CQzyEjEI/PiMh+j/VyG/unrzlZQxiBK/g1r3dUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FMufHHwc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hZfn
	LbBHSdjmQXLsaISPFrjvepFdi9IT5UTmD3M4Y+Y=; b=FMufHHwcnz1PN0AVrC6u
	BALvSnXAAca9pyzO3jQZ4Iz3du9N4zUpxrBXnEd6w+LHVOgKPBotkdrHyGF/fNMU
	ttyc2Ej9R20v5oIhtQk8/vT7CJoOj8sEwe/U7mzr4S/wZUjRbwe+8LjxuMNNf9e4
	Onb0lFZkbjkzZG4cUP0OJ/QgSK1pSp3vuwU7XxLCti/Re5vDlF9sUpa225ULaeOx
	xPTKr+i+ZNkKsFsDahvXU0G26pVCAgXR/X8BKC6j/bd0bwM1+VTityjAHe9wp4DC
	D6zOK5pRKFW1AAYxxC6VM122ImObhSdjt7FmmA76n9PWaqSZzn5Gy6rf4N4jBx6i
	cQ==
Received: (qmail 1577447 invoked from network); 31 Mar 2026 09:10:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 09:10:10 +0200
X-UD-Smtp-Session: l3s3148p1@B7tkqExOpNEujnu8
Date: Tue, 31 Mar 2026 09:10:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <actzUSIKKzcDmBCT@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
 <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
 <CAMuHMdX=DRnFWG1ky8wT7mK=LHeJ6LduL28nYd19QpASrn6mew@mail.gmail.com>
 <c46357c9-8cf4-45ec-8b48-8cf979de2e98@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMfuA1kXE6RB/nfQ"
Content-Disposition: inline
In-Reply-To: <c46357c9-8cf4-45ec-8b48-8cf979de2e98@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30615-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[linux-m68k.org,vger.kernel.org,gmail.com,glider.be,kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EFDCC364F7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--GMfuA1kXE6RB/nfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I did not get the driver so I cannot verify that. What sort of Linux ABI
> does this bind?

In case you mean this as unanswered questions to v1: This describes the
device specific second mbox cell. Like Tegra does it here (even with
shifts instead of plain numbers):

include/dt-bindings/mailbox/tegra186-hsp.h

But all this has been said before and you got the driver as well in v2.
I really have no idea what is still missing?


--GMfuA1kXE6RB/nfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnLc00ACgkQFA3kzBSg
KbaC4Q/+N/kr6/k94EMenN/lZzbiQZ5xuvHCBrTKXl0WPC1u+xwWASaVr036h1V4
BbLXDwHIREXC4EJod+RFIJNmTFxe2xvMQuXMDrPojnykUP58S9usigPQCuBc0qph
Y+F0Z+rFXShPyl8jl/ZBTkMFG6YT1B0BCiSG0mYloX1xMwD+LX061P+qy4ly3C3c
G3qlctU4XhjdCOozfl4NI6lnl9vnuipavWE2CaZdhWPH8rkNDKzNSC182MR3bYgB
7dfPPfJZ1J9Yi+vGE94OZpr9aoH8gXNHUJKAzv8TrguMQ1YyizcI8TnPsWqaoo2F
0+Y+13bcqpq6vdw6jtYgROAF/W1GijkFm7OoIdKJWCTY2zTorGuOKtvGPRc0oigs
22gTlVZUdNj6ZPY1NjOxla/QbPPfBu59V5gCWXx6fHdEO6dxMt2QTWosjwAjxs3r
TOcmgtCutMwqAiODZ8FL4os0sh32dkp5e8KL72I8s0lI6KixLGm7+L2MFwLIs/r8
Ij7itOBaFhdLF2G+Y5lF+t6sRSXsgLWgRNs1Fs9sLDgdkbmuEH/X7AjOSujyuTEn
blDhYIiGjHovdPaY6PT14sQQkxlUI3g7vGd4UDpoX5xH07EXibHvNI7rwk0nfkzT
lUYAz2MkUDWseTf8y5/s+FqvdKNXAKSjHqLU7DvVtfphPqik5js=
=QDCi
-----END PGP SIGNATURE-----

--GMfuA1kXE6RB/nfQ--

