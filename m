Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8B4F1A1E6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2020 12:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgDHKAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 06:00:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbgDHKAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 06:00:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586340038;
        bh=2jESRE6XpOARH3+Y5xFFKVjlfRYZ+v79IRZZRHPyCZI=;
        h=Subject:From:Date:To:From;
        b=Gw7TDBEcApAx1up51Qa5io9/np7/IvAJVs6kgHvFaQf2fsCHjsQX3CjwNUNl+dPv3
         XvTYhSdiSSZxC5YAMYhxpI4kZXdDwZRDi3iVSOJJkUhrArev7jHltkcgBUG0MKeGMw
         ViZYJSSbwx8vvrTNBDG9M3dKFrDn7+r4TIsdBRvM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158634003891.24657.15406189776981251382.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 08 Apr 2020 10:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] mmc: renesas_sdhi: improve TAP selection if all TAPs are good (2020-04-08T09:46:35)
  Superseding: [v1] mmc: renesas_sdhi: improve TAP selection if all TAPs are good (2020-03-06T09:31:58):
    [RFT,1/3] mmc: renesas_sdhi: refactor calculation of best TAP
    [RFT,2/3] mmc: renesas_sdhi: clarify handling of selecting TAPs
    [RFT,3/3] mmc: renesas_sdhi: improve TAP selection if all TAPs are good


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
