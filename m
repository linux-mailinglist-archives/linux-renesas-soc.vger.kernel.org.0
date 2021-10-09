Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A58D427BDE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Oct 2021 18:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhJIQYC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Oct 2021 12:24:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11984 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229528AbhJIQYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 12:24:02 -0400
X-IronPort-AV: E=Sophos;i="5.85,360,1624287600"; 
   d="scan'208";a="96471372"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2021 01:22:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8191840A10DF;
        Sun, 10 Oct 2021 01:22:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add eMMC/Micro SD support
Date:   Sat,  9 Oct 2021 17:21:56 +0100
Message-Id: <20211009162158.17112-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add eMMC/Micro SD support on RZ/G2L SMARC EVK
platform.

v2->v3:
 * Fixed typo 64Gb->64 GB in commit message and comment
 * Fixed typo SDO->SD0 in comment.

v1->v2:
 * Dropped SoC dtsi patches, since it is accepted for 5.16.
 * Updated the comment from 64Gb to 64 GB for eMMC size
 * Added angular brackets for states
 * Fix the gpio-hog node names
 * Fixed label names to match with the schematics

Biju Das (2):
  arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on SMARC platform
  arm64: dts: renesas: rzg2l-smarc: Enable microSD on SMARC platform

 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 143 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  62 ++++++++
 2 files changed, 205 insertions(+)

-- 
2.17.1

