Return-Path: <linux-renesas-soc+bounces-25249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A937C8E1EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 159364E27EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04EC32E736;
	Thu, 27 Nov 2025 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ss1KSl8M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1932F766;
	Thu, 27 Nov 2025 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244250; cv=fail; b=Z7KGy0Ca1NTpW/MrVPNh8FXQdClFfcJqHxTwely45bFaVRbxHO3CoX4oDeU4efZgzIUWkebjQ/I93m/d0EqKVV/YhGcYf17QM/b7u+NdZWwvYjcwo7Yq12i/0609+U/EUgRa1oUhoVPr7Y5+RFZNvDeVsPmUIgxu7DDAIIzBISw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244250; c=relaxed/simple;
	bh=TjEDmqPa+XuUoSx1jyoojJRUR12hwn+/hZUwUwQ0pTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MUHLhRjw1azjn1f5zrB+ARlGx6IZQw6d8CUGYbuLa8xEwRKEBmYqJpAnyLC9C9B4nf2DNWXAbwnXcfaOxWMO+GtVguAHStrlrx58h7EgACtB0wht+yg2vSqCo+f5upyITIrwOsRLX4EYGkteBe9d8BJmPUpbDiQr1RCXObw4mb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ss1KSl8M; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBaQ92DY1l1RI8leXwA5fPzCHde/zWzMoyq1ZfbtTsQ6LbIhfLykxuqRorkZFDeyzGk6cd3ZWhf37XoC1BZm38d+KRbCCzcCswM9wLGsbmNMi2oCr3J+o6raaqpN+2/c+gmciqlWgeW0+BJP0yncrSGnpXSsQFktfPkDyelBBcZGq51E/hkIZNmuZZF3hB8lVHhsMuqNgiSRH7J3jQyl9kgjlxnaBQp78U34vghOXTw2EKYxJh+l4bZooQ+bRMU9VC648e1TraNaxtCA7e7ag4Y/XE+854asmABaaIQAIgOgLS7Tpvk9Cr1ljmWgjErqFUXlYHmnSJdaxjSImw1c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmRFIlyVh4480AJKB+V3zqoD0aqHGvmnDAkPpzNRUCI=;
 b=urX34Kqhy9+RtXZl22HvrnIHSZwGtKibcb1dceiZetkyLuKzTItC7y+8Zxg265jWIblqKjC25KYvNFiAfKr4VRCVW2W3yFzi6SblYLDBPRVNt0Y+EySp4TnGy69GeG+XLSGVCrU3wh8TAJkYpv1mAsqWxKa4VliBh/i2Q5dlaWCKNkEVzY6ZFqR+pZj5Eck/+XsnroHYP9jxdr1pvG5S6gcIe9rVn6QfrDTB+1zsKBjXDrJmgS88LKJeS26dYyR1TX1GpOquscUzyIcJACCNdfOji7Gm2RYPj/oX48Va0syfIG5TvGdLhXdPojyZUXiIuXR4+EMvpOwsrkeAKyM2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmRFIlyVh4480AJKB+V3zqoD0aqHGvmnDAkPpzNRUCI=;
 b=Ss1KSl8MWZHQy//jDAfuTlNg24H0Q49hKRSFui7peTpLQ7cORKgOwrgj/Bh33pui5dq+Mi90mtG5bNbQO7Fto/hRYMRPi5gHaDIf7NXyRD/OoNyr7wQeFOcbMJkyYEaI56yex3hv8CeAvtrxr/ANsKxPaJLbTIORkk0jO+q6hsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:46 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 09/22] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
Date: Thu, 27 Nov 2025 12:48:36 +0100
Message-ID: <5c5a85eb777f327e659cb3a969ebed8531c05a26.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5785b5-faa9-406e-015a-08de2dab338b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V+oPC9Fn1/t8yNM/7Bv42WHBKohD4rWIk29x377xVWe9/cpqnhe/YoosjVei?=
 =?us-ascii?Q?ybOIXrjyRUnitqx5uQSmQagc7xsRhDdZAyHIDY7ksNrLgFShM5D14bbatCTA?=
 =?us-ascii?Q?WLfmZEPeaV1GpQzHINoo3Zd+YaFs4xbDwnRRlGb2I/B7sRkqID3bHSb/+Lh5?=
 =?us-ascii?Q?WaHY6l7REH1q4OwpR7Zgj6GQiGOg1InLQeot5LX+5b15W36ZUnO4OlnvXytf?=
 =?us-ascii?Q?rMejl7eaH6t8Pa8dkh6VCIyhfvXPV1Nu644Ru6ctEJy/0yK6JsaMzz2WrKs0?=
 =?us-ascii?Q?nH7ByOUSs7I5koqwiw6OqaveqObPzm7MA8eLylgtMPEj7twPMt7MK+PN5nwT?=
 =?us-ascii?Q?hAcORQ9lY0XmlGo7tI12LSoMCesARo3uTDGiE3+w9D6UqpyBz6yx5DrjYsub?=
 =?us-ascii?Q?v1+jLckPGbhawGLzZrwsAW/Oz5+FTRtjv6Uajn+fJTCHnDBdY8/kQkpnIAEP?=
 =?us-ascii?Q?BGWHsihDTLnrMG8MLZvn3B6RW8sh533vJQUt/zQtcS3LiDv6fT2TcTMwd6aU?=
 =?us-ascii?Q?RbffnhRMmuvMDfulR9Vz/gTRVhaIEx4eqQ/1b97W+pc3pDMn0FM4SnRZDoax?=
 =?us-ascii?Q?kLkQi0agX/y9PfuvQXsYgqMMrYxZQCYoZ+SW918NeP+6fFsQ+7M8GcJQHWyd?=
 =?us-ascii?Q?HVQSZUCzm29XZ0Sa1NBoD+zfP/y2FrZJzKQv/yqkhIOcK7wRrpvcRFHCURoJ?=
 =?us-ascii?Q?Psgq3yIo9lLQhPx03jN729oj1NxY2222Wa9UWx3BMeMonvB16twBKXmkOQNL?=
 =?us-ascii?Q?jEDrG68nGU0Vpkj00r32Vedy62+s58Ydiae0bWDpq44OhMTOOJ1rYJ9gNW+2?=
 =?us-ascii?Q?ikVx384M6YNdUa4nK5YLLMSo5M4EgVCDG0AHvdMT4hwLmXLXom5/ALbVzkHt?=
 =?us-ascii?Q?AB/s+NF4DPe5Ks19zuF/KZkSczYe8SQgb++6jpnsueYP/ZwEwaBxuNFKbMV7?=
 =?us-ascii?Q?uQKxSjQqhO2YYy+oOUiYzDue6SF7quxjJV/foNapfTuR0U7n8CFUw6+3WIoA?=
 =?us-ascii?Q?3CiTn3k/Kyf0OcMCffHuQgwHhXrLW2plndUL1juzoIDeDuJ6k/mvk9tOrDeJ?=
 =?us-ascii?Q?FSvVhyzSXdC1dUNciNRFzTCgOtkl4e/ZHwdoGopaFnSsXyfFUGa6iLtEEhof?=
 =?us-ascii?Q?7UGGZBRjEMbZ4MZ3gMI6Rs0J1dMBRh30Oj8sn5WDlZaTZY+3CtXBBs1Emv5D?=
 =?us-ascii?Q?FhIN2gT+sMWjrz5zWouBum/q29/yVTmStNKRI/G+Gcb5UB0p9R+vtR65+yQg?=
 =?us-ascii?Q?w3Z2Fv7glBqG3m1zpnQFxt0f3Ri71Tp6Ju+ckXJDbfJxZuhJRPmoRvTjtZg3?=
 =?us-ascii?Q?yZXr/paZV+xi58ML1FicWvwcdszyxUp9F/Y/sX7D+ZyZTGpzsri3CnQvZXm8?=
 =?us-ascii?Q?2OZ8ATKWpMRJAHI49brGw+DkBwpzw9mOwHtWY0BuMxpdPrtDjAayaDZhA5g3?=
 =?us-ascii?Q?AIO5OGM+qm/s9gdpuNroiCKuztVueDNJNiIAjrSgvupXxfle+PmNb0xmnLgM?=
 =?us-ascii?Q?zwhCnPr+LDiNP+oe7wfhzypAKxhIKXnHsUJM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AgEED6081yVemVONivssnY0juAPKvj7zrMhTcGSEBFW3k7yRFvnv+yscYWIx?=
 =?us-ascii?Q?BW8DfrGf3nmwQwPH2KMbqWrzdNzJqcWNfbF17fZx1sFmno9wEGlliOyj76rJ?=
 =?us-ascii?Q?8XDou+xXo8jNiArc38t55P4mRXBu9Y9b8enD+Of21NMdxc0X50sUoNY+2IEX?=
 =?us-ascii?Q?G1GHIn/1hbvzFq21J//aC44DL81WggpNMAX6IwgtqjgxP7OUI8d0mSTyF8b6?=
 =?us-ascii?Q?aaL2XsH+AVhUiIfUi9i8xCBxNMOic7AjSkfqsM9GzjgpkcsAR6hSMI1LW2Sj?=
 =?us-ascii?Q?iN9p2CQ8DNgKQdndqO2qdKSihCFOXuornaPjdTQ/om6qnuhKjnBy0SB51ENB?=
 =?us-ascii?Q?QIGlsySrn0exdyq68zgrwiIc/4VCa0BCwgSgcd0C+sVtduTYcOU4No2isS8Y?=
 =?us-ascii?Q?d63bUVxlUobljc9SEWBQ7H9HczdgbKUugFmJ0EwtbEwCsCpOQbrbW/DMRmYy?=
 =?us-ascii?Q?K3fDp/tLAtYI3KnnI/4ws9QQ13lC1PFtUi9s2sasfUteF5v+WAjEgY+VYit+?=
 =?us-ascii?Q?9aJTd5Q0HkSPkdU1p2aomX7FPWwdeo0qlJUG5MFbV+6FNRwYoqA6Fq+MKijm?=
 =?us-ascii?Q?MAvfyFt+J8hwU/ftNpt2NPnpAJC6n1zDNGZHXJG2FTkTmmQwqD5Ix66FhzZB?=
 =?us-ascii?Q?CQJf46EBbzj4eeAv2QjOEfHM9xDcuwwpw7NyUQ9GqgpS9FlEU4LJ6PkUjo7C?=
 =?us-ascii?Q?O7C109s2dL/CnWBUhEB2QMOjKGigzCMnutzbzNAlZhtkTE78fPsCM3zRvpUX?=
 =?us-ascii?Q?4MQlGqJ87VXpmz7A+PN1jyswyoqS5EKihuZeEDoWVtEFuJFnlkb1XOIUhY77?=
 =?us-ascii?Q?irpjtuxVA6tq+uyqEswwPMy0mxNcx8GnNYyUX0yQXsOcx1TQqasvGhUYAQyN?=
 =?us-ascii?Q?9TWEqY2g23DVgO8CWG0WsPHvOmv6nxVXl0DtFnrzq7+a/MFLBiMCHPEOP5Z2?=
 =?us-ascii?Q?RP+KRia520/ZMXtOAmi9iXKr4lvkUGxg6pCfsWB6SEUlQraS3GcDxPnkMoL2?=
 =?us-ascii?Q?bBEF/K524oHUQ9TBDW08PZKiAVzi9JiUAKbcDWVHFU/D3LJthCZqet5rWh7z?=
 =?us-ascii?Q?QnpR262Xl7Lc0/guBHwdFgw9TgO5dg6IF3s/I4zWlFCb24LiJotkZCyao0lD?=
 =?us-ascii?Q?WYK6osR7d0HQA/Owkv8z6RVGm3vXiGKo3I2bfpLcML6whEQ0TzSF1rBfuT3s?=
 =?us-ascii?Q?EggnPclH1SH2PkKI5QqH9ZqViCWBnYjTrn65D1yqnN6qHiRRKJxRIiL+5tnL?=
 =?us-ascii?Q?eFU6z12FMSNNQ3Twn82KpFFkXWtgFhK2+42zL3cUhbjN6WXRM91naufmp5ZL?=
 =?us-ascii?Q?NoG4RXkwSl7ecCh0xDrXyfh+W+/2S3/w5D6RhTtgzalWP9m+cSh3r82bG5Xm?=
 =?us-ascii?Q?0IsPudYVcCHcrXiTbwTibvJkEG31smuaZ14yJYSkhvJuGjwYBVdXhtsFYCtI?=
 =?us-ascii?Q?mnvmux3iv6ubPJoTNamtrHamZuRh2XWpKoGMFE8HWOXPFGuTmZkKvJr1lsZj?=
 =?us-ascii?Q?BcICvQrsx5vnFQZ4r2llLJDxBB1ihBVjk9ZllTSLlEzfHTLdZGht2RyXDNcK?=
 =?us-ascii?Q?yPAKk/eW3s06GkOasY1+7parzQa6HpykpsjGYx3RpijmG/3Fe3LC1qb0ZJco?=
 =?us-ascii?Q?Kw4waMhhZM1O3y7oNgw+qwY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5785b5-faa9-406e-015a-08de2dab338b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:46.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQDX8+OAj3FnesenhMFigbToUQ6+TUafZx/cMYIGrYSn/+CZ6ldmOY9mW84bYG+iCSiUjh+kMbLj9BdYFofsbhjTFqPyqGQ/JFqXZJSmf8DKi4pMTLLMb/wAKyuvt8Lu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
configurable VBUS control through a multiplexed hardware register.
This register allows selecting the VBUS source via a mux control
line exposed by the PHY.

To represent this hardware configuration, support the standard
`mux-states` property in the Renesas USB2 PHY binding.
This allows the DeviceTree to model the VBUS source selection as
a mux, consistent with generic binding conventions.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - Collected CDooley tag.

v2->v3:
 - Improved commit body.
 - Improved mux-states description.

v1->v2:
 - New patch

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2cd0efa75f81..448da30757f2 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -102,6 +102,11 @@ properties:
 
   dr_mode: true
 
+  mux-states:
+    description:
+      phandle to a mux controller node that select the source for USB VBUS.
+    maxItems: 1
+
 if:
   properties:
     compatible:
-- 
2.43.0


