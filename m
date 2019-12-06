Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D318E1150F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 14:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLFNUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 08:20:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:37318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbfLFNUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 08:20:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575638433;
        bh=xpxp/nk+/ja8Dkzy7DbiPobrh4md5mQAWx8lWxTtwf8=;
        h=Subject:From:Date:To:From;
        b=RfdCTYYnI8HZQ2SLG5Rb9Z0yXm6BE3zbH4uZS8PlMCF6K0iwZH+a8EyV1780drE8L
         Ms7XwIqAFsk2cauDIDD4gR+ZLy4CH1SJk3QbjTIXMgJsvyk8iwlwrpQMgzpcVmV/zu
         HCh2JyxVLi+xn4LsHk21lzAaDULMLFbp5DU254dc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157563843359.24655.15340994116431750695.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 06 Dec 2019 13:20:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] iio: adc: max9611: Fix too short conversion time delay (2019-12-06T13:19:44)
  Superseding: [v2] iio: adc: max9611: Fix too short conversion time delay (2019-12-02T08:55:46):
    [v2] iio: adc: max9611: Fix too short conversion time delay


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
