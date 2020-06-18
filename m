Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FA31FF671
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgFRPUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 11:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727045AbgFRPUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 11:20:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592493641;
        bh=e3MDJr8vuN9fu8nS5TkB1fdWgYzcMlj1eBUx1VKGHRs=;
        h=Subject:From:Date:To:From;
        b=qg4IvPPLSfClk+wjqJi1Ciy6MPrmZ+vA5JEYz+pwJ7lxx1E4yNqtBfJ0PwCKLLBQx
         jNxkiEeaGAAanMj4FaJEGu8HwnL/T+iRC3tKyDb1S4dsY+YVKy/VKOQ6Y7MWhTgQCO
         PbpRISNmB9g79ut7CAFm7qBE2+3yvbQBZQ3/7G1I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159249364176.11838.7191906533138741875.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 18 Jun 2020 15:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] i2c: sh_mobile: implement atomic transfers (2020-06-18T15:05:32)
  Superseding: [v1] i2c: sh_mobile: implement atomic transfers (2020-06-10T19:33:11):
    i2c: sh_mobile: implement atomic transfers


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
