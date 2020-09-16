Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDBB26C8F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 21:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgIPTAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 15:00:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727915AbgIPTAs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 15:00:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600282848;
        bh=0DmDgspG2F1DbUW2FbA3VeWRZjSjDzj/7XZufLTuVVg=;
        h=Subject:From:Date:To:From;
        b=aOYuYTzfChbmeC5AzAYtDRY+7dW5fC2wOEZc2b4J5PwhKh4nc32wBFoLeElpJMNNO
         DoYexnTVGHHvOZcCq693LLeBWDK9EqEBUz0BYpxZ+UWRsuZN/BMsLs2aE9bWM3D+yw
         pi0N3wQeyomfq06OipLC7S4pzQ+L0OzRnhJLiVzA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160028284838.7285.15145009135057680760.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 16 Sep 2020 19:00:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] tests: Provide {un,}bind testing (2020-09-16T14:18:15)
  Superseding: [v1] tests: Provide {un,}bind testing (2020-05-25T13:21:48):
    [VSP-Tests] tests: Provide {un,}bind testing


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
