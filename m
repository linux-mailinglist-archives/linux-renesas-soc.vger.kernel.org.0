Return-Path: <linux-renesas-soc+bounces-26182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13327CE96EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C7BF3002847
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D74262D0B;
	Tue, 30 Dec 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FL01P9ca"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0651D212557;
	Tue, 30 Dec 2025 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091226; cv=fail; b=fPSpH15XwsYz4RC4L+4TGk+CSXGyrJJFRVWhwlyEFOHOotBKEjwRgzQLPFPY+cALjZ8r0egNxfTw8/EB/BdO5M2UVBv9PC5TzLZhRfaB9h+hzQU0IgU35sVI5agAF7dAU2fsGOimDyhpAxyyOGuVv3OCneB2jQHWnyILS581ptw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091226; c=relaxed/simple;
	bh=uVle/v0pSf56AyMBdHGhAF+UDJnr5EF4Cmk2x8hlqaM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RJfH7J10Dgu+rhmCIfImOfIAfZ7VsPXtIOjPabjz1BzSLEE6XAD62JkMcZGfNTzZuTP26F6QyKfr/kHYbO+bkFw9TEpJT5PGjXnsgjBeUym2q4X7iO9rqjSvBs4CJEVlS14xpdKhMqrMmA3BnY6lqJAT5gztkseA9aD8TKduy6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FL01P9ca; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FszB4R+EswiQ/kq14BE4n3PytH6HwAxzNyFLhvJu9x6qtUNP+7Tu5IgCsD6Aa1csYo6wchr1kJws0Z5nxtde1zHMUlITotkm9ooNBKq27RdUcp4b6X5tcabEogh6NCE48c89btnYKPOgUds4aBRm5m0bPxEHfWla5yiclLBC6aE53LGq+ABjP/CtrlV3iLm5WnvvTwfkYNDflstKNe0DGyQRJT8fN4frV5DEP7cbI8z9S8sM9NVGPa5F3r83B6tjiMuVytxOjSizJORkXptRy+t+UxSY93aGw13ids17DzHawdcOzMC5o2lk0UUQiXEeSm2Cbjwu4FYZJ5F9MMBybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYerh5u4Pv3S40tdj+lJPOqaW4mvRl7+C+LobcE6e4I=;
 b=G3Sjdt8LoY5GVqKH5ZfbSWUUuxo9qEziqaN1YYfVOvklDRDns3akMgBQjfBvxBcvpXzatZVSkG5pT8pxiI3Ip3crcrfjjDIbRYqMBEz59YZn/erc8a+h1GCw+c1iJQ3btk7HnOLLDefLgmNt6Dm0r3QemKj8VrJhHceYBMYahAmDY35a8/48mKodPdxaE2lw07ueQQjksumrzu2/oBWWNssOb89rgpa8gisjH4mAdSIgtLDqhPs4JG+PKWJ0AXbsoa2dyUAvKPi/G6Lc6rtWJJKSIZ7LkKPP+1NOJua216oxZXWvFBIULDm35hhqbqk5WhYjHjKUYOVJynWDukT7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYerh5u4Pv3S40tdj+lJPOqaW4mvRl7+C+LobcE6e4I=;
 b=FL01P9cabgmoACTy3bGGHHt4psmGQBcB7jmln11e4nTr2i22go4SLGeRQL7rNUdeuuadPb2+m47vPlowaM/Ls4oIziaIM2RCR8Me8Z79YHfc5Ft98YMj5NVgrahRaCor9zcQvB26YGwEQshqQmvmPPF6B7RDXdkvJz6okQVrvjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:18 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:18 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] i3c: renesas: Add suspend/resume support
Date: Tue, 30 Dec 2025 11:39:35 +0100
Message-ID: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB13563:EE_
X-MS-Office365-Filtering-Correlation-Id: 812f0381-38ca-4e20-245c-08de478fd2ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pqTqUmnBzfK6vXtJOYyg8/o4+K18GIzpTUv4EfuGAxKj6TCe8YlhndXse69o?=
 =?us-ascii?Q?N25eeeAcjPDNSlriTV7er/Ll3ev0il0BAaXw8H99Qa+HF4YGnXajsjEeAoq3?=
 =?us-ascii?Q?UHBGJJbCvP1Q5sURJdUGnP5k4aVbVn94xQVSWGSegH6Ig5ZEYh62j7uZKa7v?=
 =?us-ascii?Q?aZZfG5F3mVQmYiopP1O9cEOnzR7Nc+KOiSB8y0EGfmYGHpSAt0VPtswpntry?=
 =?us-ascii?Q?0Pm/MQP4lpPXODP+a1qzkoYQTsFif/+uCT4f8WJnMqc5LvBXXNmKsvpkffwZ?=
 =?us-ascii?Q?9vMw5E3TOjl/7Y8CKXWlmXnJx6b6VoQg6q3SgEMW5j/uZ0gv+mt9BZ5e1Loe?=
 =?us-ascii?Q?bZEVltoL5+m3Nheyn2u98LHMbQcrsUInSCvyIlZb0g78QhW0ZdSvr84X08QC?=
 =?us-ascii?Q?dJhr/wkmE0+VbxKnql1w/jz5yY0PhEyc4xQEJ3OiK9Xl0nlmg5pWWVCDKBPk?=
 =?us-ascii?Q?zFSJ1KCo+KJh7ooZoK2UWZcwSNkTFplfAqKrQijbHU/q+DP94XKtAQqSpzxk?=
 =?us-ascii?Q?XkkiXvBUrO5iD0oY1V56cbRbLswDN97oQRsSWbscx2EcRvnQokJR/BTN1wCx?=
 =?us-ascii?Q?fTwLJIXHxIS6tdHZvsr5j2R9e5HSqxXJaLxA48hS6A+RX87hkkEh3Ch+K2rZ?=
 =?us-ascii?Q?Z2sX0LaL1wuOyrgNUGI0QgHhHEJAuEd09NiGGQv1VuFBQT901GJPw5G7NV2l?=
 =?us-ascii?Q?vOHu8j2p8GDrPEMbyQbq57e2AjCG9YC8muuK+qZfOJEBPoouK8tO3dKfzDmP?=
 =?us-ascii?Q?AeGIvfKpurVOia8OPGwmoXTVtmDQkniwHpSNEwtWVCEbgYJRFYDERHKK8Y4e?=
 =?us-ascii?Q?4jc6UVOh7CIeHHW8uQxKzmRMENZKFAHukpLbKaYoEqlc8obNrEFs00y/VsNp?=
 =?us-ascii?Q?R4uUf+YJTcFVF02HwypbiaeIt50SkVAHhbvIHHvRZufWJ8j1gcrqQDk0+ts8?=
 =?us-ascii?Q?zRveFpMXIByiihAX2yWvS7IhCGSrlBaQLnQ5E2Q/JR9Yf47cAjNHGMslrtMU?=
 =?us-ascii?Q?bEU4Defa+v2r6MncNbmXmZhGsnbbFmfh/rOckw6uvUW2C8MZOdNeQfACuqmP?=
 =?us-ascii?Q?3BaYSOaE8rQLN0BzlopEJFHqQw4jgGIfpAGdYqto96E7Ur3xJRjk/LYhk2By?=
 =?us-ascii?Q?H32LR7cZfvSHMT/6T6oFWE15zp3sEucUzi+3Fq1Mb8prc8unYeJ+Jmu+lBeR?=
 =?us-ascii?Q?5i7A9f6GiYb3HpytfBEiv0BOFKk3yLhqfgxRWKMrhAycrSGrtJqdI4j2iJqf?=
 =?us-ascii?Q?9XoxXNJ9jJZfqnQpudIW34XJPp6yjlS6XKfH2Xp2TM3K6zIimrlvxY8edyCx?=
 =?us-ascii?Q?/VC2gezkUXTgHFaxMneDuhJchFanMZAw100eztTYBxPbuqrqGnbKc7mZJaty?=
 =?us-ascii?Q?kAXIYx1jskPeXRmn9idRAdhARy5BRWRjrwPUZpjYIAeOruCVhzQE5FVrxnOD?=
 =?us-ascii?Q?SkrKQH/bPbGATf4D/Z93CAviF+5RnYC9RCuhPQgly4/E9s4JypqqExr/2D0f?=
 =?us-ascii?Q?545yBCJ3o9hH5KiupJMjujVnvqMXaAbDip4J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BbsOD7PZtwVLOYItTwJO/qb2AfNU1FmeEIlzmfOqzikUeMyjR4Y29VjRyfS5?=
 =?us-ascii?Q?wQu16x+/yyc4raOBs6co/f2M0Dwp4LQzIoqLo/Fi+7hqfAZayDi6ppQgFt8A?=
 =?us-ascii?Q?qy0a22f7ElbMFu46hAUMzUr3VC49D/vQ80XGRNq+XrT716gP2tcmMo9/FqiM?=
 =?us-ascii?Q?IaVMIrhlI8U3ZL8tieBsw/dK57mUIrt3MiWVavAHXPJz18DSnuRxX9eLDLBs?=
 =?us-ascii?Q?utETz9l3UWonfcoBI6HsisG9GIZu4c0oszehX27840CG2WtfODl4tFjnT8M2?=
 =?us-ascii?Q?Xgj01p8nLXk+QrfJasIpFcqcP1lUloIWXYwXBh2+h2RZHvWClL5n4XyHZqI0?=
 =?us-ascii?Q?wD0yw4V8mUpbzgfX0i/L4l+YeRZP0zc/OMj/YOJ6Yc2mCZP53ZlguI6M4jY3?=
 =?us-ascii?Q?VPegV8y2cAuxoLM3I1yXYiBESbkdX8IE86QJW1GBZC3nYFqvr1v0uofu6i8N?=
 =?us-ascii?Q?WeHulhAqR1Qe2u76JAcrx0u5mck9Cqt2toc1Fio+VlUEN81sDhoJ/aBuB52E?=
 =?us-ascii?Q?/rBhgVMHyW6yD/QChFbV3Zw75jNiKsTzUFQK/hYX3NzwNYzGJ+wdJFDaVUw0?=
 =?us-ascii?Q?whuEye+WtWwijTYz1EJ9UAoGsdCeSfb0wxfBscoNQi17WFsyvwnqI4hUjDJm?=
 =?us-ascii?Q?wRiMn+k6zJmxUy0L0fKzz8yVWuIhMDILCO6MMYeGgR2N99DJBnzTl3LvHb+O?=
 =?us-ascii?Q?2zIa+apv5bcT8lpb9r4wvpxDh64BnrdqRr6+vt8l0cT7PUew6+pAYucb5bpB?=
 =?us-ascii?Q?uNp30Clmf6wTEJAQMIV9mSwKqqnTboCcXKzM4g6Vz9I4Jy6TsEtjcRVGGh6i?=
 =?us-ascii?Q?g4ZjAh6B5kH1QpsNjyK9pwkD1O/9A9s8UvF26GLdamfWnmpPyh1pzEbA8QHO?=
 =?us-ascii?Q?Fif2O9U+kkKShVaedA9LVGwgRv2TmAjIN/iCglPezjDwv9MMj5c7kkPWml8m?=
 =?us-ascii?Q?STUeRmPopZ8DH9dI6ZEC7F7jJu3TDdBbX/Km3kjiU8//zG1ONuDL7NWn5qeC?=
 =?us-ascii?Q?Tc+2B+ja3mtKVB1Fy26/9FdAsxbN3cttTxpxOK6abWpfDruGFKS5cZqBruvD?=
 =?us-ascii?Q?155/M88ktGDi9WtfoND0pzx2RkZ/qmeRiHXma8hQikD+CmMtxbF0Wk4CLdrY?=
 =?us-ascii?Q?1B51QwdtFfsTR81dXM+8j28TVkoKvvdgWVBizUaCbk7cG4CHCoMEZABurzKw?=
 =?us-ascii?Q?D3PhJa/hekk3o03gNdll6WxVZHpJK3URf/6A2tzwX6AyzYV1cF1bDQyvucCn?=
 =?us-ascii?Q?QzOrzmGbLIJ6bLSOI/LVzRJovScWm2QBp562cNso31y9FboA5O8jRWY/Kt5z?=
 =?us-ascii?Q?CB3IKLQXxNPqqdl7mYDK0FE5cG3FqnqVIBmGdpReMyE12r2Oz10hDivc5c61?=
 =?us-ascii?Q?R/BnZXdNefNlzC7zSdGTScOQNp4KwqOvEWLAXXNANFozLDk1KOdm7z1QkvN5?=
 =?us-ascii?Q?1R3W6SUYipzIr2+zIb9ymo8s3BW0sYgPiRfx2EOBM6xpJo3oKhr6AmLAJ53w?=
 =?us-ascii?Q?j5BiPUJDvvWEWU9ONCD7l5kp+BlQOFY8nLErLkbeBq3Yv7ov0M4fVZ1Qs820?=
 =?us-ascii?Q?N7wcZ99IeckUgrT5aPpOqlziBTyAo51kUxOOWt9K0t/0AH9NLdHon9RwHEnS?=
 =?us-ascii?Q?i/YTsF6gz9Jjhi5Q741C/fcTvZV6rtu5JQgJo6F/zA4O8fvdEi6Qc+4wRE3A?=
 =?us-ascii?Q?Bvvr7eBUsYQSP1h4h6Yj4V89EXZWfqWrc0cBK1r8hVR7GoKbdGEYuCe69HrG?=
 =?us-ascii?Q?xtNEjQh+lMUrFgb0Y7e2QsB00ZAMw30xVQkENxEYrgPulC6AG3rI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812f0381-38ca-4e20-245c-08de478fd2ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:17.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSvtJB0cMqGsBE5NJqCWDyxQHPAWoXqHqh12V4AkIvXXBHUxqqvqGxe9YFtISKBwkYyTxYUvVv0Fiawln5Lde8MZYnUgE5lXAsCqtEQMhlFARMr2rkrSMv+6cEg/c180
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563

Dear All,
This series adds suspend/resume support to the Renesas I3C controller driver.

Thanks & Regards,
Tommaso

v1->v2:
 - Split patches into smaller chunks.
 - Use clock bulk API.
 - Update patch 4/4 accordingly.

Tommaso Merciai (4):
  i3c: renesas: Switch to clk_bulk API and store clocks in private data
  i3c: renesas: Store clock rate and reset controls in struct
    renesas_i3c
  i3c: renesas: Factor out hardware initialization to separate function
  i3c: renesas: Add suspend/resume support

 drivers/i3c/master/renesas-i3c.c | 257 ++++++++++++++++++++++---------
 1 file changed, 184 insertions(+), 73 deletions(-)

-- 
2.43.0


