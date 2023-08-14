Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6F977BAD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 16:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjHNOBE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 10:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjHNOAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 10:00:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EB110D5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 07:00:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7552A6143A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3CD2C433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692021637;
        bh=7n2DkoZMh1i8SCSVJWwE7LzymKxhiQZ7C47/BeXu+Io=;
        h=Subject:From:Date:To:From;
        b=IQ0dFX4Q7i1bdA9Uhr32Ah7zvcGe4kzXfS8Ty3xw4YvnnuZSW3JDkqV4fH4m4XBdD
         rFfEAnuKWBMKXGifZAevwYuR+Uerhr+mUViO5+yyJZ/pSd7QbrgmZoPJaOomFzwpKB
         SJQCwi2mcsvUONJwJ9L1T/5R4Xoa+W2FmF4A7Dn1TKjMmNgM/c32riJAYOWOZE4dRs
         rNHlkarYM1hSSJjnWqMTIU9bgT8ca4VpML+Rq3sNtM/p+NtGj7II89KT8adyoooBf+
         yxBKbN54Wo2Izi3388PdK1mOj+Br2RoUteQsVEplVbxhMu/ma0KOX1dHVxGLSZCsZ8
         A47AtuPQXBQSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC4CDE93B32
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169202163771.32007.4627563788353353125.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Aug 2023 14:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [GIT,PULL] Renesas fixes for v6.5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770128
  Lore link: https://lore.kernel.org/r/cover.1690463347.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


