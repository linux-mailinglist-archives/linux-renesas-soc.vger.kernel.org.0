Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5A611351E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 19:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfLDSkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 13:40:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:59988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728244AbfLDSkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 13:40:32 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575484832;
        bh=Kjpx2tV71jvoi0zgoEKo7AWOTDICK0y+v3DPSrfgAKM=;
        h=Subject:From:Date:To:From;
        b=MVGMbE5IpIYuKhw8W2Bz67RYpioHSNR1U8AJB0OTPCy18cvs+oyWMwiRYbjr0PsTb
         lnl8/bAAFTX/ifSYDY85f/ft0QsbEfBRsIisOwUNsd8XmjfK8GutomoP81V4hmQHnx
         Uidbaj07Cufny/bPWD5Yt8JA/ly5DZFyl8I3dp6Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157548483233.5377.10906069259588646952.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 04 Dec 2019 18:40:32 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] rcar-vin: Use correct pixel format when aligning format (2019-12-04T17:57:59)
  Superseding: [v1] rcar-vin: Use correct pixel format when aligning format (2019-11-06T23:25:46):
    rcar-vin: Use correct pixel format when aligning format


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
