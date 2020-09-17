Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4A926DCB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 15:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgIQNUv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 09:20:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:42506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgIQNUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 09:20:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600348846;
        bh=QGxMgq4om1ruQ08VLC2aL3KmNA55d/W5QDPqh77WlCQ=;
        h=Subject:From:Date:To:From;
        b=q+3UKiGs0LE0kyk3WO49UqEQ+bNPdrMIbmHO/wwa2O/S4CLElq3Fl3GP2QmPRIJfZ
         NlOJxvJAP/pFRq3KlvKH7w5Y/2dlsa0iut/IA0hJTvsowBIS/mcUELXgadkDzd2Wge
         WlCSia3TA9fvnSx08AiCrcrTCXEAgVul72PmYkOs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160034884615.2408.16652688571469311319.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 13:20:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] ata: sata_rcar: Fix DMA boundary mask (2020-09-17T13:09:20)
  Superseding: [v2] ata: sata_rcar: Fix DMA boundary mask (2020-08-11T08:17:12):
    [v2] ata: sata_rcar: Fix DMA boundary mask


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
