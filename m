Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA1426F72A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 09:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgIRHk1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 03:40:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:32868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgIRHk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 03:40:27 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600414826;
        bh=obm2z8BDQzj93kP4IGobtAtAueXbcC4OL5gfpVDHemg=;
        h=Subject:From:Date:To:From;
        b=du2+jCz3YJ6hj/p+P8OlC50H3jQu1c/JOZyyT/4SGNJrL5uaVYPwCYupfXCyyy+d8
         WYUYTIGs4gKR3i5pcmfWbzQPbMWEWXSY9qyTxbPb67HAEFq8O8+ZwBFSdo2ot+u3OB
         TqRLpbJscuLtjxp2ckF3Qf0Qa4PbXDGxtMSFr0Ko=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160041482683.10030.12150904847795606321.git-patchwork-summary@kernel.org>
Date:   Fri, 18 Sep 2020 07:40:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: arm64: dts: renesas: Fix MSIOF1 DMA channels
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=350721
  Link: <20200917132117.8515-1-geert+renesas@glider.be>
    Patches: [1/2] arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
             [2/2] arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
