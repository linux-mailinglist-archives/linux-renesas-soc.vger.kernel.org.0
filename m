Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727BC6081D0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Oct 2022 00:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiJUWs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 18:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJUWs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 18:48:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FBF357F5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 15:48:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1318061F97
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 22:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DD2C433D7;
        Fri, 21 Oct 2022 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666392507;
        bh=m4IOQYlWHWsFZY0sBAwdFiulH3RQ05BL/QyphpCPOxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PfPOR7eyzqIv/M5MCY5o0TPfNLbYhrWXeERCWH5CqddWRHthH75BU/yXCa9e7Mq7x
         ULMmws0r7vk6aGueAJGhlsZ7nQOpGjr1QDw2L8OwEBGwGytLgGHdpsJ6bAzX5zlu6T
         NeBmQvb/BFx6CVvbbapQw39Cgx/ClsmBC9/YWGP1Qd66TdDEFdZlRPwLcyjFEyIJx9
         hsp9afSGb3Wcn0zo14SVtqjbhXUxXveMbFLmQwJPUdDp4NGcNcmatVZw0G0s/lyATI
         aSovbWPRj/7zYaJBYWQQ8mQmVPF6criF9cIF+JiR1e/QtuCAR2THAJCKe7LidBMI/B
         TeRXnpdbszS7Q==
Date:   Sat, 22 Oct 2022 00:48:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r8a779g0: Add remaining
 HSCIF nodes
Message-ID: <Y1Mht9UTzRQ3qL6a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1666361314.git.geert+renesas@glider.be>
 <64c15b2d13439b2072cde0b588a251cb54f7dc01.1666361314.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RhPzblQarArW6CEu"
Content-Disposition: inline
In-Reply-To: <64c15b2d13439b2072cde0b588a251cb54f7dc01.1666361314.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--RhPzblQarArW6CEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2022 at 04:13:05PM +0200, Geert Uytterhoeven wrote:
> Add device nodes for the remaining High Speed Serial Communication
> Interfaces with FIFO (HSCIF) on the Renesas R-Car V4H (R8A779G0) SoC,
> including DMA support.
>=20
> Reformat the existing HSCIF0 node for consistency.
>=20
> Based on patches in the BSP by Takeshi Kihara and Vinh Nguyen.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--RhPzblQarArW6CEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNTIbcACgkQFA3kzBSg
KbbIFA/+Mr0LFEgwsjC+wEr4N2CgPmOR8gYn1FM+kZ3sUF1ikhu3t5Vaqrml+a0k
D/a+yD8rAYXtwyOa5offSNeM1+Y4E8dt4Lvr+9qVbpg5pnVmzwnqhqac0mrj6ZQb
upR/O6qHDg2rnEP5YpMlFYeKIq7z9QeiUOQ4fAB1Wnt9NqoxYrsgND3ZtOVBFaW1
SohWSOCXgo0zyTo/CIAj2j7CmgGoDqxciwpiZ96LTYGc7qgQT46eAJMdYjjcoIXr
6cnWYbltFyVaPRgsGirmpwyZxNCSyHBRvoxobeBJruklbONg3xNDGc8CkVwaUBK+
EH6W5bLYmJL1H0eiVqEd9IH7G9bJ1rKQ88ZvqkmT8x9t68LfQFzXWJ3b3Z6OJW7B
Fz5Rbsmi60MYv9Ud1nFbKeNhjpJmSjxPCYCyE2IZpFQ7jOLVPj8ti6BmrrUuuQaL
23Dzxs/bRrXVi7vnwFSI3/J1m/UHUrp6GF1S9IqSCCz05Ro5aFMyePhOEEdUSTQ3
ayDQwbw2sXkJMRphPpqwAY6MvdVT6Iar6ZAlGBRtmzGY2dQH/bmUziI++RiGUDnn
5q+oSJ4T0XPXpNEI3StJCkGQjcVOkAIdV7bBtZSituxzeLHQq2GSnjnv1PnO/ux6
K7CL8Ok0dH8tCEOTasyrXvNNSajcX4YvPBzJk66lk3hjpmziIko=
=AlhN
-----END PGP SIGNATURE-----

--RhPzblQarArW6CEu--
