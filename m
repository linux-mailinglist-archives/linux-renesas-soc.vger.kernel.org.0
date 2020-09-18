Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791A826F72B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 09:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgIRHk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 03:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:32888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgIRHk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 03:40:27 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600414827;
        bh=ZVhpqk2+9VTtHCRYUB+qo3+78RlYuBjEpLY09QCxj8w=;
        h=Subject:From:Date:To:From;
        b=Kf68BWhZd3pVSxexkIfamOWAiklV87tsT4v/uQTT7is+hqpuDsHBuc884eh+PdEcQ
         FbDEtiCAfYYo5UlqwlWkm1nbqmB1Tb+ekiAxEjOmlAaXdeOOuUGUTFWveujEfMl9BF
         AtWr6YZi0elIp8QMfbuLwd9xvB9BvcaV86xBNQc8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160041482763.10030.6551109487570777491.git-patchwork-summary@kernel.org>
Date:   Fri, 18 Sep 2020 07:40:27 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable R8A779A0 SoC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=350729
  Link: <20200917132205.8685-1-geert+renesas@glider.be>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
