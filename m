Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402531AE12B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 17:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgDQPat (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 11:30:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57441 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729083AbgDQPas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:30:48 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mbzdn-1ipIWA0C5f-00da7d; Fri, 17 Apr 2020 17:30:29 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id CA23C650CBC;
        Fri, 17 Apr 2020 15:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aO044AulWpIr; Fri, 17 Apr 2020 17:30:27 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7911A64ECEB;
        Fri, 17 Apr 2020 17:30:27 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.29) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 17:30:27 +0200
From:   Matthias Blankertz <matthias.blankertz@cetitec.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: rsnd: multi-SSI setup fixes
Date:   Fri, 17 Apr 2020 17:30:15 +0200
Message-ID: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.8.5.29]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B64766A
X-Provags-ID: V03:K1:QNcV6Oturueaw/p4lzF3+WWTDTwDcZBnAuBryfo+i2N5dtxH2uq
 +t6Sz/ge4PJmiEuMN90KdNq2xXZ02NBWyuFHv8I9ot/+JtE/D+grmpZfFzqFM502cVrvtu6
 72WW2x5rokNOhTsiB5Ai2akfPhkovaE+x71vXV/8Zo4fpAKfbQbfJOkgW/ah5b5dIjHLY1d
 T5V2ieylNwuNfLpoY2BOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZY7ZuWAKTR0=:uSfd8DHZnxk85uOJoy4lG4
 3z1WmRTTkv5hQ3LHl/G5PQoBzvji083+YMfUQDrjh8UdZPwapZPXRt4vE5Qg2cHZDw3t1koAZ
 hnYuvEbfX4TPfrnkp6Cwl58P0Z+6Rqb/MYcvMVAu8hFB1rp+J7QKSnfqUGIoDZ+FatOOsnAEZ
 03qJnzM77w0l7Tbsm8liZkYq2HDubdQd9LVkBmavBjNWbV76KZ11bK/sO8ztXDznbTy1DRdow
 rT4RVJG/mRTXXH5q4ixDdETbcPGREjvCDIgWStP7q976pMz40zfuqHdliOMlr/kELehOdZrUi
 PjEI21j6VWkt05BB4bcKoOOdEkEwHRrP2DfWFdMh68EWfuXmxIVjj8qK+G6dEgGCTVt7u8uc7
 wyH6yyvzlHY0vopeqrmCs6TCt3nEtkQ5GTtspI9skT+KBljm0lVTw7bR6ozJwwUNezT4ohQO8
 ONTGib4Sg1+Ew7lM4i1ZGwO9JnKGna9Rx++EVCy+OIoi659eoz1OqejL4VtZFW92bXsLTdYE5
 BDYFi0N7lZSV3BwW7C1T/v8QuJJjY2NeIWSeU7Z5K6AbISYY2tqb583x3zoahfn3UbZktmq6k
 Kn1WOp/SbbtsGC/1GoRf+itfCocvfEefCSNLC5l4XDpbGHW91C23PpC20zNsYbNbeJhlLzxap
 NRDqRwRfjLycKOQ1uQCzUu0e4OhIjs4i7B7Sd+fEnCa11+/sKglNfr4/xTiXgZzygfgFPObT5
 JyMaABfvJYPSflI1XHwWod1bBpoloPaBCjV1Wu8gPceiVJGjCqyNJcrTnCia4EH6sQeofyaZ0
 lenyy2Krirp5kkoB2gelXn1Y1lqjrGHE2tcMUEYu7cG+z5RZlXboz+WSLy/XmqDldzJetU7dE
 k/+OAsmI/bTPWkOQuSkw==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix rsnd_dai_call() operations being performed twice for the master SSI
in multi-SSI setups, and fix the rsnd_ssi_stop operation for multi-SSI
setups.
The only visible effect of these issues was some "status check failed"
spam when the rsnd_ssi_stop was called, but overall the code is cleaner
now, and some questionable writes to the SSICR register which did not
lead to any observable misbehaviour but were contrary to the datasheet
are fixed.

Mark:
The first patch kind of reverts my "ASoC: rsnd: Fix parent SSI
start/stop in multi-SSI mode" from a few days ago and achieves the same
effect in a simpler fashion, if you would prefer a clean patch series
based on v5.6 drop me a note.

Greetings,
	Matthias


Matthias Blankertz (2):
  ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
  ASoC: rsnd: Fix "status check failed" spam for multi-SSI

 sound/soc/sh/rcar/ssi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

base-commit: 15a5760cb8b6d5c1ebbf1d2e1f0b77380ab68a82
-- 
2.26.1

