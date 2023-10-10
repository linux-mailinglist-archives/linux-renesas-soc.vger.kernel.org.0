Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C563B7BF139
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 05:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441862AbjJJDH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 23:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379409AbjJJDH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 23:07:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A23C93;
        Mon,  9 Oct 2023 20:07:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE737C433C7;
        Tue, 10 Oct 2023 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696907245;
        bh=ShI5v88r+6uLa8HgLKlpe/Nm7sSNlAVHWw6lOSglagM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GEhYpjc8o6DZKmpiLMT0gcpZ5pwn5mHQiAeoqqYomKTyCDy/Orpzt/bhBanFw1/Z8
         b3+HM/lDlInfN4Pq3DAROqvq9yByed0W+J6vtR+aJeNtzvhkSa16zJAmeBNYWIRHVl
         hFINtjreOZhdOnnu7/yRITT9Dd+1YX6bl4Y92/Nx+pn3qlh6vkeb1Hya2JtzekAbG8
         Sk9jTcOE19UMUvmLPpNLnIBSItFSLwaxLAn9T54DJ60X4m/UD5Ck7y5AWByYp4WKGz
         J7fiUnOeA7Kqo7IdX80g7mU+n1jcToSTCvbbCdzsSdrEOOTs0EToJ0a+QuNw4OIr3H
         vKE3NbFISkFZQ==
Message-ID: <81048d31c880485752bdce90a04e5aef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1695985912.git.geert+renesas@glider.be>
References: <cover.1695985912.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:07:23 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-09-29 04:17:57)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>=20
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.7-tag1
>=20
> for you to fetch changes up to 87882525e5ddae7ef6f1b1df5e1eda9bcbcd7720:
>=20
>   clk: renesas: r8a7795: Constify r8a7795_*_clks (2023-09-26 09:38:00 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
