Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2E43AE5A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhFUJM0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:12:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:42982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFUJM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:12:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FB8161002
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624266612;
        bh=MdICRXAnGKci9EjY8ZEdW3Z1NuKg9FQAfCI+g46OF4c=;
        h=Subject:From:Date:To:From;
        b=oYCuOmik0iLy2eiT4giikAEIpzADCyJANnfOiFI4xDaZRGMBKkrYjkO68U+a4wZ/Z
         qiOBivczkbVL+TmrZda6mDPWkPfNF/gNX1rnwvkMxdoemYKwh6B7O49bajg1iFO6io
         OMjYdXpjDm6PFuUPwACfiZQUF07r/fJ+wj4JNnTndifWanXtEBsChhkZCBbY2dyUsD
         0JcMuEclQLYj/eHJ4wY5HX1eYj4wBMdtK3ZS1RXAvP5eqzgKRhfEE5eJd7CSOqD7No
         7TIrnUx358eYbpce1TWKDgn5ZTgXTSwi2eIz0Fv7Y0bM8wdPP9/2O2XTpR7Dnqtqq1
         sTwNuzTkkM1Mg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2D942604EB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 09:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162426661212.25488.12122894116476828619.git-patchwork-summary@kernel.org>
Date:   Mon, 21 Jun 2021 09:10:12 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: sh_eth: Avoid memcpy() over-reading of ETH_SS_STATS
  Submitter: Kees Cook <keescook@chromium.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=501835
  Lore link: https://lore.kernel.org/r/20210616195333.1231715-1-keescook@chromium.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


