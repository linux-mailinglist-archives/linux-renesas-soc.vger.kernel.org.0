Return-Path: <linux-renesas-soc+bounces-22408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F03BA3269
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F277B3719
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5F02882D0;
	Fri, 26 Sep 2025 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AgjTJt7k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C73261B71
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879076; cv=none; b=BdzHcUdB0FXr0QuIIH6uFVtQFuO9pl+mgXGLCKkPUCvhpti3lX6RZ3e3dKsJeoQe6JAIIkgEZreoPyk+Md+jEm9OwwxOIIo8PqTgsp6ijxVNUMJka0bn7iQ29nQaitDJDyP92oLDvK3JfNM9NPaLsOuABywG6Pwm2690TpYQQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879076; c=relaxed/simple;
	bh=YXwO7NIS8E9TtWAlVhgaQzQpUdt2FjVRbh/vUA67kUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NA61VEgQ2xEIHO7V6/s9TPLqWZIrV3PmrHjKZ+6hKjWX8HwbQp/iFgrvZL7n84qag6TqjZ+Oz5TIY/y3ZRkLxDeKV4OupBoXZ748loNZiuiIMaCh6e04c9KrFE4O9ibYoy5O3bKVAHwwi7VXcGfqaQYaeIAaaPHfTn+M11fiMdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AgjTJt7k; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Yxhf
	5+PnT/P5qpsxP/Lfx0oIUgNJOot4u9qmHb19gfM=; b=AgjTJt7ka2z9Cm4ReNx8
	CF6lw97CQyVSYHhfw0TMrK7ND32tL41qbcuO35/Da9vVKUBZdpWBH+HBYFCBsewM
	9l6NTiSLyWkoSu7HgynK6iqqbvAMCFTRfLioOPeHHnf/Rnr2Iu2YOLvjsLjiKb/V
	5/9NjvFSaq0jy4Q2rHlDEkavWZme09nAwtznE9nx99Oyz947HjigmfWCWsv8Wtv9
	CnMYHDfhhSJPtW2fpzkY617K/VNm35L9xs2H0mOHC6PwzVJtf7MsIwAaV2+O11KI
	7uppQiy+ezxORJSZTkd3kUlfRJO/gjoVj7i0gfHJUT68EJ+5ae8t0jMIu6w2HC8x
	xg==
Received: (qmail 2203196 invoked from network); 26 Sep 2025 11:31:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 11:31:08 +0200
X-UD-Smtp-Session: l3s3148p1@jzAM8rA/cqwgAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 11:31:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: dtbs_check warning for RZ/V2N
Message-ID: <aNZdWxL1vaRfRzoK@shikoro>
References: <aNZYw1yyeckqEvDT@shikoro>
 <CA+V-a8saJr4U3gPzJKwiffrQLEUK80be9PtJh5LnuXAg58J8fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qykDj6ILp5+lIs2z"
Content-Disposition: inline
In-Reply-To: <CA+V-a8saJr4U3gPzJKwiffrQLEUK80be9PtJh5LnuXAg58J8fQ@mail.gmail.com>


--qykDj6ILp5+lIs2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > 'make dtbs_check' with linux-next gives me the following warning:
> >
> > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
> >         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
> > arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
> >         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
> >
> > Is this a known issue and being worked on?
> >
> Thank you for the report. Yes this is a known issue on RZV2N as its
> missing ICU support (Interrupt controller support). We are working on
> adding support for it.

Cool, thank you for the super-fast heads up!

Happy hacking!


--qykDj6ILp5+lIs2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWXVsACgkQFA3kzBSg
KbbtfA/8DZaGFA0FQG+T/KFsqurT5qrzgXhFDzASM06/Ou/T7xxCl7OtnQG4t+gv
ZRinKaxR30y9aYKNDY+GzWfODGDWyI9E22Q4fAed08cO+SeAKNad4yW/CttRNGAF
w6eWRc8C9L7e+wkklVd47ZU5B65J5o0eBk2KcjNNrWABsu618a+mm2s6RzF5k0Vr
jATgt06wUV9UwcPj4JJWO0JjrA0jeryAlc+906vmxyvLVXiEUR7iNU8aWL0aURzk
7r74xuyoXPduG9fVRFlugM9zAtgbHs6aksBjI6SRlz3DMJWGci2tNfqOuS6NuT8H
hDTVMoF8GzifUBhnGzCCAA6caYDAk8h9jPp6zpOAaiusrd19szBT1km+tOLYIm/b
M2wEV6oTrHEETbvL5CmsV/MuG2jBLxXPQjWoJr7Hdbx8AjOvSl/M1Z2w4agg1TwE
A/pNCbY+87vDY0R02QHfsrCS2OFUUFUoJQmJxsTcS+oWm2GQSGwr88eutgHNa0oK
V6BhAgesS+dJUA83Y7iTMrftFZMe60LqWiJ9F6tPB3NleknjB/iye7TCahhZccQy
oNczAcw4lXsD2xWi1KUtW2sQkvUnFB2Cqdl/NaO8DAZe1OF/pSteEBYGqEvzuWZD
ipkTJ44r14Ib8WI+8uYz+8SFg9u74CDB7NYVYjLbxGdhSVW5Myk=
=GXYe
-----END PGP SIGNATURE-----

--qykDj6ILp5+lIs2z--

