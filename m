Return-Path: <linux-renesas-soc+bounces-16842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB698AB12B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E4A2527063
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB2278F34;
	Fri,  9 May 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OS4lVDN7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E127AC2E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791625; cv=fail; b=OQ4u3PqJ+4u2NnsFNyfKbl4jCXsutDuPl3VoYbalh5nW/tvseW9dE9iWaFCdA86s8aYe7zresTl5PEGSOeyFb1I4FuOapqPMCosT+BRqJg7uamzD2E5T9giOtix8mjoggH5GeHld4F+UpTlEWYMY64vyjQ7eY5Ne4/eFxf9RiLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791625; c=relaxed/simple;
	bh=OAp4XtK+e6pCs4UdPCpK5jvg9HZkVUJkz46OS+wgejU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jlTQbJHvZPfuhiVbZq4frOHt8iJi4mWoVWmQOyfPnR5mkqCGlNERdjAAdNJG5KIjP7ELRNAyzsyPMZbccb8BKvW6EcyJLGy+RoZDvlAf6Hxh3WEhn7dTSU4SYqdgqHILn+2IFJPTydqtWPO/4By8lWV8hJq4GtOUrrT3lzXssfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OS4lVDN7; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkoamLYS1sWy3c6u5DoVZi3NcWxcBaNAEapSBx0iLUz+pLOyoKNxEbY50HojrR8PWoLkT0OXRE4reA1BAe4fZVW+GZrAFSwSOaKF4TMxTFpeD2G9tiMIXj0agoJwKwFNqWanj3OUaEzU4ZwGG57GCp9yhALLiFfY8AspNP1jHnbekEarVo8emXNzbIAAjBjyUIm3Ic3y1SUi+j6r7aCf/zX24+M5mPuZLSA26/JRyZCPxtAORD38n5nU6anQyXpXm+ZZKOZtEu/c5if0U2B9mUHmVadf34QqFbMixR+NWJFLYdMg76ZBtr8/JvC9+/rtCcnZ4D4o08Y/sAKuwfABiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kApsnKvMfrDRMZ395O4YMoMLncSupVWcvMMxaIzXZ4=;
 b=WCnaThsZb/qTNUOV8dKTsigWYKzP9p2kyjIioXoujgG+J4pG3Lm8ce/cmxiJU8ZJt+ffIHOxwAiuP4DwrseCfPVndV29e/ldZaF76eKRgCrZ56NomorgVKNrxCYqsR464XJiZ1oZT7ud0SpH1tzqm4SG9X4fwOEyxSDhu5gj3k1XOhA9/YpcpA8cE8LiZHblKxYxqKYrW8aNh2eGV1TVsMRZIT6sGxD9nYuAtK5fhYAQ2bwFBqF7G+0DmXrFkyg33uNvpSipasN3v/OOUdI4m0X3NdBwEH4fTSkD9RL/CXKKz+6N45VJJYJhH5M18GmmYtfAVoJurZKGPInftGbJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kApsnKvMfrDRMZ395O4YMoMLncSupVWcvMMxaIzXZ4=;
 b=OS4lVDN7f0qGg1OlWWp4Y1hGzsOQVmm5kDSBbOrNQY7gNaI7fd9evbWX/ltchSwdJBt95x4arkHQgRXwvw6USmXn1qCHbLVsv/25RuEsg10r3x/jWFcwPC/HLA3BFjsazcwr0nHUTuvUW8lksQ8ddYR3LMsPUXG1viKsIgZ23J4=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OS0PR01MB5396.jpnprd01.prod.outlook.com (2603:1096:604:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 11:53:39 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:53:39 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Subject: [PATCH 1/9] phy: renesas: ethernet serdes: rename driver to
 accommodate multiple SOCs
Thread-Topic: Subject: [PATCH 1/9] phy: renesas: ethernet serdes: rename
 driver to accommodate multiple SOCs
Thread-Index: AdvA2PuIl66bdoMCRSScr7zyCZx7jA==
Date: Fri, 9 May 2025 11:53:38 +0000
Message-ID:
 <TYRPR01MB1428422B5FB6D5294E6F613BD828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OS0PR01MB5396:EE_
x-ms-office365-filtering-correlation-id: c025166b-8030-4b6d-de18-08dd8ef0232a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hTJd0Piu4vKS883F1Z8SpmwE2IKHaj5gqNifCwwnoAEF+GtUPB5Mn1yjR0LP?=
 =?us-ascii?Q?x4tJSl4uU/yXnL6ntp8WfCytiS4f/4aAOvyXcB4AhXDZFl0eTxZ6Cm7Zb8qk?=
 =?us-ascii?Q?s65Fjcra4HPZ301qLjJmjIo6Fan+7sMPIjZQ1UZS7/QohjT1tpdU8oktyRvY?=
 =?us-ascii?Q?aNvKSTbRy8kSLQTCQJXK7nF0VWuiZjyBxFqOMoDqe7x1VZypJ9mv4VeXPh1D?=
 =?us-ascii?Q?eCCeyypDbiIPqs6ta/m1+Y6HtNf+qkHzPyZQ9Jg6RrDcddiNQqujsYXs5pw8?=
 =?us-ascii?Q?4gkuYgJ15eZ1Y9yHYUyQTFMrzZYaDivvi9nolNdtOh8cExCGfU4xOatEETWw?=
 =?us-ascii?Q?kKYQf7xwojMdf8C6o1v070rlXoP5MJ8Jc+NchSI2nURsCkKp607e4k/bV9QG?=
 =?us-ascii?Q?azlbRNrE544Yqh1AQy5xSsp7lcfLdZiIkHFrKctanFQV3Cunt2Uwk2W29/Od?=
 =?us-ascii?Q?EBQKB/h4gb/81O/opatDyGF/MS8V6ewEOU4noiYqZvR1Dslws4Hscizzbk80?=
 =?us-ascii?Q?lC/5krHOnDiMNziWdLBXk0wNgJUh3mW8PK+GL2Sr8r5nxnJrx3L3BbkYgKFu?=
 =?us-ascii?Q?hvyNf5D4KKzcfSrhPpB+8p1AtJ4+isyJF7kN2BgB7bH332FQjTusO5lvOUX0?=
 =?us-ascii?Q?QZ2cyfTvCHgzLyIZE5BujMnm4KrT7jZveJuUKQ1r3CAB0Kg4YQRmdOJ0CoGV?=
 =?us-ascii?Q?atSUgZIPI3eEDiVRqD7T7iwetRQF45NLSq9w7I5Fzocsvoq2gTQqDDxnsgPW?=
 =?us-ascii?Q?coi+UrBIDKLf4kRu8Ehkg8tG6dDLzyBZflOfcPqOgO0+LzAF+W86SGSl9U2Y?=
 =?us-ascii?Q?dHK2RFjR7dqQ5baSxV31Y31qFCf0Fm/X9GylK/YQ3pqkmEFVG23vHkEk08Jt?=
 =?us-ascii?Q?gUZZPbhctt+i/yK9sGpH29gCvyZFyfUzmAe77eRXqUI3f8SHDgRl9nuXWkAb?=
 =?us-ascii?Q?RmHkHQSbhnoDgSa6NhkU/oeT47/8d9u61Mo+O0eO4GuqNxvgcMZ9OFhuv46c?=
 =?us-ascii?Q?aoV0qlQhuH/JtP9N//b7tstw1qFxjIpOaXbocHuVbf+mzIphPkQ0wthH6VGE?=
 =?us-ascii?Q?qJOO6RxlgMe09DymO3i2/J2uBYXnqGiTibUYIPQYEi1sywewHUWmL4ggVPx1?=
 =?us-ascii?Q?D2P5ZNoztjjVyDaSClb0VHa8ZJo6I8kh/GCRrJMJkcVah7LGLsasTxCcNu+x?=
 =?us-ascii?Q?ITY5fzpDl/Y6k6BpK51rK77ejtYeGorMBMt5SV83hQxqso0zZtujhg8ogVOy?=
 =?us-ascii?Q?S8ciNKaihEeiccPCQVDhqHDz0JX1GFe3XXYZBAioy8+eqlwgd5nlR4J0pUip?=
 =?us-ascii?Q?RXI7kPZCf4FM5xPoGCn/kkAF0DumKgY4gctUOsK/qKUIU1MQxY6jX2f2MBnM?=
 =?us-ascii?Q?tpohBCSUhm2eKuwPtR2YPsmbIDd7BEHi1nOvxSKHByiEpJ4Eq+VpTPo1USVG?=
 =?us-ascii?Q?N2416q0rEWjr9M9TQ/RHuhGyBu3ByjDfIsxoi84kEPl53oVW72G0aQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fCa+ls2wLiMTyT92lIkFnvkKBqJc1J02+YiASTCoK8csJIU7yv3obdFEjgX4?=
 =?us-ascii?Q?uDUa8paP4YvQjHsZetcQT+kdtdNa8bHwo4ZpeHUUf43R2flBgnDq+bv/U4ES?=
 =?us-ascii?Q?DIC1/yR4umkbhPPXpD5rBrffgFRrJVe8K3E/3FNGUhWnLNOpAD90J2MqUdLG?=
 =?us-ascii?Q?5FTdOwhryJSvko88GW8faMIQ95DQWi84//9LhdYxRMWWzU38G1ueMlm7pNtj?=
 =?us-ascii?Q?UCwpOnVgScl2zMWT2wxbraYKW5odM/AoM6DnnzF9Vi5VWWN0+NG+/EtQJUbD?=
 =?us-ascii?Q?xCm3lypvqp13U9u3K5keaQ1r25nx+eVxJUpGH0Wl5d4FVSYJ580IM/p3GszE?=
 =?us-ascii?Q?eYnmOeGFhMGPzHqzIjfeUX9o2zE0eO48uPqTZHNkvgnV5pyq+mARgjX3kzLb?=
 =?us-ascii?Q?WXD5qE9lYQDBluZVmiU7uSN6bP88wu4xOzsJdGQNg0kk4CUQ3cp8Bazy6F7S?=
 =?us-ascii?Q?4LTVGPfrPFVesVN+vmhZc8elNmtV13EYrWtNPKutfdsLobTA+vaTeEbbacr1?=
 =?us-ascii?Q?gTENxmYD9w6vwdwP9t3ApTf2ogQzl1iqUk7rvA2jLgMalUkKnlGuDIFyPqIj?=
 =?us-ascii?Q?/YaVvDEew0yFHT02nqDVjJgvo+OzMLAv51qK1PMC9gsg0AViyd01CB8iNyJl?=
 =?us-ascii?Q?xCaO3hyETd2alXQQwEJYyV1d/aDOfli+ChJHcBh3cDqz/3QRpr0EAxc4zh0H?=
 =?us-ascii?Q?ZQ4k0DnZ2I2DU7UWgn1WFxRSGGMKkPLl5fZm0pNyNa4oKvoeQMI+o3RvejrU?=
 =?us-ascii?Q?ipGVnqHTO0uQhyJ7P155SlkS2VUo8zRvXbj2m8G4iSqgG3uE+t2vEkgsCUAn?=
 =?us-ascii?Q?ooKvxmF/QcbK7oyw42YuUX2dLcmLiTex0BpY7e2EHhfIY59cUErupzcYFKYi?=
 =?us-ascii?Q?HX0W8vKGg1z6vsK7WFxVPOWpV2gLRkKIgl6dcmpeqBlCiQkjGAbe8e3zx0Kc?=
 =?us-ascii?Q?eQd90VxAjnfNqSMsH2NcWfG2DHgeWflN8BTbdXn1SQPyfwCbRzRGn4I9VEX2?=
 =?us-ascii?Q?2NAC4TgoQcI+XpX8Vhoc7dvi/0kiv9zZQXnj3tY34vjp7nh9sV1hXj9KYYLc?=
 =?us-ascii?Q?OBCyM2eCYcyL8RClOl/KVMHeRLGaA6JdsVHIgMO/mKdGmTuC5pV3rbzIJ3QD?=
 =?us-ascii?Q?rJckELoEsrOtcm1GDa8qMZBt5CL3djQunOnOG2x/lYAUhmUPCBmc8EDWsHEf?=
 =?us-ascii?Q?XE6tNsiDc/YOvivX7zgIuWcdqm5mGyAYOKwPabS+5lnmeY7RX9yv0cZYF1w4?=
 =?us-ascii?Q?idnJzG+SdKBcFmbCBinh0WhK+bvBVnyPiNYOXS25Vfp3G1ySPO6B0PN0XxdL?=
 =?us-ascii?Q?T6zhN5gg8ZW+FHoyUcTslw4mP9YesRrsO/N9uPIHK78FhwqOoUwDu9p+Pj+p?=
 =?us-ascii?Q?RsJMQKXaGYIV7I95r1dF80PbK8IBMFoGa8jeyurAAoAy4fzGzD8owkX8Js7R?=
 =?us-ascii?Q?333kW7WzToaXkdWkVxMNxv4ibxHAKis8+CG1+gxqi0jAlxRepAcVKTBMyxrO?=
 =?us-ascii?Q?wvTRB4VcPEt1z/LQ6/AbCqod/B4k3++NijRqNrFlXIgHwdlrGIra7mlM2WPQ?=
 =?us-ascii?Q?+Q2OrEqWQVJcdQ3apLPbEq2+1f9m8CYL4ayTPw+B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c025166b-8030-4b6d-de18-08dd8ef0232a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:53:38.9533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3S5HTC5nDhmq1Y/H8uYUw5QgvErrLqU4JaxqjM0VfpcJWK0K8WyVxSVBdjFp9PcdbZ7uzmYAlRx6n/uNJaH2Mhe2rnnWP1yMlotZ60qRKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5396

From 8d694d11953ac51d9b541019d5c38cd480c4c244 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 10:42:58 +0200
Subject: [PATCH 1/9] phy: renesas: ethernet serdes: rename driver to
 accommodate multiple SOCs

A new device will use the same driver. Therefore renaming the driver to be
generic for all renesas SOCs which include this IP.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 MAINTAINERS                                                 | 6 ++++++
 drivers/phy/renesas/Kconfig                                 | 2 +-
 drivers/phy/renesas/Makefile                                | 2 +-
 .../{r8a779f0-ether-serdes.c =3D> renesas-ether-serdes.c}     | 0
 4 files changed, 8 insertions(+), 2 deletions(-)
 rename drivers/phy/renesas/{r8a779f0-ether-serdes.c =3D> renesas-ether-ser=
des.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..30a4046a7a5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20545,6 +20545,12 @@ F:     drivers/net/ethernet/renesas/Kconfig
 F:     drivers/net/ethernet/renesas/Makefile
 F:     drivers/net/ethernet/renesas/ravb*

+RENESAS ETHERNET SERDES DRIVER
+M:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+L:     linux-renesas-soc@vger.kernel.org
+S:     Maintained
+F:     drivers/phy/renesas/renesas-ether-serdes.c
+
 RENESAS ETHERNET SWITCH DRIVER
 R:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:     netdev@vger.kernel.org
diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index e342eef0640b..236bd5487c7c 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -3,7 +3,7 @@
 # Phy drivers for Renesas platforms
 #
 # NOTE: Please sorted config names alphabetically.
-config PHY_R8A779F0_ETHERNET_SERDES
+config PHY_RENESAS_ETHERNET_SERDES
        tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
        depends on ARCH_RENESAS || COMPILE_TEST
        select GENERIC_PHY
diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
index 8896d1919faa..db9c47372fa8 100644
--- a/drivers/phy/renesas/Makefile
+++ b/drivers/phy/renesas/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PHY_R8A779F0_ETHERNET_SERDES)     +=3D r8a779f0-ether-serdes.=
o
+obj-$(CONFIG_PHY_RENESAS_ETHERNET_SERDES)      +=3D renesas-ether-serdes.o
 obj-$(CONFIG_PHY_RCAR_GEN2)            +=3D phy-rcar-gen2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)       +=3D phy-rcar-gen3-pcie.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)       +=3D phy-rcar-gen3-usb2.o
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/rene=
sas/renesas-ether-serdes.c
similarity index 100%
rename from drivers/phy/renesas/r8a779f0-ether-serdes.c
rename to drivers/phy/renesas/renesas-ether-serdes.c
--
2.34.1

________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

