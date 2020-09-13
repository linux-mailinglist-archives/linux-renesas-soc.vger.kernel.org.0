Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703F0267F75
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Sep 2020 14:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgIMMUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Sep 2020 08:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:47606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbgIMMUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Sep 2020 08:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599999643;
        bh=mfo7GgrBiqBWn3P8dhmVhO1Ux4Yh60cBRDkM0hu5VK8=;
        h=Subject:From:Date:To:From;
        b=2D+LZCVGRv3aaEqewVXWKQZo5DwnBc2uNGCnHYHG3Pb920v0iOtrJ8D5fdcGMp7m0
         BStrVFfeH54yPt1fP9TG9jaDBS/21RGK86KmlpMFnqC5xs/iIqldatP/Y0c2h5yXFz
         GhUpGHr3eFRcKDhRWd/sEGOf/86fs3LqE+9QdkY4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159999964294.31639.11983522005533116778.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 13 Sep 2020 12:20:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] rcar-vin: Remove redundant compatible values (2020-09-13T12:17:56)
  Superseding: [v1] rcar-vin: Remove redundant compatible values (2020-08-02T17:30:59):
    rcar-vin: Remove redundant compatible values


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
