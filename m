Return-Path: <linux-renesas-soc+bounces-22344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66798B9BA30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 21:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF17166901
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 19:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD49258CE7;
	Wed, 24 Sep 2025 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMWvT3dn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E418B0A;
	Wed, 24 Sep 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758741232; cv=none; b=GFyk7PR759QUJOhCVvNnlPe2S1oLRtfo/TzfwOYMZVPsKMSu667X0rSAIMAgR0wgPyp+++USD5ZxLJz2W6dw3JzBBGEDrGnvqtocRrS6IVoAIKMUNmPHi7ohkDsRpGqcDaDuETCruupG5DPhuHovBX6lUcvvEK/0u8S4dJA3WMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758741232; c=relaxed/simple;
	bh=obJxnZekB4WIG8RL7kXppSHgA/amLMeM0pzMUd0i/CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT1JrT5qYgW7WH+v5nvyo+HvSDAptgV4z1BbZrMW9clE7qv5BmOZEdEaR4njan1g151vu2/8cOKUL93EE3MDcFBUp++G2nWJo9Qp9cmxiajszZkrDn61GeCaZON/dnr6D9ipP9wWO0ia+W0CM7Qhlq/+DRwD+ExSkaxZacC77Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMWvT3dn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94B0C4CEE7;
	Wed, 24 Sep 2025 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758741231;
	bh=obJxnZekB4WIG8RL7kXppSHgA/amLMeM0pzMUd0i/CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMWvT3dnPw4+xviu3m6H3ehDXSQusdziP04daUv+/Qsh3E4fEWSwp+zE8MT1rqiBP
	 ifwatbwbth3QnrQpSSobAc/K3yFQs32TDc4KhD5+p65ZXpa/i5Gr0G7P2vmV7W1pGh
	 YpTdMrsXrgpojrwJC0em4VViA9i5AyVyGJ90/3CzzOsDV0XWnq/GUHGLtD7/AxOdg7
	 rUL9dAVIsZLKHVptXAHKiZe/xmqH+BNvKuhgKmHfEnsqi3Qr+jhBhECiGONdDJm7sm
	 Eqag8hpae1WTMHOFO7oXdigp0TLGIOfYh8APsBWjFrz2+5nPOqGFyd53od+G4FGpUi
	 Prkl+iAW2+BZw==
Date: Wed, 24 Sep 2025 20:13:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20250924-flagman-thus-08b0cb14946e@spud>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
 <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="98eyz47R0E2z5CLq"
Content-Disposition: inline
In-Reply-To: <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>


--98eyz47R0E2z5CLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--98eyz47R0E2z5CLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNRC6gAKCRB4tDGHoIJi
0qx2AP0cDNVhrKNfjJaL3YkhGqfWYI4zoBzMpZriprMQBVvMFwD/c/iVVQFN2NIl
eI23SXm/4HvbUEm9VtZBvfSuqmBKEA0=
=U+q/
-----END PGP SIGNATURE-----

--98eyz47R0E2z5CLq--

