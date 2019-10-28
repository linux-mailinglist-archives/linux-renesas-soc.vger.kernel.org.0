Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3FE6C5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2019 07:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfJ1GUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Oct 2019 02:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728657AbfJ1GUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 02:20:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572243636;
        bh=l584WZ22rc99rV0bQd4TBlzOeBUKOHlbCifUy7x3LFU=;
        h=Subject:From:Date:To:From;
        b=zudpRRruBh7KkT3WGz+EyKt1KocyN8wlSQmDYM45dCKbcvpQHgk3vCddSSq7AgaDh
         lFSEhg9IhCVKuFIMoAn4uFnBo8Lz76ZZW8VTgRs8MjrqcYK+4ch6xrQl3/yD9QTvSY
         YjCRxpPsx7TorJHCJu8ozA5K1/pj9pIX4ex+BiMU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157224363663.1052.16783781830720984411.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 28 Oct 2019 06:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2019-10-28T06:07:28)
  Superseding: [v1] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling (2019-10-24T11:16:58):
    [1/3] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s properties
    [2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
    [3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
