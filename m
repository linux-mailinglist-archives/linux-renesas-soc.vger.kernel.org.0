Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B805F40AB37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 11:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhINJ4u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 05:56:50 -0400
Received: from mail.iot.bzh ([51.75.236.24]:53345 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229969AbhINJ4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 05:56:50 -0400
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Sep 2021 05:56:49 EDT
Received: from localhost.localdomain (843280159.box.freepro.com [88.202.238.44])
        by mail.iot.bzh (Postfix) with ESMTPSA id 53936400A1;
        Tue, 14 Sep 2021 11:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1631612823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=F9oAcXPg6JLHwwUlUisyjRkeJH0URiSm1VqJ2E3TWQw=;
        b=eIPyA7mfQGznHmK+fJ+Uy8tSRC7E5y96a5qNj4pE2lRLtutOuDL8kjcmoyobBxtbpi7JEP
        jdCaPsjeCKfw/hhnz4ISFOSLh89G1hrQbPLzinhEkZSHMzrLH2Ns9qyXtxg+6+7Q+4D7HL
        3Su7afNNKE/yV4gKxMoyi5OH3jUU3nir6qZfXwbxV0AHVcGvLqfnuZWXppcFAJNYtquTyr
        Qc0KgGJ73Et3IooUfkOH8yAROwPduhTdbIO4XJS1AGD5Nw+gDED0Tp2iRgKBy0eb6dciia
        a2oMg+pdsY1AlUcZTtubBfYnhakGvjCabESsaD96gTRxzWPtdLQYgbDUjCs2Xw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [RFC PATCH 0/1] Add support for setting Cortex R7 boot address
Date:   Tue, 14 Sep 2021 11:46:49 +0200
Message-Id: <20210914094650.15235-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
I plan to submit a small driver to remoteproc subsystem in order
to manage the Cortex R7 found on various SoCs of the R-Car Gen3
SoC series.

Enabling this processor from the remoteproc subsystem requires to:
- loading a firmware to a RAM area.
- setting the boot address thanks to CR7BAR register
- enable power domains
- deassert CR7 reset

The goal here is to export a function from rcar-rst.c to allow a
a remoteproc driver to set this boot address.

I'm not so much used to manipulate init data so don't hesitate to
comment.

Thanks !

Julien Massot (1):
  soc: renesas: rcar-rst: Add support to set rproc boot address

 drivers/soc/renesas/rcar-rst.c       | 28 +++++++++++++++++++++++++++-
 include/linux/soc/renesas/rcar-rst.h |  2 ++
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.31.1

