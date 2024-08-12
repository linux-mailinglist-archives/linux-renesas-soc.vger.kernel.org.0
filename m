Return-Path: <linux-renesas-soc+bounces-7808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363794EA6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FEE51F2275F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 10:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1A016E89D;
	Mon, 12 Aug 2024 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VJhFWc1L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A051D16D33B;
	Mon, 12 Aug 2024 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456931; cv=fail; b=mtjTf8pcj8HnhJrv4EQgyGczjzX7PnNseYOnXIBFxwvMHdflY26HVTpb4X4M5InU11kW30vD1cU3y4K60F5emdeb9HjP4PyaJea/7Y9Y6N8Ll+SQQesYJwHTgywn65rLDPQcasQbWIG4tmsbHJfGMnwx2YEUT9sp3uGTWjIzdHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456931; c=relaxed/simple;
	bh=zsVz0MK5Rj/bhiAbTsQZT/wgxr7dMkciBBnHpf4dK2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hm11DsGKnLzkWptzSHBYLTuC3D6DQi31GAaRloWOpNn9N7pTE7urZ5TiYRYhwgERftGPM0SAVjHcfv6TBV8TIt40YA5WbjMdwNdK1VnBMypEUcw8gTEuid4ej51QYy3soa1wMF2b3t/nYecvgWo09w56zFst27OQbWK3uB3Hi5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VJhFWc1L; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKddee7Fz1luB5XWK++KjkgYkvvQzUJRAleEhZzXnx/TBaPWZ2N78qlnfdsu9DKRpRfaZ8bfO29kVkV5ad5YCCKEZX4woJd+O0AJ15RZmKPiIcS/TShOtYNNhRhcTrZTogO3cmVxcZetuevIxgLx75+JtxQevw8xgVz9BR0CpKsZmSVlnsEWqCXi/vCQ08AFh/cfpO+MPCrKuWF+p1xMIqh+UBIyP3cHABsN2RO83pl3iXi4db3eR5D9XEetnlL7P5BYKE/gYiKR9fv41IORH93NddJxxpgExVN+QNcdN4Ne4Ma7sGLLTv8EYWaCvIJiZy5VwyydtHLZdUQmMBhGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsVz0MK5Rj/bhiAbTsQZT/wgxr7dMkciBBnHpf4dK2U=;
 b=zBs3FrkF/Jw0CHRcIfSFxo0+NEDz6C/OiPU3f94zfgTHGR4UDBi7/Ba0zbDTTi5dHaALVyd4Ij6vIfbxiBi5PpgE3/+e4f9BdcWvY9GkLst3ff8nOgMS6YUrP4j6yJ0q8h0OSDNaqAD7RmqWLIsEmh8m9+5lRomePZIY/BnUHiCwMQbpSPjH56hQeikd/6t4hjgQbUUqCnm6GeMX3spvyMBbyi2owumkBTwvo5d3O1VuZXsjoirSovYuMwrNozrzof7h5z6uviabbTEz3Ro4hxS1EpVz3qSx2Wbm7kUJExfrgWuD9UndWZlbZWiUs8Dco3VVUD6URssx1akNr3SkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsVz0MK5Rj/bhiAbTsQZT/wgxr7dMkciBBnHpf4dK2U=;
 b=VJhFWc1L0wfCJb6e88+XE+pHbofO19rCa/G0uOB0hbMSoEajphCtBSvqzHrje8nJmpxvqV/nt2i73Q/0XIy6485EdB4y+DR2mrP9VsNqKXRDOphTq2+2x3zXzZmtpRPkFPqbE51OQN/MYC4W58loCv1OdLf5EbvKdgiN7nZh3kQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12305.jpnprd01.prod.outlook.com (2603:1096:405:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 10:02:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 10:02:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Topic: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Index: AQHa7DAXCupFvrqDHkWsJaJo6V49crIjPC6wgAAcCgCAAAxjMA==
Date: Mon, 12 Aug 2024 10:02:04 +0000
Message-ID:
 <TY3PR01MB1134680204C824F1B567B21B986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vioGija2x=eoqn1jZbMpK8PAeLzXQZP52hQn976BKisw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vioGija2x=eoqn1jZbMpK8PAeLzXQZP52hQn976BKisw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12305:EE_
x-ms-office365-filtering-correlation-id: 5b6f6ca1-568d-4451-2026-08dcbab5d12e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aG5aTmVsV2ZLZnE5YmVERFpmNnlaRkxmclVuLzhEVzRYcnk1UGNUWkV0bTFj?=
 =?utf-8?B?RXpyTjVkTDY0TnFjcUNqb2lmYWNTYVIrd2R3ZlBwSXR2RnFCTnQwNHFZcXZF?=
 =?utf-8?B?UHBFWGR5dHRLbUZVblN0TjI4ckNqVWN6cGIzcTA0bUVWQ0hpTUFjelIvaUts?=
 =?utf-8?B?NThxUDVjY2FjOFZlUEU1WWo4U0dVa1huNXQ4bnM3Umk2MmY1ak9Cei9YU0pI?=
 =?utf-8?B?a1duS2lKNkpMY2RnZWxXMmQ1TTJQdjAwbFk1ZHNpTk5VelBjc2hTbys2aE9q?=
 =?utf-8?B?b3VHVy81QWlYV2xiZzBCbUpuMitsZ094ZlBGQm9iekgyckQzbGFxbU5oZ2tD?=
 =?utf-8?B?VUhHNFR1WnB5VW14MGJreFczbnVkQlA0WHZCTjJKQ1l5TVdLeUZna3YvTjk5?=
 =?utf-8?B?R2hlbFBXbVJZeld4VDlOUVhNdVovM1M5T2gwL05nSTJuSWczMVVQK3hVTTUx?=
 =?utf-8?B?YmxrYVBmWitERmlLU1lTRE45N1VKa0M1N21oUzByMGtTTkZyQkQ3aFpLd0Zk?=
 =?utf-8?B?Z01CNVREdm9GNmRrbVJ4VlA2L1BpanlzZGp1Tlc5L2VVNjhESGNCZXQzYnRs?=
 =?utf-8?B?Q1VDdDZ5MThhc1BMbVk4dUFrSncwNVN3d3BpQ2FtU0tSaDA1b1VUVlBNM0dz?=
 =?utf-8?B?T05UbWVncTF1TEYxUmtvSGFoVGV5UFpFZEZyWDFIQWViNW1jZGVBbnlSUnlJ?=
 =?utf-8?B?MnlBSlFLREQyRmlseEdUcXB1QWFXL3JmbmpuQVd4Zmk4T1Zzc2tzM0FIT3dT?=
 =?utf-8?B?bk1lUGt1NWFUcXFrRXEvcEtwZ2JWYytZM0FsaHJZKzBuRTRIdEs4R3gvZmp5?=
 =?utf-8?B?Y0ZTWGNWRHY4UkNPY3NMay9pU3FNdkNiN2RlL09Xejd4UG1DMzFWY2pxSnV5?=
 =?utf-8?B?ajhka1I1VnNVMndjSzhEQ1B5a2NUdE1PS3dmRnBySUhRdjFmaHVpYWYvUDF4?=
 =?utf-8?B?QnpIYTNrVE4zVldPMXBUaTRFdyt4TWRwLzN0UndIdEVjai9uUU00aW1YMmNM?=
 =?utf-8?B?RDdtbldBZFMwVk92TktkMkhUaUhQTlptcWRSeDJOS0hwdE96MTNhcG9qbENy?=
 =?utf-8?B?bHdZVGY1cHlKbW5GUEZhVm5kVCtJQWRwQlRCVWw0cXJiNFRxZnhORnEzTVhR?=
 =?utf-8?B?cmpXczhseFBQT3FXRFJLb2F4ZTNac2lrS3NOS1UwMWRqQ01FLytaaE1KNldl?=
 =?utf-8?B?RTNGRC8wTnRSNFpTYmNzaFppc2Q1bVU4cTg4ckxBd0VNOUZ4Vm1NT01qMnpn?=
 =?utf-8?B?V3kzT1A2M1hUanhHazdGNEpJcGJnNnAzOVc4b2czUXFOTUZidHNWRXVJUmpU?=
 =?utf-8?B?dXlLeTJ0aTdGdGJEcmpDaGY0dDJPWW44NnZXcnBBL29MSk5OQjhDSU5lNDls?=
 =?utf-8?B?djkybGpVVTA0UkJXSXc1dWd5M2lQeFpwV2JMbkUzU1RBVXNkYjVoNDNXaUJt?=
 =?utf-8?B?TWNibkF2V3lQdU1obktxUzhTNnNicHRMTVlKSFk4OTV3WjVpWkNtM3dDajQy?=
 =?utf-8?B?VTlRM1NNTjVLZDdtVWNvRHpvOER5NEdCU3I3TXl3ZkNDcHZNU2R0WHpSVmxu?=
 =?utf-8?B?YkxaRUxwRi9ac1BKSGlnS1RIMjRnTkl4VFBVQUk4VG0rb0xLS3lnK3UvZ1lG?=
 =?utf-8?B?c0twaXp0ak50Zm5GcDNucytVelhBWkRLRWhhNm8wTVNyYlFYanQ2NzZvdzd4?=
 =?utf-8?B?eFp2SUFHTTNLbnBvQ1REcTlwUmlnejI4cjA1ZGt3R0hZRUhqcWtlUlJmSE12?=
 =?utf-8?Q?9KHyeSVEmRr/avkFLgxsvpItDsoOl74P0+4brZ9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGVLZk52UmFPeXYwYWZJTWF0R1N2RXdvTVJRVHJvMmJqUXdNSkVKOFo4aUNv?=
 =?utf-8?B?SjNKZFVYUWwwMmR3MGFxYitRQytzTG5SUnZqc0phSlAvUHdBdUtjd1Y5MDdW?=
 =?utf-8?B?bmtFQVFQU3Z1dDlOSDNlSXUxSndoQ01xVitic1FEWlhUWHp4SGN0eWFyYnpO?=
 =?utf-8?B?UzlVQ3lPYWc3N0lVdGtITTAwWHlidnNteTlpbnBhVFpvcHE2cDFqdEc4K09R?=
 =?utf-8?B?S3NiYlJuZWZLaVJRTFJnTGZXdTF1MTR6d1RndE1DdkNwbHo2UVBudlNIMVFR?=
 =?utf-8?B?SzJncE9yYnV3OFlVU1dkdjhlRmFoOGlmSG0zMDlZRnk3SmYwbGZndWRwbDRN?=
 =?utf-8?B?TEhLbE5TL3RPMU1yenB6UXVBV2tFYmtRaUpBSlRRYmVTRWlmem42blJBQ21W?=
 =?utf-8?B?ZFBRR3JuNUZVMW92MEduWDVjdTVOeFhsb3A5S3dNRDBSTUtES3gyNjBYdFRV?=
 =?utf-8?B?OXVQbXRjcnhnenFQM1VTWHEzK0RMZkJBUnlNV3VocGMvYTVoY2hBWXM0bC9T?=
 =?utf-8?B?eDlZWEROT2t6SE5uMHVRbFdhc0pLYnA1MUlmM3FKYXB5anV3WmFmNTlERzJB?=
 =?utf-8?B?U2xKQ2V3U3gvbFlWc2k1NE82UU9YVWxjSFpGQzJIekJkU2Y2MlQzYW1ySkdZ?=
 =?utf-8?B?dTJLak9JbzVuOHRMSjJsK2lRa1NmdmlJREJQdWJVYmpTNjc2V3llQitmK2xo?=
 =?utf-8?B?OVJFUjQzRjE1MTI3eldQMzdiVFRNNm13OUJvU3haenVwUkxFTGhjbExUN1hw?=
 =?utf-8?B?cU8rN0Z1S2ZJYkRQVVF6SjQwNm1WeVEwVy9PdDA3TXduMnlIbDk3VTBKd1py?=
 =?utf-8?B?QzZCdTR2K0tETFQrTXhlcjZYVFNLaWJ3RFh4TEVJTUhseXVrekw3RmVXR1B0?=
 =?utf-8?B?cG93YU9WdHdtUkw4bkFPMVZLeTlvYWZOYzIvdW1SdG94M01FV3NvZktxVEFC?=
 =?utf-8?B?eXMyRU80bExadEdteVlpU08vVDdTWktyMExqVWVYeGliRVp4elBLeXVaUXZK?=
 =?utf-8?B?WjJ0SmdNRkNhTmwwMjVFOWE1RVp3bzhMelZiOWtvS1VBMmlHamRaOEw0QXFo?=
 =?utf-8?B?ZExCNHFjMXdPZDdJeXdONXUrR3lYUWU2UUJNZ2VuU1hBb3gzNy9DUDJqaHlv?=
 =?utf-8?B?aUtPTWlkMUFONkRCZjVnd1h4dzZIS1BNekFQN01DNFZrMWJQUFhHa01JOXJp?=
 =?utf-8?B?VVp3MHpvcHhwTFV0dTBFOE01dXV1QlRtN2hzUmU4bWdwWStXeE0rUEJSbXk3?=
 =?utf-8?B?NVRrbExHZkNHZ1lhbXZiazdyMS9zS1l6RWhUSzErN1lxbjhieVROSVBMTk1B?=
 =?utf-8?B?L3JISFdMY2FtR0Nxc0w3c0V4SUlhdzF2a2FMU3p5SXp3STlPdk5XV0wvejNH?=
 =?utf-8?B?MitDSW44Rmk1a0UycVl2UXpRSXlKLzhLWGNKSnpvVk5Ta2R3SEZiWGV5WVRU?=
 =?utf-8?B?VTgvWUdubmZkRUxJZG1yT0lCbkFEeGRISEE4ajRjcXJxTDZHN3ZTK0c4c05r?=
 =?utf-8?B?N0dyanFxRlBoMXphd1BQTmppRmdJcmd0K0svYU5vWkd1RWZwaGhRZ3I5a25n?=
 =?utf-8?B?SWcwRTZNRCtOSGlNNWh6M00rVXZWQ1pJTHVybWJCdXVYU0lrVlVGcUcwMDY5?=
 =?utf-8?B?M2ZYczJMRnJHV1VRSVpkRlJDK2FmMy9NUFRzbXhVZEQvd1hvUm1HWFU0ai93?=
 =?utf-8?B?T0hsQlhmblJUK0xaVXl2RXBCUUViRDVkVGlzaFpXSUFCRno4V1FSTGpZRW02?=
 =?utf-8?B?dm85ZEU1TmR1NWFHUWZpOHM1a2lQN21jYVg3OTVwTTFNbG5wNVNJZDFMMHBL?=
 =?utf-8?B?cnFjZm9kNDB5aWlnazBuZlVZZ1ZjUnl6S2RucXc2MUFGdHhzaWsrWldCaWUz?=
 =?utf-8?B?ejgvQklMaHpQVm9WSUJscWpPcld3UHFVQ2JIQXJSc0FvamFNSlhyKzBBZko5?=
 =?utf-8?B?a3lJUTVmckR4TjVvWDFmUWw3eFVQT3FLOGxUZlVHV0NmeTBBMTc2ajJZcWpU?=
 =?utf-8?B?d3FiNE5XUE5hZWhxUHJ3V2NvY3A2Zkx4WjlCaVI1RVNMVkM5VHcwZk0wQ2tt?=
 =?utf-8?B?YnREWStFQVFxNU5TQkFHWW1oVFFoRi9jbVpqUi9RbVlnZ2U0M0xwbm90Z09B?=
 =?utf-8?B?WUxQQk9tUDVmUXN2WEZiNTh4QUJLNCtpRUJCZENzQzVkRlkyL05HbFlZYXk3?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6f6ca1-568d-4451-2026-08dcbab5d12e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 10:02:04.0783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnd7W+JLStajhJAzmMZxRxSwlLnakAxubjmasoavVWrGagkj7WR1ddiDhV3IauMaDoXcjrlei+PglSijqG5NWPnflnduSQhyaC1ruacKi9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12305

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBdWd1c3QgMTIsIDIwMjQgMTA6MTYgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA3Lzhd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1N2g0NC1ncC1ldms6IEVuYWJsZSBPU1RNLCBJ
MkMsIGFuZCBTREhJDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBBdWcgMTIsIDIwMjQg
YXQgODo0MOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4N
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFByYWJo
YWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBTdW5kYXksIEF1
Z3VzdCAxMSwgMjAyNCA5OjUwIFBNDQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNy84XSBhcm02
NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTdoNDQtZ3AtZXZrOg0KPiA+ID4gRW5hYmxlIE9TVE0s
IEkyQywgYW5kIFNESEkNCj4gPiA+DQo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gRW5hYmxlIE9T
VE0wLU9TVE03LCBSSUlDezAsMSwyLDMsNiw3LDh9LCBhbmQgU0RISTEgKGF2YWlsYWJsZSBvbiB0
aGUNCj4gPiA+IFNEMg0KPiA+ID4gY29ubmVjdG9yKSBvbiB0aGUgUlovVjJIIEdQLUVWSyBwbGF0
Zm9ybS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiB2MS0+djINCj4gPiA+IC0gTmV3IHBhdGNoDQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vYm9vdC9k
dHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQtZ3AtZXZrLmR0cyAgfCAxOTENCj4gPiA+ICsrKysrKysr
KysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDln
MDU3aDQ0LWdwLWV2ay5kdHMNCj4gPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5
YTA5ZzA1N2g0NC1ncC1ldmsuZHRzDQo+ID4gPiBpbmRleCA1OTNjNDgxODEyNDguLjExYzEzYzg1
ZDI3OCAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OWcwNTdoNDQtZ3AtZXZrLmR0cw0KPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA5ZzA1N2g0NC1ncC1ldmsuZHRzDQo+ID4gPiBAQCAtNyw2ICs3LDggQEANCj4gPiA+
DQo+ID4gPiAgL2R0cy12MS87DQo+ID4gPg0KPiA+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
aW5jdHJsL3J6ZzJsLXBpbmN0cmwuaD4NCj4gPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bp
by9ncGlvLmg+DQo+ID4gPiAgI2luY2x1ZGUgInI5YTA5ZzA1Ny5kdHNpIg0KPiA+ID4NCj4gPiA+
ICAvIHsNCj4gPiA+IEBAIC0xNCw2ICsxNiwxNCBAQCAvIHsNCj4gPiA+ICAgICAgIGNvbXBhdGli
bGUgPSAicmVuZXNhcyxncC1ldmsiLCAicmVuZXNhcyxyOWEwOWcwNTdoNDQiLA0KPiA+ID4gInJl
bmVzYXMscjlhMDlnMDU3IjsNCj4gPiA+DQo+ID4gPiAgICAgICBhbGlhc2VzIHsNCj4gPiA+ICsg
ICAgICAgICAgICAgaTJjMCA9ICZpMmMwOw0KPiA+ID4gKyAgICAgICAgICAgICBpMmMxID0gJmky
YzE7DQo+ID4gPiArICAgICAgICAgICAgIGkyYzIgPSAmaTJjMjsNCj4gPiA+ICsgICAgICAgICAg
ICAgaTJjMyA9ICZpMmMzOw0KPiA+ID4gKyAgICAgICAgICAgICBpMmM2ID0gJmkyYzY7DQo+ID4g
PiArICAgICAgICAgICAgIGkyYzcgPSAmaTJjNzsNCj4gPiA+ICsgICAgICAgICAgICAgaTJjOCA9
ICZpMmM4Ow0KPiA+ID4gKyAgICAgICAgICAgICBtbWMxID0gJnNkaGkxOw0KPiA+ID4gICAgICAg
ICAgICAgICBzZXJpYWwwID0gJnNjaWY7DQo+ID4gPiAgICAgICB9Ow0KPiA+ID4NCj4gPiA+IEBA
IC0zMiwxNyArNDIsMTg2IEBAIG1lbW9yeUAyNDAwMDAwMDAgew0KPiA+ID4gICAgICAgICAgICAg
ICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPiA+ID4gICAgICAgICAgICAgICByZWcgPSA8MHgy
IDB4NDAwMDAwMDAgMHgyIDB4MDAwMDAwMDA+Ow0KPiA+ID4gICAgICAgfTsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgIHJlZ18zcDN2OiByZWd1bGF0b3IxIHsNCj4gPiA+ICsgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAg
ICByZWd1bGF0b3ItbmFtZSA9ICJmaXhlZC0zLjNWIjsNCj4gPiA+ICsgICAgICAgICAgICAgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gPiArICAgICAgICAgICAgIHJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+ID4gKyAgICAgICAgICAgICBy
ZWd1bGF0b3ItYm9vdC1vbjsNCj4gPiA+ICsgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1v
bjsNCj4gPiA+ICsgICAgIH07DQo+ID4gPiArDQo+ID4gPiArICAgICB2cW1tY19zZGhpMTogcmVn
dWxhdG9yLXZjY3Etc2RoaTEgew0KPiA+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJl
Z3VsYXRvci1ncGlvIjsNCj4gPiA+ICsgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RI
STEgVmNjUSI7DQo+ID4gPiArICAgICAgICAgICAgIGdwaW9zID0gPCZwaW5jdHJsIFJaRzJMX0dQ
SU8oMTAsIDIpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ID4gKyAgICAgICAgICAgICByZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gPiA+ICsgICAgICAgICAgICAgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gPiArICAgICAgICAgICAgIGdwaW9z
LXN0YXRlcyA9IDwwPjsNCj4gPiA+ICsgICAgICAgICAgICAgc3RhdGVzID0gPDMzMDAwMDAgMD4s
IDwxODAwMDAwIDE+Ow0KPiA+ID4gKyAgICAgfTsNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICAm
YXVkaW9fZXh0YWxfY2xrIHsNCj4gPiA+ICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyMjU3OTIw
MD47DQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiArJmkyYzAgew0KPiA+ID4gKyAgICAgcGluY3Ry
bC0wID0gPCZpMmMwX3BpbnM+Ow0KPiA+ID4gKyAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICt9Ow0KPiA+
ID4gKw0KPiA+DQo+ID4gY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47IGluIFNvQyBkdHNpbQ0K
PiA+DQo+ID4gV2h5IGZyZXF1ZW5jeSBzZXQgdG8gMTAwa0h6IGZvciBhbGwgdGhlIGkyYyBub2Rl
cyBldmVuIHRob3VnaCBTb0MNCj4gPiBzdXBwb3J0cyBUcmFuc2ZlciByYXRlIHVwIHRvIDFNSHo/
IElzIGl0IGJvYXJkIGxpbWl0YXRpb24gcmVzdHJpY3RpbmcgdG8gMTAwa0h6Pw0KPiA+DQo+IFRo
aXMgaXMgZHVlIHRvIGRyaXZlciBsaW1pdGF0aW9uLCBvbmNlIGRyaXZlciBzdXBwb3J0IGZvciBG
TSsgZ2V0cyBhY2NlcHRlZCBbMF0gSSBwbGFuIHRvIHVwZGF0ZSB0aGUNCj4gZGVmYXVsdCBmcmVx
dWVuY3kgdG8gIU1IeiBpbiBTb0MgRFRTSS4NCg0KSWYgdGhlcmUgb3Mgbm8gYm9hcmQgbGltaXRh
dGlvbiwgcGxlYXNlIHVwZGF0ZSB0byA0MDBrSHosIHRoYXQgaXMgdGhlIG5leHQgYmVzdCBmcmVx
dWVuY3kuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gWzBdIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDI0MDcxMTExNTIwNy4y
ODQzMTMzLTktDQo+IGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tLw0KPiANCj4gQ2hl
ZXJzLA0KPiBQcmFiaGFrYXINCg==

