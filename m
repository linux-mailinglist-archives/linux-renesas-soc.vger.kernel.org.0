Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558692DF008
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Dec 2020 15:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgLSOhn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Dec 2020 09:37:43 -0500
Received: from www.zeus03.de ([194.117.254.33]:43580 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgLSOhn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Dec 2020 09:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=WsCPidwc8XpcsG27IlXc6q7MpST
        LUZo5G4VwzAKi8Sw=; b=VwXXVufQZu7U/3fTt0Uedb9IwUBnL+mKBCakRqqTv/6
        drG4for1mQIlcCGHaOF44hVCR4amLwAMLL3ovaCDRHos4LPBxFVhJA5sm2Ofg8dg
        c7YnMO+bTrbi/WOWfTYSan0XEfq5JE+96NA0Xszs7btR7mAr7qLmj8Z8mA0Ta38o
        =
Received: (qmail 4149821 invoked from network); 19 Dec 2020 15:37:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2020 15:37:01 +0100
X-UD-Smtp-Session: l3s3148p1@mVctKNK2eLYgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: small updates to rebooting
Date:   Sat, 19 Dec 2020 15:36:45 +0100
Message-Id: <20201219143648.56217-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Found these while working with a new prototype board.

Wolfram Sang (2):
  arm64: add grace period when rebooting
  arm64: proper comment formatting in reboot handler

 arch/arm64/kernel/process.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.29.2

