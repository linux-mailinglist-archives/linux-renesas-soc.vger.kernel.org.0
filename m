Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8A76387DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Nov 2022 11:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiKYKv2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Nov 2022 05:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiKYKvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 05:51:17 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A16C490A6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2022 02:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=REDbwQRZqFdDNQjqxYexqOBbmjBU
        4nJmP0VHvh07EcE=; b=wyJK1FPE2f+4PhFyXzjmif3Sh3AZVc9FL8QGNhgIMUHT
        s+EB6AM1H+WyXzyE5+mco1Uo+IsHYn+FZ5pGEDWGrQF1FotvJBwx5uWIifrKho44
        DOMQpPKReMpmAbozFgQ2f+W00iqQvXQe1ipUolrU0nPqHKnzBk5iWAQNidzPNJQ=
Received: (qmail 1678029 invoked from network); 25 Nov 2022 11:51:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2022 11:51:03 +0100
X-UD-Smtp-Session: l3s3148p1@mQ5ATEnuAscujnue
Date:   Fri, 25 Nov 2022 11:51:02 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: Regarding clock event driver testing
Message-ID: <Y4CeFrBzfUkNiV3d@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <OS0PR01MB5922C23B892D938AD1675C9C860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QwTJsYi2KsUP4b+q"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922C23B892D938AD1675C9C860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--QwTJsYi2KsUP4b+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Biju,

> On RZ/V2M, we have 16 timer channels. First channel we planned to use it as clock source
> And remaining 15 channels as clock event devices. I used clocksource-switch to verify
> Clocksource functionality. But currently I do not know how to test the clock event?

I would love to help, but sadly I can't. CMT/TMU haven't been changed in
ages. So, when I upstream them for new SoCs, I test basic/slightly
advanced functionality with 'clocksource-switch' and assume the rest has
been tested before. I didn't test clocksource events. Magnus seems to
have started something, but AFAIU it does the same as your devmem tests:

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=&submitter=19&state=*&q=cmt&archive=&delegate=

Sorry I can't be of more help.

   Wolfram


--QwTJsYi2KsUP4b+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOAnhIACgkQFA3kzBSg
KbaAfw/8CHIt7LLzefVzYxJhSn6M94PFe5SIhru292xbeiDxXqYnANAmTC6qFdEs
gGt2FET45SxRyBKudVTumaXuwPLOoDg4keY1TPAVlSRUgLPCLqBbgCEPz6wrx/Wj
k+70UGWQZpE9VHc49SSJJqsI9cVsgX1LbJapYhs35UAa0SjLHDEzQgj2V21Shpa7
tq8q/fllWrk18I11av1zeOV9C8GYoVsON5FiccnoOD4UOdUE0YSH7dVPMjEsdQJc
4M4QXCmWTHtapygNN/aPwpWZnUILlXVSpbAgWZ01ZNE6g7S2tzNbvzF/ltwC4NVe
WRm7zO7mhPq7gKfe4IrHtH6EhoQrX8jgIBTry0/tLVjf0a2DlrNeLZZFhXcFllLm
JbNtefLftwR5gFpVFMfwzyAiaB2C92ahO+ianylKc8PQjGvsdNanZjHtx4XgqHTN
gMICLAe3h82J+cF+nqx4DZOyRkBY/s5ccvDW5ycN6OtWW9HL6oh4cbpGqoW1X6mn
cjN8zKtmaGWcrURrrPwGDl8ScnrZNCW46XYh/z15NcxNbbkOR+FqRZqNGy5GSjHk
3K1iczshwLTY+OzH69qLD2kLl7M7h8bShSsWLUK1y1nhyceSZqR+80lxDPm4AEbL
pdEankZdOv+v7pChM/LxGJNvasT3KbTMO8mHU+u6t1HHvjcDzkI=
=yfci
-----END PGP SIGNATURE-----

--QwTJsYi2KsUP4b+q--
