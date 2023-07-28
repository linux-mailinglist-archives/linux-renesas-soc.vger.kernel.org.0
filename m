Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3BB766A61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 12:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbjG1K0O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 06:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbjG1KZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 06:25:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AD044B1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 03:25:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0398620B2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 10:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6265C433C8;
        Fri, 28 Jul 2023 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690539886;
        bh=wOjGFqiJ5J96O6QZVqknTgfo85VJnaTEnHEowS0XK5I=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=gH0iA/LgcyL/QkXX1S3kxxLPB4PX9DE6DrSau6vJe56OoePvmTaPoS5irzhK9Vjke
         BXUj287R7gW36UfxqXFWuxqMna1s2vyVENvTEtH+E3dz0d96N5FWXGOKDqmjk3db+q
         QFOTA330v39lglfSXnNyyyqVPgRJRSL9hNks+vbjE5krraByBFB9SHiKi0jm0W2SaI
         yz4EiUTEdyKmEFiE4XG74obQBw+vIQX1I0MPuY7MEFk64CYBlJgPs9pIqB7h5PusGV
         M0OKu5udQ6sujylUE3b4GABfluK+tT1Nb0gN29c2dJQIo1YeXGI+1DUr8U4sb+NXm4
         /7cjBMQwFFpPA==
From:   Lee Jones <lee@kernel.org>
To:     Lee Jones <lee@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230718134314.118333-1-biju.das.jz@bp.renesas.com>
References: <20230718134314.118333-1-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH] mfd: rz-mtu3: Fix COMPILE_TEST build error
Message-Id: <169053988438.323331.9015761550467680392.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 11:24:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 18 Jul 2023 14:43:14 +0100, Biju Das wrote:
> When (MFD) RZ_MTU3=m and PWM_RZ_MTU3=y, It hits the below error
> aarch64-linux-gnu-ld: rz-mtu3.c:(.text+0x544): undefined reference to `mfd_remove_devices'
> 
> Fix this issue by selecting MFD_CORE.
> 
> 

Applied, thanks!

[1/1] mfd: rz-mtu3: Fix COMPILE_TEST build error
      commit: 569e5627cb6197a5e54f46a2661a007fb696a28b

--
Lee Jones [李琼斯]

