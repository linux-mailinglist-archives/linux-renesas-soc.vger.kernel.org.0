Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D95019CA52
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 21:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731689AbgDBTko (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 15:40:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729549AbgDBTko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 15:40:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585856443;
        bh=utGsAbnUlfdpc5xOJLbwtDwT3RYz8K5gijRqJIiQ5hM=;
        h=Subject:From:Date:To:From;
        b=wq30jQ8OOSNV0iQXWxtd2hTFJ3b23aF+o2HbhiCZlRQVU7F0HGlDhYtTsFO9zF+vO
         uPtDo9xNK0RQbqvYLNyyq/LzeEkuQRS8v3+1vikCVjZ3fBydwrvImVDv2KfkgzFtm+
         JFOd2V5Sfkv2T4c5TBar3VsmrBv5joHQE7404vvg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158585644358.22369.6035378488247750889.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 02 Apr 2020 19:40:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] media: adv748x: add support for HDMI audio (2020-04-02T18:33:58)
  Superseding: [v4] media: adv748x: add support for HDMI audio (2020-03-26T10:34:54):
    [v4,1/9] media: adv748x: fix end-of-line terminators in diagnostic statements
    [v4,2/9] media: adv748x: include everything adv748x.h needs into the file
    [v4,3/9] media: adv748x: reduce amount of code for bitwise modifications of device registers
    [v4,4/9] media: adv748x: add definitions for audio output related registers
    [v4,5/9] media: adv748x: add support for HDMI audio
    [v4,6/9] media: adv748x: prepare/enable mclk when the audio is used
    [v4,7/9] media: adv748x: only activate DAI if it is described in device tree
    [v4,8/9] dt-bindings: adv748x: add information about serial audio interface (I2S/TDM)
    [v4,9/9] arm64: dts: renesas: salvator: add a connection from adv748x codec (HDMI input) to the R-Car SoC


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
