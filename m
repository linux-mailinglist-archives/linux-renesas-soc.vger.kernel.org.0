Return-Path: <linux-renesas-soc+bounces-30757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB2VDFh6zmmMnwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:16:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168D38A579
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 16:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A458302D95B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 14:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417DA3E92B6;
	Thu,  2 Apr 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kqRQKo1t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651713E8699;
	Thu,  2 Apr 2026 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139009; cv=fail; b=caAsI3QIgKziVt5a+7XRwS8W3DqFaHBvesfDLWrJoVcKNE7zxJFuhkh1vNxh8g9rgjYXl6EH8uf/TkhrClEEJNoNKH1GR5XAb0sMvXsRpGz0K0nQQG0de6WOYP+UrbvJDmjT4PNBlI7U789hKI2zokx1ftnVnV+ZCK0NKfACPdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139009; c=relaxed/simple;
	bh=24WYUoKCWdl0mzwvhvNEuNX2rFBNPtS6kOeymuNx0/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jq4SvjQXc/yYkv2d4qSs/xr4ecBYVaCgrIzUQxtFKH9EMChFoQ+FKTdkBUbM/qsxQg1A0WrFClhB7O8hMCkytr75sCqZmVTtYJiuSgSUkRJTUH+VTfzTpvt9M1FKuM+mgNU++ON9BzZIG+jvnNidxzAaIj/raYjoi2rBsJRTRqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kqRQKo1t; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTqhhbK7iF6AdOPsSXCrcb8IKdSd1DJTBA74qT832RDJL9573OGKoBV3NhCQWyWXvcmhWe2QMNL/vjEtprJE4skWEw004t9l/PWmGhmVHN6MqLz5gDmh0S25NQw1QIV/C4eBMFwXc5NCEGXB+wxKAYozASAjdGsnn0+6ufVGs9b778uFTpbuVYG0N1/Eycsxh8vCwtdS/lw/Dhej5Y2/cLdkGzw8hOSI/kdtSadhAlVehmRYdZ453kqpx3hagvzNEvy94xS/eBuA+99QbkKw8s2OPe3IqmIoDxZYEq4v2Of1V3PNbGfWwCrZYoUz50IYUVYXYP96da8y5cVZdcqMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24WYUoKCWdl0mzwvhvNEuNX2rFBNPtS6kOeymuNx0/Q=;
 b=ZU5A2Hop06cgBwRsArPugw7a6u36uzG5ouVxwq+qT5zACSieRF50GkPcc09DmEJv1ZYJYxUm/Gio13lu9sUfmKoHjHPN8iOtCCIkzExLKh5qcfMCAL/07KJ+ZyKg5Fvqhc1Y4pvLEdq8d+fxaCPeQGSV8fLnH8qLAxeiCY6k+nqr/D9cCcbjg62fVrbagwP9cnisD6TLzr/rZPG5UIBXYZk1Zsgh098XT5B+oZaGBKmKZyQr1xOYJyePgVDSjVa/E4Lvch5syWzwth6T//0OI6zjHWjHUSVVJtFOl8J7Yb4tm5h5AgysNGggdVgBCcBKqEvX4IcEZBnopHxTbciZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24WYUoKCWdl0mzwvhvNEuNX2rFBNPtS6kOeymuNx0/Q=;
 b=kqRQKo1t2x7bS7LS493gRv5TKXVG2UC16AaBRHkqtTULrGJpe3isWIYYmvmmqqDHDe+ucD+UD3J77IZeZscpTltZmk7CDNnVLHktja4sCYuc784MMjWj9ZRsv40m+VPonCvmLw6/lcshi8qZa4RYcu8qs8xk6meUtH6HBAThT0k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8373.jpnprd01.prod.outlook.com (2603:1096:400:15f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 14:10:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 14:10:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L
 SoC
Thread-Topic: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcq6tl0kg0H5FQ2EeOkUiXc+QUbbWeeNkAgAABc7CAAAmVgIAtdw+Q
Date: Thu, 2 Apr 2026 14:10:03 +0000
Message-ID:
 <TY3PR01MB113461341DE0677746358F5BD8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
 <13d4fd79-784e-407a-9f2b-41cd9a86f232@kernel.org>
 <TY3PR01MB11346B3A18D2EDE88B8A45C1B867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <dde6b95c-2d18-4a44-9127-bce26c99901e@kernel.org>
In-Reply-To: <dde6b95c-2d18-4a44-9127-bce26c99901e@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8373:EE_
x-ms-office365-filtering-correlation-id: a6a1deb0-87b2-422a-517c-08de90c1891a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 PjU3oNaYSjreoVR/sGgnLonrLho56wDmCeDzTnjOkHQ4f9Yl4Ye1fmxZr5oC9Bda+r4xRzyJ1I2JbNxVJ1mhhOnDptd43l3QJOmsRK5heXSEqX1jPXljGpl6fEDLs8ixuIK+r9e8OKZmPbjnW5QFvm+IVHk+S6Oh9sism3cjPlaRyPdGGEgPsu4XesIdR3FNBYwCMrEzoith9SsYm4IFQClETxROqP+yOsdyset5Ow3ewcm8OUhM8OCUkcBszT25C/K0wXJi68QvJ4NjhSBekQcLeTVlFCMhhq5IRCTYd+L55/m7ReJqFiznp3agxi8VIgqgsDx3vn1mCnGooJLrgGW8EVDUVOwExHogfJ7NEVZ57CiK0iGEUxOtO7xBMhs3AuopOa0FdJFQpDYssMW6LL3lmmQtmZvkttmo9ycwqBWsabM3JBsIaFrtKLb6eSlxSjk6uAyq6Vu3eUYjlhxAwkFfXaFxC6is4rkKMd0mgutTVZijzU06lceQi2rpOsG0frDrKAXppHBj4G8bOdA1Xag8iFc27mPhIN9F9VQjNYphYjK/LhrUUm0BmGV/bI4QYa4Q5vcEDWi0Hav8zarESArJT0b99n0BUeBAaMGetv5atvahQiEqUR5T51j2RGS+Ka/K8QFQ18Q7NIDzUamrGsRQ5oBSu8i5Vu2gfOR3eua2gaIXSnNYtGj4+s3ybHjoO5w1yD3CHrAFzdZH552WOXMGt7VOOFCVg7wDOLAUey6dO6dT0I8XhczjbEWEa9qv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cklBaE84d2tVV0N6R2hPV0pLS0RTSlQzWWRJUkYvMUJKTytnbGNsWDA2cENI?=
 =?utf-8?B?bTZXTForVkVPK1g2eXR4bTlhZGRzclF2TkNad0ZUdUZzZHJ0RU8vSGFZMHVr?=
 =?utf-8?B?NkFBQzcrdTFFQldjZUp5Nko1bUdxVzU4OVIrT2kxd1U3eG5KdDVKUEo2SmRm?=
 =?utf-8?B?WS9iVWlsejl2RDFjN3BHckM3MFhwQ0ltYkVCbU1HelRCS3MwU25zVEthK3VZ?=
 =?utf-8?B?R0tNM2VEazFPaWdSbWNJaUh2MjZaYTNxUnMzRGhOYk1DRTdONFQyampKdkUv?=
 =?utf-8?B?dVgyZmdEeUFNenNSekZMQTBwcjEzcUFjYWdoUUVhZk94VzBMdjZNRGV1UXZu?=
 =?utf-8?B?WS9TLzdQd2RwNVR4UklZQmoyVGNneFRJb1k0T0N1ZENlbGR6ZEJxSUpDNzdw?=
 =?utf-8?B?ZU9NMlF2dW1JRG4xYmJsRW1ucDRQT1hPd2oyT0hSdDhwZ3pKNXNZWjd4ZnVs?=
 =?utf-8?B?WHZJL0xiVVdOV1V1YnhjYzRuTllEVXpYR1psOXVoQlp2Zmp4RzIxK3pNOFBk?=
 =?utf-8?B?cWpQUTNVZ0VuTXdZYW1xdGMrOStXdGJ4Zmc0TUlndUFEREhrdmJmekRUUEdl?=
 =?utf-8?B?UnY3MDFDcHNNdnRWcWNDVzROZjZidHhsRVcrL05mWXhtY0JQWmVMNzhVQVBi?=
 =?utf-8?B?M3dsbnVaVm1vN0taaFZDdmNzd01tTXlWTGNPOEhEUmxSWHYxSWtUZ3V6N0Zp?=
 =?utf-8?B?UjA4REZsTElwbm9IbmRRUHNJbDF0RWZsbFZrSyt2d2xWM05sUXhLVVhBdGZK?=
 =?utf-8?B?amkyQllKSXBQeFJFMFZ1T1ozWkV6UTZFOElIaVRRV282U09MdXIrT1JIVTd0?=
 =?utf-8?B?enFSWnJYRHI4TEsvQ1hwWWZWOVhrMTlKMDZpcDN6clVFQ2ZMS0o2V0Jvd1o0?=
 =?utf-8?B?VWV1UzQ4QVJPRk81R2hWMkVxZTZKeDhQR2lsUEJpRG5sNi83RDVERW84eGZi?=
 =?utf-8?B?WTVTcDFtWG1WcGRXZ1kwMENaRElRSXdmZGpzOW55V1VXdDdEaTBHSldzRjha?=
 =?utf-8?B?cTB4Vys2TENCNU9WSGxhM05LMTJOd0FkdUdORXR2WWJhZjZZMGpaTlp5cFM1?=
 =?utf-8?B?aFZ3dzZRT1dYM0dPZW0rdTBJaitMWGR5UWZXZU80ZXpkNVpVdHNDYlF0WWRJ?=
 =?utf-8?B?MEoxc00xMXRtT3ZsZkxLRFZWSkY5ZUZ3Smt1blBsQkxCMVVGYUhnT2Z0ZjNB?=
 =?utf-8?B?ZnJ5ZWpjZnJjL0YzNFZjWkFkVTBCWThsdHM5bnhBdlFVb0VWeWlQRXJFc091?=
 =?utf-8?B?SHlHOGNIYWlha3M1MVQvTkIrU2NIUFlNbXpLSUlaV3JtdWlxU2VrUzY5NmZB?=
 =?utf-8?B?NEJESjcrZVE5bzNKdDNVSENsNk93a3lWUEpNTXFTT2h0eTI4RVdsNVB0bWtV?=
 =?utf-8?B?dmN1cTJLQndkWGtCQXptOS9wcWt2TTZaQkNhYVp4aDZ5SDlpRVBFTmsrcWZJ?=
 =?utf-8?B?cEJKWkdnd3A5dWNtMHdhMUd5UWxHd0JLR1c1VkE4ZU8yOVloTVhvTTNjM043?=
 =?utf-8?B?bU15a0NJSmR4T3JqM3NVVnBMdHdNUXoxOTFxa3JiWW1zQ0dqVkJuRlpiRWlC?=
 =?utf-8?B?M1hZRFh6ckt6ZXYyUW9WV2R0TkxIVGM3WjQvalpaZTdNTnFGRGgwbzZZWjVi?=
 =?utf-8?B?VGZxdDVMU3AvOUpOYjI4emhQR21sdEZXNzMrRHM0Qjg2YlJ4NVl6bGNlMVJM?=
 =?utf-8?B?aDRERFlJd3oya3o1Z1JMMGJXakZqaFJUeTN1QzVPdThxZldaUVJCOFJ3MGVY?=
 =?utf-8?B?cmQ5ZzJ4VnBPNUUwUjYrZVQvcmk3TXpIcG5GOURMNUJ3QmxYT1ZTNGtGanVH?=
 =?utf-8?B?ZnFQaEU3NU1jcVZpZmlONVRTZEtYOU5Ec1BxeVZnWkFFcEVLcldjdjd3Qzdu?=
 =?utf-8?B?YUxyb1dWZUJOd1F0NlRTbEM3VWhXT3l3R294WFhHdlM0WFNvZlgyMXR3d1dm?=
 =?utf-8?B?SEExTEp0dHpGVUdJQ3VGVUVWTlYzWGVSUjVJdTY5cjlyNnB6MjdRcWJSbGxT?=
 =?utf-8?B?d2dIWldwZzVkT25lMGM3SlpWVEdFN0ZDTG5FeHpkN1NpZTd5bVJNUkYyeGJa?=
 =?utf-8?B?aGJwdUxqeTlxcUVWakx2UGRCY0djTklyRWxrNjgzeXVHbzBSQmtlMnViWHVC?=
 =?utf-8?B?YXRoRWVoMTBXeFBRblpBNG5vdi9LU1BwZUNxYjZxdE1SeGNWaEFocmRTemZH?=
 =?utf-8?B?ekxMNkNSRXRlcjE3U1Awc2k5MVFMbzFuWUxPenMvOFBwRVdsUXJPOEo0U3py?=
 =?utf-8?B?VmFwVVRhYnBFMkNyVXZEdFNHVlJ5QzBsZkVseTE5U1R5REtOY0ZMODlva0Yr?=
 =?utf-8?B?K2RLcjlHc24rUGw2YjZ3QUlYK3dBUVlLOVQ2S2ZQc0pqSmczQ1hqZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a1deb0-87b2-422a-517c-08de90c1891a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 14:10:03.6205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7erWISEuSec0HqmvR+7S9N2oDCJLj46RhGy/Kxt0heXY4bbYKQiEhWfKCbuB9hbBvjtUeb53VbaPnOkzpTqs71k5zy8Feyozt0PDI0iBwbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8373
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30757-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,renesas.com,glider.be];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,el.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8168D38A579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQpIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDog
MDQgTWFyY2ggMjAyNiAxNTo0Mw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGlu
Z3M6IHNwaTogcmVuZXNhcyxyenYyaC1yc3BpOiBEb2N1bWVudCBSWi9HM0wgU29DDQo+IA0KPiBP
biAwNC8wMy8yMDI2IDE2OjE4LCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YgS296
bG93c2tpLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiA+DQo+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMDQgTWFyY2ggMjAyNiAxNTowNA0KPiA+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IHNwaTogcmVuZXNhcyxyenYyaC1yc3Bp
Og0KPiA+PiBEb2N1bWVudCBSWi9HM0wgU29DDQo+ID4+DQo+ID4+IE9uIDA0LzAzLzIwMjYgMDg6
NDksIEJpanUgd3JvdGU6DQo+ID4+PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4+Pg0KPiA+Pj4gRG9jdW1lbnQgUlNQSSBJUCBmb3VuZCBvbiB0aGUgUlov
RzNMIFNvQy4gVGhlIFJTUEkgSVAgaXMgY29tcGF0aWJsZQ0KPiA+Pj4gd2l0aCB0aGUgUlovVjJI
IFJTUEkgSVAsIGJ1dCBoYXMgMiBjbG9ja3MgY29tcGFyZWQgdG8gMyBvbiBSWi9WMkguDQo+ID4+
Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2JpbmRpbmdzL3NwaS9yZW5lc2FzLHJ6djJoLXJz
cGkueWFtbCAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3JlbmVzYXMscnp2MmgtcnNwaS55
YW1sDQo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvcmVuZXNh
cyxyenYyaC1yc3BpLnlhbWwNCj4gPj4+IGluZGV4IGNmOGI3MzNiNzY2ZC4uNTk5YzA2ZmYwOGU1
IDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nw
aS9yZW5lc2FzLHJ6djJoLXJzcGkueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9yZW5lc2FzLHJ6djJoLXJzcGkueWFtbA0KPiA+Pj4gQEAgLTEz
LDYgKzEzLDcgQEAgcHJvcGVydGllczoNCj4gPj4+ICAgIGNvbXBhdGlibGU6DQo+ID4+PiAgICAg
IG9uZU9mOg0KPiA+Pj4gICAgICAgIC0gZW51bToNCj4gPj4+ICsgICAgICAgICAgLSByZW5lc2Fz
LHI5YTA4ZzA0Ni1yc3BpICMgUlovRzNMDQo+ID4+PiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEw
OWcwNTctcnNwaSAjIFJaL1YySChQKQ0KPiA+Pj4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDln
MDc3LXJzcGkgIyBSWi9UMkgNCj4gPj4+ICAgICAgICAtIGl0ZW1zOg0KPiA+Pj4gQEAgLTg1LDYg
Kzg2LDMxIEBAIHJlcXVpcmVkOg0KPiA+Pj4NCj4gPj4+ICBhbGxPZjoNCj4gPj4+ICAgIC0gJHJl
Zjogc3BpLWNvbnRyb2xsZXIueWFtbCMNCj4gPj4+ICsgIC0gaWY6DQo+ID4+PiArICAgICAgcHJv
cGVydGllczoNCj4gPj4+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgICAgICAgIGNv
bnRhaW5zOg0KPiA+Pj4gKyAgICAgICAgICAgIGVudW06DQo+ID4+PiArICAgICAgICAgICAgICAt
IHJlbmVzYXMscjlhMDhnMDQ2LXJzcGkNCj4gPj4+ICsgICAgdGhlbjoNCj4gPj4+ICsgICAgICBw
cm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICAgICAgY2xvY2tzOg0KPiA+Pj4gKyAgICAgICAgICBtYXhJ
dGVtczogMg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4+PiArICAg
ICAgICAgIGl0ZW1zOg0KPiA+Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBjbGsNCj4gPj4+ICsg
ICAgICAgICAgICAtIGNvbnN0OiB0Y2xrDQo+ID4+PiArICAgICAgICBkbWFzOg0KPiA+Pj4gKyAg
ICAgICAgICBtYXhJdGVtczogMg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgZG1hLW5hbWVzOg0K
PiA+Pj4gKyAgICAgICAgICBtYXhJdGVtczogMg0KPiA+Pg0KPiA+PiBTbyBldmVuIGFmdGVyIG15
IG9iamVjdGlvbnMgaGVyZToNCj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzlkMDhk
ZGRhLTQwM2UtNDU4ZC05NWU0LTRlNzY5MTVkZjg1ZEBrZXJuDQo+ID4+IGVsLm9yZy8NCj4gPj4N
Cj4gPj4gdGhpcyB3YXMgbm90IGZpeGVkIGFuZCBSZW5lc2FzIGRpZCBub3QgcHJvdmlkZSBhY3R1
YWwgY3Jvc3MtcGF0Y2ggcmV2aWV3Lg0KPiA+DQo+ID4gVGhhdCBwYXRjaCBpcyBub3QgY29ycmVj
dC4gU2VlIGJlbG93Lg0KPiA+DQo+ID4+DQo+ID4+IFRoaXMgaXMgc3RpbGwgcHJvYmFibHkgd3Jv
bmcgYXMgcG9pbnRlZCBvdXQgYnkgb3RoZXIgcGF0Y2hlcyBieSBSZW5lc2FzLg0KPiA+PiBBbHNv
LCB5b3UgY2Fubm90IGhhdmUgZmxleGlibGUgbmFtZXMuDQo+ID4NCj4gPiBZb3UgY2FuIGhhdmUg
InJ4IiwgInR4IiBpbiBhbnkgb3JkZXIgYW5kIHtyeCwgdHh9IHNob3VsZCBiZSB1bmlxdWUgZG1h
DQo+ID4gc3BlY2lmaWVyDQo+IA0KPiBOby4gWW91IGNhbm5vdC4gSSBqdXN0IHRvbGQgeW91IHNv
LiBQbGVhc2UgcmVhZCB3cml0aW5nLWJpbmRpbmdzIGZvciBhcmd1bWVudHMuDQoNCjxzbmlwcGV0
IGZyb20gd3JpdGluZy1iaW5kaW5ncyA+DQotIERPIGRlZmluZSBwcm9wZXJ0aWVzIGluIHRlcm1z
IG9mIGNvbnN0cmFpbnRzLiBIb3cgbWFueSBlbnRyaWVzPyBXaGF0IGFyZQ0KICBwb3NzaWJsZSB2
YWx1ZXM/IFdoYXQgaXMgdGhlIG9yZGVyPyBBbGwgdGhlc2UgY29uc3RyYWludHMgcmVwcmVzZW50
IHRoZSBBQkkNCiAgYXMgd2VsbC4NCjwvc25pcHBldD4NCg0KSXMgdGhhdCB0aGUgcmVhc29uIHlv
dSdyZSBzYXlpbmcgd2UgY2Fubm90IGhhdmUgZmxleGlibGUgbmFtZXMgZm9yIERNQXM/DQoNCkFy
ZSB5b3UgZXhwZWN0aW5nIHRoZSBSWi9HM0wgRE1BIGVudHJpZXMgdG8gYmUgbGlrZSBiZWxvdz8g
UGxlYXNlIGxldCBtZSBrbm93Lg0KDQpUaGlzIGlzIG5vdCBmbGV4aWJsZSDigJQgdGhlIHVzZXIg
YWx3YXlzIG5lZWRzIHRvIHNwZWNpZnkgUlggZmlyc3QsIGZvbGxvd2VkIGJ5IFRYLg0KDQorICBk
bWFzOg0KKyAgICBtYXhJdGVtczogMg0KKw0KKyAgZG1hLW5hbWVzOg0KKyAgICBpdGVtczoNCisg
ICAgICAtIGNvbnN0OiByeA0KKyAgICAgIC0gY29uc3Q6IHR4DQoNCkNoZWVycywNCkJpanUNCg0K
DQoNCg==

