Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA02680C9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Sep 2020 20:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgIMSkq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Sep 2020 14:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgIMSkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Sep 2020 14:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600022445;
        bh=gan2mA2ikJuX/2IqswxeGQQPxs1mqsPH5NSU0P0yp0E=;
        h=Subject:From:Date:To:From;
        b=Uj8HGUzYrVDhkhpxzVLNCYQ4EBpJoIQyrqS+qWJ9HmcphbSW19fqjlwWB/V5uqorg
         4keW2ih56BPxKITjCNOC3zi3Co3MK6D0LH8q9vXzxnst/B6ayFCnE1YJ4TH9LkY0WM
         z74yNs4aCVPy/HFawJB+gAlaTmfQKykOik5YgNP4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160002244524.22573.17636072906181686443.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 13 Sep 2020 18:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: rcar-vin: Update crop and compose settings for every s_fmt call (2020-09-13T18:21:40)
  Superseding: [v1] media: rcar-vin: Update crop and compose settings for every s_fmt call (2020-07-31T09:29:05):
    media: rcar-vin: Update crop and compose settings for every s_fmt call


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
