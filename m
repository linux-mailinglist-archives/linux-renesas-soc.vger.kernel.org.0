Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29EB79BE98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241837AbjIKVRu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244439AbjIKUce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 16:32:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5BEFB;
        Mon, 11 Sep 2023 13:32:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D300C433C7;
        Mon, 11 Sep 2023 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464350;
        bh=Nz9UgSpoElaBhMustx9ODq3COylfItg02BZZWs2qYag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=S4OxBNwvvuRZpnLO8RQ+RUvIVe3N22yb6L/ochbJknxlwlvr4kp4zK/5xtu79coJp
         zevRaC0etotCPe/JaoPrLF5aiUBC0Bpu19aoByU+agGzo2ytsqAC9B6AU1v5N64FXF
         iIGoEJBcbA2DcT/XBe3hHDazQ20QwgC8g+qlFNmyTL80LfKuE9EhyZ/u4R+jZUPhA8
         uWR1sd166ejq224IbbaVwXc/yqtrdGeuAIM996veYpEh1iXx6VcA8TU3NPxLamBHRW
         rxooS4Pl1ELcTowTN2DcOL2vMEvOcFFz3GlPnCTkVHoLNERBhy75XARoz49c8L/km/
         QDp8Ka3r8T8wA==
Message-ID: <4f69467568f1bdf03c2ce8267a3d0cea.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:32:28 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:12)
> Make vc3_clk_mux enum values depend upon vc3_clk enum values=C3=82=C2=A0t=
o avoid
> any accidental breakage in the future.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-fixes
