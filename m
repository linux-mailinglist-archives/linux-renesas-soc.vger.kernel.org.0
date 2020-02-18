Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B40D416294F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 16:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgBRPUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 10:20:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:38732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgBRPUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 10:20:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582039240;
        bh=u8ywnrqiTc+VFjopT2S3XnsibDotsHXmQRFe17aFwkE=;
        h=Subject:From:Date:To:From;
        b=tSQbrZ4bknJqq3AEV4V6O2IrR35Egybpbzm+JpaA/8DxJhHlGJAu0cKAD17lqgtc+
         cIx737Udd0sjZzpovQLK29yTmynWQmKNIwVvErgOLvFOynT9kJVPPdPvnzN7+Xq8sO
         dH5jmdNR97CSBXf48mRp1H47llrcy/JHlmnw0uv0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158203924080.22812.2329359159678287071.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 18 Feb 2020 15:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] gpio: Add GPIO Aggregator (2020-02-18T15:18:12)
  Superseding: [v4] gpio: Add GPIO Aggregator (2020-01-15T18:15:23):
    [v4,1/5] gpiolib: Add support for gpiochipN-based table lookup
    [v4,2/5] gpiolib: Add support for GPIO line table lookup
    [v4,3/5] gpio: Add GPIO Aggregator
    [v4,4/5] docs: gpio: Add GPIO Aggregator documentation
    [v4,5/5] MAINTAINERS: Add GPIO Aggregator section


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
