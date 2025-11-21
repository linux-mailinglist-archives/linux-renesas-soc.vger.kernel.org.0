Return-Path: <linux-renesas-soc+bounces-24956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D02C7A740
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C24C3A29AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B913F33EB19;
	Fri, 21 Nov 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ock5q6a/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E162DC782;
	Fri, 21 Nov 2025 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737975; cv=fail; b=rduoEa1G22XNi3ppxe2aN+EIN0D6io0olHpNINC+DJVroMbs5mCLdaVu0+GwDA0GaF6oq4BnTilskWM6Z/QonvENRREb2otCKzWrx8aaUTlu0vNEUpciAbVnqw2lJFc6xT0GMSC0neXM13b6h6SI+BQ13vByvv4NauoDwEm8t/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737975; c=relaxed/simple;
	bh=T5NAkuPMJ8N6h7TEb4J6cY8p2HE0mXmkTl3G9d7gR+c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=H0r1uTcKUYgjg8OsuwqzRwxlCF7lQGuey9515wAUXh7uOceIetRuvgjmo2P491PmqFIL8HBRjnArgjIwX2qq5m5SVq7m52HnR0alUUvIdSLgNSJ+3kxTKZQP9eFfRxYAkpjOFQAoM74TiaMtNWJ5W86qg9YRlvgtco2MQl3b53o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ock5q6a/; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxGIubHN2LmClD8SdTO2efYz2wXNhwjkjknxdw3LlUCfALAB6eD3RDIIXctM4erWmcqCHIwnSK/KYOEig2eTdewQbJKecrEjwEnH8jMzdrLaVF0yPf5aTLWFHRsuI+XUVZ5/1ZElKkWJj7P4zf0qjznswUCFikol2LXxljiy0lAh1xUOWj5fKGM4ob8qentln87fYyc1HL8hmgkrgL7AWnjVOOHX3c8+1/t5Tq/FloUzYKMxd3qYTYk2IDWxn+rHJ49oylFsIXVNnc/Kjk7C5TqUqaQCyxvOSYlcC4/s2VNXc15rFODQkGJ0XNgKULZYFHu78xSyDCWeC/6bvye8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APZuAjnkZAoZNAznap0ETE1HZFaP+z9WuLz81YE8CwE=;
 b=EgEdVbC1nkzN7hVQa5B1heDh+7asccspOxfuuHjUBoH7PcJJrSjguXSJt6jEAfs/Q8uZmITA9Bm1y4bNCc+ikdYNQ7zcur4HPmf9xQlyHTeIWi8h8YbdH4EirGL4+UwK3NR1v+onU7YUbWmiwyqClqq8v9hV04SDXnkPg74vHXZUiA++TpcVYZAnNW83B3qPwE8nLmYWBZcYJs4iiJxFpwgDE0c7gD4NFYTHOnV/TIjelytQqSpjMafP3FBasaWzY3lHt8OqVxUg0qDPZt8vn3h/vTYyxvaudZrEvRLCTTpvkiBvPl91HDR8Qrg8Ngz5gOsVJ4HNfO1Nvy4a/2iyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APZuAjnkZAoZNAznap0ETE1HZFaP+z9WuLz81YE8CwE=;
 b=ock5q6a/WZmsMWTXkBVYHaJmlEM0eHyFE42xhqEmJOIVEanT0O9prPNBwC1yrQTj/ejQbo9ScmmI4UD9HD/fy1lhKmgnCCAU/bg+RVr4GiMt997/SvJbTK6MMN5zma1lBtcE9JJtB+vCCkJZ+6tsM+O3kY3zzzyK57g/JfWQb4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:12:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:12:43 +0000
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
Subject: [PATCH v4 00/22] Add USB2.0 support for RZ/G3E
Date: Fri, 21 Nov 2025 16:11:49 +0100
Message-ID: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 0d27d576-660c-4cca-dc9a-08de29106b75
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xHN1E9KxTck6lHNSr9Kn16ic8TVfO9xfIVnLjsZXI259p1izIt+oc//XVBBk?=
 =?us-ascii?Q?XG00qLYbJ+oTQomXb7kye2ro8E/mxO17kgHDT3tn4zZ6ZwNL8sYGcK62KA+l?=
 =?us-ascii?Q?gOhDnw9G8FUWlcET+Xmx3Y7wQ8O7tuQVx0pb7MwkRoZ+k4L/RQV7/BAy0Cug?=
 =?us-ascii?Q?wOHKXD77LGRl2j9vwXKtn3asRo1jZTYzyuiw22nC1/2uRdBgAG5OcHJtaH6P?=
 =?us-ascii?Q?ij+sD+ewp9o3R1qnSP9w1e19sl8U8hzVkzYZlvXIHZ11KnuGC2zV+io5je9a?=
 =?us-ascii?Q?we+9Q4XMa2d/3PBmRcp6r64ykZeBZ5WBZ+GYQSWNnZy65lzmvRe7dTDuQf/U?=
 =?us-ascii?Q?LDL/UJOlMSmD/bg590VG10tNnOwmLp5aP5/w1qn8fgAIsHauPsH8Tb+pBWeH?=
 =?us-ascii?Q?iTPqrMRJBlTaHlBkSRIXY/jCQBSOOX9+o/yedQajX9cNYGM5mdlqs27JUNLC?=
 =?us-ascii?Q?uVCIfr6reWg9qhjs5j21tYFhVw3kmwRcchqfEnUFgd02+J8E90XSa1Glf3KL?=
 =?us-ascii?Q?3tr1bbdn6OzgagKW0aHF1f59+7tydAlw9HrgVtsCa6KI+bsI1tQa489i5v2W?=
 =?us-ascii?Q?ydBrQrG+O7dw3lPNcJIYnnKQT9Tp7aB8DXa+2b4Cg2o8TVOhiB0LjZzXzqQg?=
 =?us-ascii?Q?aoAG3EFmPu2X6lTLTC4TA+xpOGoOPYYuktNONamulBQgX88lT+Cqx2h+EUp3?=
 =?us-ascii?Q?0nZcIEc9tphEwv4EIcUeXIbiPmNCE96yGEAkXJF2QeEvVZSCSeQ8CK8RjIG1?=
 =?us-ascii?Q?g+tMH1AAKuWnu2iqwytcOWPjOQHqf3Ke/f9MW6SaDXhopkpCGjA1kjJ+bE7O?=
 =?us-ascii?Q?8aklmuQmlqen3gVXepAS3DMR+O7DtfJv472nP4V52FzwJSsP9CyIOYZ0OA9g?=
 =?us-ascii?Q?CHUxy1oFjhfShhizFkB9eiY5LEoO3bHuab1j9Fx6+uQogoMEYDXl7lUhIpM4?=
 =?us-ascii?Q?x/6XSwVELaz/SFO0hG9QVIxUE4d9bNMMAgmXqZ+QG18UzAHzuw9+Gf/ZYx7X?=
 =?us-ascii?Q?QH0+mTJ7A+TrQADxozmsoAPKOGhvg8aNh+6uHic+LSSWNcEwhlazGDkPF+VY?=
 =?us-ascii?Q?GA3cuanBOq0aIMXQlBYgvJS5ofHLd2FIBXHXFupsrhdrCckUyltGz7p34eE7?=
 =?us-ascii?Q?o3Dw66pNvJyTzsNqai4vtF5cAIH85QKAHwNRXcjoC1/7Nacx8xplOGc6JRuy?=
 =?us-ascii?Q?Fl6Ah92Xjr1ABOsKhaJtr/5UMgXDXxA8iLJy/KNdANtcwZROhvjNdFXa4i46?=
 =?us-ascii?Q?1DuT0VVhinjegDp30mFII5TYaPEicV5CG3+atsavUYF7i0UqoV5on7/MlhzU?=
 =?us-ascii?Q?IqsJeZ2iE6zN+jsWvHY4m55zfkC9Ec5UOByPv4YvORvjEQDmq5XRtc5jLGdW?=
 =?us-ascii?Q?bwdrdrUGxpKGylqw7tpshbeT+lOaO9L1F7gFZSvEsZHg2rM8v6Ualz8L1Cuk?=
 =?us-ascii?Q?Fv0f6z6xJfoJsLwcLUc94Qz6PVCoo+ctw0R+PO2GEoBh5SH55qV9BxAf7tsh?=
 =?us-ascii?Q?droOaOEWhhS4uP0VR3VEc2jiQvHIQ0go236u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ViTRGUrqzQu3lM2NUDKzQIP8rGMQE+R9sD1tMvZ73pOnyAt7b/VM/kotrRHK?=
 =?us-ascii?Q?uD/eruskeWMoR6L2Mc47bC/pUOnSKO09JL0SBRsDdnaLBfxdYUGQbUxQkV9k?=
 =?us-ascii?Q?cdVavtRd2MYH0rj3u3WU9jnFJvTU7BkeNv5YBUUoJ4+J+USKula1CT4pU6Hk?=
 =?us-ascii?Q?EvksSLwHYXCPJoRMurzZkddIei+Phy/D9dhC+dyA4KwM2Fr4lm3j/l2tKGhp?=
 =?us-ascii?Q?Ikivi7SwtHvgTeAMScIUXlGpp/eV05Fp5Rpo0zERoueQImkS5OHCcmdbRB/o?=
 =?us-ascii?Q?rnrP369wP+ZbMSjPur8DTjrfTbL1OilEUkRjs1qO2QgrekoZc90259C8j2E8?=
 =?us-ascii?Q?OLqnUBmIRvPUzqR9bjjZGWRDqnHFgQsvGPak8cSdr6f2kGTMor7f6sPYZo0i?=
 =?us-ascii?Q?DllSfbDMMhlbTDy5VfmA04rjUOnAVWr8FkOo6fBnv5NJquYSbfBnrOT3GLoK?=
 =?us-ascii?Q?cueGn5r9vXw7zGsutIqV4IcPtnmGENKy51chZjjgHr5nT+JGyCxR8toYRFme?=
 =?us-ascii?Q?eHWwMHG5JUEI/bByhmd4u3xlhW/CZKpnlm4BL6QWwPZFwfmlkCY7WbDsXGP3?=
 =?us-ascii?Q?94RyfzY4hKmHo3TFBgD6DcTBZ5Y8U90v0E9Mf0an5SpM9Aly3HZmw4lMwZaP?=
 =?us-ascii?Q?Achyxyf5LIwbF67OkqWpUmN32WXFLppG3SbTS3VgVEMIghyR9xOeV4iZBowf?=
 =?us-ascii?Q?hBRGUG4TU4lRadYxqG7EsACcXqIx0hVjzR9LMzxN+zMjaWdJ9huw1x1GVhaD?=
 =?us-ascii?Q?9/kace8JG7b+IDc8JYgx7tPNkAvRRZmHv5ieo8B1lOaxDpQwfObI+cOMnY6Y?=
 =?us-ascii?Q?74oFOPg5TVq3xOwNb3MhOvkT6blzQASp6OCHoEHfacA6uRFycOFFJc3u0bm3?=
 =?us-ascii?Q?qdeFrWUMB0LVNDta8QEUsX9nrKnTZ24iIL/X9f+cQLewdjLEAyPaV4GQZBPL?=
 =?us-ascii?Q?3EuT8cFpOXma+nFondGRGpDrULY1x2TLsagDLmvelNc//SymEVCfDHwZbOk1?=
 =?us-ascii?Q?DFD0sq8xFCNf4JGOievdT42l7iO4j5tlGdS2QtVOgiwVR40/hx9/QncCn/Qr?=
 =?us-ascii?Q?3a7nlEgbbyDLIrmAL4dukOX4iPpQaggoKbw//F1C4xqU6qGS40m9iWi16d0z?=
 =?us-ascii?Q?+tZNzznSmqx9M8eAspdBeoQruxP6pBA7Wly37fG2mvPkOnDx24gFxXOzE203?=
 =?us-ascii?Q?/q0ivAfn+Ve39UhrXsUYy8JnGwXh8eTO1pDInzfYZ3+CuEivCC5GWe6UaYbC?=
 =?us-ascii?Q?UCK7RItnskLXLYQ/tc9CoeaIMngmIJ+vMMNwWhvW1EiRl574YUMYEtOvzmC0?=
 =?us-ascii?Q?sfkanypEfDovdUkdEe2YYsLf0fSCzE/YeDBNyw8TjAHpWo1BX7ygd46w4iI4?=
 =?us-ascii?Q?vk7aWOTsMNAtkDg/lOBUjSdK5UIO12ok+Is19nZxATjd1UhQCx97UK6P4rhd?=
 =?us-ascii?Q?FrQylHheqslMxpAzBdLjfJRLrSlIfIVJ5J5KA+BbdrQghEo4vOT45SrxSCu7?=
 =?us-ascii?Q?44AuwFlAJK90PWjSB7SkWMkOWWqmGKJdZGeoskEnuQujDtbNp4T4W87qoELV?=
 =?us-ascii?Q?1lqTva2/lxlZq435E8Jp9Svl0B+EU5XCEG+2Ny4ODm+eeLGg2LKP2Q7GKsMk?=
 =?us-ascii?Q?oPzZhXXKIvKleUI+yBY5uvk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d27d576-660c-4cca-dc9a-08de29106b75
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:12:43.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiM4XI+Dz0nD2CCQYszk0k8Eva7ff7AoRCxMnfjLjNhC+SIm8XuJzC3U48Y6Tu+eqC622Y/M+tBfICH/V585EoF2hIBIz8KFNMmyer5V/Bkc/6I3GLUJZ8FwQyTqv/wP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board. RZ/G3E has USB2.0 IP that is
identical to the one's found into the RZ/V2H SoC (R9A09G057).

Thanks & Regards,
Tommaso

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (22):
  dt-bindings: mux: Remove nodename pattern constraints
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
  dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
  dt-bindings: phy: renesas,usb2-phy: Document mux-states property
  phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
  phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
  dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
  dt-bindings: reset: Document RZ/G3E USB2PHY reset
  arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 .../bindings/mux/mux-controller.yaml          |   6 -
 .../bindings/phy/renesas,usb2-phy.yaml        |  15 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 125 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   7 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   9 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
 drivers/mux/Kconfig                           |  10 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbus.c                  |  97 +++++++
 drivers/phy/renesas/Kconfig                   |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 263 ++++++++++++++----
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 ++++---
 include/linux/reset/reset_rzv2h_usb2phy.h     |  11 +
 19 files changed, 644 insertions(+), 103 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


