Return-Path: <linux-renesas-soc+bounces-27624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N17K8ORe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:58:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF62B28CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:58:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDA2330210F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D807345754;
	Thu, 29 Jan 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wWgbmUMk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F9345CBD;
	Thu, 29 Jan 2026 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705683; cv=fail; b=t7wFS8BzfKip9xxaK3Bu/bG5luiXq7SRzNtI1YQbZ1l/9ovmoYYCA41L2XVmcKzk44DR6Sp679kBLqMPIiUhERkbNTcTy6Nw+iweKUO4Nl6VzXZEO5WzQdg432CAvvk0dwLanPCXORtVqbc0Ioo+2AcYFjPZ9NDM0ZmHYIi+1NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705683; c=relaxed/simple;
	bh=1YroSZtZ9ij+bi/FQysZlJxEEMKjX6GrLVf26ujZpB8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nsnoHdr+nOrm9P47Eq518/cOfP4Bx9SbMlIgr93Xg8bIjKGyw9xEnJMBCRGp3d9ox/gB0l21k5ZQ4kW4KAwTo6pE4guf3Crq3QxCP2xLrYDLzCpIzwM6i87/Z3+UlHge6KPjq24uTjYTQhkGnN2v9DlLTjQpi2hGgKoQ/Fn/Sbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wWgbmUMk; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b94oSNdUxcx85AvNo5/cbRE0VXfNcl4zMToc1wJSxA3VyAvFAE/5QxAOt/sgZRtCAjSYvjkWxr4RWR2/Xz+W1yJA8KhRAa+MiEAmJQHF3LFDZvnzcGKjVEg2qTUJA3Ac1KCAIBMnV43B2Dwa2iDXh10qOJlsXic+AK2DVEPLQ9JEm52L2Mk8xxalbPNC8CVcf6O1oCNyiaMcNQYK2Vbr8wjCE/4vPAdLIaTXWnC0/gGvguUOACWMOtAwc46bw6wUwncs7Q/F2pUnmJNRtUWHDIP6YvZIYFqBs2OJ7XIN9rFHKRnHZxE4JOcHpjxN861//Hr+Br2GV//jrsCtuGz3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+Bn7lOdE2VqOsFw4NWACwg/1gAik/Iw7OoxrNGFAXY=;
 b=pd1mH83pP1nudJCtoamXfEe0Y0AUWMNNHoorneie2P7s9zEKVQt4VAQSlB0M5G3LX+C/GFS4GeI8CwbeAReIgHWYvizQ5Ox6J/hnh28VjzHxnSEnL3bYyjnLB5pZvOsRwSAuQKN7TY7cRboGsjLyqdXTsTLNtMS7raM1bgPxHEVrPBRWbJQgDTeZEvAdlvYuj1AyuhJhQb5lRKbdqGN2wMs3thqaaVbWxcQwtGCXDNvZHbN485erc0+oCztpbUz/nXsAOh563dC3Hy2kvEA7p4JXu0PpYFDwDXuUyd2dltKtFEPfC59QTA3yj+uwvmMMcTAMNb6pyZ9CvP+6rIfdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+Bn7lOdE2VqOsFw4NWACwg/1gAik/Iw7OoxrNGFAXY=;
 b=wWgbmUMkKbxkgIPomGjtCo2bCr223KvRHnThkqcrd+7mFECgEB+v9OrzvDmczlKwGDleWIydR/nhkl8erm5dZOYfvsHxJ373F9sR++piZovXy/YCua8gerI/w56kE1CN73EhIP2Upjz3RTR9naTc8ClRUPZb/v8byGjdDH/8gdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:54:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:54:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Thu, 29 Jan 2026 17:54:05 +0100
Message-ID: <20260129165412.557643-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddbbea9-e260-4fc8-9968-08de5f571711
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wbsVTuhM9ny0+lz3DAXO4zwPnPLRjYijKZTGunP6iwGZKkC3QBt+Bg51q/sg?=
 =?us-ascii?Q?Q8ayW2YMIPJzUa9wWdO3PNypYnv6CuEuT17bgYUtMP0m1gthybrWSTt4JJPs?=
 =?us-ascii?Q?6eT2dAs77xyAzpg/6LrF2OwNhUcWqQXgC3Gh964jkky0oFf1ZCYOLugZBGY6?=
 =?us-ascii?Q?lp5GstiGhQc23Yjn/q6o4iRXpplzgzO/eco8DWCA3vQuOSEpN8s+ijYp4CTC?=
 =?us-ascii?Q?H4jDHSDeN7GXKF5YmXaLNNMRrGpqjLdRh2uygo7dxI1ubw1JMaUPCLIKwBPo?=
 =?us-ascii?Q?wtEmd5fW7VyC4t27y/4nIcB4fljMfmOObU6J/l5hyyEWyih+rYCPvUjMEw5u?=
 =?us-ascii?Q?JfhdYi2N8uvFjk9ZgkiaSMG82dXVdvTUhrrvzTC0dm/wju9Zvc/GTv6tGXr/?=
 =?us-ascii?Q?zNpIJsJspFrgRcBaLtyWg1G/IKDQJ0Rkh3sedaVzAUrRkRFhuWWLWVuNOqks?=
 =?us-ascii?Q?Zc5C5CEQiMgm7fv+SviNuHngsY3sgwCiyATAmrTaW5y++0nZ43fB6buYMmuA?=
 =?us-ascii?Q?HTzJyKZK7XbXIDdt8RALf/eMxn7fhlO16N6pR3jtqttmhRT9/R7UBpjXaLf/?=
 =?us-ascii?Q?vclaK5jQ28mHonWaeW541gbQtIIiARoqX7nF8kN/BlqMC9AEX6lK1hzUlmN3?=
 =?us-ascii?Q?80E5gASBqrjOctxa0B1mMY2HUI2wMMhZ4/6vs20YDsD0TG3NPV1EjKcsDeza?=
 =?us-ascii?Q?r+QIgVr8xAffGBq31ccRBjviRe7i+JMT6beyPamu6gaBwsQxQ8gDGEbR6suQ?=
 =?us-ascii?Q?w+hh8gfnNWaFBKmVW0u+Ct/p0r0jERWI+KnyXyOTs4FamWK0zKvMXPikb5pH?=
 =?us-ascii?Q?Y8tqgIiIA9r7bAw/qbs7jBetgi8/J66ZbHhB0AEsj4iK61M9x/sxJLNOsKaf?=
 =?us-ascii?Q?vcmD+WNCkXZmoxo88Af1yWxHZZ4IdN9rcix3CKnOtlspFUzrrm7kZ+oca5TI?=
 =?us-ascii?Q?kR3xGgK4aLUsbiRD0wANkWDjfz1XnD4qnED9ArDi5pENnP3RJf/d8eeQZm6h?=
 =?us-ascii?Q?vGeYnO8o2tKIjeLYgarbbdRLGN3UbPNf2+6NpBmWm+vXK8W0Ll3CmU67p6ah?=
 =?us-ascii?Q?z3T6QWjyTzij8mrdA0zeW+u5OfU81djaEfofl24UlTbTMzoHgf1uumb6p3sT?=
 =?us-ascii?Q?NVq9F2SDZxg/nOEqncIXvp5yTthbufr93PiQD3NyOSZmvHHzl3+XNvqduyMT?=
 =?us-ascii?Q?KuZUXmT5S9zeg5ZFd8BiQJEEl9mD4ROaPKdbKMJsnCK0hpZDdta8T3krOfkY?=
 =?us-ascii?Q?b8j3gfRAacMRJgpxQ50/g2KU9PYQ07XcrqcPWjDPwaL8xzfNHtfIuNTvCNHn?=
 =?us-ascii?Q?4V8ULjej4PbUqDp2xlhxWsHvpwOTbP4z9DuoLOnN3mkwAGuxumeieUOeXKK4?=
 =?us-ascii?Q?x/zKOGTugGQB9GoSPG0IGXM7zopRkIqvvi6CJaVtDL2faGajuHDvyDvcy8Kh?=
 =?us-ascii?Q?7unQ4bd7JoNyLI2dHiiQkCPAa6d3GLCUpgwojAqB4r+CWj4QOANutvYQz+KC?=
 =?us-ascii?Q?eR9xxaIPvCsnnNvn1SDyEBjifwS5gn/6pQ2NdfPhd6Gxq+OSsLzrxJUTRmH2?=
 =?us-ascii?Q?zHgiNhDsocgI8mAIOciku/1zgOwA/U1np+m+7BlItR9ucpx5HI/1OmmxHp8l?=
 =?us-ascii?Q?u8suLr6Kw/++nlsBuxJefkQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pHQ2bfcyAukO094WqNCcpLJlKehpm7gYAwtgTXktDgewihQRj9V3Z4wGfWTb?=
 =?us-ascii?Q?L+gO8u6NNTR4eqv1Qxd12oCha8IbggzSVXA82VmJJVRVGceYpSojHSQ75TsI?=
 =?us-ascii?Q?bdblqmh/zPJxCK35WhG8egX3ttzxqJOktOXQwUTx5SEPXIcMz5nRVpYt+Nci?=
 =?us-ascii?Q?Gx9YJB7GYd2Xhk82tLNst9VFM1Cu1Jv3qmDY5PQ5PtPPcHPIlg6J5fSLP+9Y?=
 =?us-ascii?Q?o/Tt5+T4F/mH/aYdqj8rs7HzAihwJ3LPGaLUwzxxQz18MB7FlkFmZST8ONtn?=
 =?us-ascii?Q?xUSQxSj6FKs7e2Ey2Lcr0EzglJEvXNW4oLe//HKLwXH3U22ErQ4vyqoP6//K?=
 =?us-ascii?Q?9AxwviZk2XgtIgBhhS8h9xVj6mKooM1S/9fa/VkGU/MkaUAWwzJXetgn4pPV?=
 =?us-ascii?Q?e21bLv4qTleV6CY/CatSOV+OKAlzdBhnXZCT40xqV3D8xnpzRMM3mqe3P7nU?=
 =?us-ascii?Q?JXn9Hns+eL9XeFzPt9p9Mbx2c206omVW+sw8fsMNw4p3l7QBG6ZvgcrRUXy7?=
 =?us-ascii?Q?0S/9rAVbrq0mC6jIJ/WfNGqobgWbcCMJNC7jti3vx1wCBOWywUH4fojZgl5a?=
 =?us-ascii?Q?hxmRQs7kcjSBkNvuqVhdM/Lg7g7sO8y3GC3mbfV1okF+JpWL7gRFNWE2bAT2?=
 =?us-ascii?Q?WWX4MzDZtRIs9k48zoV7SL1HsoAKfFtGiM2AqVTugKG224zupujzuysHpPZj?=
 =?us-ascii?Q?HHJkmkYw7iGSvxM3PffEfvX0bUN5K+dJIluTnXVsopxUjAR69tf42WcTXS8v?=
 =?us-ascii?Q?++t3D3atE0ETd/N9Y602yU6gVoTKu28v9gsUaPNZouYogN7bjuQoBwGsRbgM?=
 =?us-ascii?Q?rVC4HmKZuHQilW0rjGNfm7MoTJ+tujjAjpRbuHCEhFV7kysXGQvxKwouKm8u?=
 =?us-ascii?Q?eHowRtSnTXaYQEOA/K5FOaLuZLgMQJ8hNMFRA4qSVUbATXRvC3gVkPUL7mAl?=
 =?us-ascii?Q?CNXySwgztVGHNvcE1x2yOyn93FTU67wyp8+MMVZms1UMDbXQ3iaNRve6lfMG?=
 =?us-ascii?Q?pIv+NiFnsLHyfjpVGKxclHF6W8xTWuhKKEJCJANhZ7BFpP77Mu1Fsty+OJMj?=
 =?us-ascii?Q?aJbEUDME1TP3Ri4Jc0/Iyu4nooLnYLL1UfD38OljEmZThSRQ2+Vt5c/dSALp?=
 =?us-ascii?Q?f1CR+8XUng8obGrzwLtAT8GgfHein7HQCJi84V8pfrl/fWG8LqZe+XV68Olu?=
 =?us-ascii?Q?Gz2LojiF3WRpm99osmKQ8toBFdI2ke4o1pDX2wPTgYo+zsw9D7Dnfx8+gDbm?=
 =?us-ascii?Q?s9+VhUxwp/SVKtjZKlCvAhNXHTIxb7dk4VtCnT/fFeIf/NzOZ8CoicoJmBfP?=
 =?us-ascii?Q?4p9xkr3UdI/ZhsraiZfkUmz0D+wmDYoKW1IrfUzMoWQTLY5oFV+7AnfNMABV?=
 =?us-ascii?Q?gTNpIso47H2UIcfWNNgaG+zQ8Aq9L9VXPk3Nw0VDDIgNIFqZx60iHqsTUbxd?=
 =?us-ascii?Q?I+TECLsXUAYWv7JwCRQ0yV07MPN7gzWxT+shWTJuskfSPqphmh4E3loWVKmk?=
 =?us-ascii?Q?ecLe7GTA9irADIQhkdjw/q5dEoQma7v1nMKp/DZtkI80s/qQo2h5FJnrGuk/?=
 =?us-ascii?Q?E/dp9FAXlKIpBb6DWmRuBLCSqo6z2JYYOnnjWqngZ/J43TM90kQukId+q4jI?=
 =?us-ascii?Q?3jnlHRWBHjVDJ2ZgB1Yfu5YjmlCe3U0DNWtEfy3CanpYmV35PmQzoHOKrN5s?=
 =?us-ascii?Q?SJFOgN1mRy9uyCFwM8BbsogxsMTU1YqMWu1FWORwj9foUTtkJf8L9I7tXPtB?=
 =?us-ascii?Q?mJt83bX1mbzO749s3EubgEs/bQSRxNxc129rTy5K8wKYZ5M70enq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddbbea9-e260-4fc8-9968-08de5f571711
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:54:38.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9FtQsJzDUqUP6jU1nw7Tc1dC772rE3O3lGLfvftQT189vL8C1BtKmxAriZARMiTJn2bMO60juTiKWPYMssQKXvXuUDzUF7IaaMxQlWvMjnTGziqVvbw3cV7G18pUPEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27624-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linuxfoundation.org,kernel.org,glider.be,gmail.com,renesas.com,microchip.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0FF62B28CD
X-Rspamd-Action: no action

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Rebased on top of next-20260128

v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0b8b90dd1951..dc74e70f1b92 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
-- 
2.43.0


