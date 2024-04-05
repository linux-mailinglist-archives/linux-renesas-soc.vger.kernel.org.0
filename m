Return-Path: <linux-renesas-soc+bounces-4345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7289968D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 09:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C811F21915
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Apr 2024 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD12364D2;
	Fri,  5 Apr 2024 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IAIbhw5x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461436B0D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302342; cv=none; b=izX5HuAw6WAuzjWfNCbjymPcnISn4rQ62H4rKfdC7U5+G9pqhM+mm4dG6LP0PDXdhrWcjKYczJYs7DG4FFpaZJ49PQVI35NWp7wX1W1cVMW/ClxCN2EQU6kgh1Cgl4FbUd91gvPmQHYyX1JA74fTyW95XiXRlDXQ9qdaLATr9G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302342; c=relaxed/simple;
	bh=f5l/MU5ouJNng5Ug8E/3eoVK/5luwE0j0nKQ8APc5RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwlVECVEQtog2jNigeLlW4WzUNgYXpfU26Awpygf0+/ATKXsAwOenXc8SKJoIPU37gph/ZySOabAiF/oEDxZ1I8WRe12k7UfAHWd7zQ//3wBJClvVrSX9GnsHQlJoqhsY7VanO3cdiDPrqXF8Cdn0DrEfi2kC7xRYUtGsLHCixQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IAIbhw5x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f5l/
	MU5ouJNng5Ug8E/3eoVK/5luwE0j0nKQ8APc5RU=; b=IAIbhw5xw2Bqent9jMZC
	Fy++QJ5H2FfXMnraxdZMXmXLrZ3olQb/mkILr9AVEggubDu5W0vxkysqlymyN7xv
	Z6jiD/DS2Dli1Ro5z+j3ijgNyoFkck9WVHm5JSVzTmDRsgVuCJliX5cijTf8hANZ
	FnXjQ4wtx3vvrUMIQ6rgzuAn33oUeePVzjYy7u5pWbDvecztd+6NU0ePKM37BCmH
	r+kGqakoSBwojD0UDrTXw4gMdA2tNW5R7EFxoA8D+qcGVXYhQu/K301CKwKPVqHY
	i4UxVTr4N67+BeowtTOoCe9hIcIfjerXiA2MlqH/82uh1bgF0A7CIJTTfN9QZFR5
	uQ==
Received: (qmail 4022756 invoked from network); 5 Apr 2024 09:32:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 09:32:18 +0200
X-UD-Smtp-Session: l3s3148p1@7muedFQV/oIgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 09:32:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add timer clocks
Message-ID: <zclaggxuvk6b3gnl3zwlp6hkt3yosiw7krvlzak7r2flglsiws@f75zijrkp6qd>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Thanh Quan <thanh.quan.xn@renesas.com>
References: <79a66e8ff84378d7f65d5f55cfb01b9b745edd12.1712068639.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqwujaev5kujzf5r"
Content-Disposition: inline
In-Reply-To: <79a66e8ff84378d7f65d5f55cfb01b9b745edd12.1712068639.git.geert+renesas@glider.be>


--pqwujaev5kujzf5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 04:37:52PM +0200, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
>=20
> Add the module clocks used by Timer (CMT/TMU) blocks on the Renesas
> R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--pqwujaev5kujzf5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPqQIACgkQFA3kzBSg
KbZp9w/8CNO4SBG72bM6tVC8y/4Cdsvg+4oqFeFURNA3eWfw95E63p4lmN0LVF8A
G8eRjlXD+5YGEFWszTTh6dsJ2zEWK9NZTY/QuNIynIf+9BPS7umG0nzquPxzVFLM
hZfIfKarZRpZs1lK58WEGvd+IVjf5RZ3eUMYfwMO3K61m7LeLU4gmDyETC0oi9md
+E3Y9JPQiPF9EIS2UsjpLyMHH/m6GZTSTDULVHvZqCqYQRLuLuvYZMmaAsiu63m6
vkq+hCeYxCvbABYTdJfvfadGvOkGu14yYFndFpBNfrfIoD8jS3ch//4XjGr296Dw
V+h1vzCzhhVJ9BTLSg/V4wTwrxf03q0NArxNfvglxXi/8O7PqjW7p5LaT9VYAcB/
zYfQwTBaxSl2GR8Szi8NdHhqsDsWaZkJ3sZm9vQlClVY6RmUQw+kTQCann+v8ma8
5R6LcWQBpU7LZWnFOcSqhQDUhNRlNSA6iEYhh73kXzrIDwZ0gdQKEFDZYOsRkRjG
wnkiqwUj2bSDuKHbPAPMflQemW1FvitNcB0AEcL5oD8JgPZqB0rqIq+riU94lErH
FKHZskGvDccOg8J50JKWZPqeUTHnD9J6PSNUGn0+FESvUVuK45fJTsnxqtyC2MTo
V0b6peyNAJLTBOGbkyAl23UiuSgi5tDqVLNZhbQuh44QrubEomE=
=B41G
-----END PGP SIGNATURE-----

--pqwujaev5kujzf5r--

