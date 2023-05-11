Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B966FEFFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 May 2023 12:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjEKKfV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 May 2023 06:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236816AbjEKKfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2023 06:35:20 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7030EA7;
        Thu, 11 May 2023 03:35:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id E8988615C9F5;
        Thu, 11 May 2023 12:35:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id LDkxuyXXLkqL; Thu, 11 May 2023 12:35:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 545BD61B8B4D;
        Thu, 11 May 2023 12:35:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id u3mttOWBUBDr; Thu, 11 May 2023 12:35:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 30A9B615C9F5;
        Thu, 11 May 2023 12:35:04 +0200 (CEST)
Date:   Thu, 11 May 2023 12:35:04 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Christian Loehle <CLoehle@hyperstone.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Message-ID: <673489738.9276814.1683801304117.JavaMail.zimbra@nod.at>
In-Reply-To: <94f03374781b4e978a39699815b21803@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at> <522326845.127346.1681805484949.JavaMail.zimbra@nod.at> <f50de2461dae4931abf3f0216b836fd1@hyperstone.com> <1186364892.150923.1681819136247.JavaMail.zimbra@nod.at> <1273293952.226564.1682003880265.JavaMail.zimbra@nod.at> <398e244a4d3746f1bd7b4c32d1ea70e3@hyperstone.com> <615854031.8233438.1683631700226.JavaMail.zimbra@nod.at> <94f03374781b4e978a39699815b21803@hyperstone.com>
Subject: Re: Poor write performance to boot area using rcar-gen3-sdhi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOAvOJ8Zmh6KUsXr/ZciBcB4n5SQpfxaAwsASMB9OoY=
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
>> While u-boot does basically all IO with one op code, Linux's writeback via page
>> cache writes 4k wise which leads to catastrophic performance.
>> Using O_DIRECT mitigates the issue, though.
> 
> Interesting, without having tried it out I would expect the 4k writebacks to be
> merged to a bigger IO, too? Given that they are filled sequentially, which is
> the case.
> But good that you got it working.
> If I find the time I will play with it a bit.

I think due to the nature of rcar-gen3-sdhi merging of these BIOs is not possible.
There seems to be support for some variants, though:
https://elinux.org/R-Car/Merging-MMC-block-requests

Not sure whether I find the time to dig down that rabbit whole too. ;-)

Thanks,
//richard
