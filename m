Return-Path: <linux-renesas-soc+bounces-27448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDIoI8ubd2n0iwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:52:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B88AF61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7D73307B2E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E942D346FA8;
	Mon, 26 Jan 2026 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lj5B0Hjy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB2347FD0;
	Mon, 26 Jan 2026 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446030; cv=fail; b=rOWDcozLroJTyw0ACN6AOh5uErhEy6GPg13m6bcUWPGtA/tC2hTwLAsVdPbBbXlu/vNXTVnqmJZiW30V4/1VxrE7F7i2CHgDsHdrEBcGE5Oa2cfdUuH7zSAqWbSC4oZElA/Vxz/UlpYADRvRwsnBwfZQUAjp0/FbQLogPup5Pjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446030; c=relaxed/simple;
	bh=gPHMuFU+yyhYVjPmOdv9cWzGykwFszeuTuzsvGnf86s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o4eHOy7CDCCSKNTLuf5zCZxgznQY8n2zcFVRdr8fgs3IMFunSANlaKS8A0r0A89evN6S1qAckust6CtCRRj+V2P/T5H/jW2JxRmIVvB/aSY2WrohEQhHOhe95DNi1YqZODsyTCaAd5aegzG7JY9GOTqvIq350LL2pREAbrHhdjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lj5B0Hjy; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGY6R/2HB+PDUyQZ2sh9r3bnWPQ/EW7pWAPm+5bGvrhjH5lokkG7U4/AE/PDrhCUdFTFvF0UmntltlksjG/KIrJzQa/wHI3vjQJ/bzVCh2Xeso+vMgcoXrbbcnXXeD77n+wxb1HdUTezqZNFRFCAzQIoXMAWo8krFBiawVLtZpK6JpoKnclxeABxLE9o4bPglOyaJba2WfPemC2BsEv7ebYF5TterTpKasekdHvS3VBY2DiBe892otO4DMXOA1Adg051B2nyLFDLh5L/tpxb7gXCnlpfZ8+Te/xP0W9P4W9W21Na0hNLGBNqbQEwDDoViUJZD5FO6gY/Aq/wh5FPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UUc1ySr6gphVcS42Q09L3ojVWzBjNANuBVqkCFcWKg=;
 b=QReSWjwuKvNgy5m8Re5mAsacSqj2REqChHmWZnplVQSWdQ62P7pM9AtmiIpBCaIJ2RJQhN/sJ2stnWMP/ni06vFzLLBgprDgzl95qmOfBoF+ojxUlIgV+2Ht3KjXm8Hkxmt1mk7fEsgP8c1tMd/Lqu/URH5t5kf7OMJh2ClvLPWZqh5fgvnSkFSKyKEQ7KY7ZtOoDdjyLs7LPI9JlSa3PSmmNRfpiXUmIp6Z2zxRUyR9FQdxzLJ5eXhHo95rwQxQcIwRTdoefGfTQwaZ21KM1TFqpV9Rordt4Z6fRRKwkeQBWAthfRlonujDMrZ7Wz94NpjabfcdjnK7eJsCQhsgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UUc1ySr6gphVcS42Q09L3ojVWzBjNANuBVqkCFcWKg=;
 b=lj5B0Hjyxi+nNOJF55v0bGEtg7hGcfckZBGDLgPmXaYClKVKUfoZfE+NMdDYNQJxA25q4ha9m393zOG9daodEFLPUE2ab27fRscENlfhD6sXhvsc6rNES0Rn4wnii/pjJxbd3OJzLQrkutmg7Ho0fRwosv5+yF11a/p9gRsOTPg=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB6908.jpnprd01.prod.outlook.com (2603:1096:604:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 16:46:59 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 16:46:55 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHcjHDWKVQGsQL56EK3j19qoXP9lbVkh/cAgAAelaA=
Date: Mon, 26 Jan 2026 16:46:55 +0000
Message-ID:
 <TY6PR01MB1737770235BF9F3D29E4E71DAFF93A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
 <20260126143114.GA2223879-robh@kernel.org>
In-Reply-To: <20260126143114.GA2223879-robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSZPR01MB6908:EE_
x-ms-office365-filtering-correlation-id: 0f772eba-cd32-43a5-eb48-08de5cfa83b6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?P10xi6sRhMALSxTT7cqEB5V13k9G9rQxA0TPJHfr5anq32HQMbaS60V1NJrM?=
 =?us-ascii?Q?IzaUc9dwPq0jS8uOFpUcGRQOShMdElCTvVeZdNAKXG2f/gEhkoxK5Pr0J3wx?=
 =?us-ascii?Q?IBTQtX+xZJ1IXajo/1TvrWfGsJvAd5gx394LPiGYnUISPHymC/CB5yI7i7+3?=
 =?us-ascii?Q?BOIaZ/5qMRTlaja2ANQyBiziQlm8NwIJTXZvKJSOBOg3q7WhxZcib5PGOf8Q?=
 =?us-ascii?Q?vDoOr5kIAz/n5IoVmRx78db9PsW9Nd4KTPP5hpDFsV1n0YKxy8Zc5ugIXCbf?=
 =?us-ascii?Q?7dp8l/3IQiSlJoP858JP8O56WbLob8MWQa/KK9TImLNjrl9LKf2Q6ObZv5DH?=
 =?us-ascii?Q?ooLJTEcg5qTG4b9JAijeikEA6u9SjJkZhNFy+IVSxpyN+xE/97PyY3q5utY7?=
 =?us-ascii?Q?9FcqrT2PQsK7Aj3eVnf7rmczv3458ThZukPvEtqTHvMOlVN8LqeuTdQBUhEk?=
 =?us-ascii?Q?M5tiiQN+JGyKcl2ln5Z/g3X6UxqiLIdNkgDXA2UAJtmfwsJ29BwhdacrvzmV?=
 =?us-ascii?Q?5qoTX+nmaddxd4n8SR1kD4O4fK02KTaCxDBtvRjJxk8m68FgVqzCOt8sx0aE?=
 =?us-ascii?Q?9FOuYGcvXY01SlO9L9c6sDmD5S2QWFpzJcI/9yxM3BczsJ5E7VMY/Mgaelp/?=
 =?us-ascii?Q?heMngp2zBTPhiQabkssOJbNjcfLCIG3KSlMB98lQm2+0MW4pVQHHxeCKZcIy?=
 =?us-ascii?Q?Fn52GiUV5pEuy3MP3VrmWu7dgxs0QGqIGJhEk1IXtLL+KSsrbR8a/95/w6U1?=
 =?us-ascii?Q?9qxMFiN4SBukZRaCoughp1ff5oNKB/WBgD3p2Aqv+lTDzpcesxz+PoJqYXoU?=
 =?us-ascii?Q?sfy4eM5tT5b62UqY4JFG0uKcEc59uiMASOcx18TAjr/NS8F7u79PdzQY1umY?=
 =?us-ascii?Q?qS3/g8kcaUZ9KGf8JyWbchjQdy7+/jnUcmrxqXzZ0R6g5ASiqtzvg/wGDo/b?=
 =?us-ascii?Q?qCnxFNkpjp7H2GC3U0GARmYjNthkAnFASepf58J+bTT2W8UV2Yb7vCx0UT9v?=
 =?us-ascii?Q?VOEf9uN/aHZioKdSOaYk/sFyaCXC9/S7v3cu91KD4jQUdxbQf/l5qRR2gvEn?=
 =?us-ascii?Q?F3TogKzTqhWOI5TxZ3forVwIf7/CTXNYQfrCGDFnjD39E8LW2X3U8VDHFEEW?=
 =?us-ascii?Q?FwYg/Yor38OH91AuqoEXgS9DaNULIg1fTe6CO2Qp0ppaxiaZSckMKTSE/mK8?=
 =?us-ascii?Q?E98RNi3TTZpp4qyp0HNhiH2wIu/djKgupFY40f7JEWJ9Mr6IWsnduMCtSLW1?=
 =?us-ascii?Q?+6ebrCDJ0+W2ivlH/h4fOPabsugkU/7CqFjFwUivHMojHLnFPfcPa5/00R4C?=
 =?us-ascii?Q?qI4Vwxvxm4bU+N5UWPyLxE16tU9Gs8Cf0InqIVuiL9vnetFp/9CbEvn3vOiX?=
 =?us-ascii?Q?3RaMG8UU02zuBNFz3iVgHK/w6PmVdV7SBPNlpmhLfAzFW2sjX10IyCz37pDR?=
 =?us-ascii?Q?j2nWwXjpUfYRylYfyBrneNtpEcH0yJQATI+L/2lJ4cZOHTfPLLSxUbsITeNX?=
 =?us-ascii?Q?+JyBLSYK72L5bpH7NfeUNbK4TFHC7tdcenJFYXMoXcrFskiyDTVcvvzmOPOt?=
 =?us-ascii?Q?SI+THkI+IU1L+UyxC49lQVFzbSWjuknVL5sAIutXDPtfeHzqbYfrJ+MU2nCD?=
 =?us-ascii?Q?jUZfkzCTGgCtJOFma3joVdE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q5FrG+ad8vvBxk3d/TQ57QUcopEvsg0J4KQllV1D7WPvOxq2IltAXLRp7QiM?=
 =?us-ascii?Q?EsPEKx6RO50ROnDfXQ7QxkCHDkOpnXUTYxFlJDCofz6nI3VqfMVBKmQYOvM2?=
 =?us-ascii?Q?35vZNVsh6NamIKNWBTe1oZoy464cR/MzTyBp7Ym5AePPoT1Ga6ZfXwR/iNM4?=
 =?us-ascii?Q?C8NAfi38HhCRrr1K8gGrGZt6WiM7gguMhM2HUNDx78H1/E4XqALzK0JJLOnl?=
 =?us-ascii?Q?BSwARbnxVJBEe7kOaydQznthWrJrp5L2c8fOHQA447ef58YCNrTXVCsKZnSZ?=
 =?us-ascii?Q?PS83JWx5wUz+mskhlOX6rZtwkvGqWwdcgbz5BcYjq8k3GhsR2ZXSB5J/Xej/?=
 =?us-ascii?Q?k30yRCrlmpYSyhmDQ5FMI3rgiWldMryVquRwKDlyfZA+7bC0q33pIWjnQD+/?=
 =?us-ascii?Q?H7WnxqyFCAWOtRIL11HwHDMzx6pFkSZXetC1rXRNid7wBB0mnSkvQ2ipOzKz?=
 =?us-ascii?Q?6X1HHRFwwhtYcIiGZU0NvaPCok9yvV1Jo8CJh4djGIRHxeypngcTzhzcc/jP?=
 =?us-ascii?Q?LsRbqcdQgIJaXsIdkaougZSpqJEKb+hA3VDzXP+5SE5LVKkxRg3ZN6nyca74?=
 =?us-ascii?Q?XtgG0jNrAgPR4ji9f0qFC+mYh6pQBbFShF1YwDvxp6BwQds7R/nq+PST7Bif?=
 =?us-ascii?Q?H6tbqOB+NKOzABIw0INNN06D6mM8fZtGyRR1B5fFtDCa6CG+e9CEQWT6aH89?=
 =?us-ascii?Q?PmjLp5jGFGoKdk2p5N6Ou0zIBqUIQEwSsFUOLvU1VAZzof4Nj+cunVhGSa1j?=
 =?us-ascii?Q?xVXGKft8sqnyf1dafejZVKI6bk+Kj4h6KPcQ4T94O7IoT3yFwR7wSZQ7v3Rl?=
 =?us-ascii?Q?IUk+u6AVq4P7uEMe1oi9+H6lTfK64IpvLwjNzsI3tADR+L3RHXBjQ4Q5eYKK?=
 =?us-ascii?Q?YZl0fRQZoyk2o2F6/wVVj1q0q3kLQ7koJ5wGEmORglg9/N7Vp7wkHgOh1ev+?=
 =?us-ascii?Q?c3iogmjOtTkyTflcfaSgF8xyWa8HjYeRNPz+TnYv3luOxhyHABsec3P/QMxE?=
 =?us-ascii?Q?a47pPGnYAorBYWVGfLhvctTpkymWioD+DcdzXEDriBdwEkybKn/19ckH0FKQ?=
 =?us-ascii?Q?Wg+nSn9+voBwW1K1NOs7U1MrojEp6yuFs0vrXz9GPQ+nXViW0gZy/oIduPpI?=
 =?us-ascii?Q?0czhwzHzucc1Dos5WFXs9K8Mq0ws2e3P/hfH4k5b2H7ahXXanNzhhXkQ/vPD?=
 =?us-ascii?Q?tA5Xf+jdzbPKsSBKv40Cpe+tI/R1DnaSkbNrJhMS79CPTfXedO/3C7psZPUo?=
 =?us-ascii?Q?kwkDywPmzB4gXjvOmMuzgWGTgcEfDt0s1+tWst/4eUXjYgs7JSYD2xZPuoty?=
 =?us-ascii?Q?cSMzlsSNrJoNFUMtfN/HEulnb85aLuegWCgvqGKAKcBxgqkrBG96PYeieby5?=
 =?us-ascii?Q?481SkXKsE5u13JpACu4lhRJhkFwbdJTs5U7P/309RSkcaQiXd5J+/8KNxiHT?=
 =?us-ascii?Q?UA3A+6iAodivguyUHh+b1/YicU6ABDc3xKe5YYrkl/zyz4pO56qrtg/VaPDA?=
 =?us-ascii?Q?C2E4KswWgNhrJEuRAK4TqytKRpERMMjfekw7CBR6eS2yXBp9zuLkNwNgamVL?=
 =?us-ascii?Q?Gf4q2qn912jSpFOv+MS0zmtkmQLu0/11LOvpI4YIv3KaoolfXZ6kfHzrOUvp?=
 =?us-ascii?Q?ZPOCj0kCNfm9Hc9cV3wDRxcUNX62MRjHXCq/nkZDp6H259hQNDoagnCjbnai?=
 =?us-ascii?Q?kcDHLgV9+ykRjJtkKu1Gp1MBFTTAgcn7L3mr0YTf/9quFemV0X/HrplkTpQx?=
 =?us-ascii?Q?gGCAHR/JJ5Y6C6rsNy40yxn9bisjYQI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f772eba-cd32-43a5-eb48-08de5cfa83b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 16:46:55.4403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfQki+qO63DOHDYEMligXXzvbM54IbBmD+pdkfT+bWpcvGFiRRGSCtguIDfyxYQK4gWLsoRY5Z5k2Pjlb7Vh/22gsnSG0uMZA0hfY02E548=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6908
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27448-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[bp.renesas.com:server fail,renesas.com:server fail,sea.lore.kernel.org:server fail,TY6PR01MB17377.jpnprd01.prod.outlook.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: F33B88AF61
X-Rspamd-Action: no action

Hi Rob,

Thanks for your review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, January 26, 2026 3:31 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie=
:
> Document RZ/G3E SoC
>=20
> On Fri, Jan 23, 2026 at 03:00:22PM +0100, John Madieu wrote:
> > Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> > controller to include support for the RZ/G3E
> > (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe
> > controller is similar to RZ/G3S but has some key
> > differences:
> >
> >  - Uses a different device ID
> >  - Supports PCIe Gen3 (8.0 GT/s) link speeds
> >  - Uses a different clock naming (clkpmu vs clkl1pm)
> >  - Has a different set of interrupts, interrupt ordering, and reset
> > signals
> >
> > Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v2: Reuse G3S names
> >
> >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127
> > +++++++++++++-----
> >  1 file changed, 96 insertions(+), 31 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > index df30f729d4b3..9565f1774720 100644
> > ---
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yam
> > +++ l
> > @@ -10,17 +10,21 @@ maintainers:
> >    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >  description:
> > -  Renesas RZ/G3S PCIe host controller complies with PCIe Base
> > Specification
> > -  4.0 and supports up to 5 GT/s (Gen2).
> > +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> > + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and  up
> > + to 8 GT/s (Gen3) for RZ/G3E.
> >
> >  properties:
> >    compatible:
> > -    const: renesas,r9a08g045-pcie # RZ/G3S
> > +    enum:
> > +      - renesas,r9a08g045-pcie # RZ/G3S
> > +      - renesas,r9a09g047-pcie # RZ/G3E
> >
> >    reg:
> >      maxItems: 1
> >
> >    interrupts:
> > +    minItems: 16
> >      items:
> >        - description: System error interrupt
> >        - description: System error on correctable error interrupt @@
> > -38,39 +42,54 @@ properties:
> >        - description: PCIe event interrupt
> >        - description: Message interrupt
> >        - description: All interrupts
> > +      - description: Link equalization request interrupt
> > +      - description: Turn off event interrupt
> > +      - description: PMU power off interrupt
> > +      - description: D3 event function 0 interrupt
> > +      - description: D3 event function 1 interrupt
> > +      - description: Configuration PMCSR write clear function 0
> interrupt
> > +      - description: Configuration PMCSR write clear function 1
> > + interrupt
> >
> >    interrupt-names:
> > +    minItems: 16
> >      items:
> > -      - description: serr
> > -      - description: serr_cor
> > -      - description: serr_nonfatal
> > -      - description: serr_fatal
> > -      - description: axi_err
> > -      - description: inta
> > -      - description: intb
> > -      - description: intc
> > -      - description: intd
> > -      - description: msi
> > -      - description: link_bandwidth
> > -      - description: pm_pme
> > -      - description: dma
> > -      - description: pcie_evt
> > -      - description: msg
> > -      - description: all
>=20
> Well, that was really wrong... Fixing it should be a separate patch befor=
e
> adding the new chip.
>=20
Will address this as separate patch in v3. Thanks.

> > +      - const: serr
> > +      - const: serr_cor
> > +      - const: serr_nonfatal
> > +      - const: serr_fatal
> > +      - const: axi_err
> > +      - const: inta
> > +      - const: intb
> > +      - const: intc
> > +      - const: intd
> > +      - const: msi
> > +      - const: link_bandwidth
> > +      - const: pm_pme
> > +      - const: dma
> > +      - const: pcie_evt
> > +      - const: msg
> > +      - const: all
> > +      - const: link_equalization_request
> > +      - const: turn_off_event
> > +      - const: pmu_poweroff
> > +      - const: d3_event_f0
> > +      - const: d3_event_f1
> > +      - const: cfg_pmcsr_writeclear_f0
> > +      - const: cfg_pmcsr_writeclear_f1
> >
> >    interrupt-controller: true
> >
> >    clocks:
> > +    minItems: 2
> >      items:
> >        - description: System clock
> >        - description: PM control clock
> > +      - description: PMU clock
>=20
> I don't see 3 clocks being valid.
>=20

If I get it well, I should use a generic description here
for the second clock (keeping only 2 items) and specify exact
description (PM vs PMU) per compatible.

> >
> > -  clock-names:
> > -    items:
> > -      - description: aclk
> > -      - description: pm
> > +  clock-names: true
>=20
> This should keep at least minItems/maxItems constraints.

Will add both constraints in v3.

>=20
>=20
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pm
>=20
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pmu
>=20
>=20
> pm vs. pmu? Are these really different? The "P" here is never defined.
> If it is always "power", then use the same name.
>=20
Regarding these clocks, on RZ/G3E, it is described as Power Management cloc=
k,
while on RZ/G3S, it is described as PM control clock while CLKREQ_B is deas=
serting,
and RZ/G3E does not have this control clock.

Other than that, some upcoming SoCs (such as RZ/G3L) have both PM and PMU c=
locks,
distinctively.

Regards,
John

> Rob

