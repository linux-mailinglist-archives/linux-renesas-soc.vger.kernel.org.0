Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C38117DA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 03:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfLJCUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 21:20:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:37002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfLJCUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 21:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575944436;
        bh=Y+NsaTsw7sufmYPuFT2l61G+qVccALdErO6t0qYyuJw=;
        h=Subject:From:Date:To:From;
        b=B6eETsnFMvBI35w1jEBtjrNP7NyR0T/0TWIZoUYm8JcWbeMG3HVGvfqmBzmXn4+ll
         UBhs0CG/JQ0x5uKK5w14VdWFxtmt0phcAB22PzNl36q1bjf55ncm7aTZoUVqUHMAYO
         s6n3Mo8DDOBTNCgrXIx2STNku89NwzXiILIh0r+I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157594443678.5669.5224330843109596108.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 10 Dec 2019 02:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] rcar-vin: Support V4L2_FIELD_SEQ_{TB,BT} (2019-12-10T02:05:57)
  Superseding: [v2] rcar-vin: Support V4L2_FIELD_SEQ_{TB,BT} (2019-10-09T22:27:32):
    [v2,1/2] rcar-vin: Move hardware buffer tracking to own struct
    [v2,2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
