Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E143D6CAC82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 19:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjC0R5K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 13:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjC0R4y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 13:56:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5324B420A;
        Mon, 27 Mar 2023 10:56:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C56A16145E;
        Mon, 27 Mar 2023 17:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FAAC433D2;
        Mon, 27 Mar 2023 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939784;
        bh=C3XSBPxunG93vN9AEI1L824XMAwp/eGimJd2NLweIxc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LjcU9yo1VOyeDLuUeAYuJ7zfhP0Mw6SOQ/8K5yvIEZr5SI5rmDoD5uj/hSl/Uva1O
         ws2tMcmMA0+64BqH7Eowc0vxS407uBGz5STqkKg0tF+aywxq5poqE9YJElJoqPRkaF
         fPDDVrXFv8hi1H6RdGK3Al4I3TntnMa/V3QHWehX45QaKCqRc5Q3QhR+pV7CxLHT0E
         4Qw/DwAdUVbLrWGS3F4a8e1st5cVL0RvIigKlFvURgjZJgNVa5CuEF5nPP3qsjvkND
         sDpBNsK4NIGBnGMBBoyUelyoO64iyTD5WHTA2qXwORjiacf7Ehu/lLCUUAXCBPXo2r
         9FA1O2VEL0Ljg==
Message-ID: <ed87437871fe872f2eef3015033075c7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310075535.3476580-4-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com> <20230310075535.3476580-4-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 4/4] clk: rs9: Add support for 9FGV0441
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
Date:   Mon, 27 Mar 2023 10:56:22 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Alexander Stein (2023-03-09 23:55:35)
> This model is similar to 9FGV0241, but the DIFx bits start at bit 0.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
