Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557AC2098B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 05:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389565AbgFYDAo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 23:00:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389500AbgFYDAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 23:00:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593054044;
        bh=4GLJUSrZ3SLCHZS59THGK73awXU7jmYs/wetldLWbSA=;
        h=Subject:From:Date:To:From;
        b=yV3CGZb4rBLOPL495WpM/TTjacfhtSt7TK1+zrGclYYyRlrIREAGExxbJeJU4pBhB
         vn/78eis/IBKr/UaGEbF7SYVTVHDaKj3YEv0FQCzb5b7bBt6476YzuYnQsPIqFT9ep
         jGLssK9ERD9CNaC4ED8hOTWpJDSvISGMuKfZlrTc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159305404394.21303.16985122784539432730.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 25 Jun 2020 03:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-25T02:56:08)
  Superseding: [v2] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-09T11:45:10):
    [v2] thermal: rcar_gen3_thermal: Fix undefined temperature if negative


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
