Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2A85ED002
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 00:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiI0WGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 18:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiI0WFz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 18:05:55 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BAF1CD6B2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 15:05:44 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id n83so13399102oif.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 15:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=JaMWwQ9HrjvsyjP4+lMX3j2mmeycMY/Ai6gz1nlGh+c=;
        b=rf0dI63kpZex5b62iqy4YMzkDWuar2qJrs70KoWcuAwe6sFqJVtm/l4VOk9CwracdV
         i5kiQJxiskS19UJxBOqbkvxgzqBiPtKqzuJYyHObHxIniegw9Hdr6Rdw/eqbBbn6ejBa
         rpx5jyRt4hZw23UAkFEhKLUEuqh5kreMXDtkWSulgPw7CvH4hsyizNCnmxiYWpRfOw7s
         TMGGWzEf4rx7S7rOaGzbjcRka7CMwmeMlgRYZFVNFTckvPh8AIMyD/cl4D+KQxyOHBSS
         h+lmhq8lkrFB5MDwt5/r75Qn7osHhqKT/pMmcC4AC5Pw/zI6vxCxiXHYQ21uOFdua8k9
         kKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JaMWwQ9HrjvsyjP4+lMX3j2mmeycMY/Ai6gz1nlGh+c=;
        b=sUIqY7XOuaUCYS+OeseO5DThNk0dvSgla6ZylBT5xa6RHbzJYMp87zpIQBYNf//pMf
         zUzhIQonTVHnikjIrHcgE/jenykYu3OCnLreDIkYBLTiKmoAQc6so6i8HPRPmHLl4GZQ
         BkMq938hiqKW7nn7BHuAbfLKYlu/nQw8WzuGkMU0I4qsD6Jl7icMWr//jclgfkFniwt5
         HzDKa13B68QIfMvMHbo4Sr52kCcYAK2IFoBF8aWd3A/ERaV3VyK/i/1Z7r8WNg8TqN/U
         ulzW3hqEZqRxSaBvAKYtvHztpczUB7XUPbMd+GNo1ynYRDqXBeJ9vv2ILZ4uHXCm3OEn
         9Hjg==
X-Gm-Message-State: ACrzQf0oxSn6lZIJl73AGfi+QKhk3EFTIe8BVhB45bHeFoAch7dO45jJ
        /yY7dW0mENsa5Uuym+vuhTcuow==
X-Google-Smtp-Source: AMsMyM69sEAW5sC87A5BdOty2QyeC+oSd8dCAfo8e2Yf7ON+NBnfr+vFtjYa30arwddCtWOuuS/AEg==
X-Received: by 2002:a05:6808:1a14:b0:350:1965:8b5 with SMTP id bk20-20020a0568081a1400b00350196508b5mr2774875oib.85.1664316343555;
        Tue, 27 Sep 2022 15:05:43 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id t15-20020a9d774f000000b006594674d4ddsm1280317otl.44.2022.09.27.15.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 15:05:43 -0700 (PDT)
Date:   Tue, 27 Sep 2022 18:05:40 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] Add RZ/G2L MTU3a MFD and Counter driver
Message-ID: <YzNztKSYQPQrnV7k@fedora>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3JebmYDBRONn6Avy"
Content-Disposition: inline
In-Reply-To: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3JebmYDBRONn6Avy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 02:21:06PM +0100, Biju Das wrote:
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
>=20
> This patch series aim to add MFD and counter driver for MTU3a.
> Subsequent patch seies will add TImer and PWM driver support
> also enhancements to counter driver.

Hello Biju,

I see this device consists of several channels, but only one Count is
defined in the counter patch ("Channel 1 Count"). Do all channels
support counting, or is it limited to just one channel?

Thanks,

William Breathitt Gray

--3JebmYDBRONn6Avy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYzNztAAKCRC1SFbKvhIj
Kzj6AP4sKi7ppEU6iFRI55vrVy/B8K5aZkGgsGuMvoxg/GjHCQD+O8s8zrGt+LRN
xmCaiedfdSS+4BNhI2WWK/e+7DCDuQ0=
=0jtN
-----END PGP SIGNATURE-----

--3JebmYDBRONn6Avy--
