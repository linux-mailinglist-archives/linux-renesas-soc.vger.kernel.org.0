Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE45A20C9C1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Jun 2020 21:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgF1TAp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Jun 2020 15:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:37192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbgF1TAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 15:00:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593370844;
        bh=KB3dJJuYblvKcE7i08jt5cqeKmRYqHEUM2EF5XqosqQ=;
        h=Subject:From:Date:To:From;
        b=Emt/mwbksdp/J6FcRGy0kgV3iIYSqgJJym7n6TxQj8i9VhP5EsVnRdw2UNN5EQ9sm
         DRbEgQkl7zL87GLTAl9o3bHraO3P+ucFneQs7pGPrqLAKJDeGdjxGuOTzlL7rLNa0M
         +YS/dRbQ8ICKD+BMwclp4pg5q9s2ELbt2HmD1fUI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159337084464.27784.11969720340896416064.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 28 Jun 2020 19:00:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] i2c: slave-eeprom: update documentation (2020-06-28T18:54:26)
  Superseding: [v1] i2c: slave-eeprom: update documentation (2020-06-28T18:45:54):
    i2c: slave-eeprom: update documentation


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
