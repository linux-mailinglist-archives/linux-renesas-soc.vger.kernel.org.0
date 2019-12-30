Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B43E12CDC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Dec 2019 09:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfL3Ikg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Dec 2019 03:40:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727175AbfL3Ikg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Dec 2019 03:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577695235;
        bh=Mhtj+3QujBGOTh2F4+ixffCyBpPZZYX/j34iJFbEgEQ=;
        h=Subject:From:Date:To:From;
        b=fHLwoDkkNQdf1bE3gdZSQ9InGCMrZOF1GY4CJv5LCyTk/3dyxGujnf29Fnkdmy34o
         3B18Xm10XKFR5JBeMbJLj7ix2yBO1ZZ+g9J+ebifXgzECXFkLQ+LZa8FgwmNZmzNtR
         VdR7jx6qSLgI7RcDmKn3esfsq7axfB72U5W0wsvw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157769523593.28941.1819296326117263902.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 30 Dec 2019 08:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers (2019-12-30T08:31:56)
  Superseding: [v1] pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers (2019-12-17T18:42:42):
    pinctrl: sh-pfc: Split R-Car H3 support in two independent drivers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
