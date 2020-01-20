Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740E2142B05
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 13:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgATMke (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 07:40:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgATMke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 07:40:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579524034;
        bh=71vECiSEQc6qVhI5Y4UPxntDsrIwbU5N+cS7lwUPLQc=;
        h=Subject:From:Date:To:From;
        b=gFKx7NNxq60Wawab3Y4IWyOzarSCThNKOzbFvPVszvyff7q4yM//z8kPtuhjT08TR
         BH1l59yXdf++95onrhQh3R0DBuxYywqUEk606t30K3eRBc1+UHn12JvYKgUi95HTfy
         /av8AulzbO0XIa4qdW7rQGrRSjzH/jBOmkAg1v+4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157952403415.4278.12799157479101416665.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 20 Jan 2020 12:40:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2020-01-20T12:36:31)
  Superseding: [v1] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2019-12-17T10:40:25):
    media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
