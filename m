Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021911924DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 11:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgCYKAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 06:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgCYKAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 06:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585130442;
        bh=eEPRzPyzC3TV5K8T5L6Q0hxmVdznzmxbpP4Zi26dWpU=;
        h=Subject:From:Date:To:From;
        b=gEaKE7u/FwT4OhI5QBFOE6xFrG4JwJHdO0vVCEK1faPv2KCTWRubTOTQPywCIC89T
         AgeQgSLB1XE6fOp04VUAa7NnTrWqb2GGNC+5+F++8AU0AA/IZMq9L2Vz08SBJb8vik
         YWB14r73ua5S7q4AAvNx/gA3CWP5UxCLtplPqxBc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158513044219.2693.16758369232831744461.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 25 Mar 2020 10:00:42 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: serial: sh-sci: Convert to json-schema (2020-03-25T09:57:21)
  Superseding: [v1] dt-bindings: serial: sh-sci: Convert to json-schema (2020-03-06T09:07:20):
    dt-bindings: serial: sh-sci: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
