Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB90E2680E4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Sep 2020 21:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgIMTAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Sep 2020 15:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:55126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgIMTAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Sep 2020 15:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600023646;
        bh=haGT2rveSwhvmzaYoit3RtStMBHgwzFSM7K9sSXTXQk=;
        h=Subject:From:Date:To:From;
        b=B6yBQqPdTzdsR2bly52Jx313CwwNhoQqbANow6u/Euu13fIjsMqmc85cMZYgU5KlM
         fGauGv9HcoBbzn9W4xi8uxllnt8LWbYsLgDo3wLyU8SXdYMQDDiAQEp2hhZfuUG32C
         Ur983HvjQnCrUgZrGNPn9uP3GjIBC6DOzJKRWQ+4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160002364617.7638.5969392634463931552.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 13 Sep 2020 19:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-09-13T18:42:44)
  Superseding: [v3] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-08-24T19:04:04):
    [v3,1/2] media: i2c: ov772x: Add support for BT656 mode
    [v3,2/2] media: i2c: ov772x: Add test pattern control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
