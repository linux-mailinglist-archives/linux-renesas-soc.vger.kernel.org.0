Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366AB4F76C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 09:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbiDGHGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 03:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240328AbiDGHGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:06:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E968E24A13E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:04:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53BB161DC2
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 07:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A4AC385A0;
        Thu,  7 Apr 2022 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649315094;
        bh=hn7ax5S/uqrEDeo2Thbj8ownczjV5Ii5V+PkuzloSu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WBQDaaC+s0/qIuKiNgCTI6+L/o9UmL1mIcz5c5BJ9QPcG//kjH6tHGRaO9hp+fl2W
         XH8Dot3kLDxc70wNrL8TsCg+m3rueFVJfrYWgn1uYjhK6UOix2TWqWe1DUY4ZvCK4y
         /aJZ2avIRYyj2qMW7RI1DV/FF8fAt/4GvXs8yL92VbTd/MBr0CkGw6epbHE5SCRIE2
         p2Up2cZPJeryCvQ4BVRXLJn8s15ji1CFk4ta4Uy81y7Nj3oUiK6OAh1RXPoRtbD7Yn
         JkzsDjMi/IUxJOTHAFqBGk3AId/ekP4cMGroQW3oZ/OfYDayyxsuIivGgfY5yzT1AD
         Etlw9CAzy5yjQ==
Date:   Thu, 7 Apr 2022 09:04:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] arm64: dts: renesas: ebisu: Add RPC HyperFlash
 device node
Message-ID: <Yk6NEzGsi6Ihk3PL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1648548339.git.geert+renesas@glider.be>
 <b14c769f62211b67d90dbd2f127357756e6cb4fa.1648548339.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JnxY44ctbLdfwi2n"
Content-Disposition: inline
In-Reply-To: <b14c769f62211b67d90dbd2f127357756e6cb4fa.1648548339.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--JnxY44ctbLdfwi2n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:20:03PM +0200, Geert Uytterhoeven wrote:
> Add the RPC HyperFlash device node along with its partitions to the
> common Ebisu board DTS file.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks sane and builds fine, but I didn't verify the partitions.


--JnxY44ctbLdfwi2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJOjRMACgkQFA3kzBSg
KbbjDA//Uh/OtRBAHam4ETN0tL1POBuUBLOlFhcGri/W3oWftDmRRsJSqnVM9Fom
FUkF38hb3vbsMgn5qQGmHGvMT4mpxm3971O75sC4MUsxwN9hOE+YRt4F7UIYRVr8
zaY4QPHcuMVY5ucCLR3bI7sXK7AiXRHRvHSEmHsyeWWdoONY8/1Ky2O5uyp4pJ6t
Pxo1EmTf0TktNwek0NXdnpaKMN2kWFQTN6AOtLEYL4T7bIppfETEIM+J/GAgSGYl
jaHTC2PYUa0tgY4q1SPCfvxOURqEEG/xObVmce4ZMKR6VYscwRp/se7dDYcyP4nj
enXvM/ngJuxnhs/PnbuNH+zhW7GSTqOGpmvJgSXUEhWxBRJUpXBnzbz0g1Z7U2Gj
Vdn82J4MNnQGncDW0hStrbFUcSplrl5WZZnEheiB/zTd52+obyMHlAa844bTdRLY
GMoVPF3d/xAxtnc9yjDTR/hOz0l/uyfeJ8TAckv1bHpyB9efkSLOOK2nYmVRgElx
boegJzkRiZ//yOU+Mjc6HT+rFUaUr/2Udw4Np0E6elkBhObVVJJOhMzgrD8xXAUD
bIwIopOgYep40ZEOUsHmbLFhENafJuNp0bIpk8MKSRy7cJN/TZnCX3c8RwsR7GW0
i9L1Ao4HtH5TBE1W3Xl3Qh6KFPDZbepTM+ZSDJ0MiTZh3+NOKDs=
=xEfw
-----END PGP SIGNATURE-----

--JnxY44ctbLdfwi2n--
