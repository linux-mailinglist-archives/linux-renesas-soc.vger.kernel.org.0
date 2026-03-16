Return-Path: <linux-renesas-soc+bounces-29466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBw/BKnKt2kRVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:17:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA384296D69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C74D23075E9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832C5354AC7;
	Mon, 16 Mar 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rWa7EEIq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294F2836E;
	Mon, 16 Mar 2026 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652322; cv=fail; b=c686KXtQevpOnKO+nDtlTpXQrkY1CSiNHkJOtYOjUswwXzv+939ggvbwENB5O8wLSG5DZTaZGpqgbO/5nXm9OXROkjwI0Z4IldhS91C0rmRJa53Tbls+16s1+kuMILFIpz+5oLjBNEpQGrWM+MPqSx4SxGwEKXM8Ei7nhNIRXHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652322; c=relaxed/simple;
	bh=0ImFiqcmTLNazBH44bYjkqGDU8pyR7pNTf9teIZkIE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k8Mgv+vYJiGaIiSxcUV3kJ9wNgWpIeqSCEUKSSywAAI9kr1bZ71xRsHMZfVH5RMXBICcqHVVewvRh7xsdYbKtf2A1ZOaXQr7EQ+x6po1LT+0oel3vzbxybKSeNmDJJ0DpVrE+dOUdpB/+16PjsFHysP39KdRMCOYPkFZSOFjvK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rWa7EEIq; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiQl7Z3Sl+RsQjOH063HP94zXkEtxW5Yb7zD/VLKr8PKT99mgEw2Ar+pFyKAYIyRnLi4KnuQQIP+dmUyzdw7rES9DDJddPnTaCRwlYK01IZOAo0sDJay0Vrt39jgnIWNcSlE8yHPor1GbUPWJ8n9z+nJiG8Ddj1V1FSS9fIqrjdPXaQYtB0FCemsJo/fjyaCC0h3kH0X1yMf5EtMlGJlpyMuLOPueo2HLUUIV1J80EDJos3/8KArP4bnkvDUteGf8kOJvkG87XVyx3pWhoJznW95MqaBw0qFDyWbpToxf/UzTyH2BAYexmqwnT1FsWPoxrbR5jGqfOeUU1ocxmwmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ImFiqcmTLNazBH44bYjkqGDU8pyR7pNTf9teIZkIE4=;
 b=lVwqEoO2lbuMx8+FeVVAqhdTUZKPKaIMqmGSCyGmeUvzkLhDMzDS63t4jGATUk8lCpsHUQ3XEQfLf3/Pwu/D8LBSHEMoSLcNcji6TeeXDqGT1GCTTAGdAx63q0mrchjxGetqZaNcBdmRDHw0wkCfQCZFpvNRCOBB/ADtBdZ/cJHC9+4EJJPFB3lqZ2tNinDB2AuvD4oYxpUAApN+kFfbl7LeVduz2UQ66UHBW8WDlBZkWXxtvSUU9GlkQ8SCGpeXpD1gebuy5bV+MgBStc6LFmNUyHrAc9uS14Q1brrGjo85NKUE4Q37GmIgRW2qWlo71qBMiaw5ORp/6aiMtp+iHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ImFiqcmTLNazBH44bYjkqGDU8pyR7pNTf9teIZkIE4=;
 b=rWa7EEIqp5dN89LGCO5kOqTzJJxHif9Hh9+LWwxbhVpv6kswae/o7/CUAQ0gw9sw7vxNGbBV2DqHcJGwF61OT3jIf8QdCIKplbjmEFNBhXQIxi7L8W+bF3osCtnphjUzK1gVO5Mmxwr84pah0qThdM28yg01RErvHEAWgpJYr4Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 09:11:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 09:11:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, magnus.damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Thread-Index: AQHcswgXxNnjGhc1/UeWMH+iCL4MUbWsrS6wgAQyogCAAAJMwA==
Date: Mon, 16 Mar 2026 09:11:36 +0000
Message-ID:
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11811:EE_
x-ms-office365-filtering-correlation-id: 035a6dc2-9e9b-475d-38d9-08de833c06e4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|13003099007|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 ookSfvAXXX2NUp0RK71M/qGTIK841hJKpZNA/bZ6UHnjvdqFeQ8lHPUPdJ++eotTtlSn03nyZbEseA0G0e4RqAhF6Qc4+zCJAScTaMxKT1KF5gRMuYRwgIzgZTs8u0R6DCmKEj4eYHCvP43+3jaKSnrdO22gS09c9YhTRNXm7GXK3Ap5mZ8xU49RqjABCCWqHk36DY5plOO00djvT6lZxy+QKk4S0f+EPB8qMwMPzHxW3SgVPxrDyd0rW4qTQfhKc8SpBuHQ2WckaASvV1GArQpnm9AK3vp/BLQp63+Af/OMg+dMCE2JfVJm0DlH6KKBVM0+A2yarHruMBAmc6q8hvxEnimrpEzMIqcwLJyUpZbLgNjsJQLZwPBc9/f7GTte07nazlIiMGPlKPyx+ACZNiGLjw0eUionlXwtlyvThvu5yaAJJDQ8SG/DQVXAot67G0/ovUa5peFplAZIi1ygtrl4LULjFgFXRQXPCJ5v02ENJLJuhxi/EWQy6+5AaXwuozvCQ50u+NmPOteJDYPIf+EpqydB5yY+kobjR2z9fEeejQ44vaPHf1NZ3l5fUgVZnvTquY8BHfOSDHgJZUaXy2cPb71Lj7enJqsAmKU6EvaV1JIAU/5TChUxwhqZOd2xpC1Xr8OE9mg61O9DgXtKUOML802bK/fibiPqOmd6sEbKOpeeq+EjLORqk0RZ+j0a9Ke3xvXVdWxw5E9NSUZj9QkBAGCb8iY90PRNXpGf0CfG81u6gufMjlCCmHCO4FW7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(13003099007)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SU1KLzNVQmFITWtnM3pCSFNhaWpWQ00xS2VCWHZrdzFFenczNWZrbjNQT0ZV?=
 =?utf-8?B?MUhlSG9pMkJCV0NpZVBFSmJnOTc2ZGpWN0Rtd0tkdHNEOVAybWFYOXdGenpY?=
 =?utf-8?B?dXJzU3FuL3dHUGoyTTh6OFlmT3AxWmNvd2tXeGgwVzhWVVRBK3R2aFFBaW5a?=
 =?utf-8?B?Y2xtWWlBQ1luVEhyNlQvRzJDNTBzb1cxN2Y5RzhZZzBtSVN5aDEwTk9CREFU?=
 =?utf-8?B?SGpQdituUS8wZGQzSm5GWkJ6dUFEbzdHUmROdmZMSGo3UEpseGptZWdVbmIy?=
 =?utf-8?B?K3NLbEhhRmxVQTRYcUlMSDdXdHBtTjI4UHBFWEVONUlBZVB2OUV4UVRKcDJS?=
 =?utf-8?B?cVJwTTZpMUFxWHJZR2pneExhSXVzUU56ay91Y1Q0U3pvVE5RWVNGZXE0SlNh?=
 =?utf-8?B?OXhkRUxZRTZJU3lUS0V0RnFnYmpQMlZNbis5M3hReFRxWWFBTHFmT0RPQjdM?=
 =?utf-8?B?YXBwRmtqaHZhWnBNWUxFT1dUVmhEUEtzZWlQRjE0YkJZU3FjbmVQTldHemlt?=
 =?utf-8?B?SllTZGFTd0NVVERpWGJ0RUJsU1B3Q05IVmJhVWxHTjBXTWJob1NCcCtFWEJJ?=
 =?utf-8?B?LzRqQ2lEQ0JtMkxCdmM3UkVqRTg5TUl5MVh4QW02amZXamxFREZvMS9HZ1lW?=
 =?utf-8?B?elJ3ZGVwRWRGRlJTQnFBbTdGb3pML1BhSWFkT3FXR2Jwc1dJY09tM1FuYzd4?=
 =?utf-8?B?dnpOUFFvNnBJM2liZTNtNlZkZDRNL3gzNmZNQWVDK1lIcHh1dVNjS2tZQU52?=
 =?utf-8?B?SStIOUp6bGdNc2dLakRhbEQrQVRpdytJb2U5UUxyQ1NzcE9tNkxJQms3dWNk?=
 =?utf-8?B?STF0RnZ1Z3Y0ZS94T2JkbVRZdjN5andhbXpEdS81Mm13ci9XdHVaNk85b2kr?=
 =?utf-8?B?WHNkWEY4WDkweERrNDlZckJNQVdQTGZzSkVoNmljWWdySmV4TGYyWFIwUVVy?=
 =?utf-8?B?c3gwWmYrWk9DQURTVDltNm1CMlc0a1dVM2sxSmpJaWNNLzcwVUpxTTJGQ3o3?=
 =?utf-8?B?dHRyaHNvZ2hIR1V5bnNhL0x0MmZ6ZkUvbHk3MXR4YzlINmJvUEpTNVhpV2o2?=
 =?utf-8?B?aTkvbUZYZ1QvZGdmd0xIUG5jWXZBWUp0NkFydmFGdk9kSlNXWDVIOXR4V2NT?=
 =?utf-8?B?aGltWDRrTkg1VEJ0ZDRRWlQ2anVXd1hrdmoxZTdzanMwVGVxNmVvME9JRWd1?=
 =?utf-8?B?TTluakF4NmlpTU1OR1I3bllCRXNaSDFPcnJ1elVGdWg5cElIR2xGdnRzaEov?=
 =?utf-8?B?c0tQVnBKTEtuTmU5NW50NjI4MGNZcUFRSmhBQnZ3a0pyV3FSd2wxNFpuMXMw?=
 =?utf-8?B?MUlab0FFZDVMRE9nTVVQRS8vNW10aEQ3WFZvUWxmZUl3QzNDSFlTUWlPRWta?=
 =?utf-8?B?NDRLcVhBb1R0NEZYN0E3Zjc3Q29hTzdDaHYzUUNONi91RG8yVkdRVFJwQTFF?=
 =?utf-8?B?U05RTFBzQUNhY2pkS3FuQ0xaVXBtSjZCNU13R2dRckU0N2NuSWV1cHd5MXgy?=
 =?utf-8?B?UWNFckN3QnRyVGg1NzhzS3krazBzWTY4V29BTzhtT1owRUdTd29FWHN0ZzVG?=
 =?utf-8?B?VXBzdzNlRFRJY2x2TzhiT1RPSlNEY2hNMDFFM3FaOVBhRXdjMDNpckVuWDJU?=
 =?utf-8?B?ODBKWGR5RHlNNTViRFhKV3VOY0s5U1l4UFhkWnVXMHNrdGhiWVljeDl0bC9q?=
 =?utf-8?B?K1lESFlGL3dzRG4xRUFpZ296TDgwVGFUZm1haDFzOTNQdDV1ZC9SNkZ0SDJI?=
 =?utf-8?B?SWhRUmlCQnRhRUduK1AveW10cGsrSVp0aVloaW42anVObkFhcnRtNS9mN0lM?=
 =?utf-8?B?TW5yblNka0EvWERTckQyeGZjR0dOMjdsOWFzeVM0QUtmSUF0QjBNTHVGcDhX?=
 =?utf-8?B?dWFlVmhtUlpSdnhPL1lXM29uNHNBcEpkYXJQZE1iaWE1aTlaYUN2YnFVV3NF?=
 =?utf-8?B?VDlIUkliTFhvbXJlNk5jWXJIZ1gxaHNJQVpjWDl5NDdzMHBjSkFqZDAzVEpE?=
 =?utf-8?B?ODBWeGZicXRXK3dzM0swanBRTVpld0xBR29MQjhVbXlJSHZLOU5VSGd5bVJu?=
 =?utf-8?B?WUVweXlSNnZNSEw0Z0MzQzlqVnA3NEs5MmxycThacXM2azlhdjFUVDNjNFI2?=
 =?utf-8?B?WEVScWhKQzI2L3R3Q2dGc3NnVzNnQm9haExyU2lDUkQ3clFYaHZmRDJtYnlS?=
 =?utf-8?B?eEpIMVF3czJwOG11NVFZSVlFc3YzdE9sUnBNTFJVcFZjSW8yMGRzOEU3cWVR?=
 =?utf-8?B?cGptV2JsVElyMUFNYWZQSU5Ic0FwVTdjcDByOUdLMkZZenNiZ1V1N0lKTkRk?=
 =?utf-8?B?d3g4UnJSZWU5MkkxOUJFRnZVRSsxZGlMcEZzVTl1NzlKeWdzUVhOdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 035a6dc2-9e9b-475d-38d9-08de833c06e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 09:11:36.9377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nW0pUsBEX/lvwLu7LupTEWKNu3aZyVkx6suFpuLUifwq0aX02IeKGd4/penBgYk77q4v67Qs8kQK7crSPlCHDVaAMt5v60oqrtvr1snZcEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11811
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29466-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[mailbox.org,lists.infradead.org,kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,mailbox.org:email,renesas.com:email,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA384296D69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE2IE1hcmNoIDIwMjYgMDg6NTgNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAwLzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IEZpeCBQSFkgQzIyIGNvbXBhdGlibGUgc3RyaW5n
cw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgMTMgTWFyIDIwMjYgYXQgMTc6NTMsIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBN
YXJlayBWYXN1dCA8bWFyZWsudmFzdXQrcmVuZXNhc0BtYWlsYm94Lm9yZz4gUmVhbHRlaw0KPiA+
ID4gUlRMODIxMUUvUlRMODIxMUYgYW5kIE1pY3JvY2hpcCBLU1o5MTMxIFBIWSBzY2hlbWFzIGlu
ZGljYXRlIHRoYXQNCj4gPiA+IGNvbXBhdGlibGUgc3RyaW5nICJldGhlcm5ldC0gcGh5LWlkMDAx
Yy5jOTFbNTZdIg0KPiA+ID4gYW5kICJldGhlcm5ldC1waHktaWQwMDIyLjE2NDAiIG11c3Qgbm90
IGJlIGZvbGxvd2VkIGJ5IGFueSBvdGhlcg0KPiA+ID4gY29tcGF0aWJsZSBzdHJpbmcuIERyb3Ag
ImV0aGVybmV0LSBwaHktaWVlZTgwMi4zLWMyMiINCj4gPiA+IHRvIG1hdGNoIHRoZSBzY2hlbWFz
Lg0KPiA+ID4NCj4gPiA+IFRoZSBLU1o5MTMxIHNjaGVtYSBkb2VzIG5vdCBkb2N1bWVudCAidHhk
di1za2V3LXBzZWMiIHByb3BlcnR5Lg0KPiA+ID4gRml4IHdoYXQgaXMgbGlrZWx5IGEgY29weS1w
YXN0ZSBlcnJvciBmcm9tIHRoZSAicnhkdi1za2V3LXBzZWMiDQo+ID4gPiBwcm9wZXJ0eSwgdXNl
ICJ0eGVuLXNrZXctcHNlYyIgcHJvcGVydHkgaW5zdGVhZC4NCj4gPiA+DQo+ID4gPiBUaGlzIGlz
IGNvbXBpbGUtdGVzdGVkIGFuZCBzY2hlbWEgdmFsaWRhdGVkIG9ubHkuIEkgaGF2ZSBkaXNjdXNz
ZWQNCj4gPiA+IHRoaXMgd2l0aCBCaWp1IGFuZCB0aGV5IGNvdWxkIHBlcmZvcm0gdGVzdHMgb24g
cmVhbCBoYXJkd2FyZSB0byBhc3N1cmUgbm8gYnJlYWthZ2UuIFBsZWFzZSB3YWl0DQo+IGZvciB0
aGVpciBUQiBiZWZvcmUgYXBwbHlpbmcuDQo+ID4NCj4gPiBMb29rcyBsaWtlIHRoZXJlIGlzIGRl
bGF5IGluIGRlbGl2ZXJpbmcgbXkgcGF0Y2hlcy4gSSBhbHJlYWR5IHBvc3RlZCAzIHBhdGNoZXMu
IEkgd2lsbCB0ZXN0IDQvNC4NCj4gPg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDI2MDMxMzENCj4gPiAzMDYyMy4yOTc3
MTItMS1iaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbS8NCj4gPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNhcy1zb2MvcGF0Y2gvMjAyNjAzMTMxDQo+ID4g
MzA5MjAuMjk4MzkyLTEtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQo+ID4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL3BhdGNoLzIwMjYw
MzEzMQ0KPiA+IDQxMTUwLjQwNjUyOC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KPiAN
Cj4gUGxlYXNlIHVzZSBsb3JlIGxpbmtzDQo+IHNAcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaEBsb3JlLmtlcm5lbC5vcmdADQoNCldoZW4gSSBzZW5k
IHRoZSByZXBseSB0aGF0IHRpbWUgbG9yZSBsaW5rcyB3ZXJlIG5vdCBhdmFpbGFibGUuDQoNCkhl
cmUgYXJlIHRoZSBsaW5rcw0KDQpNb3RpdmF0aW9uIGZvciB0aGUgc2VyaWVzIFsxXQ0KQmluZGlu
ZyBjaGFuZ2VzIFsyXQ0KQXJtNjQgZHR7cyxzaX0gY2hhbmdlcyBbM10NCkFybSBkdHtzLHNpfSBj
aGFuZ2VzIFs0XQ0KDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2Fz
LXNvYy9UWUNQUjAxTUIxMTMzMjA2OEIyQTcwRjUyQTM5NjMwMTZBODY0NEFAVFlDUFIwMU1CMTEz
MzIuanBucHJkMDEucHJvZC5vdXRsb29rLmNvbS9ULyN0DQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmVuZXNhcy1zb2MvMjAyNjAzMTMxMzA2MjMuMjk3NzEyLTEtYmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20vVC8jdQ0KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJlbmVzYXMtc29jLzIwMjYwMzEzMTMwOTIwLjI5ODM5Mi0xLWJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tL1QvI3UNCls0XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNv
Yy8yMDI2MDMxMzE0MTE1MC40MDY1MjgtMS1iaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbS9ULyN1
DQoNCj4gDQo+IFRoZXJlIGlzIGFsc28gTWFyZWsncyBvbGRlciBzZXJpZXMgKFsxXVsyXSwgYXMg
TWFyZWsgZG9lc24ndCBkbyBjb3ZlciBsZXR0ZXJzIDstKS4NCj4gDQo+IFsxXSAiW1BBVENIIDEv
Ml0gQVJNOiBkdHM6IHJlbmVzYXM6IERyb3AgZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIgZnJv
bSBQSFkgY29tcGF0aWJsZSBzdHJpbmcgb24gYWxsDQo+IFJaIGJvYXJkcyINCj4gICAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnLzIwMjQwNjMwMDM0NjQ5LjE3MzIyOS0xLW1hcmV4QGRlbnguZGUv
DQo+IFsyXSAiW1BBVENIIDIvMl0gYXJtNjQ6IGR0czogcmVuZXNhczogRHJvcCBldGhlcm5ldC1w
aHktaWVlZTgwMi4zLWMyMiBmcm9tIFBIWSBjb21wYXRpYmxlIHN0cmluZyBvbg0KPiBhbGwgUlog
Ym9hcmRzIg0KPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvMjAyNDA2MzAwMzQ2NDkuMTcz
MjI5LTItbWFyZXhAZGVueC5kZQ0KDQpJIGhhdmVuJ3Qgc2VlbiB0aGVzZSBwYXRjaGVzLg0KDQpJ
dCBkb2VzIG5vdCBjb3ZlciBhbGwgdGhlIFNvQ3MvYm9hcmRzLiBJZiBNYXJlayB3YW50IHRvIHRh
a2Ugb3ZlciwgSGUgY2FuIHNlbmQgbmV4dCB2ZXJzaW9uDQpjb3ZlcmluZyBhbGwgUmVuZXNhcyBi
b2FyZHMgKyBiaW5kaW5nIGNoYW5nZS4NCg0KSSBhbSBoYXBweSB3aXRoIHRoYXQuDQoNCkNoZWVy
cywNCkJpanUNCg==

