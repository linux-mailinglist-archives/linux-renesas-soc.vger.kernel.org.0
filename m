Return-Path: <linux-renesas-soc+bounces-6957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C491EDFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 06:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EFAD2853D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 04:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0E82C6B7;
	Tue,  2 Jul 2024 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="SYprESsx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2084.outbound.protection.outlook.com [40.107.105.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C11481F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 04:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719896158; cv=fail; b=hZjFjizuvLl80NHjtQuJgRmRYgMhm0gxc49NAN9x7Rss8L4xD+Ijt+Ep3wa6H3t+QQwkRDO3XhM/S28SpqSFly7yfpznUwNv/rGdb3ISQOnd8rBGxygZSTw6ul6dEucimA8godTULvtwEuhDv/TVAWtS3ISWIlUCy9hIbP1zphE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719896158; c=relaxed/simple;
	bh=DTfG6WTgxw/w6V8p1qMAEvc5f0zeY7LTUWf8csdYNZQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D2XOyx/FRvrWbMqp5y9U4oP2RKWUCJIWveWGDr1biUykqtX+ASN42HDilXQ0Zoj1K00vb9f73T4haIzBWqDaYT+pFHoYWFzlrXy4YMjmTQtAcfQm6ZjEFpIy8+XxyVTopfZZeHB2F/6OLF/18TPZrECOThRcGP2M3JIszJLLDGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=SYprESsx; arc=fail smtp.client-ip=40.107.105.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OexLn9GMPMZeyqu9BXAii+anrKhzLbuvH606wxC3qbcp+vcSeJCbAyqaudzCMevu6OsVHEiKD0pGDZb0A0/p8/dYHjM8aEuAOagHFKJuvyVnTy8poGAk2flV4WjmXHSHqpnwfl9ChUEBYcGQ84YKpXPDw7zpT1Hh+2Jw6Qys1wPRwi+Xis7B7DjMEpbXFPHby8nhfLdbGs5Nb6s4fBJIkK+Z471+JLo5nBBupBcVRa03rciOfH4jKLxqJLWROjc7uVsXOlcl7s10haqReyuK+LW4Orq3syzjl0a4EV3NqtCLe5TzY4p2ufq/aC424rEIf+by0fpLNaEhMZZ+/Y0HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ5CT9V3d4yV6JqqcyvmIOsUW+12du86sodkuOmef5U=;
 b=PTlpOqObRnV8Vs0BRGTfIzikj7RQkNs1PY5wZ7fhZh4d22ptA7Kt1Mh7VnTKcwpNybPgxNqMnr3f7aEguhCG8zdXnG1dNdLMzMhtY6mULlRhPDnJjRusfzCl6cqf74G5nVcnV6hq1Qioi52mTSdRzzomqAJrN1aoG0y/sMZFntRMiZKVkseE7ALUssyanhLU45pjzUKeI7sPSWyglUcQGv8cD2zmrMmgy+OLNZgYbIJzT6DjvwMmBIVstw6gXAwO6fAr49qyDGt+L3bxfjuN4WnnxxTEDQr4lEpekuEzVfc0jZCdVINnEQvMWT0FCILaYKNJQDeykV18tHbSlY6dTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ5CT9V3d4yV6JqqcyvmIOsUW+12du86sodkuOmef5U=;
 b=SYprESsx8SSRzhJ5hQknnXFSa2f7pDNCBj+IA8/+Ol3okL3HtvuL9Z7MIyLR0sG0wIgebnJZ1hkhv7rQK9B9yHdbgO6zhrIyRtC/cN3qr9eCD95GmDEYFKHWftumKOzRxqQ6R38Q3r1H/YFT6UTWI/dGMnupUvj9tpeF7U4f9HNi52e9eZQwqUI7bDEpKg8VmhlgEXkAJQ5WnvYtnjURYgCQAIktResjwD1kLfwn+TWMd0npKlWGjZBvGFavCwXx0nXjXciEKtNYiHbiVIdlACPVPkYS86vEUX/EctUu164Dgv7mI0asLROXD0ICBb+nhUsiER6iE0I9Q1EWBp/9hA==
Received: from AS4P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::13)
 by PRAPR10MB5155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:27b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 04:55:51 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::78) by AS4P189CA0009.outlook.office365.com
 (2603:10a6:20b:5d7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23 via Frontend
 Transport; Tue, 2 Jul 2024 04:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.1 via Frontend Transport; Tue, 2 Jul 2024 04:55:51 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 2 Jul
 2024 06:55:50 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 06:55:50 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
Date: Tue, 2 Jul 2024 06:55:35 +0200
Message-ID: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|PRAPR10MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: e34c7713-bc73-40c0-142d-08dc9a533f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3w4prar7WM4Ai5h/md3ZLU7biUGThxfqezAMU+IzwvZ5AGALNgFTkz1U+c1j?=
 =?us-ascii?Q?hX7f1eQduqURJMWgpOnjiY8QNAlrt4QLz4VjArBG/yBl1b4kmGUUnMj92Zlq?=
 =?us-ascii?Q?pgB1637QqavA8Piv4zYiRC07YG991UQFBLZTl2gZikv0qBNYB1w0O4+tTi/l?=
 =?us-ascii?Q?K3TMRRmcNcNMjuDCSTOY595L+e3JfJbfDMI+oMPIExFOr8xQMp8mO+tfWfB+?=
 =?us-ascii?Q?uiluRZX+2xSLAfFwpNHc1Wrxj7kVRWciZSicOs/5DQl7E3Aw1z+cmZLIPLI7?=
 =?us-ascii?Q?EbVpbUCqNfesC0foSszgXvpi6obhcLHEXR71vvRfo8sL78zLFmz5gZAUYaMs?=
 =?us-ascii?Q?8ERithMRH8FqoGSsbpPVo3roLxdD4I8lwJmkyfM6xVzj4DBw8Wx/RwIKk0yo?=
 =?us-ascii?Q?Ce9en1rpJHrHOpsi9MBceMdeOnubN76HmCwhwiE2IqjIX87eFqcPOINKrtGh?=
 =?us-ascii?Q?8b53WbBO9CG/iBpW+lSFjiqr2hamRhCrnXLm4f4fIrVpDcWOSSx+j5oo4IsI?=
 =?us-ascii?Q?pemXNUsDnpMhAH4eCTLXrJqhxQIL18nws6wtLZx24aRazaVjBCw2oTKVQl62?=
 =?us-ascii?Q?NHo1ey1LxeSSH2wC8zjdlOIqX8npNLIRmhtrFdd71YC7P12wMw/IC/s4+zzw?=
 =?us-ascii?Q?zxvqbDvRU4jMqkQVL/a1YwRQ1irwUL/rooz4CkeYI1ZsyLxHKdmJ/N6oI95Z?=
 =?us-ascii?Q?9HfiQc8daU+EswcTLyqCGA+xLQiVU/P57X65jlfJWpC2uVnEZ7ZmzpWMbKPb?=
 =?us-ascii?Q?AvZIWiZyfOednYShH90Mo/vXiHcKrbRcTPTpNJbWK4aUaNReKFRtv/dhOk8G?=
 =?us-ascii?Q?x7R9YKkmMRfy7dW+3CboiKbLRV5mvMbn7mumJBb8MkaTzc1IXFuWwXocOaL6?=
 =?us-ascii?Q?aq4ziKmryaa5SkWOWHXHIHWorSH3b8W0aGgNczqeiDigapDAjI9a/Qa1NNBB?=
 =?us-ascii?Q?BImrvxEJQIxwLHv/91ZF35uV3V3wHwL6vFMDmrKMyrJnXZcrSOcuVEdOhPR/?=
 =?us-ascii?Q?j6fT0cQI5kf7T9qwmBd3kAhmizcRjUVA0BB8UrMgM513Q6Vnev69tSE1C9r5?=
 =?us-ascii?Q?+0rB6lN8J7ECyIbdmUMqZ2SsQh+xWf3g1InR+H8MUaleygti9mPSC3jsnzz+?=
 =?us-ascii?Q?597rEOIRlKxnL3Pu5KrgOws7ecS7gCa6t80Ao6ieOhKsT8g9LeTx/kYGFOwQ?=
 =?us-ascii?Q?r/JNPPguBzK5TTlRMopXplBD1UzEb0Ct952nOYUvREQjJS0IgVzHC6XSCqAF?=
 =?us-ascii?Q?5Gib5Y0B184MS33fMwuPONllCFv30ShV3ZX7vx+YoZ0sjtUhFoAC+2VelKNS?=
 =?us-ascii?Q?XvjX/ZuaEkOK8dgPBWQSlgmQQblJQFcfB9jQ19aFmnVRNAyyjKFWW1RDLAEY?=
 =?us-ascii?Q?X10EGa39Ky2Mkx+IcuC7JNR1w1KqIckp9DUvVkUp2iDaudvSyVEOjR0Y5l56?=
 =?us-ascii?Q?BPnkiVhAML+QlxRGA43Fu53LqOEtRtmx?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 04:55:51.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e34c7713-bc73-40c0-142d-08dc9a533f29
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5155

We are getting crash reports where irqhandler crashes because it
uses priv->msg being NULL. This can happen if an interrupt is issued
before rcar_i2c_master_xfer() has initialized priv->msg.

The rcar_i2c_probe() function assumes that the I2C hardware is
uninitialized and connects the interrupt handler via devm_request_irq().
From this point in time irqhandler can be called. Normally, this is
just prevented by the I2C hardware being in reset state.

However, there might be cases where rcar_i2c_probe() is called, but
the I2C hardware is *not* in reset state. E.g. if just the Linux
operating system was re-started by a supervisor. But the hardware didn't
get a reset. For cases like this make sure that the I2C hardware
interrupts are cleared properly before devm_request_irq() is called.

This is inspired by rcar_i2c_init().

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 ++++++
 1 file changed, 6 insertions(+)

Notes: This is untested. Does this make sense and is acceptable?

       This might be testable by shutting down Linux to e.g.
       suspend to RAM. And then, instead of resume, re-start
       (cold start) the kernel. So that probe() is called and
       uses a non-reset I2C peripheral.

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 828aa2ea0fe4..5f46955167c4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1183,6 +1183,12 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto out_pm_put;
+
+	/* reset master mode */
+	rcar_i2c_write(priv, ICMIER, 0);
+	rcar_i2c_write(priv, ICMCR, MDBS);
+	rcar_i2c_write(priv, ICMSR, 0);
+
 	priv->irq = ret;
 	ret = devm_request_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
 	if (ret < 0) {
-- 
2.28.0


