Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F34690E49
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 17:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjBIQXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 11:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBIQXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 11:23:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC6B29413;
        Thu,  9 Feb 2023 08:23:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8251B821AC;
        Thu,  9 Feb 2023 16:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29682C433EF;
        Thu,  9 Feb 2023 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675959820;
        bh=NxzszLiFJrlfv7frmHCuQ/KXw3wkxnOtKCKx+C5wsnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uXD0JcFQejh95A3qdTjuihZ83eLqmksaXpCKAfCQ8S3+uG8ZlLvFMjUC8czonD50c
         7gKVvhhgeb//J+4M3mLb13zJaDT1QH2uiTxt1upK/XSC4I23CbcshOdrO3ndvSnwv+
         PcsNTe2b5Bes9zTSPtAR7CLEARrQAFhUzEevsR5wv2LdFcVdUekNpg8iLrjsB9F8DP
         oljcrL/kldl07yHE9GGSahiv5xtITG4JgabaTVtwimCpvbrdXv53TmyZMNsIpSkJiZ
         hKBY01fYUMFNu1vVy0u5bhxlsLXdZKwix4PCIm9BROTNXPTNVPP3w/1Y8ojSDNr7kv
         fiFRWEoCWb1Yw==
Date:   Thu, 9 Feb 2023 17:23:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779g0: Add thermal clock
Message-ID: <Y+UeCSo7y7nYkkB8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <59461effd0d9f7a39e0c91352c87f2b7071b1891.1675958536.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lagcHRSotVOUkzti"
Content-Disposition: inline
In-Reply-To: <59461effd0d9f7a39e0c91352c87f2b7071b1891.1675958536.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lagcHRSotVOUkzti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> make the new value fit.

^ leftover?

>=20
> Based on a large patch in the BSP by Kazuya Mizuguchi.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lagcHRSotVOUkzti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPlHgUACgkQFA3kzBSg
KbbR5g/7B8U07CumByMno8Tf2TDi07xfstRRdszAPTO0xq6n9QAf5gzD0dSTtiS/
B1bsWx977wKidgSajaGHhEKrHNFFr4ijk/x2+tazhas/9CEtDXCCgT8bNgCK8cX4
c2LJht0zl/rJV886VPV7mu8ToYUNevMPpUVyhL+GjNnKE/A8CqVbo17nh8ofQkyt
s34qkitdi2loBHEpZl87dH4L+zCElP7h30E8fizwyO4jnZ1orxjhmu87TiQNjodV
nPAlkgGeERTnDWdD+dgnDhBHyxikaoJi9uZPCRgpU96+918scHrWsdO67TichDue
NcFC+hN1v1wH+Dlxg8WAT7jj5dpw05lfCvo3chfA8y2D1AiW07tQYEOo6YhQC5Ev
3EBKk4+ki2TwNc//zxVcjwoCKApj6mA18FKhH6UTUL8P1KPb/5NL9tZdlsYKg+v4
nTcKCOOdlq+XwlP076ve5wwU1b9tykvtNvi4+iQOdO6D4SgI1CIrlxuymgm0aznp
R+HvJYyWXydKJ60khUEi5fVr5xwXUOCc05/SdzP5qhAzuWIKjO/VOzyvZnXqC7g3
Q33gbx4cf2MwWXmtAXY5ra88yankKBEtSSOX0IoHwtDuBlleP/nXmB34oNbUTh6S
jWMukyqVJYSzqpJFrcLM3RpJZfZJPD3cTR9BsXi3vmCFR1kFj6s=
=LSKL
-----END PGP SIGNATURE-----

--lagcHRSotVOUkzti--
