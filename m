Return-Path: <linux-renesas-soc+bounces-28197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLNVLE1Tj2lUQQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 17:37:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11505138388
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 17:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A04F31F9764
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 16:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C928364E81;
	Fri, 13 Feb 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rSKDPy+q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99D3659F2;
	Fri, 13 Feb 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000225; cv=fail; b=XcuTwDdhWybh0Brmh3NCFu+bGXSCbWecaSnttG3e4/f5H+v8JMXInq3KrsfPM63UBYLyQX6cnX/iRo9kayyNE8sMy1AvEHYI60vFvKg0YyXJiepUYfZS/jXV4QmgfKJ4E+aWEgQeBcYw3s9QUeeOGgvyBMho8ZpjjFMSczlQoFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000225; c=relaxed/simple;
	bh=LsIAaADhwGQpDyEMLA7UppB1zoIRtH8/4yHaNhL7xMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hO7XNhgao4Og+bGbDuNIucACwueSG1OgRN9eadqxLpR9WqGT0DFAhhlr6JrbHR1FhtM6sVdYf/tVoSENDBCpuXsgqOkOsZs/GFyuuwvhYXx9s8pi3SPPQREmtcUlskHOw1SjirAAgvqKBbe4I4pQwE1QNtBKwPWIzIz83cF7Yh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rSKDPy+q; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQzAc6N5w6bJuLPiBD0UGJcYkGEj2rHBFUA2jYAgfYeNdoce9WOTIIsmv621B9U22SPQWt06iV83KCA1ieywxunBcg2FyDRqN9TeO0EQ0xCzdg4eX8zzwTQxcEAGI7R5tYAQRUDe/jC3TpiosrDPSM4BAgLFeGLs89D2CrkshEUEodbG/nrihHTnKU3RMznft0XN1RbSNdCq4HXwtCaZO7lfAKVnOf1pkxSEdF4uHUY/mc4eNl3ZE7tfeq9xjtYfp8wx1FoTFPArdceDciooq2J4DvbDHh5uYdbBZcL4Z0gUowFXI+hVRi9qiaY49GDTxns3dnxKZ0LTAzkqfZBPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G/sP7JREw4HPerCLmTYwdHlZ2+9lHnqQXPIKxk5hkA=;
 b=y68i7/RbalvmU1HCWyjBLCA3EskllsGZljhZe1TM2eE/i7sS7u+2/aNLnu2vxsVY4LPrYYGULSTN76fVnZBBiGgNwxzD0jj19TBw3SpE3jj/CmtIAsOQn/M2IgRvCaD1ObWTIojky7LV6ruuFYHaTm2SMG5RI0Q7A6PuflT4OMO/MAN3Xe6WE6+BQw6Z6xvV8xipngV4lbdf+2ogD86ugitBwR4UeuyJsDqJzIgD2Oknx9z8OjYOjGjF2OyJ5R/DnGMfJqiJe/dp2PKMhKsXcQ3lb7PsWxadbTHI2rJQkgQf214j9IZ8OwW1AF/wSxjL6SIWBqy1xelfMP18AOkxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G/sP7JREw4HPerCLmTYwdHlZ2+9lHnqQXPIKxk5hkA=;
 b=rSKDPy+qBHjbTUUs0JJ6IDJK7PsXNSq8yr37SpAP4tS4T3TZh6dx61DK+NzmcGpXgsC0FTkKJaOsmFBMmXMQ9365wjIspRGa6IFGoCYef/ZV/jNIaB7hzkaqImDSdFTCS7+xqaBJCHc0xf2MGTcKogLc/9fBDcTrQ8MiK+zZ/pU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:30:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 15/20] media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
Date: Fri, 13 Feb 2026 17:27:41 +0100
Message-ID: <e3aed68b044030da525f1a235de1ed961ae0497b.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 002ba803-97d5-403a-13d6-08de6b1d2e81
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PtLu8zK2keehhXpGp765u6by+35cp+EEX7zHZzIpKuU9CelqzFbknuOvI0Zf?=
 =?us-ascii?Q?P1H7awl316RSqhK0uoJ1S3bo/0RpNQJBdBJn1FQiTq7hNlpLTn6Qjkhm59Qh?=
 =?us-ascii?Q?iGNztDk/2klwpTAzOe4V2CpKPbXXXLWDv/c4zkCN76wwz5V4fsS503y8G0nL?=
 =?us-ascii?Q?4NmcdfqRtMCuJ1uhiwBYna1shh8v5ud7W09frU9PZZcyLymFblbPOZkzHeDI?=
 =?us-ascii?Q?BSMBSwh9imzn50KOQRZ8BHftwSGgw4fk3isVkF0sA1OQkijhezW65dCb/EZ1?=
 =?us-ascii?Q?Yfex60t7oVr1XkAdTTRDr+UzMZYE9hvp92X7zi39V7lCtkNXezR8bEaUMoO1?=
 =?us-ascii?Q?mZqQFyR1aDaat9yOEIAixzS4MZb6cU8Bkes22zafPvEGpRsFxWZbqu9OwY7j?=
 =?us-ascii?Q?sZVJ69dPst0jc6Lgw5aXiqQpmRbtNSaaf6jHkaM4NfraPXlc+bMzsYTh4VUs?=
 =?us-ascii?Q?4gH05nGovBI84SFJlcON1KVT7ubMiY9wjmSPZbz/8OFyTz/4rEzEmsMLV1Bx?=
 =?us-ascii?Q?nDIxslqctb7y5AEr0w5njI/7Jwgo/QaPZ/WRQ0iTkbGB13zJrKCpUoXKi3yA?=
 =?us-ascii?Q?fW2Nway78zU8ZNO/9fXHMD6WNQ1pMSGDWdBUYl7jzLufQTWNEbNpyanVT9eG?=
 =?us-ascii?Q?nQF6TWahMKtypUhaJ390wMeOFf33VFV1jCkbB9Bas/9UVkLZaTpXw1LBiJ8e?=
 =?us-ascii?Q?62keDZ1Ui1Ami8A4RyqMecGbOu3/UpEex5C3+YILII1V2TXP9TBJB8vw/RK1?=
 =?us-ascii?Q?sGbY6iFSvEYGyet/cgCGDJJqHccHH4zg1cuTf+cndaL3CEW5uNKK6Xxj1ChV?=
 =?us-ascii?Q?+JwOXoL56Dgv++e0bM6dvFuQ3qqyypsAz346k08HyY+V6pAG/F3d3AymDvJg?=
 =?us-ascii?Q?pYGe8+FtC7F4PqEZE1dhZ9V6LQDsN3fUDtp5yxZLlReF6tSwA8MrBR9Zi4Tr?=
 =?us-ascii?Q?JmJB6VxOANLpRV+EWJbQCF8/dO71y7Hea83QqULqC23pkoqg/6nyR8JD3x7y?=
 =?us-ascii?Q?/1g/ADMGWR129EEzx4vHjUbMNV86u5WctkiQvO5CU/IilQyskkX4bO43IrEo?=
 =?us-ascii?Q?9laJwMgSOS06yE9owgjsHroBE/Hs3DWq5XwOBynn0NXZbmZs2/S4dGf2VXv3?=
 =?us-ascii?Q?lhdTpzPNO01NYad5em1bQJyMfElyeneI5t75dFr2TmsTKJep10DXxOMnQaER?=
 =?us-ascii?Q?GVUsJtQOTpwJlx7fnrI4dkFY+oOG0+hSxExSfN/gCR0eN8T29uUvHkCGq1sF?=
 =?us-ascii?Q?9KY8JoaIsXKbeECDipg6KchUPly/wfKpNKkChvNDeZwdzQTISnUIkEMD6eFb?=
 =?us-ascii?Q?9rmbfAESpeegD+H9LRUxbyANKlbNAKZvlhqKa+SIfs2fJoPPXKC7Ld4WifEX?=
 =?us-ascii?Q?XsR9T6/Mg+7H2wVZh1S9WrdPmQQoTZ7f4lvw3v7cF07R+5Urt4n2S7T6Cclm?=
 =?us-ascii?Q?PTeV0IlxKd3NFXFEXv54acia3b763d82dryOmSZaESogjSuDiN6d/Juxvnm0?=
 =?us-ascii?Q?T7v85d9BPPRjhvO++Hp1Ihbbd9GYrWGTl4DAOMj1Hqi2FL/fqsrPYwB2ywSH?=
 =?us-ascii?Q?lqHNHI1nPJ4b8sP+xptfl9fbeg635BeA++82Qn5gUmRd0azxnNBbZeWmQAwx?=
 =?us-ascii?Q?KsNpiuz8SUiK3YOedGKkSG0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2CLvuTt9hMl9YWn1agudsqMgdhdXUfB5yPVL+cIgy7VZU1GHLFd0BiyPcufH?=
 =?us-ascii?Q?mZDW5Dsk011vYz3rMo6IePoOd3OkscZ1hiGFjNaEzWRfTDYxq74nHg1qxtQU?=
 =?us-ascii?Q?7n0X3eM8G+kDDOEIT0CFaV4pFtue6OXyIkXlSC5yZP2c2+12Xb8eNMcZF1Cq?=
 =?us-ascii?Q?owgKrsW+cH+kWqATbZwR/KXg/yVUShN84iZu8kelIzfLf0G5CEWihnc1QoFc?=
 =?us-ascii?Q?kRZbevThJoV4YDODiz8jLZXSQFzaNHEhBub1DPZKJhivcBwZqxKVt5ZMtz+L?=
 =?us-ascii?Q?SZI/TQXBb6HRBuQ22MQAVk6czJGiwo8SjI2OiMz4YdPw4wASzOFDS0PUfgDy?=
 =?us-ascii?Q?D1aNiTXhQeJBURiHXIxIFND2v2xARAArsyLFoTnNIidMgUt/yNhIGqfzw6gR?=
 =?us-ascii?Q?SGRERiErARA7rPpd7Umyts6PG18B5nSCVae+IP14rdva3UnfpJYhqZ3xxWgT?=
 =?us-ascii?Q?lrTqN0hYiXx3Mc52Qj+9hJF9Xh44+b9/ioB7wLeWRkH1H4ynS621BMhAPMG3?=
 =?us-ascii?Q?Ojj/+k8kADO5YsAGvzgQoY2tQccapb7lGgWC+H4WT3CxPIwym6pk7sqkJ9GG?=
 =?us-ascii?Q?nl4bpj3uVoiXsm8ZjBZlncwQLEdwznJsjm6KvnFXq1lcW+Jn/uzDOj15tGtM?=
 =?us-ascii?Q?E+lNqMTG7ihTuKHU6bpL5u0vHfdVBgqB7M9nDDuH8Wbfkrads6FPWBwV62UF?=
 =?us-ascii?Q?uftUekGYTJWcCGtbys+gj0eycfwOi2ZcfFVjIP4E8Pm/xRsCNcSVQxJy0AiA?=
 =?us-ascii?Q?EbV1RaGye9P8lyrtJAF7GyCxWm2lYEdaUvb505czRiqdv4q7297ZK17s7Cnn?=
 =?us-ascii?Q?V4xvHnMVPGbfMaXhqw9ekt6nteBSZFx0HF9vHJhr9XJrq4eUsVeTxn1HnmUA?=
 =?us-ascii?Q?pol+EhfitoBc6zYzhqbne56MVl5eDeE4eGhZJ7uu2V3+AkNlkKT1EcCstIt6?=
 =?us-ascii?Q?5JJbP56RjI5GYWPxOtBoUDMLxR+fGhfotPn5EMx0C5gFOTBcp5bDr/y3hM3Q?=
 =?us-ascii?Q?g9evjLoAsue/33wUExyAKB6wU4jclQJyr2H4E61AsmQqIeRKKb+XN5h7YEA+?=
 =?us-ascii?Q?ZXJXURp5tkD58+iR9FTv0ziZRUBujWPj64CfeOlFO2eXgqC75sGjSbVUoRTH?=
 =?us-ascii?Q?ydZJrq3rtAXPZZ5WzuYz7YQ+PHbHMDjBg3e7EAIzTtUQmPhbEGP4FjoprRgd?=
 =?us-ascii?Q?yXeHHjuOwJ3Tp2SFtiwYYEG3lb3ZZXtmWtUF2OhnX9d3wqkupVdmnOnLUKgd?=
 =?us-ascii?Q?l4jo4QMqIORlgQa3RxvMSyHWvXlI3TJi5A7LGO3FKXoHRd4+21wmSzHFa6e4?=
 =?us-ascii?Q?Z04YYf4kz2IaA/U6rvLNxKe9d1g/p561JNfpGYrifl6Oy9e6Ys6lR112ktpV?=
 =?us-ascii?Q?gib5EjfycPwwK2jV3qvhy1/tfz8TrAisHV9nQHEXJLfayUPG/tRaGaxwVjjP?=
 =?us-ascii?Q?W9SkeNMTxvdv/nZ8IXGHj/IOS41H8GNnU6GQYoD1TBOlCRlZ1DSJeU6l4YpL?=
 =?us-ascii?Q?sgOKSFgEhI/QeJkEpM6t6aHXQgXtz/PtAl5pAAOSgNLu8jfZQowxMuudu/Pq?=
 =?us-ascii?Q?tDbKG5QyYvNGxJ/ToSAPKkAiOe/ijZP0MMA0SgMyb1IxXNmx9NRSi2168w3c?=
 =?us-ascii?Q?gV5Ql7dxuSVkFtzvCwRLt8eY7mD65eqf3lX84Vggs943BlT3p7UIYuAIYbtI?=
 =?us-ascii?Q?zlP7lGrwcJsUPwjt7JqJp/10hcLeveRefCiNm2J0Ogn5tirJjbnaPPyoKKdz?=
 =?us-ascii?Q?wo96R8qiRkZZjJnchiL1JvcmLoCxreAcMzYMsUlymQeehWSuwYy8?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002ba803-97d5-403a-13d6-08de6b1d2e81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:21.4837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO5Queqo2JgJWcvXpRN05e/4pAp50sbPz/GH6fFz7+GCNiLftKJGgSX4K5iSQYSEXNPKrzo3BhO5/gcq/33DwXkFtRfZoJRHbmcBMJeQUeD5b7adtQ+sCRDsdx63f+pV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28197-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 11505138388
X-Rspamd-Action: no action

The VSPD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected tags.

 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..62bff3ce3eaa 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0


