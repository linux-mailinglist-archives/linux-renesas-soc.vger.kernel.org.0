Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 008E91542EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 12:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgBFLUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 06:20:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:57312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgBFLUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 06:20:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580988035;
        bh=mgftfakJVfi9aaGDxtIm5GUGJZu0vAVmtP0HUW0gEUo=;
        h=Subject:From:Date:To:From;
        b=QFi6lU2fMTzq0hXlFr0DN24hSJIGxBZ/oXBLrFft5UaYoGg1+hcD9O61Uyqf+2MvR
         kl5F9ciWVL5EWA/b6MylLKbwv0oEKAbFG4d3H8yhaCIUiiotGpSvLh+qjMvFai2i1G
         pNMh0wUwH7brDPLoA+wMynuSTwuShC9TkvnIgejA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158098803571.16243.11985086628968065483.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 06 Feb 2020 11:20:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] drm: shmobile: Reduce include dependencies (2020-02-06T11:12:32)
  Superseding: [v2] drm: shmobile: Reduce include dependencies (2020-02-05T09:32:26):
    [v2] drm: shmobile: Reduce include dependencies


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
