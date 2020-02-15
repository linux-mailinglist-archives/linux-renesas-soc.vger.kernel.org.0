Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6E016006D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Feb 2020 21:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgBOUUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Feb 2020 15:20:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726254AbgBOUUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Feb 2020 15:20:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581798041;
        bh=At715P3fx4VyFEQBaSEeE7eIQL8XbV5Kwl7CjutZpHM=;
        h=Subject:From:Date:To:From;
        b=P2n45vTYqAAwA1yWeugVDhUAwK091Ue9/OeNghxasXWfh60O+OkymKW47rGhUsN48
         fvYj7c8py+RmmaFPDrqEsKqTVrcNlqCgdEw/RZfCoh7cynE8mBm2wXLejGZc4cgYTj
         ify8fVeaC4Wj7Wze2wfKUgDRuu4C7Yn5kHIrBiCE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158179804107.17085.791244455598590906.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 15 Feb 2020 20:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] sh_eth: get rid of the dedicated regiseter mapping for RZ/A1 (R7S72100) (2020-02-15T20:06:27)
  Superseding: [v1] sh_eth: get rid of the dedicated regiseter mapping for RZ/A1 (R7S72100) (2020-02-03T19:34:14):
    [RFT,1/5] sh_eth: check sh_eth_cpu_data::no_tx_cntrs when dumping registers
    [RFT,2/5] sh_eth: check sh_eth_cpu_data::cexcr when dumping registers
    [RFT,3/5] sh_eth: check sh_eth_cpu_data::no_xdfar when dumping registers
    [RFT,4/5] sh_eth: add sh_eth_cpu_data::gecmr flag
    [RFT,5/5] sh_eth: use Gigabit register map for R7S72100


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
