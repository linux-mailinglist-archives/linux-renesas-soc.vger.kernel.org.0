Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB985FD8E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Oct 2022 14:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiJMMM7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Oct 2022 08:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJMMM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 08:12:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DF2F53E6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Oct 2022 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=V3ttPE0OWRpiM7P8jLqcMA3oC3ic
        nW/le1crg3SvzN4=; b=ZLvHdjykFpJhYQxeAANbZ504VP9SXqFNeWgAO7zo4OAn
        Mlr/6G17SwhKvUN6Wq9zUo/Ul4SABK79W7pHWXtbula/IfTZwmvtc3xb+VPGu30G
        4h+WZANchVtDy+2TWxwKcK/tU0ZmTjaJEJpqXMwAwcunEj7rQV5LH6pBl6z5jos=
Received: (qmail 1098858 invoked from network); 13 Oct 2022 14:12:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Oct 2022 14:12:55 +0200
X-UD-Smtp-Session: l3s3148p1@mJ3XbenqXYIucrUX
Date:   Thu, 13 Oct 2022 14:12:54 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add RPC-IF clock
Message-ID: <Y0gAxsDGvuGkcD5h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <f0609c82e742865be753b67a0a6080f193f405ad.1665583328.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="avvEzddlTE9n6nSi"
Content-Disposition: inline
In-Reply-To: <f0609c82e742865be753b67a0a6080f193f405ad.1665583328.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--avvEzddlTE9n6nSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 04:03:44PM +0200, Geert Uytterhoeven wrote:
> Add the module clock used by the SPI Multi I/O Bus Controller (RPC-IF)
> on the Renesas R-Car V4H (R8A779G0) SoC.
>=20
> While at it, fix table alignment in the definition of the related
> RPCSRC internal clock.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--avvEzddlTE9n6nSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNIAMYACgkQFA3kzBSg
KbZ4BhAAl/tlJvPwC92SAYFBB56lJm+JyyvOB+zZ3Upi3u14k0T9Qrs9pBQW86jE
U/aOks0a8TB4IqOdtBsxlYbtRypvXowhbCBDa96rQGAEsneLGyS2YS9XILrAieCu
Lmwma3rUqzFy+dzxYRD0K9kfJjlEyZohG3lrBgUTQBCh65IekrAXcw35sMlZxKt7
7phgJfEV7Q3BMTDn0CbekXs4qMznell1EE0eguDGFGIqxOcdkpZKweechyLTeyAj
Zo7+JACOXPSg2fLQaZZBb1bQCMxg7byoj5aBo8OStjPbqY5AS8op2AD4rNhdMRii
zsFJl6eKUQSWQLNPj5DcXXiKHQcLH+RVMmRWZ0BlT3eAVn1LXG3XCRwoT8Ci8DAn
XV/f+QdqwBqzmHjLO9rn0cDImMrnC4NLGWpSa1ck47N9PLkwfzBQ+sZIVDzDoVrs
7sNxMXA6uT8NhrKKaNaC2FyvTanYcDNzp3CkIVUo3cooktL9R1Fxy6OuaJ91Sscx
XkHn9Lw0GT5KVIxqCpDnGnsLyyKLGfljWHUzpohmamFlzUvuD9H4Dqg/mtXTCfeC
FErTEkHhiccTT4lLs/vqoT4rOuydfhQ7vgbDtdS3roLK02cylj+LpMOoVlAQOjIj
jTc2+WtBWWMX7HQ4frpjiux4/WbOp1xh2rzhVnrKQ/3dO9I0NqY=
=tazu
-----END PGP SIGNATURE-----

--avvEzddlTE9n6nSi--
