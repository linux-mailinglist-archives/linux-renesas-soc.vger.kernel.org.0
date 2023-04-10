Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4BA6DCBC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 21:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjDJTm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 15:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjDJTm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 15:42:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75551BE7;
        Mon, 10 Apr 2023 12:42:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43DB7617F3;
        Mon, 10 Apr 2023 19:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E2CC433EF;
        Mon, 10 Apr 2023 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681155774;
        bh=noGi/I5C0/iTcFd+H+j4kCxKuu9iJ65cPO2EiqdW3us=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rKPmeI3WMQQ2LAbv2M2wjN4MhIQxvOnuQkj3iy4FPumsBbwHmR1Jb5xsFHdE2jitd
         9dYO23ScL+tKRtGJdJTb7lJskDd9woI4b36CcAaG2Q9IqCfNI50gdGVvoWlNpQL85P
         L4w1CKsNuMLrEH/DjgWlBMCElKmtWIHtIF+lEXQjVc7ZJfUg5pksbAaT6LPgyCWe7r
         PKZSU3JOqsNsryxyE3zw3jZMiRVWzu6djOS/1dr6zX1LTUHeZ6DrAxP8XMl59o6Udu
         LRggXKGSGPQD7Ek3PUdmabKMAgQjY2VDCJeRUIJ009Ao+72pZnXiFCL7DUdFKITkYn
         hb0ow5ETdUcHg==
Message-ID: <1c40e83e1d6ff18253e59d24dcaca2a6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1681113399.git.geert+renesas@glider.be>
References: <cover.1681113399.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.4 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 10 Apr 2023 12:42:51 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2023-04-10 01:01:26)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 72cd8436ece036294322fecf91567fef3ce3e8=
68:
>=20
>   clk: renesas: Convert to platform remove callback returning void (2023-=
03-16 16:54:21 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.4-tag2
>=20
> for you to fetch changes up to 5e96c2e0e88d3617477313b071cf199bfc29d794:
>=20
>   clk: renesas: r8a77980: Add I2C5 clock (2023-03-30 16:44:04 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
