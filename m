Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6366C5F9B13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 10:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiJJIee (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 04:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiJJIed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 04:34:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDCBF5B4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 01:34:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A73D60EA8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 08:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D0FC433C1;
        Mon, 10 Oct 2022 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665390870;
        bh=QWHYVQEmrjfUVMNAL+OJtESMAzDJL7T84+TsLLLH1vs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a2m/bm00Iqo7lSHD+FWX2IlJOi1cZNrhfgrnataxnfEdXUYSnUO8Y+ZI+9mxDzcKD
         x4CufKNM9mtPI6Z6xGOhPX1rzuqT4EEIX2mA7WyiAoZxXwMNv0a0cN1n7CHAXiUpkZ
         8WaK1oIxWrJSp/ijN6zYQXzPXqOQBSUwS+5w/anXrSliD3YcsbrxB5jndnvxEsxX9T
         +6WqQP3tv8AK94Ms3qYH405WUehLdnAbG7fNcxHJjCJLal3iC83cCYxD021LtUl3vL
         RQD8EyWv9a7rDPaVrhBroZlQ1BNo9IdjgUuEIUGFR4+J+Oz/5zddYZHpEeEQiBXZE5
         KNzuuRqKxc7OQ==
Date:   Mon, 10 Oct 2022 10:34:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        CongDang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Add TPU device node
Message-ID: <Y0PZEoNlxyCg+O6V@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        CongDang <cong.dang.xn@renesas.com>
References: <cover.1665156417.git.geert+renesas@glider.be>
 <b98acb22fdd1bcc6a9ca8a4255f85e04c571975c.1665156417.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wFJ+5ZKQSh3Qq9gH"
Content-Disposition: inline
In-Reply-To: <b98acb22fdd1bcc6a9ca8a4255f85e04c571975c.1665156417.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wFJ+5ZKQSh3Qq9gH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 05:34:02PM +0200, Geert Uytterhoeven wrote:
> From: CongDang <cong.dang.xn@renesas.com>
>=20
> Add a device node for the 16-Bit Timer Pulse Unit (TPU) on the Renesas
> R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: CongDang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--wFJ+5ZKQSh3Qq9gH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmND2RIACgkQFA3kzBSg
KbYOvg/+LuKzfghjOAtDKR/mqpoEkgLA4VAA4W7h/srX5A5LjwMleOgcdlBEtkr1
uyT7kYYVx2GTLx9MGaM5b9tSujneWwh7FSKA08kUJCoHhDAEEbUMwZWbcwg1XQvx
n5cYAn1ZaBPAWPj+iqfQCCtvG1jnFlaMpUg8XRxncXlux3VN6T2ehiyr9CgvQsYV
wf5xsejPytpfq/JwsdWdeBd+7nF8X+PNnK0y4DpcnAyb8s+jYX6PpoXAJFwsE1ht
otyEy++dLhxhB54XSLGadPQ7moEmy4ye/wkxXgryUpBJnjnvuVCuu3fyp+974X+e
nmCw12DNLiYuQpE0XHyob7UtOZ5RK9v9A3IJcm1Xo5CTMQlJWMu7015w6/+iivwI
EVgWjjnRMVeb6Bme3O9TS3NMKbr6A8+wzcEO5AYXT4/KxrrOUxE0CzbOfCPbOSUv
aZn5SP2F3EGhwOTifO+XXQeLtjR+EFk1xYbAAM4BOck/8mSvcWrSwk07I/80JC8z
PxXW8Y57gQUMzc9w0We0guMsH0IA9Ovp3hI/VFY41IIaLVSowL/vp9OSMYkS/HuR
/v29fKU6J+IhAuoGbqx0IUXcuLaEWNvUqzlN8qEq9DU/JI+eO21GmQQmEvxxa45J
rI9chdPgYaqf8lY7jpHrPRx5iITP941DycmDkhlvGN2BfLZu+DU=
=SYO1
-----END PGP SIGNATURE-----

--wFJ+5ZKQSh3Qq9gH--
