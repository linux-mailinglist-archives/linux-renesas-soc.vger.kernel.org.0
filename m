Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA2514DFCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2020 18:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgA3RUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jan 2020 12:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:52462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727247AbgA3RUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jan 2020 12:20:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580404835;
        bh=b44BNZFo0lAyMsOijE23OStKyqKvOEF0gPQ/VJTwtYc=;
        h=Subject:From:Date:To:From;
        b=1Ft7AutIYTZFOJzYsueW/gBaWC5JiTIVOqUL6Ab4v1NDKrqD80HY662Xg0sxDXEhV
         ov8NJTxlQdY8djMI+3Luq4eBM6f7IOWseVN4g4egErQ3CTy+KjWsau2ZGMvt4uSAyd
         iGyKWLmQkBEjEEctsB+2Gjf0gWNiDqUQyY7rh8co=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158040483517.607.16570107583806174005.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 30 Jan 2020 17:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-01-30T17:06:34)
  Superseding: [v1] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-01-24T14:36:13):
    USB: hub: Fix the broken detection of USB3 device in SMSC hub


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
