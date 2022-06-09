Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A335443EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 08:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238102AbiFIGkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 02:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiFIGkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 02:40:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE7D20192;
        Wed,  8 Jun 2022 23:40:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D18661DAF;
        Thu,  9 Jun 2022 06:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE711C34115;
        Thu,  9 Jun 2022 06:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654756802;
        bh=RfZmSFOXqZmST/myC58Tjyt/hcaMDo5KndIG0RdEnBw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJlrye08wJwuu05RSLxAPQe+YaXP2inASTcqF076zbWfnRWJgn0/VFiag2r/S19Ft
         m/9eeFgRdjjtxWC1uDTgNtsxHxosnSQvrB3nVR/PNdnVEiOHgp4daFOlksiSEhUMd/
         hN7REv9A8jRTLjL1TujgqD+Uuv6tRhPJmp4c0Qv++F8j18+uzMj29evR0aUWbWyxSt
         xQGIbZqWYrOsx5F5d6KK/Zxc3fs2p/3Ys3a2KaraVKvAbGAsncOLNsY7Hqn4WTQGRC
         MDoPpzFSBR34Lvydu7dOGUltYyL/RPMASabaQTcXnkowTTSKyP9E701wuTHIpfjyw9
         uA7/zMfv3sogg==
Date:   Thu, 9 Jun 2022 08:39:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r8a7740: Remove r8a7740_cpg.reg
Message-ID: <YqGVvub5vgzKAZby@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1654694831.git.geert+renesas@glider.be>
 <7ec676bcc36ef1eda02c2db328c527fc5fd44e99.1654694831.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nI7le+5fWhIlmtns"
Content-Disposition: inline
In-Reply-To: <7ec676bcc36ef1eda02c2db328c527fc5fd44e99.1654694831.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--nI7le+5fWhIlmtns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 03:41:11PM +0200, Geert Uytterhoeven wrote:
> The register block base pointer as stored in the reg member of the
> r8a7740_cpg structure is only used during initialization.  Hence move
> it to a local variable, and pass it as a parameter to
> r8a7740_cpg_register_clock().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--nI7le+5fWhIlmtns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhlb4ACgkQFA3kzBSg
KbbDARAAqMmUUs3iIrPv9X6zo6hlrqOl3YSLoBIl6LETipwu6v/hk5ENoy0oID6u
yJcAiD1BGJ6vl5G96X8EXBFRk2LqsD0kkStN99wQwhiYJx0F3mbwcq0mSkZrbLtO
HotjT1NqgOs3BXhqvjXZH1QRKWXGUhI2kbKnjnNzDXf2ozhLQpyF2UDziAorGk0h
+HDEQb+Y0jSpCGjb0hAoRZ0oMg6C4XlAPV+ZDyCuBbSbV8Gg8Tt5oib54OwbaiMO
i1NBRztg1X+d0Oo0/1wG9tJ611368m8HafePKkA6HjNE3S2/+tZ1pgHzJLfKUvhx
hYGSSMGcBJNlPEvTmnBqMZi8PkFCc8qQAT8QUAOl34RQr4e9ETGvKuUkaXCXp+CR
Kl9BDsdeTRAyUnR+ciWI7Mc0VIhVe6rQ1Iwl08swtTMSNavKruEAHq6ny8ucirdU
M4IAxxC9/TXPkvNQ/RXjOrtWlnB2ktTLtYvHkCTgticY0tI6KcNNClS0iDMICFsq
Ml0wKSAxSf5jPPEpAJs9GIc0uUM8Ndx+w9MeuMKgwUgJ9zeIeafeJzfvZObkJns7
paz3yb61jcOdeUcAx+LaGGCZ+CFdUxH70uc4yMhslu/aPxB5OxcOq2qH9Sp2wn+C
j3c32W/I4B5G12hgkEcB1UgCLXUSvctnpNclqqMgRtjHmCALySM=
=MXec
-----END PGP SIGNATURE-----

--nI7le+5fWhIlmtns--
