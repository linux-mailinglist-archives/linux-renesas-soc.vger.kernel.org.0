Return-Path: <linux-renesas-soc+bounces-23563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E3C047CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 698C34F547B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 06:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE2F2727E2;
	Fri, 24 Oct 2025 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aJvMYKVH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197126E71F;
	Fri, 24 Oct 2025 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286931; cv=fail; b=biB0hGV16/klxvbfw6nm5C1xPdkb3REr6kwN/T9nI2NVPQqnizMz8B3g61KsvOs4kA7GCjS0DJioc7FWszR6Mcpl4da+7m0WjYN7XcbmQpl3Q42EU57oSku2oeoPg8dA0hrzEgmFagIgVpFWkte03K/TSERSKPHkcF1QegN0jss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286931; c=relaxed/simple;
	bh=o0uRMN9MIPpOipOQlBFFL8T7eQEiLRoKgFOKJAZKb18=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=U0W6TsK2IWx/umz5DKoS9eqwTLeFyFFzwtf33VbStfzONBy1+Yw+fkJ6TlNoSlgvjVvIvmkltFaryNePvph4pGp+Xv3jz9uEwON1TKoWVqufMChIXTB4yoXWn040IYVoDFIYcPNQlMkYZ7ddgPFoWxL9dpAxdZIjHDdpgGocrAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aJvMYKVH; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK9/DNbMrtXJfHmRcv+RqekSoUjypVsicC2CCNkdjLuRcfas3ogybKzLoNV6SWlQrMI+uIWvtNpgOACzMZPIUUAVY9A4pHiPtVvYxnwmOUoDH6jyd9PjSCnosVAa14I02gBDWUPTzHhq3pzG4+XwjDGqVTnmiZv/Xc1U6tRViC0RZNAd7bZb9zM8wmaWuSC/GLApDT7w9vmmnuyVPn4uLQbnYASTxuCQC3ocl9Jbpuv3MurzSMhx7js6uAziZI+L3MRt0VkGrXQPvMCcYgJHsWREbPb6wMUQiUFdLKiRCq7OkfDv81hOFeRzZwYl/q4f/WpLYDlOo8NqcGpxi0wubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPUWFi5W/wC0LI6w44z2/ooY3KDhS/qTMvH6yaOBSww=;
 b=XL8/seJO/XKIbt03jo8htXiJWn18gDJmyDH8lOaAz1gOYlv7SfN3alr/GujLzqsHuzwpSKXrUgnLX9Wd4Qn9R/qEMTmHnT5cR619DI8AgErxvlB98iDAjQyHYrU0DL6bcr0V3dNwGXgg/WAH5Ndb85D5elYVm7pzbfcyFoSkF9TZiMNa6D7+/23maM5tYRtVi4I/ro48xq+HyZ7cdmGNk1zKPnw/sii/Ho752oEGV6ASKWdC9E/hA6FIAu7PV+qLkY8ARnbbE7dZjMpXkUbYdPoENcwxsNON115xpmYrw7gWW02jE16KDgb4faw71KhdEkTotcghBQiQWpE9021CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPUWFi5W/wC0LI6w44z2/ooY3KDhS/qTMvH6yaOBSww=;
 b=aJvMYKVH3FlDcm4l1fMvhmykgWkbvNX5KIf/E8dU6elMPhDirfLxR8pp+KizBdXfxzc95VjFy2QANPiX9zTEibAHgAr2mXzW9AioNoqpUEHriwILkUYrVlGDzsJda+8Z2tKa+OLKsG4Z0bSebOEXFNxY90FHzme263yFIT9ez94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10774.jpnprd01.prod.outlook.com
 (2603:1096:400:2a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:22:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:22:04 +0000
Message-ID: <87ecqsn7jo.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] mailbox: remove unneeded double quotation
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 24 Oct 2025 06:22:03 +0000
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ff5830-e3b8-4027-1164-08de12c5a647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VPh7z3LwT0KZ4NwTCGeF291t/g6pC44h520K6IsbbumkGDKIkLz3gBiobnSo?=
 =?us-ascii?Q?1I5uhFDvrzoXuVeNusRjkYLdteYJRsd4taKimttEYlYE6GXGELimrBiZEgh6?=
 =?us-ascii?Q?orH05MeeGZYX0HCLwgIVyYbYJfk5EAMk9kBpP1zZhb1jm81qTZtizzsX04gK?=
 =?us-ascii?Q?sHR2S3WXcYiMNsj4SmrSGCC3LvZfM968/FGSAyKzf850jmNRAxP40WBSq+kW?=
 =?us-ascii?Q?lUiPAtncw4AY7pl05z1WmWi+YjuJelPcBjhVxv9ETS8r+xMAfdj++Sgir3Xo?=
 =?us-ascii?Q?sMIs4moFST8REFfR8L5bMJKQsmTGyjxlkRfzHWD1dMUt/wT7qs17luQaVtzr?=
 =?us-ascii?Q?6sepi30wtbt2AdpUYhqXX0/pcU+mIImDmbUzb2EzPV627qh3pH/nVbPexDiF?=
 =?us-ascii?Q?nWDGNvcpZ93ZNNJrRD31o5VrjIXtdrN1yydaJipxJPhc0HcGhvHjgk4K0zKv?=
 =?us-ascii?Q?j8dShhOlT2P63bX6XFFwOiOQkyjeqJP65bxo2c8ZNWM9w4xrGBeuBg+FiAsO?=
 =?us-ascii?Q?SPrO1Pd7jLV6HFtndLmCwwC4f7ImlYCfIS7QwzeTGsqh3onmvBhtdG92kEMp?=
 =?us-ascii?Q?A4BYl4b1Q+hHp+ixXNjt3ZA9NUSh2bw/7Z9UmyuEMn1ZKyIgywLvGtPVax7F?=
 =?us-ascii?Q?qlhihkkmsI6nan3p23WvWEwLlm0sJJDVnByEf0540op5yxk4PtoN8qWmKg30?=
 =?us-ascii?Q?fwD9yQXb/kvvfUsQ0ytliNzx/FdCraYDrpBRQ0l1/fBMBZSTM3FbpvFjxER7?=
 =?us-ascii?Q?YgYSQ0dmIxEMg1xed2gclmRti8xHcQ2qEIQVWnFt5y937wb8a4Wj59z4aaY/?=
 =?us-ascii?Q?q/XT6Bsjc4nSWUx8aasYjsO5T0j6WC9Bm/K4tgTtiPf3pF9PMMOs+h+YZ/BV?=
 =?us-ascii?Q?2j1m5dee/+cuWoK+du/DPPfUmsrPU6eZissy1zU6kl++2MqdsX6wTQfuIi9W?=
 =?us-ascii?Q?jhgDAnpnNau72MRXfp1dcPNcZNIcvT/ecIcSH433phZLsef3vAPYWyxVwa6s?=
 =?us-ascii?Q?UFe9B33WkyKU6q3LfrVt4wwDTq3ijG4vmH91TQ3A90sV7M1lzM9FgXzmw3eY?=
 =?us-ascii?Q?FuMKgpTVv1JJ+ek8fK37jbvLDvZRODdoa8OI6e5OaQIIr++hvK75IzF6YR4N?=
 =?us-ascii?Q?b74YQX5DjnvJV61KbFdn71k9beVm3jgKexbNN5dWIAANs9hjmZ4992TmsBMr?=
 =?us-ascii?Q?D71hscCbbRTqlqWLJESpVfwae1RiOgLL1be0P0Z/ULlt+pCd4fuAhvcXfkpF?=
 =?us-ascii?Q?Qfh9S6GIfVdvRIxiykQGkYnzAu6pX7IyokbNJGCxWHUJT1vmQ4ewQ6577FxS?=
 =?us-ascii?Q?t2XbJuwfjnjY6Zk9IT3DkJ8zQw3MdoAL4akvnlXPk1DiVifk+RWpepsp+4pD?=
 =?us-ascii?Q?kuoBIuW4ywXixQ/t34ZZcuqpSH7GwLfwh2NDAF/S0UdJ9VeALHJgChmlUEOG?=
 =?us-ascii?Q?0bTgbGwAWpKPnbGAVdvbSDdQhZ1RLhjmliux9oyL6DA/r4rk9Z1zAA0vVwm1?=
 =?us-ascii?Q?UlPYrtwCKue+4wUG3kW+oa6rioWpPLvjbxIh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q8Y6pXuxRBtb1tzYzCJ1FOzZpzHpAOiAijEzMS9nu9Cnke9cuGw7tZ35e4Lv?=
 =?us-ascii?Q?u/jKZPRBJLgKUqyR7q9VJI4gSHMrI8gAsAL9BX4ltS5RB7skZXS7mh/gOgWg?=
 =?us-ascii?Q?9NZIHsNvKlw2cEAOYfFOBBu5jwDnU4L8MHh1EmOEu5zzf3rTGMH5vkZoCSLp?=
 =?us-ascii?Q?PTzz6S2XD2Iqu68TpQG9McPpl02x4ntErYaU+crl4g4dyqmU05w3O06NYARs?=
 =?us-ascii?Q?NBlEQIzAi6ScaWXkHlih1edAWl/rYRLb8hiQKRV+K9IknO4yuXk6UsSpPuF/?=
 =?us-ascii?Q?LkKpWxQu+ge94A7OYWNCoVprdvXEYAm/fGO/5a/bPkE4voQZY+LuQ6kzD3AQ?=
 =?us-ascii?Q?6Fy07mHIicNIEczdPuRpd1wKvHF++YUf0YsN7Q5nrI5H1OYbuQNQqCU/yQfe?=
 =?us-ascii?Q?aKYpbeQpJhDmu45nFbKmTzDU/pvqT7NcI40SCiTsH6VE2CkczDcqcgcTpQwv?=
 =?us-ascii?Q?WkjU6z7xnAa1EdB9kXN4NF6eBYbvs/cW6hMTypNzDIjsnR/CpMweSTqq6QYw?=
 =?us-ascii?Q?q2u0ivu4os1Kr64C6jSRPMbalusHh+7FRpSHcO6AtPjGU5chjMvmf6KZ2bAE?=
 =?us-ascii?Q?wJ4YBlaU2o+h8oW7QSAhJ7wVxFdOhUUWBUJ+9kLOR13LtaECgMirBisv9rph?=
 =?us-ascii?Q?VQoNBpu/Zd8e+2fCz889bjtgUwehE3BsAZ0QH0z2cUXv9GTtWPmqH83+X1JB?=
 =?us-ascii?Q?827+eLCBqluRORS2snbJk9uKduqCoT+FrL09S1sGD9dh19yvbcInQW5EldPZ?=
 =?us-ascii?Q?Mg524aNqGa4Pcv0nnaZ2ceol0ZzHYM3/5LP47LcukzGyC+fCjMhXwwYCimvW?=
 =?us-ascii?Q?8aS1gt6vOnM8/50Vz5UtLDon/88qBeOaruSXSE/t0Avm6TlyID0yYzDmy+aT?=
 =?us-ascii?Q?MS2HH6Oi8V0cambfG5jguZSDnhizH3HVQKZqDWL3NpAbDVY7s4D8fCAEe/vR?=
 =?us-ascii?Q?wGamx8rmjZByFQZ/Q7Jdw6hxsp1Cxyd/or2TEozsTRqyzyYJWx2XE+2XnMwK?=
 =?us-ascii?Q?cBC5clIwjJZj/OjbBWIjDnF0KCN7I9skmxpLIy/QDYw8i3fHlRe+pSZGH65H?=
 =?us-ascii?Q?CfMUGZIWRJtX2vU9NYyHOnvuhYwCPlcUo/6c14jG5R0HwZVzetQ6ImIKhGAo?=
 =?us-ascii?Q?TtasEQppRcdgIaXfIGLzA1KHhg/jUmCTBy3lFE25JeHJMGM/WD3fi10WVvbz?=
 =?us-ascii?Q?npFzAOPsrMmdRTZfYyldOVPbiHnpWe+4OplVlpVS+OCEKv53CAGz1+iIOJbO?=
 =?us-ascii?Q?vzmSogvt75MbpQx0EjkkFY2f0LBtknYMKGpyjOspwlD2ob49fSe2rLtRWAXL?=
 =?us-ascii?Q?e57Qb6ngvHws+WlCoRLvu0235G3wmMlqkr91IRfk+VgH26nsZ49HV+nv2SFJ?=
 =?us-ascii?Q?MqlXPamPzwykAfi14IxpcxSOF/lY/0a7PzIej/UUDo/rZKKV/dcY6HVm96B4?=
 =?us-ascii?Q?Ea4kilUWvaylpQvEl7k+dftJ0FKQl9kcDeUEDWHKtC0FCRx5+sSLNwqnpCSv?=
 =?us-ascii?Q?jeM2LHLFylY8PFxoZEZaNwfJgwd3nqI8rbpMlwguFQrgKfF5QmWhm1HGHJNd?=
 =?us-ascii?Q?lXPd3FjY1tXnGa535RtrWThji0NrdFRzHyAbZOK98rSTRYe6W15RgTyw9NvH?=
 =?us-ascii?Q?0PEgUQM1hlN3OAekbiO7QUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ff5830-e3b8-4027-1164-08de12c5a647
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:22:04.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OEJ0SfYXYglfDfOwCc8ZVzscLIA0AXWypg4qSMsyf8h0HNNgk6HRzZt2stjYwwLA0RmFrLHyJOh1y36yEj8WqXTPPeD+eQA9m9umqBwayMv0DrH31GsgY6DhvEFbYLE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10774

It makes Kconfig strange. fix it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 29f16f220384f..e47cb68989267 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -279,7 +279,7 @@ config MTK_ADSP_MBOX
 	tristate "MediaTek ADSP Mailbox Controller"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
-          Say yes here to add support for "MediaTek ADSP Mailbox Controller.
+          Say yes here to add support for MediaTek ADSP Mailbox Controller.
           This mailbox driver is used to send notification or short message
           between processors with ADSP. It will place the message to share
 	  buffer and will access the ipc control.
-- 
2.43.0


