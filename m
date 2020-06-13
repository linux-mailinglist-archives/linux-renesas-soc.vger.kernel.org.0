Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC82F1F85DE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2020 01:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgFMXUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 19:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgFMXUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 19:20:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592090439;
        bh=y56lh6IwiIkBRRTLYSrDRVvQ4bGTZKal+h4dJoMytF4=;
        h=Subject:From:Date:To:From;
        b=FCd3BiyF3ZO0ZMLCshsXztmi+wWIXpYW1uo0QHjGTG8dYshxIT+Z2eWo8Kn3TMd+K
         /e1E+gklHOwhRpC8TA3JSaKED75boqh7CP8tyZVixxg9Qq8FOjrsvpHGdsr/9H/6xJ
         4kiqRNK97JMnqsuwAiTcX8wgt8DyL6Xvtq4rOr/E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159209043963.32236.6211617245825560732.git-patchwork-housekeeping@kernel.org>
Date:   Sat, 13 Jun 2020 23:20:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] media: rcar-vin: Fix a reference count leak. (2020-06-13T23:04:32)
  Superseding: [v1] media: rcar-vin: Fix a reference count leak. (2020-06-13T22:30:08):
    media: rcar-vin: Fix a reference count leak.


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
