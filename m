Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924F772CD63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jun 2023 20:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236853AbjFLSCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jun 2023 14:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbjFLSC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2023 14:02:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AA5E67;
        Mon, 12 Jun 2023 11:02:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAA7060EB3;
        Mon, 12 Jun 2023 18:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DF8C433EF;
        Mon, 12 Jun 2023 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686592948;
        bh=NuP4bBA2DOrRVs7g9XinibjRvRr74+5Me2X+UCBBW3g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XcOQok7u2o9SUTho/2cZ+WrN+0s6YC2ZTAaX51NB79zF+TVYnRAF0IPzpSMFdU1Ls
         J+id5RthDg7cOkX/aHCUhISR3uX1hO9+yAgqBfiZlXPquzNEUZYhb8kNBbwQjeOupG
         VeYQWmG33r/K4oyvPYBpNiUlyVvNmU9cJQLXsakhV/Th1bj/ZGE7ba1cg0Cq4u4rg0
         Dxo3TW7bOgemUn5tIxAXS47xNZ5u4StJvxoy+DmjJ9lR0hFmh7kjcr5Ki4czhzz8jt
         5US8zXOU009DfyhOVMHY8cje6E2CV7SKaUePhvM4ei/Yj7j7ftDZrYO/FBsJWl1KvO
         QlLLITayIyEbg==
Message-ID: <27f91bd1431650d4ccd56785877dafd2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1686304777.git.geert+renesas@glider.be>
References: <cover.1686304777.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.5 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 12 Jun 2023 11:02:25 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-06-09 03:06:58)
>         Hi Mike, Stephen,
>=20
> The following changes since commit d1c20885d3b01e6a62e920af4b227abd294d22=
f3:
>=20
>   clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write (2023-05-23 09:=
06:50 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.5-tag2
>=20
> for you to fetch changes up to 7df8eea64a417f1db6777cddc1d7eda3634b7175:
>=20
>   clk: renesas: rzg2l: Convert to readl_poll_timeout_atomic() (2023-06-05=
 15:41:43 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
