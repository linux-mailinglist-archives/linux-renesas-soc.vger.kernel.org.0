Return-Path: <linux-renesas-soc+bounces-8132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7B95CAAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF4E1F24C8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 10:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4717016DEA7;
	Fri, 23 Aug 2024 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YcH2dEa2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAA28EA;
	Fri, 23 Aug 2024 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409771; cv=fail; b=FKzRlmbAw8BlKTQe1BEu4+l5PQMeTIlpwWX38k8NReALWfUtZsge0RSMv9VjGqFlKU7+9iC1QftmhlYamWbXf1AYNumPcqpJSrGToEfW6GLEMd/bf51DVT8Ti3W8a98LXPc+e5sNEjinxSzwR/DthnBkxZ2Q61t57MQGYQArFE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409771; c=relaxed/simple;
	bh=GUOItoY/wmuoNF7OJzGlZ5ITWDAW7HNm6GlHAi3NmUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bDow//n3mdy1WO37j0dkd+LAlCgSqfRQOg+n3h3fq93cfRDBol+1fJcUdIMziiAXroMxM+LywZxfS2eGoUnZDVq6c9E3HJdpyjUSnIUZOwWc5GqVAynMyL2fvUhySgbm9zDtJfvynJsrMduBNAHTP2OWFY6BvQ/ElZD1SOnDR3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YcH2dEa2; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak2QKmGaqUcC9a0OHGQN0g38dfXxgHt1j0xrfLUY+M3tUo0CWL8rCFP1RqQgQnuDiJt0n5Gq6WXx3QVFlebTaItCigQNo3zRrYkkNi9VGlQymdFMvgn70Wm8R+M0hYwsiXg03MXEoAQMuEXMsQsAfPHgOOf0zPsg6VpuvkDUuiWtQfsVGPR//v9MaifhEgVJO2uWhtQEiesZits+MFEuoMakPaCMnBQrpo2J2UYqxVJ9ZgmrlSVSsi40/U5nBC0EVtWsztuD4Ok5XdX1NVyZ+dSHrTnwG4kRSwJwMkb3DDzAMkqRt4xm38tmAjtmYVBHC6Cyi1q3xe9FxkrCVzd84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUOItoY/wmuoNF7OJzGlZ5ITWDAW7HNm6GlHAi3NmUU=;
 b=YbvMCvAC4rR8GaLN9ddi3wLvK2EZx1syhg5F4y48fHVcU/AM+tRiYiUO1zVU3/Bt/AdHB7ha2TIE2eBL6+u03CiowtwUI5f4PUoAzVsD7C9VcwYPEr6t4MPzDfNDDCL7jtWd+elsVn2Xt//kLNQnfVKvwzUtUHh5ttgKmynsAVtTHOkDRv4PHodtR6VfWYoduLFpacCnn5E486alZ4XRvG2ynwYsxjtVnrDg9bAja0D4P2WcpXKF4jd1gg6N96Ch+UdIKdaPcHzT3S1qIvSa04ULF18/kqKlhmKZ5rVI+z5uOAIL9amNtbWZq3CdSgYZ4l7acEPghAIV8SXymL4jKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUOItoY/wmuoNF7OJzGlZ5ITWDAW7HNm6GlHAi3NmUU=;
 b=YcH2dEa2kS6rGKplELbNfHYtZu5/nKsIqtvJArzlg+W1NsxqHrbl4ad6ZwuriT+4IazJIhus5+B45wzDuXCICq3mNckvnVKMpr179mUsh/g+2Nrct6XMmb2UUSVrBB2Q5KSJvwNFj3adNutJOAgCagqnOpRbJzZK2TvJtwdpKX0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7104.jpnprd01.prod.outlook.com (2603:1096:400:dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 10:42:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:42:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
Thread-Index: AQHa3m8gifMVm3t1vU2OS0nqOWgpSLI0yjqAgAAKEbA=
Date: Fri, 23 Aug 2024 10:42:42 +0000
Message-ID:
 <TY3PR01MB11346D660ACDDBA4F942C635D86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
 <20240725084559.13127-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXwtrCyCA6A2AZwFgQedQt+sXr9iXoVogvo2N2iY9fjMA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXwtrCyCA6A2AZwFgQedQt+sXr9iXoVogvo2N2iY9fjMA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7104:EE_
x-ms-office365-filtering-correlation-id: 07ff8641-1a54-4ad7-6f75-08dcc360515e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0gvS0EzakxHMkdFb3Nqc05aQ0FKcmpJYmd4UG00ZFpsaWlSNVBrK1NLc3lZ?=
 =?utf-8?B?dTRXOElLWVQrTkN2RlVCMkNCVmZxQXd3dFZ4d1NjT1lobEFGYloyYkQ2MDI1?=
 =?utf-8?B?ZHUrZ1dxR0RnZkZSaU9iaE9QSEhuNTMwR3VFVzJxRXZIekxSUS9pdW9WbHNu?=
 =?utf-8?B?TUlWNnp6WDMyNEUydnZqY29nVndxc0RpV0JMTzM2TlY3WE5aYWQ2dDNTNDI0?=
 =?utf-8?B?SzRuV2pqZlNDNG1TNEtocTQ5ZHM0T0c1V1J2OG04WkdFRkR3ckFjV04zbnhR?=
 =?utf-8?B?bXpMUndwQ1NDQUxOb0ZhZzFKV2JwbSt2UmR0N2s5NncxUXBNeDNlYlJla1FV?=
 =?utf-8?B?QUxYWFg3UDNXNGpmV21reEZ2NWJodGVmdUZTQXNKYzBKUlM4Y1lSUnBOUGxk?=
 =?utf-8?B?SmFMd1V6TGJmQVNyQkIzNmsvUURLdlQzekxPcHdrdXRodm1Lb0lBOGFWd0xp?=
 =?utf-8?B?L01BUWpab2hTLzZKTWZoS0ZDRXR4YVZZci9YdUYyVEtNc2hlUVRKY1VVZnVs?=
 =?utf-8?B?TmxHY1BsbkQ0K21LWURRWmxtdTIza1l2S2dlS2xWZi80TUhpYkpqS2ljSWVx?=
 =?utf-8?B?YTR6QUpHejBqUHMvc0VtUlE0ZWZlQ3ZKOGJTcE5Lb1lLQW1YT3pIVXVKQVlS?=
 =?utf-8?B?VmlQWFM2M2puOUhPMFE0Q2VSYkFycUo2V0tpNjJ5YmpWVEhOZXJ1b3JRSllQ?=
 =?utf-8?B?VDJ4cVFUZDhLU2xuNExadUlJZEhVRm5BV0tXMVdqMUs5WHNZOHpXUHhvVmRR?=
 =?utf-8?B?WHovYURvd0s2WkROTWxZTEJGV2ZrTG82OVhnZk94dWg4Qzd5bi93NWlDY01N?=
 =?utf-8?B?SXFqMXpQLzd5MHprTi9leU54WFZNanBoRHArbDA4RjcrMDNxYzI1REtVYjBF?=
 =?utf-8?B?YkhmNFp4dGcwWUt3TUZ3RTVpZFZadGVJaHhHdStZaGRPYURDRm5OdXFHMTRZ?=
 =?utf-8?B?S296S0dLbzNhV2IzcmJ5eTgrS0ZmUG1PVzBjRU9IRzRkTnZ5VkFublZSWC9r?=
 =?utf-8?B?Z0lqckdFZkNZa2dFcWU1VHlOODlFYVN2dzJkbExZSUN0cGZ1dHlmbUllK3ox?=
 =?utf-8?B?QStPUk9sUHVMdTN5L0Y5dytyNFNiMFBQRTdYM2tNVXVpVXV0cnp6elk3NHNM?=
 =?utf-8?B?a1FsZ20vZWFBV1daS1kxRm0wSXRvMjBOOTk5QklyWGp0Y3RZMFhmRkFKVE9V?=
 =?utf-8?B?RGtHbmdrdE83eTBVajZaT1FvdGhLVldGaVFkOFc0dVl2NFJtVE1ka1krLzRI?=
 =?utf-8?B?bWx4NHpmZHJ2RVNBbWc0ajZhL2U2dHExemM5V1ZZZGpuSmNycENjUDJYYWQ5?=
 =?utf-8?B?eHFqcy9MTjRNR1lMYXFYZmJEbm4yNzlJMEdqcjFmcWhTZGp0WnRCNHg1VEVS?=
 =?utf-8?B?WEVsOUJGR1Rja0VNVEVJejJyMmlKbjBMb2swTTFRTXhWQlB0dEpCZXpNQlcw?=
 =?utf-8?B?UW0zanJSQVZxek5LUW5XZ0I4RHE2YWVOWHp4MElDbHQwZXc5MVFOaXVjQjVu?=
 =?utf-8?B?RDhkem4vaXVVS2UzaGFacFVybzFDRjlhYWRZdXpRRDB3RGptU25Nc2d3S1pP?=
 =?utf-8?B?SmUyWkI5QVlBR3VOWUd1R211SVJibittc2w1c3dwQUhKVFphdm41Z3k0bUps?=
 =?utf-8?B?RVd3eWFSUkc0Y2pnQ3hYZFo1NWI0cUUzcmRVTE54VWlYdTFyQnd3Y1Z1Ukg0?=
 =?utf-8?B?aXFweDdFZzV5bVJnMnY4cWtZNGc5bXpnS0pVZzNYbDJzK3JTMHhZdENxVUQx?=
 =?utf-8?B?SUZQVHBTZE5wZExFc3ZoRndudjNXNXgzWHNyT3JBTE5CT1hwbUdEVktXNjBk?=
 =?utf-8?B?SVNQWUljZ2hrcmdJQ3ZMc0VEZFlQWEtaeWpEaFEyaHg4VjBYVUt5S05GKzln?=
 =?utf-8?B?aHFXRlFRek11OWh5MEh3T0E4VUNncVJFUTRkKzhiRUR6L2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QzhlNkY5VVROWVhKTVNZSUIyZTR2UTR3NU9oQnZxYXlzaVRlRzBYNEZncXRR?=
 =?utf-8?B?ZnRTWDhwZFRLRVBSMkhUdXI2TzZwYWJOSjFncDlCTVJ1RnVoclFoTng4YXB2?=
 =?utf-8?B?Mk5rb0d0QjJsVG5ZWTdNbHYySjIxbFRuWHBrVUF4Y2wzRkFIbWtKUkdzMjZz?=
 =?utf-8?B?dTB5NEV4eFM3VWpxZXVsOEx3ZDVKU3ZSWEFQWUtyWG03YmROb1JIQzBXdHAr?=
 =?utf-8?B?bjlYTEUvZTdSZG00d05RejNwRjNWalI3dTNSU0N0emkzYjBrSTRYVmhDTlVS?=
 =?utf-8?B?VVNXOWRGVUhQSlVFODRKeDg5eEVNN0kyN3NveTcwRks2dnhSU2VubS9QVXp0?=
 =?utf-8?B?aGlFOVNSN1ducVFkNzBzWGh5bC9RamNpOUc3dFN1WVlWbzRHMUo2UFR4RHFG?=
 =?utf-8?B?ZWF5S015dVJUeVI5Nmc2aDNzMnpmaWtrd3N4eWc2TmhRWDhYL284bWZEUWwz?=
 =?utf-8?B?VWxEV2pidFlsYURaajlHUlhmQjVZaFhXcnpnWTVZbG1mQzQ3RmxmM1J1a3px?=
 =?utf-8?B?TkNGSHdIb2FtYlBuU3lkMzFONG9yNUVrc1Z1MWZUY1FjR1V6MDM3VEUrVmNI?=
 =?utf-8?B?MzhUbWMwM3psbFRwaGwreStIc3p6K1Q1aWw0cFh6Z0FmUk5BVTVHRktzQzQw?=
 =?utf-8?B?amtmd29lMTYxT3ptTG9vcmUzRWw3c0RvdHU2MStqREsrZUUveC9IaWhUN1dL?=
 =?utf-8?B?MUFDZE9YTU5ZWTVCa2s4b3Q1TVRoRkJ2WDRXL21Qdy91RjJEVFRxeVMvL0VU?=
 =?utf-8?B?cUdkOVJ1L3BCV0J1WWZJdmJad2ZFbXNGZzQ5Q3M4NTZyUXJ4TEJsR25DS2hQ?=
 =?utf-8?B?MVYxTmRhM1k2RzdPMUJnKzJCYXNUb3cwL1N3TEN5KzR2QjM4S3h3dG1xVStM?=
 =?utf-8?B?QlZJWjVQVFZ1SklzYW52U1ZsNkFZYlB5dnU3bXpxRDJPckpxZWV0ZzQvWUd5?=
 =?utf-8?B?NTFqWW42dk1vNHFnbTVTREJtTUNoZSs0UjVNUGJETXh6YnlXeFUwYnh0NGQ4?=
 =?utf-8?B?eXRYUWg3SFZuQjBwdFhpb1M3SlJZOStNczE2N3dHWW9PUHc1NGt4NU0xb2Zm?=
 =?utf-8?B?U3V1SWJhT1ZybmhiOFkrN3FoWGgzTjZNU3hqSHF1aWJHbkh5MGFvSWZRMXht?=
 =?utf-8?B?ekNHVDk5aHU1ditwRW8yK2l4K0I4SkdsNW4xTThWYTBRVmMzbGRxLzUvN1JO?=
 =?utf-8?B?SUZnb3BIamc1T2V3TFBoN2ZjTnNNWmVQZXZkakQ2RXErd2Q5blZLVGhVRmxs?=
 =?utf-8?B?ZGhXYk9sc3pnU2haUTluMklXek5tRTNJS0EyZXg5dmx2MDJxaGd4NHl4Uk9t?=
 =?utf-8?B?dGhBT00zb0xqUjBVTS9jQzBzeENvWHF0M0FodzRIK0p0aVo4UEh5cVVZVGN0?=
 =?utf-8?B?M2svdmE4MWViZ0gwZmdRTU9hSnZwelRRcUN5OUdBOUJ6Umxld3RFTTJUOEww?=
 =?utf-8?B?QXdpSWZuQXEyQVRiR3JpdmhQWG54ZnRSMG9JYjZKRHhZekh0WTlrRDhFbkR6?=
 =?utf-8?B?elN4TE13Qk8xeDJMYzFHVS9XR0hJWHVwN2JXTUhRWVcwYVNGMW92R2cyOEtr?=
 =?utf-8?B?bWIrUWpYQ2RHSmxyTWNxNUJEdWJlcE5XaHJ0S1NpWWtrUlRDQldTUkNYR1la?=
 =?utf-8?B?OGFXQTdueGFGd2hVL2Y0M1djajFuVTc0V21PMG96cFZ4TVlKemFWa1J3RVFy?=
 =?utf-8?B?Ny9XeGhESVROSzlETGFUNWpzZWp1cTRGTko4Q1NUek1jMm4rMjlJSlRlWnVH?=
 =?utf-8?B?cllUbm4zd1dtUGtvSGZ3RXFhTGxaanJpUmM3ZlZ5eHE0c1VrWHg4enlTVkFH?=
 =?utf-8?B?a3RBSi9MeEZVVjJuK0U1OUhjWjI3dkNUVnlpKzJyMnJWWmMzN1BkYkw3ZVJu?=
 =?utf-8?B?a2E2MmNVYVlUcElGNXF3aWlPTXdHMzZCMU5lTit5SFhJblVFcm9XSmVrMktk?=
 =?utf-8?B?YXk3RWhONC85RHRRSjlLWnd6MHRPVENWdnpJN29DdjRjdWYvdlVIcVhIYStj?=
 =?utf-8?B?K0dPVzZ1ZWJSZEx1MHFiUzJqdnZlc205Q241T1BNeURhaE9hbzZjOTZGcURE?=
 =?utf-8?B?TXFoSlNVRy9EZTlRc2dpemQwOUJYUjZwSHNIYlloMllHMkVUVzdLVVBXMW1B?=
 =?utf-8?B?OUJuNFBoWC8vaTNkU2V4WlEwNXE3RG8wbmZackl1SDJCclErVVZOeEJKVXJt?=
 =?utf-8?B?enc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ff8641-1a54-4ad7-6f75-08dcc360515e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 10:42:42.9129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVBPFDsJNDQhzvJrCXYWwoN1O2nsH0DVPcbzYQBCouN73OeJUjDpRnUsG458dwHCZiPFfll9/ecWwLWxMMZpAKsSScrwFSaBnBqzLj2Erd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7104

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDExOjAyIEFNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybGMtc21hcmM6IEVu
YWJsZSBIRE1JIGF1ZGlvDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBKdWwgMjUsIDIw
MjQgYXQgMTA6NDbigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+IEVuYWJsZSBIRE1JIGF1ZGlvIG9uIFJaL0cyTEMgU01BUkMgRVZLLiBTZXQgU1cg
MS41IHRvIE9GRiBwb3NpdGlvbiBvbg0KPiA+IHRoZSBTb00gbW9kdWxlIHRvIHR1cm4gb24gSERN
SSBhdWRpby4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsYy1zbWFyYy5kdHNpDQo+ID4gQEAg
LTQ4LDEwICs1OCwxNiBAQCAmY2FuZmQgew0KPiA+ICB9Ow0KPiA+ICAjZW5kaWYNCj4gPg0KPiA+
ICsjaWYgKCFTV19JMlMwX0kyUzEpDQo+ID4gICZjcHVfZGFpIHsNCj4gPiAgICAgICAgIHNvdW5k
LWRhaSA9IDwmc3NpMD47DQo+ID4gIH07DQo+ID4NCj4gPiArJnNzaTAgew0KPiA+ICsgICAgICAg
L2RlbGV0ZS1ub2RlLyBwb3J0Ow0KPiANCj4gV2hpY2ggc3VibW9kZSBkb2VzIHRoaXMgZGVsZXRl
Pw0KPiBUaGUgY29uZGl0aW9uYWwgb25lIGJlbG93IHdoaWNoIGlzIG9ubHkgYWRkZWQgd2hlbiBT
V19JMlMwX0kyUzE9PTE/DQoNCkl0IGlzIG5vdCBuZWVkZWQuIFNTSXggc2lnbmFsIGlzIHJvdXRl
ZCBlaXRoZXIgdG8gQ29kZWMNCk9yIEhETUkgYXVkaW8gYmFzZWQgb24gc3dpdGNoIHBvc2l0aW9u
Lg0KDQpJIHdpbGwgc2VuZCBhIHBhdGNoIGZpeGluZyB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoN
Cj4gDQo+ID4gK307DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiAgJmRzaSB7DQo+ID4gICAgICAg
ICBzdGF0dXMgPSAib2theSI7DQo+ID4NCj4gDQo+ID4gQEAgLTE3Nyw2ICsyMDIsMTggQEAgJnNz
aTAgew0KPiA+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPg0KPiA+ICAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArI2lmIChTV19JMlMwX0kyUzEpDQo+
ID4gKyAgICAgICBpMnMyX3BvcnQ6IHBvcnQgew0KPiA+ICsgICAgICAgICAgICAgICBpMnMyX2Nw
dV9lbmRwb2ludDogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmY29kZWNfZW5kcG9pbnQ+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRhaS1mb3JtYXQgPSAiaTJzIjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYml0Y2xvY2stbWFzdGVyID0gPCZpMnMyX2NwdV9lbmRwb2ludD47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZnJhbWUtbWFzdGVyID0gPCZpMnMyX2NwdV9lbmRwb2ludD47DQo+ID4g
KyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsjZW5kaWYNCj4gPiAgfTsN
Cj4gPg0KPiA+ICAjaWYgKFNXX1JTUElfQ0FOKQ0KPiANCj4gVGhlIHJlc3QgTEdUTS4NCj4gDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

