Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34B85535AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jun 2022 17:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352539AbiFUPPK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jun 2022 11:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352504AbiFUPOz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 11:14:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD71729CB2;
        Tue, 21 Jun 2022 08:14:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 621F6B819F0;
        Tue, 21 Jun 2022 15:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D04C3411C;
        Tue, 21 Jun 2022 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655824447;
        bh=OZlfEgJPPL27uCOfUcNRBzpd4OtK6pXffLp4w47WDZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jlc9O+Xn9LruEt91mMLpCJaOxqOa5u/fynfFRHnL2P15dr0drS7XjW0IO/9cB4WQK
         s2UZEx+Ky6kbme00Uov0AVnv/podRcieYX7zwU7cOCkPNuzE+Ay+WNWopUnX34W3Z0
         DuWaSjusj1lvZ8i+g7511sQyKkleMllZehhk3qMAqhNnAePi4LYF5wBGBuUNGYc690
         81w9Fq1Fa2Iz1lpOLCXNUhg2N0JY4XEGI38LMshbHPEcALu/4AtBc050RFl3QezpN/
         pFxFqJdnSB+bamqv3kFGiMdMR0w3C1qVQWWGpo8jqLXGShJiaVGC+QsdMsGF546wcT
         3Xyo4hUMpRCnw==
Date:   Tue, 21 Jun 2022 17:14:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Message-ID: <YrHgOptQ56woMAeO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nw88w6/DKCvKTgU6"
Content-Disposition: inline
In-Reply-To: <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nw88w6/DKCvKTgU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san, Geert,

On Fri, Jun 03, 2022 at 08:05:24PM +0900, Yoshihiro Shimoda wrote:
> Enable UFS device for R-Car S4-8 Spider CPU board.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

With my firmware, the manual setup of the clock in the bootloader is
still needed. So, yes, I agree we should wait with this patch until we
have a better way to deal with the clock.

Other than that, the patches give me SCSI disks I can work with
(partition, read, write). There are a few initial errors, though:

[    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03 =
for idn 1 failed, index 0, err =3D 253
[    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03 =
for idn 1 failed, index 0, err =3D 253
[    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x03 =
for idn 1 failed, index 0, err =3D 253
[    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry: query =
attribute, idn 1, failed with error 253 after 3 retires

(A patch for the typo in the last line has already been sent)

But after that, everything looks fine on first testing. So, for the
patches:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Happy hacking!


--nw88w6/DKCvKTgU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKx4DYACgkQFA3kzBSg
KbZ5UxAApdHSQPyJbYMGyD+PpowBvH+U6lPHG+KhuP4ZJaSNqtrWbsJV3XyL9xG+
J2bEQ+CUKEqX4F48k4GxW5nlC/mNWx2XxvJeiMzklLsmb4LggkkfpjdB1u3N1KbS
MBlne0ZFN/M0xlu4PYcOxcoKhCSqsGJQB0Hlxt6X0o9rJhn4dudLosjiydqsFVOj
0K2SSi1XRuPOeevoyFZZUPvgzAzJ7KQ2uH5eaA+l6xcpg0ixooscJxx9pyK9wVYi
qfZq6GNlMLbknT0LLqc8sr6XXnCTiyoTl+zDMta/ytgdsBonX+h5QW/xR2FWukx3
ITmtA0dqOkSr9jRllWNYfZ00jdXT23fHiml61mVq7sNLBW/DaWK/PQzgrZC83Z3A
298bIaj+FqjzEc3iTIFJ3qsKSRgD1DjVhV9Dbae8U+pySQZavgh+DbACGu4HwJfa
fSxJ55FIwY+PFIrvAC3TDrTQWwQtsnFESpS8NXt6gOaPcSdk3XDgWgs9BaykF0lY
x76aOEE/EFF9n3SQjSWHNbWe225FfChDB00yJO7YSLy0alxH226MmzwKwYGOhc67
iXnUgaEJEp6qfgaBhAz5zfLpuGwWWC7zWw6RT2PQFX5D/c2ZbsgOFUWC+mNh1Ewo
ACJc9A9Kaur1hCmm3fxYBUuwENzYthiT8Q/HSNqdmPjOZNYG4xs=
=hpD5
-----END PGP SIGNATURE-----

--nw88w6/DKCvKTgU6--
