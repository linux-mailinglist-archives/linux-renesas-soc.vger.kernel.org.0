Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38378554889
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbiFVIXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 04:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiFVIXD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 04:23:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47BD6478;
        Wed, 22 Jun 2022 01:23:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D1CD6185C;
        Wed, 22 Jun 2022 08:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9DDC3411D;
        Wed, 22 Jun 2022 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886181;
        bh=P5mdURKMr+mRkZVjrQMgOzOhTCZmcsEXIdG+fjI0jTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fdTUSaf4cpnmn+fEVbYhHTt7niysFro6D1GYt8LUZ6msmpcDMJrC1WVf5c42FtkPx
         gNxq1Q2asjSHeajMz/CM4K1femcsvw6rlUZ1pKtARiJodYYR4PC9pGzOH1VqFixIGa
         vKsM4IvE+NGvSwnMNiB0puo6FKRDbA/lhMdDTKW+YkllUkMr9odjJxBMxWZfXDUtLU
         lk6Y6DAhdOZ6KrOYaUlA+tx+fZIIKbIqWHTNJ26P8ZYonklI0c8b01vGWQYmdYITlx
         PUQaNYY51EQKI2hK7hIxWWzchCJnfPZLCO7uA5SHk5wvWrvxjtMha4KNj2QATota84
         k4prYbuF0fjyw==
Date:   Wed, 22 Jun 2022 10:22:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Message-ID: <YrLRXMSZvTdLNkDQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <TYBPR01MB53410E99F2A9D783FAFD42DBD8B29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Jr88FrY4P3CI52rY"
Content-Disposition: inline
In-Reply-To: <TYBPR01MB53410E99F2A9D783FAFD42DBD8B29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Jr88FrY4P3CI52rY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

> Hmm, my environment [1] could not reproduce this error messages.=20

Interesting. I will add some debug output to provide more information.

> based on renesas-drivers-2022-05-24-v5.18 which I made the patches.
> Perhaps, should I test on the latest kernel?
> Which kernel version did you test?

renesas-drivers-2022-06-07-v5.19-rc1 with my Thermal, HSCIF, and your
UFS patches on top. I pushed it here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/s4/ufs-=
experimental

I'll be back soon,

   Wolfram


--Jr88FrY4P3CI52rY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKy0VgACgkQFA3kzBSg
KbYqYxAApd8+WuAKHQsQuwhjDcF1HQ5argTIjceKBbQASp1lfI31BOiLO7UJ/kcD
4XNGQzvrKaeZcPImu418PagFPpRnjM01k9aQo9p4DyKdIzshfkFIfIbmhMgqAfFQ
9wCGDDFZT4KVGVxKBvTLOqgabm4wM1qxOVz7hTD+I2uX0E67A6LVg4HWfB0wXRFC
Ml7bXy+XjAVNX8Bjtu/Clmpg7QAf1GaJt2wPkVF45PL7POncxlyUTi1dLMNWvDtJ
surrOJ8sc5XBJDtbKBcyYfHCOuK3tQhjYQa72hSC5ePtTDT743xearc7y+Xdaay2
W3jNbFqREz/taAQsxc0H4vcr4EIcFpiiDhJrSZcTbLvWfHbRa5y0Q7idCJ4l6HPB
7bH8a+GAUcsQsrsUo3y6K98PtMsRdfMz/5QclwMVANnj+46iFjTKsNOpVt5tV0ME
M9Ir1Ai9zcmUVLcPMHgaHvXP5kAGQEktaS/CNCi8ojkxJqEvEke6W/OD7DljLbJG
Y4MPpbb2JFGfUSN7tsIt49JQeN8qXLjM1upHgj0Pww/dwUR0w84s2zbl1Cxwq58E
/UM753fcKfNryKMU72mBuCQD+zWbATvPwVN1MB1tyO6P3LzmAd+rH4QHT+47/MP2
2AFo4Nrlct9BQ+UYJ5ytJPzOgZI+57YmeVJS8UXrCc3OVrLf9uY=
=cyYy
-----END PGP SIGNATURE-----

--Jr88FrY4P3CI52rY--
