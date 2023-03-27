Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509C46CAC7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 19:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjC0R4z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 13:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbjC0R4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 13:56:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B091626A8;
        Mon, 27 Mar 2023 10:56:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AF420B81896;
        Mon, 27 Mar 2023 17:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E71FC433D2;
        Mon, 27 Mar 2023 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679939761;
        bh=tCYEeH6OGfNXatxMkw+5lG8VImuRBWFIP8kBhsGuRK4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mf8T9NWWmHjPSkgxQjQKQusLCQ1AoZZZEJuBYL90H6mxzlENfFVYYpeWUJe6mxBE6
         WbId4R8jc5Yq0NazGg3d8W7AKzPCic4RmH+pPwxWzfcHQaHb0YJlbZfSsVgUv1znH8
         mEejTsT5svD4MuNYZ3oDeZ/ULWcRpjeL6WtsqyqFVhHEmwg00Y19NtS1tErKnMZQwc
         i1+2YXXgAm67gyKZLM2xAXxcMauBMQU+qvJsNyW/6lCI2AEG8Jd1p9e0gNzbHaM6cF
         qbRRmxebA0lpNkjdknBnAQi5OkTYPBccXC0XcesVyy7ohlXgO18Tz/cZKSRt/33uIb
         4DKUTozELOoLg==
Message-ID: <1f8a913cabe91fe76bed782866f05181.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310075535.3476580-2-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com> <20230310075535.3476580-2-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: clk: rs9: Add 9FGV0441
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Mar 2023 10:55:59 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Alexander Stein (2023-03-09 23:55:33)
> This is a 4-channel variant of 9FGV series.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-next
