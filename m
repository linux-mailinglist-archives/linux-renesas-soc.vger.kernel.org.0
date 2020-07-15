Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A598B220F14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 16:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgGOOUq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 10:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728153AbgGOOUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 10:20:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594822844;
        bh=QLF6XmrAJfggTi9WA4tLfDdReoApG3b1Qpi2TIQXbpI=;
        h=Subject:From:Date:To:From;
        b=nGrnHS4LGk6CnVQQZOoLHa+DqzYsqNnef2LaTbB978wd9aLWeYVbOE9suL2iH+zKw
         +b1YM2XVJUJMrarD2tM7zdAq70M7LHvFJzeU0EBRBlW5LyYIMklS3Yss1ZnaSTToCq
         rvZOC+7dNGF9Y0ngZcDptEPBmwc6MzlKtaU6ohkE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159482284483.18824.15589437587120634431.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jul 2020 14:20:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit (2020-07-15T14:06:21)
  Superseding: [v2] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit (2020-07-14T12:34:18):
    [V2,1/2] arm64: dts: Introduce r8a774a1-beacon-rzg2m-kit
    [V2,2/2] dt-bindings: arm: renesas: Document beacon-rzg2m


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
