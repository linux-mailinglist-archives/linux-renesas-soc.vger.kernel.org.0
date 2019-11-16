Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E277CFE8F2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2019 01:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfKPAA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Nov 2019 19:00:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:50248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727141AbfKPAA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Nov 2019 19:00:27 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573862427;
        bh=LVkE7KUj5fBoNcR7ENLUUHrcSlo2CA2DHEqXYamrc1o=;
        h=Subject:From:Date:To:From;
        b=o0m1LdvGCRh5gi9OHRSpm2Xk8BLFIOLMvmBDxTWsciBRGxWoz7nnADYdDw4deTItH
         YNmXr5+rmb6E13DwgQu5Fcwn3fiWKEcbquBg5x884hE8pD+mD6u7o1nVCj8r4KJolZ
         Tc39/CACFE9wac/S/QPK6r+p+M790FllNGzBAOXA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157386242715.18040.15307399413598979436.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 16 Nov 2019 00:00:27 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2019-11-15T23:55:54)
  Superseding: [v1] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2019-10-15T14:35:50):
    [1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
    [2/3] rcar-vin: Make use of V4L2_CAP_IO_MC
    [3/3] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
