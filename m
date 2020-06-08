Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBF21F11DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 05:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgFHDkl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 23:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgFHDkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 23:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591587640;
        bh=ysDWPkTOj6HUglcJMe7yXtFBpvFu/5Rg1jdGNbJrMtw=;
        h=Subject:From:Date:To:From;
        b=czpgpOzdqRJaFgjzaIla+36txBBxKBZsLJWxLwecN1K4MJ8R/LIe2+tveIjjQOMsz
         kHgiTPRndNPsOcBLgut77lasp7aleNTy9iLh7yuzI9hLLPsUq1oaFNK1kehFEbU/Ws
         VvMJisU8zxtx3XZFifnzEqkm1jbVEJcDXruXGi+w=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159158764090.21438.8674175641101324853.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 08 Jun 2020 03:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-08T03:25:03)
  Superseding: [v5] media: rcar-csi2: Correct the selection of hsfreqrange (2020-04-30T06:03:10):
    [v5] media: rcar-csi2: Correct the selection of hsfreqrange


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
