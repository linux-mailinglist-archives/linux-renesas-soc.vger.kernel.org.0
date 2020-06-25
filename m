Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74504209DA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 13:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404276AbgFYLkm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 07:40:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404228AbgFYLkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 07:40:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593085241;
        bh=PDimuf+0Iukcje9bMy6Wouo1UWtAj5ra04zLDHuAJb0=;
        h=Subject:From:Date:To:From;
        b=WQw1CzSHRerr938zsZg1yZsURw43nzNtu6sEvdLCx4iZwvJ6MndGAquggZOPbw+G/
         r8nIe+yGw9dtUhZ1K01SE9kjq/N5WbgkNQIe2SZqe903sj4y2trq0PYaphzdWmncqR
         /lKNjTn9aATGXzRzp7vaI5kqCvpaDY2vcvZcw8PA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159308524150.7065.3690560758693233657.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 25 Jun 2020 11:40:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-25T11:38:19)
  Superseding: [v3] thermal: rcar_gen3_thermal: Fix undefined temperature if negative (2020-06-25T02:56:08):
    [v3] thermal: rcar_gen3_thermal: Fix undefined temperature if negative


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
