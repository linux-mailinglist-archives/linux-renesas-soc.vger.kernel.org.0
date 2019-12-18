Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFD612407F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 08:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfLRHkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 02:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:40398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLRHkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 02:40:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576654837;
        bh=vzzh957NwBD4S2A/3L0ob3Ul7gsrKW5inB0dkMbhT1k=;
        h=Subject:From:Date:To:From;
        b=mlPz4qdnEf/ZwD2rH1YEfzW519m/I2MwyZ2swY9jo4ajLC9MNHyusMRAZomV9wzyk
         wJl/faM8UwJndUW2Czwe9qBl34dYGzzfqpPrYOux93uEDQ1tZfkPFFl3IuqMbI6vgE
         QNzQWRLyhI/HsfxzzoAdhypUfhF3DGM20Gi4fKtM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157665483712.2882.914519327849131921.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Dec 2019 07:40:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] sh: use generic strncpy() (2019-12-18T07:32:45)
  Superseding: [v1] sh: use generic strncpy() (2019-12-18T05:22:49):
    sh: use generic strncpy()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
