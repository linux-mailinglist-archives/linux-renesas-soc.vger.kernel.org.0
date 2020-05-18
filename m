Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30B11D700D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 07:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgERFAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 01:00:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgERFAj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 01:00:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589778038;
        bh=DgsLShLoXw8B+I2H92FEBiSMytd5h1HVhjnE4xj5slM=;
        h=Subject:From:Date:To:From;
        b=EHyRZ6lo47deWf60SNpUp4/ItNUwjYefbSrCVHVjPefevFcJdFiqFrS3gVq01hhEh
         OqEAjGDXA1TIazNzZGxHSKXJLMnHDIlLUFZLFKie7oZmxnGhlj0pdatrZM3xpoDNk1
         ZnNEtDYWF0bR53jZNcuVas3cpkUS1JwkGYVQsgJU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158977803893.433.17927944512888662029.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 18 May 2020 05:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ravb: On timeout disable IRQs to stop processing (2020-05-18T04:54:52)
  Superseding: [v1] ravb: On timeout disable IRQs to stop processing (2020-04-09T07:52:15):
    [RFC] ravb: On timeout disable IRQs to stop processing


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
