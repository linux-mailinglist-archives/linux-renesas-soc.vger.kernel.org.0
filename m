Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33023165E95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2020 14:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgBTNUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Feb 2020 08:20:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727943AbgBTNUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Feb 2020 08:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582204837;
        bh=/5A5mO1xeq5J4dLSbZxwTxIanUA85sl2hQoFKirDvR4=;
        h=Subject:From:Date:To:From;
        b=2gD0+HYjGQrZziu/hpcJsVVXQXXFeFs/VvViSpaCsD7hX3NBH5dk2neQxRmfNHzZ1
         mXjuVUvH4zxSmkI5899HvrcB5K6cDqKHOdbM2Qakibsa837fZk/zavAV1mfARa5B/3
         RhSUeEb7c/QyNt9k6PRrmb6AUaa9x9jRRl6448AQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158220483699.9761.4682283888565347874.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 20 Feb 2020 13:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] gpio: of: Add DT overlay support for GPIO hogs (2020-02-20T13:01:47)
  Superseding: [v1] gpio: of: Add DT overlay support for GPIO hogs (2019-12-30T13:38:50):
    [PATCH/RFC,1/2] gpio: of: Extract of_gpiochip_add_hog()
    [PATCH/RFC,2/2] gpio: of: Add DT overlay support for GPIO hogs


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
