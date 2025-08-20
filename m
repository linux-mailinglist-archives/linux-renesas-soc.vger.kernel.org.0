Return-Path: <linux-renesas-soc+bounces-20796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED2B2E641
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF25A5E497E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9F6283686;
	Wed, 20 Aug 2025 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="re9SEYaV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399727F728;
	Wed, 20 Aug 2025 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720756; cv=none; b=ehl++PKnmBpItaEBpj5tEBo2CX0XMapBGqDjt4pZsZvJfLT5Ot++tvCq5PeYspLJzbDaRndzMP8gBHqEXsy3b8bfPzoE1qFy/q8rAet3O/dS7G41QsmeNiY1iE7qMPu+QKHl5R9LfiUN3UM5yPy70Zi3rPiGThBHdz8erEdvht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720756; c=relaxed/simple;
	bh=AJMpxTtu9ORwc3IjKO1y9Jr9sD2s2UqoyzgJQPmeDDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkn6bSe3Ra/DugOPn3Ov9UlHoTecT9isX4R9v/v2mJqsAKTrrvO4ZdF67D/Jdp1lhiXddfSuhSmO1SMUXu/w+JkCjMRPxlSsNSGsKFD3/sCwQLCobJbzLRK6eaeMPzEUYU02CQ5tTfoyqrshRggJ3YUcLERxUF+6xMLL9nFZYsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=re9SEYaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DBEC4CEE7;
	Wed, 20 Aug 2025 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720755;
	bh=AJMpxTtu9ORwc3IjKO1y9Jr9sD2s2UqoyzgJQPmeDDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=re9SEYaVlaWSOaXwyVqd3S6CaYsivjx35lZeUPIDt3UrNfEVLJ7OKjJr04AejGtmz
	 CqWlViYduI47Vc8V1Rgsaads7kKdKGuzPan1vuk2VDTVlFXO6/4YZfJ0RrJB7r1Xc/
	 aX/xvupj5baxEPCEXx8NlglwuDWWyiFNi3fw+50h/Bg3Bt53JPbiYEMg72O8PJbTjQ
	 N/+tILx1cz9ARZ6ta8xZmwQmhM18nhgG3ByDJRDrkL14FCjzn1/F14C3eaUAgi01mh
	 ICZhE3q6cEG6jUvTg4IdzNSFlNH/J0J4U/lfdEnwgVbxpVq/naemg5lfA4qK3otXiu
	 NOoK/2p6RscvA==
Date: Wed, 20 Aug 2025 21:12:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E
 USB3.0 PHY
Message-ID: <20250820-commodity-curator-1f580789885b@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-4-biju.das.jz@bp.renesas.com>
 <20250820-primer-shaded-66da9fa4bcae@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bCH9mOQO/aowJKBV"
Content-Disposition: inline
In-Reply-To: <20250820-primer-shaded-66da9fa4bcae@spud>


--bCH9mOQO/aowJKBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 09:10:07PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Now that I look again, same applies here with the different filename and
compatible. Copypaste mistake? Or why does the compatible not match the
filename?



--bCH9mOQO/aowJKBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYsLgAKCRB4tDGHoIJi
0oG0AQCuiSe3fkytZB8sfmU9zi2rhLAgrvaN1TTt28ZbsSNIgAD/Rrl8leB8/feP
PTf1dAjEv+tmCyyvbDhh3N8G3CwFgAg=
=Rs73
-----END PGP SIGNATURE-----

--bCH9mOQO/aowJKBV--

