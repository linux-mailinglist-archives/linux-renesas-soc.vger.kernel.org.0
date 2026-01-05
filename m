Return-Path: <linux-renesas-soc+bounces-26282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9FCF3107
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ED2A3083C6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B933161AA;
	Mon,  5 Jan 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ozBtnXMy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65B316195;
	Mon,  5 Jan 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610247; cv=fail; b=hopXPm4jH9rtlYzdwQoFbnyyF5cfFeZZ8qVTIQSWYR6q05H58VXx8ImIe1h0XGc3ORCQL1O65jMOhxs71lnMLwhYMzzVuiKDe+0wEfN3GV87t3OQd6iU7q5j+pT23xtZGv1r2IK/OEvZCoTRrZ9xNfOltJ29qzOVRlRX/2o9SQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610247; c=relaxed/simple;
	bh=3t4VyRY9J16Xy4B+L6v/PUIboutap9GcufNQ8ivPGvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MdOBZLAByEov5HXGTCyKjUi26AUToKxy2X0lGHPzvY3+2mspr/osnXRvg4/pJHuUcqX9AvuwCl4Sp/C35/RNpBVsT9o4qA2J2hRStC94q1qEyQ1ZsDgA541qbIG7+MKxVGGYOB2iZtwKnSYKpcIhpsW0h0zwfxKNh+dRZLRw6l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ozBtnXMy; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUqX/bBJv+xgavjzxO/57EmEfpcOD/WrLA10Bylso6A/FTkp1rR5rXHPekC9FiimunZ4P6HL6UL0FdtE1PCOa1tN6eRvQBxsL6TvBwCi/luuTYmXG0p5eJpUbYQ2oolYQlX1q4PNtVOY2HRsXMTA3kxs5573J6hCKWDA/fyfYKYH72zAc2OAmKOJKSMeLmBob6YyyEn+FAKEh7pAtN2VL7BbSOaMcZRJ3RFZHnkKe7FVTwZCnYVwna43e4HLwyEAqzYw1qQN/Pwo6vcV/C8pzUHgUEOYJy0M8I6SuxQTMXeEGRcjiSjjhqfCd6nUruw8oxaAROv8H8UBtpje7Z8SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTqeoijCjiJaWr18ZDKm7cCSyH0y4/1p+nKkiXlJjts=;
 b=MZNO9uy45G/3mce5E7GP9FQUMVlxpNHH/eId+1hA6mUniifMHM3Iav+8tRaZpOyZgxO1ZPPTZvKVpuZXuvTomucb+lj/6356gr7o30FL+Y5gTaY5YcIfi/HRzuHeLuONBs6vm7TyiDP5oVW46yhL465hJjis0KRUHl5+BRqK31D7QGNXLRQ6/fsNt54ThAYoOgqxBXkwQUWefDlaEWv0W/2YmTVab7i/iB/NES6fmLNQPGbNovNGkuWya+fdFBeERJXZRJQAMkWBny9H4obNpz5uvxltfWv9/FyjEkwAPMs2TK/+tb26D5XTMH/MfSOecJInTZydc70P7kerdlatQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTqeoijCjiJaWr18ZDKm7cCSyH0y4/1p+nKkiXlJjts=;
 b=ozBtnXMyuXLgA4yVQC6GQsQC9czinPbTdgUw8N2dDT0+FlTr8YwN1NOHF02UD10GsNxY1zuDlklbE79tHPr2yYjXpbGEapzlJLNnXv5ZZTdXEYKfp7//CeS7YnoRip1vrKGRkpWfBxcVl9vvmafpRYP6jtO9vAA8LdBekeDox3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15540.jpnprd01.prod.outlook.com (2603:1096:405:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:50:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:50:40 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] i3c: renesas: Factor out hardware initialization to separate function
Date: Mon,  5 Jan 2026 11:50:01 +0100
Message-ID: <4878c705a4f37adcfca65eb25a2472cedd855f2f.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15540:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d447dd3-0d5a-4755-7993-08de4c48446b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ogqlkTGg2JTGYAUQDJCBMjk3mTruJ3usx1loAdeSoQnUJ9E0GZb+TjfALfZy?=
 =?us-ascii?Q?nO2fOF2Qc1/NUIKHhQGDssCh32RlSpX6u6MlXavkOz+00uIfczpRYxpg3UAt?=
 =?us-ascii?Q?kT2NPDU6NmpOSyNlTFjVyYpSWgMuWXnnf75RQRvZcFa8o/kQGsSQevnrqXj8?=
 =?us-ascii?Q?RJPaQHNfYJyJc+icDSp6VOj77PnT7OjLIc0l3lR/pL4gzMcBts9rQ0XtuzNN?=
 =?us-ascii?Q?288QCAsyRpVsIaepaKnZ20RGvwcw+uxmSl6Zlpgnvm4GMSKCygOL7tKJ7w3w?=
 =?us-ascii?Q?MgM0OFDgu9hDhoCgwMwWakBBJVnIQTB4mI80B+myH1xuDX7vvplPja3KDlxs?=
 =?us-ascii?Q?JgKtozb4pzGsy2wCYcxg5IPhkHJx6iMy5DaSByD0XCdWLo5ZugeD07rwJD44?=
 =?us-ascii?Q?2kzz00EQlItAWvGL+5wlAJHXhfOR6bci5ffEDvCmEuQ1rebMEIE3D5LGsaB9?=
 =?us-ascii?Q?A0aCCfX+S5xTvlOgHTy7U6mGPXEgti+zmNRJa0UaCbiDPfAht256q1M2oDRl?=
 =?us-ascii?Q?f7nLWHoA2hEdpwagFA675oxjZqMS/gtfUFPVfV2XXP225e78hBAV22OEXO+L?=
 =?us-ascii?Q?ovEPsG6OZaIfe2ASI8PfoTTwp4V0njsDAetllfaoRocZXzn/RmKxPp6PEARr?=
 =?us-ascii?Q?38Ci0+/IqzqxmahCpGusJGuFyR7sa1amK0DhCzdReG1P7AjrTROalj+Aq4Cn?=
 =?us-ascii?Q?1AAnG6MCQqn1aCXdwNtSMOayVDAMPWV1wTFh0ZQ15YMY815se8vTcVUFQkLF?=
 =?us-ascii?Q?81zu3xBL44x/G+AdPCO6fK3EkadNeJkTeDE0UnTSE6HamC7YUkQR0ka9pAjB?=
 =?us-ascii?Q?vZ/ElMGNj2c69icpfqHe5Y+tqkDbkiXgiGQCC8Bhnm1F9G2qyut4hU45UrTD?=
 =?us-ascii?Q?KcFjsktD7OFeijI2JaxFn3kg9CGYC8BEuzGRWunviLehB8mgD8snN8juf/Rj?=
 =?us-ascii?Q?ci7pYonCJpqin6FAnRpzutD1uNA7m4r673L6bBUb3fupvCbK1heDENmxeZSx?=
 =?us-ascii?Q?+AsYO9kGxDnYGYyxORKM9psPcsJ6nEVswE5Cb+kXod0EyOBegqQ+06KFqRA9?=
 =?us-ascii?Q?vJgrPL6uvPX6lQaDrNbCi1nqGrTU5pKG50nJE92CP9qApEFY3+NUL3gZ8Ssv?=
 =?us-ascii?Q?/EjOGKoxWGXZgO65sN/wU+4J/mv6KvF98e/ioeoQREaliEsAW1td1sPcpVud?=
 =?us-ascii?Q?4r1YShyfrK1UAm8am7QUqP7ONKQKOBgePSyV/FRSDwOXw1tgFK+rUFA4KbiZ?=
 =?us-ascii?Q?4bEJ+HHD55gFZId89/27AHq0XI62s1Rk3vSU+2vnDlzqffezjuTPva+cLVSo?=
 =?us-ascii?Q?PkcLnhycH0t/dCRi1vw21Lj4VlrUzY6wiOl8Dkd0N1nX8mAzQSQHW6uyBIaW?=
 =?us-ascii?Q?hha0NKk08c1fisSpbgxR8NyLixzSg0dJbDORLY+vxdKhPf58hCStTNu5PJAJ?=
 =?us-ascii?Q?nQAFmdomlKExldwD0uyXD6ewONaSh2ifmatubGIL0i8tnhAOWn9oucXf0w+4?=
 =?us-ascii?Q?YRPsmVChTpvFzpngELZVF0r0IjhlsL1ednxt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o8OR4JDmQ3aB/FF4fHOkY8DycsYzrjg8d3bP3ps28GjIJvgYxdjgl2LvkVDE?=
 =?us-ascii?Q?DQv1OEo1clrvDl8cX+dd5ZJKJPU0EY/b0yHHXDsLRxn7RG+2JgCa5B7PqEb0?=
 =?us-ascii?Q?DFJEQ2dReKn6+nnouX9aq3WbZNzVYJe1hqrT7SSzXOCgIad0Br09HKXxnECE?=
 =?us-ascii?Q?aBBAKA5yTyP7NgQxYI5yUfK9KfOreD3j/crFQ5ts8LmaMsOlYl1Pfs/liYYb?=
 =?us-ascii?Q?sVJ62F7PhP9TlJ8v+B4EsaTGCjfskewg7YWeZMOHCdleia9eHw/hACmzwvmY?=
 =?us-ascii?Q?R9tGquREI3LmOWU5RCi/JbE7ZROOk9cgsjxebWPFJts2RUfC3VnYZXBAFDRi?=
 =?us-ascii?Q?KhgviwcvXO/CqX9btgGnkuwacZs8+/O7FV09UbtUaBDcrpIGFQIiZyP+fyX1?=
 =?us-ascii?Q?X0x+es775hQdER2eZ2q/el3pgslbDXK/wFp/JijH/f2hss1hiJRybXRrg3qc?=
 =?us-ascii?Q?OsTEQoJzAP0WTEV0fipgPSO8NaiaCGA+jrDrxLGt2xgnLFIhg1IGRz0fBLdw?=
 =?us-ascii?Q?K6M6fTpqDQum65qLzeuaCmKufXZE46rvWkz8OxrP0MJB7HMT+gu+LvkG4RBZ?=
 =?us-ascii?Q?EbqUmqklxqgJIprx1s90DhHp9lP2+q+zOrj8ZouYgCq8FH4G2S7Q01Aj9ZBI?=
 =?us-ascii?Q?GkVI+O4FplFR08QMCrs2X3HQugnJ2Oa0V33FLqRlTl5HoJoZJ780k6cUUAbg?=
 =?us-ascii?Q?QTMpZ9kXT5wTqx6el6L9QZ7LKExjds5pCzhfiezQrg+zwRprCMV2B1jNkC8Y?=
 =?us-ascii?Q?AcVhbmf3TSLaDcqKMSnau2dkI6S6D7mSpx81hVgJRvrxQStzjG0UqjGEt1lE?=
 =?us-ascii?Q?yXUeqohrfRd3BW4d4R6ErbH8reOf0vUZkPULMoBmmMrp7wmVWSvgdJMW6D7k?=
 =?us-ascii?Q?gtzQBE5kzCV6vikRXxgTS4QMec3QyA1/1aA/Wdj/+RCUmcugSQfJ70QxM7Gn?=
 =?us-ascii?Q?H8y4eK9WkCHdEzGsoUQFGM/Cu11QyTm1vWjEeRLKY2J/CNwAMxEYi1SAUv5s?=
 =?us-ascii?Q?/ZTdSiJvr9QCSERdBTUXu5l6XBPwXvGpseFrUFutR9GhnlO+jccOo1Fipr8B?=
 =?us-ascii?Q?c/RBaZiFxV1jYbFxsxW/k7Er4Tpbl3BIUhfSAO0P7xMK9ci99RzR0iqcypVu?=
 =?us-ascii?Q?bz6QqCINKoHJ+bYReWUC49zi2BnZZAVryKr3SHqxWNvnFM6wAT1ZqbW7MrDM?=
 =?us-ascii?Q?00+I7Dq8wA0VR3TKyOc9wqLQpui02Q8i/Ut18/v43Ky1pUm6qYIOD3BsJV1N?=
 =?us-ascii?Q?xEBhak24cU2NY4Rzxfu81Gado1E8soGd+8ELiVivjMNBIyMNYUwJzjosfCln?=
 =?us-ascii?Q?Yy0Cm4XLB8e+d1T9ByYe2gV5/ZhblPWnitqEzIyDldzqjnm5xEMLk/C0/hLO?=
 =?us-ascii?Q?lL78pltyNlR4BsXu7tztZTocWK/oNnI7YlkpKnOUFaL2IWuX27bfeZTK8XW5?=
 =?us-ascii?Q?WfrEy7X9HuFRKF9mFMRBfdFfPPwrnqxgDcrC4DLx5RNpyfonfnHHVQVG30Fk?=
 =?us-ascii?Q?dTBjblODdw7gnWu1jcOCcJpcSG4B7oKgVvy7AWoW2ZOUPUmEm2oj3YWIJcv3?=
 =?us-ascii?Q?C7O6BSW48ZY/oRGGZbA/DcB7OUe3vSqNW4OqwgHGJgBjaM9vEvmSZFaralm2?=
 =?us-ascii?Q?eYcLcYkdIyk7lfFZDvMFm8g+iNU6vc1Fg/fhF5WjApU8I6WyninTEZ4EtqEA?=
 =?us-ascii?Q?THf0Tf6q502NLLM5cOEaHDbgfR0nHdK2tYs+Pdwo9CWBuCIYHVTegHoTrfg4?=
 =?us-ascii?Q?S80uZWAVW0373sozk+E3ghu0nLFHISEj3TNJEhRiwa0YpHqJ0VVB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d447dd3-0d5a-4755-7993-08de4c48446b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:50:40.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqxciIyNidsXukfE6Fk1WAqeoLVLrWtnOVRAyW9WVWXluCuxbf0h3vi/WGlmxEj5v9VsmK/yBJY7xxItblAW43F0mA4bNN8GEW1z45dFt9cyuEQWSS2eZmbw+2dbB99a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15540

Move the hardware initialization sequence in renesas_i3c_bus_init()
into a dedicated renesas_i3c_hw_init() helper.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes.

v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch

 drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 7359f71f78dd..b065b8d4b138 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -479,13 +479,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
+static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
+{
+	u32 val;
+
+	/* Disable Slave Mode */
+	renesas_writel(i3c->regs, SVCTL, 0);
+
+	/* Initialize Queue/Buffer threshold */
+	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
+		       NQTHCTL_CMDQTH(1));
+
+	/* The only supported configuration is two entries*/
+	renesas_writel(i3c->regs, NTBTHCTL0, 0);
+	/* Interrupt when there is one entry in the queue */
+	renesas_writel(i3c->regs, NRQTHCTL, 0);
+
+	/* Enable all Bus/Transfer Status Flags */
+	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
+	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
+
+	/* Interrupt enable settings */
+	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear Status register */
+	renesas_writel(i3c->regs, NTST, 0);
+	renesas_writel(i3c->regs, INST, 0);
+	renesas_writel(i3c->regs, BST, 0);
+
+	/* Hot-Join Acknowlege setting. */
+	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
+
+	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
+		       IBINCTL_NRSIRCTL);
+
+	renesas_writel(i3c->regs, SCSTLCTL, 0);
+	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
+
+	/* Bus condition timing */
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+}
+
 static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	u32 double_SBR, val;
+	u32 double_SBR;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
@@ -558,49 +610,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 
-	/* Disable Slave Mode */
-	renesas_writel(i3c->regs, SVCTL, 0);
-
-	/* Initialize Queue/Buffer threshold */
-	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
-					     NQTHCTL_CMDQTH(1));
-
-	/* The only supported configuration is two entries*/
-	renesas_writel(i3c->regs, NTBTHCTL0, 0);
-	/* Interrupt when there is one entry in the queue */
-	renesas_writel(i3c->regs, NRQTHCTL, 0);
-
-	/* Enable all Bus/Transfer Status Flags */
-	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
-	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
-
-	/* Interrupt enable settings */
-	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
-	renesas_writel(i3c->regs, NTIE, 0);
-
-	/* Clear Status register */
-	renesas_writel(i3c->regs, NTST, 0);
-	renesas_writel(i3c->regs, INST, 0);
-	renesas_writel(i3c->regs, BST, 0);
-
-	/* Hot-Join Acknowlege setting. */
-	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
-
-	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
-					     IBINCTL_NRSIRCTL);
-
-	renesas_writel(i3c->regs, SCSTLCTL, 0);
-	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
-
-	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
-- 
2.43.0


