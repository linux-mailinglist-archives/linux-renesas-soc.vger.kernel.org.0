Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF9818233B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 21:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgCKUUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 16:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729962AbgCKUUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 16:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583958040;
        bh=casdO9afg2vm5t9LRxfa5c4f1QeeAzqCIqY1n+d8/FA=;
        h=Subject:From:Date:To:From;
        b=dR+CIUj3QPt5a+oD3Ss+uJ9YHDxnoboQ5lmYLdkV84gNBKHbPFNCEdOh/9hD1Pj3o
         29G77hRaL0dmKbVCwINso7J0hinzQyFpyhaBTWXVArcSqjdufy3tr5UNNrfJ6+r74D
         u7KCFZbQ/ZEJJD+bFPDcaBVbIpL0xS4//wZ5lccs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158395804010.25262.15678513623401327248.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 11 Mar 2020 20:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] Add LVDS panel support to HiHope RZ/G2M (2020-03-11T20:03:38)
  Superseding: [v3] Add LVDS panel support to HiHope RZ/G2M (2020-03-10T20:41:57):
    [v3,1/2] dt-bindings: display: Add idk-1110wr binding
    [v3,2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
