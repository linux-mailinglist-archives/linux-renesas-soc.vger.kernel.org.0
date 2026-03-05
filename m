Return-Path: <linux-renesas-soc+bounces-28903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FSFALirqWlSBwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 17:13:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481821539C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 17:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC58C3002FBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9F43CD8AB;
	Thu,  5 Mar 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oO/PWDVs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93013C3C03;
	Thu,  5 Mar 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727062; cv=fail; b=ECF5R6/nGqaiSIlYRZh2/4f/9eIvpRyA/qfPMyk1/RymYYju5a5qvDQYeofcJxSNL8s1FJPDOxbdtvTJAz5kFdf/4dXh7ITmXfKhWlk//SxxlMtwa/w5UUDTvhUqtzrtfFT0WjswPqmFJnnJgQbt60uqNaMu8jFdbIMxwti/AgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727062; c=relaxed/simple;
	bh=mLnev0hSjcMylqixV7o5dkDEBwOVb2jCmpqa3R9c8xU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhLr/LQAzVR2bTX8ED44XQZQf8JSev7KpncUXDn3bS4zx4U6fnkcMCOYNLuMlG2xCUcxYYdudFOjWYX9DEODLQ3jtJHIDuS2pZ5KHJ/2T8pneDo5/j6KC2gytr1HIRUqDE5gsUmKOwP+Jpm4Ifp0HuRo6hS+v/xmzJJugO8EvHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oO/PWDVs; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlycU5A1WTZyiD9sHayeiMif1VppKeslTnlnUND1Fk8L8wUYSvbULHwqBLxuUUncikEgwrpyuReqEpKbO9RwobLJ2xNXtSSEnhnoWJ1P6n2jnBUAiWpGGPBsueC6g6Yynv1h0ON1mldMwHCY8gT6hNXs5c/CYeau8R2prN8MDcbJNyVfy8b9WJwhhym6HuqYtyDm5PdapbjCdltQWcJWfwzWApudW0C8gHyMCT0dnUzmHmE7XV5KvBc5hDbtCfQatm+78Q3f7ZxkSsiPI+AubFhKG/pc8Dqb9Pj9DuQBozL/IgK+wBSUDwqkR0w7U0XZhYeVfmRXhXklGoIzaqA0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLnev0hSjcMylqixV7o5dkDEBwOVb2jCmpqa3R9c8xU=;
 b=LP4HEH5YafB/L5IrWV2TLezffklC7sD/s9Ruc7YKXgktgl54jK1579esxsHPLOnS4k99/X4tZfH93kRl7iwnPSciObMtLGAMId+S/gi2MEWvSKwiZ0iafAR3yPMClO1+udRIB0EywZmEQIP2nocZBEyE6nVnFVzm5BDt+h/no4IOorq2Wc76NM/pIzA4WMIRJO7NtiBO4gOaVWCoofqSKvjDbbLCh4QRGVxrJkgxeSuoq4z9QO2XR6/Wf53a8s8mjuMrNLAscEi5Ih3QxNIOGyw4YBqyHSfTogQvq8KNwGjJpaW1oTL8SBt7ve2IPSB6trI5SZqznv76DI9ofHilVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLnev0hSjcMylqixV7o5dkDEBwOVb2jCmpqa3R9c8xU=;
 b=oO/PWDVsGcL8/wogbCG1nMdJ9CQe25CoT5cU57oVhM6lrLJccGmkcQCdcTIJw6aVg0h4L6VcfPJ8xhgT9I4BwW4Jf4u79TlAPpOubJbCiSWjOZCtWE5NN21iIULRJAFyleswzRualq8el8suH5PGKV1sasMjTljwWpec+5+yQSU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12926.jpnprd01.prod.outlook.com (2603:1096:405:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 16:10:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 16:10:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3
 nodes to board DTS
Thread-Topic: [PATCH v3 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3
 nodes to board DTS
Thread-Index: AQHclPgmMkR3K4HlAEa9wLC9bBA3m7WgN6CAgAATgoA=
Date: Thu, 5 Mar 2026 16:10:58 +0000
Message-ID:
 <TY3PR01MB11346358D8D1DE7A1E5EE386D867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdWs0wX2feonmMw1aAGwNR85gTWKW1FqbpGO1t4rKcdwxg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWs0wX2feonmMw1aAGwNR85gTWKW1FqbpGO1t4rKcdwxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12926:EE_
x-ms-office365-filtering-correlation-id: f0c69daa-ac89-472d-18a9-08de7ad1c9cb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 1jP7ku9bSVzGVTBEkgjiK1IK+hZgOQEqFtYgSNSQty1MxciyksbZTrHoOz769VRC1AxXBtqgJyJao4lmyl8QLci51uGEC4hGcHRfuktr/ZSMBsvLT39ZA0d1TELtr809uo1eCH8qZEyDmFV5CCJHw1mt9Zb/i/3+vh37YI5iZG0zHa/JYSDPT7FOmnk8ABdAEkfQ3LCJ/kIX9MHGZm6M87VO0p4VmiHcFmNzmF6DYbnNdmdgiuuDuoIQke5N0nfxwdSTvG7W6haoezkkHKjqt2QXnC3YmcC1r3ZShlAv3SWxOcH0omxFFtbIP/3SR4jbl2Ao2xTbTeXwz/6ACuKUob6a0RyeCdWDFXl15DAxxclKB9Vrs2We+zvCyiI4sFfQiLDQK3J9yCPszzrjawm2xSGfMpvrdrvyxn6KAQsU1sPa4DpDNugFbkZNMD5uUexna7+oWMcyOTFvwOOEKdZxArmpxoPshVlrmGfbFtZX46Chu15K+JLmqUYZqiqllcxVXI6PRh+Vt3dr7ntSPov+FMZzgN9oqL2Xr1y+620PGlM2QXatMOu40dU/dzjoh63Rn162jWtl1axBWhhl4wnULvpX6hF8Ny333pv5/FLDBqdz73N2tqRy3MZ4nBAyJbLjVlRulBhHioNHORUJgezuf+RocQCSL6bKT4qFuxc30ECVgXE8FXwwpaUvDT3c2AtmXwVUI6YRqZNuGzsporCkao60c3Q2AXOa3dyn4/3vwhyj5yo8HgKM/upZdeH/mdkImb6hejJ1eadS0I0RZGjU98SEXK2OA5cFTv15CE4D5Kg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWRoNjhqN1k5NmhtaW1rendsRWFpZDlacjVWSnR4YWRnd1pZNk16MWVHUnhS?=
 =?utf-8?B?WDVMc3RidjhpTC9oRDlvUE9peitNZVZzVUw0OHFsaUZOdDJRNGNTSWlMSXV1?=
 =?utf-8?B?cWt1OWJuWlBkNVAzdE4yUXdONGs2RTZFWXYvNWo0Vk8xcXJJaGVlVk5ycWdT?=
 =?utf-8?B?Y2t6Y2lsa2RocEF2cmxHRTJGckdNak8yWDVpOUh3WVhNRnJETGZMN01vckZo?=
 =?utf-8?B?bG5MWFVteFhMZUIxd3FvOTMrT05ZdGljbmhJdm9KTjZlN3J0SkRBbWkxa1o0?=
 =?utf-8?B?VFFjVkd3V3ptRlZuTy82K2RyRTRsbCs1ajg3U1oyRGIxZVM2K2JXeSs3Y0Ux?=
 =?utf-8?B?TVJ2Mm5RcFpoZnI2MndrWFlwWExaT0tLYVdMRExENGp0RTMzcktoVXp6emll?=
 =?utf-8?B?MllHYXhJWjlQQmVTQTBRZE9ncTJGNDJVSTlzRWMycCsrNnQ4TWdJNytFRzd1?=
 =?utf-8?B?cmFqdnpxTS9ZcDBpU2lHYVZuZXRpUHBiNkU3OUNjNTNEWXR0YWlRc0hFWHF2?=
 =?utf-8?B?cC9PN0JkRmRiSjFGMGZJUXhpbVlJSEtEaDNucTdkaU9BSlRZbzQ1Y1RqWUc0?=
 =?utf-8?B?N3FzZHh4VlQ3bmRGQkZxNllHdGJKRy9YZnJZNmwwWFJDcmZDUHBzMGZPdS9n?=
 =?utf-8?B?SmJYT2cwT0F3L0NWeG12bmcwNE9RN2dMZmhnU1VpcE9ZSmREUUZRbmRqRXRY?=
 =?utf-8?B?Y1NpbDBvQ0FiTU5qdkR0dHdRZzRnSUJQNmJjRnVXN3E2SlZyYm9VUytiS1Bx?=
 =?utf-8?B?cTZOWVZraXN1emJYaTAyTDlZQjd2K1k5Z3U0ZklNbTVuRUs5NGZZK21pZmZ0?=
 =?utf-8?B?RW5NWkpibHZuOG5YTUZlS3NWNy9FZllGd2JhV1NKdStpQU0zb3dscGZpVmU5?=
 =?utf-8?B?WHp6OWtOcmM5WXlrWDlYcW1HNXJTczF3NmNzQ2dxTS9DM0JZWE5QRzlOeWtX?=
 =?utf-8?B?UkR5Q2NzR3g3Q3NsY1VHRWVHOG1QOURKWGtNQ0E5eDdwclBuc1Q0OElFMkxs?=
 =?utf-8?B?TXliYUltalBkL2RFdHBoYmdvdCtuMzVyWEVqd05MaEpOZElWbjZqR05CK1NU?=
 =?utf-8?B?bGhHN2htZkVrN1pIS0VsRDVXaS94QnVMdW5EeTlwU3ExWWRTeHpROVNGSm1i?=
 =?utf-8?B?NnlqeStYMlQzWnFYc3I2UFpmS0pmZjBDYVNFcVU2ZTN4Nm1ZQlFOWHBmdzZK?=
 =?utf-8?B?dzEwVExaOG9oWWVCMUVRMFVUT2hORDZZdDY4UEhhTS9SY0s0S085eS9oeEpU?=
 =?utf-8?B?aGVhbWorU1FZZmlNaUxtY0plRmVpalBvL3ZJMTF1TGFGeS95UmZwRHdCRHFG?=
 =?utf-8?B?MWZqeVh5cU83OUk5Mzl4SFE5TzVnOS9tTVFBUlFnYlJLS0ZUMlNqU0xVeWxS?=
 =?utf-8?B?bzI2aTdiN2wvVVRiN25zY0JwL0ZvRTdPWEZ1MDQ4UVJ6azhRQXNZM2NxZ2RS?=
 =?utf-8?B?S3ltNGtvbDQ0SlludnoxbFVXOUVlME9iRFp2RzZydXdTSlNFaytXdUNPOTl5?=
 =?utf-8?B?dFVDQ3RHN3lVeFhHTGVSM3hXSXRBOVZpRGZtcVBiR3JDdjk3OUNhdGFNODds?=
 =?utf-8?B?WjM1alJLdHlsZmxmbVQ2cVN2OTBPY2ZLRWdtbTFlaUJVTTdLcStyQTdqcUhp?=
 =?utf-8?B?TUIvMDFzUWxDOHlTSkh5ZytvdjFyRzhSRkUrTmJ3TjI0V3ZJTWtTZk81dVZk?=
 =?utf-8?B?NGFlcUpTOGFkRHFZTXBya1NoZTViWVVyVm5pQjRpdFo2ZlZaTUFwVEp2S2lt?=
 =?utf-8?B?eHA0M2EyaDR4RW9Ib0thU1cvMWdSUUZ3OStwM0sxczVKNTNPTk1JZllHS1Uw?=
 =?utf-8?B?dis0MjhEYWZuR1FwcWxJWEdpL0lGREpjSThWZGxobWtva29tZFptYWUwYWIz?=
 =?utf-8?B?R3A5cFdRbXlHVzNoUkxiejF3MGlrMXMvUXVmdTBBblJYdXRQN0dKUmFHbkdz?=
 =?utf-8?B?anFQTWJwNXBmTU1jU054Y1ZpNzZndXhGZmY3eTJtRlhrVUJwYUVIL2tjZjNh?=
 =?utf-8?B?a1YreHB2YTBqczFyMFg4eGw5dlFHdXRZUll1Q29KVVFOR1RnSnJ3SmdlMmVU?=
 =?utf-8?B?d2FFMlNhNnBjamJpUVRtQnczRGlKUzdoZ0lkcTBkTzdRelVveWNremJNZVNX?=
 =?utf-8?B?ek9DR29reWViSW14VlRabXNwVWJXcWxvdTd4dmt4WStJM3l4MTVZM2dYY214?=
 =?utf-8?B?dDJYVmNqaGJpT08rd04yemhHVlhBY09HVFpVZjJCZ2JFckZsNG5FOFNwWVZR?=
 =?utf-8?B?V0dNMUo5YjVYdGx1WlJlQ2FFeC9iTXEvVmNST25TTGFuT21LbitYZmJnQlNL?=
 =?utf-8?B?V2YzbFUzd1RUWFZpVHpMZWpUdnkrdTQvTjk4akdTNU1tNmNWS0haUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c69daa-ac89-472d-18a9-08de7ad1c9cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 16:10:58.5290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiGBtHKKauJvoRhQmd3LcP1NRh+uM8/fGcIqtbm4pTfg4WkjX52q6MavBrDRD4AhdtRUT6iIV/CGEZkqNp+D1QcUFKT8GYfhZqKqDSLOp9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12926
X-Rspamd-Queue-Id: 5481821539C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28903-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1hcmNoIDIwMjYgMTU6MDANCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwOS8xMF0gYXJtNjQ6IGR0czogcmVuZXNhczogcmVuZXNhcy1zbWFyYzI6IE1vdmUgdXNi
MyBub2RlcyB0byBib2FyZCBEVFMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiBPbiBUdWUsIDMgRmViIDIwMjYgYXQgMTE6MzAsIEJpanUgPGJpanUu
ZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFNNQVJDMiBib2FyZCBkdHNpIGlzIGNvbW1v
biBmb3IgbXVsdGlwbGUgU29Dcy4gU28gbW92ZSB1c2IzIG5vZGVzIHRvDQo+ID4gYm9hcmQgRFRT
IGFzIHNvbWUgU09DcyAoZWc6IFJaL0cze1MsTH0pIGRvZXMgbm90IHN1cHBvcnQgVVNCMy4NCj4g
DQo+IHMvZG9lcy9kby8NCg0KV2lsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMs
DQpCaWp1DQo=

