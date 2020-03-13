Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE8F184AE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2020 16:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMPnV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Mar 2020 11:43:21 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:39480 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMPnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 11:43:21 -0400
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id DrjG2200D5USYZQ01rjGXB; Fri, 13 Mar 2020 16:43:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0002sC-Eo; Fri, 13 Mar 2020 16:43:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jCmSy-0000RP-DR; Fri, 13 Mar 2020 16:43:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.7 (take two)
Date:   Fri, 13 Mar 2020 16:43:02 +0100
Message-Id: <20200313154304.1636-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313154304.1636-1-geert+renesas@glider.be>
References: <20200313154304.1636-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9e1232631d4e8e30096fa758a0e1fb9e08f219f9:

  ARM: dts: rzg1: Add reset control properties for display (2020-02-24 14:03:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.7-tag2

for you to fetch changes up to 99ae78f1fc3a73c88fe726c676ae963ce722bf20:

  ARM: dts: iwg22d-sodimm: Enable touchscreen (2020-03-11 09:01:09 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.7 (take two)

  - LCD/touchscreen support for the iwg22d-sodimm board.

----------------------------------------------------------------
Marian-Cristian Rotariu (2):
      ARM: dts: iwg22d-sodimm: Enable LCD panel
      ARM: dts: iwg22d-sodimm: Enable touchscreen

 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts |  6 ++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        | 93 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)
