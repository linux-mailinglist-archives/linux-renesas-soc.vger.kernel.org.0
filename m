Return-Path: <linux-renesas-soc+bounces-5475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059A8CE4C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 13:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC502822AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 11:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1967B83CD7;
	Fri, 24 May 2024 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TuJw6RaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC38562E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 May 2024 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716549232; cv=none; b=glDEm97uajb0cqE2NIwADlu3LeG1Ske7JhMrM8neUOeQzk/KWbwa/TV9cUFmoFhN781xp40rIxUEEI0DDgCf1lTMdUk9syQOnM2Rn/eCgDDJjs6BYO3mfRb2vgAz+ae6M0jvfWoY5xvpJiu8qsW3SfTZ2qkC5yXK6ns1oteUvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716549232; c=relaxed/simple;
	bh=uRHPOAW4twcNvRagnKbWGowu7JAlmQy4Tci7gY4Rnv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHRDDIVzMRaK8vb7n0JcOX3un+5y8WzErBZj9N0gu37oS04u0931gHj8m81Td5Bnn2qpg0Lm3Pt9wiBjcY/2M9ak1h+JOCd9G+MdgB+TjGG2Oe59HCqZmgk2OqvRC6LvlUDeMY1+E5EM6aHlA1En3QkSXGqqZ0FffFbssRL9Usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TuJw6RaM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uRHP
	OAW4twcNvRagnKbWGowu7JAlmQy4Tci7gY4Rnv0=; b=TuJw6RaMEQzvTwtjhshc
	a0v6OFGjZQvppAdA8LYRjp9f2GRugeN9dUc8kIZy09mKqha6mNWeoF/bLTEzSC5V
	lVqeJTHKU2FEHEV82ppb2E+wne8m8iCW/gvg5YSahuLTxuLNqOk4vUyOhnHOt0Yp
	Fwo1sdeGJO9r1cYu+qIaUjdMcdrTf+9ynfVy07tLrNjf+4F7H92Hpi/vz1aYZ0eM
	05dPFghRZtZyXVNLRvfGWpZy70Dp6YqcN1opaeIGlStYkcD9vFcs/xqx1j+6CTNa
	UxU6RiB135S+D9786fxx8+GQgrZWWsJemXFyOfT3SPdYGOtNgwowkLv1P3lDTIqK
	Fg==
Received: (qmail 1422112 invoked from network); 24 May 2024 13:13:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 May 2024 13:13:41 +0200
X-UD-Smtp-Session: l3s3148p1@RuJ8QjEZfJm57tsi
Date: Fri, 24 May 2024 13:13:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe
 controller
Message-ID: <mdztslnrrybhm7ugdwq3xkmdtvgibn7rkpjbzhavwqywactx2t@27wcl7eslmqp>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20240523203431.6423-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUfdHBMZ7WkUqN9JzcvXkPtLygL684_Qbaudb5+GvtMJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dahagqt3zh37vrjr"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfdHBMZ7WkUqN9JzcvXkPtLygL684_Qbaudb5+GvtMJw@mail.gmail.com>


--dahagqt3zh37vrjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And you changed CONFIG_PCIE_RCAR_GEN4_* from m to y??

Stupid me, sorry for the noise!

> All of these should be modular.
> If you agree, I can fix that while applying.

For sure, I agree.


--dahagqt3zh37vrjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZQdl8ACgkQFA3kzBSg
KbbZbBAAlvql0NPFk5dfkWpgt8/BPowkhfXFIDduRUwgcS2gp0dnl+Hl1mm3s7UM
p2wv0bbRwjzlNZOv17d1+omqeS4VkO18Jg150GmcA3AgFcAiwOsGwF9dfmAm7Aut
Z763uKqXX8k//8DdGeuaahD/sdh/MiKH11uBmCp+HN1xYgxxdGnDisVTvU9dCIK+
ySr3YdTWz6l/QOGJT5pK8nzJv6SYGUEpDZvFQyozdW3Sddb0aV5e0eMTKefaSf2T
SKAG64kaPLGoZeP+HxyYKQgRw2JENELIw1O280XunY7uvqb3BDXRTCK9qnzjNQb/
9sji8nU+vmIkJFrRdrm4Oug8aMuofyrWWI/CbI1cFuzR2mwK6hK+SPZnYWgeA8Tw
3ysjNg1bN4Z4tzWPpipjbeSQgCSld0JfhXA582j3GbBG9+dEwQiD9ovWAvoI/ao5
2Xkuxx4SAxLpAMTuiha4p0dH9jOMQTJp3es7oUSO1B2ud/cGoB2+QMnrQhU62MrI
DGA9O2Z3UKnF5xB+yADqheEKqGha7HRvMS8D6BvVc7fgAdUvQ9Kx7j5yvOAvJxTq
QFuQKq2mdLL38wAv4UqCafELxJhMrmm2Wh0F+oVPdzJ0f+PQ+9BMLaQ2eRfvl2d5
xI/ZaYeHL/RDh0WkFc6+IJJ66At6+VmaEBn2oBuwGZ2TiYqfcNk=
=6Oab
-----END PGP SIGNATURE-----

--dahagqt3zh37vrjr--

