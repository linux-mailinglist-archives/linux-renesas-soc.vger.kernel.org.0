Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C2D55A401
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 23:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiFXVyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 17:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiFXVyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 17:54:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C597A828BD;
        Fri, 24 Jun 2022 14:54:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65487623B2;
        Fri, 24 Jun 2022 21:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82ADC3411C;
        Fri, 24 Jun 2022 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656107658;
        bh=Qkhuf+bjK+a+TQiaqrelJvif8tE2ah8LdfGpZv8h8vU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aSjgKGdxwlbxOMDNjHOvkDY9qeRNoM2ZaxXOA5cD1XvrnqAtDduCQGKxb/HrxNHWn
         ihcDAukvj8ghNiq6D2TIC6AgWUL9ld0r2onBqY5gVM/mE0T8iSm7qBioKa70tv22P1
         a6jZR7A88x6pLnet/oCdrdR6Lr757r7CXhLbdwgho2+wpToak4C0ii4kSeWRE+o7qt
         QwqtoSfXiO3JWKHNd1gdPShwpy3z2f5GljSwfzuoYDgNrewU/uB8M8qD7zNnNSZCHF
         Dz/Nu9g0jzTEdj0wMZJ5qFhBpgvl7db32N/EuV0elk93aMOVN+w2+t/0LQoZ7Wdovg
         Et2hRGUGezEPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1656071712.git.geert+renesas@glider.be>
References: <cover.1656071712.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.20
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 24 Jun 2022 14:54:15 -0700
User-Agent: alot/0.10
Message-Id: <20220624215418.B82ADC3411C@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-06-24 05:01:43)
>         Hi Mike, Stephen,
>=20
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a=
56:
>=20
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.20-tag1
>=20
> for you to fetch changes up to 080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3:
>=20
>   clk: renesas: r8a779f0: Add HSCIF clocks (2022-06-17 09:14:13 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
