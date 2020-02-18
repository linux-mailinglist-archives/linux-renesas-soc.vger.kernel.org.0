Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5101625A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 12:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgBRLkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 06:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:44430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgBRLkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 06:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582026036;
        bh=jhbBZ85i9n7k41Mf1SDcMRLUu6zTansHEChmQT0LmYI=;
        h=Subject:From:Date:To:From;
        b=ZC+UO6nZQeUinaZ0hrMQHqsfzCALRuVN2R/5gPO1kHxmLct9buWSc5GxWxIDfzRGn
         jDBjsxsfsZOi0paEdthiXhULs4ELnRfZYRg4YY3EdWM8oyZ9O3iX/P06r5cSzEP5kt
         04Mwu7whL4XObf7q04EjzHv3/2pUNI1AGK73m9sk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158202603666.26468.17292952619806467290.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 18 Feb 2020 11:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] pinctrl: sh-pfc: Remove use of ARCH_R8A7796 (2020-02-18T11:25:57)
  Superseding: [v1] pinctrl: sh-pfc: Remove use of ARCH_R8A7796 (2019-12-11T10:03:08):
    pinctrl: sh-pfc: Remove use of ARCH_R8A7796

Latest series: [v1] clk: renesas: Remove use of ARCH_R8A7796 (2020-02-18T11:25:25)
  Superseding: [v1] clk: renesas: Remove use of ARCH_R8A7796 (2019-12-11T10:02:20):
    clk: renesas: Remove use of ARCH_R8A7796


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
