Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F28A01477CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 06:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgAXFAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 00:00:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:58002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgAXFAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 00:00:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579842038;
        bh=38A4UFf2BmaWU/aLqIQJcrjEIASIG2JG9zJve3PgL5U=;
        h=Subject:From:Date:To:From;
        b=UIW6zqUeGgiEu6227KbhrNi23b71FQX9aVG3aa2fNMDjL66YDYCUKL4wknXVu0Bb2
         w4K+CVXi7tHWxd7decuiW/tbwhTlTdLnSsQK4IE4fD/oEldaRKA6P9Tr1NxHrjaC9e
         zT3dtFzBgAfH2LmcMJDUTyhxYif+ik7YPc2kGwTA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157984203799.30206.8262558101783042938.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 24 Jan 2020 05:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-24T04:42:03)
  Superseding: [v2] usb: host: ehci-platform: add a quirk to avoid stuck (2020-01-23T12:07:14):
    [v2] usb: host: ehci-platform: add a quirk to avoid stuck


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
