Return-Path: <linux-renesas-soc+bounces-27152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NQALM7gb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:08:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 326514B097
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 512D7A0DEEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4336938B7BE;
	Tue, 20 Jan 2026 19:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM2xjPzJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEF30AAB8;
	Tue, 20 Jan 2026 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938690; cv=none; b=EL3Od/q5HlbDS0RIMfvu/0PmYNTxTGT0AbvF1UT3jYLOaQ0V6gEYQWGDYUxoIFo5y2yOAF/G36c0EHavm7JXwkzX93C5Bf3gNYD330kNEe7ZwyHjEv1ctUTpwHYGSeHM8g6i2+WjixZ0WWTfKwle1Qoe/Ne4Mfccxs2pGw+DKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938690; c=relaxed/simple;
	bh=Ti2aBMrKy+BgGSQR23NoCVlFFEY5P+wrVPR2gAYdzCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOHXGjfhGNXp1mrGP9UGOvhiMYsLRhVss7tr5xNedQrIAGKtBxZgVGnJLejGJMC1Wan8soI4EJu+fGY4HM+TeMNHpLwICPxLbXcJIK9cJ0EEDb1F6QYExY8/yKB+6CS9fGCP0+vx1PKVfUeGH33wnkufpnRAQO4Tm29CSG4R1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM2xjPzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54480C16AAE;
	Tue, 20 Jan 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938690;
	bh=Ti2aBMrKy+BgGSQR23NoCVlFFEY5P+wrVPR2gAYdzCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WM2xjPzJosA0slhwPDPz3IzuqjjN1aEEOrdsZwRQ1Hr6TsXK2Uh5KU+hD3vaZ44bq
	 8wHIBD/TgTWosSaKGuWCi4+tB2PsHJ9yoz1u3wzyWIlnihLPX7OuSqJfXseVTYzWpR
	 9jU84zQTCoN4uqIK1nWmcvhAzuwVxVWFIvCo0NTrxTekoUMwpYcsQ2NLGIYcZTj4nX
	 Dx+5DcaIII/mmkcE5gvMkgAr9te4baIjQ43h0/I6uDc62Pywvt+yFaH1WbCjDsHDOl
	 9SUjjin27mdeAv0YTOGQULwmuTF1f+YpFw/i9eSkn8hh55dW8YGJt7mvn6m1fHKPCU
	 GvSHxwGytAtKg==
Date: Tue, 20 Jan 2026 19:51:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 07/12] dt-bindings: clock: Document RZ/G3L SoC
Message-ID: <20260120-chlorine-sandblast-dc63c2ac54a6@spud>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IRplfoTPUo+piMtU"
Content-Disposition: inline
In-Reply-To: <20260120125232.349708-8-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-3.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-27152-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 326514B097
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IRplfoTPUo+piMtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IRplfoTPUo+piMtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/cvQAKCRB4tDGHoIJi
0oQ9AQDSdls9n2y6PjggyKr5OYW4flztkBL3To/1/bGB5NeuSgEAq594y4gP8tOs
V7b1BhnH5tIq516yqIixQ3zA5KD5cQE=
=wjyh
-----END PGP SIGNATURE-----

--IRplfoTPUo+piMtU--

