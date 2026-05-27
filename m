Return-Path: <linux-renesas-soc+bounces-33234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGHdDK0kF2qu6wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:06:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C50105E8271
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 177CC302F1BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1333AEF46;
	Wed, 27 May 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AYRzb5Cg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408D44A708;
	Wed, 27 May 2026 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901609; cv=fail; b=ALR1FSgZ8+7enqR+ZgcjnYa1d9R7Vi7gI+CaiTuFHqQG4JHD3xyxFqMHUnp1hZcGTD326lcnLsQ0Mn6poXBPGW1HWZcen+JrCPLJbVt0yWBUl92/uVAjr7pwbW9SK/zHaAvQt5tbr6hNqgnf/gUjNIvqXJKnEwRQ55336rTM1H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901609; c=relaxed/simple;
	bh=z2dmA4Ol1hF5QFk+MYmyh244/WYcPdGEdzHNuYWnNqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ya6I9gPuizl3Rrhj66st792xlZgEA+onfRTrcKhc+ces2L/s2tB/L0NNDv4fgMby1lEvbKfMgHPL3UxTlANoxeW4wlCadiPtOv2QEO1BqGAFnHR0ZjQxbxnh69NcO8M7EGl31q8N33jd6LMrrp2C2DlLub61HwO8uqGdtmB6ZjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AYRzb5Cg; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh+YnicxCSDDOzfqNlcI1Wnb7zbDAAY2GdtU9NtVyp/W0TFat9m9nSMS+wPwsdGGrWxdQzguzcFKYOKhqyuET17YksfvGF4DZQDWbr5fla6yB8mQhD0s1OJArQ7+pZh4JQmnmfDM2yP+6mLoCBUiMRpB7d2sTDl44WnnSYlh+j8DltwbDJvrCRXoiGUd9HRUNihTURv465bOs3uc2gU02GJUncFyGzUlDCZlQzbXx3QfeGge223NBSw0+TcgXw18sg+pWXN0xGIfoGYIilGcNmQoi7fRJ2n55J2+fTHnnXcq/zMveXNkFJeeiRJ+y5aYR0wMN082x6GJWDg8c3ckpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2dmA4Ol1hF5QFk+MYmyh244/WYcPdGEdzHNuYWnNqo=;
 b=V4LvTL36EeLeU6Yd5TaNEUMqW8fO78q/k3SBjutE8KInG0cE/NYhV8L79SIdhR0Ft23uu6QjWPYIPHqulpuy/5sE11o8WUero1IsXgWTa4UkQfjk27aH2TBXrM1+qiPTP6eSnqfNG3p5KF3hFmIPFQmq5g/jpUs90SH3MJmVxwKEZTbHPEOZby4LQWMjLq9r+Z+udKNFpmgpoJkLlOlTIcT5RTAa+mmqLTlPPADyPdUVVccCjOtF1twFUKiCPPBPsCSUIsXARCCzCd50xkloRbwsmM/jCyfxJeVYXE13QPPo+T3ZiYS7uRY7XEvCIBmVkQ5B5gAksO2vSaPAmVWVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2dmA4Ol1hF5QFk+MYmyh244/WYcPdGEdzHNuYWnNqo=;
 b=AYRzb5CgY4MrstJK8VON2nn/MiGVGFxaKDMCx2ja+Auvo3h0dIkQAMoKeu+XEfP4bcd+40KFduoho2qjb7bTigbUZeGMnTX10CEDm6mGEpWTXZLtCbkjqmyAF3eKJASSKIr78y/5dMm+u+K2ceH7IEWdrcY99Z07yeROHF/sf3E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6648.jpnprd01.prod.outlook.com (2603:1096:604:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:06:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:06:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio
Thread-Topic: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 audio
Thread-Index: AQHc3IvrSiH2wCTanUyMzfqh4GW4h7YiMdsAgAALFzA=
Date: Wed, 27 May 2026 17:06:40 +0000
Message-ID:
 <TY3PR01MB1134672E74EF9E05A65EF904C86082@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
 <20260505123708.134069-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXtSJ3U=MrjzxHtpgO-Ft=kTboVWxAJH6kz0hK-KU1rSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6648:EE_
x-ms-office365-filtering-correlation-id: 236233d5-9f03-4093-40c0-08debc1251d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799006|4143699003|18002099003|56012099006|22082099003;
x-microsoft-antispam-message-info:
 rRI+ld4wWffE1DJplfogI2y+6vKurt6QneO6FKy4oqHXN7QFwHa2ZSo/UNL2vEJwufd0eWJyKpUH9lqV7oEPaOwuMsYMtXi4Pnv5vthw7Q+NxydV9RJyrvmSAHN+YFwG4GX/zgmUBOwFRo1H6mF4EhrzA9BFbSGB1O5Vy2fjIEVs/gf1pAdTJ/6NEU9zt9SIIp/jwYia5OlR5lotwDkkGgYtsgnx97gofIjI9IGZuyaW5OnF1y+YiHDHq+2Hb9thWWYFI91xwme8TecPckYB86MzaKGTuNpgx4cNZA1is8dvCbbtnTPXHpowGwIViwp8oSH/MuEorbptrlgeROB7zLuTZqRPGN7fwjsIU67ol4/8J9k1pdr9gLtYuuFtp4GLSZt1vEq4B7d1zz3L4BWGGUVt6QxQw2vuZrj87t/sqjNsxkb0XAiNGHdo9ItIRwfyQg9BN221s3yEh5ij8HlOeR/a6CRfFwI/SGFRfTZJkkSLGrlawssA1dw3TP1+tecm3gJ4dekFMa/i6MtJe5MEodr4JjYLV/vqJ2XZ2p2w0CgDwKhdZqI15H0Rv7IM4vXb2wVgWE9/ScdZcZaiExA4HODhJ3fC37qJf5RP7Yoq8deP/7O8NdFReL6NHsJM6alObOzuW3+HwWwdxEpw9psmrWoABki+CyluPnAEiMVnht6cfYLpIPSC6JHLnkVzrqC2XVgvTVwgWLd8uk1zyEx49G5dkw8uagdVSHknXwl9vgQrs0y8gCcEUG967u2lvziS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c096V3RaUDF3R2UxaFJJZnI4M1pLYSsrNURNdlpuTVNUMFVWcnV3YmhmNWsy?=
 =?utf-8?B?TUhSOEUxSFU4SkQzWmhGUWNoQWpjRWFvdFRnWWpvZi9OeHRuLzJLZWV6RGtr?=
 =?utf-8?B?b3ZtWjRETjFIQ1hQcUV4UUdJSlUwaUk5RE5lYU5Gcm5MTUdNWEFqWVJ6WVpT?=
 =?utf-8?B?ZjVMQStXRjZUOXFlbU5HbDRPdzhhUnorUWJDVll1SHhyQ2U5cllYVFhUOXU2?=
 =?utf-8?B?UGl1aFc3cm5xTk5pcElqK3NQeitnRjRKM2dhSWQvYjA2TWoyMmZkQ0ZNRllC?=
 =?utf-8?B?RE5qejgyb3lCYmNiM2NZOW9uQ1UxSzcvY1dNOHd3NnVlRWRUQ1RSZ1pONlc2?=
 =?utf-8?B?dmFZdFFzbStOK1p2cGVrZEJBTmpiVlhxcEY5Mk5OYVFCOFRrenVma3pLSDFD?=
 =?utf-8?B?dnR2Y210dGd2WnNYUnBkUVl0UnNPcWlvR2NQY01FWVhxVElMVGRhdDROeS9J?=
 =?utf-8?B?czIxdHBSa3Znd1FGcFhCYXkvTHNIdFZoVTlxWVZuaTdvWHdqZXRwTmpmSk1s?=
 =?utf-8?B?dkZEdUgzNm9TcnFWMHI4ZWNheDZIVXErQmNGeUJocldFaHI2Y0xsSU9VMXBQ?=
 =?utf-8?B?R1hwcU00VWNyazRaOVF1dWhJalFNWTk4bmhUMDdrZEoxYnY1WlhwVWdGUDV3?=
 =?utf-8?B?MzVmVXZ4K2VzczA4aTU0N3QrUXo0VmJVeGgyUWtZdzR3TFREM0tUaUVRZ3RT?=
 =?utf-8?B?Z2NhcGFBV0loNDR3VDkwT3pEYjFRbUsvYXU2cXFIaGQ5R0J6SnVkYWdoUmxy?=
 =?utf-8?B?RHdHTmV4cDI0S2N2WUQ1UlN6L1Z0clNPYzFadWtISVh4V3V1MVYxUU1RNHYr?=
 =?utf-8?B?ajdvT1Vkc1cydDFwbXFSclZqS1V5Zlc3OFk5UVNuN2psWDRVYWdXaTZqbXJX?=
 =?utf-8?B?SVgyZ2JVZGs1RnNjelJHWlRuRTN2R29RVHRwaTVJUWlHM21tLzMxZ1NwRkky?=
 =?utf-8?B?cTQzNXprYXM1elNlTThuWTdyWFB5Y1hiT2RCUG16Y3FybG1IZEo5MXRrZ2V6?=
 =?utf-8?B?RTZvTmZIM3FrdzRFQ1RkbVMyQ09MN1VvOUJQMk85WExBUFc3UDl4N0NkdTFJ?=
 =?utf-8?B?bjFNcGFSVEpnVmtjRUpCYnhOK2ZOSTlqSlZiQzJsWjJTR284L2VITDdPYXBz?=
 =?utf-8?B?RXN2QytwUWcrN0pjZTRQV1kxL0Fva1NjeTJJUnhoZDF4SHdKL3BkWXhBUHdK?=
 =?utf-8?B?MVNlL2psTDhzSVgxZkIrMnk0c1MxTXVIejJqZ0hMWWJJYXRWaWRkVW5XM3NL?=
 =?utf-8?B?K2YrY0pCL1FqVHlQdDkvR1VRdzNIaWhWcHhuZkgwTGdhZWVscWxyN0pGejFF?=
 =?utf-8?B?UmR2dHFUWFc3ZzVueWhqZDBCZE96RXF0YTZ5TjY4T3hpS01hbnpEeStoSWxX?=
 =?utf-8?B?QmtKUGhhd2oxMXA4VXN6RnlOSDFwZ0tFSXhmRHF0M1lqV2VndVJoaWhMUGRv?=
 =?utf-8?B?NXY2VmhWV1Exd1ArY1Rzb29wWHhxdGNneURVSzNBWnIzYUhpVXZhbHpVNGJL?=
 =?utf-8?B?c2lJQUhISHVrK1hCSm92ZFdMd09mYzlVMlkzbkE1cGlzUHN4OXBXVVh1ZEVt?=
 =?utf-8?B?OVB0bzgwNTk1Qjh4OWtoU1dRVVpBdWFJN2ZVanQ1b2tjdWYyN2xhR0F3dkFn?=
 =?utf-8?B?c2o0SmFqTFpIYjlQNC81WFFnS2JZRGFVN0s1WWlYbCs0YXliNnZwUFFIL0Iv?=
 =?utf-8?B?M2pZaExpWmEzaEh2K0taVzhWZ0QwTHlpNjNtdG81NmtVbEZVMVdIT2JXTGEr?=
 =?utf-8?B?V21tU2hETXd4bGdReE1rb1hMdkJIQ0pSck51TmZWeHJuaWFNL1pBUHdORDFs?=
 =?utf-8?B?eFdsYjZsYlNydko2YjdIQkRrMHJzVEw2YmNPQVBXL1MyRlZzbEFwOTNmTWNp?=
 =?utf-8?B?TFNDYzNDTFRwRWpTN3BFNHAzQThHZzdmUzdZcnBzdWoveWU1d3JwQXNLZ0FN?=
 =?utf-8?B?WEpvMkVCdENXRHNET2dLVkZ2OW9IWFVob044L1Rka1N5TXlaQ1dleStPNDFI?=
 =?utf-8?B?QXVsNXJVNVp1YzJQc3Q1ZkdsRHMyU05GMm0yV2tVeWNWd01NQzY0a0F5K09O?=
 =?utf-8?B?UGJqYTNDL2hEbmpMRXplUEtRVVg3QUo4U2M1ZGg1MGVOQnVIaEw5OGxDTDRk?=
 =?utf-8?B?QXR2UW1nZnJUM0w3VmxhMkhHeis0dmpDSzhFSEtueXBiUFEyK3V2MXJ1RExJ?=
 =?utf-8?B?VU5HcVBEaXhaK1Q3TFVOVVY3OEZPK3c1S2R0THdaT1I3QlJMcnJvdlhZVVR6?=
 =?utf-8?B?ZGRtQzc5YVNQdHRhMzRnamswQVRzN0VGSHZkTVNkeVVUZEMwWm8xbk1oS2VP?=
 =?utf-8?B?a2pSNVhKditMWEFOZ21OamhHelR2WkZMSllYQzFZZ1hQUlMyUDRGQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 236233d5-9f03-4093-40c0-08debc1251d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 17:06:40.1434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xA5lS5LsMUbPYzhMvWBKlad+3PUeQYeGJRIKKiKfCrt437llFGdYeHwx5TyBu5TBNKCzwxqX3g+sOP8lSXO9iVVwMm0IqdvFJbXZSx0jXIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6648
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33234-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: C50105E8271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI3IE1heSAyMDI2IDE3OjI2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
NS81XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDZsNDgtc21hcmM6IEVuYWJsZSBhdWRp
bw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgNSBNYXkgMjAyNiBhdCAxNDozNywgQmlq
dSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBFbmFibGUgYXVkaW8gb24gUlovRzNM
IFNNQVJDIEVWSyBieSBsaW5raW5nIFNTSTAgd2l0aCBEQTcyMTIgYXVkaW8gQ09ERUMuDQo+ID4g
VGhlIFNTSTAgc2lnbmFscyBhcmUgbXVsdGlwbGV4ZWQgd2l0aCBTRDIgYW5kIGFyZSBzZWxlY3Rl
ZCBieSBhIHN3aXRjaA0KPiA+IFNXX1NEMl9FTiMuIEFkZCByZWd1bGF0b3Igbm9kZXMgcmVndWxh
dG9yLXsxcDh2LDNwM3Z9IHRvIFNvTSBEVFNJIGZvcg0KPiA+IHJldXNlIHdpdGggZU1NQy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Nmw0OC1zbWFyYy5kdHMNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2bDQ4LXNtYXJjLmR0cw0KPiA+IEBAIC05
LDYgKzksNyBAQA0KPiA+DQo+ID4gIC8qIFN3aXRjaCBzZWxlY3Rpb24gc2V0dGluZ3MgKi8NCj4g
PiAgI2RlZmluZSBSWl9CT09UX01PREUzICAgICAgICAgIDANCj4gPiArI2RlZmluZSBTV19TRDJf
RU4gICAgICAgICAgICAgIDANCj4gPiAgI2RlZmluZSBTV19EUElfRU4gICAgICAgICAgICAgIDAN
Cj4gPiAgI2RlZmluZSBTV19HUElPNCAgICAgICAgICAgICAgIDANCj4gPiAgI2RlZmluZSBTV19J
M0NfRU4gICAgICAgICAgICAgIDANCj4gPiBAQCAtMzgsNiArMzksMzIgQEAgYWxpYXNlcyB7DQo+
ID4gICAgICAgICAgICAgICAgIGkyYzMgPSAmaTJjMzsNCj4gPiAgICAgICAgICAgICAgICAgc2Vy
aWFsMyA9ICZzY2lmMDsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsjaWYgIVNXX1NEMl9F
Tg0KPiANCj4gIiYmICFTV19JM0NfRU4iLi4uDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgc25k
X3J6ZzNsOiBzb3VuZCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxl
LWF1ZGlvLWNhcmQiOw0KPiA+ICsgICAgICAgICAgICAgICBzaW1wbGUtYXVkaW8tY2FyZCxuYW1l
ID0gInNuZF9yemczbCI7DQo+ID4gKyAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgIHNzaV9saW5rX3BsYXk6IHNpbXBsZS1hdWRpby1jYXJkLGRhaS1saW5rQDAg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBmb3JtYXQgPSAiaTJzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBiaXRjbG9jay1tYXN0ZXIgPSA8JmNwdV9kYWk+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGZyYW1lLW1hc3RlciA9IDwmY3B1X2RhaT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgbWNsay1mcyA9IDwyNTY+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
cHVfZGFpOiBjcHUgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc291bmQt
ZGFpID0gPCZzc2kwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjb2RlY19kYWk6IGNvZGVjIHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNvdW5kLWRhaSA9IDwmZGE3MjEyPjsNCj4gDQo+IC4u
LiBhcyBpMmMzIHdoZXJlIGRhNzIxMiByZXNpZGVzIGlzIHByb3RlY3RlZCBieSAhU1dfSTNDX0VO
Lg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmdmVy
c2EzIDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAg
ICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsjZW5kaWYNCj4gPiAgfTsNCj4gPg0KPiA+ICAm
aTJjMiB7DQo+ID4gQEAgLTUzLDYgKzgwLDI3IEBAICZpMmMzIHsNCj4gPiAgICAgICAgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4NCj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsN
Cj4gPiArDQo+ID4gKyAgICAgICBkYTcyMTI6IGNvZGVjQDFhIHsNCj4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJkbGcsZGE3MjEyIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0g
PDB4MWE+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ2ZXJzYTMgMT47
DQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gIm1jbGsiOw0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAg
ICAgICAgICAgIGRsZyxtaWNiaWFzMS1sdmwgPSA8MjUwMD47DQo+ID4gKyAgICAgICAgICAgICAg
IGRsZyxtaWNiaWFzMi1sdmwgPSA8MjUwMD47DQo+ID4gKyAgICAgICAgICAgICAgIGRsZyxkbWlj
LWRhdGEtc2VsID0gImxyaXNlX3JmYWxsIjsNCj4gPiArICAgICAgICAgICAgICAgZGxnLGRtaWMt
c2FtcGxlcGhhc2UgPSAiYmV0d2Vlbl9jbGtlZGdlIjsNCj4gPiArICAgICAgICAgICAgICAgZGxn
LGRtaWMtY2xrcmF0ZSA9IDwzMDAwMDAwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIFZE
REEtc3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ID4gKyAgICAgICAgICAgICAgIFZERFNQLXN1cHBs
eSA9IDwmcmVnXzNwM3Y+Ow0KPiA+ICsgICAgICAgICAgICAgICBWRERNSUMtc3VwcGx5ID0gPCZy
ZWdfM3Azdj47DQo+ID4gKyAgICAgICAgICAgICAgIFZERElPLXN1cHBseSA9IDwmcmVnXzFwOHY+
Ow0KPiA+ICsgICAgICAgfTsNCj4gPiAgfTsNCj4gPiAgI2VuZGlmDQo+IA0KPiA+IEBAIC04NSw5
ICsxMzgsMjggQEAgc2NpZjBfcGluczogc2NpZjAgew0KPiA+ICAgICAgICAgICAgICAgICBwaW5z
ID0gIlNDSUYwX1RYRCIsICJTQ0lGMF9SWEQiOw0KPiA+ICAgICAgICAgICAgICAgICBwb3dlci1z
b3VyY2UgPSA8MTgwMD47DQo+ID4gICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHNzaTBf
cGluczogc3NpMCB7DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczTF9QT1JUX1BJ
Tk1VWChILCAxLCA5KT4sIC8qIFNTSUYwX0JDSyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoSCwgMiwgOSk+LCAvKiBTU0lGMF9SQ0sgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEgsIDMsIDkpPiwgLyog
U1NJRjBfVFhEICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJ
Tk1VWChILCAwLCA5KT47IC8qIFNTSUYwX1JYRCAqLw0KPiANCj4gUGxlYXNlIHNvcnQgYnkgcGlu
Lg0KDQpXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+ICsgICAgICAgfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICAmc2NpZjAgew0KPiA+ICAgICAg
ICAgcGluY3RybC0wID0gPCZzY2lmMF9waW5zPjsNCj4gPiAgICAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+ID4gIH07DQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3
aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==

