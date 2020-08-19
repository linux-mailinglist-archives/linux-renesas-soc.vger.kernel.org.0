Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D3A249F7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgHSNVx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 09:21:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:34508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbgHSNUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 09:20:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597843245;
        bh=hAX9lccsEdwKF+cGg1pvPrcw7WfjzpDkwrgjNeT2JxE=;
        h=Subject:From:Date:To:From;
        b=xBCIuk0lTy+AOzG79VHPRohNCE7lhVRC2yeLbwVMKU83tEtTpjB03cQvnax3o3Bmf
         q2pD/tX/Io3zdkQWtkkvSiJqV2MWxN5oNaRzf7EOEUGFN7d5W9ROyGyZmtsq/n/t/I
         zjVUo0yp0n8JmK3PxBxlOdI67/LGWSDVhlUmbfVY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159784324498.4883.14949197478781523469.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 19 Aug 2020 13:20:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] spi: rspi: Bit rate improvements (2020-08-19T12:59:00)
  Superseding: [v1] spi: rspi: Bit rate improvements (2020-06-08T09:59:40):
    [1/8] spi: rspi: Remove useless .set_config_register() check
    [2/8] spi: rspi: Use requested instead of maximum bit rate
    [3/8] spi: rspi: Clean up Bit Rate Division Setting handling
    [4/8] spi: rspi: Increase bit rate accuracy on RZ/A
    [5/8] spi: rspi: Increase bit rate range for RSPI on SH
    [6/8] spi: rspi: Increase bit rate range for QSPI
    [7/8] spi: rspi: Fill in spi_transfer.effective_speed_hz
    [8/8] spi: rspi: Fill in controller speed limits


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
