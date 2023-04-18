Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551086E609E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjDRMHg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 08:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjDRMHZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 08:07:25 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37052CC1C;
        Tue, 18 Apr 2023 04:58:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id E09956431C35;
        Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id B6Yt8ebaHouj; Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 804F76431C58;
        Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XEMwWWoYDvMQ; Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 60C8463CC168;
        Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
Date:   Tue, 18 Apr 2023 13:58:56 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Christian Loehle <CLoehle@hyperstone.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Message-ID: <1186364892.150923.1681819136247.JavaMail.zimbra@nod.at>
In-Reply-To: <f50de2461dae4931abf3f0216b836fd1@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at> <OS0PR01MB5922B8343E772A762315F764869D9@OS0PR01MB5922.jpnprd01.prod.outlook.com> <971572458.117024.1681798584774.JavaMail.zimbra@nod.at> <02ceda502af34bf0af53d52598a0b71f@hyperstone.com> <522326845.127346.1681805484949.JavaMail.zimbra@nod.at> <f50de2461dae4931abf3f0216b836fd1@hyperstone.com>
Subject: Re: Poor write performance to boot area using rcar-gen3-sdhi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOAvOJ8Zmg==
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
>> Can it be that rcar-gen3-sdhi changes some timings after switching?
>> Either in software or on hardware.
> 
> Neither should be aware of the notion of a boot or user area partition.
> Anything below mmc/core isn't, if we exclude the boot operation which is read
> only, so not applicable to your problem.
> So also a
> while true; do dd if=/dev/zero of=/dev/mmcblkXboot0 bs=128K status=progress;
> done
> gives you like ~50KB/s consistently?

Exactly. 

On the other hand, the very same command on /dev/mmcblk1p13 gives me always between
17 and 20 MB/s.

Thanks,
//richard
