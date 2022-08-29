Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0285B5A4E4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 15:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiH2Nht (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 09:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiH2Nhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 09:37:48 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA626BCCE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=anZJTyztXSW9fQ1prWZyfQT3yUKK
        BBa5SRV5T4uDEQM=; b=ZkKwCdf5wWI+7HFl9OrBEy/2RUun/wCkMkSVhc7TmINs
        PstrOZh8+K9Xi26Teo2C7z40GqkwaNlmN0fqC3DBlejMVNc1Y78UMflHwijQuk9d
        8Dft7lOUbp8kLVJx7imqloSvd3aB4cWWTWgKe/oJoAqZDG1+uyvaOeX1L1AX5G8=
Received: (qmail 100116 invoked from network); 29 Aug 2022 13:51:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 13:51:04 +0200
X-UD-Smtp-Session: l3s3148p1@7Ufl4F/nSOwgAwDPXyz6AKlRFcsoQyrD
Date:   Mon, 29 Aug 2022 13:51:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
Message-ID: <YwyoKPVs0dedZi9D@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
 <20220824103515.54931-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
 <Ywyezf8tXUXjm8n9@shikoro>
 <CAMuHMdUDnTsr28mjmOPtd+SKE+cvCDT=mu2_GvjucoFZzWJhvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qNDlLQbW87Ua6iGI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDnTsr28mjmOPtd+SKE+cvCDT=mu2_GvjucoFZzWJhvg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qNDlLQbW87Ua6iGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So my preference is to leave MSIOF0 alone.

So, I just resend patch2 with assigned-clocks removed?


--qNDlLQbW87Ua6iGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMMqCQACgkQFA3kzBSg
KbYPexAAkedjPhLss7VbmbLYcNjlXHXhj5FVz+jEvZ+pFnThopiapmhq4PiF+9pr
F3aReD+s3w0qJb1MiYn2ss/g1QHaTpzULaCSZO11AhesMNBk3xm5U40IoOBw8yCp
hBMxeWenbRlpLW+Fq476JBSPuoUcOCBewcPqgC/cJ66d7/cy+V3H+R6+6EkD/zQ2
xo23BdxRaUzwp9ubrtYGg6bVbKoX5ubbtkEhdtiCS8TIaRwoaApx0ILNq/PNGhQZ
xh5PTStVV8050/i2yceqGMDNA9ga/PaYSXnPZPHL9/WtvS0lgbsJnbHSVsEg7GqQ
poaESdPpIop86v1KAjdxwrhMHFcZrBfW6tGdS4BwZSifSokUsrkkvebBzY47zHo+
GWUqxbGT6vv+ZpIbuYB9NQ7ZqBFpNgxO4JSH4LjozDPpbg5EjKmVMhIlND79ub6+
yomxl9iCW4l9blAA7yOZP0in/6CqZcp3F7YtfuxwiZORoAsc5k1z0rNgJJVAs3J7
c3ipBcl3sUtDs3lGInwog8iXv8as2kjQxBP/vKWg7d3BLGxN0hxRpLtcpXdNL/MX
tgp0ZOvPH6kJPEf57LcpZsp483BWTkxrTdWJv4k5gXqMQGVTZt993HS/olGyRwwm
VGz9wmPXdEBM6YBbpxDJZYgSd5qZElwRyMcq1zaZLG6gs672dxI=
=oFD+
-----END PGP SIGNATURE-----

--qNDlLQbW87Ua6iGI--
