Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F93C1AE12F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 17:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgDQPay (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 11:30:54 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59765 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729023AbgDQPau (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:30:50 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1Ofr-1jEYe61Uxn-012rTp; Fri, 17 Apr 2020 17:30:29 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 72E7C650EEE;
        Fri, 17 Apr 2020 15:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uQP4eFNE1n7O; Fri, 17 Apr 2020 17:30:28 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 1DCB064ECEB;
        Fri, 17 Apr 2020 17:30:28 +0200 (CEST)
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
Subject: [PATCH 1/2] ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
Date:   Fri, 17 Apr 2020 17:30:16 +0200
Message-ID: <20200417153017.1744454-2-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
References: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.8.5.29]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B64766A
X-Provags-ID: V03:K1:905W2ZJz4v+jyqVb/Nkvj2ugtw0+l5agWgbR+E2f0oGvVpyMN/q
 qa1EhDJDpS2Eafj1RUrBekh2aaYG/aC6xLZ41KfAOCsnsspfX0vdypKjU0GwkzAirD5cT/b
 yWb3b1gdvaV9kmOMALR5EtVN+ggi6Gp1RfLTum7tkJd0faq1RNivbzD1LfNx4TBV7RxEGtm
 HRBjm5pnQwiV8dZhNG7sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cKC4gVX6Fxs=:R1T2Lf//daTbxWdr+e2Byq
 lILnLt6XnnWw1QXcZcckIShXRT7nuSPWSxjfrVhysO5tnsF470C1iMaSRzXKKn3JCX0+msJ9h
 /TXEILm7/pQ7YWWtoo1merok/zla470NF5D9sCK/jzUXif3MMFeeB/8mLRTkxVQlrmDUdL5Rn
 cP96NX2hru+1BqyTsz3mpQ3G0FXWcHRRfAl9QUVvLvkQwBXd2UV8vqmJYrKCuMGNBCSARzgLK
 oO48RdsppUXEtVi2+6ABIcwN7+R1ua8Q55lfWilZ47XPjsKrm4c+rN1aQpJ0+SRBt/cg0RpzY
 oaWsOGCQV3g7jxzDCHWkSmQGL2ULMbUwfa2/NRPR/hYfUfF+xROcpC3zsAhvBCqOjUZmW+cCg
 Dd1vQ7Xz0FdpZ5g1nu8ZnC3QLK8vlXV4UKLhVuHm2rFKdUioMVSP8ELkD4/nnRO715qq2dg6q
 gbiWRq594q5lFhJRXIqvj9AF4mEhfJCsL3hlM2RTLXRFJpRatzeVXeUcFNjExDG0n/xYcjejg
 OhJWlRcCPlMVLnDe+EetaMvptbyXM5N1YBepgiOPkwy7BKE4/SHs7w+2lQ/z9T8Rz+/oASpPv
 0hG8i0A5dJzQPEV9/3RfiD5xS5vooQCykjYLa9CO6yZhH8zFh6VWcToyvVBBNqvGcsKzfnIyN
 Do33/JDUlmln4jbrYIUPqE86TPaz0D45NKZ6iAB9fXVGLOGql1/783o1ChvCnI/uh5Jx88MeZ
 6WEQESPsyVUIIWhCZP7dvYnggVXaWXfXSBlIVFVDvj2jLmF068Oz2gTL5cp5JOj6vg9FJ5bss
 UyrBV+D3hgGbfIm12LTLpxuvWUDIWm0jm+FCfFDQZdjoOnoaQ0Ke1kZtE03fFWN1s3aYzQRVW
 0S7mFzLSiASnzNS0acag==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The master SSI of a multi-SSI setup was attached both to the
RSND_MOD_SSI slot and the RSND_MOD_SSIP slot of the rsnd_dai_stream.
This is not correct wrt. the meaning of being "parent" in the rest of
the SSI code, where it seems to indicate an SSI that provides clock and
word sync but is not transmitting/receiving audio data.

Not treating the multi-SSI master as parent allows removal of various
special cases to the rsnd_ssi_is_parent conditions introduced in commit
a09fb3f28a60 ("ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode").
It also fixes the issue that operations performed via rsnd_dai_call()
were performed twice for the master SSI. This caused some "status check
failed" spam when stopping a multi-SSI stream as the driver attempted to
stop the master SSI twice.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---
 sound/soc/sh/rcar/ssi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index d51fb3a39448..9900a4f6f4e5 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -407,7 +407,7 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * We shouldn't exchange SWSP after running.
 	 * This means, parent needs to care it.
 	 */
-	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
+	if (rsnd_ssi_is_parent(mod, io))
 		goto init_end;
 
 	if (rsnd_io_is_play(io))
@@ -559,7 +559,7 @@ static int rsnd_ssi_start(struct rsnd_mod *mod,
 	 * EN is for data output.
 	 * SSI parent EN is not needed.
 	 */
-	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
+	if (rsnd_ssi_is_parent(mod, io))
 		return 0;
 
 	ssi->cr_en = EN;
@@ -582,7 +582,7 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
+	if (rsnd_ssi_is_parent(mod, io))
 		return 0;
 
 	cr  =	ssi->cr_own	|
@@ -620,7 +620,7 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (rsnd_is_gen1(priv))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
+	if (rsnd_ssi_is_parent(mod, io))
 		return 0;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
@@ -737,6 +737,9 @@ static void rsnd_ssi_parent_attach(struct rsnd_mod *mod,
 	if (!rsnd_rdai_is_clk_master(rdai))
 		return;
 
+	if (rsnd_ssi_is_multi_slave(mod, io))
+		return;
+
 	switch (rsnd_mod_id(mod)) {
 	case 1:
 	case 2:
-- 
2.26.1

