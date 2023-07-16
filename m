Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013B0754F88
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jul 2023 17:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjGPP5m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jul 2023 11:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGPP5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jul 2023 11:57:41 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCB619F;
        Sun, 16 Jul 2023 08:57:40 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4R3qc12psYz9sV5;
        Sun, 16 Jul 2023 17:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1689523057;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AvW7ivbiC4vJ0koaGM/eRr/3dmmbc2d5kmAXaxxlNAs=;
        b=kKBrg2smGJjFriD3XqhaZGuN4W4XCHF7wngq7Il4qDoN0V8mghoWZM5c9Gn8vNpZjN/nin
        zGKgSr9/9q3RHOSzdqq8sdbcoTf3lFnNxGJkVq9zmVQkhWmUnIoHTBeEv1rgfZ7qaIHJOk
        4dzrFSB6ZDD67vUsnMpx+Ptv8jcUvCZSaXRn/6qs4K0nYkethmG271ZGp0r0Z9rv8azzTu
        oeyECT1viOWiPoxO/znKdiqTbSac+vHct5CXkpS5T9g9sfvOrI/5gGu93UIQW7TdRCFs4n
        IQ+7s8j82tGkizziYtCVXU67zL9ZTEYqxoUKeDCCBj56rR6namD9o5LH4zwVFQ==
Message-ID: <a89c516d-8d25-98ec-c93d-cc7250244569@mailbox.org>
Date:   Sun, 16 Jul 2023 17:57:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] clk: vc7: Use i2c_get_match_data() instead of
 device_get_match_data()
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
 <20230716154442.93908-3-biju.das.jz@bp.renesas.com>
From:   Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20230716154442.93908-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1dmgjf5zhrsm38ard9cg6thoz5rcwxdr
X-MBO-RS-ID: f2a5087f8b2d99bb4d6
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
