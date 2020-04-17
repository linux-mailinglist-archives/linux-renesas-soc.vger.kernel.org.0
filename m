Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D081AD869
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 10:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbgDQIUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 04:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729176AbgDQIUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 04:20:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587111637;
        bh=GB5++n7qo3sUXkwjV9aBRA1kd181ZSrr6ckKfp6upCM=;
        h=Subject:From:Date:To:From;
        b=TwrqU/XgUBCZ4EYY/oTZ1XtxigKtwxnGW7S+H2X9cnP4dGUNgKiSpppR6kwMqBf6k
         moQ7ZScEBjZDaQOMtemUT4BE4bm4Es3hlh9aeLUYb3jtEK1j2QRhd5gzbn4kEp5wEc
         8bu2p7M43P2b5EUGnRsc2moxXYbF/ZpsM11WDQLo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158711163725.28012.4855931934300030032.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 17 Apr 2020 08:20:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema (2020-04-17T08:07:07)
  Superseding: [v2] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema (2020-04-17T03:55:14):
    [v2,1/2] dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
    [v2,2/2] dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
