Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A8821397D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 13:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgGCLkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 07:40:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:54888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgGCLkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 07:40:31 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593776431;
        bh=3Sy1B9PDrFag+1NWzQrzJbSO4jGCq+HR51R8ELwDdp4=;
        h=Subject:From:Date:To:From;
        b=QSOrgJwrnTPKJwpiPT9W7CNcsbEktIC4MoM65Dub4V1cs0xOxEwJgLF83MezsmY3b
         tdjVULqHP/MqXfSGfFl0rkKNrj2VPmE8aVrmRIvtRVhRF74AkJyg/ukUHeRUDjx/0I
         G/eikRaiavfRxk0w6hFzQj993OX0gOT6cJTLd+Qc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159377643145.5916.501300983687405649.git-patchwork-summary@kernel.org>
Date:   Fri, 03 Jul 2020 11:40:31 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: multi_v7_defconfig: Enable additional support for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=310711
  Link: <20200630171237.11077-1-geert+renesas@glider.be>

Patch: arm64: defconfig: Enable additional support for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=310715
  Link: <20200630171500.11438-1-geert+renesas@glider.be>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
