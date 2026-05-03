Return-Path: <linux-renesas-soc+bounces-31889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCKmHZmd9mnBWwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 02:58:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3C4B3E98
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 02:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 981773004614
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 00:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E793D2253EC;
	Sun,  3 May 2026 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9IJrr11"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8D2248BE;
	Sun,  3 May 2026 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777769863; cv=none; b=YK1G3whRuJkOdVgOMJ7hIXGdbXJPYL1cVDNYveDtuYl4Ufu7+AKUOn7Nt/57UU87BK/6BNSTgPQmV5mVgijLreboLM7JiYyvd/FLqsIRE3OsRbttJzFgLII3iErtMQLYWPQgsHrEMYyan3Y10a5aVtpMQzbjgNrXLVW2gBZsCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777769863; c=relaxed/simple;
	bh=ipwOt3wDcTRbnf+Oq7x+2TSaOrUM5aQj+DUvcadvQsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/BIox9C3MxMD2xrNdZFLTiF0bQmEpL3CbHBhQOfyKlqaNdS9ZzqzBCz60yXTYIucnYPVwCPNDt+VULupFq6BVX1MRgEJD3ZUQcbad95q0i4foW3rShx8QbRhoH2cUfMDM4BtegbkwSr2UrGY0O0/HYn2UI1jrJY6X2BZXPQFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9IJrr11; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C25AC19425;
	Sun,  3 May 2026 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777769863;
	bh=ipwOt3wDcTRbnf+Oq7x+2TSaOrUM5aQj+DUvcadvQsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9IJrr11YeHmjMVowngVy5iDRggjjWUvZVgdAPPPbWPqbIgUfUf6G7bQ7qnyPcHnX
	 DerWXJdPWM4Msr1RpaNIrjX1mNzvOlXVvwBHv7z98PRJr2FI+nrZ1hqzp/A7ansNhq
	 JWo0q8kYJsPeCFOmRWYQBvKCPZc16ZcaXGYKDMrKM5u9SEXvy3hwCY0yrTD4XmP+jH
	 bFoozIT1biXlbWDXvlvVyKHlBfWIK7rPRgIXucwNvliKMKYM9k/BLDScEJWNy/Pyrb
	 Hz1d0wYdleY2iyhXZCUJCzWmYTK5jQQq4tneuX0KD0luheNqMIzK99D/xXp9OZGD1M
	 kYQA5HdMJ0EVg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 347D91AC5863; Sun, 03 May 2026 01:57:41 +0100 (BST)
Date: Sun, 3 May 2026 09:57:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock
 output
Message-ID: <afadhRD4b94rrNZ-@sirena.co.uk>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N487/py466ktSMaf"
Content-Disposition: inline
In-Reply-To: <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: 9AB3C4B3E98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31889-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com,solid-run.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.co.uk:mid]


--N487/py466ktSMaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2026 at 06:07:04PM +0200, Josua Mayer wrote:

> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1
> +
>    clocks:
>      description: |
>        The clocks are optional. The RTC is disabled, if no clocks are

Should there be a requirement for an input clock if a clock output is
specified?

--N487/py466ktSMaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn2nYQACgkQJNaLcl1U
h9BnHgf/Yc3mBMSBK/IEjBrrdzGboLZ+aDXwV/yLz1M2v5Izmc8/8CN4aOvRzrkH
wJqTgQPJ4lIT0wRjCp18ww+aruz89QU2AaBv8PTTGTb6mjXWr17oQZKtCG0Nmtm+
jDP2wz6KZd2spkk/ThgtZZzSMh2KIV645ItJ0JND9p52Kt7dxbO+sHC3d/tYM3aA
Rnh7fVl3LpqL7EhYZHypaEEC2/+Z8BdbNcVp2x2e0Q6t28a3Fzd4wTev6g31vg2C
CpbqzJhOUoWoZ7wjusIkLBL9xpnUiAq2B7+AnMA+/MNDE3fPJ9fQtu40NyK3/QAS
Oo9tNgz+3fpY0H70sMW0KHiXG/KZMA==
=mkq7
-----END PGP SIGNATURE-----

--N487/py466ktSMaf--

