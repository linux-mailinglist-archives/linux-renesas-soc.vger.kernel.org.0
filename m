Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D167D79BDBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240542AbjIKVR3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244436AbjIKUcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 16:32:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03A5FB;
        Mon, 11 Sep 2023 13:31:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA7DC433C7;
        Mon, 11 Sep 2023 20:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694464316;
        bh=Y+aT8djXB9CKXwdEp5pmxFPUegbaDESTt4aIlc9PZG4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oAFvnvewGgyc+jUnwhQyLdci5Up5KJPqZBqAV5PdPShdVMrVeGQ//3WHuoHQ9jZxY
         yLiYPnWd47MFYFVoy95wTburWA6StzdZ2/YtudPBYq/yMwUtttM16Mt3gYt+XzRvH1
         HD8BWI3FaCevr0x8TTPGwR6A6MmmG2HzP9ermf3L04EQasKe9nyHoKf4ZYD0mmAZi4
         X9jkSem9YLSd8l6N/TPCjrhBLH3cs7/A/+rGRmkD6A0C7vli5oXXplFy94S7eaxwSA
         QvJDDkxUyj+Egrm7ZfMQ3A/lWp3kAkuN8iooWGWx6s5zgVxaKd90RWRK6cAl6mBNJS
         H/g8/la8b1Cdg==
Message-ID: <92a0a9b6800ce1570a21b0bda42ccf2a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104812.147775-2-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: versaclock3: Add description for #clock-cells property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Sep 2023 13:31:54 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-08-24 03:48:09)
> Add description for "#clock-cells" property to map indexes to the clock
> output in the Table 3. ("Output Source") in the 5P35023 datasheet
> (ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}. Also update the "assigned-clock-rates"
> in the example.
>=20
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-fixes
