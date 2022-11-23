Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59308634BD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Nov 2022 01:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbiKWAuz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 19:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbiKWAuy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 19:50:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB158CB96;
        Tue, 22 Nov 2022 16:50:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69B59B81E48;
        Wed, 23 Nov 2022 00:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2EBC433D6;
        Wed, 23 Nov 2022 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669164650;
        bh=rXMmXg9Mcj7PCVs+oJe1QmRf4N8yh+jRzjlmHDF48vk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uiJlqZz5oWRj2tZnhqbzyzZObvJEzIT+39m6e7NJdwO1KLAh33peOSSsDnXWBthWu
         /P15M8BK4rWhIg6e/tQ7cAADTh2sCFeQx6+stDEWWPlqIKKbzQWCanXMeivfc13K7l
         5vob0ZgT8foj2W1joZUF0VVaegaDNGKf9sw0VI57LcxigBvtd5mvVlBJb01BQFaPvo
         ZJ4NkOglA20HXCH/BJUkgKy+TTaLXj7szFVkrcjkiZ5c8Urw7V9fAF5jmkcn1yOKtH
         SDWnM5bi53wksi7SkrkVZjZQkm6tRCrYZ74qAYRykD5Lbgc54iEkI3na51Q7osYhLc
         LmbF8a3AThFWA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1668789961.git.geert+renesas@glider.be>
References: <cover.1668789961.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.2 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 22 Nov 2022 16:50:47 -0800
User-Agent: alot/0.10
Message-Id: <20221123005050.0D2EBC433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-11-18 08:54:05)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 02693e11611e082e3c4d8653e8af028e43d311=
64:
>=20
>   clk: renesas: r9a06g032: Repair grave increment error (2022-11-01 10:15=
:28 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.2-tag2
>=20
> for you to fetch changes up to 777bcc85e1fbadfea1927e828165102cf5050b53:
>=20
>   clk: renesas: r8a779f0: Fix Ethernet Switch clocks (2022-11-16 09:05:59=
 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
