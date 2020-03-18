Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF9B189F7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 16:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgCRPUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 11:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRPUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 11:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584544840;
        bh=2Lz0uWBPVBaqPOyfNZsg1D6t4ZRyY/OwwRZk9YhjaxQ=;
        h=Subject:From:Date:To:From;
        b=km3VQ9G4Seef7YCQZwCq09klJwDXAQ8ZhPHAqp0qer+10V/btB2KFc2q416lv7+Al
         TlFYarNaTSoOs2e9zd72bTndUvRTsmyBvCvisTWJMoFcaUSrqKVbFY/p+r3wfqBSKg
         6CM7M/ar9S29ips6adkk0gkVzRo3I0QmZhc802m0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158454484072.21761.6652650242433252195.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Mar 2020 15:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] i2c: of: reserve unknown and ancillary addresses (2020-03-18T15:00:56)
  Superseding: [v1] i2c: of: reserve unknown and ancillary addresses (2020-02-20T17:23:56):
    [RFC,1/7] i2c: add sanity check for parameter of i2c_verify_client()
    [RFC,2/7] i2c: use DEFINE for the dummy driver name
    [RFC,3/7] i2c: allow DT nodes without 'compatible'
    [RFC,4/7] i2c: of: remove superfluous parameter from exported function
    [RFC,5/7] i2c: of: error message unification
    [RFC,6/7] i2c: of: mark a whole array of regs as reserved
    [RFC,7/7] i2c: core: hand over reserved devices when requesting ancillary addresses


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
