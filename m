Return-Path: <linux-renesas-soc+bounces-7922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D49571F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798ED1C20DAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149D118A959;
	Mon, 19 Aug 2024 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRzucQ+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB69A189B84;
	Mon, 19 Aug 2024 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087746; cv=none; b=InLHF1fJN1wn0+EY3S6nKdto39PJ4w0pnRCEoBevZh0yZjwbPy+FJCb7udZ+vm9P1QXSBdOBV0xsl9W2IqD9q0psRnwxj525FS0ui019+TCoMG4haUUSv3WxeLC/sPfS8XnvdRAhAAFOhSGAIT6CGQsQQovmoOFm2c0+0HSEK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087746; c=relaxed/simple;
	bh=3m16DD0M1RTVW0xeHuDQ0j+vBZMAjde8UdEqcSBy1Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHwSTHVXF1C1nljFRwTRGeS7VoG+6vF6win2v5GoLnQmTIInQ/UVoeV0DALSdwoPbcQov0EywdTOUzqOrBHSJWh6VcdxabFwQJTBcplYZ8ZChLCQoyTRQpqdKV1QttRg2YVqgdgg4mQzsQ5MxETz3+5/RD6ljcR/COdFX6/sgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRzucQ+9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D593C32782;
	Mon, 19 Aug 2024 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087745;
	bh=3m16DD0M1RTVW0xeHuDQ0j+vBZMAjde8UdEqcSBy1Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRzucQ+9nkwmaA4dNntq4V1TJLroMDjNVkeFzGdfO/tNHdVMejJ8HD3iwD3eoRLja
	 /BstO+XvAWKTkxuAD8+aQuiZ6pA+sG2R4GvBkDpkYtpPXei0Uhme4fWTJGfwoCkvVM
	 JtDWA/JOWrOLkI8YKnWEErh0G/8L9VBPBuctXsqApTYJgdFQSXAzgRZUE1pHA4+D9n
	 e/f3fIOAMQaPWwAyFN4Ma0/5UvOi+awwHceuPmlUNGSYgA7ri0YCJFbf8EgztAuV5j
	 UL7kRhC3cHMQ3F08HuquD50YSHkhio33lfN4lsEsv7UkuQx72ZZhuv3dNcPXZ468gC
	 mwTcD+hVbWUQw==
Date: Mon, 19 Aug 2024 18:15:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,rpc-if: add
 top-level constraints
Message-ID: <20240819-breach-throwing-ca060e22a97d@spud>
References: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nV0aYr8jLPPEzFQm"
Content-Disposition: inline
In-Reply-To: <20240818172930.121898-1-krzysztof.kozlowski@linaro.org>


--nV0aYr8jLPPEzFQm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 18, 2024 at 07:29:30PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nV0aYr8jLPPEzFQm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9vQAKCRB4tDGHoIJi
0tlCAQCzDNytOWmXkA9fM0cazQuiWjQT00a5iowzCB8rbqpNhAEAq6qPOYoMRT3z
spqb9Sd3K6/O3cyLY5cq35gwvY+dPwE=
=0sgF
-----END PGP SIGNATURE-----

--nV0aYr8jLPPEzFQm--

