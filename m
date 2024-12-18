Return-Path: <linux-renesas-soc+bounces-11502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3869F5B79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 01:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C760616B414
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14A18E2A;
	Wed, 18 Dec 2024 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I3xjbLnL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D7849C;
	Wed, 18 Dec 2024 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481850; cv=fail; b=cvEGl9WGZrH9csmGiK7C3GXhpFIEkkQEIOamQy61zjmpKoXeTEnb8QwhVuib05jcdNJoPz3aD9DmkNNcUGxKdne4lgK2FfqBAPdRgFDahaPv1AykeVGnpgk/Yn2XFuZobuBBx3rF/+nNPxRiXuHN6IeK9Vu6b/SNVjkXsIaEG7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481850; c=relaxed/simple;
	bh=9g33t2u0T2nbAVavyy04fpZRI8rKrcHonOe/4jO77uw=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=Baab9+yZNDrroarsF+vohiLWRVgAcnxfoGeniooLa7AZoJUj2H3Ppk+9FarkX2Lu05FC6aIJ28QeX4zmhrjhKC700drYLZkQ2pRrnhl9w7biP9n2bPLtKERoaiETuSZdDvAIkS5kp9QmcQNoqb5Ss7WOqqsfNyWsGd2Riy812qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I3xjbLnL; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MR8ZShdeh/GIAH8rsdcE+Nx52iglXlq2gYlW1900RIxjy/DXXdoUijyU17inHPm/vxYRNVDiNSJBoOIcnxUmR5GtRTUqx4DHgy/26evQGcWfmoLqctqyav/ADeJm78Pj/EpSaiuTfYPPwAId3Rd6iEpdev3QhEPn+glc6QP86IYaFlkzR+UuudRVkXL7VQQ9QsILi3+sPoJV0S2pNQ27ak2W3gPq96ehJ/f2tFrifBLvI+So65mCctuoRZQXme5UdNY+zfo1ETUQ6NT9nRxFxI8wCv3w+R8J4Fnfyd46KY8qCugWZdTSR7N/L+k6ESEjOCEWsSXHCLTPkYu0+x1Rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1F9cbuws6hj+Vi4pJiN63W2iuV2akzNwTMOMgB3ClQ=;
 b=F6vBOBSIpAhbOp4YgZh4SyILhPNWbPglZH3tIoXfsfMLYNiCyESxCBfOdUZxIaUdeywvJbYIQYZxJQzBjuDCkRwMlOIy5m5tzWvzfP4a3V/WXfU5n+acHv7wOeHSnuivD4ECV8ao6OXCe7ZidvtjSQs1Q+lDKj5soDTD3BqJXhtPmb9Zk965jMxdrd3zEUinNlvHCj3YQKnTgY20NDpw5mXlHpkZUyqVJdQR8rhp8YcgciSqADKBm5Zsjvh8EvisW3C0W8iAdd78Og9DTGSqEgGmIIGgB73xfVIH7lA9rsyxu2Hz4BIbYEIN2oinzFnARqUXfpvtbxtUtBDYDlkmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1F9cbuws6hj+Vi4pJiN63W2iuV2akzNwTMOMgB3ClQ=;
 b=I3xjbLnLwjiRSXpu9oxXAKfcrsZxinEyfMK+At4RNNWk+PIW57ewaeBszcxkw+4FOVl0csiKDYdhjFSfDLK9VEhd335DNvdFhkJJflJtf6dm4vxdz4tVFBE8V3jCPIKLK1P6QIZQsx3N1NkcgP9ex4IfPZ64GfGVSqEL6dhDZLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13749.jpnprd01.prod.outlook.com
 (2603:1096:405:201::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 00:30:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 00:30:43 +0000
Message-ID: <87ikrhrfws.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Dec 2024 00:30:43 +0000
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13749:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d15f709-14cd-4924-6ca2-08dd1efb3557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F6pc7M9PI3LiEqx79oMUbgZLnw8ZfTssH0RPkI8/Ioy96TOwFh5BBmMMNeHc?=
 =?us-ascii?Q?aYD89hYrq8yNVVkkCR7gdF08wIbiJtEtxj7wXp9NCpz098N9KXDD8Pl7bxgZ?=
 =?us-ascii?Q?zENr49CDuat/dmxoeUXMAVukZSFM4Q7b9qYD6NIR5mqTRdiNimxjvQR9vFKN?=
 =?us-ascii?Q?SkHfnOxslMf0Gr6XgkPPLEvP2SHmkulU6Wxax5Df2rZx58LV0SkU7OzoyR1l?=
 =?us-ascii?Q?Nly4KZzUauzQhpWVnqxFDtaHzb1SESeNKT5nzI0Y3esXZ3jr6FHfRbswEvUK?=
 =?us-ascii?Q?k0yKxQl4ZcMO3ecYOec4Wp0YXkERvBDUNBqwj2pXPUAH83ZVdWZCtxqt6s0B?=
 =?us-ascii?Q?Mh+KXAta/gl3kQkeswIINWN8qnhcw3XLa1IE2wj/JoxsBUAX1j0GfFDJ7gH6?=
 =?us-ascii?Q?JYR8wPDp68tZ0FxMCuyR91qBMW8H5k8pSuV2vAWRhTiepjA3Iww2XaPLDLQM?=
 =?us-ascii?Q?x2otc++QEyaTVZ7C95uFlAAMqkwvgmsNBFqR4v1Ikuascqjo12LMXUNgH+vL?=
 =?us-ascii?Q?D9vEqt2IVfvdJ0el4Eq7is+dMXzLIzuQKE92rfyhzFbLdKFsr2iotVVsYmyo?=
 =?us-ascii?Q?YXNhpeVsQcEvvjLFD2xlC6ofDYOr4yNtXHQDc+uNQLid1j7Wyhj4Dl9YbItT?=
 =?us-ascii?Q?ynjeOi+I34slyDayjtfNjhS2yM/sTJeINtmpY9cmJeTiwpGrTZzvNy9b3wSI?=
 =?us-ascii?Q?1xWMhN1hBB8aVCVThS//ofUOmMbqT2wYl1VXYaQIod9Uk5JhfVIbzNSVZvQs?=
 =?us-ascii?Q?XESdkAPl34GIpE1IuYWrVcNg1SlmAYzwwcIp3gacf/THOoDkFGjFNCJcABCr?=
 =?us-ascii?Q?wlWv9xwFVLiZRMmbJK166n+4nA91nc+6MAfIP+B4RPuaE5nLSycQNGU1rNeG?=
 =?us-ascii?Q?85pIvZT7Ihx3ulCg7d+ojVeSdZtyubGxtnp5sltLdWyjjHFXQZmZBdCip2Mc?=
 =?us-ascii?Q?Cs7I3nvrwWgHNWg+sEZuk/rjhk82EPCok8BtoBT4ZY/M788uy8LUvfAtwueX?=
 =?us-ascii?Q?QWTbxDAj7wn22jwymWnTb+DemtYXozsIbI/GV3bAfYC3IqcyyE0h0cVoWa5M?=
 =?us-ascii?Q?+ozSvbndKKQPz3x4T0sjRq7ry64GjHFPTnCGC4oqWQFJSDRALQaH5XbHe8lZ?=
 =?us-ascii?Q?DDuElZGEHT5ILTdXXHho7tSfeBr6GDIOrZnPut+hy5t47/ncXH7OHihqPLDK?=
 =?us-ascii?Q?wXm6OWQTtaC8zOOCQtrQrhBIXH2NFwyRQhISZfaF+Y50pnNE5it1W35L4MkW?=
 =?us-ascii?Q?yRscbV4eCuDPdwgwl6oUPBZgXgqGmTYF612TwRJXCrG930qyy6Jo0SANNBXa?=
 =?us-ascii?Q?B5AM9akiuiCEiiu9UqKVs+aYnDcqpLSOSroSmiUFw/3k0/HCvodWBdBZidZP?=
 =?us-ascii?Q?XUdmcny0BEzMxt9D4KM1ZO5zHOs5eCaMCdoSKaZQEgMRskoptY6sM2cPS6Hm?=
 =?us-ascii?Q?KmgPj+tCfmBXs5ej1Uwg3Mqpb7bhuObv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GbZy+Mx3OY1wvaBqSknrJr05FjXr1GPyMjV1sj/gRqDRD9PFJhq2hHuy61c8?=
 =?us-ascii?Q?9tKVXscM4P7//74nUgyCChGfrVt9fn3y4n1lBvQpdw1kZ1pZ/1AWBVh6VkmI?=
 =?us-ascii?Q?MghsHq1XJKCv9UHVYiTtTCpbTIKeojIEyVvRG4AB/8RKWaRc2oK2UYGOIKe0?=
 =?us-ascii?Q?/E3jriSu8wL7XHIo9fpla1SNikkKsGru4b8KfU/9SvGAudeLWDnAsqje05Nb?=
 =?us-ascii?Q?FWrg23vuT7tyL6TYn/ui9m9G+vT0+IJlH6PT8UUH0M04FR5fAudKCYmcPdCb?=
 =?us-ascii?Q?f4BBWHONc2M7QlBRqj2OIzhplHNKunbJZiCIPb2pP8vQ7S3sNeCm7SCwbn8Y?=
 =?us-ascii?Q?QJ7mfkXS2BIPtMvph45ZviYC2qCCKi74PoRwaTTCw3W6REjtarS+FbobtHH9?=
 =?us-ascii?Q?vXk04nQi8FvlWqra5dN/v7EnFVAhiPighNxQXtLLQ6QqpEo2nowrKaoRjvx4?=
 =?us-ascii?Q?z79XAXw1KeM893ZfXAENni6CvsNgXwPcHVIAwM8bWpNP/aczUW5wfa5gN3Wf?=
 =?us-ascii?Q?s20Zi07Ybm59PCPecnMSibiGLD/KTMwuAAcfY9Zu7MQYtT+VYN6rSE5Cr/83?=
 =?us-ascii?Q?VF26TJX7OLALN5ZZSM7aSSA0DQdnGaY6T0rfRRiTzF7PzM0KajrpgtsttElZ?=
 =?us-ascii?Q?M5StNtoSBIYta9u3BO5Yzz5RuZK7c+6+knHg7nKmnc7paFSz9XYfNs4q84wd?=
 =?us-ascii?Q?ivLqbW8IjaXfplaXXicgHK+/kZqIj30q69BcIcqlOmUa/v8oAYll2xD17ynm?=
 =?us-ascii?Q?BKmF8FRfoXuQIzMk9D1lZXdeDVxcbXPiB7TUhwyhZv398Izs0iBpm8R19yMw?=
 =?us-ascii?Q?I6QJ0ta/EtbLz8ZyqX7CzBwKOxgG8VVa80bZcBtJptITazYCgB32MAZJ5Utg?=
 =?us-ascii?Q?c4t1nDyAyh1n6qqau7jI0I7SIMAxqZBvlEMgpgDYmh5RjxGH4bU0+fphsnOb?=
 =?us-ascii?Q?0RP4LTtrdTUJouVyom3RYnt2ky8aZjOjkcCXdZ3ohFGbBJu63eKi0PuxcGJK?=
 =?us-ascii?Q?YGk5S4JDe0ymTWpMXmtbY+uLF5yMa/kVcMbiYSgIXCLxH736w+4LUMtRKfZ5?=
 =?us-ascii?Q?oGdr6LekFZIHIsDhgiUSzCXhPc+Z4kVWgUjeawQd2FzY37NNy/u3WGsu01+7?=
 =?us-ascii?Q?+q6mnICRJXw00OPNoy/5C3/66Z2a68LadKd9lvEHAYX3ycjdH2mDjEeL9JbA?=
 =?us-ascii?Q?2rFjlz+sRObThdTsxpPhKjaKDGEdRjzeGxP2Hz0qIWx2P+9Rbn0HF0l0M7NX?=
 =?us-ascii?Q?7Bbh73CQwM4J8v+yN/SGU3qjqSfmHUbSWqXRlj2FZShFKvkyW1AoR6EYxjDA?=
 =?us-ascii?Q?v5bOm/x44n/PLzKeC4tra/ltoQUy9uHQImpxL23OvZZ7WKrUHGEhqKYD5cNi?=
 =?us-ascii?Q?T4ZsI1YpUe8c70s750l9bWxljXCv5epjqFAfLGWN6NQMktBCkfbx9sEe/Kyn?=
 =?us-ascii?Q?w5hEeOPtl1yS3E9BbJmjNIphpqpQJF+HcS5Q79KPvhu3AV+zSUKTlDBzkfhd?=
 =?us-ascii?Q?WjSZ4K1FMISXjjDKThmaVl0SZIZtzKpmjX3XoDNzH6rEH+2pUq+k91Hl9EQv?=
 =?us-ascii?Q?IuYVZJrtXpjQV/6TN140UDlquERcnyOhHGsBWbGsb5asnoJZFyVMlA7H3ZlN?=
 =?us-ascii?Q?Q50dotRE96VWXAXRT//kSdQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d15f709-14cd-4924-6ca2-08dd1efb3557
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 00:30:43.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80mBbgRuaK/E4L6LnDvXn9aAnDR6QGnMBXcMXZR1tydyZcXxaRCsKCAKYBmWWTk1SR9jBayIFJIqxJ0M/Lp/Fm50NwVm8zyg4YX41r1GBTcXeK0aj18sSSZRPnl89DbX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13749

commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
longer need to use post-init-providers property to break fw_devlink cycle
(And no one is using it yet). Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v2 -> v3
	- tidyup missing DT maintainers
	- Remove Fixes: tag
v1 -> v2
	- add missing DT maintainers
	- Tidyup the git-log

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6d0d1514cd421..e8a2acb926460 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,12 +112,6 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
-  post-init-providers:
-    description: At least if rsnd is using DPCM connection on Audio-Graph-Card2,
-      fw_devlink might doesn't have enough information to break the cycle. rsnd
-      driver will not be probed in such case. Same problem might occur with
-      Multi-CPU/Codec or Codec2Codec.
-
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0


