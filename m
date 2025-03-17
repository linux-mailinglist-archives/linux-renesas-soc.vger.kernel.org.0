Return-Path: <linux-renesas-soc+bounces-14455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82323A64848
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 10:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FDE188830F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59796227EA0;
	Mon, 17 Mar 2025 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i2dgjDo4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9121D004
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205315; cv=none; b=BOvvgXVHyCjH8Y/4eqlXTJyWmbNONGljVSP4NE3msE6FAvtLmdRf22Mv+OIYI8vSsFCH8Mpr0sDj/FpLRfOp5IWabY8cHracpBUqygvk+LI6s3IvAk4wUh237iPvRb3W/lsFiXAquYbR83wwSHTN+3r/VEIGQmE44ATyRiCGNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205315; c=relaxed/simple;
	bh=Llq4eJN110ZojrtDahxoyFdh73o6ZSenokk366VRPrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1R+R9jTh+zQIabWtjhTAmFqPO01cPnBotUQHQurrLmF0Jm3fwGlitXciLwUW+VD3DSpqcqjcxjHESk2gY6DqPscKwiF6M83WkbtQlyaNJ4LDSQwyclmAFCvCIeOx2YoLq5UGlTOa0K8S38QiqbxIOg1xl09Lt4EAb+wnIrMykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i2dgjDo4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5SOq
	LybWD/Pr+m1fp+8LFEbDcZcMG85Eeb4mwwug4G0=; b=i2dgjDo40DkJt60rl9x4
	yAmvDLIZSvQ5iBNhwbqJS9fF0DdHoJX2eAjHCylFI99c7TA/97NgDoOU40Dm49un
	wuOnKft/jPmmTRi6f2+JZJ8OIuL9PZ12EolwQV8q3TrSE5X2eT08sz7R9ma4vnSS
	tarFZB0uajRJSd0NmTqNtTJ4vb8+dS3K4Y75q0AWrbS/CyHGH9fmBvfXLKLcRtGp
	wuw99r7smnfWzIBSJQbmXVt5Q7kXjot8fSX5+IwrVWX8JEr9VKGydEiHYtF+LO4G
	b7FpU6i0xarLveM4aGvZgOZ4Ykwuygi7PZilQg2I7cDqc1N81tXDmm7aqPQwrd+u
	pw==
Received: (qmail 3071045 invoked from network); 17 Mar 2025 10:55:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 10:55:10 +0100
X-UD-Smtp-Session: l3s3148p1@SlqeyIYwOKsgAwDPXyTHAJp038nK7dx+
Date: Mon, 17 Mar 2025 10:55:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>,
	Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH v4 08/13] serial: sh-sci: Introduced function pointers
Message-ID: <Z9fxfV9jAGJ51fcn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>,
	Linux-sh list <linux-sh@vger.kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-9-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kohI5pM5w78t2LOj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVM_ozW4LAA4DstQuDfEcOnOcXZ2QHGv8nYMKDPWJe43Q@mail.gmail.com>


--kohI5pM5w78t2LOj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

sorry for missing this series so far and thanks to Geert for pulling me
into the loop.

> While most rough edges have been polished by now (thanks!), and the
> driver seems to still work on a variety of platforms, I am still
> worried about the impact of this change:
>   - Maintainability and future bug fixing?

I hate to see development work going to waste, yet I have to say I am
also concerned about the maintainability of this driver after this very
intrusive changeset. The driver is already quite complex. Adding another
layer of complexity (function pointers) will make proper bugfixing for
all supported instances quite harder, I'd think.

Has it been discussed to have this as a separate driver? Were there
reasons against it? This is really an open question. Maybe it is
justified to do it like this if we have reasons for it.

Seeing that SCI core needs 800+ lines changed and we still have a
seperate driver with 460 lines driver, I do wonder if copying the logic
=66rom SCI core to a seperate driver would make sense. I am aware that the
core has currently 3500+ lines currently. I'd estimate it would shrink
quite a bit when copying because you won't need to handle all the
differences to other SCI entries.

Again, this is not a request to follow my suggestion, it is an open
question to make sure all paths have been considered.

Thanks and happy hacking,

   Wolfram


--kohI5pM5w78t2LOj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfX8XoACgkQFA3kzBSg
KbbvxA/+IZpUCBv7zoxyaIEUGj/MSvgO7qat5vGpxAnVEPPNvNK0O12r0ukfKqXw
EWB3NR0+A/sqMs/t5AYLRBBlj94g2PaJJA3NCiJ3z25jLBcqYu0Am9G2/ECz1/Fw
H+NTNhmhLHE1gEKscwqYAEMWZ2s6My+XgOl4Z9uO1JVzmlLYwFpal95L8rBbAK8W
aoR1rheX5dv/dn4oskxyciyAJFWYKWo363EzOHDSbs+UBdNH6+bqGAEWQyX3AbiG
jvRui9zjONaNt78zqlUoooXb7fohpZT9YHjeLDD30lFvICmAAqGfb7taSjHvSA1u
Ai86yJIBC0hV823fR0wz0o+YD35cxWzmUIwTG7/TtwOV6BZhNdoUu/iyOcEb3NXe
2RJ81r71cgmymEEzhIwVqu2MAcl/zcsQg3CN4uuInNFLVVN2S8OyBVCHRAGWz6m5
776x43U4bk5NGNMmcve7kbdjIFTD/1ECkbENq57pwzCRgQXqdIG35ded6zLUAX67
gOJjNOIUyNwO9le6Wt4vWx/YifwvNInM4z5qUFYqHnPDTcuEh2TlODrlSG54o4nD
lR6RwGJvwCv+3XLwd00fyTXQRXox3N7RdyWeb2AwUB+Wl2CuNK7HumJhMYWFmt0E
Zx30krCdBRNgWy0K/IfyFP2nRUOvDdyhaM69bsekxPgPzsMm1mA=
=GcHW
-----END PGP SIGNATURE-----

--kohI5pM5w78t2LOj--

