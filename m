Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5D42745E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Sep 2020 18:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIVQAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Sep 2020 12:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIVQAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 12:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600790446;
        bh=uUxNn+4sXGhDhPsVAEBdY07D/f2kUwh1bi6XMQhrcSk=;
        h=Subject:From:Date:To:From;
        b=LaiJSW4wW7j/l/Ry5km8tDOqplmR1D2lZUVAZIxR7PVJRfefGB88J2mTpmG/xnroV
         kpkU9mIYA3flOtJbVTNSGNOjseYSEP9ziPlb8fjg5wtOE5JomdFSBnCGROgJPERzIp
         SHegG4e+3qUuf/esr89Km48zIeEDHB2m/Tp2cNX0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160079044618.15521.6124054881546226208.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 22 Sep 2020 16:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] i2c: sh_mobile: implement atomic transfers (2020-09-22T15:49:43)
  Superseding: [v2] i2c: sh_mobile: implement atomic transfers (2020-06-18T15:05:32):
    [v2] i2c: sh_mobile: implement atomic transfers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
