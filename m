Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5987332ECF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhCEOTc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:19:32 -0500
Received: from www.zeus03.de ([194.117.254.33]:35442 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229562AbhCEOT3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hAJp1UdAccigoPC+imjbNDWYw67D
        bRaEX3j4HABm2fk=; b=RbRSQu1Jmf+WtdCBv7yx+r/CIe0I3H83/LrH1+gHoRCT
        9/ID2oXEbTFcocWs4me1PQMa4Ic2/B9pOr0MRgJ9H9tLj1HEGyLmZCvTZbo+XV+w
        vx2Vp6+Z+wobm/0LFFjy2EQpxHA6NBll5ldX/Vl5dS5QNPUExRzAcfKztnAg8l4=
Received: (qmail 2248208 invoked from network); 5 Mar 2021 15:19:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:19:27 +0100
X-UD-Smtp-Session: l3s3148p1@jkyLxcq8WJlN91Vm
Date:   Fri, 5 Mar 2021 15:19:27 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and
 sub-boards
Message-ID: <20210305141927.GC1312@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <20210304153257.4059277-1-geert+renesas@glider.be>
 <20210305141543.GB1312@kunai>
 <CAMuHMdW8hqVPTcZcCFAHFUNOe63Ww_5wscLvRM3nms9Q4tS7Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8hqVPTcZcCFAHFUNOe63Ww_5wscLvRM3nms9Q4tS7Ww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > One minor question is: why do the labels in patches 2+3 have the "-id"
> > suffix and patch 1 does not? Don't we want consistency here?
>=20
> The EEPROMs on the sub-boards are labeled "Board ID" in the
> schematics, the EEPROMs on the CPU and BreakOut board aren't.

OK, super fine with me.


--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBCPe4ACgkQFA3kzBSg
KbY9CBAAiHRx+0OG6imacd8wsTQQlKoAS04SAtwgCnt+7c7arDJQ1Q8I7VbzSUOd
0Vcx8X0xFmoSIvykWpAJEjbbphyS+DWaxtO5UnkkLvwE5yS0F0DUtA8NJvVnhNrZ
+1pY/kcHqibYsoMW+St61Q74vMUJM3ohk+xeNPQItvVdm5zTv88vrKzfyJuhWDPM
9CXzad2v6CfT2eaoXJexape9sydelyMoSbnX8GWywZHMLzzdzw82lROM5k9zaP+H
bBebPbRqKCFaus4+yRApdh9aL+urKsf+NfACf6/o3Y6BK+fYB528XRSsprH+Tegl
wLXTqnmbYgwhatrLWfgK/3QFsyZgh9b4jeL1hi2fqovoTO0GXF7MuutvITIMMOhu
QAsTUSYMaBeErLyL525cuRnB7VTbqkcY367seCh4JuJ2RzBNUW/UhqnH/292Rfax
dhe+9Q+AOhY+asZRxD4+4GLLcnfV/WVNirBRECBCdx2g4RG7F/luQz7eu2Rakr6Y
16wZzTPu++OHeXFfYw3owPpyiMZqXToeEamd8V9wOzH7i+H/R0+Znh9j77dRa5Np
/g3GsfofocNC95fp5UKEL+0mBGhY3rOtT0deR9BsopHbIPlqoGpbEsxxqCicKzav
1rTHZjuau3SSbWKLf/CcmqorwxLC97UgybYqBJNRo7Z59fyuIzw=
=GHdC
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
