Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3A56081C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Oct 2022 00:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJUWqQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 18:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJUWqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 18:46:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3392793DD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 15:46:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8A04B82CA7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 22:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F016C433B5;
        Fri, 21 Oct 2022 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666392372;
        bh=3/CtKIacYgkGVElBAJx2xSmdTkoZEAljBBSEA9rVe2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXZppw/26RN0+xz6S5QfMJQqtmJm5EEVumKvWxBgebD+g/z10PzWsp4pnR53ni/kS
         5Xo5qPuC2FjySDLM7NHKQjQea1LZexlTSAluItOYxHBMsoJQNBoNpb3W6eIdE+xYOl
         tjceppiM7Glo2HRXYHMR+q1Bv21mavaaXpyX4NxFzSRVIRTqOZUMke0ZFYb2Qe6z17
         Oco0U3ctBpB0gpkqk2ofpQE0Vqwizuq07xLtmdsHyuX38kXb4g1HvY5RFsxWX/45TA
         9sjVM8aj7i0kcSrT5fQMrX+HhLiV6V2vQe0PsKkUacQ0Q42nJF9uvMuQPHG7tFd+pM
         ZPQq/LyuohZNw==
Date:   Sat, 22 Oct 2022 00:46:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
Message-ID: <Y1MhMWzl40uG9CiD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1666361314.git.geert+renesas@glider.be>
 <3f0ad7ce0fedfca2783001a6eb3eca96aea72115.1666361314.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EzBCmfVZ7JSosjE9"
Content-Disposition: inline
In-Reply-To: <3f0ad7ce0fedfca2783001a6eb3eca96aea72115.1666361314.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EzBCmfVZ7JSosjE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 04:13:04PM +0200, Geert Uytterhoeven wrote:
> Add device nodes for the Serial Communication Interfaces with FIFO
> (SCIF) on the Renesas R-Car V4H (R8A779G0) SoC, including DMA support.
>=20
> Based on patches in the BSP by Takeshi Kihara and Vinh Nguyen.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--EzBCmfVZ7JSosjE9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNTITAACgkQFA3kzBSg
KbbQsRAAqBbNxQzWPgsvlHPAvv4jda/N0cB6OdmcD0Hxo55n/ejKg1iaoPSPeBtV
5avUFoZGfannPU8oOfkqP0CcxDM7C9dZ0zIhtSgSsnHYkj9HtuPTo3NIITV7TRKS
RlDuFGbpQ2dJJ1pgpZm4pSZzlgFttkT+utUH9ZUb2VabAGW7ch4E14+5ZIe8oYbh
RDyNUne8X3rA8kkXNin+p4p38fX2XizTrGJlwmTkyLvZSD7T885vt/ibJonITpMZ
ys48ALfQPpDUmA6U4EZi0VEBH1C/n7/j/Cst1a0c8G3b4CA6DmLUY/maqgtcvYM+
AeszLECzO/xzDnHUN12NT1DWL1tJR4F9YVzv1PAdAFQzw+DzvpEOsKkjT8y7DaxQ
Y37ZWqEA1jFUJ6U1Z9uVsOcZ/WbspC+IyGKUHxbB+c8ZgtGSmRmJffZSR4+8CrGl
fLvMygAGeZDrU176cKI0LUeul3jWS52i+Xc3hbJbW7wYJ0ukqIsGxQUSPgJABqZi
pyKcQuCO3URkP+ZQksY2HXfPi8+sbOlt6fpgy/FEXFgr4yRgpXn0hVWXdnL6WyV4
igeSVAP2HKphBeO6jTqipm9orbN3kAfRd7SGCl7/oDFYQLKqT5hLjU2e/pNE+S//
U6P9GuuO3MfoS/5Z1/X0RZaLKHKvtM9cPNCC8Ho2y5TjbapCmOU=
=KGs2
-----END PGP SIGNATURE-----

--EzBCmfVZ7JSosjE9--
