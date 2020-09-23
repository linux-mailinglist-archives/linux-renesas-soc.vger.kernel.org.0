Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DED27573F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 13:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWLkq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 07:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgIWLkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 07:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600861245;
        bh=eA+lA49ZMljfbAfurGBByJdKtm71R+Gd7fN20Cm9ays=;
        h=Subject:From:Date:To:From;
        b=usyo0f6eftbXN7uivOcL4Uad66vVaIJ0xIBLSTzY7Cks71AbrPDPu7rJ9n6AlVUvc
         A/GLEPg5EHW1CmAD1QhnpPdUFWUu/6ibc/4efuBDWlLgySZkKz90yduwkgtdT0PMMw
         ofWiGzOowZAtRXMUmgItBn6WxGTl1sKbcekMX8R4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160086124559.18822.16109843443087340799.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 23 Sep 2020 11:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-09-23T11:31:42)
  Superseding: [v1] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-09-23T08:44:58):
    soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
