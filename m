Return-Path: <linux-renesas-soc+bounces-32487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG1HN/0xA2oA1gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:58:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C919521D21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 351E631E37B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 13:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFBA399887;
	Tue, 12 May 2026 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kc9GWlyj";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="kc9GWlyj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020135.outbound.protection.outlook.com [52.101.84.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785CD37DACA;
	Tue, 12 May 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.135
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590839; cv=fail; b=JLYX7Ymu8YT0R6yEW2lNz2cFtvgTbLcLnVdP2LKMYxZEpLzbA4jQ9QG0x0vhkBTk8PRFusxy936nVeg+/5zj8QCVc6eB2CKCe8CScCBfg1tiYjHVUdEkYtwu3ZG5gFMloObHTpA32MktqCUrxhzV/XsMYI2VZYw714GOoGzmZOs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590839; c=relaxed/simple;
	bh=4SOW6qWeM/WRXsqDxhS/H07B7R9tJGhB6sQ+X5Fe/6w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h1zwplJdysXkQXxVSMIjT3+RMwIl+6m+hQ5Z80ev7sY45OVxS8NNNfFkJ5m7EsqDBcIEt7VJoNYS9ocd+zuZYwozsI7xSYiyVDr9HWSeACqJomjzP0Tf1fVREMHISJoUCEUEnLYJV5OtpOXNZY+yAYmMAkzDhPZtFMD/nz4dSN4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kc9GWlyj; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=kc9GWlyj; arc=fail smtp.client-ip=52.101.84.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AY1OcD2wTAc2l267vvuDKdMQrmsBcqAqVT7jQkaH65olvL3BOuJu1tWb7osNSHD5mikTiJ/EpOPUMVK/EjHSbr0uVIcOkKlkd7c6RvZNlVI3S+1065IrCl2VXf8+X3oY/Vnv0DGiAaFXH+aIeLOJInuXDIAlcLS2wGGeebeoBRHEw2C63dzYRdFHmI2rpdOq+7cUzJJ9hZe8Xh+pFOf8zk8u6Ed0yie7uea7pNBhw7HkZFbAG5bC5I1oG36CtdwDV7dhqFwC1o7fyPlmHU1HOAzeshrZVSpcUxuIkEhevY6M8qa9klQA+AOMiHpzxXkbvWV6cb2x4vCZjwgRrFjLzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2FCUR1FpHgxsicULCtjjEMsoc1p4F5WxsDCX/uLR/k=;
 b=OFKkoab2NbU7yUQ5V6rtu6LIvTJ82/Msz8wpXVpbF2N3QGW8z0enSdRryOFyEaTrsjiJZbj2Uf/Jcq4Vly80M+CVxOz1vcU6Ls4KPw5FZoVwHiI8xMr7o6KUbxZXgnvVAm2M7TtcshMI7ni8SKSul7dPpRvg8qomVCWUy3QoVmgB8mkreqOjsm3wkMISLjz4aui2uzgMBzXIztXV95KHVNNlUkJsRf15c4noIG74J83GpBKcU5ezLoKcDR0QRYGLJ51Ec8/IHts2lDJV1a+eOymJAlr8XpE/KPluDul8w7+U77z8WUashrhjvPt5OosBKgKpodbZWSItZ3Tc4z3G8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2FCUR1FpHgxsicULCtjjEMsoc1p4F5WxsDCX/uLR/k=;
 b=kc9GWlyjoRUuo2d7SxVbSE1Ws4lIU9d266qz6dJ3l1LdKBDtRZ2hYW0H7xnWRvHYYUJYI3H3QPW4m+uW+KRz5BGw6VxZuPRRoO4zVf2DnQs4bZ5zObcirBxGsIrG79GyBhq6TsrsFgBJ4lfQ5vsrji68rpTUCNZ929ANNtzfWsgKKS4GmJOMeYVESd8UQUxxby39xpF3p76r7M/bC7xbg/WAidOcQ2fxCQrvQWJlRweeJfbpgPA+WcoB238bJIzBA3ySxksYwKDbgqBboZu2n/t01gUt70GvdSYHFQlXqxlki3ORYgH3i1Lb3vSKr/3wTj50e/rsLQ/DvKF3WvFhmA==
Received: from DU2PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:10:28e::13)
 by DBBPR04MB8009.eurprd04.prod.outlook.com (2603:10a6:10:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:34 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::4d) by DU2PR04CA0248.outlook.office365.com
 (2603:10a6:10:28e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 13:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:00:34 +0000
Received: from emails-2807192-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id AAE7E8048D;
	Tue, 12 May 2026 13:00:34 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:00:20 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h23mnZcjrglK3LLLfxntM+1Bq395eMKpptHQAL99x3/1I8ePbX674nA8d/OvyMA5D9gtZ//xE7RM2jT3qXCVHOeiR9/h1hgm3HzM1LCNrJh1HM3Yehwbsng1BqwxD1z/mlNQvhI11hJK/LLCBpjCEsD+VqXe0FtvcdAzVaZY2Or/xVjpxCiQrJYt3m2dmXRULOg6laj0WQFnyJFrc+86mc86ngIWNjOJDFVyqxcGYw6f/H+jeUae0jjQkK8YJ92KB42zfj5+uwB4BIUStp4F3TF3oLO8E/9iJeCttX/4n4MYz77y1eX+XqKsiHODU1BofFTDdq2GChOmQbvBEo4hUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2FCUR1FpHgxsicULCtjjEMsoc1p4F5WxsDCX/uLR/k=;
 b=lj+aUAXQm+ZHdc3ApuwVGuOKYNH3Ppi6aa+6X6MixOQmtmyP6/PXIoZjI3gntQkc1kVxpIN/O1ct1IlbBV81e9HTDKo1xNSARK3MQ49db2lHoXi6sJeswVM3Ox+JjAl853UVx+sp6vM+/b8Ornkcv3Bq99XR+4cYyvaFvvhxPxZEmwCkeFjVMa/z1N+yEtO19uvSYOE2uPaeUKldi35XUVO5NyWxIw+S7Os+MDzzFC0p1WG3Mw6xUMkbYOEzjI3OoHBunJ3YKyMIQd30fLJnozsqTuUaJn6KbTmsmEk+XlGe1TpfWOZYcqglxPBGBC009y60clHLi4xsw43CvegYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2FCUR1FpHgxsicULCtjjEMsoc1p4F5WxsDCX/uLR/k=;
 b=kc9GWlyjoRUuo2d7SxVbSE1Ws4lIU9d266qz6dJ3l1LdKBDtRZ2hYW0H7xnWRvHYYUJYI3H3QPW4m+uW+KRz5BGw6VxZuPRRoO4zVf2DnQs4bZ5zObcirBxGsIrG79GyBhq6TsrsFgBJ4lfQ5vsrji68rpTUCNZ929ANNtzfWsgKKS4GmJOMeYVESd8UQUxxby39xpF3p76r7M/bC7xbg/WAidOcQ2fxCQrvQWJlRweeJfbpgPA+WcoB238bJIzBA3ySxksYwKDbgqBboZu2n/t01gUt70GvdSYHFQlXqxlki3ORYgH3i1Lb3vSKr/3wTj50e/rsLQ/DvKF3WvFhmA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:13 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:00:12 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 15:00:08 +0200
Subject: [PATCH v3 4/4] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-rzg2-sr-boards-v3-4-f033fc96c906@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
In-Reply-To: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA4PR04MB7934:EE_|DB5PEPF00014B8E:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d5536578-1aff-4ffa-b12a-08deb02674c9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 0DqvtalHlC3HEx6ALgZi0NG2mqRLRusa4WqS212ybjdFxXAoobi2fHH4YyNF+TrlDoXvNbPVlxQY4UXAeaMU5Vlcg+gJhvYq84adq1LsZu+lJc66JaoYfnOe+A1u//8aLIz4AIMq5IGvJG5A4yxqdJoigLwCdona0Cuv9gsPxN0ZDq2q0dplA9zYQzXJcQpImR4kFdtdQ7HrcxMbIXAuvo5rIo9ArWAaqEAiDRcQlO0D/iioOMBKi2gKAgFs+UznZnFndnbJbG+LFWVW3C6cxWDT9l4kk2xBsngUwCbzTv1BP+Bh4HhTFJ1GoUWbfRFEohRr6iByq25O/f0sKNIsb4ZE8pzb/jggrtHBz9PG1M9PvstsnsMclXlMRI7prj2lC6YsHMlrDXDmj1hME9MUJ8ylL09FcXZmXlgSPAuSkhHBfNt+uNK5f9HWOYjVK+Lql8Wdf/OkjvPaI1dEJnD3ZG2fYb2X2fOmi/4zhiEkItDrHrARxv21LTe5skCciIWANaosoMhNuk95E7rqE62S0F8HxV3tx3uTTjUiQVoyYpWJqdlk5ZSU1Tr9dKPdWLZbrWjRImraoNvoWloW0dcFfdVuL3ovcXuzod4NP2vO+YXkFab33pCQ9MINzbbo2GN4CDf7FzxJsmuq1Oou5IjffpNFdMUgYMw+7s3h+VAmRknz4Ncxr2eWWp4/20SIBPo+I1Abto+u2xaoKioNz4zxFyboBT7dcPUXnxTLnLE0h0sh4fldi2gaw1sO44OzHtRj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 RShqRbCBzCOYlrH2jcCHuLf7DJLxrh4hzxETVBLp5JA2EtOqQXtJGVfmMY1CK9XBe4Snkd9HPPfrUy/WyVYPRcUDN90kQCCNQEZDu+pTnAgO2Kz/k6eg8HbmU7QRFNLcmggFRSGtNfEoCueZrYl/qiasrmGs+oUHhFSDH6bls9VtliPW+ZJ0wz8efUQBr3bBVeydXkxgPknDBgUXt1cgiKxUzcbXNPw8Hxbs3qUBBMUFG2oQRXupW8ZHkGqgbVn+mm2TyDKk1nG26c1Y5U2dGLWsBYefB45PSudopmUG4f5Eta4dlvBBTjB3t1Z9BbInrrEfhnj9s3iTF85pC9Xh3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4216c9af408c4db88cfaffd86b8d69b3:solidrun,office365_emails,sent,inline:7a8888ac466080aa94ee14b06e0b315c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76d0c098-da54-44e7-40ab-08deb0266754
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sQfQIGl9+INc6PVLRPooV5dSZLO7pdP7sJyR2JHQVFTUcT2ehk1iEgwUFvHyARU5wNZfGMWWOAFjRRRCQTY/KWZJ4CBPuiNb11ZFFARpwxZ6PDPsQjA5nl0U1cf9s/GmgVUqyDOSdd6mSF4CPB1Vm1dIFq19KlJ+8PBdFRZIBmx2TA6FBNTdKqdr+KVb6B947bUJflXN6VIJ1wbZLztxmWr/YNCBtAaQjSX41w1uCwZuSuWMK3W3gN34bTYVPwE6beUXCsbA2LutzJ8qA1sEVqnOcYTOTq//0tK7XdWNPgMMycLjFvNJoAsUHjqXDgJT2JKN3p/CI/MhLXBKqGiGXkj2euJRyY6GW/EkU/UQpqrsD34eCcaVlGphRWyQNAWhPTr2QVqMTXiZwvBhzWKIriLJ8tmm8bmlqolkyJ/HTKNptatYDCYkS4FsS1Q90lwtuTXBhNH/Zmtioea/7exDdO+GG91qg0t0h4F9OPNJZJQS73UJ4DZuwAtxQf6aXhy6uMZW4hxTI66+1TtXZqjWO0+O03gfjjXVh9JbXqcWYTre/BtFJ5gGR3cKwZvkDFKt7GzCRrISgg8C7g52hl36ykA1ViIL06zPIPEqVUyy3L/JQCo6miYPCiMWEXVef9Cgoa2ZuJw/txwuHexCESerbUsI0EI2sv748HN10SbHrboB1VXZumHdCVclHMzg/hBPPq8COPQ5zTBRLE2nfNyOZn9sTCPlIZQEcoCQqtXJjNQ=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qqISFYkAYgh8ObsdLnlsqbPNCBjo+o8rF4zdFlYcf8u53nHhjEJlaTCTbNgyG0JPffPB0UwT7USNdjovTC5cB59MQdOKj1nR4C65vkio2j83LBPNhD5FWNmCIOH01UVp2kqNfochSm/ymL3kAUEqsutuKSfdujOuFf4AdYP/OMBBrZX5CwNJZPX4TohJbAZYWtMKvMxyFPkZXqRVnRl3A6BfPoINjggZIt1UB3NHsIsWLKRt0Yoy3ToSaS3RW76g8Iw/3W4yaDzCH8IYCq6qOHjYvjomdHQ1V9B9H9jIkfsqoG8n7TyFFRnAkYhYkuo7ALC87P0oArov5O1zJ+6E1gheRFnWjFOZcQJ4PLGWF6u0JEFgEe9rXPTH2drqv9S76WwHixxnbYDfmHiuzI0globoALaPjC2xaODcX9vluxmkS+hrzwTJXPpUw0EZaitS
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:00:34.7371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5536578-1aff-4ffa-b12a-08deb02674c9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009
X-Rspamd-Queue-Id: 3C919521D21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32487-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim,0.0.0.50:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[solid-run.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[4.13.153.0:email,2.98.90.0:email,0.0.0.12:email,3.117.2.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 374 +++++++++++++++++++++
 3 files changed, 403 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index cff17cb8574a3..04a68d472064f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -164,6 +164,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..06d9d031cbe91
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpio = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 0000000000000..0505af6926a5e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * 0 = connector, 1 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x20000000>;
+		device_type = "memory";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <3300>;
+	};
+
+	sdhi0_uhs_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.51.0


