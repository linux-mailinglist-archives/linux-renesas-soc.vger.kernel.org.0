Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4A7134F3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2020 23:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgAHWAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jan 2020 17:00:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:48356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgAHWAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 17:00:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578520837;
        bh=SPSCLLOHrvPlfsPJvdph3x/IRrePI+0TvPs76Z9CmBk=;
        h=Subject:From:Date:To:From;
        b=kp3Y3oWePjP/PTgVXC9n+J6V/B5yaIOvt1BQJsfc5gScsFHxeIJcMv4vQNRzfXBcK
         F4SVWDRrmPQFwyHGpy0pCAiQwOy3pxeLUmDUzXUPiBhLn+vJOkBQuVt6/O1t8+5Bsq
         0JSpxlzLvslerte7+V2FX3GiMUbh37ckBNn8Qo+4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157852083792.12694.3569386605171682259.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 08 Jan 2020 22:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: rcar-csi2: Convert bindings to json-schema (2020-01-08T21:52:09)
  Superseding: [v1] dt-bindings: rcar-csi2: Convert bindings to json-schema (2019-11-08T02:17:48):
    dt-bindings: rcar-csi2: Convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
