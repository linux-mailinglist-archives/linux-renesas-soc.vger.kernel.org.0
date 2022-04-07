Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D359E4F769F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 08:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbiDGG6j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 02:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiDGG6i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 02:58:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C6311C35
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Apr 2022 23:56:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC3A361D47
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 06:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D78C385A4;
        Thu,  7 Apr 2022 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649314567;
        bh=uUFTyD2IMna9R3L5k2OJlAy92niSltT9U+MjcHCzj9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rCQSifOGZe+dKELayk7hmZRP6emkB8TDppxmdpNwg4+V3aCtxom1TT1IM8/08YroW
         0GCSxyNTcgFiTazTNdvcBpm8v6JPZKOkln3y1jKNEGabR4fedBEs7kVjMUatTQbTRF
         1bCCIkdnNSY2PuHXGKx6AYXhjNzva5satIS2xq/iQIeuacGGYyrimiC27sEQs4E0cN
         +3b1TTDd8rUGO67e4dErnMxeD7sTt6GV9i7Ri3gTNbwhl6dJ40qNOtpb2TASSJ58ys
         Y07P0Qu6aGzUALlhyPkIB8vH6ZX6Qh5ZV0ZULXX3t9M/heBH0AgQPa7xtxKWqw/l1M
         4xFUl73rI9AMw==
Date:   Thu, 7 Apr 2022 08:56:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: draak: Add RPC HyperFlash
 device node
Message-ID: <Yk6LBL/pRCJEyCIU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1648548339.git.geert+renesas@glider.be>
 <0f3d3018ecfcdce1bce67708708a6d3a98368b10.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wYS3zUM38YAYdygi"
Content-Disposition: inline
In-Reply-To: <0f3d3018ecfcdce1bce67708708a6d3a98368b10.1648548339.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wYS3zUM38YAYdygi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:20:02PM +0200, Geert Uytterhoeven wrote:
> Add the RPC HyperFlash device node along with its partitions to the
> common Draak board DTS file.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good and builds fine:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--wYS3zUM38YAYdygi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOiwQACgkQFA3kzBSg
KbYMBw/8DO3F4HZUlMWVtGZj92IXqpWSr4JmKWScFESs6P0QFwtCWl1kIKPb1Gkf
IGHUVQW08oa5gRyPHph/JqwvscbqHiyCUCW4icZ5MbMdnyO2S2CiIth8o90qezzo
mhO8FfAdaDEWlb+fqVcvcVQyv5sy1JL7GXehh4WlyuiZpoX3sMnfC0r3nH9xZE7p
kIejKxm5hCbDhCCK980meWeHP0LsCSdkee0BdTBqGc4Tdbrq9Z1zKoElp2zUaPE2
EvB7lKUFBaXvHcxnQfOY29w2eH3SWWKVmPn5LOkxpw/B7jkCQZnFwXlo98Vz3GEg
IxfGckW9qYIdq9P5SIq5KD6Hnl79GVLPH2cLeVCSqrjPPZ9W3cDQHB9ypFScYhOe
vSVcv0e3uKhCBt9L+9t5Q9hACdoR4v3E6+77zijVOIapV4KjIn+cdgNTgaulDfm+
Md74xVjzUpFSeb+c6jCk8fnnbMIfzESTYPo8nvZQPKy+1lPNDZhxyfP0F1WTTDuB
DWDzHs5K/AkQY0Xy6fJZ8k4wX+V/sPvHwJWUh4D5JfQKPCGsxDxuknJIUYtc/z7o
hEjzLO2Bhk9kdRJBmgP6/yoWoL7Ioj+5hVzGvsyUSAs0jNpOZLCOgb6ad/giGUvE
UC0fo7mAgP1xYYtnAAl8kXqzpM3PvlZuPe6Inmb2hKVBNTGlIgE=
=yZxt
-----END PGP SIGNATURE-----

--wYS3zUM38YAYdygi--
