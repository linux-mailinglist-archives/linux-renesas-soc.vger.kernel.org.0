Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88ED77107B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 10:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239983AbjEYIiV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 04:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240058AbjEYIiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:38:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4378E6A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=u4XARdzcnLGQeZI0kC129jnbF947
        K58WUMeVcFsMqd4=; b=u9NMwAbG6e7lsO8UDafQBaTFMghYEnoVZJvhmHgYqEzF
        NmSFlKU+KBbAgponCP1fFbPJDb0U/2b38+oZg/sXnHXPNpXdXBnuQF1E4/8t3yDS
        Sc6I1XtUVK7VS75d/17CMmWRbMcyIeXanzo6+aeIudlhJPlmkLxdAEHlJb47f9E=
Received: (qmail 3449343 invoked from network); 25 May 2023 10:36:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2023 10:36:34 +0200
X-UD-Smtp-Session: l3s3148p1@kCmUhID8RLUujnsI
Date:   Thu, 25 May 2023 10:36:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
Message-ID: <ZG8eESWD4XJcKM8l@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <20230524203520.1354-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX0x0UuNedk6N6DsXKEuwFJenNiofRQQkwLi8rwz_SXgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LeiOhKsdudNqTi8c"
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


--LeiOhKsdudNqTi8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, I think the scif1 changes should be a separate patch, with
> Fixes: c6c816e22bc89ea4 ("arm64: dts: ulcb-kf: enable SCIF1")
> so please split it off.

OK, will do.


--LeiOhKsdudNqTi8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRvHhEACgkQFA3kzBSg
KbZqhxAAmJSOjz5WDumQCtYjtGktRdHZK46alOWDzhzJzXuSNcaW6fWlTAf0et3r
Wsh8MfA+fiQR/Was7oGt0HVqPFZu/u7xw2s6MyWfobkx+yaWSq/KljTWaNvJWs+c
ful6ZKX7rlnZiQz4jEw83sNHQPMuLpib5+3tlDRC0b44pBsRyZVp0gv7e0T9p668
D7zLKjQUXh0MbYWvOjHwTDCV2UCH/Chb1lK/pZ28PlmHFPX/gRecRSHNyNOx3pOu
78I6oIyjdz5I7vPXEeLaGYyJ/v4csnSyArZSuJS8vB6aG5haoObVJ+AW9XkB4GIu
tUrw+M+85lbqZvQfmlLr5n2n6firOyFXQrHNNzno9IQiuvCzEe2MhnoyiMs8Zf/Z
RBAJWUFn3uLhNklJ1+wUDrqFUhKVfXDlgCgup8jPX3JD7q81+NQEb29sYdSjepfN
PzXnvr8smvDe/r7bmB8tFdR1InBSqosuSBcZo06iOVsLOOaO+euDlrkCZh5vXvGT
ZWrAvxoqkASPjE0VZKbY3xS8n6vsoM+02GPZSF0zc/NPtVI3ZgmsaQY8QTe8Uc8S
Xx1s4U1Tqh1/ia/i5CmeoZSUqMAo/BzMKr38dqPG8k2/1eLxw/VOUJu+Y0AjcVuS
N47RJ87ggP5fYT7JuV3RmAixMPZEXJcupQfMNhuHuDzZItBnl8M=
=JtJk
-----END PGP SIGNATURE-----

--LeiOhKsdudNqTi8c--
