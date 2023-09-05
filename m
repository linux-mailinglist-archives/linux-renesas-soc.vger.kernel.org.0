Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE1379263C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Sep 2023 18:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237510AbjIEQE2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Sep 2023 12:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354782AbjIEOUX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2023 10:20:23 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB90127
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Sep 2023 07:20:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 225FCCE1184
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Sep 2023 14:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB61C433C8;
        Tue,  5 Sep 2023 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693923615;
        bh=rlMXztTsnFKQ5FdtU+qNDKYNfX/0zFqzn0aF2XsO+nI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Nj43H9G9C8xAEOMJhbXk/x6n3BJ/BO2aXDwzaai1he4vaWLaOmgi2sYPXZN/Ayz7/
         Fph4qAH+HPCLeJCg6m0+4pFkR0fUwD7ix7uncJf+bWluFb12BkojfyaDQK15Xh4eSQ
         Q3Gpak0ChwbMB2Xj2hyRP8Y+mGquU4tb7ZEn1QSNZP3TTIfGogfcFbf4IWcuT6TSGj
         1k0f3c+qZiH1Gl4+fU4OqEJc4T/0hbhw9SaaqXE+luuR7CIt8a1YkjjopqoGstcsya
         64CYsYuQ2VvTw82Uf+n/hnb+OZy4gfVisGU08ajgqP5V6e00opHuusSQO6JfjSCjV0
         9+tagMxIMZ7UQ==
From:   Robert Foss <rfoss@kernel.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Phong LE <ple@baylibre.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
References: <20230818191817.340360-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 0/2] Match data improvements for it66121 driver
Message-Id: <169392361254.1000124.5770510493227185107.b4-ty@kernel.org>
Date:   Tue, 05 Sep 2023 16:20:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 18 Aug 2023 20:18:15 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for it66121 driver.
> 
> v2->v3:
>  * Removed fixes tag from patch#1 as nothing broken.
>  * Added Rb tag from Andy.
> v1->v2:
>  * Split the patch into two.
>  * patch#1 extend match support for OF tables compared to legacy ID
>    lookup and fixes tag.
>  * patch#2 simplifies the probe() by using i2c_get_match_data.
>  * Dropped sentence for dropping local variable as it is integral part of
>    the patch.
> 
> [...]

Applied, thanks!

[1/2] drm: bridge: it66121: Extend match support for OF tables
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c11c1a50573e
[2/2] drm: bridge: it66121: Simplify probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=29ff3b7e23af



Rob

