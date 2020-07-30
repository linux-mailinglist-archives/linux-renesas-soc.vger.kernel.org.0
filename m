Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E3923302F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jul 2020 12:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgG3KUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jul 2020 06:20:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgG3KUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jul 2020 06:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596104443;
        bh=bmWfATqGyM4gEUJsIMaoocKpgC6+hwGxX+H0b3U3mds=;
        h=Subject:From:Date:To:From;
        b=NogoO+EEhHmNHWiJR2zAlJL2Ac4WKYGgsWSfdBTkmFnt6Sx1THEyCUupr8AACKuG+
         EDZQF7eMExKTq26a1NysOn8UrTgcJ+8zZZdIJvU8KdvcbCRtw7JCB+dy90Ye0dAcZd
         m1MdgTfZ8Vq3ySTqvlL6dWyWqqRWijy/K6JQH2Os=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159610444348.7990.13995462596029808650.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 30 Jul 2020 10:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ravb: Fixed the problem that rmmod can not be done (2020-07-30T10:01:51)
  Superseding: [v1] ravb: Fixed the problem that rmmod can not be done (2020-07-30T03:56:49):
    ravb: Fixed the problem that rmmod can not be done


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
