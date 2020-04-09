Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27491A321A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 11:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIJs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 05:48:56 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:55272 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIJs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:48:56 -0400
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 48ybv973dSz4f3lwd;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1586425734;
        bh=Emk+oCatsj2UF/58rIn7CY0omkGnijASbVgyPSDoea8=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=Geihg/HejHHOFwlvAV39mNZ6o0nGfJoc6En/3Xk6U9AtNmaUcwcsNdrWHEwT7hV2u
         Ac2JLAGSndg1Aef4I+3PsZxZZAzUqxvWnZk7PZyAk8EacBd64akUNgn0B/hAWigXXd
         5x53rf180EoXXl/e0HgLC1LKAkuZQVsCWwt/fA6A=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 48ybv96qf0z2cL;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
X-AuditID: 0a3aad16-993ff70000002671-70-5e8eef85e3d3
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id 4C.7B.09841.58FEE8E5; Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 48ybv95XM2zvl5;
        Thu,  9 Apr 2020 11:48:53 +0200 (CEST)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1979.3; Thu, 9 Apr 2020 11:48:53 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     <geert+renesas@glider.be>, <dirk.behme@de.bosch.com>
Subject: [PATCH v2 2/2] ravb: Drop unused RAVB_{R,T}XTSTAMP_VALID macros
Date:   Thu, 9 Apr 2020 11:48:51 +0200
Message-ID: <20200409094851.22142-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200409094851.22142-1-dirk.behme@de.bosch.com>
References: <20200409094851.22142-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxTZxTHedoObptec7mIHDsQuY6FobC2jNkhItsXyYyDLIzMAWXFXmhn
        W7AXGsBlFgTDqGKZQRjC4tgwFdgbiswXfCk4wQyGTpGXD+CCszBEawEHiK4vIP2wbyfnf37n
        f55/HoxNnvESYEpNDq3VyFSUJ4/Di/ohIKzkUblUeGExQlJ3/CskaR2fYkl+bxzyimXHjVa+
        YMVV9ITF2VrWJbA/4UXLaZVSR2vfjPmUp3jx/CAnW4/lPe196qVHDzzLEBcD4i241lWJyhAP
        I4lqFvxWUchyCCRxEcGA9TOX8BOC1pNWL4fgSYTCOWOps15NpEHxz8XOTWxCAnNTY07Yh4gD
        w0KRc4ZDvAb35w3OGieiYeFiB9vlHAjHmsqc81xiK4zYBuxXYHazaDh6l3KNe0P312Mc1/pA
        ONB6nO2qAa5aLEtrgqC55twrRuRd44bUuCE1bsgJxG5EvoxSqFOLhRJxuDadZgqEovDdWeoW
        5Mp3za+orexxuBmxMGRGkRiL8sXP3y+XkqvSs+T5ChmjSNPmqmiGEuD7J79MJX1etpncdLWS
        YZRZGjMCjE2txncUHZaSuFyWX0Brs1yYGb2KcSg/3Je3T0oSmbIceg9NZ9PaZXULhlGAL07Z
        Db21dCadl6FU5SzLVACOPDw8yDXuirstC+OaUQTGt3uPO27GmWyZmlFmLuFrXTi53F1Bb6DN
        Aj/c6rAlHKoiV/PSVeCPi5vsD/F1E1bICTSIMET54FIHzLf/1hU/wPWOiLyXmiuQuMHOEKUc
        +PdQBQcK65/wwfLsWxKsC1W+MDlS6AcXxuoFcFrfHADm24MhYGp4Fgq2quJNMG89FAXN04Pv
        ga2mcCdMt9V+AJVzffEwNDL8oX2kMwkquydTobyxUwZzdTdlYKo4KIfTAzflcLmwNBNmrjxU
        QPftb5QwcrZnD1gW6tQwPTyvhurZMxqobpnRwJHemb1wdPFK7oQ9TJY9zP50gyPMHFnO/4S5
        1F15nUDPOsyIB+rfjjYGH/P/Z6xdsu6xqTfI7G0MoGrbh4MnFjYmq4NwuoNtmFnVx4U0U16/
        7U/+RlHifG3D2s6I65ctLT5xf2/5PHhoW2Ksqf0NzmhY/q1T/SElmx6ISn6MtySn9Yhmu6VN
        hqZdmmvJgZakjK7tjO11of/6R7noO4lYN963u0txomR468m5gdiQmDs6ML5f9kubz35uwdl7
        locf9eTJJ97x7GhPKFCRz7eZ7p33l1yPT9Hcok/d+T5m2K9I05owbdnsOWLQfeG1V/vHbFL1
        jlD5u39tvxq5XnUpfqgrdd8BfpQ0T/PxaIYl9sbdxMFdl6IiU/ixT5TBKRtSpVWJFIdRyESh
        bC0j+w8WZA9GxwQAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These macros are unused, we can safely drop them.

Cleanup only, no functional change.

Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2: Split fix and cleanup into two patches.

 drivers/net/ethernet/renesas/ravb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e921eae82022..5a05b74a6fe6 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -35,10 +35,8 @@
 #define RAVB_ALIGN	128
 
 /* Hardware time stamp */
-#define RAVB_TXTSTAMP_VALID	0x00000001	/* TX timestamp valid */
 #define RAVB_TXTSTAMP_ENABLED	0x00000010	/* Enable TX timestamping */
 
-#define RAVB_RXTSTAMP_VALID	0x00000001	/* RX timestamp valid */
 #define RAVB_RXTSTAMP_TYPE	0x00000006	/* RX type mask */
 #define RAVB_RXTSTAMP_TYPE_V2_L2_EVENT 0x00000002
 #define RAVB_RXTSTAMP_TYPE_ALL	0x00000004
-- 
2.20.0

