Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC9A7C8372
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 12:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjJMKns (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 06:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjJMKnr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 06:43:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4644AD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 03:43:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44322C433D9;
        Fri, 13 Oct 2023 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697193825;
        bh=XYLpwKUL8qMIh/EQMQr/uGImOVYyaUVK/fZkpasK5JE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=O5EeFIvzC1VAynzxayVEvE6G+yy5PN8Qupf+PM7jMDRN3oG9Bmp+UUpSYO3WaE2LX
         6CXbnE+MncG9ZCs0mlwrjiDpLu1xKtJ3ip+mcnaX+4Ni/2KqbzTIjnBxX6MeKncozo
         RDEJaPZj4VP5KaGUHbnfuYW7qE+PTi9uieZcmEBgg0Wpn/zhcDr2GKaGhoxzwitNgj
         BHNwVh/+0X2Q6jsU6z4LI81ciY6DnHxTiCw8KMuyyGnFAfaTdhojSwq7livAWsUvbq
         LfIDDUmpI+o6aUEKWttd+Q0buQUAoWVZ05D/om7NO3rYpr1US6aFugZhy7MCsllsQr
         hmICMAESHygIg==
From:   Vinod Koul <vkoul@kernel.org>
To:     kishon@kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231011081817.257113-1-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/2] phy: renesas: r8a779f0-ether-serdes: Add
 Re-initialize code
Message-Id: <169719382387.165658.2498971113931936275.b4-ty@kernel.org>
Date:   Fri, 13 Oct 2023 16:13:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Wed, 11 Oct 2023 17:18:15 +0900, Yoshihiro Shimoda wrote:
> This patch series can re-initialize this PHY after called phy_exit() and
> phy_init() again. Such re-initializing the PHY will be needed for system
> suspend/resume.
> 
> Yoshihiro Shimoda (2):
>   phy: renesas: r8a779f0-ether-serdes: Reset in .init()
>   phy: renesas: r8a779f0-ether-serdes: Add .exit() ops
> 
> [...]

Applied, thanks!

[1/2] phy: renesas: r8a779f0-ether-serdes: Reset in .init()
      commit: aa4c0bbf820ddb9dd8105a403aa12df57b9e5129
[2/2] phy: renesas: r8a779f0-ether-serdes: Add .exit() ops
      commit: 1a5361189b7acac15b9b086b2300a11b7aa84c06

Best regards,
-- 
~Vinod


