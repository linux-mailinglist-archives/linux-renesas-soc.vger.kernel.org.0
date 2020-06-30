Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307E320FA69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 19:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390228AbgF3RUt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 13:20:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730584AbgF3RUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 13:20:49 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593537649;
        bh=woAgZBPxVbZ5pmjCf+FCWy3q/sXXKtlLscJ1An/E17A=;
        h=Subject:From:Date:To:From;
        b=IwdhJ7CHeFHXOtXCNeCdy9ma3jzIhiL0c9jz/Ea5h8hZPe1Zu2O/UpAzxU5YnQfvU
         NBjYHSgQPl9Nd1KMC2zF8m9QxOXpFZhCstlQ2w5k93LwgXRlYjUOXbQf5b9IcOhA46
         GlkU9YeV4n5ImKJZkZA5HijIgIAYYliuwG7SLOzs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159353764896.1988.11127837451874408358.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 30 Jun 2020 17:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] arm64: defconfig: Enable additional support for Renesas platforms (2020-06-30T17:15:00)
  Superseding: [v1] arm64: defconfig: Enable additional support for Renesas platforms (2020-02-17T10:32:51):
    arm64: defconfig: Enable additional support for Renesas platforms


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
