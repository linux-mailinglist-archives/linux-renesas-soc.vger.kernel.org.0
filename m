Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26FA763C10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 18:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjGZQNo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 12:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGZQNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 12:13:43 -0400
Received: from wp534.webpack.hosteurope.de (wp534.webpack.hosteurope.de [80.237.130.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A6A1BCD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 09:13:42 -0700 (PDT)
Received: from [2001:a61:6206:cc01:c80a:ff:fe00:19d] (helo=cs-wrt.lan.local); authenticated
        by wp534.webpack.hosteurope.de running ExIM with esmtpa
        id 1qOgLg-0000ce-Ro; Wed, 26 Jul 2023 17:22:48 +0200
From:   =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (isl28022) new driver for ISL28022 power monitor
Date:   Wed, 26 Jul 2023 17:22:32 +0200
Message-Id: <20230726152235.249569-1-mail@carsten-spiess.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;mail@carsten-spiess.de;1690388023;e854f161;
X-HE-SMSGID: 1qOgLg-0000ce-Ro
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver for Renesas ISL28022 power monitor chip.
Found e.g. on Ubiquiti Edgerouter ER-6P

Carsten Spieß (2):
  hwmon: (isl28022) new driver for ISL28022 power monitor
  dt-bindings: hwmon: add renesas,isl28022

 .../bindings/hwmon/renesas,isl28022.yaml      |  67 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/isl28022.rst              |  56 +++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/isl28022.c                      | 405 ++++++++++++++++++
 7 files changed, 549 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

-- 
2.34.1

