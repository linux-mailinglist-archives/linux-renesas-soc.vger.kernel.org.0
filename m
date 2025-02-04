Return-Path: <linux-renesas-soc+bounces-12836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E938A26EBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 10:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A30163767
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 09:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33CF207DF3;
	Tue,  4 Feb 2025 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Oj504wq8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB031143C5D;
	Tue,  4 Feb 2025 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662496; cv=fail; b=K5pNEYvXC42unPz8q16GlnSszVLcp0sPiJFY4bX3s2DoTDcOr99swK8xShqcp6WIXhF1Js5MzXKY7uuIZF84BHx5S8J5u9XO7eIFnUTmlYdyOjqUXUGL7oJQ6gX1olAulWVWUzAvnU39C+j23G/SS1AUzoIVKAkAjWlDGpsO2hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662496; c=relaxed/simple;
	bh=dMikYMDGIAlgphNdcqqqbE97RP4UKKMV5pkH7DBZe84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tvCUSXHKvaU95qQbpjFNrPBkVxgwsM8TN7MQhoJ54I4PdmrlOJVryZWiYKHg9CE0TszVfyqU0wfKhnkZWNdZjwqbgP9bmy0kAuZf13LzGSdZNnuRZKD8w2VBUS200h6PtREdmw2jeQVyvz8RVuEGd8tt+4C+G9FXldH3QgaHtUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Oj504wq8; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niiH3thbaV1BkR2GOHrp8b9r4imRCrJrr20oFe6/7b26PSu5RSmQubIpmoPRdXZfi8F5awyIPB93d8637L1AdgQ01f1LDcEZskJs4ep2ZroDBS4/CgAuKC26kwjOcajzvP5enP7c+flVxHM2lH3KNTSSlhcTENE86ViGaSYC6EFm+5OpGU1EJu2/5mQx7syKEH/VISLPiujd6PpUQfcpEjoL55mRFt1ChTtOMvwrRyJT+ugNoYdEp0q14fR4q1k1DtZbJ8H5tfufehd8DzG5R57SeE9HnwnAORmK2bNIcRawo0VMbZizlR2bK2VZoXU8rO0PZgIR+vF7xZykeI2p5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keeXJyTgamkKYPv9L0KV5DQIw/47RSFcRDqRFhXZ3sQ=;
 b=PF510xqWlspN7eTifU5u6p7rPHnbMFUc/6elvyT8KcMDourJh+5OTJvwye8i737BxJTZMr2EJEpFQ1UvnoFBd9NuKtmicRd8krjYKktjsezeylbDeFepDFOUHsVvtDlyvGQFu8TaBRHrjuMxxoUeipcw5g22AM/i1StAs3ip+4dHLUYlWRIuOpt7W92l97g7Hp7qsjN05OTYYS4p9n7tDruK3dnqyOxaTINBvxaHlY0Frvts7IAfM0olLsN3+dSYvhCW4NcvxDnLYBmrZ0suDP40c0hPZT0EP3a6g6yBfXCycuvBWwIjNhOUs0CCbLPaRMruw6a3+oO7qNrtyCnlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keeXJyTgamkKYPv9L0KV5DQIw/47RSFcRDqRFhXZ3sQ=;
 b=Oj504wq8sBeNlSxFytgJ4OBuogGpCpH63nkTwYNUQk02rOngmOVCfVMA1t/DKuQH+u19fvOKfRQZSIIFU2KF0EK/KadjBeJzMcI7Siqq3mmpCFNzzGuXx93hgKJwgxWPL5UrNuOsHUbZnxNBPfS8HA7vJJFqboEmsxcQB+oToa0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14705.jpnprd01.prod.outlook.com (2603:1096:405:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 09:48:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:48:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Topic: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Index: AQHbc9NZt47Owzw5Y066V6psYn6TL7M26cNg
Date: Tue, 4 Feb 2025 09:48:09 +0000
Message-ID:
 <TY3PR01MB113469AB8C9B228E73673F88786F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
 <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14705:EE_
x-ms-office365-filtering-correlation-id: ed35d03d-1b14-4bc9-b05d-08dd4501086e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dzWLY62dXXdBc1Jhp/Ly633wx8vy8IM4LwLB88hoJvhelus46a8eOwBQSs06?=
 =?us-ascii?Q?DbMrbbYBK3k5CT+fwgzBrC/qmmAmFa2ID4AN3LZUoLXsL0HFGf1dVp0arhYN?=
 =?us-ascii?Q?wbYp+QIRoC8TtPrXa1e5wXjm9K5LLZzd6PPSq/1NM4vrPgXtobxrjM33jjhP?=
 =?us-ascii?Q?KyYWFc9+3Flrm7B/D2xrt8JxtXLolnLGoSa1aSNV4jDttURLm3kRJs+yx+Ay?=
 =?us-ascii?Q?4jLtTtTqf6YVCLkU9eI4su8XwdEZTm7+0iq/RoGq4UxMG4SolHj34gJvMKrR?=
 =?us-ascii?Q?msMgVFP72DvXphquSTiIaAZMxEvWhtHrhok7ScG7zCaG9YhLq+SomS91+Ctn?=
 =?us-ascii?Q?WMLmlPRLqWNaGhT3z34sIhZsL4w3PWugMXCmFTwAr7+XGcb2wIgZgFOfMHB5?=
 =?us-ascii?Q?ufBURdoU4P54vAzoTLVZPW4ucz3IRXbgMasd+UUq9e0ExPoTx3aje0zqgah3?=
 =?us-ascii?Q?twqO+x/dUg7+O8uLgkrkug0jj89Sb9Pb47LEXgiOpgAUbuh9pz0Qn2/8DkdJ?=
 =?us-ascii?Q?u3kfsiNZDUKYcIvEb8s1zAZ25VhlTwGc2s/+5dE65ljY88I/RxFH3pW51gcb?=
 =?us-ascii?Q?aqG4TRnwY9UKzumqqsXMk4DN5/5uO5YXuyURpmA2pLxoDhCW+fMHC78G2VT+?=
 =?us-ascii?Q?IIbn8oj3RPejiqBQp21w8C73znu4YiRk6ww9nZ8EPPBb8kM1J0jIG52y8y+o?=
 =?us-ascii?Q?v3y+uf94vUXOvtycBql4ttYPmHEHXG3DamA+4pKe8IU+7PlWoSCAda14B0/C?=
 =?us-ascii?Q?GbkKjJNkYCOVKzclN9KA9HFB/Nk4JbB3jd/Ce1J/VsujWdlhjej4mxOp7qUq?=
 =?us-ascii?Q?SXrLitPmiyCevu/mPcz6PoliBychkLG7IrhSbXjGjABAY1X4X/NBxGxyD4vj?=
 =?us-ascii?Q?KCxvFowrTdttLnDR8iGVfSyuShF/edeXdxXra/zuMKVdbtm/jQexYwPC70Wn?=
 =?us-ascii?Q?rUNG96LFp3zk1ZiC97tdLUU+rX3elfMbXHHMPnV4a6l0Uy95C1p4TYGfFcuc?=
 =?us-ascii?Q?FvVQ2cWS2M8s7S8NPow317dWs8Yn8hC/dPd1ST8k12Vz4FwaZqLoHEB+39DN?=
 =?us-ascii?Q?TEBHzdaGCyIeR1H0QKkU00k7K0D3fcHt7lHxA0OZ8mAiV4bHEzvl90bPYNpy?=
 =?us-ascii?Q?I0vyW1hG381Z/7/N+/nJmMZDHv0mJYWX7Vbn1i5eJSiHWWFGzcEoIgl5e2eV?=
 =?us-ascii?Q?ceGU6gqLIZHdFC1CbVpAr4Ase3ba9l6ut8f3e8WVprfSubSI5nvni0Hllkjy?=
 =?us-ascii?Q?vvBcS3I0Dq2CJpZD+6I2wVxYGNxUKVkNIa6rSPbrVKgaICOfYtc6CGEhAkA2?=
 =?us-ascii?Q?3nZz7Ch3FOhLEeW+Y6sD2GYo0wjZu1a1rzbicMzl7aZ1f6anBZzanQ6Eralo?=
 =?us-ascii?Q?NShaPzKhiu9TeT2piX+WwVrCwt02ekk1bFI3qM9ts1dzzPcCCL8i5fNjVj8T?=
 =?us-ascii?Q?1NdrbvHiJzNFU8DCz2lU4BeXlfn6c2r8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7EGbyE6bGRwQtWRkl1XEX3uXsJMwA/EROUU+fj9WVKN7uq426j2JKVa5ZHE8?=
 =?us-ascii?Q?PvIkGxEmjCpM3U/E7eHFowavOp5zwbFaQgTItlyPJJ9z6RhsevPaA6Z0mAqj?=
 =?us-ascii?Q?oSkEXB9i+lOZaDsSOLHoNl8WcjkCgjsm8icd24uHPA0w+GqnX/J1zdaDuBoY?=
 =?us-ascii?Q?J6Na+52xxR7HNwAwWOfEyCE6OvdPe5pHBcGur0pIzjbE9M12QHSMYEZhbh27?=
 =?us-ascii?Q?ShEoBxZh0P8ffK8Vi4ccV0qzJA9f6IBqyhXg+U7VDXsjVP+/tc9hvDbWXO6o?=
 =?us-ascii?Q?jDFEy7NSGZsVFt14p2oN8qgLvbA/BDnjzMr0YYWGnu92HpTJNjRxWEwX+d6K?=
 =?us-ascii?Q?Htn2GukObbVpjrOrQDK507XiePLPW5MPXjesXeAykGO61/ePA3E2oXFXy4ZK?=
 =?us-ascii?Q?lCxn3H1mboElSMcrKxF81aEUsrfO7KII4xexYFmkIeL50DeRfjEoprSmp8ho?=
 =?us-ascii?Q?cpwQxDJ5z5b/AyowW2lpciXC7kOlKw4QDXD0ONN+017jJDAci6Nh1umKjM8R?=
 =?us-ascii?Q?tY+8p9JZzxXL29bI8JKStlr8rz2SVgJUVU7n+Qxvz0+++UIlBjl/m9/lVy30?=
 =?us-ascii?Q?Uy8het+6aLDzP0IHh+gvvgP6puMqSNm86N+XF8g49eO38sdMneufA5BIKTyQ?=
 =?us-ascii?Q?UfrIgGGSNGf2I9mV3rk5xM+2GR4bgeS4OTaZ4Y7i4ssBEN+T3mhrjAdCT0nO?=
 =?us-ascii?Q?yEMB/u6fScA+hP/TsfjnYg5L8a51s5Cj824a7GPQNVoIUGSG8La05u7ZrE6Z?=
 =?us-ascii?Q?IE7RH2UZGOgubaMYeCGpQSBPp+LzI68V4wgNeEsNxA+P7W2neI+cS09o6pt4?=
 =?us-ascii?Q?Eaaez53EFywqEoTsv1/1F0acQ6iA+JjAGpUW7leXtSXO0ia8OsOKl7YvHS8z?=
 =?us-ascii?Q?QPaCpEI0BRNnIY3hYt63XiZWFPzjGFjWV0AGsYw32mgpgYNHa3iKoTLBPsW9?=
 =?us-ascii?Q?klBpkscQxxMWTusjlxQ29oLfNUoBXF09s9IFpRIgdOrgHa3vP2sDYUJpo8u+?=
 =?us-ascii?Q?Mcqp2GqjM9Rr0QX2Ge4BIG4k1E++C0CAY+/+3uaeBPn+AFEsRs4ucEruTQzr?=
 =?us-ascii?Q?+Mcp8l6T4RwOUrmw1vBiC5bzQ6q9J55Vlt7ME7vrJZIM2aQcEAKRdRE4SbsS?=
 =?us-ascii?Q?+J3piMDCC2yVpx0OdRMD9XID7o+e1rc29OANAEKAedJCE3DSAufLK6cJk1fr?=
 =?us-ascii?Q?OZf9ly0x0qTdG0yPmIlZihgsv+QiZ8vU4rFj3bccv3J1VHwrpl+tMC0ePZMS?=
 =?us-ascii?Q?Xn7VECwcvPMnoqJgu8nu2lnz4DuU1gVB3p4dSZ3vVA7QxPRpxAZy+HWtkLPF?=
 =?us-ascii?Q?JmK3hE7inylMncG/UaRL3KySTFKmHIzt/b76zkv4IeSQYhxYQnyVYK/Svwjy?=
 =?us-ascii?Q?bw1MfxnsnuebFkl94bVZwMaZIhRiwaP5CuSzz3J+JMSVH5iSWgYVn2m2llHA?=
 =?us-ascii?Q?lHj6WR6CuOGplqjQWu/bi+F6xckVR3fDo0mWeh8iy1VDpfkc6gAivWMjn5iK?=
 =?us-ascii?Q?1y5eFxlz79/ma4ZUJwUy+TnW2hxvmkq7tw/fJIFmNNZ6Ns57R1I4Czz1muSt?=
 =?us-ascii?Q?nuisUEnheUG5vJ717b/2poYSiPdpt0RwMJLgMX1nJO3eG1cEL1keY5dUYHj5?=
 =?us-ascii?Q?KQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed35d03d-1b14-4bc9-b05d-08dd4501086e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 09:48:09.4869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hu+8/jZ+1UpMtdmHBDtGDEfS7Qj6k0O8/9PzBw/M7JXCB5bB1zJgJ44tMBljXzLDWJ1AzgMUZNcPHvLyEgdMFFeaBgjisBUFwxNeSCNzeY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14705

Hi all,

I need to send a patch for fixing the build issue for r9a09g057h48-kakip.dt=
s=20
as this board is introduced in latest renesas-devel/linux-next[1].

I will send next version, after getting some feedback on the current series=
.

arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts:42.36-50.4: ERROR (dupli=
cate_label): /regulator-vccq-sdhi0: Duplicate label 'vqmmc_sdhi0' on /regul=
ator-vccq-sdhi0 and /soc/mmc@15c00000/vqmmc-regulator

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 31 January 2025 11:29
> Subject: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for e=
nabling SDHI internal
> regulator
>=20
> Add support for enabling SDHI internal regulator, by overriding the statu=
s on the board DTS, when
> needed.
>=20
> While at it, rename the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpi=
o to avoid conflicts with
> internal regulator node names.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch.
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 21 +++++++++++++++++++
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 ++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>=20


