Return-Path: <linux-renesas-soc+bounces-32910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEm7CY8XD2qVFQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 16:32:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1A5A754A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 16:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85AE231A4D4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7FA3ED12B;
	Thu, 21 May 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QG7uaTXi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB23E9F7B;
	Thu, 21 May 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371642; cv=fail; b=PfkWL/klB9EDBuyjxl+thadf46y0ZUDzluVvwbJY3V/E2zzKueBIMhhpFFCLwkqKhVieODMrZMJedPHZHADaqvlg3OvaSSIBvb2pDft7GlJLj3p/zBNUd3iiTKhdcncPMoAfJe9pSHCgP8cWYnfRXGfQkbLHTbiZUhoFC3hKpFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371642; c=relaxed/simple;
	bh=dLbSaR73VFUxjZ+vqQLOp+eBoTz4iUO6d4QdAg64KO0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qfaUNSlvplNgCDJSMUnFX6bUBiYNxhcna3wRefMipMQWcXE5NPy4VUrMX/Fb7mTLkOUGIhXRV6aerT+84vt9UoFL4d5nzko5otIDzK2cNeWJ0gjzk9anHWgcx8TJaiaI5e6Q3Sjv6bojgN52kHaQ708soSCQYRVVvsovOampmtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QG7uaTXi; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkJdNRD9TlqkYp4LIhik2KX2rhJd3BW3wuoUqDdqqMRqwlpbCRWhvFJhmez9yVSXg5OQpMt890vbyTHH0m87B5IGHHAxjHe1PaOe1uXCj1SlOtj0lYs80LpuGTrUUnjj0n0NkSzoL2B60Za7wyDNhMU9gEhLaek6HVw6SDjT82JS7bB7RujUskaT6vWNJe9h94nHIp1ZV51rNbF7k++PLWJ25YYn9rXOu0q0r66agZ18uG6zD3xRyVa6tW9xewTo9Dk7kusEhjmAJVvC4oHxn/gnUyKgL4evmr3Bur84lCL+Z3k5wJ5fvNbWgHIaHeoR/Z/modbvy+fFHK5agPOMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16OcZl5gQqdQ7EukeDR+F+y+zFUjzcy7U9L0WNeLpWY=;
 b=bmmyF/uXP4Z7YLmVGwH9EleBHX6mZC38P13AEY94JlsV5Q55z+Ub5AOTT23gSenhvZJAwGL0fenpnBYgVb55JrHwCM/Njj6Pkrs46sh13Si0qH/BXGHKNj+yfLGblaGmNZF5yZ6v415mvBJeQGhCcYkTLQj1q6lyg/CHnRBRltLc4SXXX2nXqBaGk/t4KdrjQEtB3eWlM6KJ4yxlNO8JhV6aJYKadHsZpn17qzFeMh9AS8JhPltxWaf1eloE/rBD1BN3R171BRJ3oSpXKntFgp08WWU9gZz6gi0gLQD1jMnhj6vTkbUkfd5BOVS36oYRqsF230kUEF4BG3eY8zR6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16OcZl5gQqdQ7EukeDR+F+y+zFUjzcy7U9L0WNeLpWY=;
 b=QG7uaTXiGqezqz93Sfic6cSZdAAa0aVoPNaYev7PHqWAHt+YIqWHA2K7/OpGpIkHyy4l9ai0rZckPEgRaGXYq9airTiaWVOaY0cwC5Sx/MizhsP+weN1k3BqYmsvhvQ8axVSzpwDi2eQg1Xry9bqZTk2BEQXblp+Nv5oIGVkPMk=
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 (2603:1096:405:291::13) by TYWPR01MB10426.jpnprd01.prod.outlook.com
 (2603:1096:400:24e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 13:53:56 +0000
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948]) by TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948%5]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 13:53:51 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
Thread-Topic: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
Thread-Index: AQHcyQhL8ROS7yV82kmCzfeEuqsvALYYvtjQ
Date: Thu, 21 May 2026 13:53:51 +0000
Message-ID:
 <TYYPR01MB15615A925B2F724C51DD033EA850E2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB15615:EE_|TYWPR01MB10426:EE_
x-ms-office365-filtering-correlation-id: b819607e-c71b-4b26-9065-08deb74063b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info:
 9P8G6WF/e9AZzIEtqhiz5e4f3O/Bj0xrsjiYx6WsGhfs5t9jw64jMml/wBXlwabqA5XY8x9B2aqIehz/AbvgJPvdWERg0KnUvLzLrMzhVGF9JurEEJvWN0IgJkFCyj/DPOBPIcXiAJdQMfJ4c9SUBxBAmf03Mmb/M8e9hxkwz8P9za5D1PEu7N2ySPWOHAAJ7tJtBblsZUqcFG4VkHr2CeKPK1K0vYlOlIMhZHkMK7oAak5kHnekD6mOUONAy0Kf7kyIyi/C6P3C9sJTSyzbC3+8Kh7SzsYSMI8QIlO1pyUUyEr5vRmQswCwqNezxJLLN+3EVfKnXuuKT5et+1UhUeRHNMeshkHjkCLHYrr0ZG2p1oeaugCWYYfXIge/9Qne93zHvlnt8IF+kHd7XJZq1YtkpXJZebjqHHYCSe/8jNLXWvGGxz8urtame2W0w5QW84sN60zV13MdoGK7N0abhi62bvgg5ZfOJcFVxA8uqo9KdqeOvMGdDSSqJFMMv6sIJboHlMkH9JJlFxN3BeZ1EHfXUIWlkDREpe4VysM1YdE2io35CjSe5WKIzje8/wdZY/spwYoRCrBxd+iDYMIxasBqhMcA8CpTc8IqAlzxIbprHUwPv7a3Nr2x7nLyrXMyO1MUIP+n02avTAWTQSE8enTi4buKYRuBYB45+5dTq6TULzGALKWEGRZZzGuNDVuvcn98mXaQKmxrFUIuKxO1razt1jdhR8BhVPHkY+v4+s5fT35HErnHPJqua0Jer1M0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15615.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XYN1ocy/60i3rKTEts8P26NRQaHsQ8ifPWgyrtz7PFOfVgK31SKCLgM70+Nb?=
 =?us-ascii?Q?Wbt7OOIz+ahbuPckGqd/n0wKOGyNXTUInH/cbdp/i3QTrkSP0C+ZP4VqCnPt?=
 =?us-ascii?Q?pwuR7aKsFEXsgg5tCWmL0iN/vXI/ea8zh8yyLrJDINorHec3B5WacLzNLPTg?=
 =?us-ascii?Q?01V4+uOQMv2+bQIFwvdBFquOtAqnaa29rsHQlednOkx8lk8jo56HodfiFLuN?=
 =?us-ascii?Q?DEGG09r//bnWieYnYFYi6kYP7k0gsFWnLxy+GgbccQoRR5Y4sazykMMDfVi/?=
 =?us-ascii?Q?HuCp4fxF4deHm3qmgZ2O3CDcTpLpSPPgbaRqrKN2PBzrvpZp/FeDjCdT0UnF?=
 =?us-ascii?Q?dPRF3EiATd3sa+d46Bug1otIEmd5zdIF7ODTqMXBqGCViPnFMBo4iurkZ3kR?=
 =?us-ascii?Q?zeMzlxtudNr1Snc1jgO/eox1BTlv7/WoH/dWhCFkaRYCDeFPBHzEDIxHibAv?=
 =?us-ascii?Q?gHfmjmvy3zhVBc8lBKq7h92+PlS/yJpyZYSEiXvg55EjhsMU15Roi+ZJkPR/?=
 =?us-ascii?Q?hrYvuuSrIA8vqS8Nm9r3C7ifiEWqCobMfTItOZpkKa0jSRQ6TCKM5390x89Y?=
 =?us-ascii?Q?MYNk54+rN4jlvyVPYEUHUKVFpA9tqseyFE8jO8ul4EO7y29HVvN1MMRswA1y?=
 =?us-ascii?Q?A0DdWzWKG42gEjgf0Y4n6ZtTgDilcP8ICBALKIfgqW4sZUEmHVJpNtvnMuD6?=
 =?us-ascii?Q?z6mruN0fWV+a0Qm9gX93it2OLHv1TTNZzUS3Livo1/Jbilx7u01gPw0zljHq?=
 =?us-ascii?Q?THIPztSNIJVH5yTDWUK5aS4shIF4Hu+XPfiPFl9+0mU8r+PKM5MAF9rbEZ/6?=
 =?us-ascii?Q?z5UKqFXX5YIn0UBtOATA4r8pIUHM/4bSEaA1Uaa1QoNMvtpv/oP6ygqsbcSo?=
 =?us-ascii?Q?Sh1np7PDGh/TFuqxziziNuJ883nIeNu6VoOOSLDJtTQm1ndyZPnnPnNuZC98?=
 =?us-ascii?Q?CRiPVYvDOkZAOIvmiNCgIT2jgEdcDz9jHkMfhcD6mSC1Q9mICvtY3KJIuS6x?=
 =?us-ascii?Q?PJxu7PeDP7TpAaodavrDs1+3hWyze5pTkwzm/QQxk5nfeCfBtEERMTP/P7iV?=
 =?us-ascii?Q?5xq/OLLiucKvX+CphRZkSqLPi9jecEXKXYTawH6gbT9rsMnNGc9Wu6WAR9+k?=
 =?us-ascii?Q?o1T4PUVIHFgtfKe4cwS5iKlNxNpSbB/RwnMsN5VULzhEemBB9gxem6Y5nDEf?=
 =?us-ascii?Q?C4vmX3BjEnr/lzbeMo50+Ic32X2KZ+8mpulJgPiTP5YJm3m3DcqBSKkMZgKc?=
 =?us-ascii?Q?YX8Aywb2qH1ysH09JEb6rGdDnvz7aKd6R4yI3vAHcqHw4WGlPfZXp5GjUaXK?=
 =?us-ascii?Q?t3X+AdsG+KaRUJsKvL5z5anoGaxm+w33v9hoW5CjIYyzlLfBNwh+ZAjQ+0LW?=
 =?us-ascii?Q?ZWYIJrwvGVXt7MzYuer6Ykb0K7pZmRAL/FYDG9LAT/ZCbozxud/rW/I4nakb?=
 =?us-ascii?Q?xiXz8HDckdOaH/Yqny3ce8xv7s+7VPmF5GAsg/N7/duObygoISNxbojOk/Je?=
 =?us-ascii?Q?cg7zCs2SHcyVNw+gYK9os+hs3adLedERMxQQpXMYiStR7gGm4IcS9s4d1wGP?=
 =?us-ascii?Q?2z6FF3b/GIAxRm6uEScZrw/7EnwvpHR699+zraQKVEouID8l3zLaplQwYDfj?=
 =?us-ascii?Q?3LQ9vt9whT+zkPuFtdSti2kKnLGH3JwxVTazHKZyFFkx7kDGzX0Vys7jeO+q?=
 =?us-ascii?Q?wrQ0rgEZDGaFCPF9Ssi9fDC4BIVYPEm8veWzMQMIVu4xjXgrsfE0YQzijOjZ?=
 =?us-ascii?Q?HKzf/xrpTMNkXClU80d93S2MkEr5IWIPZ4iK2y5vTYDt0TD8DIkJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15615.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b819607e-c71b-4b26-9065-08deb74063b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 13:53:51.1606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEWqrp7MkvrF9wfHqqJLvl5q5n1MqwSM7AQvqBNY2mga1hkgIy158G7SlyU4eia8U1DgKCiufuv1wHJxj57AyatYAHaLUu/w9qPZsfOTeuN3gcMgwnx6V4UyLFlvepYs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32910-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.152.155.48:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,TYYPR01MB15615.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C0F1A5A754A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert, is it too late in the cycle for this to be picked up for 7.2?

> From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Sent: Friday, April 10, 2026 7:35 PM
>=20
> The TCIU8 interrupt used to be documented in earlier revisions of the
> user manuals, but has since been removed. The corresponding entry is now
> marked as reserved in the interrupt mapping tables of all supported
> SoCs.
>=20
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual
>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>=20
> Remove the TCIU8 interrupt. This does not cause any breakage as the
> driver does not make use of the interrupts.
>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>=20
> V2:
>  * reword to mention that TCIU8 used to exist
>=20
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 5 ++---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 5 ++---
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g043.dtsi
> index 593c66b27ad12..7bc37e1015a47 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -120,8 +120,7 @@ mtu3: timer@10001200 {
>  				     <SOC_PERIPHERAL_IRQ(209) IRQ_TYPE_EDGE_RISING>,
>  				     <SOC_PERIPHERAL_IRQ(210) IRQ_TYPE_EDGE_RISING>,
>  				     <SOC_PERIPHERAL_IRQ(211) IRQ_TYPE_EDGE_RISING>,
> -				     <SOC_PERIPHERAL_IRQ(212) IRQ_TYPE_EDGE_RISING>,
> -				     <SOC_PERIPHERAL_IRQ(213) IRQ_TYPE_EDGE_RISING>;
> +				     <SOC_PERIPHERAL_IRQ(212) IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names =3D "tgia0", "tgib0", "tgic0", "tgid0",
>  					  "tciv0", "tgie0", "tgif0",
>  					  "tgia1", "tgib1", "tciv1", "tciu1",
> @@ -136,7 +135,7 @@ mtu3: timer@10001200 {
>  					  "tgia7", "tgib7", "tgic7", "tgid7",
>  					  "tciv7",
>  					  "tgia8", "tgib8", "tgic8", "tgid8",
> -					  "tciv8", "tciu8";
> +					  "tciv8";
>  			clocks =3D <&cpg CPG_MOD R9A07G043_MTU_X_MCK_MTU3>;
>  			power-domains =3D <&cpg>;
>  			resets =3D <&cpg R9A07G043_MTU_X_PRESET_MTU3>;
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g044.dtsi
> index 29273da819951..799a974c4dba1 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -220,8 +220,7 @@ mtu3: timer@10001200 {
>  				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
>  				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
>  				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> -				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> -				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names =3D "tgia0", "tgib0", "tgic0", "tgid0",
>  					  "tciv0", "tgie0", "tgif0",
>  					  "tgia1", "tgib1", "tciv1", "tciu1",
> @@ -236,7 +235,7 @@ mtu3: timer@10001200 {
>  					  "tgia7", "tgib7", "tgic7", "tgid7",
>  					  "tciv7",
>  					  "tgia8", "tgib8", "tgic8", "tgid8",
> -					  "tciv8", "tciu8";
> +					  "tciv8";
>  			clocks =3D <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
>  			power-domains =3D <&cpg>;
>  			resets =3D <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g054.dtsi
> index 0dee48c4f1e44..0dc4c3c8c06b2 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -220,8 +220,7 @@ mtu3: timer@10001200 {
>  				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
>  				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
>  				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
> -				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
> -				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names =3D "tgia0", "tgib0", "tgic0", "tgid0",
>  					  "tciv0", "tgie0", "tgif0",
>  					  "tgia1", "tgib1", "tciv1", "tciu1",
> @@ -236,7 +235,7 @@ mtu3: timer@10001200 {
>  					  "tgia7", "tgib7", "tgic7", "tgid7",
>  					  "tciv7",
>  					  "tgia8", "tgib8", "tgic8", "tgid8",
> -					  "tciv8", "tciu8";
> +					  "tciv8";
>  			clocks =3D <&cpg CPG_MOD R9A07G054_MTU_X_MCK_MTU3>;
>  			power-domains =3D <&cpg>;
>  			resets =3D <&cpg R9A07G054_MTU_X_PRESET_MTU3>;
> --
> 2.53.0

