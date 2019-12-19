Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC50125951
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2019 02:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfLSBkf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 20:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLSBkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 20:40:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576719635;
        bh=MqRKZWh0ZxODNyEuGOT7CkPrLSgHkPXlSEJZHL3ZY0I=;
        h=Subject:From:Date:To:From;
        b=nfvVP0svZzQjMWQ3sT7IQ+6vA6RMlrr7BxoKO+P9FpJeZuNJuTrWfCgoAGbREjup1
         Y+kDHS8qf8VzJMhM8uZVGjDllqBtpIjpOECh2G4kuIrNih+qeolSXEHJVtPEl1YQzp
         V6LGmw/+HPgzQ1VT2rL/+WVIWLPVXhk/Vv/wOu6E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157671963532.28097.14458946033027906929.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 19 Dec 2019 01:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] sh: fixup strncpy() (2019-12-19T01:20:46)
  Superseding: [v1] sh: fixup strncpy() (2019-12-18T07:33:44):
    sh: fixup strncpy()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
