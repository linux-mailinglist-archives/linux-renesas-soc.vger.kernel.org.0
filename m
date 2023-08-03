Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F63476F35D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 21:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjHCTWf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 15:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjHCTWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 15:22:33 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E38330EB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Aug 2023 12:22:32 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44757af136cso596849137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Aug 2023 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691090551; x=1691695351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1T2gH68DArT9FmYrPj9BMhK77ECutQD6S0cdO/cxM0=;
        b=ny84zohfpmzmtt0eYE61+7x5gx6BbdREdY81Vr973udeoVVY8AKYPLmVx1AYaSMEWY
         XJ2rExN7Cuw0Ovhf0XNk0YFt/B3prBwO516BJRAtjOJQASz/AScIZGZ+eUea1mpPeYCh
         MooxQRXVSKGTtu3+8eVEjbEfzjGhCTIYBSI6vMxH8X2x+PpxrzzLwE19Q1ohmXFo11r4
         8N13qe7YqeZ3GCVgksAc+vTJBFn3K29QOMzbulRh/zmJUs8brkfDrFlX7Np6xg6RMlrZ
         STPFouGaVLYBt3A3pbrS9dWIDizU7h31fZugVNxxRpKjMPzf7FSFoDTSM+vImlRNSWXy
         UxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090551; x=1691695351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1T2gH68DArT9FmYrPj9BMhK77ECutQD6S0cdO/cxM0=;
        b=azNNm37iLGmvIJc8784cqJdO3ND1NEDyBUVD2MbccEv9ncSem941qwN5Y1VEJiGZiM
         dl5XZGA+lFBDroDuZ59nYcek5wIQw0TN1jhKxAl/D8GcTp0vYGQj3GpVD9eTf+qg8350
         Mc7BQym7JVd3/IAyY8RZjSsYKiUFC5InIkutmJqQkgR8i/LC66BqybcUOPKbC/hJGldG
         Q0GEkWj1kVYMOQVqLvw3U+CFueSXJc2pFH1P/uFp+6B9Xpl+lbWyscZG95ft3VH0oV6d
         I1UJE6l4Nes7xLDoxtPW8vzWgqCDppVXghFyaq9b6jcoRxiSOWOalKtGn57dzlGv83cr
         NDMA==
X-Gm-Message-State: ABy/qLbTtTrP7y6Ys2pNsYEqZQKNgTlHWfM3spwtcpn+mGfkt5aj/xK8
        QXxH/dQwfx+D0aLTTVQNaaXFTg==
X-Google-Smtp-Source: APBJJlGyfRXQMER1Gt5fDu8Rdp2YZU7so89bf9DIrdnQtZPa3YHIvsOIjX6tpZc0ra1uNwewnbg0Eg==
X-Received: by 2002:a67:fd69:0:b0:444:c644:c231 with SMTP id h9-20020a67fd69000000b00444c644c231mr7199155vsa.12.1691090551551;
        Thu, 03 Aug 2023 12:22:31 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id i19-20020a67c213000000b0044794fe40f3sm81153vsj.21.2023.08.03.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 12:22:30 -0700 (PDT)
Date:   Thu, 3 Aug 2023 15:22:28 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3] counter: rz-mtu3-cnt: Reorder locking sequence for
 consistency
Message-ID: <ZMv+dICGMsWoVpfU@fedora>
References: <20230725154611.227556-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UibedGS5+vaQ13nT"
Content-Disposition: inline
In-Reply-To: <20230725154611.227556-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UibedGS5+vaQ13nT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 04:46:11PM +0100, Biju Das wrote:
> All functions except rz_mtu3_count_enable_write(), call
> pm_runtime_{get,put} inside the lock. For consistency do the same here.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/r/ZH8Fmom8vZ4DwxqA@duo.ucw.cz
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to counter-next.

Thanks,

William Breathitt Gray

--UibedGS5+vaQ13nT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZMv+dAAKCRC1SFbKvhIj
K/RtAP9TCfM4UxCGQVG1P2aWQTVJHQ5DFEzToiJfx8uI08ecmgD8DF+rWeTgFQSr
oa5KQUHNKF5kxByXX1wGkWAu/9jkIAQ=
=d4Z9
-----END PGP SIGNATURE-----

--UibedGS5+vaQ13nT--
