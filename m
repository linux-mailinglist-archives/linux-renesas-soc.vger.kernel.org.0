Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256E2122AD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 13:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfLQMAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 07:00:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:35282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbfLQMAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 07:00:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576584036;
        bh=FC4QjIz2B5ZCi5olZoowPj1STyLH5ftlAc2z4I3Khj0=;
        h=Subject:From:Date:To:From;
        b=f+Bq4tYSjss1xQreUANogKVn1Jx5KNty8jZe8TWIsqflKzT/Hvvy1VsNwvFc9jpaE
         XeJExsPPcFmnf0kNk0UCY8FJVK5J7sDT/eRNUZDp4DMpyQTL7ThlelCMqua67JxYH4
         rrD5J+V1VxoBWFA9KBXIkFTXnHbhglnQFrZFtWUU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157658403618.16261.9922970485117765107.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 17 Dec 2019 12:00:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] mmc: renesas_sdhi: add manual correction (2019-12-17T11:40:29)
  Superseding: [v1] mmc: renesas_sdhi: add manual correction (2019-12-03T20:32:58):
    [RFC,1/2] mmc: renesas_sdhi: Add manual correction
    [RFC,2/2] mmc: renesas_sdhi: enfore manual correction for Gen3
    [RFC,3/2] mmc: renesas_sdhi: remove double clear of automatic correction


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
