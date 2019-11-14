Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77DDFBDC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 03:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKNCAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 21:00:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:47012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfKNCAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 21:00:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573696838;
        bh=6Hwt6JXWwhnH0sfnHp5NenmzNSZIQzpfzSEGKJFZlXY=;
        h=Subject:From:Date:To:From;
        b=oXCd+MVrTleE+cbEN4cxSanLcTvTA4Mg1FanjucPN9+cW8JPvrOqFxUa7mErNa4iC
         ruzoLTATNJNBsXAAp5NngOE7TJgGe0TfnkXBiC2lNze0xPHYubs5W1W4MqSECg3uGb
         plD1YgvyocJDBViQ2iwHqcig9GhxVNUCLSNodzik=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157369683780.6079.17241963966578906756.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 14 Nov 2019 02:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] ravb: implement MTU change while device is up (2019-11-14T01:49:49)
  Superseding: [v3] ravb: implement MTU change while device is up (2019-08-20T19:01:26):
    [v3] ravb: implement MTU change while device is up


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
