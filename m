Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0740F2AD8D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKJOaG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:30:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:42212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730070AbgKJOaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:30:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605018605;
        bh=EaT/DQQhFaAzqEz9duHpL+9ciCbk7su6pGfQRtcJ/Ec=;
        h=Subject:From:Date:To:From;
        b=FfiY+TfpY7arxZVzOH7K19ZBVl91J6XbAexqAQHfm3+HNXkd5qBBRGd5qoBiL17HE
         4Bb1Xh+5+o/jBBsYPolJriY9cVIAxMp1TP62PoQkUzeLVYcCN4qiJzoDcnGBkxLK2P
         E7a3MeS2n3lO8UXX/tty+J+iNUd6mcq+OOQptvrI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160501860554.26684.7045000984313229113.git-patchwork-summary@kernel.org>
Date:   Tue, 10 Nov 2020 14:30:05 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: defconfig: Enable R8A779A0 SoC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=380309
  Lore link: https://lore.kernel.org/r/20201109115540.2415328-1-geert+renesas@glider.be

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


