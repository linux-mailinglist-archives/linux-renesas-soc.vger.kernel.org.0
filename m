Return-Path: <linux-renesas-soc+bounces-24975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996CC7A861
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E97C0364064
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C613563EF;
	Fri, 21 Nov 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Cvr8M7Ln"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B7134CFD1;
	Fri, 21 Nov 2025 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738132; cv=fail; b=LJr3BRuXp+57O+xMikqsBnnjudhdn1K1mLZo5XQTF8QdToAzW2iqf+vyRHDlNpGApV+CT/nyZG9tCM20NiTPwRqYH+Hou5bCIzEvjfIQMMQC2HZkYIWv9Njv9ZhmQ6v7FS40p4j/mGUcxNQ49Pk81SgyrTLiXqQ7OOWgFwIZfeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738132; c=relaxed/simple;
	bh=gXCisICLK6m3xWNzLiWwXPpbStbqM6usQBs+DF6mAiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SSdWvNbRj6eYQB57jsXo9GOIXZWhKh1i20PMwuRCQkVYzZJfYzdPTRSb8a34M+SjRdQKqcCyubBM2XT7QQYsUSTpa1qw/1XixXzou3vs578zVIXh2n01979szd3oaDuxdzPXa+pAunVD2VjiKhIfshstXjso+ry4U/qRnuhccAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Cvr8M7Ln; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHEI0V2OCqNYex+Q1azW1IidCkHiHef3cJTpxQQcO73c/NrXLX8sQE6Q9K5/iWWEo6vcQ81CdWBjBEYHW1fqeYetwfkhQPxi+3dZ72lC4/1Ed+gedWdBlB+GTalvZnvoIG1W/nwNrOswrxhS8puJirPfedk5Xaih/FTMYqiwAGbDp3Siu+iP5Cnkt1Oz44w3TEKaK2knk59vZjK2Kj8vCDik0gLHqpdBUPMVBQiHdT3G0R2t16y5UQwHHzTasHmY9gYecps1rEyrqDoaRr7m3QsK0RquKVt4f+C66YkPL/Q2aWM3E6ORDKUrbNOy3tGBkKGn9IAEFwI3keaqITBWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QtS7FgQrXhbQLjOnPTQ66NYwa4mBoPg653egXqu+eE=;
 b=waDVOY7JfHK13xeXcDOAD3An3fwW58/4wXLML4YTW8yHyTz147wJKiBV6Pc2GrKZ3661lC8VPunDmACrMV58429AZJ9EnVbUOQI66TPz5iemd1oG7V39rZZTMSW1x/juqBzDqrkiXLz0/SD8Njy3S7rke1vZRz41mklJlO6spBHo6iflgba5yMdmMc4AXHiIN+bhvrjt6screPWQtSey+SsgaQAHeoL5p8CgFT97o38+HCqCfu+3CbF2bxT6nPsbe88+/n+C7lQ5E5D3SKJvJjtAIn6RXa+gahIS6ZSzbKLkJE1G1Qw6AVfP5TmAtMxQMWVd71qwjPG9DCrDeHZnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QtS7FgQrXhbQLjOnPTQ66NYwa4mBoPg653egXqu+eE=;
 b=Cvr8M7Ln+LRJWd9eGm+sdkRN0O9sBs5D8j9BYBD45R4H1u9vXdc+anAXMs9WRP98kr5RO1CQdHE51GM5bES0p34LAQoH+voy81P1xaxoSLUIwX4nox15T7x6qJwhAPHARzK+DM7jIUskvnVta+/TJIpx2c7mMPukyLv4trMjC2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:25 +0000
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
Subject: [PATCH v4 18/22] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS support
Date: Fri, 21 Nov 2025 16:12:07 +0100
Message-ID: <6fef4844abd18112977484c2fb82f6cae3cc3465.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b425ebe-947c-4241-61be-08de2910cbfd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ugN3jj5aHvYjvjSR4qAzOO0SfkMunUCTNMX9946n5HTW0UDoxO9zFLCqBo7N?=
 =?us-ascii?Q?eJk1KBUSnJuXjxF6SQktQ0msXwtYyAq/uN+txi8RW4xuwPMBXoABnxqpxmpw?=
 =?us-ascii?Q?ghV1geNLEnFDznTu8QHL3nQ/yW2QVFWVdmZz71cCSDtCkZRJ9bJMIv/hyMvt?=
 =?us-ascii?Q?o3yk4gDle/Aa1KXJ9U6nITw66QOEXe7aWXlywPwRdZU90or9btjx8PyXAOSB?=
 =?us-ascii?Q?notMQwVuQtD9AgMxlulWzybB20kqhfe57UcN1L6l1uFm6n3dtfrB0ANrPjP4?=
 =?us-ascii?Q?ikjUcSME8t6ErAJOdUWkIWniBtslbAsV9/zTG+PdKDI2dbbLfdOE55v2vRjP?=
 =?us-ascii?Q?EktSvRB7oklksTpqreLqCHSB9RiAscBMOS8kPEh4CLzU3Hp/GGbmWO1T3UtD?=
 =?us-ascii?Q?NaOIL/H2waYOW/SmVBKo1mFz5jdr2aBDt8l6U0N/yCIwDAeoT9icPLAk096j?=
 =?us-ascii?Q?Pyv/BBp/lbE6Qq7Xs9t33GYdMBp+FUhDVhIRgGoE3vh/mSyhFVQwlwM/+8ZR?=
 =?us-ascii?Q?yKI6JxUnv8c/06E8p+QK+ta58dxlqnWi8NoSY0//QNYwImBzSsUDpvwD9PCi?=
 =?us-ascii?Q?52Rer/w/J01QFCGBYFWX4OWuzmtgZA6SlJUXTlB8iqa01KdhM7neRMEQSRIQ?=
 =?us-ascii?Q?79ZRh4f9vLrb5O6EnkK/NlDDAa+zFpPh2MLgk12wvuN7QK6Mc6BICq0PAD1C?=
 =?us-ascii?Q?B+z+TYAD4eCQ+4qPYfyXfD4U4pQK2ASQWfOTyYl6JjtXXvCBs3J9odTu0fYt?=
 =?us-ascii?Q?qppJNVEeztgSQsCHFubBsxKGvjlFXxF0dxobbnChmnOcaCseOcTBcfMtJ35r?=
 =?us-ascii?Q?yPB7PmMGqdxufyOktLo9nsRdyvgFEhqy0Jnr+MZn1Q7LWiz4cP2ccU+3nMtW?=
 =?us-ascii?Q?zyjT9xgxB0lBvMCEQ5u9uOIUYMcMrHlK4sso9h/RC8CeUM66Y6K3y+32ctlA?=
 =?us-ascii?Q?gPpKuKLrWwvXY2JnQ0txGbWxmnAsI1wdtju0kFJ8B0HwyNUf5m65EABUq75J?=
 =?us-ascii?Q?Gekoyokueb4g9JzXhlSnCG6kXDEeqUxZ32aGq15Xa8SH+E27YHvDKASh5Z8f?=
 =?us-ascii?Q?2wy8dHDhACTFU6PV8lDONjYY3QGyMyV6v5EhKta1jyp2fkjOdZkgjmfZIPtS?=
 =?us-ascii?Q?Ig+u/lslfxGMk1z49Ri8UBGzq7Jh+1/JwmzMFHenh2ybyNwgW/8PqeIT3IeK?=
 =?us-ascii?Q?BNKSkwqII8AogjHdiJTN5tmnFP2q6Z7XZUSKS6vytIrK2Be3eb+l3DFf5jF/?=
 =?us-ascii?Q?az/2uN2mdenlne6r1ZleuQk/C7JP6jwuZTA+uj8FF/IZiBzzsID5f0kMn6Ux?=
 =?us-ascii?Q?qIs6wnhzM3Px5nHscnA8FTlQVTwYxLBmgxdm43I15FZZHnHFEoNhJbVdI08r?=
 =?us-ascii?Q?/q/73IHfypX2riuDrk8Kwffcqzi3JIGR6VBieoFODyph8z10DWI1f03oX16m?=
 =?us-ascii?Q?gIMPCrwg4vmWxNcRPNvIeRH7YD4ST5nJyFO2LoqAgoKqir8AafrfghG6gXnK?=
 =?us-ascii?Q?4NevM+6WpvmPGIREz5lnvjgHzRUGSS6sJdb/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XHP9ESBPDObswwPYWY4752kkfEBOBGScAFizLk6sWuPL/tas+FtiGx3KvFQE?=
 =?us-ascii?Q?SdkYYBzwhfUw3jbklK4dq2ARQmbXqa6LerUh5wQUpawceDbXAAtvztJDHEvQ?=
 =?us-ascii?Q?QKJsVj7unMMWYYo07aR0+/a8mVg6FDMiA6Eikhm6ljKq0bQcgmNoP1YtvVpx?=
 =?us-ascii?Q?3GnUKcvzEq0zHOf/tgMO03z0L875d0fCA2soweu1Xp1/TpZ+z4jvbgGCiIJz?=
 =?us-ascii?Q?3zh2z2OaRFQuLKkIdDhVgKdSRooRXJsrO9ejBJM8uu3Z1S17Ddc7IadNCsxv?=
 =?us-ascii?Q?GQHS9FHFkWUinwH9101rJpBke/uozNBdYMBBHsdsRn2LcxT/ku+FNYOUQlin?=
 =?us-ascii?Q?M4+dTpeRzg6wvddXjPpQyvLYDZivnJPYIX6rcS+d+39Yii6e9Co+ogHrISKH?=
 =?us-ascii?Q?rDpG1THZaiRqFTLj6XXgognPVmXR2H/XrIMSf6tDF4TsD4RTVZXGMzQJZb9W?=
 =?us-ascii?Q?rVHgVW0qgaUe3FqVbIIJKNjE8rmmRxb1algq+9PowDjBQNRXMgDJe+9iifrr?=
 =?us-ascii?Q?2pJpz9n69NryvkB3JUdnnpxhqANriNT/FprAtmpMT7/Od1uMg5hYyjn5yyQe?=
 =?us-ascii?Q?pUGY98xw3BcCwe7W+hAUI1O5XfEV7uCBEVpM8loBIR4wXbSXQslnSt2++s6g?=
 =?us-ascii?Q?TAfU8DOnHfYUIZBA0H2/uBNXgmz4HbSvaULSED6yx/C8wlQq7DHAnohzPnk0?=
 =?us-ascii?Q?GCVunPtUh04uL312DJkTqw0RyMYtQQzPzdvdKrJV0JB/Z/4Yst+KCKJFq089?=
 =?us-ascii?Q?VILWbPW/B224EFJq4E/YRxQRZAaRrwv6DSngbO4lfLrm2kUT8FT1np3PfOL9?=
 =?us-ascii?Q?UMGREA8zzdkNbezSDmpHpo7UFSUyoubnbGDNodVoDkQY9/tXIWKf10thxvBv?=
 =?us-ascii?Q?7niAmdbSe/vPa/JuThrQBqldD8UwmhV8U00hNGi6x4uw59CaBsDd2XqoYAdM?=
 =?us-ascii?Q?GzN8pO8Rfe8Nd5kkZfHTcPWjHKTpMKYFVZo4xUm7zzixmunFJLXIhxToCTiW?=
 =?us-ascii?Q?2lcYKYFAoJltr1Oe96t1fk6eTxvZktEgGkVekdFlYGpGIlaKxA5eFk0DBgzo?=
 =?us-ascii?Q?tZgr/KAZG5ZFLzEHKXaFklfJ+rO8L8cli4H6nrxw0/nJaZKhd3kYfEWpPvas?=
 =?us-ascii?Q?ZQVfHAVgQ/btV1JO/o8n8MkYvZAxcNobWfgRp9DTHqn6Fh5ARI28CN3tV0Ni?=
 =?us-ascii?Q?lyCuZYbBXNEXuoLlda/dlt0MWp18Od+S+x9wYbIZJBMeURIktiAXWdZXx/DH?=
 =?us-ascii?Q?buwnsCfHyatluHG2vrZErtpxzvV8N3f5XaAeIRyLaG7PoW+p7HCJAal6td24?=
 =?us-ascii?Q?y5TbWbthI3e9jO7uwf6gvsDk73oJsLNVmRMywuq5N132w2dyGeGzPYyUNz1f?=
 =?us-ascii?Q?y4seMIXnp4talHE3McMlHS54FcXyzUTE9brxP3Wvn+H62+kV1ZRLVe41Kigv?=
 =?us-ascii?Q?5b2JlTREp8+5DClWNx2qNspRFzWD68pz2KbQwaw29UAjyK124UWNL313dR60?=
 =?us-ascii?Q?ETN3iI26l0znuUnZMOhzzojGpWOdTMTIoy+dTLrbPy1F6YgFHLnxRc97jQAi?=
 =?us-ascii?Q?u7iWC5NWjSWngeN1oGxx4A++pG6jInNJg0LbCvXaNUU67Zh3wab5KigJi+fq?=
 =?us-ascii?Q?Jn2J7jA/H0NxCKrb4MlPnec=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b425ebe-947c-4241-61be-08de2910cbfd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:25.5644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxiTgeYO2ClZUVS3zUXdxz/6gGlqFE9slm+Lemlgr9/C7V8RySqM4ef2PRhmg6kr0MgNtsPLJyw8n/cIlHyekeezhgW0GU0VndjeLbtDbwh2klDVUuPaZPsv+Y/jL5dJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g056n48-rzv2n-evk device tree.

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

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..54ed7cb2d73b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -389,6 +389,11 @@ &usb2_phy0 {
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


