Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25F36E5BBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjDRIMO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjDRIMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:12:13 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F61D728D;
        Tue, 18 Apr 2023 01:11:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id B90AE6431C28;
        Tue, 18 Apr 2023 10:11:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id sU5jy21Oh8pk; Tue, 18 Apr 2023 10:11:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 544936431C2D;
        Tue, 18 Apr 2023 10:11:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id PPFYUpACBZ0M; Tue, 18 Apr 2023 10:11:25 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 29F2A6431C28;
        Tue, 18 Apr 2023 10:11:25 +0200 (CEST)
Date:   Tue, 18 Apr 2023 10:11:24 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Christian Loehle <CLoehle@hyperstone.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Message-ID: <522326845.127346.1681805484949.JavaMail.zimbra@nod.at>
In-Reply-To: <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at> <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com> <971572458.117024.1681798584774.JavaMail.zimbra@nod.at> <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
Subject: Re: Poor write performance to boot area using rcar-gen3-sdhi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x
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
> Your eMMC likely treats the boot partitions differently than the user area, e.g.
> in regards to cache.
> Is this reproducible for more 4k writes? What about larger writes?

Yes. So far every write size I tried is slow.
Sometimes (1 out of 50) small writes are fast, that's most likely a caching effect
of eMMC internals.

> The eMMC might not even have the mapping available after boot and first has to
> internally switch to it, in contrast to at u-boot stage?

Wouldn't that explain only the first slow write?
I see poor write speed also on repeated runs.
 
> Anyway this is probably more a question to your eMMC manufacturer and nothing
> the host is to be blamed, as you mentioned yourself, the time is spent at
> CMD25.

The eMMC manufacturer says there is nothing special about the boot area
and write speed should be equally fast.

Can it be that rcar-gen3-sdhi changes some timings after switching?
Either in software or on hardware.

Thanks,
//richard
