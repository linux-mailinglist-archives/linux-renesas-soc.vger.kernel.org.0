Return-Path: <linux-renesas-soc+bounces-14072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6618A54B61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D132A188AFAB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6B628366;
	Thu,  6 Mar 2025 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bBn2mbIq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD10BA4A;
	Thu,  6 Mar 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266087; cv=fail; b=LZ7Us2LbnVwxsvdfK+oA2EiOuw2HoKwRnIG4obApJg2x2y1gYg8A84N193l7j8Yvw0GdrlKGKoKp25iiUSGXhiS/fqAYhbINJG3XDBsgGN14NaipoMHwWBMGQQmx2LKA9wFD2Ncje2YIOmwtA8yxlOURukxMFSXAdcYGWjLY6T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266087; c=relaxed/simple;
	bh=EGWzyuFcScm3NofQjLg71HDBQJbM9QJ/XnwA4b4+vqE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gjx9s1eu5LM03gIyPkWWTvGfAVfuQFXEZwJi57o/TAbDq4XgeWkOyioOZjNiF6498WXx+xaQkcBUtv9NQZdjANgS7ZIcwClT+5QyEd5W2hmJzGpOpa51km+vpizO7Y/etKmC5O365mCzJbxwgvQy4i4KPwVW0NkphjQd9jCfjzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bBn2mbIq; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSdgRMUvB/y/Mh2E40VXfTQjkgJo92+qrdSbOs12jrQn/NYQWFCcEQaJjf/5RKpqf9fkGY8sGcEPAFQzaqaEcW/z4vEAeqCyQk8JLWeA3iEkrPwakrRsCRtB3415QBqx7x11+x1cKtijc7+9cmdhz9i8O/K6QUpBwak3tBef0WLxsMwqeOVsd30jsGDW/Quf4yagqn5s9ZPSg/gHo+vd0sUbBbpPECKP+nvtAMuftzMDDxJI/5wTjNeHVw1FT2FzOJUtgZiDmxIcueLIXm6RZA4aVuHDjTc/ezHhLaMHLDpuk4pL5ywREkzG3J6MWErtt8CfZdT7jSdBMBgM35EJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGWzyuFcScm3NofQjLg71HDBQJbM9QJ/XnwA4b4+vqE=;
 b=VNjoGawWG4DtGdig8XfzpGEcgXUQE4+10mTXZAcaj2x+oc5V6hcX47MChILr72yIlGJwFrGUrDoGEgZacQjK5GDNkQcS/MEWMQSpoPQoahNw3trefT3unK2V1jy+7wCXZYv5mpAoBX1I5MtMzLA3c/Mt8mD3MXuKi2NIykR1UnvzgEwF96G6jd6KLfo2yQrOU/Bb5GF1jTZvnJBSFOWJhOJYWgfJEcoSeFYoGCB6EA6psSo0LmUCi+QzpLup9naTNxFSUJHWVmOm74XqsjtctqjohBA8JpJw9x/5+Ar2lEvV+ekGOfFPqh8wKKxEfG2uTtD5HS0eRIPCA5SsEhi0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGWzyuFcScm3NofQjLg71HDBQJbM9QJ/XnwA4b4+vqE=;
 b=bBn2mbIqdc3z1SmCMy9EmJ4Gl8XD9KB3mRUsopTJIUjlZwjntxV0ZPiWQ2RjR66sSA6I4FlbBETEcwUvDIjCRTrJREqZQ8FnO4NKduORQug7Xg25ie94oaX0KmyObois6KSCqYKYSWLnaWGarEMNoyktqwJZSC4/fsHcMIpBYo4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6824.jpnprd01.prod.outlook.com (2603:1096:604:117::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 13:01:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 13:01:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Index:
 AQHbifr8yhGKdMSrsUi/t69sg72qNLNl9V2AgAADdPCAAAW1AIAAAGYAgAAb5oCAAAC6IA==
Date: Thu, 6 Mar 2025 13:01:18 +0000
Message-ID:
 <TY3PR01MB1134630172F94BBBFC407223586CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
 <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com>
 <TY3PR01MB113462D3DF3056B740D45DAF186CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVsbUGgz1-g4NgdZADQZC2f=5sc54u9XKZ3Dz-fpiNJEw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVsbUGgz1-g4NgdZADQZC2f=5sc54u9XKZ3Dz-fpiNJEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6824:EE_
x-ms-office365-filtering-correlation-id: 9f0a217d-7101-4db7-e8dd-08dd5caefc80
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHNCMEJ1TnJkK0d0WEM4blVTTHVoYnZvTlhXMEg3S3RLYks3ejc1dmZBZHlo?=
 =?utf-8?B?U0ZKVG5heDgzR1o2WXBkVlh4UTNWWnNXY3ZpZ0ZCWWkrckd0ZlVIM244b1Nm?=
 =?utf-8?B?cm1mSVAvb20wNE9vVXMrbGRDQkMxQXkxSlhHdllWVnFFZk85OGxwdW9kNUpX?=
 =?utf-8?B?QzBlODkzbmZIYnNsdGFyYU9mWC81NWdYdnYrdmZNV3FpdTB1U0Jkc1phVmJN?=
 =?utf-8?B?N1BZUGNzZExJdnR0cG53VGZPWUxXSys5dFBJN2NkejhXZzlub1VudkozR0U3?=
 =?utf-8?B?ekRiYTBCZkdoRU1TK1YxSUd0VjhYcDk3bThxa3RFaUhSVmFBdHB4MHdaQXJQ?=
 =?utf-8?B?K0FRbm5pRG84V0xsWnBpSDc1Q0hxV2tPLzZOa0twN1NJS3lXRTMrOGF4Uk1S?=
 =?utf-8?B?bFdlUmE5SityemtjcytTbG5RQkNENWo3SkxEcWxTS0o3blppVERSN3lIWFN4?=
 =?utf-8?B?LzcwSlRxY1pmVnBwaE5PUFRiSmJRcWM4QmM3UjJXcEllTHEzOElZNloyemd6?=
 =?utf-8?B?Sm9CV3k3anZ5Q2YzdDYrSmJ3SXg1UFB3SVpRZjc0L1B5cmdjNW5vRDVxUFZl?=
 =?utf-8?B?eldySVpkYlU4ODh4MUU5MGYxSzNwMEREYWZlWVQxNWYwaFdpK0dMeW84SUo2?=
 =?utf-8?B?TUpDS2dpd0lYc0FiSWM3MnZkYjBTck93elQwcXR1ZDdEWVlCYkI1VXpqdmha?=
 =?utf-8?B?T3E5Z25JODdMSWVNMU5Tb3hiT0ptWG5la3U4ZWRsSWsyZGlFUkZHY1Z2QkNq?=
 =?utf-8?B?T3BITzdMb0t5TVZDY25rSTVJZTViL2Y5TVNBeWlPNGEwYWVYT2xib2VUOUlq?=
 =?utf-8?B?TGxGQ2NZSHVTQkY3ZXFpZmVvOHozQjNLc1IvZjJFdUxqS2l2OG5NMExyMlNW?=
 =?utf-8?B?enNNZWNGNnR3b2k5b253K0hCbU5vTDFQblBBeUdGMUZ1eHRUa25ldFhKbDdS?=
 =?utf-8?B?Z1EzbUNDSnA2NURuUkxOMHd1RVNtWnRFSjhxaXA2RFRCTGppeXVjWlhmY0Q0?=
 =?utf-8?B?L3ZtZXA5eStsTjBwbkJNaWMrRU1EYWRGaHlHRkhkYXdhQ1Q3Q0hvdEdkQTFN?=
 =?utf-8?B?WnhDSkVlYnBEaGhOWlRRRFJFTVNvWDM1NmY3Wm8yVEF5ZTh1WStQU0t6TTNa?=
 =?utf-8?B?TGtGS05ERk9FTmJGcUxmMDFXTlBtQjhqMlplL3BabUcxY29GN3RyNkdPTEFo?=
 =?utf-8?B?TGtkaWdhT050RWxjNU9UQnFaT1NSeDEzN05yb3Z6L0xsQmtSWDdEcnFqdE1W?=
 =?utf-8?B?V05DYitjZytGQ3N3cFFjZE1QTHU3T1JJMFFJeDB4T2ZOSGRBbW1KTGl1aDFp?=
 =?utf-8?B?Nk5yNm4yL1lKdFZab2JacmZ2VGpxc2V6MXRRbWhIVG55UGR6S29LY2Fkckdw?=
 =?utf-8?B?aFY3Z1hHMkNzRUtTN0xnRXJKTGJFczcxV1pHNGdTMjdZVXRjTk41bzJvbG1I?=
 =?utf-8?B?ZXRSeXYrb0FzY2Q0czdZZnlLWGJ2THUzQkIwdlhVUUlrY3RXYzBPVmNReVBN?=
 =?utf-8?B?ZUozUitDS2dXM2xCbTVDSVVYOGs3VEY3TDMzbUpIMXJSUkpiNXVNbmJkV0Rr?=
 =?utf-8?B?eFFNTy80VWhxNU1uTVFIU1RSU2V0Q1N3bzRxVElNaUxaUjZTQmJ3YWxNdFpN?=
 =?utf-8?B?WHJ1eVlQTnZSSFB2WUl6OGY2UVJCc1p2UjFxbkVUZUFFVzd6UmVwc29yT2lE?=
 =?utf-8?B?TVo5aEFKVEI5a2tnZWdPVG5xOE9UMXRweFppbXBQT1hHMS9VeTZWNXFvV1dO?=
 =?utf-8?B?VmhYaUtiU0h3ejRHamNOb3h0VGRwaVVveVhaNWVtNktQVWEwOUhUbGlja2JG?=
 =?utf-8?B?d2dpN0ZVQUNiZGhPRVZ5UXdnUWxpV2lmOEJTeFl6ZXNvVDdLQmlOMFkwSFZp?=
 =?utf-8?B?azNjY0hFQkVZU1YwL05HdTh2TzhRZUVjaHFodUpmek9SeE5sdS9oNHk4Nnpq?=
 =?utf-8?Q?WPbuFkmSeXfQ0yRIE38Ww66zryl+GrP6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHNsbDZ5cENNSDZsQUVXN3cybUJ0VnpzMFcxbXVscDFhZDlFaVljS0NacFhI?=
 =?utf-8?B?T1phbFY4S0orR2pjakF5c3ljSEE3cGpMUUNFRk55VHFGa1NmYVl4cFRETmR4?=
 =?utf-8?B?V3lzNUlERzBRa0hmOUZuaHZrT3puc1NZeXV0RkxkWk9JeGg4TERvbmt3ZjFq?=
 =?utf-8?B?WURjblU3cEZyd1c2SWRNaHZIZFYxekNtb25IVHVVT2lzVG9YQjZ2ZnpWU0lC?=
 =?utf-8?B?d04zVGFham5oWHdDRGt4bC9sT3gzUGVVSkJTYlU2bTU0TUVabkR6a2g4Uzgz?=
 =?utf-8?B?MkZCbFpJV0VhZThjQkRleDZxbXNGR3Y4YlM4Qm41MHBZYnZRY2JxRS9CdG1L?=
 =?utf-8?B?Q3pNaVVwVVpLbnZ6L0xWeEhKNlJUS2dTMFl6dHVwSDBsRE84REZPcWwzeE8z?=
 =?utf-8?B?V3ZtM0JldWdWQjVSWlFBOU1YWEFpdDY3QUZsMjdaZDhaWTZrSWJLS0E1SG42?=
 =?utf-8?B?bEVWQlFYaEwrTmxMb3B4Q05UZTVoWkxqRzlrc0krYW5VTTY5NFJwc3I3dSsw?=
 =?utf-8?B?WW5HM1JpRGZNNFlhdnIxaHY4OURsSmlBdGpuZWhCcy9uVDl5VEQ3MjkzQVk0?=
 =?utf-8?B?enlCT3NPTE51WWhQVnhzSklZQTY2WjBWdnJDbTBIQ3g3TVZoYTFwNmJVS0Z2?=
 =?utf-8?B?eUVaaXkrNzE0bHMyZ1planp1MHM4UGc4MVF2emdkOHFVRWhMRm9CeWVrQ1Vq?=
 =?utf-8?B?dGpRVXdMamdIaDMzYjZtUkpINjkzaWFPc0lvLzQxb3NGQjRKNUU2WVlFd0Y3?=
 =?utf-8?B?S3R3M09RZm9OVzFHTEttbmxMSkhxWEVTTy8vRGxoN1hMN2liaXorcHlqMVJ6?=
 =?utf-8?B?dk1PRktLMkZyc1ljeVpIVU9kS0RJb2F4QnY0SFhxZUJ6MXlPcnlZajVVYVNn?=
 =?utf-8?B?N1Vqc2dSVXVsRnI3ZytqWE9ZdDl0eDJhMzQrZW1RZ0Nid3VRNlFnYkNBYThn?=
 =?utf-8?B?cVUxZG9nVTk2ZXFCU3NUZWZROXh5cW5pUlVvU3ZkUzAxckxHaFA3WFZwQmFi?=
 =?utf-8?B?Mm43Nk0vZkhOQzRoSXNwUkZmbzJ5UVV5ODErTXp3bHRpN2xrWTZmaUJ5aXZ6?=
 =?utf-8?B?eld3NitKRjFCajV3THVSRk1Uc0tBNEFsd1RzVUJVd0tSSW1RRE9QUGxUZGU3?=
 =?utf-8?B?U0xFbW9GS2xHclFuZWlkSDFxd1MxUkZWdjNXK1dWR3NKQWRNa2JRUG9uUjJm?=
 =?utf-8?B?N1NhUEc5SWpESXc4aDVvb3NQY1lIeW9jYjlxMkhHQmFscHpLb0J1dU0yNXRI?=
 =?utf-8?B?MzlET0l4Ky82TUVCNjd2T3dvL210WmpjeWZoVjU3emQ3V0Y0OEVHUmIzeHNF?=
 =?utf-8?B?VW9xL1FVcHgvY2dZUk9jdGZDSUxmL0RUS2dYcng3dnhBbENkYzhCQUYxcCtz?=
 =?utf-8?B?ZTBlQ0RrOHIvL3k2Ymx1MmVTQUZMVGNGQ0ozdmNkcVRVRmxSY2ppbjJWOWx5?=
 =?utf-8?B?SStRM3NaalpDV2hLVmgrR3RxczAvZVAzdEU5M1lGdDNBemRMaGtHMGZmdVFr?=
 =?utf-8?B?akJETHJOalIyR0loRnNCQXE1V3o0WVhqcHBiV1dIZk0xSG42b3p4THZ2b2dM?=
 =?utf-8?B?WjVxRGRGeithVytCS1cvUTV6dG0vYk5YUDB3YUM4aWhRQXVXWnVUd2lxTnlP?=
 =?utf-8?B?Z3Naa2FhNkp4TXFpZlVvVkR1TjZobnhuUzdtc0VaSVFYUStodUU2Uzh4eWpj?=
 =?utf-8?B?UVZHM0R6S3ROZ2R1Rk9NbS9NS0lNZXVMQjlWMmNXbHVEM3BoQndwaVJzVzJZ?=
 =?utf-8?B?OUNKN0p4NjVlMVk0YVM4UWJWa1FvczI5VUsybFpBbHo4dDQ2b211VHRyZXhR?=
 =?utf-8?B?M2VXUXpMVzFodEVHbkJNcitFSVhqdHhVTWR4NEd5RUpPUUJ1a0lOVUEyU00x?=
 =?utf-8?B?VEtheHk0NVVsM0hrZUM2aUpXMCs4eHQ1a1QrK29DWjk5RG5UVWN4azF5OWJm?=
 =?utf-8?B?bUlJRDlid2JwNnpuWkVyNGVhZk5LcmNORGkyUVVCTzBWZS9kcnBjeENmR3B5?=
 =?utf-8?B?SDZwdjAwSGpyeVZINk5MT2FsL3NhVEljenVzdGZpOFA5QTI2TS9ReVJQbEFC?=
 =?utf-8?B?TUJGZ05pSTRaOXQwRUZERmpLcXB5cG1odURLZ1N1RjByTkphMm1mNk1IYzRa?=
 =?utf-8?B?cnlIN3NhUEU4ZlJFdENua1JpSWNTS2lGNlBJdU9oUjNVeTNJUERoZUhKMUdu?=
 =?utf-8?B?Z0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0a217d-7101-4db7-e8dd-08dd5caefc80
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 13:01:18.6622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEwOoPvSxd5lHLGijkPCB2oKEU2YCOmwny5FKrTZXt5t6jeoShhcIfCCzAuXdCgRQse+sIrp2WJ6bnnkSQgUobsFV7s1Cs30diN3KY6gnos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6824

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgTWFyY2ggMjAy
NSAxMjo1OA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IG1lbW9yeTog
RG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDYg
TWFyIDIwMjUgYXQgMTI6MjUsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPiBPbiBUaHUsIDYgTWFyIDIwMjUNCj4gPiA+IGF0IDExOjU5LCBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4NCj4gPiA+ID4gPiBTZW50OiAwNiBNYXJjaCAyMDI1IDEwOjQ0DQo+ID4gPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzhdIGR0LWJpbmRpbmdzOiBtZW1vcnk6IERvY3VtZW50
IFJaL0czRQ0KPiA+ID4gPiA+IHN1cHBvcnQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIEZyaSwg
MjggRmViIDIwMjUgYXQgMTc6MDgsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gPiA+ID4gPiBEb2N1bWVudCBzdXBwb3J0IGZvciB0aGUgRXhwYW5kZWQg
U2VyaWFsIFBlcmlwaGVyYWwgSW50ZXJmYWNlDQo+ID4gPiA+ID4gPiAoeFNQSSkgQ29udHJvbGxl
ciBpbiB0aGUgUmVuZXNhcyBSWi9HM0UgKFI5QTA5RzA0NykgU29DLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9yZW4NCj4gPiA+
ID4gPiA+ICsrKyBlc2FzDQo+ID4gPiA+ID4gPiArKysgLHJ6LQ0KPiA+ID4gPiA+ID4gKysrIHhz
cGkueWFtbA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ID4gPiA+
ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiA+ID4gKyAg
ICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDlnMDQ3LXhzcGkgICMgUlovRzNFDQo+ID4gPiA+ID4g
PiArICAgICAgLSBjb25zdDogcmVuZXNhcyxyei14c3BpICAgICAgICAgIyBhIGdlbmVyaWMgUlog
eFNQSSBkZXZpY2UNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElzIHRoaXMgdGhlIHNhbWUgdmFyaWFu
dCBvZiBSUEMtSUYgYXMgdXNlZCBvbiBvbGRlciAiUloiIFNvQ3MNCj4gPiA+ID4gPiBsaWtlDQo+
ID4gPiA+ID4gUlovQTEgYW5kIFJaL0EyPw0KPiA+ID4gPiA+IElmIHRoZSBhbnN3ZXIgaXMgeWVz
LCB0aGVuIEkgZG8gbm90IG9iamVjdCBhZ2FpbnN0IGludHJvZHVjaW5nIHJ6LXhzcGkuDQo+ID4g
PiA+DQo+ID4gPiA+IE5vLCBieSBsb29raW5nIGF0IHRoZSByZWdpc3RlcnMsDQo+ID4gPiA+IEkg
dGhpbmsgb25lIG9uIFJaL0ExIGFuZCBSWi9BMiBpcyBzYW1lIGFzIFJaL0cyTC4gU28NCj4gPiA+
ID4gcmVuZXNhcyxyemcybC1ycGMtaWYgd2lsbCBmaXQgdGhlcmUuDQo+ID4gPg0KPiA+ID4gSW4g
dGhhdCBjYXNlIEkgdGhpbmsgInJlbmVzYXMscnoteHNwaSIgaXMgYSB0b28gZ2VuZXJpYyBuYW1l
Lg0KPiA+DQo+ID4gaWYgcnoteHNwaSBpcyB0b28gZ2VuZXJpYywgd2hhdCBhYm91dCB1c2luZyBy
emczZS14c3BpPw0KPiA+DQo+ID4gTm90ZToNCj4gPiBSWi9HM1MgYW5kIFJaL1YySCBoYXZlIHNp
bWlsYXIgSVAncw0KPiANCj4gSnVzdCBkcm9wIHRoZSBnZW5lcmljIGZhbGxiYWNrPw0KPiBSWi9H
M1MgYW5kIFJaL1YySCBjYW4gdXNlICJyZW5lc2FzLHI5YTA5ZzA0Ny14c3BpIiBhcyBhIGZhbGxi
YWNrLg0KDQpBZ3JlZWQuDQoNCkNoZWVycywNCkJpanUNCg==

