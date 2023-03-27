Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B7B6CAC7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 19:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbjC0R4u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 13:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjC0R4g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 13:56:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647C34217;
        Mon, 27 Mar 2023 10:56:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33EFF6145D;
        Mon, 27 Mar 2023 17:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BF8C433EF;
        Mon, 27 Mar 2023 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939751;
        bh=BTsXxRvCLHUwMsoz6OVwgCkz9JGH4IoIw+qiZjHPfRs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aSxiC7wisGx1zjB1nEngu9TuO4eYZCS+SXH5RdnBjWySvPF6xGa78m0Pt9tJB3uD0
         0JxYBgW0hzI1AigiEChoqUcAbTLgHBLD5qLtefCITmQOb91zbEKlNk46OlRxX7qoZK
         euVF8BHXASCtU0Nsz9GUHu+beILqY48Pc2hFGRUgBWDbTQimfNR3EsPyPQsEOqsUcV
         kgdhYbi0mpZ3Z4Tsg+cgSukOT6ErF57Yt8MUJYdjP7ZIzieOOYth2gZGbnwOWrRPa7
         1DEAq3WeMsrqDlHe6tkaqdbO6Vqo5SZ4NpsSMmn2tGnkHs+vgpkSst4olbJHUQVW8E
         LCqroX+IcAChw==
Message-ID: <2114bae6f9b0dd922b3e029fe425a8c1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 1/4] clk: rs9: Check for vendor/device ID
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Mar 2023 10:55:49 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Alexander Stein (2023-03-09 23:55:32)
> This is in preparation to support additional devices which have different
> IDs as well as a slightly different register layout.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
