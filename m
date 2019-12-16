Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA461200E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 10:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLPJUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 04:20:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:36474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfLPJUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 04:20:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576488030;
        bh=65EnLaggudXTzuxvS0gxuqXUNExiMIJNcH7Z4BkwUF8=;
        h=Subject:From:Date:References:To:From;
        b=zaU5nFtLdZFrUtfXeBK0Dl3Q8/W2zRyIVRt5fB+V/+8Az0jmNijPTgM/TA6hbSMzN
         /DMiUK+clxQV6WX9kKGecTpbJYx8vM+wkFqYyaYIPeHaKlYMH+doYMaSbBGI2bP/gQ
         hlAP4a5K5ZtSCuFCx1RmF2ZnvwyGmrFAN88Nsvi0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157648803037.9846.2305689375357790633.git-patchwork-summary@kernel.org>
Date:   Mon, 16 Dec 2019 09:20:30 +0000
References: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: i2c: remove i2c_new_dummy() API
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=212557

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
