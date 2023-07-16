Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA45754F86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jul 2023 17:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjGPP5I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jul 2023 11:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGPP5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jul 2023 11:57:08 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E35619F;
        Sun, 16 Jul 2023 08:57:07 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4R3qbJ38XNz9slQ;
        Sun, 16 Jul 2023 17:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1689523020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AvW7ivbiC4vJ0koaGM/eRr/3dmmbc2d5kmAXaxxlNAs=;
        b=W8pXgGYPIe7BlSfYNaMM7K50TU+E3EKF6bSzhVIUm4DzfQDb0gxstbSYQAaRhrtZMWiFe+
        JZgNhGU7d8z3ZPrXcQdAvTbZDl6KfgwLXCNJuWvfDTvQ+z+CaBC8DSNUrIL+M4n19rC0OY
        tTRnQI8zhTMHLGBcMAPD6qMlCJJXhTOzzA+12PbSl49pcSfpC6M2+asYyN/vPwYOGnqqIm
        3aV/8dI3SSWsnWAQVe6Dj9dkKct59mRoPwRHw7bUGQ8mz5libqOvuz6jmp7cB7WYFUoztr
        NoJP4vAzHm+U2hyG7S10VGWHx5Cc0mHRykvp7nT0nksz0gy6D1wh4wcSfFhDTg==
Message-ID: <0dc96851-94c4-763e-2bc2-4bfae763611b@mailbox.org>
Date:   Sun, 16 Jul 2023 17:56:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
 <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
From:   Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0c494117dbc4bd0464a
X-MBO-RS-META: g7a1xbfqn6u63pefanu49rthpo6zpewy
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/16/23 17:44, Biju Das wrote:
> The device_get_match_data(), is to get match data for firmware interfaces
> such as just OF/ACPI. This driver has I2C matching table as well. Use
> i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> matching.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
