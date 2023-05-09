Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279C56FC4FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 13:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235359AbjEIL2h convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 07:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbjEIL2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 07:28:37 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B50B4237;
        Tue,  9 May 2023 04:28:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 0A1CA62E1AB9;
        Tue,  9 May 2023 13:28:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id KYzEnNfPnUEk; Tue,  9 May 2023 13:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 99407614E2C7;
        Tue,  9 May 2023 13:28:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 6wrSyTHIju50; Tue,  9 May 2023 13:28:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 799CF62E1AB9;
        Tue,  9 May 2023 13:28:20 +0200 (CEST)
Date:   Tue, 9 May 2023 13:28:20 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Christian Loehle <CLoehle@hyperstone.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Message-ID: <615854031.8233438.1683631700226.JavaMail.zimbra@nod.at>
In-Reply-To: <398e244a4d3746f1bd7b4c32d1ea70e3@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at> <971572458.117024.1681798584774.JavaMail.zimbra@nod.at> <02ceda502af34bf0af53d52598a0b71f@hyperstone.com> <522326845.127346.1681805484949.JavaMail.zimbra@nod.at> <f50de2461dae4931abf3f0216b836fd1@hyperstone.com> <1186364892.150923.1681819136247.JavaMail.zimbra@nod.at> <1273293952.226564.1682003880265.JavaMail.zimbra@nod.at> <398e244a4d3746f1bd7b4c32d1ea70e3@hyperstone.com>
Subject: Re: Poor write performance to boot area using rcar-gen3-sdhi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOAvOJ8Zmh6KUsXr/ZciBcB4n5SQpQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "Christian Loehle" <CLoehle@hyperstone.com>
> There are probably some more differences if you really want to go down that
> rabbit hole,
> like different bus modes for uboot and linux.
> Anyway I don't really know how I could help you out here, if you could provide a
> trace showing the busy times,
> that would be a smoking gun for the eMMC vendor.

So I went down the rabbit hole.
After analyzing the operation traces from Linux and u-boot in more detail I had
another chat with the vendor. It turned out their boot area *is* different,
it operates on a much larger internal block size.

While u-boot does basically all IO with one op code, Linux's writeback
via page cache writes 4k wise which leads to catastrophic performance.
Using O_DIRECT mitigates the issue, though.

Thanks everyone for your valuable input!
//richard
