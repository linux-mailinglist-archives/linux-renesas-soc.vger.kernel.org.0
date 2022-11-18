Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC662EF75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 09:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241454AbiKRIax (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 03:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241487AbiKRIaW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 03:30:22 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A61E942FC
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 00:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RLsiv8vMrw7RADKR65FDrp6KF2My
        F8D3kUw7v1b1GOg=; b=T1u2CX63UrO9MSsbFsh9JNBjOFdtfo5GHKulnBI3/qiM
        RaVQdBLiO2pS3dGy2QkWAVfkt3yIXDXjv3b5DZbQaiZdvWTtGMz/x4XteL5TTyma
        2JypiFpUPGjCHArYWqmICaAZz3d6FzBKJxpD8jsrB8fxWtEQaqbOnM0zVOZvd9M=
Received: (qmail 1648810 invoked from network); 18 Nov 2022 09:30:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2022 09:30:03 +0100
X-UD-Smtp-Session: l3s3148p1@b3Ubg7rtFq1ehh99
Date:   Fri, 18 Nov 2022 09:30:02 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
Message-ID: <Y3dCig4CPYBQMJ/l@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
 <Y3c0lpl8zzKMnRPO@ninjato>
 <CAMuHMdUynqKtPF4fBP-Wo6K2++1cStDzgTQ6gBmcKsTHmKbhZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HUuIBUaMZCHVIJaJ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUynqKtPF4fBP-Wo6K2++1cStDzgTQ6gBmcKsTHmKbhZw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HUuIBUaMZCHVIJaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> "2000000UL / rate + 1" is not guaranteed to be a multiple of two?

Right, I missed the '+ 1'


--HUuIBUaMZCHVIJaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN3QoYACgkQFA3kzBSg
Kbaw1Q//Xbl5vRLEWpwaOTvyt+CiTG6vQ5DeYwjT0FA3N4gpED3PRvmxFLZD3gpQ
j9WT1BRofeUvfd329qeKxaY6hTApL/E9xqAvlZy3yCBzFAE0GkHRdCBSxSm+OuRH
iVyB+/BEfxPVNUvlLS4TXO42dlhTLfaQAzp4AoS/4736kYLEaVYfF8cjac3/DFjQ
VjOpREUxU5ocEuhJPqCgUyMFdXrYD8+HZZ47lpUbx+P2Vx8SXHJprBthftX9RQMG
+Uv65xY9R7zTzQzsCJpaAa7JZkilrXzKmiAxSe1OdVvXTxrMK+LlDpPKTPp3Uy+i
MFIexcqya5iUUCoEoytd5wRO2J4mt+HSiWaNcjMkI1KxnfRXV6rhXRcMrXU4D4Wa
4KtSlZl9pe4pGOSa3XRGVjKbeW3FAEcGKzLM/kX0w/L91iT5tQzPkCE0qQhs/AZ2
Jrng2O9Lfu90sV0YfM27WTN/aEmm/TyAcx+W6KskSHAmv8bVU5ONQ9oZc9BAexOr
qSLWtnH5htgAcOoWZeDXtKo4BIOQCSNM4ja81lIVW8kzh2prqguI6Ef96jp0LQma
L9tddDmehMbYo/c4vSFK3blJRanenll2WEB/D1+iGmWiid5SLNRpUbG+riCQbep4
zjyLFNjye3HQW1zm36SBM4f60AExY1K9820mTICGs/syR1WdUQs=
=NPNd
-----END PGP SIGNATURE-----

--HUuIBUaMZCHVIJaJ--
