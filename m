Return-Path: <linux-renesas-soc+bounces-23714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9842DC12DBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 05:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9183BD5BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 04:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E56A33E7;
	Tue, 28 Oct 2025 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SYlPS5q7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F62F5B;
	Tue, 28 Oct 2025 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761625933; cv=fail; b=AinaanWEPIsnEV/lIi9dw1ELSLUkQW+tqH2yeCNPevp3tCd1cClyVEaBQuhcTKhQsCJDAkcCXmfL6FCI9S+ESZ5fETjXFmuI+MwB83r1eBx5I/C1E22HfRS8ZRqmHJu+ItRQmFe/4Iu3Lbvg/LNiEnHx5bkAqp9RJuoWB8HObYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761625933; c=relaxed/simple;
	bh=Gq2D8LAACQaFQ1YIvhFJu1vrov3zt63a+zsWQFdVjdI=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=a4is0tgKpzG7JxGdJwUIH6v5cLD7dk4TAY5D5RvQNLrgo4s0KlxYuAt5NhX07XmTMZry2Xyk6IfW73mopjDFYmofa76UDQj9bNo6JbQ8fZ8kkm9mIjE6kkNCHJcS8IijPAQi2lZ+qsbWPh/NUlhW58p52X52GRV9OzD+F0ZItE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SYlPS5q7; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSkK/NOCkfAQa0LT54sazMdVToZ9/4KUJyPd19MDPJmDUdbD4xQMjoDu5iZlnQxNvlFDNfaQfwOxz0yRkro4Hv9ufKwXt0qD5aRQ1Q/6/VEXTbCLaLaF/Gv85iYvZ6SpiHj0RyM/DgBdw6AqnJHy/Khu38FiRUN1Z7yMDhNES1mSjqTZpVCqKng+04eDI9o4CUYp0mJISsNqItIxVvr2+IOonbjRPHuOMylhKr/jUTLDBrQCiBnW2XAAH32hUTqHiync7S4l1vOIJoLSIJisAmhtWCDCbT0xQZ0Y5Ke981/D/e3nW0daAtZf4b4KC+FT3I4MxoZlbrqcvZc7Fb3XtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuN/G2UFHSQ0wQpcJM2cGoeU9jF/zohRN5eAuAHSukk=;
 b=XLoeGWGjFOIAgOgCikPPr+g6sCKvCjljLMAihcTbXGQyfzi3QzSVS4YW7STqi5q8JYOPH9E0WERcwHuIl9cbtXz67sNcBoJEeOkXz5yePCHC0W5EsxXE+lnm65jJGTaqMsEeBIhcTR3alw+wRUZU2VJnV2JnehaNpelNfH68y36/6lR+7cwOfStA8uCVmevqeUUSfflmMeAOfM8OvAcKd8aAbWJ20WcsPixV562TIa3spRKMxw1TSsHatW8Gti++J7p9e0WIS+dKuO8QJBEBqRPpzvgFa7JPIv4ZkivKwssBORsrwUupeDHVFXuNd4zcaotdMCwt8tcH4z3fvPntug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuN/G2UFHSQ0wQpcJM2cGoeU9jF/zohRN5eAuAHSukk=;
 b=SYlPS5q7HRMBPyZrVMmEhfilFaXaNk1z1H9UudN5VZEuohKtsqL2Z8xV3meB3Zpi053j9N9oSi70CYBsRGe5O9O9FpfYgnmFo2J8dqTUiWSdh0RPo1y8Fk9Lu2vTmxRCQvY5Ts7CuroVJnEG5HQGfdJ4EpSf46599Hkd4dEqS6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13679.jpnprd01.prod.outlook.com
 (2603:1096:604:380::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 04:32:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 04:32:05 +0000
Message-ID: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/3] mailbox: renesas: Support MFIS mailbox driver
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 04:32:04 +0000
X-ClientProxiedBy: TY4P286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13679:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fd44c6-863c-414d-a5fa-08de15daf291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DlmSyBl00qkLX9DiEfMJcIBE5arwqfDepzOdKgNoKB95J1/C+Q9k14sq1v8y?=
 =?us-ascii?Q?iTE1na/a55kEIr589+LY1MDmmrj7RfP9bq0ga/QO7AaoQu91/++1ncbca65Z?=
 =?us-ascii?Q?7mQuJObbAvHaXJw+rnRsUvAL367J0/eK4mlmGB9KBmuh550SwU/JPc0YT9nK?=
 =?us-ascii?Q?ZZvqXFka0o/FS2g7BPksx9uG7t63oYUGlzopjNO14xq4pdK/xtBpdhC2Zkr2?=
 =?us-ascii?Q?MH6AyxqKoqSs9JUOV4nN8ANNFZffGQJWVDpMsDWpaylqjCLLJV+D+nZ9me2u?=
 =?us-ascii?Q?iRXvuh6y3dhwpsejxNB3MjZhR1Y5rbzSDH0h12q65Iw5zZGIV6v2lFVwjNDh?=
 =?us-ascii?Q?Piov6qs0zjOyptW3OxPbn8UiWfRwmSidGCan8VCGcqFOU8/KO9o9MTordnmk?=
 =?us-ascii?Q?bUE9GEO3HcF1JAr1ZD2DEi8HN/NEFGLYCGh34y1ilDU/4Fa3lwIHljIA4I8t?=
 =?us-ascii?Q?NT999n2TVNbUTs2Vlvh3t8oAhW74wAIKB7l6YQwS5ClZk+v7JbC4yh9u+sXc?=
 =?us-ascii?Q?m+SPApqcaYFNlA/ABZS7K2S6cJVDrNWivIqwskwzI2jwaRh6aUqQHE1O6I06?=
 =?us-ascii?Q?8O7LKqG0BBZStu99J+6Ew2VBwyxE/SzdsKWqE96/0l+8mgg8E8gCj5wh0kLu?=
 =?us-ascii?Q?wkUByGPhijqq8Cm2xCuaYVCzL5JBjQKMZg+DlPObP5HKch/vgQTG2KciQ/mT?=
 =?us-ascii?Q?hO/2KG4n8FUEVLXz56+MpZAftJpche+2Dp60cf4RNVMUgkwRqtr819N0A9+p?=
 =?us-ascii?Q?J/QZUUuqCJc2VwB7F/yZwURX+EFtdtn+6z8t/svvBgRUNbWP41jEGMgIvNB5?=
 =?us-ascii?Q?xGeiXhIJu1pYfB1RUhDSHk6/f0nLM+AvYhpktJEyFyKIe4n3Ul45jeNnbnKr?=
 =?us-ascii?Q?dW0eGQQOhCOYHNyfdMoBTYPK2Ad4uNBG1CXlG08M7JCOmGj3yh2QSx+jlW4L?=
 =?us-ascii?Q?JvC4iGxJnCHRgjpB/Z7WR676PrjxxqZhZDmHBtKbtlCMx0Kb7VToL0BmTzNu?=
 =?us-ascii?Q?6yoKKVLXHlh60ylC4EOrmUDaFgo/d3w7wATy1pn2dzHiOxSOTH657v6cXZhO?=
 =?us-ascii?Q?0JyysL0MjlL5Zqxl6cNh1hSks2T8ZrY4Bce7LBPytjD56S9qOC9IAPZ1CsoL?=
 =?us-ascii?Q?42zqgi9ztga3IQe4WDnveOlC4O7IY9xQKnRr2RXszMK+whLhZwY0GcD2gvfj?=
 =?us-ascii?Q?Tlsg3nHc/gP6fAXaw9WZEbFxijCAldxcR3doar/pv1H1ltxihWnu7Bpf4Ohq?=
 =?us-ascii?Q?tFw73hmoqAIdvX+X1yqJjSCAacnRjpF5vLDN6iBs0dQgZLo7+1b2bISx6CZA?=
 =?us-ascii?Q?/3gGmeiSA+ZNqY8s2X0xJxc67hiO1rkLhPr+jQPUh/yG3DcRioU8bk0+yKz+?=
 =?us-ascii?Q?W7wTFn3vi2nNWefG3S5MXtrEahRhMmWFk1fNnreo0lKnpACKCSBpYM+2OYuv?=
 =?us-ascii?Q?NoWs0SXTwgLJnk8N826KEDBVe46TvmMEeG/LV8ChLM34DRVfAr4zxddTkAN4?=
 =?us-ascii?Q?9HpboAd5jH2752AYQoWz499ckOEazZNRf5r2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVlF/dLai1kyyE2Ea9ChoR3pXNCWp73ZGE7zjWDOHHB5nK3QQ8ENZTdHFjch?=
 =?us-ascii?Q?TUMviDGuuRMSSWCpbuEdN/hIdTcX1XGKWri5h2HaVQE41iw5Mq2zbJoz6JOw?=
 =?us-ascii?Q?bmd8R5/SA93EVHQCwVSNso+S9ZnvduE9JFYictplifh+PMYdp2BdapuYdy3p?=
 =?us-ascii?Q?GeBZMR4rA+val0bzLjONMqmiFPx7a7tZcAXOQ8DzdQqvtnjLWXTv7jF9PqAQ?=
 =?us-ascii?Q?NpD1Phc/rC5hYT+/V98U/2qVom3qDbG3FThh4Ln5BIwf3l7c0bqpStonIn/s?=
 =?us-ascii?Q?AojmjD7BoqJqw/7+1Zi+P7nyFiK6ojNPKRAA3hhyLd9Evx/R3Y6y8NVurG+u?=
 =?us-ascii?Q?qJ585PohNKqVev72gShdDJwp/0NQQHgXFAjIqVpnsnHFH0/g2ZUsA190yC0s?=
 =?us-ascii?Q?XhL4e39dYCwV+jrW3cn+dt0yoy91UYOXJfu4/LpILPw/P+0j/dsVTk46dI4w?=
 =?us-ascii?Q?JvnVn3Kx+xBXsSJTIWmS7Qu4sc0CNU4dsxCr3QQk+EtnQGyZmm612LIS3dFe?=
 =?us-ascii?Q?U2NUTwVNUbAW6p1RQo5dMiYG90dnFZC+gtDDlHPBeRV0K4tges5rkxqidbmy?=
 =?us-ascii?Q?vLLZyCbjQyljdwIlqeIFvoTHswEajuQD8qXHJeykFkHwc7uTfMFTBj+dqkRh?=
 =?us-ascii?Q?aW9LzjzCPR/gG/aQVHoEpKgcmvmLzsnDIzhNkY5cVoQFTpMBTtobs3g/kdi5?=
 =?us-ascii?Q?muNuFqhId1MEuay5s2OEpAY0/ojZ9lk8EVV1xZvq1Gf+4a45CK8rVJuHSIj8?=
 =?us-ascii?Q?X+jldg1D53etVliV39IponMJ59xGHhm0YsZ97pdCDhkNtD5hMHyFzCWkxwD5?=
 =?us-ascii?Q?BmES71mTlYVVdK2Bsr4z5qfcmrHRyLiLNj0aSTyyXCehIJLo0X9K9672C25o?=
 =?us-ascii?Q?9nHk8Q4QPQxUjjcdCgRzyFzfHOhtyma8KlgElVrmcUqKyxsKisXJdIX1WOch?=
 =?us-ascii?Q?tP+qFP5gGZ3gzvm1UKpyllJjJ7FD619mQymi7PqIkiBXp5fiB9d8cDQ/uHtl?=
 =?us-ascii?Q?n13+I3BHMQRasiGFXjYXg4P22BLQ5UfnujoL+ecXz4Jce+fJ/IDQ0H8KJEYy?=
 =?us-ascii?Q?0AAxPv53okD0oYZ4IcsscCmfT1QSn6ryPpq08srydQFJPHW0Hxlj8wAEbz2B?=
 =?us-ascii?Q?y/yoFcER7iOlHYgweu9clCjFDADno5T4h9+Z9fpgHTbTPtNz6mtqaEHMpglD?=
 =?us-ascii?Q?NDVhLSDLXX1PrpoctsTo6XwCv4bddS2151ZbiUtEb1x2LRRVMzFC/qOCeMwN?=
 =?us-ascii?Q?YS4SFM7iBgcpUpM98g3bIL4T6ol2lfXEjlNjbVYzgFu2W4zD0kGvIOI//POn?=
 =?us-ascii?Q?zd67tE6DCk+vTAuZcXeyz+5zwtjizh0zyclW2Vhc7yRpz9sace3xvV0yOBC4?=
 =?us-ascii?Q?1YPnSTT06Nt2Z0GVapLHrb/53kYvE08nTn/nV5YB4N74KOeHhHnCb5AxYGgQ?=
 =?us-ascii?Q?Mghr4ufvffhXyuetqH8AtWwHw+nzHwy46IJYnmu980/M6OcrybQ+5mDzb068?=
 =?us-ascii?Q?QjOkkht4vKHeUNlpGvttjgUYxWUMJ5Y1nQwV6tQiKHd3jeAeCCh2RDml/mUk?=
 =?us-ascii?Q?EFft+RV3gJH15Z3WuQQowMZCdKbj8hYsabF518CpC1S3i0XQpCPe1LiiEive?=
 =?us-ascii?Q?sdf8FSrnD/bq7aPR73UGEKI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fd44c6-863c-414d-a5fa-08de15daf291
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 04:32:05.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdcisRlMr6hcqNiBWRIosg5ywMw+xNkEnPWUSDA+BDajFjRufQBexofwHspdsuae4VfZOvYR0aw6XOyi2lq0qWagTJs0lnAua0Q/OiJSuM4YR5vxelJoDvN7jcDWd18Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13679


Hi

This patch-set adds Renesas MFIS Mailbox driver.
[PATCH 1/3] is cleanup patch for Kconfig

v1 -> v2
 - Add Geert's Reviewed-by [1/3]
 - Add COMPILE_TEST on Kconfig [2/3]
 - Remov unneeded dev_err() [2/3]
 - Remov unneeded dev_info() [2/3]
 - Call request_irq() at probe() [2/3]
 - Add new struct mfis_priv and handle chan info [2/3]
 - Add/use spinlock [2/3]
 - Remove comma from sentinel [2/3]
 - Update Kconfig help [2/3]
 - Remove comment for resiter settings [2/3]
 - Rename compatible "renesas,mfis-mbox" -> "rcar,mfis-mailbox" [3/3]
 - Tidyup title [3/3]
 - Remove | [3/3]
 - Remove redundant description [3/3]

Link: https://lore.kernel.org/r/87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (3):
  mailbox: remove unneeded double quotation
  mailbox: renesas: Support MFIS mailbox driver
  dt-bindings: mailbox: Add Renesas MFIS Mailbox

 .../bindings/mailbox/rcar,mfis-mailbox.yaml   |  51 ++++++
 drivers/mailbox/Kconfig                       |  11 +-
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/rcar-mfis-mailbox.c           | 170 ++++++++++++++++++
 4 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/rcar,mfis-mailbox.yaml
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c

-- 
2.43.0


