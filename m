Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DDC16A764
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2020 14:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgBXNkn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Feb 2020 08:40:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:50780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbgBXNkm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Feb 2020 08:40:42 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582551642;
        bh=UObqwwtxpbYOxaF1H/5IrQtzF7we+k43J9qBTX9DBp4=;
        h=Subject:From:Date:References:To:From;
        b=N8djRb5DWa1V+A1+L6y67tJCMe9t/9waTvkRV1g9m2OxvMZ1tVzpNT8U+ELoimlHw
         bpfoNUyJ8zxzA6v+8CVaOOyvRGwXGvGi62xamCfOrOuJdhIwFifaq+JOPz/+JY38Fn
         Cy3w1RRa1sYZAHZOGh8064BXZs1LmGsB2d320OFM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158255164234.6406.15924660499899129729.git-patchwork-summary@kernel.org>
Date:   Mon, 24 Feb 2020 13:40:42 +0000
References: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v4] USB: hub: Fix the broken detection of USB3 device in SMSC hub
  Submitter: Hardik Gajjar <hgajjar@de.adit-jv.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=237743

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
