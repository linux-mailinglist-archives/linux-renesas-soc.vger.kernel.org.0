Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2C961A033
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 19:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiKDSnR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 14:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiKDSnO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 14:43:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B5E2497D;
        Fri,  4 Nov 2022 11:43:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 378A0B82EF9;
        Fri,  4 Nov 2022 18:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6F8C433D6;
        Fri,  4 Nov 2022 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667587389;
        bh=b0iolmf8VOPUkT90B7FyzHxPzj3yAK1SCR1Dm1JkQnE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XrAjNSLcZywAamBIuDuDZDW1cOe54XjFjDA2MVJc3jAmE+HtXisxZWm3qAB+54wdK
         EE0giey9eK8Q7+rJC0WkBUFYkInEkAgd3VYTUj7AkDyazZnhubz8/XyHbG6iX/g4Tq
         Pq14xj3XbjT8DFT7xJfiYHcQwYkdLIWBbPICzkD13hswYAocVsG0AUVwjLPSuBcL73
         yoON7XUjKPolvv8JDnwnuHc0Lf2AStRtRLdtL0ruq4jCPZh2dn+0rHO8mXuetYqssr
         fQQ4W6CqtbjLHMQHzlj2dz874QF7FQf7HXrr7H7rIxkvcEa1rJz6mjMb+U53U3nrDr
         wPDqLEG7XNZxA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1667559042.git.geert+renesas@glider.be>
References: <cover.1667559042.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 04 Nov 2022 11:43:07 -0700
User-Agent: alot/0.10
Message-Id: <20221104184309.CC6F8C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2022-11-04 03:57:17)
>         Hi Mike, Stephen,
>=20
> The following changes since commit a9003f74f5a2f487e101f3aa1dd5c3d3a78c69=
99:
>=20
>   clk: renesas: r8a779g0: Fix HSCIF parent clocks (2022-10-26 12:05:36 +0=
200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.2-tag1
>=20
> for you to fetch changes up to 02693e11611e082e3c4d8653e8af028e43d31164:
>=20
>   clk: renesas: r9a06g032: Repair grave increment error (2022-11-01 10:15=
:28 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
