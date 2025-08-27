Return-Path: <linux-renesas-soc+bounces-21001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8CB38F4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 01:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB639178AE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 23:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7AC301006;
	Wed, 27 Aug 2025 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lddqYjkA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4530CDA5;
	Wed, 27 Aug 2025 23:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756337661; cv=fail; b=DjGDe+YaBQtpvjePiYPzin4e4yQKzoENR04tC5MpGDut9ChVq4ncSZ3/n79b76jopbqw2VsOglrNytBU7t6Fq92jXUaawkQAlIttYvU3YfuINTFWPFNfZoH12rUA+tFIJzs8UsU/PJw89quP7HFLpb18TGIzoUMwOnbOaVK8WBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756337661; c=relaxed/simple;
	bh=YPnHC8CXGxEMUi6ZdqJPsULAmiCDG4R7wajIaaHeHds=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=J5NrNEUha1asWlaE5Fc6i4S+JUDhpvdgYkwITggrkODKTDKwQGp1CpEW/58Tkb4iZ+hS2CByAd7tDoigvAwvjHfTodgqZtTqafK+hTdFOGRcEyxML2IFOGtKWuxw60ENqRVPnB0Ksb6iVqLUFuMYSx+vdkuml9vN42A0NJNvsvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lddqYjkA; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN69rJLOCvgBzxcldUgpHVnCAdIs5XhwTW4wocfV7HNha29wtZbuUOtR6j15M0V+eX7rQnTd18yf4ipr9jHf9eLzFU0MQXhz1cPsGlo/pC4lBLMTiXnTLdZ6ASPYfhANGT6tnXcasKKe43WvpHcGZcYq2LV9NfaiSBMt2tqI7FjYvFPSuWPRs94a3VP0/ZPLrSDyHEuLNLT97GmNwmzMbTQw1h/tgw3jOCI5AuQitiDmPhnT4fQYkooG9H7VzbyG8iY+uaxFQS00kNNftbIKQFNb+4BsxdCEUAeOz5MeGGcvtY01esPH4A37xBLwsKkShiKVQh1Iqfd8PzdEPoWoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5ep/pTRnYcaRJ1pdvb5DbmU2qbxqjnafsW30yCtboc=;
 b=cRbDwqogZIkGn9V4OQGC/Zf/WNA4E1ROLP3LxARbQnS/BSoA+yVoX4WSXd5G75WIsockYyK/kIBDTcwh9JTiziXAJeka4zSb94oQWGfftuDojHQ9E9deJN8X2xMovRW3e1HnTOC8x81ImQdrgihr4Gq5Tg1oqNiyEmVZEh8nI7v3nmwVrEpD9LbzGDW/l9dlStb7pl2a8LH2Dt912Pi42TWCXeqSHzDXTB5/K0IoQnJX9PlpDPZZHq7VjVaYNKfBCbAnvkxIxZq69vpJ06HA2bBDriUGNcD2zauMv75+a5/9MHjc6dv/CEKG/tXkmp6S7Z5vOI2xsA5lOGeE/Tr3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5ep/pTRnYcaRJ1pdvb5DbmU2qbxqjnafsW30yCtboc=;
 b=lddqYjkA63WG8hIDK/1bb+WgtMVDvLsYVrfFIXgA3geBO/zYOOcXIp+MVkpHtNQd637LuZEEZQCehBB7Mtgew0a0HVIibErfq4gflI/OxAmtSsc8abrGEZ1HBbr3h3Xmy5Bsr3LRklehKXR5HMWeZ0bWrBrs0uAIHp1CeLgx/U4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB15988.jpnprd01.prod.outlook.com
 (2603:1096:604:3ec::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 23:34:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 23:34:09 +0000
Message-ID: <87ldn4uyof.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] dt-bindings: soc: renesas: Document R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 Aug 2025 23:34:09 +0000
X-ClientProxiedBy: TYWPR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB15988:EE_
X-MS-Office365-Filtering-Correlation-Id: 562a6731-f804-4648-4e8c-08dde5c23897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DIKne4R45UXGrAWC/u5W09pXTZyZ7GfWdFjO/kLtjOcUF0mB5hp56qFWkO/c?=
 =?us-ascii?Q?m1oAnstdqvdwhLr+d2g1ew3ozQkr0WczLxwoeBSvf1s4X/ueJXs4XzS+2eo+?=
 =?us-ascii?Q?Iy1q75e2KjDybySxGFWhzSfCrmnE5f1c7+8GA5ukMqttC78ulkArlztdEATw?=
 =?us-ascii?Q?3x6KsV3oQduB+vkYGqa0VZ+020yvvZ/41F5mZ7UAZNEjN98jwvNDSXS9zw/9?=
 =?us-ascii?Q?koE0kp6mwRlT8iN0qgwwZXGuOyjBnFRRLJWXl5s3FMc5pAJywXnMVIfR2sJp?=
 =?us-ascii?Q?4EHefrrG6tqtb3++gJ1zEO0314KGwg6MxCIg2713kh0UWT0r67qH5eMzm4eT?=
 =?us-ascii?Q?RUVUBxY5Wjm1zma0F3zm8YG1mQ84zP5NfZ24oM0t+FhKctSxRhyxSf237nwy?=
 =?us-ascii?Q?HtBedY4N4sbFWAZ5K7fu56OVkP27G0DBCIeczTuQIYYx96uCTUBVAFUFoOR/?=
 =?us-ascii?Q?3j+WbKC2kZyNeQ77pHELXgEbJZtvdGk0SmhYV8uKbS6gIKJ6RyzeKiA8aM/Y?=
 =?us-ascii?Q?x/9EGEH5k7nJKqcRnUSUaRtezToPayD3UFlyZxWOVrQ92Pm27zLM1Mgz8/An?=
 =?us-ascii?Q?HS1tVESVREiR+efIAEvSArNmlJHW/x821qjsxACaXzJx1qVnebNxKnHHtm2l?=
 =?us-ascii?Q?C0AeEqFTcFlL09HU1YmgcLZ0rIULfDrdOUq9hXZ1HM0AvKo17g8hAK4C/Pec?=
 =?us-ascii?Q?M2vJaQeivgxeDNO0+pr5BP03OBm0sMz0FpROtg1/z6s/hQGGRbEjioWfzwLn?=
 =?us-ascii?Q?clPqkTkCqAlFPedSGfDxfv8A6VORnJwo0J3QAAxOm1BvkuB3oCvnj4MwAjwV?=
 =?us-ascii?Q?WNBHISXPenGSgbaD71fCWKXr1hHaKEFVQ2KxVhl5MZrJNfvZ5WcMt5NqcPO/?=
 =?us-ascii?Q?uXx9o/OYn61JY/KvWbvhYBHnNQZMwLtD+WBXhqX+Y60xeZ+qhCgOFIoAUJpr?=
 =?us-ascii?Q?TjjMRIh27GhWNc+Vu6uThkknZ+WyoDPBL0gR29mPZWh1Rs6Vg2eSyaWXk6P/?=
 =?us-ascii?Q?MNU1pzExaa+jzDQkyABfg22ocGuMvgRVsUhRfdRpuABhpgUuubKNz+7ftGzS?=
 =?us-ascii?Q?pBUJQqGydkjmebhUGhXoReemMfyV1iw/eScxly53JnTMOuToJKmkgX7EuETk?=
 =?us-ascii?Q?FzKI1TSn7i614QQdIwtLYnxr8tPtw4F5kPI6+e5L0R/MoXaEJfWzkbnVqu0A?=
 =?us-ascii?Q?DwzzGcXLXk3rKBKVn0bamLjikzwORw0VsYEdTiTWV/IT+ZlNaZXk5M0w9mdh?=
 =?us-ascii?Q?9dkRKCmAN15DG54HaV0JcU5VzEzKm209CMlF32R7JX/Ejc5BoqKzbqZUcwJI?=
 =?us-ascii?Q?ewKu4DBfVClpnVyJFC+bTe9YkfKRWR9VqPhRvfxJR4fzg4FQY/iP+x1x4mP4?=
 =?us-ascii?Q?HUh8qOi+NiJik0CLs/MWVkrydf+FVKygIOghkmNjGzkzqoZldqqswHYeXJfa?=
 =?us-ascii?Q?t2LXhYjNcZ0DSibHyP658mlHK0M1o+qe2i0pGnr+RJYqU5w+NRqVhg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l6xhbGzWeBa98jMSY2qt8UEKQsf1Ozdrkwsn9sGday58QYjJ/b92UD6LF5Hb?=
 =?us-ascii?Q?shJyD5hx1QDRY9uvvR0R7Rw7S5XxnhBgOgMykj+4MT0eS3s5fk882HSR7oO6?=
 =?us-ascii?Q?4miCt0uShLg30ug9iLEfaSNNyk7zmmCPuXG859GHjimxuAEh5E4AYIBN9VDE?=
 =?us-ascii?Q?u5VLyiJOV4arwu1ZG9uDONshP4CjquDrv5fSPXUlakdwng3GKFzIK0GTvTe0?=
 =?us-ascii?Q?lx+QLxTb1qquxpT7luMONfoCZbNkk0O0930abboG5jgegKf+X9yh/JlTyIjO?=
 =?us-ascii?Q?nMS9yEn+nMt0YppLLTvwoy+W0KD9ODq3WrYGwb6w8K/mIT0R1rtC6w3/BUAc?=
 =?us-ascii?Q?FT1IXS0x6Ch/1cgcX2slhTxB3yso8her1qw5QvuDkSs8stAw368lfXhURjbc?=
 =?us-ascii?Q?rJyfR35yQUMoGrVgue+0/ep5DK6V1vkhZkyBPqBzs8WY0RQc5hKrc2QvTjha?=
 =?us-ascii?Q?7rnbSXA9GSoYhMWKp6tGWIOj9IqAyk4yts9ctrY5Sc/GDtQsbkkQo1lWSq7K?=
 =?us-ascii?Q?6fQ8d2tATg+8oLime8NS1mpzJlIyWrXTJ3SdeKlftrsIe2y1xPLcXoAXGCq/?=
 =?us-ascii?Q?NoGhqs+BXHt7+v8NRb9K9QUMkftnu9aofaTm7V2hBk7ACzNiKAV+e+cRbcT8?=
 =?us-ascii?Q?l3LObxDJu1859uqIuGlQ+SCpHBl2cnVEtko8OCz2Lrqvd3VSfsget1BDPnpC?=
 =?us-ascii?Q?YkVIPE4vC956jOtDK8PE4RBJWpKUlXG+xIKNtVFkKbwL4Myv9YquyUYx4j7h?=
 =?us-ascii?Q?V+EOvlYSQMdUot8WT5Nzxnak8TEhwW/XAkXb3AUKnds07t0gCIW16Bh12wSA?=
 =?us-ascii?Q?HkXPpyGzgdgGvuLS8rRPKI/7nWgXLbLImbCyyvnn8wzGNtfvUeq+dkFf6CFQ?=
 =?us-ascii?Q?JtwWM4xQGkXoL1FCf7LD2u8Ew0FTnNXJMJ/dT7sDbNxJ9G6Iaj2GmcykxX5d?=
 =?us-ascii?Q?cEi7MBLAAzKIft4FeUyb+gdB6FaUITHKxbasLzdbWoCOHxbXhYoiB7Q3nKPa?=
 =?us-ascii?Q?n6R41nb9vvKwFnSNtj2y5AiVDsZdsAgVvCIu9ZIXt5XHsSWkOJqS+qyLSRnF?=
 =?us-ascii?Q?VilbI5mo7od/mXJubwOFWVABkXGEGUJYnXR11Obdkwv0yf8e2QImPEapXRt1?=
 =?us-ascii?Q?JhtdyupsiMaCJiR+F+ZxPD604ztba4gG4kZYbiWumJbRxkQR9dX0sRTPO8JR?=
 =?us-ascii?Q?kO+ZKDE5rS5kK+k5VpvW5UQtaLytnun1QJngUCBPXiWpNYCkdCCTr/3SU73q?=
 =?us-ascii?Q?atWKKBMONKX7PHskef1f8nyAAwasAGRRnjrolLlj3w0AMn/D+yE9gRs0sn7c?=
 =?us-ascii?Q?3phEHhaLvwWj3iPPHPCvMp4bSGLS6d6F7K9BpAiICEDcCEP/Gp/+VQ6NjKbA?=
 =?us-ascii?Q?JI9LlC55f4Sx5DgEI/S+RXlNta0nWg9LqCBPU+hZg6OIUKxKU43f0rWcP0L+?=
 =?us-ascii?Q?r/kWxgDyF1+WcmbB19JUM2407L21uOe+6YwcCXrifGMXmFdFqWS0U+khzdBs?=
 =?us-ascii?Q?KrrVXalJwC8f2C8YiXWqeHJBjoRJoMGLpLT2pjZalCWhUfUzC4B9EbeDg42U?=
 =?us-ascii?Q?p2CyYz7HYQVkkzCu7Ocx8dGIbNTAo15hJxoozVN6ggB/+kgpNkAMuf0wI/sf?=
 =?us-ascii?Q?dGvaIg/YwgugtOqkHCSDfjI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562a6731-f804-4648-4e8c-08dde5c23897
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 23:34:09.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpT5VZkLSEedjKUnuTg0Ic6cjcf61Hot1ghVqu4/QXvfcfVuEEweK1WNYUMqbIWjHFhf3Vqt3XymQSi0buVgoiBab/Sze50vi1mLb1s+9sDB72fTrjUMfkl/U08IZu8k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15988

Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add empty enum to avoid allowing invalid use.

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5f9d541d177a..e2fec2afbc6d 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,12 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car X5H (R8A78000)
+        items:
+          - enum:
+              - {}               # avoid allowing invalid use. will be replaced to actual board name
+          - const: renesas,r8a78000
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.43.0


