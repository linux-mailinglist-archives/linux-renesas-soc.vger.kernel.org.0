Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915321BA0F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 12:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0KUz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 06:20:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:40680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726938AbgD0KUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 06:20:54 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587982853;
        bh=PsWpoDIpUsa4r7TNqgNCukRlN8cHjg1ZW63ulJooIkA=;
        h=Subject:From:Date:To:From;
        b=1Jm8HlaQnSBMlgOt/8Xnv1D4hElbHsH9LRvc/bqWAwxIqqbtnGTTb7YqpN3rleNw0
         X4Liqy2VxylbsrbairF8WoaErU4OdfqwI/hGYEuncUW7mDMgtGQcKcoPvleb7ZHnM3
         p8b2HHMSJ9tT5AIP8Uv0vVPe+vX3RXQQ6MNscGPk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158798285306.4547.13267761043130493434.git-patchwork-summary@kernel.org>
Date:   Mon, 27 Apr 2020 10:20:53 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: ASoC: rsnd: Fixes for multichannel HDMI audio output
  Submitter: Matthias Blankertz <matthias.blankertz@cetitec.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=271583
  Link: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
    Patches: [1/2] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
             [2/2] ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode

Series: dt-bindings: usb: add r8a77961 support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=261843
  Link: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
    Patches: [v2,1/3] dt-bindings: usb: usb-xhci: add r8a77961 support
             [v2,2/3] dt-bindings: usb: renesas,usbhs: add r8a77961 support
             [v2,3/3] dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

Patch: serial: sh-sci: Make sure status register SCxSR is read in correct sequence
  Submitter: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=262923
  Link: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>

Series: ASoC: rsnd: multi-SSI setup fixes
  Submitter: Matthias Blankertz <matthias.blankertz@cetitec.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=272949
  Link: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
    Patches: [1/2] ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
             [2/2] ASoC: rsnd: Fix "status check failed" spam for multi-SSI

Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
