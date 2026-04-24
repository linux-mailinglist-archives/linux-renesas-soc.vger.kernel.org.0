Return-Path: <linux-renesas-soc+bounces-31613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP3/Geob62l1IgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:29:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31F45AB71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14DC53017020
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31A036E466;
	Fri, 24 Apr 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oTqOYOir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A72BD01B;
	Fri, 24 Apr 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015774; cv=fail; b=oQ7Yaq4bPwm2UL5PQWhS+wA2UIoGb9MvJ2zd7JaZl2rV+UuPTh7qlgswAXwiWu5ItbTtB33P3rUVJRVQ+LYRufCzDm2Rs5KYYb9G70b99Ow7hPXCnZlGghPCoxw7Mdc1F+CL3o1OUmbPhg2JyO4E+q8xGcfiJiPIq88gAK1nk84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015774; c=relaxed/simple;
	bh=dY5KUqnryczUcTjXhKzDVC/10D/NXPO/Z0vq/v8W1WY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c/A1+NZgK5IXos4kw7WNyjOo6OwCbntQYxMQtl3JydFjplkxwlnqaBfCXlUMEw3voI/6q2NOLrY7LjZe36ZKbyLdtXo9T+BcPY88zoM91Pa4stwanynD6JSRHC27euVd93zdeiescQvN7R9owLvUgCOGEX4oPyoqET5BWu7aWAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oTqOYOir; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKXjJeOcQu18w35x6+K925Uop2coDibGxOQvcAlyY4EokRUTBCy6lpF7LP0Stch4eUgMsLvXm7M8I4xs1ny/p/1Mpl2nzuOk3PDG288UJ2Ab9irHhNTIyXs9cJhdSg79XdUC3hro3IKyl8hS9+yMCDtzWqCfK8ItJfkle5BDjGPrwabDOV6wp9xM2tLgA2r1tFKmQl3o1kcM1LB11BskUElKBykWaykzKLPGgt3QVAWopfJCrPfcsY0igKZkb44VRkfiaig9xlrIxgMISOgueS5ubdB1YhrOVgTPxb/kAAyXSVRfMQuj8AUIpqN/XBLNUT7CPDK07Au5mRpj98geAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY5KUqnryczUcTjXhKzDVC/10D/NXPO/Z0vq/v8W1WY=;
 b=U2nAyboomfHvLtUOgmW2Wpnz4RrWSUN8+R+JPipBM3AjJu2nAxlY5tQueCuAH1dY6ivMF1TCgVudzYuOJ5E6zaGNy5MzVmsspQn2ZdIAAMGWgTiyeMWlhd/0VlATcNe+6ndPBbGT4vLlhPhMY5HKvQeVEZAAPL6g8swxkNmj4mc4TU3isVN79gP8Oi/2gnGD6TifHAmRuXvtjRH7/t836UXECpb1QCFlX72pVf/ddO7JMTCUkPSd9n1/u42bGT5kSdpSant86USvpj+O5DcDslQlhf2TZYS8wT+hyZpMHHTvb78QSCaghYFSreoZb+4jcTd7O/6q32E56C+FVomo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY5KUqnryczUcTjXhKzDVC/10D/NXPO/Z0vq/v8W1WY=;
 b=oTqOYOirPMgJ2RsCpTgwlZKdyap0qzJtDSZHdQNScCHuC042kKHWROTaFH/aOqwTpGD9/ujLNuyLPvATNJN79xjCed3cQDEtl7eUWsu7Tnse43f8A4IRfgjLKR9OoJHuJ3QeFwaHqzgqD4ta6MDdmKOeq3us1iY4iTQqA39MPPA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB12014.jpnprd01.prod.outlook.com (2603:1096:400:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:29:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:29:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Topic: [PATCH v2 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcwqIUBy+4u066Q0GCKk6+MmJ73bXguIOAgA0ozjCAAAXJgIAACo5Q
Date: Fri, 24 Apr 2026 07:29:28 +0000
Message-ID:
 <TY3PR01MB11346DCCCE8EA143ACD24E9F0862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260402131020.143123-1-biju.das.jz@bp.renesas.com>
 <20260402131020.143123-2-biju.das.jz@bp.renesas.com>
 <177628854701.543173.16954025159083410550.robh@kernel.org>
 <TY3PR01MB1134691789E55E415E315658C862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWh3gRhr7V632Mjn-feMrC8j8v8UvaywUtsEFFrKLjZ8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB12014:EE_
x-ms-office365-filtering-correlation-id: d148e540-4689-4c88-9579-08dea1d33804
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 ViwGUgAZzQIzUKuexuyFpRTUXLoP7DMSaixUW7T9h3VGl4YBgNfDHUXj7Gxd/LRLMYgGVJaL+cRFJlr8KbbV/N+I02rw0jrjYOJMA0l8W+ADvjWsRx+8tsGcJdAokyc7IQcD5gxtVPw8YN5sVzZtljZt/QErTmoOONriTS6/2yLVJyuPQK7qyk6ErvjPaIYXgbHaXQXulG/XyQG1nG5ucickbXmaMEOBkCm8Fhji47vV2wT3PeEuyAnPRxJaalHL9aF3FgRi17T+AXxLw3wkbSNEp8e2Woc7mK+Yu2NFvjpptKtcx5+kCqsuAxj2mLD3yAKpaudVGsS1weKtCoxn0qm9DWOb9p15r4KhWWSWXfiHCVORnaFLDgSq7U9mVFsTZmnofbEeoUvNJnuKKYZ1TmUpl3D1z2x/1QomVvtjRUdRH/LgSLLiNjpsbZ0RFe7u414Di7hyOeK3mu5mF/mvayuuw+t83Hkbdkgxkv0jrc7fkpg38wDuQouVXwWfIcM+ioTP8r/3aY3L5C5AFJ/Vjy50utGFDrr2ETP+QmkWHrs+GtI+t6YUAxWaxnQohZ94r3mz0O2slmIrRhRMM0yaBEf9lmcmnXB4iZFy5eYYCkc39rit0r0vk5jUFvPJ8QYsOeMy5DHIYCTlI93RceW5KPP8lZM8kzYvQQNEMZLBolOly/DYBUHjsj2O/lh+ePXr2Nckn7ERcbUT0REG9++3/EwOJy0Z5kEH36dxeTdu7ctbewwzaIEm/DDjJoV3s2Os9YMh3BKvHv/3l3sQBZmJ1QmfaiM/+Q+04HuXYtK0RFM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTRNUE5IbUFhd3UvQmxqSVVhSm1YWVA2bGJweWpDUWluczZ4ZDJ2Qzd6cHQ5?=
 =?utf-8?B?NzI4Q21FSHpaclBNZmxJZDM0dW9ZVDg4ZWY3YWt2eDN0cFhUTENweDZmdVNz?=
 =?utf-8?B?SWM2ZFF1K3Q4N0pRZ25QSjY2ZXA1NnVTM0JKZ2NjU0pDYVN6ZllTQkRLQ1Ey?=
 =?utf-8?B?MHg5SHFydkljcE42bzQwSjlhYUJISVFQdzlUWDRkT2RZWlRjR05mUlI1enM1?=
 =?utf-8?B?TE9qVlJQN2tUZEdrcDYxTS9iblhKdTcySXJHd29SNDhZR2ZkWFJxdU84ejNS?=
 =?utf-8?B?QVRyZDh5c1N1VGl4bktmRWoxOGpkQ0RMWW9zSzNicVZ5dlMzaFZteUZDUWJD?=
 =?utf-8?B?SUxEMWJuU2lNOTFFVDV1ODQ3dnFLbzY2RXJVcjR3VzdqVFppelhtZ0E1akxw?=
 =?utf-8?B?V2k3TEJmeGpWZUNwY21WUWxSU0g5cGRFZU82enl1VVd5ajJDYlQ5SHRSM0xw?=
 =?utf-8?B?bHUySDJRM3lYVTBNWFp6YTZvdzZhdTJGbGtkWXFyMWk0WFU2akdBOHZDWU9Z?=
 =?utf-8?B?VXNTaHpneDJtRWV2VVZLWU9DcGxSa3AyMWFNUkc4d1pQcFpzc0ZyV1A3QnhX?=
 =?utf-8?B?SGhlSG8yZFBUS0VDYkd6cUJmM1ZodGl5TkZlK3lFWEZrWnE2ZDdmeDdUQklV?=
 =?utf-8?B?TWFUTElyeEhrRXdMS0hoVGtFaDVLdUhhWVlwS1Y2emxQenJsaE5vd1ZNN3BL?=
 =?utf-8?B?MXdWTGN3UFI4Z09CeVY2ZVR0SnFsRENKQi9LTk8zcFpldzdIL3BGTktqbjVW?=
 =?utf-8?B?czlrdG8yVXQrOEZ1MXg2bEtSMDZEK2pmZ1NPcklhQXk4ejM3dVJHcEVRTlo4?=
 =?utf-8?B?dkozV3ZBZU9YVWNvVndldE0wUHViK1M5dzdIMCs4c2g3VGVlaGdkR1hzNnNK?=
 =?utf-8?B?OEU4bVpmN2o0Nmo1WUZnOHVCcXJXc1ZyMmF1WUVleEFaZWd5c0ZlUkxJV3hq?=
 =?utf-8?B?WUgrODIyT1AvVnoxd0VwMDdQb2JjWXZHaXJjVUt0NG1ueXJlUmhpNEZNcnR5?=
 =?utf-8?B?MVphNHIveHF4S0RZdXhmcHR6V2NuNkYvSTVUeDl3WG5abndMcGYrYzVROGd4?=
 =?utf-8?B?R1FNTmcxKzhiSkZGQWg5N3JJLy9zUzBVM3pqYUlMKzVtSC9RQlNCbUZOTHdO?=
 =?utf-8?B?U2IvNllVQmtUU3NPRjNsYmZhNUtRakptTjJPZGpZWTBlc2d1enBaalROMEZR?=
 =?utf-8?B?U2dDcDVhNGhZaFJuMXRRVFlJcU9rTmFNLzFRQTk0K21jZlRiWGhxMFJTUUtP?=
 =?utf-8?B?OXdlNGQ5bGdxOHpQTzhmZ0dZaC90SWU3VEtmM0xaUFdVZUpYUFN5TzdOOHgv?=
 =?utf-8?B?QnR3SFV1QjdEcHhRc1JOc0pZb0pobThGTTFtWEpZUWFqS2JLa01OaDRhdHNr?=
 =?utf-8?B?VFR0ellnazZVelMzR0xURE0vZGwvbnVZOHdEZWJKYk16dU1UNm95amZjd29U?=
 =?utf-8?B?N3F3MU51UnJhVmNXT3JueTdhQm5RRTVJbWhrL0xnV1JNQ0tRQmlIUnhFSXU5?=
 =?utf-8?B?OXZTdU9Oa081OEZHakpTbFMzRlcvcHZXQW1FbEp2Tjh6SUVuUHdiMGhYWmth?=
 =?utf-8?B?VzN5alcwVjk5RkhHeWEwLzVOb09uT0Y2Y2pFaGpkUVdFdG5sOHZPa0IwR04y?=
 =?utf-8?B?QjcwQThvVFl6ZjJHTTlHbDVWcDJ5bXNkaU5aOG9DU0VaZGQwOFRCaEFZTWkw?=
 =?utf-8?B?bFA0cVB0SEpTQ21xcVREbjY3OGFqczdjcExrOWpNUFNuWk10NjlyK0VNdFRM?=
 =?utf-8?B?NXhqaUJLekV6UjljZGRUVjA2VGlRb2N4TXZYaERSR2tCNzF0bXZIbUFUc212?=
 =?utf-8?B?a1JwTllVeFo3UnQyNHU1VVNjem9tWjZpZlI3WFh6bVNHZ1lnNEYzRkt2Z21Y?=
 =?utf-8?B?cllabHhOdGIrdHdQTUlkMTNMQTllNThKWkQzaWJnZkJGZkdmZlo4Mno2NW5T?=
 =?utf-8?B?ajh2MG1WM3BScW5OSmhiY2NkUG1yN0dzZFVvMElYaithZkZEbXZUS3Y4Sy92?=
 =?utf-8?B?cGliWi92RElaYXhwUDBkOWQwamgzd1RWcU9rWFZIeHljaDVmajlyZnArSHFX?=
 =?utf-8?B?M3dXVWVaUWFwME41amlSdUo1Z0h1bUZIYlBNTWtSUjdHaVJxU255YTR6REFR?=
 =?utf-8?B?R1Rqc1gySUNQb0tSd3ZQb0lpemhON1VpRXkvUXYzVWhCWXd2R0Z3V05wSTFL?=
 =?utf-8?B?a0l6VDdBVm9EMzhoSFVGeDkyZ3lOVUp2SnMwVDR2MEl1cXNWRDVBcUE1dTlQ?=
 =?utf-8?B?bmsyc0pZRTRhRHc2MHVQMHdDZ0VMUkhhQmtxVmU4c0tvRnY4YmwxRm16dEF2?=
 =?utf-8?B?SStKRWlJTThJVTl2ZkhmOHpOM3ZFc2ljQzQ5cFR0cXE3VGVEZkhyUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d148e540-4689-4c88-9579-08dea1d33804
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 07:29:28.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUXI2eTV8MypEWMmh+wVQdPAyM1Zl5XTo8WoJWDwkLN//4mxXrermFJ5eFutXYqKEvnMJtlAKWDhTAh/6DPKvUVXD1l2bH6mVClDoLe0jYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12014
X-Rspamd-Queue-Id: BC31F45AB71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31613-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,bp.renesas.com:dkim]

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjQgQXByaWwgMjAy
NiAwNzo0Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IHNwaTog
cmVuZXNhcyxyenYyaC1yc3BpOiBEb2N1bWVudCBSWi9HM0wgU29DDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gRnJpLCAyNCBBcHIgMjAyNiBhdCAwODoyOSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxy
b2JoQGtlcm5lbC5vcmc+IE9uIFRodSwgMDIgQXByIDIwMjYNCj4gPiA+IDE0OjEwOjE2ICswMTAw
LCBCaWp1IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IERvY3VtZW50IFJTUEkgSVAgZm91bmQgb24gdGhl
IFJaL0czTCBTb0MuIFRoZSBSU1BJIElQIGlzDQo+ID4gPiA+IGNvbXBhdGlibGUgd2l0aCB0aGUg
UlovVjJIIFJTUEkgSVAsIGJ1dCBoYXMgMiBjbG9ja3MgY29tcGFyZWQgdG8gMyBvbiBSWi9WMkgu
DQo+ID4gPiA+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2MS0+djI6DQo+
ID4gPiA+ICAqIENvbGxlY3RlZCB0YWcNCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vYmluZGlu
Z3Mvc3BpL3JlbmVzYXMscnp2MmgtcnNwaS55YW1sICAgICAgfCAyNiArKysrKysrKysrKysrKysr
KysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0K
PiA+ID4NCj4gPiA+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3Jn
Pg0KPiA+DQo+ID4gRllJLCB0aGlzIHBhdGNoIGlzIHN1cGVyc2VkZWQgYmFzZWQgb24gS3J6eXN6
dG9mJ3MgY29tbWVudCB0byBhdm9pZA0KPiA+IGZsZXhpYmxlIGRtYSBuYW1lcyBmb3Igc2luZ2xl
IERNQSBhbmQgdGhlIHBhdGNoIGhpdCBvbiBbMV0NCj4gDQo+IFNvcnJ5LCBJIGRvbid0IHVuZGVy
c3RhbmQuICBUaGUgcGF0Y2ggTEdUTSBhbmQgaXMgYWxyZWFkeSBhcHBsaWVkPw0KDQpTb3JyeSBm
b3IgY29uZnVzaW9uLiBSb2IgaGFzIGFkZGVkIEFjayB0YWcgcmVjZW50bHkuIFNvLCBJIGp1c3Qg
dGhvdWdodA0Kb2YgaW5mb3JtaW5nIGhpbSB0aGVyZSBpcyBuZXcgdmVyc2lvbiBmb3IgdGhpcyBw
YXRjaCBhbmQgaXMgYWNjZXB0ZWQNCmluIG1haW5saW5lLg0KDQpDaGVlcnMsDQpCaWp1DQo=

