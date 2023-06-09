Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B9972A0C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjFIQ7B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjFIQ7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:59:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4652B3A8C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:59:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D57CB6596B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 16:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E215AC433EF;
        Fri,  9 Jun 2023 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686329939;
        bh=rsbSKkOvULqeoBTY5vOOrUxfMTco9CnFkGzCmWjBOLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=klrgAB+caaa1ZMEtDGBItTahIMO0ShBQVdjOGMHaFewqckuLTKa9aV3fwOLeeUuBN
         S2cnG0Jgwcrj+pODktPiC+oVZFOz1I3af3VN7smGwYPPWBrA19xAuX9cARuY2FT4Ph
         VxR+zZJ8pPz6+BtEkx9Skm4mcqK1OB4mhhom93CRtZMlXqD6WxNe2lbVVzvSS8Shn5
         bD6FLDNPLqrhGUnGfLq527sZpSuZdkZJyhVzwYZqJQP8vnjS6LAf0GCbBCaO+p9GP/
         8KHwMTMOlcrKoa0Ir+XSAtfXQNwtRVtrrjwrEmTJD8EughD3upiKIGlSZTeP+aj55U
         3u5as3n+9COPg==
Date:   Fri, 9 Jun 2023 18:58:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 0/3] Remove KZM9D board staging support
Message-ID: <ZINaUKmz2KoGbtIR@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
References: <cover.1686325857.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yLesOz+unkP/1pAN"
Content-Disposition: inline
In-Reply-To: <cover.1686325857.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yLesOz+unkP/1pAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hence this RFC patch series removes the KZM9D board staging support,
> together with the EMMA Mobile USB Gadget driver, and the legacy EMMA
> Mobile EV2 clkdev registration.

To make it super-clear: we only lose USB gadget support by removing
this. And both, board code and driver, have been in staging for years,
hardly altered. The rest of the board will still be supported because
the other drivers gained DT support.

I am all for this!


--yLesOz+unkP/1pAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSDWlAACgkQFA3kzBSg
KbatpA/+Kr2jVRHyWwVdsI6DMNjCMK1XMCTcSxqVzfhL59hWn80wZiv+++MhgoXZ
7ROAwFa6bJKZP514AnlReMQ9Lsu4a0NOCarbkBKXMvxYh7xxjmf1sIeIoZoeJgdo
Oy6yVwYh4zuBVomuiNtYcx1k1+N69PbEyIkAQM89y753fPieZTXziH84bqsbuJf8
ynsaDhl5mXJ1+bA00Wi7ZkBWH4ogEFi9FlpppCEIcgqJUqrcoJwFzXBLnHidXnyc
aiGspfuc1xeGuZRcZ7yzQ2D7F/nhaL+PlLJ5ynzZrosVMaAOAmOeo5CHlryW8d4d
lYPa3bm4l3lJAcJUdeHYgGuguBBzYb5DS4zamfPgDrIeO4BhZUUElW48K9hdD5HK
ik/EhyeJo1L5T8vTN2W6lK86mUN1DzKa+JPZxpIWtIbZIs6eX+N0f8x8yVq+Z1JK
Y1pCOftIlgnMp/gQXTyvDsfPnkNmdWI0OFotVoJmzZqAJs3I8MfZnkjlgyYniknO
j+ho1pdZXKMmXIUdvbqd31dAOt2FEsZ76BgnSSB0nYBNUrzG9c4HCKt8WgAiCWZN
7fSu7bdFnbyFhmSr+8uyb7TcmWA4ikj8+M6vXQYDR+JSio83/BpVZJo3Voc79OUh
sKUusdB7z5SCSElCAEvvAQVCvwmWKXTsap6E5kXjQ82lyL4HiSo=
=JM36
-----END PGP SIGNATURE-----

--yLesOz+unkP/1pAN--
