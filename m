Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4332961A3E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 23:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiKDWJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 18:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiKDWJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 18:09:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1CD2D746
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 15:09:43 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bj12so16619720ejb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2022 15:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E5tz9kDARs7bEUpBgBU6vkYUGWPrxNGs4ZuVgd2D+O0=;
        b=e63z/xZTYHs+wM70ZKty1cPbCAJVughzXg6uyiyaGr4cCcS0EUngASMR2Dey8Nlmv7
         x471ErFdwXhh+agGiW0u8Eq3IYAq9L/OnLJeEXQe+A8bvEWUY8B4ZkTJcJ0B1+m52KiB
         S3AZIRjpXmbUkG4EZ1HigN+/i/Cs9nHE0sy33v10NAHFH3zW4n4RbfKymGQ8putGtZqF
         xxmkin+/H9oOa9ZTnOEa75YpnyUUUNQUJi/FSky8KTyQMHgg0kpT2SFs1RPgwxCDQ+4B
         EBg4GVS+Vk0fjg1pDV9mRzU2JB/QN1Ubeav5I2M8MjtQUXTu3efFkVMRmE9+3e37Iwv5
         u7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5tz9kDARs7bEUpBgBU6vkYUGWPrxNGs4ZuVgd2D+O0=;
        b=jfyvjE4vqN5JN+vzS5H/XxuzNBikNh5bqD9f9qsl46RBuHDHPqRuPmRZef6N17NPst
         VihvMTkK9aLI3ifghsFEUcRs7jtRt+sfFrNhpF55czhYl4VL2MEMlx1PiairSrpYWxDA
         yGyRHgI6JnZxsnRwx4GjEe9pmNLGmgfQhV4T4wOwTVkxSNZ9bL6Tb5se2tsbMLAG6wA7
         NtYvfoNnelmCZN0m0DS89OwBNtmRLeBdB/tdlfr+UnyRPapIcs3ryqyQ5J8+ziv//8Hk
         4SgR17lMKAEX9BjUjpx2p1Sy0dpgLFkED8T/4FWFEFluWVTcbC4Jwot04umwYnTmf1hN
         z4fw==
X-Gm-Message-State: ACrzQf3P0N/91hsxCO3dM5Zs3sdRdIvrRv7DisNdFNzrpC1WeBxq1KPv
        FxRs9n7skDODqzDd0nkk6R3r8fEIHLvQbWyrzXo=
X-Google-Smtp-Source: AMsMyM7hOSo+MPQXTisKR46l8SXpBysoB5PG9CesHQ2UESeL+vAR1QVi8uCrmFqSUiYhWdkrvAt0e9X58nXzuNA6TwE=
X-Received: by 2002:a17:906:371a:b0:7ad:c01c:6fa0 with SMTP id
 d26-20020a170906371a00b007adc01c6fa0mr32068491ejc.267.1667599781913; Fri, 04
 Nov 2022 15:09:41 -0700 (PDT)
MIME-Version: 1.0
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 4 Nov 2022 22:09:15 +0000
Message-ID: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
Subject: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <Conor.Dooley@microchip.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

When trying to add non coherent DMA support for the RZ/Five SoC, I was
suggested to use the ALTERNATIVE() macro [0].

My initial intention was to implement the alternative_call_x()
something like what x86 has and from there call the C function, So
while doing some experiments I realized that using the asm "call
<func>" would cause adding the whole lot of registers in the clobbers
list.

As per my understanding the only correct approach to
alternative_call_x() is if the function itself is inline assembly then
we know the exact registers being used and then we could add them
appropriately in the clobbers list.

The problem with the above approach being we have quite a lot of C
code [1] for the CMO and it also requires some register writes of the
l2 cache controller, converting this to assembly would be a pain.

* Is my understanding correct?
* Is there any other approach I am missing?
* Is there no way out apart from implementing inline asm?

[0] https://patchwork.kernel.org/project/linux-riscv/cover/20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-riscv/patch/20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar
