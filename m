Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6180120684
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 14:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbfLPNAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 08:00:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:56592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727737AbfLPNAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 08:00:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576501237;
        bh=fAiZMQRq7xC7a6Y9Al9bGYDwrMK8no5KSxcB6Mofn4Y=;
        h=Subject:From:Date:To:From;
        b=SIlC3QFioeWAhzHGoLhOYGm8RbAGHGuJD+sTba32aH1BUpcE9D5ExrKrzvkqeIZPi
         azdhraP/xdCjy9kbhxtrb47uOXLmZxf5htH2Udn1tttXZwG5XJhc0lDsTDkf4BoxdS
         K2Ek6fxnSDOjlPSgSAldmxCA2Miu20bevTTAI8VU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157650123722.21724.13649554809848442527.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 16 Dec 2019 13:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] arm64: dts: renesas: r8a77961: Add more device nodes (2019-12-16T12:47:37)
  Superseding: [v1] arm64: dts: renesas: r8a77961: Add more device nodes (2019-12-05T13:59:30):
    [1/6] arm64: dts: renesas: r8a77961: Add RWDT node
    [2/6] arm64: dts: renesas: r8a77961: Add GPIO nodes
    [3/6] arm64: dts: renesas: r8a77961: Add RAVB node
    [4/6] arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
    [5/6] arm64: dts: renesas: r8a77961: Add I2C nodes
    [6/6] arm64: dts: renesas: r8a77961: Add SDHI nodes


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
