Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBBA75A2E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 01:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjGSXkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 19:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjGSXkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 19:40:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23D11B9;
        Wed, 19 Jul 2023 16:40:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67B5261861;
        Wed, 19 Jul 2023 23:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD21C433C9;
        Wed, 19 Jul 2023 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689810034;
        bh=X+Q7vZNz0gi3IW1qK4+Ti/lKXsq3agFLU+cGPV2jtS8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nPe+KNXDlAFunkxSn+bV5niiotBgVvaCkuqEOPDbpRBxgO5z7Paq8qayYlN5AXSAG
         sL+0Gvaoxf+K86yd9viJ3q2ZFq7WIe032WmuURjCucD7qmtaQ+ebzULMLCa0uS6sk8
         1xkhPoux47GJW7qQHeBLxm6IgoxS69YXAgvZsbM2IQw3q9zaWwVx0yxXBO36zDV/cr
         kia5C/1An/+1SkF5WPa/KtWEXvsnSm8s90i2IymkO+S3GuGcXp6dD+6gT94qLRGtS0
         vjslx/WnV45dO3uLZpk4k1xqOgYofqfb87STlQVkcENNtcDcGUaG/nP6HagWzYNeK/
         m9eDXn90PuW8Q==
Message-ID: <f291f0e018aecf2aef1f1960eca18fcd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705171000.85786-2-biju.das.jz@bp.renesas.com>
References: <20230705171000.85786-1-biju.das.jz@bp.renesas.com> <20230705171000.85786-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: Add Renesas versa3 clock generator bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 19 Jul 2023 16:40:32 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-07-05 10:09:59)
> Document Renesas versa3 clock generator(5P35023) bindings.
>=20
> The 5P35023 is a VersaClock programmable clock generator and
> is designed for low-power, consumer, and high-performance PCI
> Express applications. The 5P35023 device is a three PLL
> architecture design, and each PLL is individually programmable
> and allowing for up to 6 unique frequency outputs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
