Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABBC5704A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 15:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiGKNsk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 09:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiGKNsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 09:48:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901656173
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 06:48:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A90E614DB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB1FC34115
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657547317;
        bh=mJHcX+7WiM7v8P7izHJUWEsXCGCMLtqR1j4eJWiXdB8=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=hewQVYj7vr1eAsOTVnozGYlTKTaVsL6XM1x2Wcd5eoGie1hvb1nsNr7hsVVef/o/w
         XH9U3g42K9fae0gnV3S+DcucbukftU+TfFTSPXdRbvuMEjgFTtBBHfLUvSaNx/7w0q
         KR/HB8i7oipZdlvjc2KAl6nNHpeoBge/c+oqjy0tutZZD+GFZdcO09r0ovJxF0vT4A
         PEUE5V8OkHUew9qrXQJzGpkHmR6l96T027A5UMzmdHiSe3BLcmyrYw1yV4EQ7oyfyo
         bjMZXAVwDl6w9nbP1snHMh4OvzHaHkPZCY+fzzzdN+4UOQMNH2M/LFUKQDU/K29LWD
         rRxzq89EnbCcg==
Date:   Mon, 11 Jul 2022 15:48:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: spider-cpu: enable eMMC0
Message-ID: <YswqMdLm3oWhODYU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <20220711134656.277730-1-wsa+renesas@sang-engineering.com>
 <20220711134656.277730-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dXa+dkUDEQ2tYF7D"
Content-Disposition: inline
In-Reply-To: <20220711134656.277730-4-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dXa+dkUDEQ2tYF7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2022 at 03:46:56PM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa@kernel.org>

Eeks, the author should be, of course:

 Wolfram Sang <wsa+renesas@sang-engineering.com>

Shall I resend?


--dXa+dkUDEQ2tYF7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLMKiwACgkQFA3kzBSg
KbYmHxAAjlM4WokApJ13/y7GJ3So8/TO21mWmWPsEGtzU6ruhZk5uS8C5z57UZO4
hc7euQMGdhB1+5BRVricNfxWU7Pmq1P5UU1jc5GEHNm2FSEXB9k2BHBVI/p8i3VW
x2Ba84ZteOuNj/VbpP0KHvgLYKaRtYeHKznibhkFz8PQkgeMTjwu8mcRT9EogP2l
K/HvamgVcL+HnwUR5/5ySeZ9D/rsSbxm/O4hvgsIc/tcgKwvIBodGL/HNmqh2nBp
VO/vcX854GAvLy7FI3/+wMq+t9kvTYscimLOPPRRnjk6Y5JVEsl80jINgA+0DE/O
WgtoJ1BgaWnlI5d731AuwWMbiKddrQGLul1oE1amUHmilQskHqYAtf6urbAbqF7u
wICLCP6e1AUSUoRzt3sOCZ0pOQyzEQFyzopkhUlHIJXifG82GfWIu/HcdLwjWm9m
JPfNT3kQ6nkKUVyRUZkVTzXInaH44uxOcfafEtDdmVtmw4o3YKIiXdoopA5QD0SG
tEi1I2L+36Oxi0Oeu5quKMnm0C3ZDuhcAz1E6Cr5Wm8q1M7UOKO0zr/vg2mdSCTh
yxR5hhsPeuifrJkNfD+7qO1lExgAMfU6/ZcCe8zdcqC4UewjQX8AcIO9LmKBsi9k
sb+UrnmTOinVqiCz8JqKX0Y+8CrAR1QqxuHHSXQoduWhmTGOytQ=
=LrtN
-----END PGP SIGNATURE-----

--dXa+dkUDEQ2tYF7D--
