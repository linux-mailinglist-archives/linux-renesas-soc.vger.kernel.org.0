Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2460142B6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 14:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgATNAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 08:00:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:39330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgATNAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 08:00:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579525235;
        bh=GwDpCyi89+/6Ad9CJabN87oCC093fXMO4LCERDPOvPM=;
        h=Subject:From:Date:To:From;
        b=Z+4Y8PJhPkWLoXg91BlNXNRxLE71IMo0eanBNbKNW5h6uy/QkMyYayJc39is0N3YG
         9EuC9qXoCMuqLrTD3tEWhn0cfAjSX9PqGIceIxPOOjJS3+WnbAl2qiwDmDsqmx5nLQ
         iuvZRAstDkzEDdnd35w8Qp1GLm4vXRehOjnZaDhY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157952523509.25030.15230256500906976645.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 20 Jan 2020 13:00:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2020-01-20T12:47:54)
  Superseding: [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel() (2020-01-20T12:36:31):
    [v2] media: rcar_drif: Use dma_request_chan() instead dma_request_slave_channel()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
