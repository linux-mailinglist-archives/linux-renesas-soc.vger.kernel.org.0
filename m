Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A37240C245
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Sep 2021 11:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbhIOJBJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Sep 2021 05:01:09 -0400
Received: from mail3.swissbit.com ([176.95.1.57]:52248 "EHLO
        mail3.swissbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237103AbhIOJBD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 05:01:03 -0400
X-Greylist: delayed 561 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Sep 2021 05:01:02 EDT
Received: from mail3.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id EFBDD4629F1;
        Wed, 15 Sep 2021 10:50:21 +0200 (CEST)
Received: from mail3.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id D83DA462576;
        Wed, 15 Sep 2021 10:50:21 +0200 (CEST)
X-TM-AS-ERS: 10.149.2.84-127.5.254.253
X-TM-AS-SMTP: 1.0 ZXguc3dpc3NiaXQuY29t Y2xvZWhsZUBoeXBlcnN0b25lLmNvbQ==
X-DDEI-TLS-USAGE: Used
Received: from ex.swissbit.com (SBDEEX02.sbitdom.lan [10.149.2.84])
        by mail3.swissbit.com (Postfix) with ESMTPS;
        Wed, 15 Sep 2021 10:50:21 +0200 (CEST)
Received: from sbdeex02.sbitdom.lan (10.149.2.84) by sbdeex02.sbitdom.lan
 (10.149.2.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Wed, 15 Sep
 2021 10:50:21 +0200
Received: from sbdeex02.sbitdom.lan ([fe80::e0eb:ade8:2d90:1f74]) by
 sbdeex02.sbitdom.lan ([fe80::e0eb:ade8:2d90:1f74%8]) with mapi id
 15.02.0792.015; Wed, 15 Sep 2021 10:50:21 +0200
From:   =?iso-8859-1?Q?Christian_L=F6hle?= <CLoehle@hyperstone.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "doug.anderson@chromium.org" <doug.anderson@chromium.org>
Subject: Re: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Thread-Topic: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Thread-Index: AQHXqZVDftXqhrVI8EiMtFMWw6jtYaukxmKP
Date:   Wed, 15 Sep 2021 08:50:21 +0000
Message-ID: <bfe5e22fa30344f480b176f5e96afa66@hyperstone.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.154.1.4]
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-TMASE-Version: DDEI-5.1-8.6.1018-26408.006
X-TMASE-Result: 10-0.047000-10.000000
X-TMASE-MatchedRID: yxAmdCLMIs3UL3YCMmnG4qqHmm/V4M/PAPiR4btCEeZ1D3qk2LfE7x8a
        RhKglPt8UWixuWgL6KhfaFBgmyIFpWrCMAFDPKUmzNIobH2DzGEBGSO+Oopk6iATiLvsSv4cHB8
        dBttPBAZ06g90LjJRaNzEiNfPesLd9v1YvKhgkvkkp7iSXiinhG0tJ9ZqJpFsWnG8Krv6kzKTrr
        +C1WNmxUGv3d/tCdGJJM5m27St9RrPvZCJ3jmZYZVRzPxemJL0yeUl7aCTy8hTbQ95zRbWVlhLR
        OZy4c8OmAIgl32WEOud1cJ+ghnpuEzOmjZzSvazF+qQpCWTUjkiJN3aXuV/obcIt210bWgIFbbp
        rMc1hSO3IAm6OhmFjUk+8jV4IoVXVdgv/fqHkl6cVWc2a+/ju1XgGeVUh3WdiTb+rJjwRo+jxYy
        RBa/qJc3XmA2J2nVzfJ5/bZ6npdjiRhduhvElsvJT+hf62k2YrW1bpbgtvwBCSwwTaAVGm6ZFc2
        mMv1qlIycJt175te5inh43K2COxePlwCWV27Nr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-TMASE-XGENCLOUD: 604d3e44-2e65-4a48-9e2e-e9baf7ee4393-0-0-200-0
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I did not test the patch but want to make you aware of the comment in dw_mmc:
/*
* During UHS tuning sequence, sending the stop
* command after the response CRC error would
* throw the system into a confused state
* causing all future tuning phases to report
* failure.
*
* In such case controller will move into a data
* transfer state after a response error or
* response CRC error. Let's let that finish
* before trying to send a stop, so we'll go to
* STATE_SENDING_DATA.
*
* Although letting the data transfer take place
* will waste a bit of time (we already know
* the command was bad), it can't cause any
* errors since it's possible it would have
* taken place anyway if this tasklet got
* delayed. Allowing the transfer to take place
* avoids races and keeps things simple.
*/
The message in 46d179525a1f6d16957dcb4624517bc04142b3e7
does not mention which card was causing problem, unfortunately.




From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Sent: Tuesday, September 14, 2021 8:20 PM
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org; Yoshihiro Shimoda; Wolfram Sang
Subject: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
    
After my hackish RFC patch, here is a small series implementing
(hopefully) the solution we discussed. It will make
mmc_send_abort_tuning() also send CMD12 for SD cards which makes more SD
cards work for us. Details are in the patch descriptions.

Please let me know what you think.

Thanks, and happy hacking!


Wolfram Sang (3):
  mmc: core: add helper to send STOP
  mmc: core: also abort tuning with CMD12 for SD
  mmc: core: remove obsolete parameter from mmc_send_abort_tuning

 drivers/mmc/core/block.c             | 14 +-------------
 drivers/mmc/core/core.h              |  1 +
 drivers/mmc/core/mmc.c               |  6 ++++++
 drivers/mmc/core/mmc_ops.c           | 23 ++++-------------------
 drivers/mmc/core/mmc_ops.h           | 14 ++++++++++++++
 drivers/mmc/core/sd.c                |  6 ++++++
 drivers/mmc/host/renesas_sdhi_core.c |  2 +-
 drivers/mmc/host/sdhci.c             |  2 +-
 include/linux/mmc/host.h             |  2 +-
 9 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.30.2

    =
Hyperstone GmbH | Line-Eid-Strasse 3 | 78467 Konstanz
Managing Directors: Dr. Jan Peter Berns.
Commercial register of local courts: Freiburg HRB381782

