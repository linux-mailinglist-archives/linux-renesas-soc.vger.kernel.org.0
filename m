Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E28E241AB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 14:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgHKMAp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 08:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728733AbgHKMAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 08:00:44 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597147240;
        bh=nT1sdMBPUK2fgj/6YCqVEg1xF5MOIKpKvDy+CK3AsgU=;
        h=Subject:From:Date:To:From;
        b=n8SruiB8T1kKfB9xoIvkPMHAq7JeZFK9A7Ne5DP4Y5RO2gmcL6EeiVd/NbdbOcCO+
         PTXiC+C3Cnx1GHS7/ekOYXhZFHQSXgISaPvFvo4AuAjyifdotsts+LhpyhiubPeBoK
         u4ZnMWbnccmmMxTZvqC/LhQSDOTvqT19YWmW6gq8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159714724054.20721.8137571267536179521.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 11 Aug 2020 12:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-08-11T11:53:14)
  Superseding: [v3] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure (2020-08-10T17:49:44):
    [v3] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
