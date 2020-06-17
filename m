Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FE51FC57F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2020 07:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgFQFAl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Jun 2020 01:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbgFQFAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jun 2020 01:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592370041;
        bh=L21R+6Fl1vYdv3ieQap2kZE4zBUCC4AKvS56H1EcewQ=;
        h=Subject:From:Date:To:From;
        b=yMdWeAW5KfRHS5EexR9WfIy4l4meXOI1zMiDD5VZg3/PQLQR+GZc3KBTrTCY8wksu
         GsAzanIWdUemjVZhVdTXncGCbbg4TxIxqm67wxJn5EyhuXmgJNuYjPbu5bk3Szypp5
         GfmTog8J+u4E8FGNQkbTgW0BaHBf5kGpn0odm4Q4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159237004104.20527.16636293993384778884.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 17 Jun 2020 05:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v7] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-17T04:57:22)
  Superseding: [v6] media: rcar-csi2: Correct the selection of hsfreqrange (2020-06-08T03:25:03):
    [v6] media: rcar-csi2: Correct the selection of hsfreqrange


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
