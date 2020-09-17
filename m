Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B858426DEF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 17:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgIQPCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 11:02:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727786AbgIQPAs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 11:00:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600354848;
        bh=03jS7HPpQsje3HDM3f3WKfjfGRbcPSci7ZqTvtzVS6o=;
        h=Subject:From:Date:To:From;
        b=nEw0CWcAIEYTRa9dyt2n/9jbd8hiQi2jNp4QsYRGCMK6+AYlr/igy7Ho+fxBr34DJ
         oSR7A/1/ZeL1JEp10kSunMPAptl58lSO2LisgoVkABeP5sFwKXUNwM8bZTvNCsM/pu
         snYVLFXe6CEuNZcW6KlhDTAaTcd17g4AGntBPNvo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160035484864.18784.12044194547866194516.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 15:00:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] Run as user, and python3 support (2020-09-17T14:04:47)
  Superseding: [v1] Run as user, and python3 support (2020-09-16T14:43:00):
    [VSP-Tests,1/3] gen-lut: Update for python3
    [VSP-Tests,2/3] src: monotonic-ts: Monotonic timestamp logging
    [VSP-Tests,3/3] scripts/logger: Use new monotonic-ts tool


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
