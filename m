Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF40221F94
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 11:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgGPJUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 05:20:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:55058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgGPJUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 05:20:35 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594891235;
        bh=Mp5bUYPPuzLxkia2WfckgQ8MYd/yZrdgNyAid9sFOR0=;
        h=Subject:From:Date:To:From;
        b=0F9zHJqm0EmBd7mJWnmFX/dncHc0hnIzsfQGGPPRdn+zBax3LHAmmv38AubpzTA3J
         hBynZvK/FQLYd/ECOhsjqZR8crMPfMOunm5HKIIvStdtvH3KxE1ZU2BvZXrl/BVOp1
         wlIVZXM1pJ/cky1ZR0rSDoaRN8UMn9Yc02yfx87Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159489123547.24932.2726029128857939716.git-patchwork-summary@kernel.org>
Date:   Thu, 16 Jul 2020 09:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable R8A774E1 SoC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=318519
  Link: <20200715075824.30154-1-geert+renesas@glider.be>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
