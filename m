Return-Path: <linux-renesas-soc+bounces-12656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80CA20A3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CFC07A1633
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDB71A2381;
	Tue, 28 Jan 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rEVraj4o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DCB19C561;
	Tue, 28 Jan 2025 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066297; cv=fail; b=ZozhjMftvxxGgOdtNoHwqopPosA9V9bxr0dXdmWmOFnFbKxIZM3pcahiw2Y76oH6gjwAmo3yolIdloMF5r9qAyS3WKjDLLZAaO9wkixSuOnA5vkJgCaTnYI8ZZgiQzP5wVh7ASnmcaUs267/h0YfyjLTzf9vg/SzGGknj9N8q+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066297; c=relaxed/simple;
	bh=hXdGLWlG1ITvtmOvmrwUe03JemggqLVRmhop3SCyAOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dFoZPbQBudCbf9MEnqhJKggW7xuPydEwB3lryk7GLR/ZeaGSMFtouOb+Fr6zzxFOw+5eSJMje4aZVtaxBRHwq77KnFisLqDt2fF9dVMPS66g2bX26fM98Z6VchF1kPvkfMMpXVz3ql8hBbLkdLJYlFqQrNL4VjrRIY9GbRcglY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rEVraj4o; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0RSmUWylN5M0TFFxyMis0n6OaKrDgX0NDD/Y65O4UtSlKtGvU6x+KhBgW4f90r8kJwFKSjPIW7gIWQEqZHdi9R2CdeBUOXcPBq/YS6qkwN2s5CxjCyV19qBwvm6Z5+FxZfBfzS1snd+XH3PEQedXr6yMbnvqRM8OsUi0kNAg6gWehGozPzitT9NkmrndBIp5Ca5lUVAPbTGfNItqCIpGcMW0v5/3ueW89/93GqOVehvNGukuFtaLgIffLzSzeY1hv7x6Px9W5DQkz0H91VcALpcD+4mj2cjdBCaYDq3yWvse3Kz86cQhwMEQYEMQJoUS4kTNoBuh0/rAFz50cpS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXdGLWlG1ITvtmOvmrwUe03JemggqLVRmhop3SCyAOY=;
 b=wa+r7SVsxE5DEU9aOLgYivGVJmcGmYGq0g+d9BgGiId02BO5crwbL6HOePzp4QejR5qEsC6mvMWXZ5I3nAmc9kfnFIwJwg/YtdX4fnqgVHYfYDVvMk/FygwfR+8YP8G0OiMLHvGleTDsP2ZxjMv6K9EGDFGsIlB88myGuEOM0DGS3Q4IOlzUSzl3dR8fNUpqRiyvGu9b+sVMEFtnvmzs80RzbAFmkchTbhlQF+bYebHz/I99FtTfjGWIyOmI+oapJe7qjqKduDu5wSnaGCZXz7XpDwh27vhqxqFueF0H5Em71Gak30xXnnEH2ci1JWtFZcJi+1w1BA8Rk6Cg0KhgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXdGLWlG1ITvtmOvmrwUe03JemggqLVRmhop3SCyAOY=;
 b=rEVraj4oxzLHIJVV5qJymf7bMG6w7Z8jOCkhVX3pmtaMpDwYerHCN9OENFUGKp5vk/9CDtt0IPHlzllw5lZO4w3tRgsGKuaQLX34XDfkdlu2YG35b0h7t/qltvrT71cpJTKfAhravxRHxaKvYYtS4iV14e3R0LXkdlnFh6/07WE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11380.jpnprd01.prod.outlook.com (2603:1096:400:374::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 12:11:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 12:11:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Thread-Topic: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Thread-Index: AQHbb/jAShwKhSxihEelcI6XMh61NbMsENmAgAAAeBA=
Date: Tue, 28 Jan 2025 12:11:29 +0000
Message-ID:
 <TY3PR01MB11346016CB4B1414521B66F1F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11380:EE_
x-ms-office365-filtering-correlation-id: f2ba6f0a-8ec0-4114-30d7-08dd3f94e5c9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHUxOWpEajNWSzNjUkRSNnpkdjZMaC8veVg2SjJkb01raUhESGVOYTdoMURa?=
 =?utf-8?B?dWt2bWZhY0pDQjlhZ2llY3F1RHMwL3diNThPcjRIMmpyRmlhUU94YnNLc0RZ?=
 =?utf-8?B?QzVndWNZUkhDU0hkandEbXJ3Y2szUGdQdVRBZW4wVU9LRzBjaEJGZC9ZQzYz?=
 =?utf-8?B?MWR0TEprWXNJM2ViZkxFdWZKOVlyVDFWWFJSZURnRFNCZ1NjWW9TK3dwV0tL?=
 =?utf-8?B?MkZtZjRNZjZsQTIrUVYwK2ZKVzFCUUxQb0xLZnlHWkdmZURSaU9tTFdZTEhT?=
 =?utf-8?B?VGZQbjQyWEZ2Rm5aK2RIZGxJRWpXQW5uTktSTFZBMUdjR0RhdFgyVzFjcUkz?=
 =?utf-8?B?Q0hrMjFydEtrOTdvc0RWc3RUMit0ZU1DQ2VKQ01tY2dmQkdlMHlXMGZUYnFJ?=
 =?utf-8?B?NlliL3VoSkw0VDlMUURQUytSOWU2QkhHTXNILzJVUHBXT2lzRnNhT3RGcUFN?=
 =?utf-8?B?d21MTXpOdVlxZ1FiWTR3MjRNbW1ib0VKZVVIQ2NxemNac21BelJNcEk2OEFv?=
 =?utf-8?B?QXZieHc2QlZoMEFXb2dTU2kyV05VaVc2bEdGVHpIZ2kzaWJSZ2hjWkJiMUlT?=
 =?utf-8?B?eGhrbjBSTUJmRXRpSUk0V2x5YVpKSzRoQ2FhL1d6Y2hPYlNGUDd1WlJxWXFF?=
 =?utf-8?B?TmlXZVdHaTZaNklPSExzV0taaTlxZWpPZmdybW1UNjRVRDB0NE8xRjI5cyty?=
 =?utf-8?B?ODN3TkxFN24wZmFpdVQ4M2RMcHo4aXNBbUZmZmg1Z1grdnJ6ZDhpd2MrSjBT?=
 =?utf-8?B?cjRWTW9iaUsyRFJkaDYvYTlKaWpDSnB3OExDdGdCbElrelRnSHlHMkp6d3cx?=
 =?utf-8?B?TmtWOHJCSDhSLzVlYlBrWHZIUUw0T2plQjNyWUd5RnFpRFhjaWxVbEU3b0x4?=
 =?utf-8?B?VUlRUnM1dng1QUdCSjVqdVNJMi9EZ21ZRitLUnBUZ0tXOWV1SUdTamhiK0NB?=
 =?utf-8?B?bW5lM2JKbzBZbGx1c1UwTlVzck92R0hHNHhicnZkYlA4UklyaUQ1U056MHdS?=
 =?utf-8?B?Ky9FNkdkZjVFMm9EOTJFQy8xWmdWWHlUbnMrQ2VIOWhzaFR6THlzeTZHQjNV?=
 =?utf-8?B?NGM4cDBlTWFzNHZDYmkvMkRDVEZISEo2RzlkWWprZDRhS0dwWFRWSUlxakxq?=
 =?utf-8?B?SzEybk1VNHF2V0d1QjUzZmpSSE41VU1BSmNYYTdETTltTUtidGRVTGo0WVlh?=
 =?utf-8?B?NEtQM1V6T3ptWCt4UzJpRjNVVHROaURZb1BnVGpyQk9zbFJVN3UzR0JZRmdY?=
 =?utf-8?B?bmFEbk9DRTZTVlFUeFg0c05iYkNRa1VNcmtrTUhTWk5aTFBLS3RVS1h6VHdY?=
 =?utf-8?B?RjNlelZqT2Z4TjV1Z2lFMHExZ3o3ay9nRGNwNGtQLzZvak9NckhUQmFaTFNy?=
 =?utf-8?B?Znk4TG5pZTgveGJOZkVYR2F1ZTYySEtuR0xoV1RiSmh1Skt6d0ZwZ0NxcmVS?=
 =?utf-8?B?N05sc2FpV0JEWGI1UnFnSmZoYTg4bVBMYjZUSmVJb2wzbTZiQ29HTzJBWVNh?=
 =?utf-8?B?b1hYVWpNNVYySHFKZ2dCMUNhT25KRnR3WExNd3p1elg4UHN0cmw3ZjZZZzIy?=
 =?utf-8?B?QWJsdys3V1hkTEFDc3F0dDVLY014eGxvb0p3KzZVZktPV1VEbnlwUE1WK2tV?=
 =?utf-8?B?R2o5SG5DZU8vb1YzUGdOTFk0QVJ0NE9jWFl2T2xERlFHU1BFdTI0aDJhSXNm?=
 =?utf-8?B?WnVnSjExQ3JHNGZiamJNbTJvY29wQ1k5MlppYkMrK3d2OUg3b1NTNytFMUdH?=
 =?utf-8?B?ZDNhbGdhZnZibnFRZlhUdGNNbXFtY0lPOWxTeFdMbFo5ZkZMQ3U5VmdyMEE4?=
 =?utf-8?B?Q2JJMUNhSUc0TUsyYUV4dVFqbjR2WnoxMUQ2TVhtSjNlVGR0dWxQejZSN0hP?=
 =?utf-8?B?WDNOWExtZUt0UWtieXh5Rk05QkE1TVhaS2EzMkNnaHV6dnN4QVZzQlk4N2Ry?=
 =?utf-8?Q?LnciLUxH0RoxbO4sAHS5AdQUSlD660N8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dndtZG9OZTh1RldkTzY2WU9hMXlDQ1BhWEQvV2pCQzUrUUtGT0xWVWZ4RnUw?=
 =?utf-8?B?YzRoOG93VXpMNmZhV0VrY2MyUktwaXFrVTFRVTIwMWUyblpNMHZMRmRIeXlm?=
 =?utf-8?B?aWhmM3FaVExKV3ZnNThRc0ZYQ2NiK3JuNTRzTDJFOERKbGIxZWZuYTE1ZnRI?=
 =?utf-8?B?a0RPNXBVVGdVNEZuYk56cE12Y3JOb3c5eGMvMnM3eE14emc2U2R1OEIxVTZO?=
 =?utf-8?B?TDRVOTlPNzJlU3BsTDc5bnAyR3NpNE4xeERoTTBnUEM1ZVI1THpjVGRYeEda?=
 =?utf-8?B?bnkvMEdPOVR5TllUQ0hCdWpwVTFTUnVic1hGWFQxTmViK3V1VGVQN21VaDJv?=
 =?utf-8?B?UDFnQzF5M0ZUOE1sUUkvR25XVnE1c2p6ZjhQeVZZalYxQWpNYnpDaEJYUFQy?=
 =?utf-8?B?UTU4TkpZTy95Q1NnVHdDT1p0VlpNdjNyTG4ybDVKWHZkVGd0VGt5Szd6bktq?=
 =?utf-8?B?MWp1dHM4K2FzVWc5eDQ5dFM2QlFLMVlNWG9QUHRxcXBudWpDb3p4T2kyTDJJ?=
 =?utf-8?B?L2UySW4vL1lySmJySFAvNGVMTHp1dVhVQUtXejVsSnYzV2VaTndKMUN6ck5l?=
 =?utf-8?B?ZTgwOE4vbUNSUy9aa3BIZjJsdUw3UXBzNnNDRWFzdkVlS2xuaVpvaEFsanEv?=
 =?utf-8?B?RktWOFh2Y2s0M21heFVOYUROT01taWE3cE1Id3A5bjAzMklCdit4dXJxeEw3?=
 =?utf-8?B?SjZuZGZqK3JmR1dheXU5ajNDOUhaVDI4WWJ0WWR2MzM1MU1RLytjcUNiUHAw?=
 =?utf-8?B?UklnQ1B4eHRVNU1EVmdDbDZCSkh5a2ZpRDQ1dldPOXpWL3I4YW1nTlJTSE95?=
 =?utf-8?B?NnFKOEtPdE01Y0ZhQ0R6enU2K3Y3dzAyOERMbkY3UURLNVNPRTZ1WlJMMDUx?=
 =?utf-8?B?YXFSdTdUaVY3TkE4YmRpTkFlOVoyL1VMcjUrTTA0Y2RET0VzZU9hU1Bha3Av?=
 =?utf-8?B?eTlzWUtvL0NqeXY0WU1ndWxlSEgwbEk4VEtMNnN1MThBT2xpV0l1Q04xZ1Jv?=
 =?utf-8?B?SWhQWnhiME1oQzFJbnUwSlBJTFBzRVdsR0lZMXRRSEpQSFBoR203cXJ4Y2ha?=
 =?utf-8?B?WWFMVi9vZS9mR2srci9BVGxDSHZOSWpPUWJPQU8rV3NuL3p1Q2lvMkJKcExZ?=
 =?utf-8?B?UC9lL0lNNEZjK2U1RWlaTG1sTkg5cHhyYTFsOWVDdEJ5TGRjUGcyTHBnOVBw?=
 =?utf-8?B?OGxtVHp2dnpMYWhMNk0vV2daRlpRY0JzMEpXb2xwSzA5bDQrTEIzOFBSRkhI?=
 =?utf-8?B?TlRaYzZWWkZFODBOd0h5dVdYY3JHTmk4eWZCNEl0ZGFlS1dsTWV3RzcvMXR1?=
 =?utf-8?B?UGxpSmEzVmpmTnlJVWRDYlZsSnlOdlNYN2g5ZDNXVGJqbHMwZjd6ZVZ6UG1t?=
 =?utf-8?B?ZXAwYllJVzNKaHpMVndoWVhtVytkY2FkSitkZkdYaUFLNzliVkVrenU5TUhB?=
 =?utf-8?B?cXVKQlUveXJvcEM4aE54QUNZdjIzRXVVNWpqR0hmT1BITTdFOG9mRnNoY0RT?=
 =?utf-8?B?UnpVdTdGNEpjdWx1cGZtM0pWN2FOcTRFMXhKdEgzc056N2JrSlR1VTJ2a2Zo?=
 =?utf-8?B?VnJDVjliR3lyRlh6d1B6WE9EaDkwY1Y4OUpaZHE3ekhLZjMwenlPVXZwbGZL?=
 =?utf-8?B?Z2xySkwrTnkxVkZHNWIxblV5UGxyMDlkbnB6b0NLbjBjR3JybnRrcFFnaVdG?=
 =?utf-8?B?aHV1TkR3VzNPOUQwakxoTzZUWW9YWnNsdldYYit5Z3QxOGFTcHVoalBQSjZV?=
 =?utf-8?B?S0V0cmFvcVdQZWJPUDg5QlhMRnV1RVhLQVMxdU9IczI4MGZNR2xIaWZaODQw?=
 =?utf-8?B?K2VRTzIwVHdVaVlXelVvOW94RUhBM3ZIK2RtbTlxV3pDZGVMWE5iRzhiQVBF?=
 =?utf-8?B?aWZ2QkVnZ3ZRVlBmUmVoYVROSlB1VlJEMnFLRUVHYzM1SnlkbGVOQWh5QnVP?=
 =?utf-8?B?QldmT1gzMWlIRXZ6RUtJTVU1OElQRENua3FCSXhjZmxBeWNySG9BTTBzbEl0?=
 =?utf-8?B?RFUvZHBmQTBKNDNhbEptdUp0US9Bd2hKK2lMVkw3VFV0TjlsWngwRHRVOWxD?=
 =?utf-8?B?MWFyNnJkWGpyM1hoY0s5SEJzT1lCOW83dVpDTmMyNkVSd2xGeHpIY2VOMXhZ?=
 =?utf-8?B?cWFnQ0hLOUR4TTNLTjlGaG9OdTg5RmFPY3FsZnBNSGRzcmVGR0FQTXk1VTNx?=
 =?utf-8?B?Y2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ba6f0a-8ec0-4114-30d7-08dd3f94e5c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 12:11:29.8735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7N238r3opElDUIP99KYlU+VWpT24Dy3NGhdb6WyU6+RkMR2yA/0OSPWJ0oQReCS/i6obOYo4W1o73ByBIeYEQemF9VaXRLAUE4dLtAUpWx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11380

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxMTozMw0KTWFoYWRldiBMYWQgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47DQo+IGJpanUuZGFzLmF1IDxiaWp1
LmRhcy5hdUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS83XSBhcm02NDogZHRz
OiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBTREhJMC1TREhJMiBub2Rlcw0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IE9uIFN1biwgMjYgSmFuIDIwMjUgYXQgMTQ6NDYsIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIFNESEkwLVNESEkyIG5vZGVzIHRv
IFJaL0czRSAoIlI5QTA5RzA0NyIpIFNvQyBEVFNJLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDlnMDQ3LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDln
MDQ3LmR0c2kNCj4gPiBAQCAtNTE4LDYgKzUxOCw2MyBAQCBnaWM6IGludGVycnVwdC1jb250cm9s
bGVyQDE0OTAwMDAwIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29u
dHJvbGxlcjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19Q
UEkgOSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgICAgc2RoaTA6IG1tY0AxNWMwMDAwMCAgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzZGhpLXI5YTA5ZzA0NyIsICJy
ZW5lc2FzLHNkaGktcjlhMDlnMDU3IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwIDB4MTVjMDAwMDAgMCAweDEwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzM1IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MzYgSVJRX1RZUEVf
TEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCAweGEzPiwgPCZjcGcgQ1BHX01PRCAweGE1PiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDB4YTQ+LCA8JmNwZyBDUEdfTU9EIDB4YTY+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xr
aCIsICJjZCIsICJhY2xrIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8
JmNwZyAweGE3PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0g
PCZjcGc+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZxbW1jX3NkaGkwOiB2cW1tYy1y
ZWd1bGF0b3Igew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9y
LW5hbWUgPSAiU0RISTAtVlFNTUMiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0K
PiA+ICsNCj4gPiArICAgICAgICAgICAgICAgc2RoaTE6IG1tY0AxNWMxMDAwMCB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDlnMDQ3
IiwgInJlbmVzYXMsc2RoaS1yOWEwOWcwNTciOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAgMHgxNWMxMDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3MzcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDczOCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDB4YTc+LCA8JmNwZyBDUEdfTU9EIDB4YTk+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMHhhOD4sIDwmY3BnIENQR19NT0Qg
MHhhYT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIs
ICJjbGtoIiwgImNkIiwgImFjbGsiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0
cyA9IDwmY3BnIDB4YTg+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFp
bnMgPSA8JmNwZz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdnFtbWNfc2RoaTE6IHZx
bW1jLXJlZ3VsYXRvciB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1
bGF0b3ItbmFtZSA9ICJTREhJMS1WUU1NQyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAw
MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAg
IH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBzZGhpMjogbW1jQDE1YzIwMDAwIHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsc2RoaS1yOWEw
OWcwNDciLCAicmVuZXNhcyxzZGhpLXI5YTA5ZzA1NyI7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDE1YzIwMDAwIDAgMHgxMDAwMD47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDczOSBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNzQw
IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgMHhhYj4sIDwmY3BnIENQR19NT0QgMHhhZD4sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAweGFjPiwgPCZjcGcgQ1BH
X01PRCAweGFlPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJj
b3JlIiwgImNsa2giLCAiY2QiLCAiYWNsayI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmVzZXRzID0gPCZjcGcgMHhhOT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXIt
ZG9tYWlucyA9IDwmY3BnPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2cW1tY19zZGhp
MjogdnFtbWMtcmVndWxhdG9yIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZ3VsYXRvci1uYW1lID0gIlNESEkyLVZRTU1DIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8
MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAg
ICAgICAgfTsNCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiAgICAgICAgIHRpbWVyIHsNCj4gDQo+
IFNob3VsZG4ndCB0aGUgdnFtbWMtcmVndWxhdG9yIHN1Ym5vZGVzIGJlIGFkZGVkIGluIHRoZSBi
b2FyZCBEVFMsIHdoZW4gbmVlZGVkIChpLmUuIGF0IGxlYXN0IGZvcg0KPiBTREhJWzEyXSk/IE9y
IGRvIHlvdSBleHBlY3QgdGhlIGJvYXJkIERUUyB0byAvZGVsZXRlLW5vZGUvIHRoZW0gd2hlbiB0
aGV5IGFyZSBub3QgbmVlZGVkPw0KDQpJIGFncmVlLg0KDQpJIGhhdmUgcHJvdmlkZWQgYW4gZXhh
bXBsZSBpbiBuZXh0IHBhdGNoIHVzaW5nIC9kZWxldGUtbm9kZS8gdG8gdXNlIGdwaW8tcmVndWxh
dG9yLg0KSSBhbSBvayBmb3IgbW92aW5nIGl0IHRvIHRoZSBib2FyZCBEVFMgYXMgd2VsbC4gV2hl
biBJIHNlbnQgcGF0Y2gsIEkgYW0gbm90IHN1cmUgd2hpY2gNCmlzIHRoZSBiZXN0IGluIHRlcm1z
IG9mIHVzZXIgcG9pbnQgb2Ygdmlldz8NCg0KTm93IEkgZ290IHRoZSBhbnN3ZXIgdG8gbW92ZSB2
cW1tYy1yZWd1bGF0b3Igc3Vibm9kZXMgdG8gYWRkIGluIHRoZSBib2FyZCBEVFMgZm9yDQphdGxl
YXN0IFNESElbMTJdLiBJIHdpbGwgYWRkcmVzcyB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KRXZl
biBmb3IgU0RISTAgZml4IHR5cGUsIGlmIHdlIHBsYW4gdG8gdXNlIGZpeGVkIHJlZ3VsYXRvciBm
b3IgZU1NQz8NCg0KPiANCj4gSXMgaXQgcG9zc2libGUgdGhhdCBTREhJMCBkb2VzIG5vdCBuZWVk
IHRoZSByZWd1bGF0b3IgY29udHJvbCwgZS5nLg0KPiBpbiBjYXNlIG9mIGEgZml4ZWQgdm9sdGFn
ZT8NCg0KWWVzLCBmb3IgZU1NQyhmaXhlZCBjYXNlKSBpdCBpcyBub3QgbmVlZGVkLiANCg0KV2l0
aG91dCBSZWd1bGF0b3I6DQotLS0tLS0tLS0tLS0tLS0tLS0NCg0Kcm9vdEBzbWFyYy1yemczZTp+
IyAvc2RoaV90ZXN0LnNoDQpSZWFkIGF0IGFkZHJlc3MgIDB4MTVDMDAzQzggKDB4ZmZmZmIzZjk4
M2M4KTogMHgwMDAwMDAwMQ0KDQpbICAgIDEuODg0MjI3XSBtbWMwOiBuZXcgSFMyMDAgTU1DIGNh
cmQgYXQgYWRkcmVzcyAwMDAxDQpbICAgIDEuODkwNDgwXSBtbWNibGswOiBtbWMwOjAwMDEgMElN
MjBGIDU5LjMgR2lCDQpbICAgIDEuODk4Nzc3XSAgbW1jYmxrMDogcDENCg0KJCBkZCBpZj0vZGV2
L3VyYW5kb20gb2Y9L3RtcC9tbWNibGswcDEtcmFuZG9tIGJzPTEwMjQgY291bnQ9MTAyNDANCjEw
MjQwKzAgcmVjb3JkcyBpbg0KMTAyNDArMCByZWNvcmRzIG91dA0KMTA0ODU3NjAgYnl0ZXMgKDEw
IE1CLCAxMCBNaUIpIGNvcGllZCwgMC4xMzEwNjMgcywgODAuMCBNQi9zDQoNCldpdGggcmVndWxh
dG9yOg0KLS0tLS0tLS0tLS0tLS0tLQ0Kcm9vdEBzbWFyYy1yemczZTp+IyAvc2RoaV90ZXN0LnNo
DQpSZWFkIGF0IGFkZHJlc3MgIDB4MTVDMDAzQzggKDB4ZmZmZmExY2E3M2M4KTogMHgwMDAxMDAw
MQ0KDQpbICAgIDEuODUzNzI4XSBtbWMwOiBuZXcgSFMyMDAgTU1DIGNhcmQgYXQgYWRkcmVzcyAw
MDAxDQpbICAgIDEuODY0NTI5XSBtbWNibGswOiBtbWMwOjAwMDEgMElNMjBGIDU5LjMgR2lCDQpb
ICAgIDEuODczODU5XSAgbW1jYmxrMDogcDENCg0KJCBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9L3Rt
cC9tbWNibGswcDEtcmFuZG9tIGJzPTEwMjQgY291bnQ9MTAyNDANCjEwMjQwKzAgcmVjb3JkcyBp
bg0KMTAyNDArMCByZWNvcmRzIG91dA0KMTA0ODU3NjAgYnl0ZXMgKDEwIE1CLCAxMCBNaUIpIGNv
cGllZCwgMC4xMzE5MDkgcywgNzkuNSBNQi9zDQoNCg0KQ2hlZXJzLA0KQmlqdQ0K

