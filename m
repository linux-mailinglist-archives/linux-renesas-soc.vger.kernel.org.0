Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B76149FFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2020 09:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgA0Ikf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Jan 2020 03:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:60188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727312AbgA0Ikf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Jan 2020 03:40:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580114434;
        bh=SwBTJAg7isoS36UK12aMpbH2fp6sC5pt40JuW1rw1Ao=;
        h=Subject:From:Date:To:From;
        b=CAmZwrnpbyn+J2RyRa8xrNbUO/gKfvrP/6GEb6RPX8mD1yS70Vrvq9Ipi3a7/bzgj
         C5pokjc3YVmpWBvcsvfbJY0gXJmJGWIfmO8utalTRNb7JVjYw3yB/5zx6QZmgfGnmh
         7lA+1LzejhG/C8vVgiKYWvhtrvcCug31YwQbIdMY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158011443480.31830.452540399034692573.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 27 Jan 2020 08:40:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-27T08:37:42)
  Superseding: [v3] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-24T04:42:03):
    [v3] usb: host: ehci-platform: add a quirk to avoid stuck


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
