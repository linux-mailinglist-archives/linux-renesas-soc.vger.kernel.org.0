Return-Path: <linux-renesas-soc+bounces-27562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJQwC59Memkp5AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:51:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B056A73A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A01D73001F9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 17:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35CD1F130B;
	Wed, 28 Jan 2026 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AZGbGrZe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDE36F40D;
	Wed, 28 Jan 2026 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622391; cv=fail; b=PTPO9xSxP7A2o9O7BFVgJmthQccmbpwRHeSanLhPNLyimFbAIaCJJgoKsTcJOdii0EcKb4kdhSPy/04hmlO4ag1MeUrG72yPl00r3g6EfEpKS/u3ozHddYGTKiFAnWJqmy1VDXj6pNbtUb9cFw+3VLjvDvJPjDEyYIs3/sMa/eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622391; c=relaxed/simple;
	bh=sh4/OmPup1sJfi+N6VdUsZZ28BesaTcS9rIOpiG+hgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M6GAtIJKdyPoHDxm7X/APf4TX94mr9udsAYyU7IHho1LYhatEiUbSfgtfjm0fijzxpUy+XjLETCvZj+AGnItUEXvuf/rAgFWgdnzrdzq2LR043+p02FCnjcD+vEQuaiT4HVu2AMg0mVzHe9MLKfUaoEcFeZYJ/Xsa9RRiOJjKYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AZGbGrZe; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSheslD2X986yzThLFO7QfdNOphKTsgcWdjeRnTT01NdhON/k6fVmoeOVVi42LA4pRGsExPUj9jdgbli5Ca0YgCfm07ekX0wGKmw5+xvVjBdH7dND5bgvoy6ovy98UTuicoZNzSidNPdkJWskiZqaWVeNFJW8kmm0+hw7ZKzniQy02S6OBV7+1wTEr0/gs1651PdJdCJOvmnEaSYsPSGnA9Cz8L2pELvZPLBoCirRDh77fE4nmaTyz7RkkNJYm9VC+KjB2TUV+MO3ighSYH/4mQwhPbXnPalFjMq9jn4KPBMMHV0d1k+RST+y1S2jkLuFAn45jEgUCee9fRTpABvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUONmBUmB8KFhntDMInnNyHsFhANpit24PQzzhJPYjs=;
 b=XmQyMDYa3yVHO2H0qMxuoTLFzX7VCPFyBPsau88pmRl/a57DRJ+2mF62xSly3oFpitRWUumUOaPNTrDxb8NArCCoq+0HAB3JlB1ImQiO2ZIhWCNZpmQbmGJoG7GzaS+7fm8zD/q0d+HkA1koTaGFOEXOsLU8k46dYnNOkaTsOepNDmmoVgF4UdGN8A/aZ7qFppBd0qcuEATtaz7e40Rg9/wH1HqQ5Dlnl6d66IkRx77UoOnYKmzglW6/HWrQZfAAWTzAKXBJ8ywT14hmkf0/XbC2LYD9KowTLQpy1kvOmZL1AKSB2AHyvhGtHNwOWUf8pXbrAn1Cx/zFcFSVWEoN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUONmBUmB8KFhntDMInnNyHsFhANpit24PQzzhJPYjs=;
 b=AZGbGrZeCm1umpN5FJvrVzsyLFu3qgz98ABthH64Gf/0gKZ0C9OmBmWazmOZTWAGN4ilSn+YkJMvUyrg5EjKcg04E9PSE0kFCzdx+PrZEKVlb1oEyQIUu94KDiI6T/LvCib7Wfln2iQ1bEvxXl7ZfrDnmv+x4hEkKgRbpXM5mJ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10282.jpnprd01.prod.outlook.com (2603:1096:604:1de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 17:46:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 17:46:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHckFiDnpgJp618gE6ral+EOPGvP7Vn2n9A
Date: Wed, 28 Jan 2026 17:46:24 +0000
Message-ID:
 <TY3PR01MB11346136961C3FB12C4D00D068691A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10282:EE_
x-ms-office365-filtering-correlation-id: aea5d45e-ed98-4413-265e-08de5e9527e7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?J5qb7kCqwaCkElNSWFkidZWaT+UfKKKbpmoenUD7229fuKAyqPrKc6EM5avB?=
 =?us-ascii?Q?Y1Lzjlew8uWUDo4z2p5rXUxkff0sGIqRoSriP11xOO29kk5xO/cncQmbEnWf?=
 =?us-ascii?Q?HXAPeAXgFi05qnhrh5pzWMg50iXTUHzwL+ul7aglve071knVtZ4WrWMw91fF?=
 =?us-ascii?Q?BTCzo5FrYTjU8WLLNX0zG6iqMC70jrvrxXE/vJx2aeltZjn9v+FDSFCOHvlj?=
 =?us-ascii?Q?bVca3vUtsrwv4dgbVa2470QaBDMf315eELHv3Qpn7vNfHwRNIZ3mhFrF4G1+?=
 =?us-ascii?Q?RvRv7LhelTUim/NV95dvYnADFIFLtTLip8Qy1v+tD5Af53Rh80HUEM0S85J9?=
 =?us-ascii?Q?+mnFmSPsIH65a26/OR6kLUdWWBwil3/iEQOGBchJL9IR714E6SG7N/DRgAEs?=
 =?us-ascii?Q?4nKUJ/ZFol7/76sZB4TS3f8bVV5DwxsZEWn6Zbpi0Y/ahFWp4xCNX++F1jUJ?=
 =?us-ascii?Q?MUdhcJlSIUpvuwdHqdefynpxJWY0m+Qf/wOpRSXkL8EHhGWQY+TJrdnUrcGn?=
 =?us-ascii?Q?F4Lee02IKJPjKcNhGNZI0DrF8BxlxPXzCLv3lEP6XYTJZk4kihQrkNKVWulF?=
 =?us-ascii?Q?Im/se4DxWmXCb1vQ3wrMdkPM63OQB2BlW/TA10I4lxsgf68orgnJyDv1qsZ1?=
 =?us-ascii?Q?LAmo2xUuCHd8QktuNPIbS+l0zPaxUhGmq6/Xl1o5xEncxoEvYGuPB7F+wDws?=
 =?us-ascii?Q?oCIOdvQbX1+pfJ8H+lfE46tpqPrkaZLCYEBxLVJCm80gAXJMSRsa6lfW6vmQ?=
 =?us-ascii?Q?V7GmZs5uT4Y/KtkZ5nFsgvpb74FjpJp1iv4vBcL4sDxVnFjB7xBvPn2T6b5k?=
 =?us-ascii?Q?0jHdyfFh031gFbF45OR5hf5z5FGmhwXSzjZPDY5PbVuuCH0EpPgPcjHuFuwp?=
 =?us-ascii?Q?1+GU4a5PYmLRGwFmjWeQmUOJw+fBdxAmKSk2UPVVIIdEB3oqEczUEtjz+ALk?=
 =?us-ascii?Q?uo1K2ElEYkLUFkjML2cGafL6tUPhc2bnG741hhL/46W5Y40ypvxbwKHrXjBp?=
 =?us-ascii?Q?BhvSKbLp3bMuNL481uH9BZJcboG20ho90V9bUPlBGe88K0sWIdsC0to5dtfI?=
 =?us-ascii?Q?1HgvoDeLu2IbcvWQVFyPlz3qbzbGoi6cZRCioen4mupSCM2aejMAksVKAZai?=
 =?us-ascii?Q?H0UOvWDJCrSbvPZmRm2s3IgG7ImONV50KLGVOtFn67yfYSYqafLkCiEMsHAl?=
 =?us-ascii?Q?6JmoNeDmtUxTJwR56RtfNwmjLeacEapxQFQyOBIoYhc39JiaSsgJgZMe888z?=
 =?us-ascii?Q?Tj+n0HveOaLylwWs89HI6+v1VP2/Dk5rLbTwYWd61+rUPb7cGwSR7t1NkN9w?=
 =?us-ascii?Q?07v3m3tIgXAoP3zSJS2SbjxC0WET4IaCRxkguW1HV29NkwDKhhkZq8v1Kt5R?=
 =?us-ascii?Q?ahu8WJy70ZyXgV8E71/79D6aeXgauM/EKKUZsfMS1s3NlLdOL2nDia/O8FJM?=
 =?us-ascii?Q?ikqtWKtjwaPXBAa+WO2kLnzOCZeYqn8GXi6eIVXGnKzufmJ22CvvyBSc3Ke8?=
 =?us-ascii?Q?QXhtxIwuQRmZYi4pKJJH4233OYHBrogB9fgUMi/1YEgGk/3O/2hJgT30G/Ae?=
 =?us-ascii?Q?q2DTlcAtkcA6jqltTGCwoa8ot3QrYD1lDAU01IfNRRBZ2fi6IH6VoBdHWfnC?=
 =?us-ascii?Q?fFLdd96gBBg6EAG76w4VEno=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9bTJom/obGJZvGHcJdT546xOaWkiQLAn1SqhpQ6L9wBlsSlbXdDJ1Wt35VtP?=
 =?us-ascii?Q?J1zN/wpkfAwGwFnYf5hTVXS79h6vquBJKAmMoDgXo6JxFZyTgzKGbDK7J5bC?=
 =?us-ascii?Q?pQMC5uPSrWj14678rehAtk/Op6av1TwhT4xZucWeQT/kgfh6JxTq/gHFeIxv?=
 =?us-ascii?Q?V9QQOJfW95g3/QYBKrkYayjgplVIKIt+UJrhP5hpWXpuoDFZM9zjMuToR11r?=
 =?us-ascii?Q?AN2OL2nqaDGkdOcG9MbFl1QFrntPfK9b3J2UVcb6Oy8vATVtfVZ/4grxqEHV?=
 =?us-ascii?Q?7Xm+z9K7P7vAUAyZ6owgs1oS9QIlvncPTgxlLWISCfdrG2wQhFXUbX4isodI?=
 =?us-ascii?Q?wXKBf85SBxBWykL+eR7ygNW/FTxIo81B2NZC4QNMDD/BEYMQDGsLixm+amcQ?=
 =?us-ascii?Q?RGOh/QoGtR/EZIoMh5tqcrDUU2NIfiXsdVzqP95qqV5sMahAl9CIqGon074R?=
 =?us-ascii?Q?Daw0374VTKHGv7GJIa7y/3aOZzsM0ddoZX6YjBkbjAixQYCytSljrDQIzzwB?=
 =?us-ascii?Q?KdcU+ecfva8HqCrExw2EWQimrwj0CnIIyMgsNt21A/4A98PyOlKAle7WOROZ?=
 =?us-ascii?Q?noewazr6xZfJpBhFbRhqTb4AbFy3A0rhUcnb020yy2fmHLL/aZrEaontRip/?=
 =?us-ascii?Q?2v9VyLcgJhUgy2rR4ryxgPtyyCnzaW4mWMjS3xpR8I0xpo5KYvfJIXEfEKVw?=
 =?us-ascii?Q?BU/FSoO5TQIJMI5KV7/sjnU18GT/8n7PPHuCjYY2G/xQ+QeyRgd1GtnvUxfM?=
 =?us-ascii?Q?SStUU2ACPJvCNq28oJCXUtMKpEsJp+fcUvi3v11ZXTmewT220eVMVzR63zpq?=
 =?us-ascii?Q?pqUnLD7B7sGGBADtN3I2U1D0XqAU6fb9+O1B1guohXsMLQFHZpCbEsN699NM?=
 =?us-ascii?Q?DPVMRC1gi+eKp5FIeIU3RhPq8aNnYR+v85FHq8X0txdXS3kJQJ+EjPMUvVHP?=
 =?us-ascii?Q?0+xaBo0n4hKkEf+t1mZikOfWgEEchfMxf/IInzLT3lTvXZycrrkP7K5F3AOW?=
 =?us-ascii?Q?tNUTcsgh47bN0LczxL7ZGXVJd0VaNgTaZxn5WaecvL4YIQjlKYdm9GABnPqm?=
 =?us-ascii?Q?lUO/0AbLboudQHQYX8BBS6wANQPxc1ikmLEik/UrOhxhl3lvKaP3OrrFsqCX?=
 =?us-ascii?Q?aQKhmXHNVJrgAUu0OrvhS1gN3qrDZppVO/G/Xq7vmJynHkboWOhasj6edyCG?=
 =?us-ascii?Q?wKpNnQTHeWUrWJzCBxDOgz4SB1G6dEpI3hxHspe/hWXlwzoV/x8ZlyJ0KFf8?=
 =?us-ascii?Q?GG6mD15Gg+Ug7BNEU5ByNLNvX+QZLZOC27OTRqsXAcNsZVYSpRQCofi/wWF8?=
 =?us-ascii?Q?TTWqX/4twoV5jlDKwOa/GLb+WVvh2frMlF2XQfON2ka4N92lkFLOnwL/Bicx?=
 =?us-ascii?Q?QVEvvm3DHn3cZJ0M5ADpUh/7u1Jva2WTOdsBT2bQcMgy/F7xvaZmxyPZ3WLe?=
 =?us-ascii?Q?yCh2m2qsFHre9MuGJqlfwF7x7hwSL8TT1c8/aNOItafoReQ/PiRnBzs7gl7l?=
 =?us-ascii?Q?a/zj2HBHqKksQovnf6vbfKPd3qt0KsYcjNksWXABdK6/UTqHXV9O2FxuQKDW?=
 =?us-ascii?Q?a4JSFUeECiIs0AOdvczGH72AzHKmEpbEXfKemmo2HL3N7DFngHvQONTZ/bBK?=
 =?us-ascii?Q?A69HWPWa7yxAuc7mkzAN5AOoBs35Jqn3KgQK3W0N0bkfZhxOhclBSa/QDJma?=
 =?us-ascii?Q?4xnxSTCesG/F5xC0uq5BEmFTXdoCy14BLiAClEavlyymH34FQ8+AywnnfCge?=
 =?us-ascii?Q?9oUGTa5RfQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea5d45e-ed98-4413-265e-08de5e9527e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 17:46:24.5489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdrR1uB+DoU/SIEEquhyyxR2Z49PQO774L3G7ryPLNlESKp12544zyglGOvr76b7zJoJu3VGsvRePFCiC7xWrbQqgX7tWID2gMSAsNG+ztE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10282
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27562-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5B056A73A8
X-Rspamd-Action: no action

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 28 January 2026 13:17
> Subject: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Do=
cument RZ/G3E SoC
>=20
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe controll=
er to include support for the
> RZ/G3E (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe contr=
oller is similar to RZ/G3S
> but has some key
> differences:
>=20
>  - Uses a different device ID
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds
>  - Uses a different clock naming (clkpmu vs clkl1pm)
>  - Has a different set of interrupts, interrupt ordering, and reset signa=
ls
>=20
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v3:
>  - Moved interrupt/clock description in distinct PATCH
>  - Fixed clock name constraints
>  - Updated clock descriptions
>=20
> v2: Reuse G3S names
>=20
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 76 +++++++++++++++++--
>  1 file changed, 68 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie=
.yaml
> b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index d1eb92995e2c..d48187ca0849 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,17 +10,21 @@ maintainers:
>    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
>  description:
> -  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specificat=
ion
> -  4.0 and supports up to 5 GT/s (Gen2).
> +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and  up
> + to 8 GT/s (Gen3) for RZ/G3E.
>=20
>  properties:
>    compatible:
> -    const: renesas,r9a08g045-pcie # RZ/G3S
> +    enum:
> +      - renesas,r9a08g045-pcie # RZ/G3S
> +      - renesas,r9a09g047-pcie # RZ/G3E
>=20
>    reg:
>      maxItems: 1
>=20
>    interrupts:
> +    minItems: 16
>      items:
>        - description: System error interrupt
>        - description: System error on correctable error interrupt @@ -38,=
8 +42,16 @@ properties:
>        - description: PCIe event interrupt
>        - description: Message interrupt
>        - description: All interrupts
> +      - description: Link equalization request interrupt
> +      - description: Turn off event interrupt
> +      - description: PMU power off interrupt
> +      - description: D3 event function 0 interrupt
> +      - description: D3 event function 1 interrupt
> +      - description: Configuration PMCSR write clear function 0 interrup=
t
> +      - description: Configuration PMCSR write clear function 1
> + interrupt
>=20
>    interrupt-names:
> +    minItems: 16
>      items:
>        - const: serr
>        - const: serr_cor
> @@ -57,20 +69,27 @@ properties:
>        - const: pcie_evt
>        - const: msg
>        - const: all
> +      - const: link_equalization_request
> +      - const: turn_off_event
> +      - const: pmu_poweroff
> +      - const: d3_event_f0
> +      - const: d3_event_f1
> +      - const: cfg_pmcsr_writeclear_f0
> +      - const: cfg_pmcsr_writeclear_f1
>=20
>    interrupt-controller: true
>=20
>    clocks:
>      items:
>        - description: System clock
> -      - description: PM control clock
> +      - description: PM control clock or clock for L1 substate and
> + CLKREQ_B handling

RZ/G3L has both PM control clock and PMU control clock

In such case, how to describe the clocks, as the above description is not v=
alid.

Cheers,
Biju


>=20
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: pm
> +    minItems: 2
> +    maxItems: 2
>=20
>    resets:
> +    minItems: 1
>      items:
>        - description: AXI2PCIe Bridge reset
>        - description: Data link layer/transaction layer reset @@ -81,6 +1=
00,7 @@ properties:
>        - description: Configuration register reset
>=20
>    reset-names:
> +    minItems: 1
>      items:
>        - const: aresetn
>        - const: rst_b
> @@ -128,7 +148,9 @@ patternProperties:
>          const: 0x1912
>=20
>        device-id:
> -        const: 0x0033
> +        enum:
> +          - 0x0033
> +          - 0x0039
>=20
>        clocks:
>          items:
> @@ -167,6 +189,44 @@ required:
>=20
>  allOf:
>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pm
> +        resets:
> +          minItems: 7
> +        reset-names:
> +          minItems: 7
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 23
> +        interrupt-names:
> +          minItems: 23
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pmu
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
>=20
>  unevaluatedProperties: false
>=20
> --
> 2.25.1


