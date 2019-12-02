Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3202D10E74D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 10:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfLBJAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 04:00:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:41832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfLBJAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 04:00:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575277235;
        bh=zBvUEZ63+RAJdKnK2l54QtnfUyjvJXZk5KaS8Zbv6ak=;
        h=Subject:From:Date:To:From;
        b=qicfKOnaPq7mgQSGNNgwzSXylPTLN2xTjsyn1xEy3Zcnsx0G75YPtjsHv9AFXddgB
         gZflgPxwO92hkADmhcHUScrRZYEqPOV6gyCXRorxsYfQz/NYZ23P4gXx+NRoIDPhet
         wbpDUCcPMICBDb6ra+09zIhXVBMhZ46ALtq1f8KI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157527723522.406.4852530140143681987.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 02 Dec 2019 09:00:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] iio: adc: max9611: Fix too short conversion time delay (2019-12-02T08:55:46)
  Superseding: [v1] iio: adc: max9611: Fix too short conversion time delay (2019-11-13T09:21:33):
    iio: adc: max9611: Fix too short conversion time delay


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
