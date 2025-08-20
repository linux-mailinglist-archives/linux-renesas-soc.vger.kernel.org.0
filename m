Return-Path: <linux-renesas-soc+bounces-20794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A888B2E631
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F223A5E446F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B5285C94;
	Wed, 20 Aug 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAuzed5u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A8277026;
	Wed, 20 Aug 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720612; cv=none; b=TeKXcEx6emOLSH450jx3zNxnEufwUyto/lJnFaG6IUrIXfKGM0sySYY0euLiWC55XTZAfOBvrizkJi/Du6QfyhMRGNkmIvLcnJ2+kGeENthey2/4Glx6wQ3RTE8DfKUDBjfcwGnPCY8UotUhiSiHRkDf9hncK59rYK18p/mf6Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720612; c=relaxed/simple;
	bh=dVse70mtSBA8O5q2x+wtq/ObMTzGEE9i3+gZOaAkwoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv3to8jjoa7ruJop9uJICGx1SHHrgzE8xeBlWclexIyJj9BbtPvJ6pmiAFFYQbnY4p0gKsEeNQdHaaH5AjepRIPuX0CsMQuyeedbhLQK3+uVj56d4LEtNpmqFq2CSqaXxUe2o03pnZ8T1ZmPY/HfU1pBPeDU0layc6uUGrtbuxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAuzed5u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBA3C4CEE7;
	Wed, 20 Aug 2025 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720611;
	bh=dVse70mtSBA8O5q2x+wtq/ObMTzGEE9i3+gZOaAkwoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAuzed5uHG2Y1FqNxOnK+WFGbd6Sxfkd+UhojRzarpG3RxkCUyuooFIPTZ4yFMfq1
	 jjYfw3EnRfzXu8X1q5OwaZIlDQ/QMlsqSB33aykw8vK9oJSy2hMpg8Khvns80kIF67
	 clgLxGBb2w7Xl7kvN4hHoMyMIO0QGZmQfXCN71DXGXwNjsriZfT5kfKO5/ZMlfDPdz
	 v5BSZGcXg2XotCLB8d4w07Z5yGAogWISVjw8/0r8wHU+xYRMPcH5pScHK+3abol0Xv
	 ax+lmNvYTFf3IcXv/Pw1u5ORBrDp8w7dI6k62L8XurcjtU7kmdzNLGd/Ic1JeqSHZ2
	 oYHxN+AcpOSZg==
Date: Wed, 20 Aug 2025 21:10:07 +0100
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
Message-ID: <20250820-primer-shaded-66da9fa4bcae@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LXzirxQmX6U3Q32+"
Content-Disposition: inline
In-Reply-To: <20250820171812.402519-4-biju.das.jz@bp.renesas.com>


--LXzirxQmX6U3Q32+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LXzirxQmX6U3Q32+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYrngAKCRB4tDGHoIJi
0roxAP9GJsZd/fWOmzknnV9S9oMRYhu/UFF/4btUgos9kleS/wD/YpfxnSiYK8eZ
7a060ooGfVAkpHuCTnOxiQsVMk91igI=
=Hh6y
-----END PGP SIGNATURE-----

--LXzirxQmX6U3Q32+--

