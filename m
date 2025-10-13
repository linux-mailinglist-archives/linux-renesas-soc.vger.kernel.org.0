Return-Path: <linux-renesas-soc+bounces-22979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6FBBD5FC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 21:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AEFB14EDA5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2714D2D9EDF;
	Mon, 13 Oct 2025 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqxEukwI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DF31D5141;
	Mon, 13 Oct 2025 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384549; cv=none; b=B3jGiBWXFrFI8TTDYAETgWvkZBvjbP+RI8DemchLaDyaxJ9KIuE5aQA/5w6IQs0S4kHx4aK0pGUfXZfPPLm3F/dqnIWfJxTyg501zXkJTEjrELICfqJBPZ24XlvEzwttntQJrakWvvP+jpw97O66gz2vBGT7fWaYDCcibOxWatI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384549; c=relaxed/simple;
	bh=ixwFdgEDV1vu1vzeg2qqQRwOw909mWVq2oy7W8xBU8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ95pS3blvay7o5VfsNPgDUT/pz9rxuSehPFRVU/o/g8KW2FnjLhFUT+lkDFJ4nSI+YHQpzSjHH/INicfaqPmeusdHL3LZnt3uqn9SGxAL4Qa49ubhCRMrpIvccx+yYoOu5QEMdQqAJATgKObDBd2h6a/S7x1bhkHuNZD2w3yPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqxEukwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151EBC4CEF8;
	Mon, 13 Oct 2025 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760384548;
	bh=ixwFdgEDV1vu1vzeg2qqQRwOw909mWVq2oy7W8xBU8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqxEukwIUDgo85pIstDgdKdZE+8YzI57ha+0WdxwRe9i2ov5PZOK2WtAwViW6mIRW
	 hkceeBaoWdDZNZ4v4FG17UGNiK4029Aispld2PGhF3CXts8gLz+OwSCFxyBzI5wh7q
	 dipFaT8oNyEK2VonPte6vulHKxLAo+qXp4R30GKLVlGqeYoOEQ6cwkOkFA2noNhXWO
	 fHOay3Ul5BE50A0Ay29/98aleZN8tsJOjy1OftGqkz8NULfFTAx1TuIfe1bH2WnYgG
	 H6kb55VjmmQ9TpNNcQs/HWh+oE5cm0lRCS7pRlkb7Z0l7nW6Ln/WEGnYdry8I77vMg
	 2RzaaOTTEdgvA==
Date: Mon, 13 Oct 2025 20:42:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Message-ID: <20251013-antiquely-unflawed-acba8cd30277@spud>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POmQqzPbtUQG0SRW"
Content-Disposition: inline
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>


--POmQqzPbtUQG0SRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--POmQqzPbtUQG0SRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1WHgAKCRB4tDGHoIJi
0md2AP93sXHNI+r51S7+e52a5fQ3zBG8dz6mP6G+x+3DQmyQeQEA+pvsrxIei9Rf
epAILOGpCNuTKgdzwuz6M74yE/by1AY=
=/GHk
-----END PGP SIGNATURE-----

--POmQqzPbtUQG0SRW--

