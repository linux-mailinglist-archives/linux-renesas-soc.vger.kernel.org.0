Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1026780F98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 17:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjHRPve (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 11:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378336AbjHRPvA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 11:51:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5D32D4A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 08:50:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A916362F2D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 15:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B99C433C8;
        Fri, 18 Aug 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692373856;
        bh=mOPLaxhsWm11sRbr5mlW6jXIR1dpa7TSkWI1q+RWVEE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=uhyT/Dl50SkExG0BJP8lnmTgeF7Ehsoy32f0IPIAjOjRQdmz/d8vgdRm0aWX8rDZa
         r3zILfQpTbUJI4Gx5Ma2iCI5P8zEI53uW6v3qfpU0HlcW/kjlFeF7UGjBM7qTPusTd
         5WNP7S0cf2yfBa2vWO9RQmKdouCxNSrECEz3OVSamJyVcB1+erm3/iveLCbGzDs7Oh
         ZdSq0A877B5NwqvTUQip3XguYJAftoDRsgpVNmKYSoM14KBPpi0hBbV6NHigc2/XYL
         7xhLxIvnLVt2obedcmoTIuDaK0blS3FOgRPJo6LYdv1VssisfI2Q4K8v4/89U3MnGa
         UEXUhhqnxkCHQ==
From:   Lee Jones <lee@kernel.org>
To:     Lee Jones <lee@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
References: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 0/2] RZ/G2L MTU3 driver enhancements
Message-Id: <169237385464.1287367.4893055612071955886.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 16:50:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 15 Aug 2023 08:34:43 +0100, Biju Das wrote:
> This patch series aims to add improvements to RZ/G2L MTU3a driver:
>  * Reduce crical sections on rz_mtu3_start_stop_ch() and
>    rz_mtu3_is_enabled().
>  * Replace raw_spin_lock->spin_lock().
> 
> This patch series is based on next.
> 
> [...]

Applied, thanks!

[1/2] mfd: rz-mtu3: Reduce critical sections
      commit: 850180cc315633aea2597f13de13f74e4ddae1f2
[2/2] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
      commit: 704200a3e113fce52fcc4d98211ae0c30253af77

--
Lee Jones [李琼斯]

