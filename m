Return-Path: <linux-renesas-soc+bounces-28284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFZgHrSWlGn4FgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0614E2A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC555300B8D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5E336F407;
	Tue, 17 Feb 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EmFvnr89"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D536EAAD;
	Tue, 17 Feb 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345503; cv=fail; b=Wvdo4TQy9reVoMaDbsChJGcetp0wFa9uWCzcwhdQSoxw4PGKkY6aCiOsgkU7IDz3M6GA3KbNY57i8ErI45BdQJHaS4JOwZjavwJMRvuU4xvi+x0JmktJkRlgn/WDms8a1ih9CwIn/JJua02X7XGKa9BLV0JraIlhtsWgkVyb/a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345503; c=relaxed/simple;
	bh=BqsR2poG8jslNklL/uFGCQ4YXkpfcrdWC8tCbVTr1Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zz2TRlW2iSPckVq89VcMiJswZ3/geGH7xC/bAqfViGYF0bJSqQm10k3VkEwZlCfLUQeERCyclj7fKTq6WNL1tNNp/QZ7kq0hM24V4oEsMG0E3Nsg7ZNBpgoeYxMGHFQ4j5VqBCZkDBZ0WZgqvHtKSfeBQClvGM1OLmYoudvcq3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EmFvnr89; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFY3lL/LOO/NAi/NE0e0jeAGmrimlKrmAvnYShpPTQCHhsomWMDdktgPb+2+gp2GnnWxtnpnCw5c4c3ZXqGJ+sAeaWEIuZLV4bx+pQWrIezTlr+dBJ+qsWHMsYqgZGKq7p7rZgSBwJITKr2ANTyx5wGzlNjvwyVHUz9SK8MoSMq2PQoGGVOTxZIP/L4+s11Lp9CXcIhNrmotLQ+fiAWvYki/1t1wVn6lL8mMCuqUWyGA6RDiZrihS/R888mIRaUfxB09m2oh+NIH1PNsx3KVO9tTjKz8JGxnjfasCGrk79v7eRTBEomTe4RwBRkl2k3e9qAUSrDRdB8BS5BKAYBv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJFusbSkGW15SEti4qpvHw+Hq8sZBQ4C20SJOA+zLcI=;
 b=e+AnbVh9UTy2kP7wmPrrYtgLoWj066Wn7EoQvnOsx8r40UUE3tOEH8T+UisPJg+dpcysAP/47X3MU1hfo667YtgjK0w/lUDZHySVn+MjkXkeoqu5AS8qGQjJ6ZKbWXPhglB7T9pjmM8WvQeNFiqxjqzoaNK18yaQNiTSkvs79V3GIb/KcRCn+1E0Ad4Eb8FFXSRCo1Fh08E9Dl9Pw2PlrqOqUnw+4rSljNiWsGH+yQGENmIxSvIhMNB09QolYM8J5pzgPkC6L2iybsotPyDZiuex4yZKkZsd+so3nlp2OoTIrD/bgBl1LFCr4Sb/ZGv/nTZz67iXFKuWhlTEDRnRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJFusbSkGW15SEti4qpvHw+Hq8sZBQ4C20SJOA+zLcI=;
 b=EmFvnr89FhqmS4EznrmQPhaRhBYFrFFxaC1duHqIcX9uqTaDJufp2HyxU7LiBSCpjg97jFLoyaKo67hfS1CC5DHK+piDYvus6o/DswyFVDt5HNBc0z64BTLmkcViDypQ+ynjYOeMyvYRP9lxCWC1d6befoI/VVJe2QAWZ94gLbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:24:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:24:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g047: Add RSPI nodes
Date: Tue, 17 Feb 2026 17:23:48 +0100
Message-ID: <c8df5202caf4e36ee5beafe78ad0940643edcbb6.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3a3674-b47a-42b7-82f4-08de6e411829
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W6sLUdfmjx/ncaz04L0whvC87//oP9vRoWDCGrBVjdU9VoBPlUdEbbLLKtFa?=
 =?us-ascii?Q?VsZ8Dh/hkzg+hI/b+NXCMxkbAD4Tnmjru+ox8q+m92FcLVmIoIxiVuKjqIDW?=
 =?us-ascii?Q?icvlhPj4n0F2R6lEJrqkHHJP74RFXQ3ORFmyFqmfGpVlsaYnDIr4sRcsncvd?=
 =?us-ascii?Q?p5O79UUULaTABrmg8AhViJw+7ul8grfoMULKO6zFXgiClO2ArUKVCfkpeLZA?=
 =?us-ascii?Q?ueJNuHuGuC5L/eADIx1uYmv1SVjG+1sqSQrfznRG33q+jxUw87rg1RbafNCG?=
 =?us-ascii?Q?O/O4kh/0rS/2/RpWZ+1I+vXhwM9S2+0zBhYod3waEx9VZnLTtuMLTy+E98ot?=
 =?us-ascii?Q?F9wFC16BLwMl5CDpIp9pfU1WWfhMbwZSfCOFkc8Y+FNwWul/s8kSW39aRekB?=
 =?us-ascii?Q?cQ+bweqhzHmSg/6KEmlYOG8w4G0Vaa0C7oPTqDslik+NMQ8Py70zFPG43CMV?=
 =?us-ascii?Q?UmW+mrYiWzO8x9UR441aKQjA5a2Sz/w7mi1/knVgxF7X0HMvj2vj0bfRb3tA?=
 =?us-ascii?Q?7/KUX4QO37/SKLaBvHvsrWECbcerTXYAgKKkMFXXzLJu2k08jaZVLc+PDyC8?=
 =?us-ascii?Q?v1OolF7HUT4xYk3RACJeBqp793juxxrtQlLEbqIap3YlR5wOSJokslV85NYJ?=
 =?us-ascii?Q?WYRzB9/Ahxt95ICefkU3AU3HXD+FwmYKK3QbJc0InRhWYM1C/ZFFOCQGrJmF?=
 =?us-ascii?Q?phtmAmDznrVZaTsQHuK3Ry7ghdQiTOT33MgoVl9dcM6ZzjhQAor6yNmfKvxI?=
 =?us-ascii?Q?+Z9kLG6SBSHnykcPPlhliqx1bdIINEc52CDtS8cjv2covLCLLsQxQTYqGueP?=
 =?us-ascii?Q?NB05zRsKQIo9gpYlJAzKl2xiezzTbmz/hLNiH+89eC0W5wJrxKSUZOC6ynKc?=
 =?us-ascii?Q?h+/DQ0koOqnJwrhRst3ykQ3A6V2Ef+ipPfI/P8pAIMimA3fVqF9GJ3iwzQIy?=
 =?us-ascii?Q?ikVDidJj09Wfa7xvlrWDHxE30JFQW6Is9TOwL70u6A+lcXjn2DSFbo83d1d8?=
 =?us-ascii?Q?oItL1+li1scqbeIjIpaPqfnaeg1+D3zDC+V8C9DNbZ10xlkrGKbnM9y0Od0Y?=
 =?us-ascii?Q?cUE6QExHqRFb7coFZInfyOIHqa8l/7A2Ip3JfWGomgjOzeZ9VUcPOaSFtFww?=
 =?us-ascii?Q?hXijEpFhUORnywMQy0xhYzdVvt6kK9UD1ZR9ZwXq5DS6a0A6pX3H4V626dYS?=
 =?us-ascii?Q?ReGUo8qj5OEqhDBHfTGI7rSwr+kYISO+k8jG7nCq2bl9eSU08fAD+rQ2v3AC?=
 =?us-ascii?Q?T4AegA8zCdZpUqjzXUdNnY5XQNNGeEGzRCqkQVDnodEOgvmds9xBMP2jdtDD?=
 =?us-ascii?Q?GPig8WmozRo5f4Yg+gqngH/xivHPCCECxsWzDHCpGuXVEyGlbSAQhKNfwcf4?=
 =?us-ascii?Q?vAxPWlwExhbtON4BIq6iKmTOMA4ZEsftDDyuaYuSmzUGv+wQfpHZN+/hI6V6?=
 =?us-ascii?Q?WoaPNQJCAhO/lMSHKwtilBorVjVCJhIl6URcoPkJQgC5jXd+6vQqA8PVBhEa?=
 =?us-ascii?Q?Mu5oX+sGVXKed7tIh+SbmneQ8DDC48KKI2Fw29QYHMt7i+4qdRaKE2kjBVj4?=
 =?us-ascii?Q?uJgPi3HCDXbHKafoS/FTa4fSibl2PUl9flflz36kNFubLo1mCwhIiIdf9n4J?=
 =?us-ascii?Q?gYG5Lk5zCP+BiPCnEJOLN0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d05uRLNeLDVdJuxZNTvCnXX3um9SrLUDlAvEF9QKPpG7KDq6Km/Q3z6agTkb?=
 =?us-ascii?Q?5qhXrXyCuY6DSTxmJyHqmgD6PpSooc4HZpboGtCtR83YdxRHIix6QyYhzKZl?=
 =?us-ascii?Q?RTO+GjnmayF0HRIuPg7Itg/fxBNWGcD9EDG++7MfM/1NMWgYwTKA7IYeyuw3?=
 =?us-ascii?Q?HT/5vDZHzyJHLJ+Tfm7u57On0ahvGhiyVcrONMBi/myDweL0VrWvRvdkWDO6?=
 =?us-ascii?Q?fp7iZ+yJvTd3r7Kan/36ICNK1RzvqWzeQkZY0LPNeYwqLaGZHkCSqo4W6znv?=
 =?us-ascii?Q?mjxFOiyThZFtm+mgoclyS2NqfhzZZP7uSZujD98iFqY5R9cOzvArC5zhS9Ka?=
 =?us-ascii?Q?kZNHbEAMinDHu4xyQJ8P7evHh4LpZN6NwfOF0smie08UL22mvGPPQQ4aGEeq?=
 =?us-ascii?Q?R9dlSpMiHDbMFlmLNOuHAGVsQlHL6JKvJ0FKwp/8ru3rM/yOs+5Dkg6jcSpA?=
 =?us-ascii?Q?yGioj7Z4oUJiAfAHn49fmCzWau7nN9j1n+fHQUUEG9JW/W6I4o2t3HEY9xbG?=
 =?us-ascii?Q?Xet+LIstn7SlsfDmzHuNiVie94+2uh0oxNG8dj2eaLBqgaZ8UEk1Av5wS/LD?=
 =?us-ascii?Q?pVjsr8XNJQags1Zir11pNO68aUe1sH+IZ44Fr7SfvaKdCEPvTgI/S4dq2S05?=
 =?us-ascii?Q?wjrG7s+A37MVsZTX+A3svV28OJkCICvKs/8js5YL2+HNZTvDECrqoRT/Pl1s?=
 =?us-ascii?Q?FPwvcEN1CwGtlKIdvq84aXg7g+A63rMGsONqZo2AdeC2Bp+JVW+QKDBw8iCo?=
 =?us-ascii?Q?YIKm1gk6V+E5GS4HDuaDdYi5s6/7+HEP6OgOeMbV2Z7VTpxaZuXsaRdCd02U?=
 =?us-ascii?Q?4ejUDURfnstDX/huV/fYFM34VpLM9ayfAWFagMZDmjAV7aVgxh9Sg348CiBd?=
 =?us-ascii?Q?9r50AUAa4qxGl11QUhhnAQnMGFbelfAYykohT55fER3CazpVHdtHPNOiTet/?=
 =?us-ascii?Q?FrIyUgWuq777N8pYBOJEDPFJEjjoDeurgQk2SaGsWiqrKfkvWErTvgWMQNGP?=
 =?us-ascii?Q?X+PxKQsK4EzojQJJo/3HR1jcvOJ3fkRvm4KBPvbM39v9vG6elPoYxo6K2Vjg?=
 =?us-ascii?Q?/y3vEfq2r0iMDg1+adAelPtQwxQLMBcKnNRFm8dp9oLpM08aw5/ySgYG5K5e?=
 =?us-ascii?Q?PCOn4oJ4W15enIC5LEtAoroGtk/SBehja110uyfzyWvj87b0s/mOWjiT/HaI?=
 =?us-ascii?Q?NkJv7HNgRvyfcHd149VNnXqd3pix2W55ijTHdlH69PvvgxmV9C5Vw7bwTJLv?=
 =?us-ascii?Q?SeIV+g3K217G0loDo9DtGLucHBeAcaqcfCyizkWl2Gl76rnAhO9/jJn0F3Um?=
 =?us-ascii?Q?n6UU6SnhwJllKvoCZUMzJUJDbiZIdp3GyymhzHUjIf8nYA4QE8qjc+35DQ1i?=
 =?us-ascii?Q?mN6DHw36icmTrGhTU7BbpTqJKHJm23/dsHrySH5iNloiEnsfv0OdNl0JreTi?=
 =?us-ascii?Q?ZC1N3SwBMshhfgM4g0T7T9GaKiChSmLpfZaPWs2iywf1bnnhhIGBNZDX2uIZ?=
 =?us-ascii?Q?d+Jrtiqxil8dBkDxA13FTXowexYE1W0XS3s+SBoXP1UHqsgEJJrXNcZ3WMxx?=
 =?us-ascii?Q?1sg6OLFukyB5YN9Rnf1UY9LkeHcXwa/Qqgg/JWbgeQnHm2gygW1u+drTvVCA?=
 =?us-ascii?Q?Jf7IIYCB2RWuu/z/1s/f1GJb4zekuYp24qI22JvMUJyMhBRvfOBDFN325/9y?=
 =?us-ascii?Q?jCTdgBRIeZG6X4JcdDJ5sl7mDfdJrBHj4U3+3XDzXA71cNVuKUe6FgM2vpoE?=
 =?us-ascii?Q?SeANWya2fFgHKb7CEyqH9xcNMLmByy3ILF3rp0tuQbXxxTgpj/AZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a3674-b47a-42b7-82f4-08de6e411829
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:24:59.3608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hH4f2E03PinITcZdyL6AuQqvkkMFHdkZfe9gjxZ7tpeYvPIoU3wO3EaIn0l9P2uIsGL6e1wG2RM0JCYZeXW82TPOn/Ixe89MzyjT0WwJs5+MYUQ6Qx3oUc3E2GlZE01w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-28284-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_PROHIBIT(0.00)[0.195.80.0:email,0.195.83.32:email,0.195.81.144:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,12800c00:email]
X-Rspamd-Queue-Id: 7AA0614E2A8
X-Rspamd-Action: no action

Add nodes for the RSPI IPs found in the Renesas RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..94d23cc013f7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -591,6 +591,90 @@ channel5 {
 			};
 		};
 
+		rspi0: spi@12800000 {
+			compatible = "renesas,r9a09g047-rspi", "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800000 0x0 0x400>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x54>,
+				 <&cpg CPG_MOD 0x55>,
+				 <&cpg CPG_MOD 0x56>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7b>, <&cpg 0x7c>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448c>, <&dmac0 0x448d>,
+			       <&dmac1 0x448c>, <&dmac1 0x448d>,
+			       <&dmac2 0x448c>, <&dmac2 0x448d>,
+			       <&dmac3 0x448c>, <&dmac3 0x448d>,
+			       <&dmac4 0x448c>, <&dmac4 0x448d>;
+			dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+				    "rx", "tx", "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@12800400 {
+			compatible = "renesas,r9a09g047-rspi", "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800400 0x0 0x400>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 502 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 503 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x57>,
+				 <&cpg CPG_MOD 0x58>,
+				 <&cpg CPG_MOD 0x59>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7d>, <&cpg 0x7e>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x448e>, <&dmac0 0x448f>,
+			       <&dmac1 0x448e>, <&dmac1 0x448f>,
+			       <&dmac2 0x448e>, <&dmac2 0x448f>,
+			       <&dmac3 0x448e>, <&dmac3 0x448f>,
+			       <&dmac4 0x448e>, <&dmac4 0x448f>;
+			dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+				    "rx", "tx", "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@12800800 {
+			compatible = "renesas,r9a09g047-rspi", "renesas,r9a09g057-rspi";
+			reg = <0x0 0x12800800 0x0 0x400>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 504 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 505 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD 0x5a>,
+				 <&cpg CPG_MOD 0x5b>,
+				 <&cpg CPG_MOD 0x5c>;
+			clock-names = "pclk", "pclk_sfr", "tclk";
+			resets = <&cpg 0x7f>, <&cpg 0x80>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac0 0x4490>, <&dmac0 0x4491>,
+			       <&dmac1 0x4490>, <&dmac1 0x4491>,
+			       <&dmac2 0x4490>, <&dmac2 0x4491>,
+			       <&dmac3 0x4490>, <&dmac3 0x4491>,
+			       <&dmac4 0x4490>, <&dmac4 0x4491>;
+			dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
+				    "rx", "tx", "rx", "tx";
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		rsci0: serial@12800c00 {
 			compatible = "renesas,r9a09g047-rsci";
 			reg = <0 0x12800c00 0 0x400>;
-- 
2.43.0


