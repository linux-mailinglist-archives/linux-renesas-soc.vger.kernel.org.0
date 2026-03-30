Return-Path: <linux-renesas-soc+bounces-30558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGroIu4nymnX5gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 09:36:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB53567FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 09:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51C6530062DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 07:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA7A37F749;
	Mon, 30 Mar 2026 07:36:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453363CB;
	Mon, 30 Mar 2026 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856171; cv=none; b=ngHzjLOXqxKRalOfjqCp07DwpDe0TTJCt7g3ca+8wW1aXe98BM3PFmqxwE40kEtNqATDoCEoUdjtxf2dv4D2MORK51Hu/Z+hUitn+Z41HUGr571/IRJHpiNoYuWoX8GVFXSi94Oo9rOf1Z7whE0zROcA0iObMLnYcCDvMBaDCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856171; c=relaxed/simple;
	bh=BQZpotQQK3Cl/Pxr9LOqc/Dgxxytr3uIdxlMtbfR10g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=USyIa0HIvP1kkuLaXPPwUc81Wsdpw5uzqA+FqBn3BGhddboPajpJHerhb+ZYvCngfwzLy56VPXnjda6RQEIfaYzzO9UBvou58wNWG65EfzCzoYG82o16CBSjF8WgKxpAhw07hncxNQu41ODiHejetqJn4bGdoMQDG0WQ6MSoxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-03 (Coremail) with SMTP id rQCowAD3EtrPJ8ppqg5LDA--.43334S2;
	Mon, 30 Mar 2026 15:35:51 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: yoshihiro.shimoda.uh@renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	niklas.soderlund+renesas@ragnatech.se,
	michael.dege@renesas.com,
	nikita.yoush@cogentembedded.com,
	yury.norov@gmail.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] net: renesas: rswitch: Fix memory leak in rswitch_phy_device_init()
Date: Mon, 30 Mar 2026 15:35:41 +0800
Message-ID: <20260330073541.2871414-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3EtrPJ8ppqg5LDA--.43334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18Xw45Zw4ktr4rJrWxCrg_yoW8Zw13pF
	WUGFWrJrykGr1aga18Ga1kJrWruw40kw1furyIy3WrKwn5X3s8ZryvqasxAr43CFZ7ZFy5
	XFy7Aa4rua4DJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoZ2-UUUU
	U
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-30558-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,cogentembedded.com,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[make24@iscas.ac.cn,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 82BB53567FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rswitch_phy_device_init() calls of_phy_find_device(), which calls
bus_find_device() to increments the refcount of the returned device.
The current implementation does not decrement the refcount after the
reference is no longer needed, causing a memory leak.

Add phy_device_free() to release the reference via put_device() and
balance the refcount.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Fixes: 0df024d0f1d3 ("net: renesas: rswitch: Add host_interfaces setting")
---
 drivers/net/ethernet/renesas/rswitch_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..126da0371a19 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1459,7 +1459,7 @@ static void rswitch_phy_remove_link_mode(struct rswitch_device *rdev,
 
 static int rswitch_phy_device_init(struct rswitch_device *rdev)
 {
-	struct phy_device *phydev;
+	struct phy_device *phydev, *tmp_phydev;
 	struct device_node *phy;
 	int err = -ENOENT;
 
@@ -1473,14 +1473,18 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
 	/* Set phydev->host_interfaces before calling of_phy_connect() to
 	 * configure the PHY with the information of host_interfaces.
 	 */
-	phydev = of_phy_find_device(phy);
-	if (!phydev)
+	tmp_phydev = of_phy_find_device(phy);
+	if (!tmp_phydev)
 		goto out;
-	__set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
+	__set_bit(rdev->etha->phy_interface, tmp_phydev->host_interfaces);
 	phydev->mac_managed_pm = true;
 
 	phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
 				rdev->etha->phy_interface);
+
+	/* Release the temporary reference obtained by of_phy_find_device() */
+	phy_device_free(tmp_phydev);
+
 	if (!phydev)
 		goto out;
 
-- 
2.43.0


