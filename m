Return-Path: <linux-renesas-soc+bounces-7467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841993A23F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 16:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E054B1F23113
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 14:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D028E153836;
	Tue, 23 Jul 2024 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9Qk0qvP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86815358A;
	Tue, 23 Jul 2024 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721743450; cv=none; b=HFZvtSVx6pHneMnAg4YoMaUZfyAOCE4qEE4IUSyQ8Z89pm2tekXCHfVTDqzS6kpNnBz6xIglAUhDa/H0gSHoctpbQ3/UoYTrokLwK1jd7qlxkR3ugiVhTKHkWumFv4RXoAt0yhgTyQ1295BLGppXvc40ot4a67pJjUk0N2V8NGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721743450; c=relaxed/simple;
	bh=yeSWW8IMgIqL/YUpmB40v/9sQ9I50uoSAvurOQi/DoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlXEaFyjacTCT8HzEvEm+wBUW9rvAFYT3mn4XLwB3HEfLDZy/7PeJhIok6VqEhN7RTxGV04hDoFND5BLYwN9L2mdrFrjHmr26yqMui2JqAThxdACEY5gjj6LJnZ3OpSeZa7g6x/kAh0U7lqn8ifxIbxz+5mQr7oB60QCbziDhLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9Qk0qvP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FB8C4AF09;
	Tue, 23 Jul 2024 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721743450;
	bh=yeSWW8IMgIqL/YUpmB40v/9sQ9I50uoSAvurOQi/DoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9Qk0qvPvElw3G6Uzf6oGgyyU1pNQoZ4XZCjPN/5toEt+i+Vp7A1qdSuijX1ttVJ6
	 rWWLkj9w9NK9BNc5m3qriLNR/gnxdHZUPqaYSfUG2p1PWjqSAHXx0MmtgvWVnRh0rq
	 B7zak5Z7EglHgxR8nd+/f9Qcbo9tKUp0BVIYD07YLrO5hHW0bN0NgRVTzNQk1rT6Ue
	 A4bVOVW2XLW9R99aMhaUqGaXgamRiEfnH7WXpsNqxXRJXs7BL0/XIN4ZPc6XyAwS13
	 ASU/fD1MSDtnLbVuZ9gLRW1dUGUj84ViC52pn7kktbuHJrYAEsz9E9j3ksXGgeSGLe
	 GTq3bI7e+sOAQ==
Date: Tue, 23 Jul 2024 15:04:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 resend 3/6] dt-bindings: clock: renesas: Document
 RZ/G2M v3.0 (r8a774a3) clock
Message-ID: <20240723-blooper-twine-a83b8b39a9ec@spud>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
 <20240723110733.10988-4-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3l+3Fjws9XhHOv2"
Content-Disposition: inline
In-Reply-To: <20240723110733.10988-4-oliver.rhodes.aj@renesas.com>


--v3l+3Fjws9XhHOv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 12:07:30PM +0100, Oliver Rhodes wrote:
> Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
> Pulse Generator driver.
>=20
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v1->v1 resend:
> * No change.
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yam=
l b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 084259d30232..77ce3615c65a 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -31,6 +31,7 @@ properties:
>        - renesas,r8a7745-cpg-mssr  # RZ/G1E
>        - renesas,r8a77470-cpg-mssr # RZ/G1C
>        - renesas,r8a774a1-cpg-mssr # RZ/G2M
> +      - renesas,r8a774a3-cpg-mssr # RZ/G2M v3.0

Please explain in your commit message why a fallback is not suitable
here.

>        - renesas,r8a774b1-cpg-mssr # RZ/G2N
>        - renesas,r8a774c0-cpg-mssr # RZ/G2E
>        - renesas,r8a774e1-cpg-mssr # RZ/G2H
> --=20
> 2.34.1
>=20
>=20

--v3l+3Fjws9XhHOv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp+4VQAKCRB4tDGHoIJi
0vsyAP0V1uQ+GOQZCvbb3FQJV81ODcB3cSvomOzpYGV96dknqwD8CfBWn2v1TeZv
OjvZYt8lf9FAxeQ2zZCrgoWUH0yS1gc=
=c72o
-----END PGP SIGNATURE-----

--v3l+3Fjws9XhHOv2--

