Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEC21BF02B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 08:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD3GUj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 02:20:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726337AbgD3GUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 02:20:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588227638;
        bh=CIZXnhmf0pm7nkEEa3cA844iG53iVoxzDtj2jUoukh8=;
        h=Subject:From:Date:To:From;
        b=2vsIewtWYfFqS3w9g4QC+tjbu8FAemodraaWnr7U4hQEZJ2MGoT+Y5yRqylV6nGT/
         2l9TQMxq1gKUMiMnS+m0vi8bTPbySPHtx0wopc0rdutYGCKL1mPlAgEwkzuWeYUIDR
         L8jaTA1Jq3nBr8BqxpQcwekLOg3uyyEWBYLuwkc0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158822763864.20558.1906973348208396893.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 30 Apr 2020 06:20:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] media: rcar-csi2: Correct the selection of hsfreqrange (2020-04-30T06:03:10)
  Superseding: [v4] media: rcar-csi2: Correct the selection of hsfreqrange (2020-03-23T04:48:44):
    [v4] media: rcar-csi2: Correct the selection of hsfreqrange


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
