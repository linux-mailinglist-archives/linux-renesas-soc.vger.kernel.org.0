Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A015784D81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 01:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbjHVXxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 19:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjHVXxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 19:53:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D95E45;
        Tue, 22 Aug 2023 16:53:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46C17611F8;
        Tue, 22 Aug 2023 23:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2C5C433C8;
        Tue, 22 Aug 2023 23:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692748392;
        bh=VXjLfDLXW29nf4QA7vjtO9n14lKR802Jjb1/pOw8LS8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZMUdKUlIB01ybTpfQ43R5KrVs+KwmwlOulDOiY5DMyAt9tCMQy3k4j8pbfBaX1MTI
         EmV87hiZ9avfH886O3NPSMfWd/NNNPfNmo9PlrOuEuXpM/Kk1cz9/7b8r1trHcs+xc
         lHw8auCGCJm9UMyYcm6ywYy1X+otbm9lBostcA3kh8s0nme7a+lACjHeAUHrC5keek
         c/ccfWMNYq21I2mdqTO+UN6xG108ZmjOxWV1kZDuhdfHLsW9nfDz/tCkHPUX4Gv90O
         rSlwZXZtV5NRTnR7yjnGkOTSwNgNwFniJ6Oplz18lKUAz+95mMfBATsPDP14x+3b2O
         eXdSMyFJiR61A==
Message-ID: <19fde7851bb06b7103e6221ca9b97f86.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com> <20230817142211.311366-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: versaclock3: Document clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 22 Aug 2023 16:53:10 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-17 07:22:08)
> Document clock-output-names property and fix the "assigned-clock-rates"
> for each clock output in the example based on Table 3. ("Output Source")
> in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
>=20
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4X=
paejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock genera=
tor bindings")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next
