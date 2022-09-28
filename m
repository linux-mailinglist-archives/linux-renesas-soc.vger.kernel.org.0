Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8C495EE9DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 01:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbiI1XGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 19:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiI1XGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 19:06:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77566DFAF;
        Wed, 28 Sep 2022 16:06:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 549DCB82236;
        Wed, 28 Sep 2022 23:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE00C43470;
        Wed, 28 Sep 2022 23:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664406407;
        bh=viz5MyLgQGVOviliyKAc45yCISq86+pyKJ/er1TnHms=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YvFPUQhFDtxmpy10OnT0Kt20/Cbn7BDjlCepmQ/cgwM8ua+1eL3evr+pXf/A4vpqd
         4MGHpk8uHXIestmqMcxlxlwjN14viZRsi6p2FaJgA1YOE+Bfs0e0YacJcDUG6zTBBR
         mVGQl6WFmPp79j+vcCYpLSLMxxyjPjOP0Sod4eQG5meY9AWn7fvMmrJ+pv1BeV20AC
         1FrclLC5BZ0GT2eWJ6FOEQ+OY5eQPQHyuaVJAc4cYGF3uIXKpOZv3qI5DBVhVe7SKW
         v9MI5hsjyHfcHesFkYteaOV9qPVBjvZpijS3VHEpnwHbfXDBC30B/womvoBF+SuS+0
         vW7GtBuWO0cmg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1662111940.git.geert+renesas@glider.be>
References: <cover.1662111940.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 28 Sep 2022 16:06:45 -0700
User-Agent: alot/0.10
Message-Id: <20220928230647.0FE00C43470@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-09-02 02:50:16)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.1-tag1
>=20
> for you to fetch changes up to e312ae92077f90d6ccdca05fb6d640bd9624c37c:
>=20
>   dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC (2022-09-02 10:=
47:30 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
