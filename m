Return-Path: <linux-renesas-soc+bounces-33652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ClfrL1KgJmpTaAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 12:58:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A2655655
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 12:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=FzIXIg5e;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B409230EF5D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 10:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EC4388E55;
	Mon,  8 Jun 2026 10:27:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B63845B0;
	Mon,  8 Jun 2026 10:27:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914428; cv=fail; b=AS2cVs0ek8UVsRgeQUZMAEI0gPw1hKcj+jhFVAzIZQ6whKU+ds34QSHip1nIqUGgSj/VnopkaVTzUjwL8OkDveH+lr49rhFSRWCwFc/lu/zw6X7GAxGVTzG0wUNrw9D+32qR/f3Mg/IgnMYkbRkd8e1qJsGTRE93s9RYCAwRDJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914428; c=relaxed/simple;
	bh=mOzEYCvY91S9mY+Rk8QpDDW7/yyZUqMSxzR0b7exMTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SQv4wtoLuluAWkH6oWtj80DavJUVL26HEjMIS041O6v9tapBGoMz0yoxVZlK9jU9SYFEtYra7igdHB4N5l82ankPSSs8IXAFGec+n3DCikpuIS7uHwmO2OfU2vrKD/Nqelpasti4mQTp2LlzYTSvzgVLo3p7Frv+6FSzp6wSLbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FzIXIg5e; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzqa2ED+R0xrgcCvuX/0gltAGTL/ywMhEgCla1kUVI9k/EJSwoLIZfrW9dnFS/t3u6eBC1y9B7nhHb9OkApaii+zJj8HuqUfjxxg8R+p8UnYZy91SS7u2m6vg6h2IBvHZ6kSTvjOuFHMwmksrhCvgLQSCt6PKRoSX9fICSKQ0Cp+Dku1P5lvVb/4cZ9d0tt420Y3JVhJCtOLuyXZeYsCzkv9df9MXSRX9bcvYZSBqjBJaRJqQou3EXZSll1Zj9cuhZ+0RxKuEgBqqbDh0AOLAJ5PAUe85H4z/4Tv2TOlOdp2VqzOMC4UbKk9egOWhi7fwYSl6tpLj2MBNwrF95DuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOzEYCvY91S9mY+Rk8QpDDW7/yyZUqMSxzR0b7exMTw=;
 b=b8G41/f3dtU7OsgcLzSGhgTllDFEgDpTjQnrv2UcgIYHUBQmL/FwgGRqZU3cB7O8SzWqN+b4NpqyaD3Ra8z7PGL52BAEFZLU9qrkJV8QuTikZRiY0f25Qa7givtEWgun/fKtAJGTKXsyNl3ZGXcPTl+RVI/KVu+5+Z14BoMsF6tTnHDitYN9Q5wHmsTiLlmM0+gxevrr6JQ6XIPOXI4dEovfpiwCT6N4ylfq0LswUOv0xOxhoxr7gO1q2MS2ZQyTtnNkkIo9mkDVSOJ3A4rwkvnfbY2oBQO8SuHC6kKt6g9WhoZ3cZxa9BTdjcGWUn5smfVjrmXHs8D8HER0AX/oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOzEYCvY91S9mY+Rk8QpDDW7/yyZUqMSxzR0b7exMTw=;
 b=FzIXIg5eiWywZ8zcvd6YH/7jetsrZLh1/sXIEAnDCvSap+gxFGynOb+gvxljg/o4Lh0QOSyH8XP4xe7OWbbdEKPrYaTRoP9ff6OSBzFdmPDlVuxKHqubQ4dlRTppD/G9k6ZUggEB3fVC3+EcfUbZ/oB/vWTjnc84OxYLkBPc8+w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13905.jpnprd01.prod.outlook.com (2603:1096:405:1f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:27:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:26:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Index: AQHc8pGh26og7GjtHkeCuhYLGQ8HXrY0e8eAgAAAPoCAAABXAA==
Date: Mon, 8 Jun 2026 10:26:54 +0000
Message-ID:
 <TY3PR01MB1134665BE4CE8FB734BCFAAAF861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
 <20260608-alluring-remarkable-echidna-d107ea@quoll>
 <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
In-Reply-To: <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13905:EE_
x-ms-office365-filtering-correlation-id: 0137600e-8f6b-4058-d7c4-08dec5487637
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QfI4T4E8ICUnQM4AvZYDIsGSwfaobPQWn9vNRnVGTnemeXxjwJi8xVCoj+2Szwgqwij1Pezx0jORGITiSBRAzRPghZpgWUDTVQO87uIG0czCSpYOXL3As19wLqMm3XpfX7sX6jdyfNjYUjP+0qXglt4fiWhqKFmYE7/ZHqIgx5MquZZjTgePvQapn6EdZ43I6Lqm49MSLi+LuH63KsTw0KW+4Cfu2DgKNzVk472pkZzYJ8Dxu7r7J8ezwHd0F9KM6BCtpF2W7daDcg0aE9s5BSPQONy1TYj4v4aXBcNax6A5L28+LVSNpcdTiGM4hnR8n88zTmLK6dtunvRluoLhLQcMUhIATCmB3hvM5Z/C3UDluMK8yQrd8RpmEW8hRCjrKjzS8aN8OE9DtCRL29Vrz1cr2fsn90i/tOdJaqCGLTF53xXjSxPirl5nYyjP/saBeKncpdyCLqel8r0Oq/k/6oyN8/0LbsNphlZZL+RZoAClQTZSd+dkWsr3L5qjPPQafC59uoM2y4X2FEL5v0ec5+p87WSDJqScF8fBPdt2S4R27V4qNARUOlU1oMBF31Ep1eeiHVByEnb30OOU5xthFZ0ymtwKqml53Hsgb3T96FfORSDJTbMTU0nCu7gdTw0EWNce92WADaJ14gtKxRGVyr4r0kWdzJRUH4yUubSEwf8YLPQ0k8kGcRAHHBAVU0Pkpyse0IucrOB5D4n+Daf8jpj7Bj2EWj+vrxkQlGPRMy6jQC+ZnU2tAkC1me4ftS+O
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlJad0FuY1A1WEVXdFh4NGJvZXNzeG9WcDYwL1hNc25tTnUxUEp2UTZCNEtN?=
 =?utf-8?B?K296dFE3Tk4xc0JxRGFTSU9mV1ExeittcERPSUpYWU16VkpsSUhCbFByNThs?=
 =?utf-8?B?c0Q2VkhDOEZXQ3A3WVVwSmZOM1MxU04xU2Q0QnN4L3VBaFd2NVpxUVBweDhv?=
 =?utf-8?B?ckVzVzJ5dTVNZUE4aW5TMnpxc296eU9ROEp6TUFPOVdybzY5OENEYVdVMFhl?=
 =?utf-8?B?a3U5Vllvd2FmRHQzYVpUV3VvS28rSEw4YjZTMnMwNEJOL2RlOXkyTndZTisy?=
 =?utf-8?B?ZEFCOFEzZE1kaGtURHRGSjByRUMvZ3h6RGhPLytUN1p4NHRBYURENSsrMExR?=
 =?utf-8?B?UHJINEdrL0ZUcFZiTk5jNFVYaHRHZ2R0WTRXQzg2Ulhia3hvSjRuNGpaZXRI?=
 =?utf-8?B?NjUwbXNaRVh4V2ZKTWZoT1luNW1QS1ZoUld1WG9JWW5MbTRyb3BjTEJjT1FG?=
 =?utf-8?B?VEJBZ1hLMUlwREFmUDY4WWJzVG5Na3FHVWFaamdTdU9KTjhKUHl4RGQvNCto?=
 =?utf-8?B?K0h2NDU5YlFaWWJIa2pBNUU5RGRwaUdTblllMWR0cGF3SVdNTktnczRjN3dH?=
 =?utf-8?B?Rk1rM3VlUFJNMFpSOWNHdDFidGVWaWJBMG9iQlNJTFJ0WWJTOVorYXlHUFpi?=
 =?utf-8?B?UnR1bnlWRDZiaU5DTHlEN0NXQ2hqYzJ0MTgzemtXRlMxa2ZhdkhxMWhZSGxq?=
 =?utf-8?B?RkI5YjNJS1M4YWNvVnFDbzBxS1RFb01uSVZBc2R3Zjg3M2N5aWJFKzlUbjQ0?=
 =?utf-8?B?TnRKQXJQbjQ3T2lQZCs2NWQzM1gyeG5ZUG1xODBwbitUSmppbTFubERYVUtI?=
 =?utf-8?B?OGpqNjJ6L1V0N3BxZ3N1R1drdDZmaCtsOEhKTVRHZ3haYzVjVysvUzYwYkpu?=
 =?utf-8?B?eHhQZHlwWXlDVC9lcFk5MFAxT1pwWnJOS2JXd0F6T3oyZnFORlNZdm1Fb0lV?=
 =?utf-8?B?MEhCS1FaaUk4cDNPeG96SU1jTmJXYWNxMHdGNkdJNC9VVjVIalh6VU1iUFo1?=
 =?utf-8?B?MTNKV0JhMG9PWnBwVHh6R0pndmtKZDNyR0t2NmtzcG1GSHdIZE9QNGt4WG5S?=
 =?utf-8?B?QzBjb2IzMFBzdU9HOWd1OEdkV0FmekdoUGQzcWs4eWlvOTc0RkVFVlhBYTV4?=
 =?utf-8?B?QXIzREtTQlU3ZnFmRmFRcXVkc2JQbUlOUFJleG16VXpYcGNMOVF2TnhDenVX?=
 =?utf-8?B?VFF6dTZ4WnhPRmVuYzJuT2lkY1JHK3dzOWZBT0ROL2FjcVpkM2dBcm1OZVNO?=
 =?utf-8?B?TmcxVlRwREtPSGtSVFBsYVhPeXdja0t0N1Z3bkk0OFFaVTlIUGM1YjRXelh3?=
 =?utf-8?B?VjhhMkVQVHgvQmE4QXR1Z1lmMWJoY01aalNhY1hRZmwxNTVaU2REUlpuUzdQ?=
 =?utf-8?B?SlRmaVZIZ0Z5NTVnU2k1T3FSdXZZYWR3aGVONytpN2x5d24yMGVINlhxYi9E?=
 =?utf-8?B?RU5XSlF1M3RXYjFKU1ZVcXlJc3BobG4zWVNZRjIycGxTQkovS29JaVdEV21E?=
 =?utf-8?B?ckwyb0dzQzB0VFUyWlJSelRtRlpISERRTk9hQ2JCUVpobE5vVzZaK2xiZ05J?=
 =?utf-8?B?S0tUQ2xtMG5QN3FKOXljL3JXUlFLNy9BcitlODVyZzBJVHhjQ3VuWUo3Wm94?=
 =?utf-8?B?Q1d0eGF3ZG1EVW9GMzVMcUg0aVdiUW1wSmVxYmNTbXBoaWZEcjRXeU1FNlJS?=
 =?utf-8?B?S1Q4eEVHbUZBMWZtOTRRcmhYbXlCUjk0QTVlZG50bHhEcS9Ub1NJa3JwM0VC?=
 =?utf-8?B?TWM5TXZVdTJua0d3NnlzNUNXZS9TUEZ3Ym5nVUFQeGo1cXBzc0RVK2Q4bGxu?=
 =?utf-8?B?SURVczk4NzRlRHFSQlVUUDZ0MDF6Wm0zSzhKOHBTUmhiSG9rVjVDN0RhdFR6?=
 =?utf-8?B?akxjYjVjeDZUeVpLYy9VQ2p2WFQ3OVR6QVlrWnNlYytHTG56YXFLTEYrVnhT?=
 =?utf-8?B?d3dpUmFJOWNqaDFCL0JDMW45NnRnWjVtZ01pblloc3RFQVBsL2NZR25JZ3Fq?=
 =?utf-8?B?ZkZMV3IvRzRVNkdRUUJSM2V5VS9YR004MVd2Zk5GZGtiM295cTJoeUZ3VE1p?=
 =?utf-8?B?cGFRQUVJd1VEamlwbDJPZEx0YlZEMUR3OG9vd2t6L0Y1c1BHOE5CRGQvMFJv?=
 =?utf-8?B?amZTV0ZkWDI3bjhwdXF6SFFhWFp4UytNLzNPcmorYVUyL2gwQk1sRzJHQ3lV?=
 =?utf-8?B?Zm81T0E4UjNzSmVyWUpSSjdYMXUrMGJXaEdjOXNpaDdEZ3RGamNhVU9iRG1B?=
 =?utf-8?B?WERlZ1AvcGtQbmR2ZzdINk82d0pmVkVieitROThlK2xnL0J1ei9mUi9yL3RN?=
 =?utf-8?B?RDVFTGhSVkNxNVd1bnhQRGdnUVBCOWdIaXRoUHhYZTBGN0hVSnZ1dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0137600e-8f6b-4058-d7c4-08dec5487637
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 10:26:54.4625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8V9YHJC8CgSxJwcYz1aGMhFqEPp+spil8tLQiXVKHCzuJhro4a+oRdQftD28BkO7DLJGeKprxw3627WturYpSOLXXj6wvPHW0Ms0GwHCDW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13905
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33652-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 153A2655655

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwOCBKdW5lIDIwMjYgMTE6MjINCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHQtYmluZGluZ3M6IG1mZDogc3lzY29uOiBNYWtlIHJhbmdlcyByZXF1aXJl
ZCBmb3IgcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4NCj4gDQo+IE9uIDA4LzA2LzIwMjYgMTI6
MjAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gT24gVHVlLCBKdW4gMDIsIDIwMjYg
YXQgMDI6MTM6MjlQTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPj4gRnJvbTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+PiBBZGQgYSBjb25kaXRpb25hbCBz
Y2hlbWEgcnVsZSB0byB0aGUgc3lzY29uIGJpbmRpbmdzIHRoYXQgcmVxdWlyZXMNCj4gPj4gdGhl
IHJhbmdlcyBwcm9wZXJ0eSB3aGVuIHRoZSBjb21wYXRpYmxlIHN0cmluZyBjb250YWlucw0KPiA+
PiByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbi4gVGhpcyBlbnN1cmVzIHRoZSBMVkRTIGNvbW1v
biBjb250cm9sDQo+ID4+IGJsb2NrIG9uIHRoZSBSWi9HM0wgU29DIGNvcnJlY3RseSBkZWNsYXJl
cyBpdHMgYWRkcmVzcyB0cmFuc2xhdGlvbiwNCj4gPj4gYXMgdGhlIGRldmljZSBoYXMgY2hpbGQg
bm9kZXMgdGhhdCBuZWVkIGEgdmFsaWQgcmFuZ2VzIG1hcHBpbmcgdG8gYmUNCj4gPj4gZGVzY3Jp
YmVkIGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+PiAtLS0NCj4gPj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwgfCAxNA0KPiA+PiArKysr
KysrKysrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
c3lzY29uLnlhbWwNCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L3N5c2Nvbi55YW1sDQo+ID4+IGluZGV4IDljODEwMTBkNWE3NC4uY2JmODNhMDZhZTI1IDEwMDY0
NA0KPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nv
bi55YW1sDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQv
c3lzY29uLnlhbWwNCj4gPj4gQEAgLTI2OSw2ICsyNjksOCBAQCBwcm9wZXJ0aWVzOg0KPiA+PiAg
ICByZXNldHM6DQo+ID4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4NCj4gPj4gKyAgcmFuZ2VzOiB0
cnVlDQo+ID4NCj4gPiBUaGVyZSBhcmUgbm8gY2hpbGRyZW4gYWxsb3dlZCwgc28gcmFuZ2VzIHBy
b3BlcnR5IGlzIHdyb25nLg0KPiA+DQo+ID4gWW91IGFyZSBjaGFuZ2luZyBiaW5kaW5nIHdoaWNo
IERPRVMgTk9UIGFsbG93IHNpbXBsZS1tZmQgb3IgYW55IG90aGVyDQo+ID4gY2hpbGRyZW4uIFJh
bmdlcyBpcyBub3QgYSBwcm9ibGVtIGhlcmUuDQo+IA0KPiANCj4gQW5kIGlmIHlvdSB0ZXN0ZWQg
aXQgb24geW91ciBEVFMsIHlvdSB3b3VsZCBzZWUgdGhpcyBkb2VzIG5vdCB3b3JrLi4uDQoNCkkg
ZG9uJ3Qgc2VlIGFueSB3YXJuaW5ncyBvciBlcnJvci4gSSBoYXZlIGRvbmUgdGhpcyBjaGFuZ2Ug
YmFzZWQgb24gUm9iJ3MgY29tbWVudA0KYmFzZWQgb24gc2FzaGlrbyByZXZpZXcgWzFdLg0KDQpJ
ZiB5b3UgYWdyZWUsIEkgY2FuIGRyb3AgdGhpcyBwYXRjaC4NCg0KWzFdDQpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjA2MDEwMjI2MTkuR0EzOTYxMzI0LXJvYmhAa2VybmVsLm9yZy8N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KDQo=

