Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A80648102D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 06:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbhL2FqM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 00:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhL2FqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 00:46:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41908C061574;
        Tue, 28 Dec 2021 21:46:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E6E1B81163;
        Wed, 29 Dec 2021 05:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4EFC36AEA;
        Wed, 29 Dec 2021 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640756769;
        bh=1ejfQas/1sDzUkShrgS8N90I0EJpkguUz1hjxLKBvfg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W3MX1QLyx5FYDf9sqaqLfGB7Y37wS4a6dVSHjacGAw6mQB3NJPAnQomQS7n1FIjf4
         A09j0DfdKpmMhpEXPYyZ2U7MZiRNPyLEsQHVmgTCHcHRjiAcZkKEJ4DX2QgnQ9BdHM
         xUcHW+UMN6nWM9aJZjzSm2v9W9tVIJW4b2NPHRm1YXYqJna4RBJnVura+IP7p6F1II
         OI1Z1Lk3t/eXMl5n9nzrVzdpzpClFeNthvB1ejAx6QCTE+vIsfHJs3JPPZMmlj9BkV
         GH2hkj7J3hC5frAfjhe52Jz67rih2mPyaDfA7yN86TzgMg+PfNDZaR+RlNZSTjaHnD
         2O5ZYwZWenYaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1639736964.git.geert+renesas@glider.be>
References: <cover.1639736964.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v5.17 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 28 Dec 2021 21:46:07 -0800
User-Agent: alot/0.9.1
Message-Id: <20211229054608.ED4EFC36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-12-17 03:07:30)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 33b22d9c3272003a525ba2d6b7b851f3d4f305=
74:
>=20
>   clk: renesas: r9a07g044: Add TSU clock and reset entry (2021-11-26 14:0=
6:16 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v5.17-tag2
>=20
> for you to fetch changes up to f0b62b0bbedcdfde18116080605cebd9beec4ee9:
>=20
>   clk: renesas: r9a07g044: Add GPU clock and reset entries (2021-12-08 10=
:05:56 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
