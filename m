Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0C921D5B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgGMMUq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 08:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgGMMUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 08:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594642846;
        bh=srfer2U7rwnjZmbfsl+gvWdvdxqzR9kY7tUgBC5F7ew=;
        h=Subject:From:Date:To:From;
        b=G+zvOCszPA5LPRRnEcfi4QRpPmII9IJJw3bxFL3UsnpC/mWflsYJOyXU05qfceCeG
         twMFboKtuXDI/iST5Xftb0KX/Esi2EPnkJiC8FQGhnQq8EEEnMOsGOq++aNKQ51f+X
         lcSHbYfRekeZy3OJUyi3JsNzLPrRRJanYzX4D4Ns=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159464284614.15800.6573366398986053896.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 13 Jul 2020 12:20:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] phy: renesas: rcar-gen3-usb2: fix SError happen if DEBUG_SHIRQ is enabled (2020-07-13T12:11:28)
  Superseding: [v1] phy: renesas: rcar-gen3-usb2: fix SError happen if DEBUG_SHIRQ is enabled (2020-07-09T10:36:18):
    phy: renesas: rcar-gen3-usb2: fix SError happen if DEBUG_SHIRQ is enabled


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
