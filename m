Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E087A8DEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 22:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjITUlj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 16:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjITUlj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 16:41:39 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B1DBB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=NwLd
        DM729IUnxL+sG9WEVhZYu4wD1R6X646ABEnM18A=; b=aKXlRgoeB6uklhgFc5jG
        DSF+LAdHGNrxuv0KyakofCzFTum9/3fwQxe/TgzQjAcOZiS0ex8rZhhuyVndrc+U
        wO9Z8IvuHmxZuzFU/xudYLFeEbYI6UrE+qeazjP3hp9yX4NJVXvFr/sNRLFyGsW3
        Rzw1LFm29jTF5zrLNdTzuLBOzvuyQPK2xaO1occLGgdzQIR1J9Z0YJu0QTtLnlyf
        V3sWQmyqL6JZwN67lpD56uz3QjHQi2A3EsqrwBt7dPdcx8qnrL/UJRNxd5et0wjn
        o4vGAAOgY7kP8n46IX688qq2NxAjW+OrCiOaRistyP1WfdqeTAQ0K1w9Lf0+yWwT
        ew==
Received: (qmail 726670 invoked from network); 20 Sep 2023 22:41:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2023 22:41:28 +0200
X-UD-Smtp-Session: l3s3148p1@CIZXZtAFKoEujntX
Date:   Wed, 20 Sep 2023 22:41:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Dirk Behme <dirk.behme@de.bosch.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
Message-ID: <ZQtY+NHFzFBWhrZj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ch5x6OJc5VB9Vlbh"
Content-Disposition: inline
In-Reply-To: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Ch5x6OJc5VB9Vlbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

long time no see!

> There are Renesas ARM Trusted Firmware version out there which e.g.
> configure 0x201 (shifted logical right by 2: 0x80) and with this match
> the added { STPnHCK | 0, 1 }:

IIRC, that means that the ATF uses 200MHz for the data channel but
disables the 800MHz for the SCC. Because of that, I assume ATF doesn't
do tuning then? Isn't that risky to operate at 200MHz without tuning?

>  static const struct clk_div_table cpg_sdh_div_table[] = {
> -	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
> -	{ STPnHCK | 4, 16 }, { 0, 0 },
> +	{ 0, 1 }, { 1, 2 }, { STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },
> +	{ STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },

Anyhow, since such ATF seems to be in the wild then, I assume we should
at least support reading such configuration values. I'd reorder it like
this, though:

 +	{ 0, 1 }, { STPnHCK | 0, 1 }, { 1, 2 }, { STPnHCK | 1, 2 },
 +	{ STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },

And probably add a comment that the duplicate entries are only for
reading and are not recommended for use with Linux (which will still use
the first matching pair i.e. without STPnHCK).

Geert, does this all make sense to you?

All the best,

   Wolfram


--Ch5x6OJc5VB9Vlbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmULWPQACgkQFA3kzBSg
KbadHQ//a8iXBNc7KGvj7WbKPboeSd34KmV3S6ED0F89GTEtkid6Kq4Gz+SeuGet
Y6H20edW1i8/u0Bg5GZIHVHKs2tRYSLz2gHZ3RVOSuFb70ryTz/lVReOiAyb1cH+
0skVGUpw7ac5UXwnR0K4zcBcvL9LrZmarOHVRlJ8rKIeCnqivOxCFe78tsCWNtI5
OdCrvg3cqDr6JapUbrPOIA58DZbXnQ1nlr8x1xFJ/vyz2pu/0HH1NXyPOY3kiXsm
x2Vz6y15XsUA8t51mCQg3rWXq8MIXdzNnCV8V0OCoQrDXrkR2z45xVqdqb/20s1i
k7WOEmphfv1/cF4KJ4whG4t32oelBSNJwtOUKH0WY8kx1y0NKCwamrKlTAhCX6lk
5d69gITZPUwgTrNs1pvDZ7ovXdUFu3iDBMY30z65QG3yNG66jIwhou3BFAaTG3/Y
pLDfRnA3sK0/R6s8fh2Yx92pd9Jun0KslDLT9JRv1Bt1t5u+uSmL6DSfx6vQtSh3
jLTWvcHyzOozNCFw0phS31eZMXaww8M7rGoZfYbXGGRqfPkDWo1/3nC6NOs90rnZ
YTF60KEeBayGckEZNSi+qqxKCCUJlCb2dyhgtyjgUGY0H8GGKw60Upy4vxU1yryt
VktzUj51Qw9s5L7VRAYUMVBfYQRxZ3cWlA4256svoroII8HXwkg=
=Hi27
-----END PGP SIGNATURE-----

--Ch5x6OJc5VB9Vlbh--
