Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059047C862
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 18:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGaQRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 12:17:51 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:35474 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbfGaQRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 12:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564589868;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=qdZeuJ27tx/q1ZNYIpUzd3o2lsXbdumtaxt43HjC2yI=;
        b=PzsSltF0IxI8t+DdZqwZ7RAu7bEfkXmXoiVhP/xVDOVlhZ6zneNbDAtD5PLyhZaMi2
        0NAx6wlaQt4KUuuRf9XIffx3FQ7gGNwleq+Yfcsnc+D4S+Xerh3KWkS95BqtxPJWu8fW
        KXeUti3aYaGQPoJ6JbNCDVkEEG383tI8kWw8wLXHuCWOE9NUYxlDZGV1g03C2pArp4vF
        nOWSze2B+WuJcHLp7pjhPB1EtmJc4pxK2MSwBqxhxNO7Mnhk7c6txYPI/SGVs9evkjGN
        a9r/SyvLvDNr39HEpdZuzsqGKL5eyKPAm64+CR+iLIq+hqbd4Uu4ZTXx31tzBHmGpgeN
        vuRw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dZd6zDDg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v6VGHfaNY
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 18:17:41 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Cc:     niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        yamada.masahiro@socionext.com, geert@linux-m68k.org,
        ulf.hansson@linaro.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 0/2] mmc: tmio: remove Gen2+ workaround and fix up
Date:   Wed, 31 Jul 2019 18:17:35 +0200
Message-Id: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi!

Second revision of the series that eliminates the forced-on eMMC workaround
for Renesas Gen2 SoCs and fixes up the clock imbalance exposed by that,
which is caused by interactions between runtime PM and the tmio hardware
driver.

Thanks to Ulf, Niklas and Geert for reviews and testing, see below for changes.

CU
Uli

Changes since v1:
- Keep clock handling in driver if no power domain is attached.
- Describe clock imbalance issue in commit message.
- Add commit hash for "mmc: tmio: move runtime PM enablement to the
driver implementations".


Ulrich Hecht (2):
  mmc: tmio: leave clock handling to runtime PM if enabled
  mmc: tmio: remove obsolete PM workaround

 drivers/mmc/host/tmio_mmc_core.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.7.4

