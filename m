Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23461EE565
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 18:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbfKDRAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 12:00:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:43722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbfKDRAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 12:00:39 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572886838;
        bh=3aQ5tTRunzPV5t6b9t7ne8/eplFIgtVdE+7kC0AIpLM=;
        h=Subject:From:Date:To:From;
        b=nMjmAQGI/MG53bjXQkb6/ouiSBDjCNid3T3L7mpHOZUr48CbNYm7Kqc08ALQ4hYn1
         l2M59hyrB8O9KrGaqdNbssIairKb5bqNyTvb00/IPmSiktK0l2o2/X8ooa0WZoiyDa
         lW6W72+4eO8Zneibk88UkjzScWRUcuTbrD7xUp14=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157288683882.14783.17596970166817915484.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 04 Nov 2019 17:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] Add LCD panel support to iwg20d (2019-11-04T16:57:59)
  Superseding: [v1] Add LCD panel support to iwg20d (2019-10-30T13:43:30):
    [1/4] drm/bridge: Repurpose lvds-encoder.c
    [2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
    [3/4] ARM: dts: iwg20d-q7-common: Add LCD support
    [4/4] ARM: shmobile_defconfig: Enable support for panels from EDT


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
