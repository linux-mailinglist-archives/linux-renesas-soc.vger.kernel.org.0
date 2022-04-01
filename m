Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D7A4EF764
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345984AbiDAP4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349666AbiDAPRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:17:24 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20798DF0C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7Ug2uL5ohGsqoMIYzk2mt/x/mM6K
        Qi9tWaXz2iDwO6Q=; b=WKZ8pk0NdTyAcN2y9e+qYKZDZikbNAo022jzITMe7GxX
        j3hrh8Tz3zmUXpujn3RhSHgkyIeOfPQvLyoH6osRaGNbGA5UU2X8X01u9saM6JJa
        4nFmzshWildwpbG5b0k07vM6p/Jegw49yb4HDOJtNBcs/yEi+m2T5SYpAamDqyI=
Received: (qmail 777783 invoked from network); 1 Apr 2022 17:00:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 17:00:20 +0200
X-UD-Smtp-Session: l3s3148p1@if6JCZnbLKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 17:00:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 6/6] mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk
Message-ID: <YkcTg8j9KCDXKvM9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
 <20220320123016.57991-7-wsa+renesas@sang-engineering.com>
 <CAMuHMdWdtCsfVHYi4zqAMgN9wzDmwFpXs5VkJG4G0iXvuhSVKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fX0erNqFCYR3EWlb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdtCsfVHYi4zqAMgN9wzDmwFpXs5VkJG4G0iXvuhSVKA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fX0erNqFCYR3EWlb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If there are no quirks (yes, we do have such systems ;-), this will

Wow, seems that slipped my reality :D Thanks for catching!


--fX0erNqFCYR3EWlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHE4MACgkQFA3kzBSg
KbbEehAAtf+TYw+cBp78KrL2z+3m0sLeO6m2QzfA1d0d3l2OZmL5zq35qvAzVoWn
xidZdglIHro+XtcwOg1nDmjVIn2eeybbeSBkIllMwxtNoOirZQvmbBg3nbuKwh68
XnAl8C0P7+4J3miSvoN6ms+1RYWQkZ/q/YQ8byOjUk3rEN3BLywGOO/V1O/0mn8p
mFaxrQqkNV/PHNd3+Gw6mQweqS7YcmIVoCFxFRcjZ6DrKpSl6bAM05kEbwQS3HeJ
FjUiAbff5f5Lv+3NDP5mY3F+ywtx8aSpfAjkiCYCalriCvzqfqOrlCbMs2mUJDEV
ABlcgsSEfyBIx+cb6pO7BAvIn9GWQv5tMXA0cT6Dt3rWGATp9C4mn+gS6GV+qf/M
kEk+4BcjfPrz0Vz59aPZx6smLLJ4SYyx6YUINv5rP608IdNRzUaAAfgibDq6jfuq
Yj0S47SgGoT01hphpvhJNTgIXNoeUowCDkirUVn97/wh+6EKHTP8Sm78i/0JcFIj
Ojo0MGkvxPz3IovrtwoCiaSsZk4lKPRTL6WaCtJAUGOjCazPar9ziNwrzvyBU31k
y7CWbIywZJyb+WdJGkRhfjnRSIo2aCepNUBH6foBPJFMkwlF1nxkAjBhichatSxv
7pj+vglfhktTgIoK14qDnypgqyAZpbyG0k9sId3fKxmRACUBVIY=
=iA70
-----END PGP SIGNATURE-----

--fX0erNqFCYR3EWlb--
