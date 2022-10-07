Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C085F7F35
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 22:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiJGUrK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 16:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJGUrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 16:47:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C065C14B2;
        Fri,  7 Oct 2022 13:47:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A090761B83;
        Fri,  7 Oct 2022 20:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB279C433D6;
        Fri,  7 Oct 2022 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665175628;
        bh=xXQ4oJCtGKo+xuBrs0No0Tqqpe4Asxxn3fci8GFrg0Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CZPlhgAjPPZuffi54rBT3VpMpwh9YfXyZaWO2sA0Ec4WSPUlryh8WS6ICLeKX9UiR
         ZaFf3xhaxVHiWtLkOX2XMzex/C+7/nO0TaDwNy26gqiAWrM86VA2YD1+NjCgSTSZuc
         wsyRj20PJws7lqZfo2IscW6mdMy1ESLrGdPeabnm7lOkXh7zwCryw+nabSDw1+zvF3
         smjN0Fyu0ts6vDndgCxV9BL5efRummtuJNddOdrsPdBuBa92TMEMoN9ZxzOeIU5lSm
         8QMlMdWE3vlEJchbc/LSRe1Irm5Cqc278aSch97t6aUZQjD1GU66+gGygLE+evNNZc
         LxCk0L5QTvS5A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1665147497.git.geert+renesas@glider.be>
References: <cover.1665147497.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/5] clk: renesas: r8a779g0: Add SASYNCPER and derived clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 07 Oct 2022 13:47:06 -0700
User-Agent: alot/0.10
Message-Id: <20221007204707.EB279C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-10-07 06:09:59)
>         Hi Mike, Stephen,
>=20
> This patch series adds the various SASYNCPER clocks (used by modules
> that must not be affected by Spread Spectrum and/or Fractional
> Multiplication), and most of its derived module clocks (serial and PWM)
> on the R-Car V4H (R8A7799G0) SoC.
>=20
> As the second patch is a fix, and the first patch is a dependency (also
> for a related DT fix), I plan to queue the first two patches in
> renesas-clk-fixes for v6.1.
> I plan to queue the last three patches in renesas-clk for v6.2.
>=20
> Thanks for your comments!
>=20
> Geert Uytterhoeven (5):
>   clk: renesas: r8a779g0: Add SASYNCPER clocks
>   clk: renesas: r8a779g0: Fix HSCIF parent clocks
>   clk: renesas: r8a779g0: Add SCIF clocks
>   clk: renesas: r8a779g0: Add PWM clock
>   clk: renesas: r8a779g0: Add TPU clock
>=20

Thanks for the heads up

Acked-by: Stephen Boyd <sboyd@kernel.org>
