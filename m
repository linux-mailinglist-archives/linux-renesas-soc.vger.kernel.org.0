Return-Path: <linux-renesas-soc+bounces-664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CA803D19
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 19:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C01628120D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 18:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C19E2F876;
	Mon,  4 Dec 2023 18:32:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F93D2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 10:32:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj4-00038w-0z; Mon, 04 Dec 2023 19:31:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj1-00DZmP-KD; Mon, 04 Dec 2023 19:31:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rADj1-00EE78-9y; Mon, 04 Dec 2023 19:31:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Alex Elder <elder@kernel.org>,
	netdev@vger.kernel.org,
	kernel@pengutronix.de,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Nick Child <nnac123@linux.ibm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org,
	Zhao Qiang <qiang.zhao@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	linux-arm-kernel@lists.infradead.org,
	Stephan Gerhold <stephan@gerhold.net>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-msm@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-wpan@vger.kernel.org
Subject: [PATCH net-next v2 0/9] net*: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 19:30:40 +0100
Message-ID: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=OVvQ8uYjxLMYTaZSJq1OCfRdtPS4cvgLm8vM3BejMRM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbhrRA9QNL9A6/+EC/b+KUL8ByuRJhbrVgnSOG 4TWQn68YNaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW4a0QAKCRCPgPtYfRL+ TjVDB/0eG4VYbw9drfz2A1JiSQIiH+SED39TRg3MQbSa1i7JvhthEdJz3RsgmHJGxuIbvTEaf+G pE3/IiK/WYsAVNlWURx8F58h1MaKSgcCxB6UkK3F13nFcsSdkYViabIu/cyHooy2wVyyCDL31/D kmn9dtqyNwosyXWaN7VXQpLtM+q3Smw5Tl9HVpWdfAenzfShrzn6h5h1vT6pkXsWjucByaEjmjO Ep/nxUhk6mkRawEkvZ2rMZ7/IgkiQ/KfWaIVwkGYHngmAUDeMcuHd3+70YIw50qlOokbuV/k5yW CVge3kM7/CpnqYDmiBU/n7A3crLTVVTN0roUGmeLUQIG0uxJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hello,

(implicit) v1 of this series can be found at
https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pengutronix.de.
Changes since then:

 - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
   converts ipa to remove_new() and introduces an error message in the
   error path that failed before.

 - Rebased to today's next

 - Add the tags received in the previous round.

Uwe Kleine-König (9):
  net: ipa: Convert to platform remove callback returning void
  net: fjes: Convert to platform remove callback returning void
  net: pcs: rzn1-miic: Convert to platform remove callback returning
    void
  net: sfp: Convert to platform remove callback returning void
  net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
    void
  net: wan/ixp4xx_hss: Convert to platform remove callback returning
    void
  net: wwan: qcom_bam_dmux: Convert to platform remove callback
    returning void
  ieee802154: fakelb: Convert to platform remove callback returning void
  ieee802154: hwsim: Convert to platform remove callback returning void

 drivers/net/fjes/fjes_main.c             |  6 ++---
 drivers/net/ieee802154/fakelb.c          |  5 ++--
 drivers/net/ieee802154/mac802154_hwsim.c |  6 ++---
 drivers/net/ipa/ipa_main.c               | 29 +++++++++++-------------
 drivers/net/pcs/pcs-rzn1-miic.c          |  6 ++---
 drivers/net/phy/sfp.c                    |  6 ++---
 drivers/net/wan/fsl_ucc_hdlc.c           |  6 ++---
 drivers/net/wan/ixp4xx_hss.c             |  5 ++--
 drivers/net/wwan/qcom_bam_dmux.c         |  6 ++---
 9 files changed, 29 insertions(+), 46 deletions(-)


base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
-- 
2.42.0


