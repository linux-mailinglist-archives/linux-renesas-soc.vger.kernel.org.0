Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88F324D410
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 13:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgHULen (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 07:34:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbgHULej (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 07:34:39 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598009678;
        bh=cWkwsty2MbfyuOmhfwr9HMT2Og6bUHnYrAzeUtMS9RY=;
        h=Subject:From:Date:To:From;
        b=d5z8HxMHl0TT0GOWmYBAwrXX3qV5Rs7h2asbgdImptp4s3/vj5zmwccZBTEfnIWLT
         EQb0GVJleB993ZDhwieHihc2v1D8eAi9Zg6QzOveO1Xtj/tqBxY8ikAqmlY6da4ToN
         RnD8OpNCKU78wKefgGNxsQ4j7lcagBdRD5Nh3CfM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159800967809.30041.6600651843708375020.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 21 Aug 2020 11:34:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-08-21T11:22:08)
  Superseding: [v2] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-08-07T14:13:45):
    [PATCH/RFC,v2] dt-bindings: pinctrl: sh-pfc: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
