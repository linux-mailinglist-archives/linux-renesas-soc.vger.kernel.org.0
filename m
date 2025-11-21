Return-Path: <linux-renesas-soc+bounces-24977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE92C7A80C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C80FE3A37A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B83C3570D4;
	Fri, 21 Nov 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cCetLNEM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7C342CB0;
	Fri, 21 Nov 2025 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738147; cv=fail; b=toIJCmoBhv73mDKwej5QBjIiZE0VrRfRZ/UUx8xMJ2hEbwasTmUgh/oihchKf11/xigNMMRmjgqljBWIIQIIv2nOdwj/bE78lrVocWjA6trNL4p6JZFQRBCf9Vui1KEnagAalW0Ij/oNp+/5HBgxlbOCDfp7n93SRdJ4D5n37gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738147; c=relaxed/simple;
	bh=xyUY3PClilFosHzQgdhCzxCH2daHoklcpa1tZLDGLYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZAgMiOkecZuoula2ke5KMkBPgiafr0qmgf6SS6CCy0as/XIAN8bVQbH46RED303DrBztdcysueMxQTA/FoZgc/an6Yubn+KJlOts8sPrvWhmOCFvsR+prEO9HKCgoRbBdfTOsxB8ji1WaVejxGIWtSiNNVKsI4oQ8fWQ0zgOLCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cCetLNEM; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJMMwYxzAIniLpLivatP6N+ruakucg+Ur/5nHRV9hJae06Kd7QaUv/82SOcfgNn86wsc4mjtEV+PqFyNQ0LZkCq8n3QeCFeDGzaIRn5xxuWdO6fgg7lZ5iBqMu2D+6KUCdZHF8YsAsIalBbiKyxjL9m5onTSlhi1YB9WyV14Jzsurhn2fdQAkncv7mQjB6rvx6xO0gdJR+rshKwmkDWDbyfihK53AZJuPCuCpPdZbo6Nz1LGEawpFmWpsby/v9AcofJNphnajwwJW1Ss7bWCfkbfUOIWzOtnjMWLOTPgzDXGvnxBEzPaw6/DJVe7dcE7nSBHr8XWJIf8wLeWc+AOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XP7MgbrYAKUNrYQTx78BYsKv3n5UOh7LiAjZhPL+dQ=;
 b=OkbsLW/IH2KJ3s3FxMTDGL3kZtVKYzTFJQRlOQMElAGbu6ikQZ2VyPJLVlQxILmrL99p/WIG9d5lU5JvWP0/YTGtoK9aNFJmAXrB3FEqeCQ+6LTUjSgwfAz1nfkG/UFnohueQHnMze5yCIuHtAzZ66foh2sI6gqZHU/kp39+JeFKfOT2Cci7JRYm0NacxaIJbOaZaZCyfAdtx2qG+chUD3tqyTN8C2Slya/g226usBgseA1qIb0ohyvooC6vYpMG1vIZeXrpF/9pUN5qptFcCdMUmqlpIHq5e/WXDBRFIo6nITmKAnpX/45e1qCcEJglM680jRF9lUr9VHx4ar//HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XP7MgbrYAKUNrYQTx78BYsKv3n5UOh7LiAjZhPL+dQ=;
 b=cCetLNEMxbzx2zRzjhCB+JnOoRtTG4QQecli3G81+7RkQ3FknX/W6TG7CXBbdgor+RRu1PPX6y9WmoAPPSIfodhY/W2cwQnrLQ6MvqtNkA7u7BetdNdZbloeICiibTynAXV403c7oR7bk8fNq0+d4ygXceEGcvtha2CIIfLxk6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:42 +0000
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
Subject: [PATCH v4 20/22] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS support
Date: Fri, 21 Nov 2025 16:12:09 +0100
Message-ID: <2abdd5c5d80d4d88bf3d9cde8c03510ce0166d2e.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB15857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d202a1b-7b2d-4abd-cb1a-08de2910d620
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2zcEATf6KCF1VuLGAWtS5iii86//Wh9uZmDZiFN1OWAbQTyVxaUxYOczr/F8?=
 =?us-ascii?Q?XEcs7s8hPEA2+2FSHHQe9QUy5o4trqZdXTMRnP3CNX0JlTJ74V7piMpEVRkn?=
 =?us-ascii?Q?5JXzmRstRs06AfOWCNK5MDRmg+I9TPreUwqtnsNjMBeeyk75hmI6VCRFH0aJ?=
 =?us-ascii?Q?cEwY/T1kVdUDJbQUuTRT5opG/FY9LsFRWrl1xP8N38mD1I+sUP2b5Sa5/OKU?=
 =?us-ascii?Q?ZoZHzi27o1yZgMD0M0qEa61y0THYKxclct/zZv6Py9txwyo6OQzr3UFb9Z0A?=
 =?us-ascii?Q?0ePjGCofTYY9ShewsDhJhEeMvGFnKWolUyhkHQ63YHkZynCliOZ6nazoshdP?=
 =?us-ascii?Q?A+NS/r7y8YZAeU63+seLNtt7ARgdmDKTnY8N8loRfjU33mSD3s6Tix4+6Rsj?=
 =?us-ascii?Q?BqDJ82zcjmwWwHtCUk9xYD5DHrFhL93kKJzLqqdVsXeVxFaa82G7OVR4kFI4?=
 =?us-ascii?Q?6hwN8ciw6arp+CeM5sdJ9DCLNDVWQqSb6SW+fL76BMiNnz0DQ/CNnUAmMg1K?=
 =?us-ascii?Q?j3hD01nyQQf9/P2p1/3asPpVO5rW9cKqNDqe3Y4xPUNPbfeemlT10OO4PFB2?=
 =?us-ascii?Q?8EONBkxm70NhPq88rtS7nTHeVHNJHM4cQI61d2PIFg7HuMWhtSonBF2vhUOB?=
 =?us-ascii?Q?qXkSq5Y5ov8sSM8KZlP+X0Ig9ajpmbGq3IOT+gF33N7HbxZDgmE2L0CiexGL?=
 =?us-ascii?Q?bfVtYV229bEx2SXx+sXW50QM0gcgVqiHutoqEeeLcr3adADM1UC1HHqhcfXH?=
 =?us-ascii?Q?nxOzRBAwBFqHj9ggSCa9nfl2fIE38TfFPBJZsuOSxugrsFxEJ9xNyOM2aXa8?=
 =?us-ascii?Q?YdMH5zhvaC3wJl0j1EwsYJNU6GBKmF6QoiVXl2Vcx5Wp7XDm064zKFmZh0xK?=
 =?us-ascii?Q?iRI0KCKMG1nQpeQUcuLMyke3FBeomkb6vaCq9kiS97FoWT3mec9qj/PMlHRu?=
 =?us-ascii?Q?596BKcveGfdAsYGrpwwhBEqupoixUJxXly/lz60uaUYDZ6FMxywOgMuwzbjH?=
 =?us-ascii?Q?HpkncBwMfMJ2PCc787lWzZrnlbRlDvR+erqJXRSNl3BQjW/GnxIElRtmEfsC?=
 =?us-ascii?Q?poRThduPto19Cq7De94pSt8UCRjL0mRY/GvWt4I3hKWTxo6L4eHF8P2Bzv7b?=
 =?us-ascii?Q?r0wL72oae4SoN2+Z/0qda2tVPpoLTj6tf/El+0dIBNU68Pue332ArlemognT?=
 =?us-ascii?Q?MEd4FiKDrosIWfIFHj4WFWiJgHZgj3dJOy8nqHn3Z0keQRTST2CM7S78kJ3D?=
 =?us-ascii?Q?qLCR/+b666VvXiWmVrqIUCS8/4y08bn/6dGq9/Y45DOKH8+Nwmb2AYiDXJ+T?=
 =?us-ascii?Q?SXXxW1iSIx3EAhgBejntIebiP2A7PvfhOYeC/udgVGhpJM98gfMBvncBcn1B?=
 =?us-ascii?Q?8bQvvFmAs1407GuUv9c8tThIho/ce83dF1oZYDcXozQMBMiZPMlTySfWa3V1?=
 =?us-ascii?Q?ohh1N5lgvjhd10aVFr5E8dMvobZpciWkHPQCvZzvf/+5M7xaywDE8NQUOwHE?=
 =?us-ascii?Q?TEvViAp2EGFiCcSHxrHJac8Sq4J69nwAx+Qx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PmpvfNekGQ4PpAtfotWyupUGn1vOszLNriS8WFRru28LDfw4BCG+nLeGQZhv?=
 =?us-ascii?Q?luej3dK8yhDPKp80I7rUiKQ0fr9VgzFM4knCSdxoS52xPqgRADnWIxG3nEna?=
 =?us-ascii?Q?AVVZUGsaYVKlJbwXYdSi6ppIQBoBFthsVp9wkBHuyFpT6JX0WkT3BIYxWJAs?=
 =?us-ascii?Q?oW83me0Z/uh/Cci6vgxahKzbsrcJAuyChUscDqscaVDwetE81PHon8Kulv7L?=
 =?us-ascii?Q?Mb3zB4rXpQB5zVQWyVxANfD5Ru7QjPOMlE3PTaSD3R3yyQf9sZsCEyA+PatC?=
 =?us-ascii?Q?MffmZBdo1ZQbOEU5AUj6yYlpbFWgnjlKsQlgNJ1Sn+nHq+VzoooC2c7s2biS?=
 =?us-ascii?Q?tEDuiiZTRHfM1a72I73yPTA5I/0TVWVg9inVQxKBaLe23Ck7tn3tVtlccWDP?=
 =?us-ascii?Q?KDvzrOSvTRA20CJ9rzQp9cZbONK1yLYza+Ko1T6rOGej+EeL/J93hlPU1jaQ?=
 =?us-ascii?Q?EGf/+O/BaSpJ3tfKrFS1fICM+huN/bEeHKeRzGUH+KaEglMsWYkGRSJlpS8V?=
 =?us-ascii?Q?ypGD8VqLSYO+NYEZ8seB9SsHKp5/rRO0ckrBX1tamQNUMfk4UjGXEA99WJor?=
 =?us-ascii?Q?MtQXD7FRUgjJM+zjC2t7FKk1Qyn8TQgl9NCYlssV6eKmdplq8qtrSDC1Ys7j?=
 =?us-ascii?Q?xE5J8sKjWsu7shOrmBB31mCU3F8bwNXYMqX8sDi9bvjNU2Pkp72nhOUjkTTd?=
 =?us-ascii?Q?U2yHt7zmZVeYwcVp2sgE4o1eJYWDaPggzCS7TBBqTZVq7u4ANS0zFk+JeXL9?=
 =?us-ascii?Q?18wfZDWubdnf9vuStPugoIW3vux+olSaS3Czuwe7bejIduYymn13rjlyf8VB?=
 =?us-ascii?Q?1ul8DqlavgpGfOLfCoT5XphE+/vMyOS8Q4uO45b/W/qe6pw7ejSHQi+Ar2Br?=
 =?us-ascii?Q?J23t7kiRze+x1wgKeV9DMRH4oY/yerpF5If3oQxe1nkcDjPL+roLNXBaraXo?=
 =?us-ascii?Q?s6tIf9ZlruPn8YAkFP470lM5FQBgAntwNAhX3eqDuDVicrXu/0dPf16PUkmr?=
 =?us-ascii?Q?aWzNH1e1P5Lc8XepvMHRzzJQ8OqC6yJuJyYsz+3VhokpL2iES+V7VcsFVNRG?=
 =?us-ascii?Q?fKnUi/gKVi7fUQvAe04pRkdvB8UHe5Gf8OkWxqhLpXasn4k1lVrTfrGHuiUK?=
 =?us-ascii?Q?oA5p3t6Tcb2aW+m3C87GbFeHJgTh9W5VOmqDQot+A1E/+B/1+jZSnXTKzFPd?=
 =?us-ascii?Q?LdEqc9rikBAaCKs5MUuub+fvkmLAANZ7t3t7WzdLfk25P1FTg9p+sFNoT75N?=
 =?us-ascii?Q?9ym/D17B8jSktuy+DKbZ/NtKFmaLF7jHhapNpA7Ge5bQeKhEIRx4gfFZet1q?=
 =?us-ascii?Q?ESv8x6lkduogQP2OKhJlq9Bb8KBjzr/FIsj2QnD/HcyUwkMaunBqbOzTZlTT?=
 =?us-ascii?Q?rJ2UVkkoYsLddMj9SnAu0fepmseU31a76IjnH41puGp7F4SqScZSbSczieL3?=
 =?us-ascii?Q?s6+aWquNusb9VI9DKpCw5v6ypS6OGq5I0JXWj6BZ9ups5MfEjeVpXT1Q8feY?=
 =?us-ascii?Q?v6QxgslMOzlWmAb5vPCiX0r3zlp+2rOTqihQoNY+PlhC4HjUdtruAo7QV3J4?=
 =?us-ascii?Q?kIDH9mx/kg6C5ovrJLJDCxaoSJXvQnfIfyVN/MftD54nLAdRv7HNgLK/k56Q?=
 =?us-ascii?Q?EDHy57iLLhZWk2aZpVsHzqg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d202a1b-7b2d-4abd-cb1a-08de2910d620
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:42.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QHYjkoXBKqLs2ruTORPSSRP8Cdb/ZE58dMHiiBn9gRJpQHNqCM3bwpD24/N/ealB/02mjt50OULdhlZvUlkJQVb8gCwBIZsAAdW+B+pCDFjMpsBx+F+TygqmO9H3jVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g057h44-rzv2h-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 445fce156f73..eeeb5a0be6b6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -440,6 +440,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


