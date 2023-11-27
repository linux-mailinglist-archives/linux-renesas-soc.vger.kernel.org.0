Return-Path: <linux-renesas-soc+bounces-269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AF7F9C55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B74428112F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33E713AEA;
	Mon, 27 Nov 2023 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aBN5G60R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CB6D56
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:51 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so5439186a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075890; x=1701680690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFPzyYcg2nUUJpJ3l3C/kpW+QQW8M0KLB90b9p9tNMM=;
        b=aBN5G60RGOPaDQLtt8UsvGBjnXb3POhSF2ghUsdTfzN2oXHfPrmoNJltef434ClBBO
         slK79P+pSwgj3DbfC8MAnMzoSNSm5kQqhB2Sucdk2xin8VM6DmkyXmpkOcP/JMtljC+S
         rmj8beatuLWIZU1Rmhk25ht5R1OpW1JR5wI31s2wx3UYguaz2dFzsqnvq9/3Cp9zWYaZ
         akhcNadPZOx86mqInbdYP9I942UpBG5hXpsYXsh0t+NNaIMa5LRrUtZGV/+ZDUruXlzt
         m7YVObIX0lhe2FAV0ETx95B1txsNYBPYfdkY0h5qStGrBs+RBHdnP9teTM7rbMer6O//
         vRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075890; x=1701680690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFPzyYcg2nUUJpJ3l3C/kpW+QQW8M0KLB90b9p9tNMM=;
        b=ebZpfRAvV0FfjPzDfE8TEFDLZCbHMa/SizEQ4oW5AWwy+Ql3wKopyy+yTsTcvq/WBZ
         U7IElUqbj+IsbcFuLzInJkk1JoAjjqkO+fwoCgebYs8bn2DS4CQw8JoRbge+1hX5u9Vr
         QT0EIpLLSjvZTdlT3vCwEXroOdfv5SPDmoHVYvzuJe69NqGVb9I5YJj1cEjknl3/6fxK
         fy4myYy2ls7yJPOtNA+LM9JrJbYg7t7sFE1k/IlKq7l934pRJhsF6h5jmXw9eJSSg8sg
         BxBo9bqtvTD3SgSyubNWV3ip5PbW5Fl1tREY3AQyDfynlcrFV75W1IKSLFJpw2zJgk25
         7y/A==
X-Gm-Message-State: AOJu0Yzd9qTCvclAobG09DH6r3i+5yYvvWYuGiyvWQ0UXtCd4pdyg4Df
	4WZ7gqChcG3x05cuntW/8gwCcQ==
X-Google-Smtp-Source: AGHT+IG75ahxVbdOpMa6yVtBJCLfLwgBcjelwbDYnqzwJwKosGZ3obiYPvVpMGx+sQuqdwUax2Sqow==
X-Received: by 2002:a17:906:8916:b0:9e6:1dc9:9807 with SMTP id fr22-20020a170906891600b009e61dc99807mr5225024ejc.77.1701075889980;
        Mon, 27 Nov 2023 01:04:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:49 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/6] net: ravb: Keep reverse order of operations in ravb_remove()
Date: Mon, 27 Nov 2023 11:04:26 +0200
Message-Id: <20231127090426.3761729-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S SMARC Carrier II board having RGMII connections b/w Ethernet
MACs and PHYs it has been discovered that doing unbind/bind for ravb
driver in a loop leads to wrong speed and duplex for Ethernet links and
broken connectivity (the connectivity cannot be restored even with
bringing interface down/up). Before doing unbind/bind the Ethernet
interfaces were configured though systemd. The sh instructions used to
do unbind/bind were:

$ cd /sys/bus/platform/drivers/ravb/
$ while :; do echo 11c30000.ethernet > unbind ; \
  echo 11c30000.ethernet > bind; done

It has been discovered that there is a race b/w IOCTLs initialized by
systemd at the response of success binding and the
"ravb_write(ndev, CCC_OPC_RESET, CCC)" instruction in ravb_remove() as
follows:

1/ as a result of bind success the user space open/configures the
   interfaces tough an IOCTL; the following stack trace has been
   identified on RZ/G3S:

Call trace:
dump_backtrace+0x9c/0x100
show_stack+0x20/0x38
dump_stack_lvl+0x48/0x60
dump_stack+0x18/0x28
ravb_open+0x70/0xa58
__dev_open+0xf4/0x1e8
__dev_change_flags+0x198/0x218
dev_change_flags+0x2c/0x80
devinet_ioctl+0x640/0x708
inet_ioctl+0x1e4/0x200
sock_do_ioctl+0x50/0x108
sock_ioctl+0x240/0x358
__arm64_sys_ioctl+0xb0/0x100
invoke_syscall+0x50/0x128
el0_svc_common.constprop.0+0xc8/0xf0
do_el0_svc+0x24/0x38
el0_svc+0x34/0xb8
el0t_64_sync_handler+0xc0/0xc8
el0t_64_sync+0x190/0x198

2/ this call may execute concurrently with ravb_remove() as the
   unbind/bind operation was executed in a loop
3/ if the operation mode is changed to RESET (though
   ravb_write(ndev, CCC_OPC_RESET, CCC) instruction in ravb_remove())
   while the above ravb_open() is in progress it may lead to MAC
   (or PHY, or MAC-PHY connection, the right point hasn't been identified
   at the moment) to be broken, thus the Ethernet connectivity fails to
   restore.

The simple fix for this is to move ravb_write(ndev, CCC_OPC_RESET, CCC))
after unregister_netdev() to avoid resetting the controller while the
netdev interface is still registered.

To avoid future issues in ravb_remove(), the patch follows the proper order
of operations in ravb_remove(): reverse order compared with ravb_probe().
This avoids described races as the IOCTLs as well as unregister_netdev()
(called now at the beginning of ravb_remove()) calls rtnl_lock() before
continuing and IOCTLs check (though devinet_ioctl()) if device is still
registered just after taking the lock:

int devinet_ioctl(struct net *net, unsigned int cmd, struct ifreq *ifr)
{
	// ...

        rtnl_lock();

        ret = -ENODEV;
        dev = __dev_get_by_name(net, ifr->ifr_name);
        if (!dev)
                goto done;

	// ...
done:
        rtnl_unlock();
out:
        return ret;
}

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since [1]:
- none; this patch is new

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 805720166ef3..9cad10db59b7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2894,22 +2894,26 @@ static void ravb_remove(struct platform_device *pdev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
 
-	/* Stop PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
-	clk_disable_unprepare(priv->gptp_clk);
-	clk_disable_unprepare(priv->refclk);
-
-	/* Set reset mode */
-	ravb_write(ndev, CCC_OPC_RESET, CCC);
 	unregister_netdev(ndev);
 	if (info->nc_queues)
 		netif_napi_del(&priv->napi[RAVB_NC]);
 	netif_napi_del(&priv->napi[RAVB_BE]);
+
 	ravb_mdio_release(priv);
+
+	/* Stop PTP Clock driver */
+	if (info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
+
+	/* Set reset mode */
+	ravb_write(ndev, CCC_OPC_RESET, CCC);
+
+	clk_disable_unprepare(priv->gptp_clk);
+	clk_disable_unprepare(priv->refclk);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(priv->rstc);
-- 
2.39.2


