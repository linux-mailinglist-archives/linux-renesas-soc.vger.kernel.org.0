Return-Path: <linux-renesas-soc+bounces-11904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA2A03D9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6E8162CDC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 11:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191391EB9F7;
	Tue,  7 Jan 2025 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="heszdqNq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2C1E9B35;
	Tue,  7 Jan 2025 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249099; cv=fail; b=l9ZKj1qs0Aqx9vnroKrpJ9WpT3KZHjNllSGAnqtssgL7xF7Lfx/Sz0Ld09z5g8gYCKMGiJcWT9CEHWPSpreAvLRQa+HNDLryXWSKr2NeQxqekTufVTEN4f7Nhn8k0rnNKPaSA3PVEdosNoHap/sIKIury0Xeu0hEURolXYokTOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249099; c=relaxed/simple;
	bh=avOEvwSSODYQRi/2CioZzN76++xx6xIIXdh0uCCJPDQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEqiA2ZowXRkFGzFeBAlEWXTFMjrSaBwETJp0LEsVPluj1N2lC4iHS9MFf+eWfaf/pKkozYzXdEihBvKTL0ftV5K3rx3pnG39Xmju0ikKUGY21tO4+TupQVYbjs0QAcpIFf+Yk5KGIei2ZaHTS/7az0zIwOg8Cm4mjBZz0P63oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=heszdqNq; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coZGgJoxQTIeLgkGBbklKfAYqtf1bT6BHaxAgDlcPftKPN2P33KRRxa844LenGxwdZIe+KYbPYpExeyX1WGBUXVJTJ915eBzu7K0hk/8btoF6nla+cWc9iac2G2QtoSfChPP4Vb/kVQmH0ubp1XxPYASC6jNVihoJ5BK/tVOm7DBH8PyXefNtAHE/tZAjMlUrWS9O5gyTi3O1jYTVA6M67bwkwfHjwCWnsnkKoYa2PkhIMHEl5ygFPb69Ee5VYvB3JiHtMJJw7w19C9y+ZuRhjid4bAeyUYYS8vmFJuEug+Bsv2QyhxwkzgXWIUiUh5OMESdmUd0ts06yLhQx07x/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avOEvwSSODYQRi/2CioZzN76++xx6xIIXdh0uCCJPDQ=;
 b=YmILml/odXT+PKOXN9qi2EV3nu1IQgpvPYTfajun9zxNIPipgBicVPrvOgx72Cm7czroJPVKhIsZbQVDxhLko234zcZi+cSj1zjSPrXEeMlSED5lRPD/lPLjgxZPXHgRKXRqKSuxapkw1Lxdf2x5hFTUjm3VfS2u4vwdOxb9T/Ug6R6WgLWj5OPsWuo4pOjYVGK2XdSlirIbECARK3TAV2pED8Fjn7DXqAw1ZaojBJiWjH4HVe5aGjuotiT9Xgvt2ISZ8dl8Cx0cAjNylJS6C1K2yHbZ0/xa7lizC3RORluzcNzsX4DiKCQUYQyeQTn/29fkm1ZddPXZ1ODBcYqDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avOEvwSSODYQRi/2CioZzN76++xx6xIIXdh0uCCJPDQ=;
 b=heszdqNqIpk6KPqjN5oGfDTAAHU7houW1qqixFrRHMXqp65KfzbS2tp4kHytatPOmiXuQGpJ3dtFqMF55ZTpxuz+u7aV4ehGtHHQFaLDojQtnSK/eh7YoeDZM2UcoRDXMpKDSMARoCyxSmG7geOsE8nNCo70g7RZiUIXU9ezl7o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7754.jpnprd01.prod.outlook.com (2603:1096:604:17b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 11:24:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 11:24:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
Thread-Topic: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration
 to per-bit basis
Thread-Index: AQHbXULKeQyg6OXyX0+NSgiIE5q337MLMU7g
Date: Tue, 7 Jan 2025 11:24:51 +0000
Message-ID:
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7754:EE_
x-ms-office365-filtering-correlation-id: 8c1781f0-aee1-489f-eea0-08dd2f0de734
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dfrpNcYMJfYz7DZ10tu7sx3cBprZiMIJEUwOT2yUaGI3OFXrH6lmbjBgnx7O?=
 =?us-ascii?Q?pDdjEz1bTDh3YuNKkSDYKD5wPL3u2+rWxA+SELkldm4drWRltJ4Z85nhCcQR?=
 =?us-ascii?Q?kmgaSJPS1ME/i5sxBMGfkWUi8CPsS+IKGq3KadZ8kNGfFEGPYTLY4y8GrEnP?=
 =?us-ascii?Q?ANT6eBDaIGm6BrTM3CDjyF3nqApNbTGOSogefzCyXkrzMP2QpMNr5s+7d3Jm?=
 =?us-ascii?Q?2XeowETSBvETRM+SHV06GpvCulU3lob9ZxrHxlAO3JLZPRuzKmEWl/BcWV9x?=
 =?us-ascii?Q?Fssbsl9PtlettDboNfJUvQBQIeGcQw9YyVZxRc4889K9NS3gjddGKMGv/3xR?=
 =?us-ascii?Q?35BWq9WlTuMRjttiQHqqV2kPl81tTXrj+ltgbo+SWS8gUeFiumDI1UIomnd5?=
 =?us-ascii?Q?at6qml8sPPYOo4uo94wBVtkzwCkFpHFDWNfNlKBGCU7Hk3ITu3vphGf1M8za?=
 =?us-ascii?Q?CpjGMudliBELmYAOZqNOsLMRdVxGNgpQQ4fqavFPsjNl3u3hKNE+BPU+4124?=
 =?us-ascii?Q?y/4F7b0PR5O2zKT01bS0mj0Xlm4O0s6k3zriNNMDqbTdiC3+rHR/nOFYRL9k?=
 =?us-ascii?Q?2WrrNIMFvoAK3/KHJZ4dd/lny33hNlVhMiUmka7p6tsk64OGdPWjDZ5sT9q4?=
 =?us-ascii?Q?cxEXuWa182N4wtqOlZpiV9STnWWItQex0aCmm/78UTFc1ujSzSWahBEvKWyh?=
 =?us-ascii?Q?QI73yl3jdtRMP4UF0cvA48ZGnk8e2wee/KxcUKqxaAMuxKIxAZR7iDqmzw57?=
 =?us-ascii?Q?RX55S4FUepOIPQIrugm9BD2yHcTNG21Mpdg3iqZwoAWTrtZk65KcqnRkBX7k?=
 =?us-ascii?Q?1JYXEtbVKlYPuRUADf/pLEPgu+IQJDSOKxcfLmttaMjuxxmoLozMlvggWBxK?=
 =?us-ascii?Q?voGQhC4PRxhSKO9hJIhyLYiY/imWc5Lmh+Tm+3yuRaDNPiAfuCgK/DurDZpb?=
 =?us-ascii?Q?0kAdzRVAW6Ng92ycusv9o2VDWrrdcpSb9714gvEKV7A+yu+k1/IiKut0v28w?=
 =?us-ascii?Q?bCeD7BopcwEUCdIXLyaHeMWrsUOhJHEmktn5KdKvZhSrrr8FMlv5CIem5ttQ?=
 =?us-ascii?Q?A0rvX2aFa3bkwu0UBKeh30/VNiXUnmE2KLZ/jmCZyoQTGm+44qNnvAIUI8WQ?=
 =?us-ascii?Q?uKVKOHy0ouDm1a9r5qB4OS1rGaIS8nqbMDBeaTe+K8oiN93pNC8l9YBpwXcT?=
 =?us-ascii?Q?cCt5CW2BR8p34PkcD4oq0eYbnRCshqHe+sUHmq2e5fQrPA7B0/0s36aJ/2Ff?=
 =?us-ascii?Q?PYcNH9Px9xD0SSI7KnxhOPy+GQEFFiFf/ryAMO6yc2s+utSbleidUEQ/7mGp?=
 =?us-ascii?Q?W35kyxLODYIRT6P3UhYcQraSpguA3tWaUIUCYApbOlnVmHN/14LLKkx2zDh0?=
 =?us-ascii?Q?FfvAlGd9Fv7YklAjd/S7o2D5vXxDedNb733T6gwcSIYnKnGMK1C9z5YoGx64?=
 =?us-ascii?Q?By8681k3xok=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?slUsq8xYFjYBQkOLmV0U/vE2tF+wmNBIMr5aq8ejRqYRgZgp6pHTW/z+KSF7?=
 =?us-ascii?Q?PVNkTmc7guqLJor+sELhxy68SyJVc/CrFL9F5n64RnIJ8rWo2xdwJZpxnmVD?=
 =?us-ascii?Q?WeBrzYbYZ6J+lupQ7VqCkV7ntfE/hgN9gqIGF1Mh/na4vop0PHt+Ne7miMXI?=
 =?us-ascii?Q?vM4W+kXLZ19dNv4YsIsyv47MHkIddrN5Ax2BN2r19tX+zNY9EBa/N73TUahp?=
 =?us-ascii?Q?1iVDkiPkJhyB2kdL5d2FkSrBNMofthRV2p696UEUOxWEycbToqGRFg/iU0ov?=
 =?us-ascii?Q?2uQRFybmD50tvvMjq/7VFYR4R+UIfcnyy2mkiuV1tf7lnKxP2O1ApIEWg3rO?=
 =?us-ascii?Q?vz59AZob+fdJOfnXlMoSQHy8Fuw0nAQHapUizhkphJvf5UEEmg66nseZE8Q2?=
 =?us-ascii?Q?aBH+XfH+22S3iFOGkB8NuqxX/T5EiaaER4URykj7kRPckqqZ9cIZ4UuptjYN?=
 =?us-ascii?Q?FfvjtUH+V1bot7mlM0+zbo2Zp4wxzPs11ISsXlPcN88j8/jFw1EBCLVOZAHV?=
 =?us-ascii?Q?9dRxPM7I5HOSss/hhWxEuaWbH/8i9JkSmSTKglMgAU3goXFmalxy8jNK99nR?=
 =?us-ascii?Q?LMYnqTont48suMrwI0A64l/cVf55tQZq+WZBpDQI+neOOi3bJ7gPThsdRLH2?=
 =?us-ascii?Q?99acOdoSvKjOgl94qUeHR4o/0jww+7SKOvBxQ4pQm20ri3wnLQblKUOlAjZ7?=
 =?us-ascii?Q?Fk4Nke6I0rzQRplFaJRYaU/vH9LEaawrOuiKfDcGV50ldAKsj1Uoq743O/Wf?=
 =?us-ascii?Q?SyrxKc8BbV8GMBZ82ZmPrytQjXHWN1/9duJhblMT+Fz9RuU4SbHf07m7z4D8?=
 =?us-ascii?Q?FwqpTI0tqlvvSmylMUVDt5TVMa6xbxnO+tp92hlRQOTCGCV16rCCtHe5a/Dl?=
 =?us-ascii?Q?T5flKL1YL9tIPSoxuRs3EWHldsR40vs8crklV9vXr3wr8SHumbYX86BscrxB?=
 =?us-ascii?Q?Nn4KIBHRTw+JDEPJDigs2gmRljZSPaqhclbSLUEplE1Hrx1bC2cEQzaiScnl?=
 =?us-ascii?Q?nzchO0xSHUaGQA7fZcGjA+1Ix5X5ZfoDkyFminTxv/H50i0VON+ZIdcYpmdg?=
 =?us-ascii?Q?mfFXpo1kQUoxcrlBnyBQLis5UFt5xCxd2d5kVoamiqJKG5Kj91u8QqrlGq7m?=
 =?us-ascii?Q?E9qGATaJ/HViPfcM0vQvzVsBwoCFp2NCiRWZOJ6z4kQZPnOUhVfSufGTr72w?=
 =?us-ascii?Q?vaf3u+QtkckHvYq5IXkrad+Zk6hTqfoKUdpp+8afsBIzV3XCX/9KIbIQIOaL?=
 =?us-ascii?Q?ICFRRbHRgJA8ht4qwmKlSvj3b0/gK+uRW6HcWKSGvfvRArXpGqb+2IK/CpmG?=
 =?us-ascii?Q?gL4KVzbCvAiq1COpVbgubFYt4B796EjvV2GSU+GPHWphf3/WAlW4DVs2bmO2?=
 =?us-ascii?Q?a/cEKVHpb5C3pvLD3bAzfrOk686BVn/eVFUcwoYO3/Chbp5rTy4EBoS+7Ngc?=
 =?us-ascii?Q?V/vE6st96cwhI5o3o3e65lc7kJBVKwDsjqK+22nyTKlugYACnmFjLYo9wDk6?=
 =?us-ascii?Q?ellpOKQc93HhUNM3A3G431JDqxFsTJvmKFTgR/0PPoKPbuCmWRh/ZGVETUEM?=
 =?us-ascii?Q?rnibEAlnuG5hcV+jNqBZWeN9ybz6t5EYq/s/2LHLLmys7HfhyLsFR/N3sO+o?=
 =?us-ascii?Q?LQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1781f0-aee1-489f-eea0-08dd2f0de734
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 11:24:51.6001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUI+uqXptBaNN0YR5Frf2kVUNm569yfTbFvo2LtALdBUhamvrf9hXuamDdRVyLXybjAKHT01thn9b+p74EKTM7o+4UydSZ/Q4axV/Gsm5vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7754

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 02 January 2025 18:19
> Subject: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration t=
o per-bit basis
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Switch MSTOP handling from group-based to per-bit configuration to addres=
s issues with shared
> dependencies between module clocks. In the current group-based configurat=
ion, multiple module clocks
> may rely on a single MSTOP bit. When both clocks are turned ON and one is=
 subsequently turned OFF, the
> shared MSTOP bit will still be set, which is incorrect since the other de=
pendent module clock remains
> ON.=20

I guess this statement is incorrect. Still in group-based, mstop bit is con=
trolled by usage count(ref_cnt).
The real advantage with per-bit configuration is, we can drop index manipul=
ation.

Cheers,
Biju


