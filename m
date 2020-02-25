Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FE016EE34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 19:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731653AbgBYSkg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 13:40:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:50872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731557AbgBYSkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 13:40:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582656036;
        bh=42P5yBgA2wVRTwTIWcwAhB/FDNBNA43bMkDJVXOEHsQ=;
        h=Subject:From:Date:To:From;
        b=KIVcY+EjnzprC7YUf+mPbQ2cuK6AwL0Qq/8KDLFBE0RwsAhLmGFIfi+IHNyGes/Nc
         0RY/FZ/k6bjjjhvfeHyD2qGmsIcHLMrY85Q12gydmkNWh1RWhdE7y4focRNeHpgKFQ
         MXKs3c0KdbEtQllxgk05kmgJFwdQM3jCe2b4qabM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158265603597.22359.10733766306139408432.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 25 Feb 2020 18:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] usb: hub: Fix unhandled return value of usb_autopm_get_interface() (2020-02-25T18:30:57)
  Superseding: [v1] usb: hub: Fix unhandled return value of usb_autopm_get_interface() (2020-02-25T13:08:46):
    usb: hub: Fix unhandled return value of usb_autopm_get_interface()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
