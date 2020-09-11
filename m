Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B4265A6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKHUw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:20:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgIKHUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:20:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599808848;
        bh=xf+8bzXSVb0vKe2yrpG3nJ5x1DuxRnlTeoADLkKUEcc=;
        h=Subject:From:Date:To:From;
        b=IK8vRBsqOf4LCvTG+q1aBdmcn1N0bxxEGVamz0uDvjW0kytWTS4fvmaXHTuOf0hJg
         2Xt3wh+RqotxPq9ka170FF+XT8Yd8Q9Q4iTKLywnyCW87Lf9tkUVAbQfjvdToVOjvz
         MzmX/n1Rnpsq/sKN2cSXk3Wgc6JPL4Q6krXjglVk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159980884851.31954.2254976681479549298.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 11 Sep 2020 07:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] i2c: add slave testunit driver (2020-09-11T07:16:57)
  Superseding: [v1] i2c: add slave testunit driver (2020-06-29T18:53:18):
    [RFC,1/1] i2c: add slave testunit driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
