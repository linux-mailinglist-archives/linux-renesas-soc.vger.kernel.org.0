Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671757107C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 10:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240301AbjEYImk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 04:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240200AbjEYImg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:42:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDE9197
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cG5er/weu42JtVw8STDHCo0F2BWd
        u/nWHAivKagzVr4=; b=xUaTyWuWaQQ1q6lSGtH4N0y34LNdWrQrb+I6hxxWi0gP
        Hhj3jZyTVOBjUfvrVvEHvhuLfp5Olmnz6o4os8d5hXfguli/hPqPgC1oy+35nnPJ
        O975j+8Kxxvla94IHM6zvZNO4N535jAJcMdM8PNBOJmpgDZhPmdDoa2o7An5IZY=
Received: (qmail 3449087 invoked from network); 25 May 2023 10:35:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2023 10:35:51 +0200
X-UD-Smtp-Session: l3s3148p1@gMcHgoD8Fu4ujnsI
Date:   Thu, 25 May 2023 10:35:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
Message-ID: <ZG8d5p/qIDlnbBC0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <20230524203520.1354-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX0x0UuNedk6N6DsXKEuwFJenNiofRQQkwLi8rwz_SXgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o2//FwZw7sllZHdL"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX0x0UuNedk6N6DsXKEuwFJenNiofRQQkwLi8rwz_SXgw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--o2//FwZw7sllZHdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, as the only serial port that can be muxed to the GPS pins
> is SCIF1, we have no choice but to use SCIF1 for the GPS, and HSCIF1
> for CN4, like your patch does.

Ack. IMHO we should have the intended configuration upstream. Users can
pinmux from there as they want.


--o2//FwZw7sllZHdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRvHd8ACgkQFA3kzBSg
KbaKBxAAsXUAtX4ia42pcosnAjDdZkfc6xFkfF2yn3IvFOSAEpEst1X/e8AKLTB3
OZhl9w7SRgs7oYSMG6ShgIUddCR1j4wxACf5LswHMiniOW8T4nfSfWYQNudh3tT1
A/uf4KI5C5+1sH1mX+fQ8ZoPHc0L0rZ2snBIKTdfk3LQsGyT9P/RfW1PNp/MrflB
sTqf0IQBGOJNkw6URunlSuRr60PI8Ryga640WmKFR+T9cSayHYPmo0vH+dGTjGk9
8GT72xE4iBFiL/54yCU8yW6NfHzU9ku8hV9ZrTEs7aVf137/GJFKm9J9dWgtC8cP
blR6cT+6qAud85ATPbCmrOyfgUnFTSdnFhWyaeeVLDjSxC3vPfOn2zUZTbhxGSUw
92pv5bQIOAPpSlEzVje3a8rdy3/R9XwwZBAqKffF8m2UrKf2kZg2LL59plEkNZW/
tYghxmxHnVlsdy1XGtT3bSOBgS2Aj+g697vUnmemSevC/hY0LBW4K5CIFdHyv4Yb
Q5MoYF953M921/Sa038Gek6nCogCxz3DwX1Rkj53cJeC78Oa2oMXbeUW6xS68om4
4ffQWNnl+VcAaxOTCrRJJJkgqoeCMOLcB5cQQNVTrdidfIvTeW5KBqKcAUCNohAb
pg5O1hT8r8DIxdlGlZW8F8SxQpFb8H15sqKJFboe9rE5mcvDRYw=
=9Cjx
-----END PGP SIGNATURE-----

--o2//FwZw7sllZHdL--
