Return-Path: <linux-renesas-soc+bounces-24967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1909C7A843
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9DE0B380413
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F408034E768;
	Fri, 21 Nov 2025 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Jh/tQSmr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9B735294B;
	Fri, 21 Nov 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738066; cv=fail; b=kRgTmiRpvfYwhJwjRiQeNXdsSzKsSCdHT5RdINY3UTlYShKbKiQ+Npw7Sr3ZnYXMD3rv2JxRo5c2MhRKUzyYFONxWPUuPPlhGlVLSSrPcQSZ+KLlEdLO9VqXebQ7B5lYRNf1lRhgxdj5qvsC/xHhE/tzZl2U5cLM54qpawK/GL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738066; c=relaxed/simple;
	bh=B56SCZvwmwr1wQF/oL2GE51Nd4jRaJncqLItL+d/C+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLHdmL6QDAwyk8+jGH2WOrTf4U4447SeYt7vYiJwl2SMk0KJMyy4f8K2DsYaNcumWDUCbJrFv7edDS/YzmL0F68JjKC/9ddtVn+BMywaivpqVQioND4E8qeZCKgIg9M8D7KcSxUjDTQu/YoPTEzkPQ69NNkZqJa4JBCxtUwrFHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Jh/tQSmr; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8JoMOGjYuEKJtgG4bhYyyBfwspjUi/YRsun069rEPKFJJYS6r4CVElhi379QvRM5MiS8F+6qo7Zts6+d288ymZ5pcMhRQlz8hbxFFrHLwgNWHwfZaDKnN6SoTwlcflWJ1RoowrKvBOtCz5TvQRYm8e4w0A3RmyRHU1ljW5f8hxf/0v1ouZu5vrJ4gWPM4wQ3y6DwnSMs5+obHkAF3BXJvCrXoQzloLmLamjnlaf/+iiw8uicXlDEuXjwi/uRqY81xFlXYOwV8sQj/8hz3R1cJ3SWf6P3RHyz07SYqnfVax5bIz9Ep9yYaYb5foUAKYghtrmWZogeeIm8gFOVkZeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oFzL3y1ZG5QMldZPIc6q+VmA5L8lJl/Vo2koBbhPm4=;
 b=Scp1F9H/3zySOIedOe9MMnrglWFm6YvScRtKDMu5a4Sff2E8O/X2wAmn7esRw5X9AZxy26+7sl8dMsYFBXjklmjNdcvnIXTN3ClhP7LyGETty1GgrxN8gk8HDtIEVERv/An9eeTfXHFF5RU6eQMbi4CrZhhlcBP41k9gR84Z6csXdDOyxpCixu16AZP9C2WB6S1nNDIpSuhgrvOlvpMsesSWFPdt+kofSMfk4iHlt/0eai02Hvu/VFECIfOVXikGmi99x9rqaMSz5K0WnYqr+jqoG6DREvtCxostL8VVWEl8DiSAzpqaBOdFFndGhVD0hd6nrykmHGU8OGnljoAFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oFzL3y1ZG5QMldZPIc6q+VmA5L8lJl/Vo2koBbhPm4=;
 b=Jh/tQSmrUVWZafCQYLt00D6KUaHXnXWhsmsZ6bqh/NZfwmJPmjh9bj/1ukYZdTXzm++ZuaOtiWLSZJ20iYXeyMyyXkLfB/9LK/vGlKlHdY+a/MzWWBiQ9W2LdesHRJPQjsu2S+cZeV98vuN2yRN1nlUPnBeS/vzQGR64LjY7J78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:22 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:22 +0000
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 11/22] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
Date: Fri, 21 Nov 2025 16:12:00 +0100
Message-ID: <89b6d61854e94966fc9781d5832b6c187c35b4de.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: d92d3382-ec9d-4a1e-4c59-08de2910a65c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fGuaJUlmdmmrP5X6BQje8sUqxTRMT9krmm0uOAd1PFXdlYGv5NBcQOy5ko3W?=
 =?us-ascii?Q?877+AxM1tfWj7hIA0Ey/Fc2QfWg4ms5YfObgLg1BSFViH5FK8G4OlUwtTHgz?=
 =?us-ascii?Q?L/TQXB2YbjbainMUoOKuJ8wI/H5rQ+wrUikMTR1mxUAZk9gowCXDkhP0cB+J?=
 =?us-ascii?Q?LR51Wl6kogjNIJP1XkpRhZh2JeznM7OT9UhRNFMOJOc12TbmIvS/hK0XZpoA?=
 =?us-ascii?Q?6ePKkgya3GOH+CZ4sVi43zcv3a+BRNlpZOAOOHCaHvfud2PJsX142gGvpsAW?=
 =?us-ascii?Q?xtc2CeT6PEXQ9d5wfpWpf3jG8crlpsp1uysuVG9dJ94B7UP1yo6D651Pgsdr?=
 =?us-ascii?Q?GTZq94vzk472FnwjrVn0lsnjsrNlCYvG4FYo1qHqnWptRTTvdTvUnUrEsFvY?=
 =?us-ascii?Q?wq3nUzg2rvmsaQL6kxAQc7X/RfCzeUwnydDa58uQwA613zOlh1YBbbeV3SnJ?=
 =?us-ascii?Q?m0d9WRogkwUOcQSLfA9+T9K3wR2k8hyY37N8Y9woYd2rM0KZwiXmHBkWL/cR?=
 =?us-ascii?Q?TqXCdxniYmtuypI8s3DQ0WmfFokzKsQCEdKhIxPaveZFogF9cQpeGqqEVHrP?=
 =?us-ascii?Q?MrbihcQOMlee/du+gjJz1p7DqkihfUzmXMjxmFb8Z61oRHWx2XwqavpEb34Z?=
 =?us-ascii?Q?rhYe5TGSeSwbAym4zcCG0v30964n3xX7Pa2DRi9hdzozmFXAloQi1VpMI6B6?=
 =?us-ascii?Q?vmJ4/Ig8wnZ3gTmJy04M14oxzWcFG0BvkaE9i1ybRJnfsgqfI8bfOWyeEwNR?=
 =?us-ascii?Q?afEF2dehVxuF90/xuNyYBhuvxgwpIiOQAnoYR1vpYqeR6lRQpxME66MaI/ok?=
 =?us-ascii?Q?iQ9QPWsvg4+g0/s59kOI2uH+aHwQpcodAiffDGn2j/kZ/Of/W6veJIXZRpMp?=
 =?us-ascii?Q?aX939p9MvpOVlGR5w73ET5sLBsYTNLjGCBqpVRj93njAQEEzNrELj7i27CQa?=
 =?us-ascii?Q?vYUO2p5XYRYLER6pmr6hrZXyZLo/+F0eRYOeb26H5D5Lh7jQ5xEk9btU44Ir?=
 =?us-ascii?Q?0K1nwMMMmU96amLG4SBNciDNMKpJNVNcWinioOZk6kWfUwLlWK5CUCR+GmjI?=
 =?us-ascii?Q?TtioMBG0gUTQVNlX/AwdYdunX3Aq43gGyzjT0IH6HWUqOnym4YCE2wxjywSb?=
 =?us-ascii?Q?6MiqIArK4N0r8pArD+sarSe9Crf3HoebiQiFnzimDFsrsRTa5LEJGiVyzjB0?=
 =?us-ascii?Q?aHbDsE6a0wqCAa3TutglVRgglaw+xZiUKmYZxK1MW6xuaqA5HNmvatYoajYY?=
 =?us-ascii?Q?JIGmi7K0Wbri2er1boIv4ce5Z1LkgouiaPv5FVI6nuhwVHHkeT92NzhO7odk?=
 =?us-ascii?Q?9WU3ao3L+cOJKvTdosh1fmdoSmokvVZ7ugopnE9QZOTjKvFp3ldITDkSOZiW?=
 =?us-ascii?Q?yMw8IwBOpJ528yMktZYkK6YOxseEN8fS1FRY9h8DWilHKWsN6mkSr6MyGz//?=
 =?us-ascii?Q?R+LL+HLudlg7vtcN0O18jzL67LHiOBi/dsc2msv/Pc01YsCX1hA+//nRvZ51?=
 =?us-ascii?Q?eUntB9aXZlVsjeOr9UWuo3mXilVOwh0XavL9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rSPXfrpQm/Jk1A45g+2JzqIkMxK0s9E2XVIcW4nvH8W4RO8ky1Dv9AzF31nM?=
 =?us-ascii?Q?qO8dWeLNDGiMyPCRZYoVBq/Eyt66Z9UipN4kEy+QU15PqCmZsXLYc3ZJZ0hF?=
 =?us-ascii?Q?18LCSQo+4+nvgPeID5Gs79nBTQc5YnBwn8q0WPqbimZiOmmzXcQulKYVtrU8?=
 =?us-ascii?Q?bcquq/IeHwblqRxK+hom4Yy250+VasCkgKOksJSt/BLPVaqv9xv3bCImifmy?=
 =?us-ascii?Q?oUx1xwcqI3Wc1ndd3iVRzYyA1ChxyAQBEhFyv2cIawd7sEI5RXXWf36tugaQ?=
 =?us-ascii?Q?cqV6p9oz4Ak3Zl9Jqkwey5i4ylRCz/jhxse3nY+++gdzxveubG1wI/ipdTyT?=
 =?us-ascii?Q?NV6gaCJsI9B0b5ecPPPC2QnI6JUamdW5ftmMKJoJe4aR2XpJsPjOTiMs8DGi?=
 =?us-ascii?Q?QPUv/gV+f96SKcvjcLZ1svU2+8J31DVS2VACagW3VFnlMd1I1BmuhsZ8vkCQ?=
 =?us-ascii?Q?0gZVBctV67I7xTpR/ccaJ31Zbvor7MxfqAnXkXexGJkD05nvFr4R6Wu3na9P?=
 =?us-ascii?Q?8bUQc4WYKMaob6fkdtJxHmvaIQCVcGyNgze3SGmLZkM0DrOPbIti02f4hSag?=
 =?us-ascii?Q?pNt8Q5xnEUODvBjki5OljspXhNT/XpNHdjxjvQqAIOeh1uAGNmKlJTOFnP5S?=
 =?us-ascii?Q?Ys3+lXli5Js8CjthWZ2gMGRKRPrN/2kLg9PnuAt2MeR86mYRCD7fqvalfAD5?=
 =?us-ascii?Q?mar2CQA3mpwnz3wZqgiQV3P3ZaxTCiFP0SjoFY2claH5e7jQ6sO6UwtspyhI?=
 =?us-ascii?Q?u3+YsyXIlr2+WnQ9LFzYUAfAJgOYjWGZLlv5QUE1HmGD/b7NFcBWqlE+Z/IW?=
 =?us-ascii?Q?HnlTLiDhVt35/eIZszEMVDng2LE/f1ftNS5wjoLMjEcXzbZ7YnPd8Fcszvrj?=
 =?us-ascii?Q?blO+7bjsMGNRnPNgDzsu1B12FFzLuCVHOvY5820HhO+7bJ/oGiYIVGcB1NGd?=
 =?us-ascii?Q?NVkrOac86qS+aTFpU31TZGJYAP1/CplU7MOWkUvCOZO+/zrUKicrW5qD+N0l?=
 =?us-ascii?Q?onVef/ZJBW818A4TEKO3Lsn45lou7SJEG8pKVB0fGFyAjEPlyd3QvdIkUW5R?=
 =?us-ascii?Q?kOvovCzVhW66kkOoKrllIn5f/QhTycpOIq7Jp72adIRzuGL4HDLv6nhyCL74?=
 =?us-ascii?Q?kBgYeh/Hpd3lfM51hw/7GUt+RIkOrdLutd+NVgo7aC8zjPPdLA2KtBEVfGFy?=
 =?us-ascii?Q?EHYQB/FrsxClkj8qzfCg9dh8RfAYQNPAPaenr09URDlZdul6OXBOTa+Dqr9M?=
 =?us-ascii?Q?pka9cjqIpMqegR8eqiZlz9auDXPb37UONLHPQhw02AUqRsK1BTI9cPOIuJbK?=
 =?us-ascii?Q?Y1s7rKK706xhcXeliBbYSD8hLTrXYXPOHNhGaOvWI/FZdhrQxJSUzKze7G37?=
 =?us-ascii?Q?W7vuHRZQcrT9u9zGFuDKNPXdytNQMotru9OV3JNKSiHeEtn9T3WpY91RrHTR?=
 =?us-ascii?Q?CDlRdtjLg27UnJwHqa6Uq9xLdI5I1aKOyMvbkTfi2cJ6T/5TBQG8krsn1eRi?=
 =?us-ascii?Q?0S/sZxCdCVvuwzVzFtL0QwZBwYVQrGNGEaHJlUxVQ3tw8GXlzVOzIOAKTpw9?=
 =?us-ascii?Q?u93gus7znwnkviPYA1MEa8v8CCryql0IGKRfuj8+VhUMmlXJeoOfN4lZxvEi?=
 =?us-ascii?Q?pH+l2JrnETXZcXKKr1uSqE0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92d3382-ec9d-4a1e-4c59-08de2910a65c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:22.2294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lEKHRMqJdKPO2AvPvlw1jQTKH4Dv2UAbaBXV/SMtfqXfO/z7W5MaHAZmMH0nom18rr0ug9IyxKs/PiWeG/bsZd+yhq3mV/+ru4X8M/zDcG5XrH8zKohxpHP5QN1/k+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Add support for selecting the phyrst mux-state using the Linux mux
subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
initialization and integration with systems utilizing the mux-state device
tree property.

A temporary wrapper for optional muxes is introduced until native support
is available in the multiplexer subsystem.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Added missing select MULTIPLEXER into Kconfig.

v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/phy/renesas/Kconfig              |  1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 ++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index 16211072098e..d217c630b2fd 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -30,6 +30,7 @@ config PHY_RCAR_GEN3_USB2
 	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
 	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select MULTIPLEXER
 	select USB_COMMON
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d2c03a846b58..9a1ea15b9869 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/mux/consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
+static inline struct mux_state *
+devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	if (!of_property_present(dev->of_node, "mux-states"))
+		return NULL;
+
+	return devm_mux_state_get(dev, mux_name);
+}
+
+static void rcar_gen3_phy_mux_state_deselect(void *data)
+{
+	mux_state_deselect(data);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct mux_state *mux_state;
 	int ret = 0, i, irq;
 
 	if (!dev->of_node) {
@@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state)) {
+		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
+			return PTR_ERR(mux_state);
+		mux_state = NULL;
+	} else {
+		ret = mux_state_select(mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to select USB mux\n");
+
+		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
+					       mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register USB mux state deselect\n");
+	}
+
 	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
 		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
 		if (ret)
-- 
2.43.0


