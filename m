Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDB936CAC84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 19:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjC0R5L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 13:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbjC0R4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 13:56:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E08A30EE;
        Mon, 27 Mar 2023 10:56:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52941B818A6;
        Mon, 27 Mar 2023 17:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17B7C433D2;
        Mon, 27 Mar 2023 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939775;
        bh=ZNR5VTvFrLH8ao7gO0y2nPvauBf/yf8/FCIc9MIqURM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UTgtXYM3JymKVOscd3RDK4KbKoVWlySi/QLxvaU6vAkYVvzEtTVYD5P1Wu6Pcu8Lu
         LETBHG+/uPv4qaGbG/Y6ePWoeMtuA4MeGeDPdBnwg1fgMzERseXdHxpwbaIQn4gZKQ
         yTxUywVyIm+UFkewaJqkI7NcbcNQa6mrJuCXgu/OLEmp52ss9HY5RJl0Q1b+EHoe1c
         z+FogQqdlNBTF8h+zpgHY1Hj4QTX6604j2Y6e/bTr9c0ygvwIT98yJCOgf1W2vgp1z
         FmnqJZ6fKUdt26TDeiGgWXxioc9C6GB7i/iDNW6u4TVuthOvZ3tNciO5sHAmG1EUff
         UB+bmTy+tMtSA==
Message-ID: <16dcfd98a72c8c4b6bac6e758bd10beb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310075535.3476580-3-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com> <20230310075535.3476580-3-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 3/4] clk: rs9: Support device specific dif bit calculation
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
Date:   Mon, 27 Mar 2023 10:56:12 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Alexander Stein (2023-03-09 23:55:34)
> The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
> additional devices this is getting more complicated.
> Support a base bit for the DIF calculation, currently only devices
> with consecutive bits are supported, e.g. the 6-channel device needs
> additional logic.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
