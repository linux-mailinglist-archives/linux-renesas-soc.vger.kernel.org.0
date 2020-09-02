Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB825A7AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 10:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIBIUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 04:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIBIUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 04:20:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599034842;
        bh=V+J842c1EEvMAVSIjCmaO0GwOFcikCSg3qqhAaNvamQ=;
        h=Subject:From:Date:To:From;
        b=0ARxga+j8PoH0V7HHrWgScu9blcE7v72BE0lUyIXElU5gWoDgfLgWkZULt8etXf+0
         Y/IcnbBV7U6XApcOEsw4xeXT8JB48VkuI3loRGRpH8ufUj2cXAn0f5ztEXKkh18rdh
         aK8QAT0KEWs2BRouFDD0hqaEzMLCzs1zcO41YazI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159903484217.11361.2063839608841624805.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 02 Sep 2020 08:20:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] mmc: renesas_sdhi: support manual calibration (2020-09-02T08:18:10)
  Superseding: [v1] mmc: renesas_sdhi: support manual calibration (2020-06-05T10:12:21):
    [1/2] mmc: tmio: add generic hook to fixup after a completed request
    [2/2] mmc: renesas_sdhi: support manual calibration


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
