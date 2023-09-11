Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865AD79AEE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 01:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242034AbjIKVRw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244438AbjIKUc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 16:32:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE233FB;
        Mon, 11 Sep 2023 13:32:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DB3C433C8;
        Mon, 11 Sep 2023 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464340;
        bh=gkJtNfISerIA7gwmSqPXIKAOxbGkK5wwyEPfgZ0HhLs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sgs/ROxaHaBrq99VhTdvJCJm+mgJNqnQcuMBloJ6IsXQTemSdVAPRlSkaqq6ukcOm
         +JUwz7VRBF+5X6PXQxTR96MzJql2jpVIuHg22ntYZ0RNoqgmTNcMV5ERnZqrV3DHuk
         bl8FxDbWFJmvuWXZI1mvRGcAyh62Vap/tBgX7AKxZb2RfbNreF3sDrtXWO3Llq/UPi
         ZZ3VQvjaepFUxyOnbDxGJW/pwlykiWPvz1JoL8d9YRfJwh1uXFzBH8vXVJu+2ZWYOw
         hlaqAVqzyNJHaoselppsyjyEgEjgMDMJ9Ni1PiOcceIiuomYzHwWZJQkN3uGHCn7/6
         KESdaUonghoTQ==
Message-ID: <dc833f3a32c583ae474e040db1b2eca0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-4-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 3/4] clk: vc3: Fix output clock mapping
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:32:18 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:11)
> According to Table 3. ("Output Source") in the 5P35023 datasheet,
> the output clock mapping should be 0=3DREF, 1=3DSE1, 2=3DSE2, 3=3DSE3,
> 4=3DDIFF1, 5=3DDIFF2. But the code uses inverse. Fix this mapping issue.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-fixes
