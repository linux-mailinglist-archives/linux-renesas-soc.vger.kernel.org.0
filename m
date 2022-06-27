Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12F955E172
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jun 2022 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbiF0Ia4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jun 2022 04:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbiF0Iap (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 04:30:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AA16305
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jun 2022 01:30:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C31DB81037
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jun 2022 08:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59CDFC3411D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jun 2022 08:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656318635;
        bh=mCmmUBOTvNwE50ix2EwV4DnVFbtaLaC+eEAwv3GBbIU=;
        h=Subject:From:Date:To:From;
        b=FinESI2cb5UpXxV1AkxArh6AB65fdIGuYDEQe2N4ig+TIlvL1pmqS7KSeXzgpOToN
         V1JDmnXKUmCRpPYHzgHXDgm5b1SJ6A0ykGp4KmRJ4asyI1H2AHibssP6j23ipLD2fJ
         QPJwD+9nREp0eDlCgJ2vxcPaWUfAbW3fuwNjCS7pFFNCLa7EZzV/6Jq39RNWsXSmPS
         +C2d3zpGmLzmhNGzJBvuMsOk5qBKMVG96uvDI9bb+QtnQiIhRc0Tk0OavqmwFEY2YI
         FZOrhtNhrTlR+ToZeT0KzDr9fIp1ofmpv4ZnEu8mqftbLQq611vpBdS+Lupv2UqSPq
         APjJZNQ5p1nTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3EB02E49BBA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jun 2022 08:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165631863518.19048.17184022532177853692.git-patchwork-summary@kernel.org>
Date:   Mon, 27 Jun 2022 08:30:35 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: dt-bindings: usb: ohci: Increase the number of PHYs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650610
  Lore link: https://lore.kernel.org/r/0112f9c8881513cb33bf7b66bc743dd08b35a2f5.1655301203.git.geert+renesas@glider.be

Patch: iommu/ipmmu-vmsa: Fix compatible for rcar-gen4
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Joerg Roedel <jroedel@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=651226
  Lore link: https://lore.kernel.org/r/20220617010107.3229784-1-yoshihiro.shimoda.uh@renesas.com

Patch: dt-bindings: usb: ehci: Increase the number of PHYs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=650609
  Lore link: https://lore.kernel.org/r/c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be

Patch: iio: adc: rzg2l_adc: add missing fwnode_handle_put() in rzg2l_adc_parse_properties()
  Submitter: Jialin Zhang <zhangjialin11@huawei.com>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=642173
  Lore link: https://lore.kernel.org/r/20220517033526.2035735-1-zhangjialin11@huawei.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


