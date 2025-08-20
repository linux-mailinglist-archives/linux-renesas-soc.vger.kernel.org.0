Return-Path: <linux-renesas-soc+bounces-20793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230DB2E63A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59313AA44BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E3227B35D;
	Wed, 20 Aug 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLBARMLA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388F26F462;
	Wed, 20 Aug 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720574; cv=none; b=DZHHQ/Vx/85+5Vj6zkgZxTGCYiaK0JXLY0KZMhg7udHcxWOpdQuh792gUSEkXd6dpae170eahyIlmoX3aRNlcWqVGj2jf8w0JGxnItevOqJY1SC3JnXkpWCAupevZ+uZ7MkxlR2bizleDQRFGfMXV38sQZCVqrlT7PHWI92u2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720574; c=relaxed/simple;
	bh=iNxLpmDs4OmShEgHNksD0WmigmnABDiSZzd9z/dy6Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVrxunjUDvazwT3a7SJoU+SjOSY3q+7z+O80JmTZEiEG6nhofb99OflQr6+STcOUTnEzgx2+vCZQCERBEUku5Zx4Myk7vhEUGhwC6SHmZCyk2XuAxo0CPVG9aRPRgIW1l7N5DeatFP1LqsikXrJjQBzSs2v4pJIdL7UsUYdmncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLBARMLA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727EBC4CEE7;
	Wed, 20 Aug 2025 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720574;
	bh=iNxLpmDs4OmShEgHNksD0WmigmnABDiSZzd9z/dy6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLBARMLA1qHkitJCVXxgkI3yh1wWpqtxKbWrDcNGp3nIH69Lx4bTwvhAdg/7JH+zN
	 dOdamRkTblVwyeDHHm8VDl4ctKfKmuQGAnq7bPHOofrfV3ePgk/axioZG82gORFQlB
	 zvboO5ZY6Jq5DbiHZyvl0MwEhOZoH6m6EXSiF7B5PvStB8XpUKjX7gK35jRocMzaF2
	 ldbsazFr1cwHHm5hWli9lixJ7Q7NXV3SYCSeGhdX31VwlHPxE8BQfMCwgZn1Cv1n8H
	 0601qVjIIp/Uev4mGM2w+tcsPOqR7XNTOJyd/0llTKYlHIRd4yeY/hmXgbUsbu+/1R
	 +ZLKzwf5kpRvw==
Date: Wed, 20 Aug 2025 21:09:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/11] dt-bindings: clock: renesas,r9a09g047-cpg: Add
 USB3.0 core clocks
Message-ID: <20250820-handcraft-reexamine-ee46e7abf32f@spud>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDA/mselMTSvHodO"
Content-Disposition: inline
In-Reply-To: <20250820171812.402519-2-biju.das.jz@bp.renesas.com>


--NDA/mselMTSvHodO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NDA/mselMTSvHodO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYreQAKCRB4tDGHoIJi
0lUfAP4//APGHgWbED46fcCUuHSKh8QppwPu0kq1ctltEC5FUAEAyuHxqXlPbZPP
hngnkPcgfAHF6UGpMvlcSQcq0kVLiw0=
=l1/v
-----END PGP SIGNATURE-----

--NDA/mselMTSvHodO--

