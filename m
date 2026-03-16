Return-Path: <linux-renesas-soc+bounces-29484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIjSFej+t2nrXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:00:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F308299C2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75DBF3013C8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84929399373;
	Mon, 16 Mar 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LOPGh2Uu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204583976BB;
	Mon, 16 Mar 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665908; cv=fail; b=jpTLchqsoFe2sYfUKaOuYeFdBKyGZrOzWtCilhJMu4NQUSrduk4+UB6heM/uHV6f+a5EOOMhTsluUYzLFqUPlLQC/QIJMXo7Ho1XQopA/BTaL8EDPGQpyJ+n4M5uuA0MQD+GW38jUu2SNtTxzPgfI73B/vucEAVEpuAp7kn9X8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665908; c=relaxed/simple;
	bh=F7g3D1PdiLM4o+J1sRFRe+P02ZmYpyyLJOcEvpwPxEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xkn5clewcCrQm7HJZHhrUB6OvDSf05YejUNuaM35uVb0hyEaIaFx+aNq7mWACOOhB7FrB0IhV8YwUPunWBKn0rHnpZYGvCSOhUj/OhE3rCwuLp2IsH/r5TIdguTzqQFZJVdx1475otY+nRIubIfHJL3Ev4FdxdL752/oTzEhHac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LOPGh2Uu; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHCIFvfOJGy3SO/JjjkkE9DvqpiaJQZPsYPdUDfowQ+9iLvdGJPjp/T+N3JQqZ6EPhsjZRE4YmLBXpygmAPFK9vaSed5LrOCHejioPL8g+Cxa7Gt09txbkv9BvAZqPvgCUY7TVfb5DE3jUbv8ilAHxYzfIyT/H0QwpMpSfXhNwhjY8mKQXmxZH1WBpYERSHRnLt+lfGM5WnOvKX6ez3RYcDqvICZJQhRl0pHRIro2RIK/jE1bm/Mhm6PMztG7jn3ADJJT16ujVWebLCDWXkmd2BeeBWvhHhAUvSUP0YSQLMHIDQLFniNDT4r415bJOknioDXtcCQr7w9a2DPQokjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7g3D1PdiLM4o+J1sRFRe+P02ZmYpyyLJOcEvpwPxEU=;
 b=s11zWCDZ73wIAhW3FXFVrWi3CmYSWfH/F4YIzAopMzNTZ5p5mhoKObMgPERQEvnLJmCG/8vii6YmZUa/NZs5f6AIZQYxPLNpaOc1AEagNHd6X67lEEyUd8qd099INW0iCJy3/foLMO4tlhl/mKJZlzjTTZ2zPiW2y3HRPMEx3kZwmbC38jF0LJvo77hNwegT8L9UJ4TSQauqBTCB8VH4bN50IwPPRinkfp77CAGlb7ByHXg7fOFWU8mhvrcPht32J1ye4YtlgTssLe9l+WI3ksg4xV+SawwXYokvWgcbQ8Eh5Lykl/r3xICqlQtCeVBBAdq6faCUDpuAFvT9ly+vqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7g3D1PdiLM4o+J1sRFRe+P02ZmYpyyLJOcEvpwPxEU=;
 b=LOPGh2UuWb5f7wBMLdBaman7kdOAurDD7WefpiB7+x2jTZ6Jmb4nVjAi00ou0G76w3ByFd55N6hbncneX1FCAMuD+4o95t8EAjsnXASuwIStZcwm5pH3gu3T4OEyOHaUd056WOFzm1seZ6gpC/68lqYPPXAYJ6BQ0dsuoP+e1Wo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB16981.jpnprd01.prod.outlook.com (2603:1096:604:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 12:57:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 12:58:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, geert
	<geert@linux-m68k.org>
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
Thread-Index: AQHcswgXxNnjGhc1/UeWMH+iCL4MUbWsrS6wgAQyogCAAAJMwIAAOwEAgAAEaOA=
Date: Mon, 16 Mar 2026 12:58:05 +0000
Message-ID:
 <TY3PR01MB11346B2FDD4E9CD1DC1A1BED18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
In-Reply-To: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB16981:EE_
x-ms-office365-filtering-correlation-id: b6036515-443c-449d-912b-08de835baa52
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 pYYBiJw3fj3tIPMfJTaqm1jXCkymP7D+not30pexAhMP6vhnJ8xB+LHyA5G0XWm3uDhvoutd/G3BCEHV3+5sHtwjWUXzwwepYFKKEfzxF+PQIjCBXNwPzGmHNQFoRFOyCfjBwx6G0AoH/36e8ZQZwgIzDRcidt79DyZh6qM0UDbx1UmaeM50ZNRwqF536J80yNKb8+bRpRZjZYINbCacWAde/2NwwaFfP18wLUuizJte5f9hLBAcxn0StPtstPysEdmrTbxMDHDwWs/6/t9VHMOrK7ZEdV8kxHbFcTuUVlRBUyWnhjFGQwfd5JC4HxSbQ2+EloWR/QaI/hlSqgnDfZrnITf+nM/JtAC/i3iZCgwXwAGJcO8wmCO9PNZVcpCQTCVodu4a+AxtiOpXvKPbr8oF93qy3/DM3WriSbPHpr6BX8vtP9U2Ad7pKWqhSVZF/eIWCAQ+RqU6qGxXX2w+phiGBwzjjEfgQOfqoM2vVX3UtmAj0OZvyGYCSRZd0Wu0wzWEp/VAlRupX2YhvqqeTyFnFTUFxyCtJUgEjPUpBqxNRdxs/vv+ayc1HNyZNnLTkygVQFhl9uBH34CO0UhxhZIi+UPrlxiLU5X5NwX45RYjaQf0IYKWzG54LZpsc05vD8yLZ5IlBqyIuYzNF5eE9N0RV96G3OAVCkASUWJ8VL9TecEixKKoxrBt8/hVSPncsuh7zQDQ2FXgrJrqQtqTGv91EQJHXUtM92jTJ0C+Y1yy5QhmbyzzlY6EClMie0Ss
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NytIeXYyMXlzQnkzYUV6YmorSmZjKzNNaHVmZVlUeTFSVTFHb25zRDZDWHBr?=
 =?utf-8?B?bnZCTjUrNDlJY0FWclVUNnVMY3JoZ1hUUDBrS2tTMi9YVzZtYkQ5UWdaS01j?=
 =?utf-8?B?cm9BMjVsdTFuNFVPOVZxR1FqQWwyaWpHS05YQmNXdlAydGVKSDJjSDNkektX?=
 =?utf-8?B?SmRqVU8ySm9GOG44cVpnSFZtMjZXN1Z2akNqdTl1VktZK1lPTWxjdTZ3NmJ4?=
 =?utf-8?B?VDk0MzhETXVmb2ZSM24wMzQyRWVmZU9FQlNBbHpjcUFWS21SaE9EMmhBRGVt?=
 =?utf-8?B?dFBEZWlxSVhzTnJ1b1YzOW9iMEJqUVluV1hSWUloMVllcmFFWUZlclpwVWpm?=
 =?utf-8?B?OHRVb2llTHh0dXEzd1pKb3Rtc3M5cmU0c3B0NS9UdlYzZGx6OG14dVlWTlZI?=
 =?utf-8?B?TkduQUpwZGxkQnhGU1VSTzlQMlZIb281WFVQQ05Dd1VGalJaMFNVOUJlVjVa?=
 =?utf-8?B?WlVTYTkzN0NCTEdKeTZZd1pvdVNTWEJ6bzJlNGIxcVlyclVlSE5XN0xEcGJU?=
 =?utf-8?B?TXFXN0R3S3hnYmE2WnMzT0psaTNFcGhpUk5FNkswT2NiVVRzMGxMM09XSUFW?=
 =?utf-8?B?S1JNeldodGJFc3hjK1hFZ1RJdElGV3hsOXIreHpWUXF3Y3pwRXVJR3NhY01X?=
 =?utf-8?B?cWl0ZjJ3S3E5UGxIaDkwZC9LWGE3ZzVGNHAvUUhxZjA4MU5OOGhjTHNhOW04?=
 =?utf-8?B?TFR0cEpjd2FZNnYyZ3paUkZzay9SQVltL1hTckdvT25LZVlGZHFxQUhsbU5z?=
 =?utf-8?B?M1ppQWRoWDJvM29nVWlNN3J2bHBoQW1hVURYejF1U2lScEsrTnduRkpVMzgx?=
 =?utf-8?B?bmRhNHRBaDdaY2lrQ1NIUXhDSWFFNmEwNTY4WEQ3UDVRQ095L3F3ODdLUDI0?=
 =?utf-8?B?Y1RjYzhsbUhFMnpTVUE5QVZ3SUJTU3VHOWUxM1Jtd0p2ZTBBYkVwWVdVWk1l?=
 =?utf-8?B?TnowL1BMWER0ellXcFBhTGtNR1dWSk1SeE1IL3FMVkMzV2xZcWkyU3JKeER3?=
 =?utf-8?B?VnFGNEQ2SnFBeXIxczltZDNLU0NuM09YY01yYkFIbVcxUm95dmVUQkEwWUhv?=
 =?utf-8?B?Y2Z1aU9DcDN1V0tiNGFSWlZTOGNqa3p5ZTFSSFJ2cmtVSWliWi9rdGhCbW5S?=
 =?utf-8?B?NndneEc2R0kxZXdxeGpBNTYwUkp5OGQzTkxQSGl4SnZJbG5YRFhMTXVWalBX?=
 =?utf-8?B?NzY0VXBMZ2N0ZmY0NUhXNTNkUWViL2hZRTVoVVl6WlQ1QnJKUFNPaTlvandJ?=
 =?utf-8?B?SGRzYUw0bm9nT1VtNnBVTm1wcG5JVnNhcWhMOGpFRlgzaEVOQzF4RlBQRzJU?=
 =?utf-8?B?WG1ESEhFTHVqa3NFVnh4ZWVXT0hkUTNwZnFUcEtxdVltZ09YOVVKVHFjN3Jl?=
 =?utf-8?B?NFExbFJHRXJHQThJd1lkYmdkZmZWa29PYnhRVlBwOHFpdTh2VVpmdEJxRmRm?=
 =?utf-8?B?VFJBL2krb01ZbTBZTWdKWXVRSVJzNmpKQldPYm5wRjRSVjdTNzVOYkwzaURQ?=
 =?utf-8?B?SEM3SXFGZ3lwY2JyRUZFSVY5Ujdpb3E5dnlFbVNNYUdrRExoMmxVMFlseXkz?=
 =?utf-8?B?NWk3cG4vOXZna0l1S0k4eUZyQWpYTDVPTThkZEV3TS83VGZpQVFLeUNrR3hI?=
 =?utf-8?B?YkhaOUltbGI4bkZZWmg5TUtKbzlLZVhHaW1OVmlmbnRXQTZiek9MOWlGRlRK?=
 =?utf-8?B?RHkvWVJPb21GVUgxZnU2akpyQlgxUmN3eUNXaStDcjQyQXR3NVZKd2RnNitH?=
 =?utf-8?B?YnRRU0I0ekFqV0RtQmhhYStGQXM3cmZPOUxYZXR6WjRVTW1Jbm9BN2wxTHBs?=
 =?utf-8?B?dEYyYzlwdTU0UzFJaGpQeEZ4cDBZbmdjNUR1NS9lSG9JcU1DWDRTclZUM0I1?=
 =?utf-8?B?WmVoK01vRDBpSUtTdEtrVUNrMjhia0E3U0RPMWNVbUhxZXJGRURIUWRUYjVV?=
 =?utf-8?B?TnRHa0lrME9VMlZOQXB5R1pOa3NKbXcxUmRZUzJ0ZGxGNTA5Mnd3dWV4elpJ?=
 =?utf-8?B?U0tMUlFoVk4vS09Kei92ZUlWMmc2NjNhL0wwYktlSm5MRzNzY1A2RUJiZERM?=
 =?utf-8?B?VlZOTnlPKzhyQUNRN045UFJsVDJhTDYycFBGSmp1REZBU243cWd5bXQ5UGdl?=
 =?utf-8?B?L2FSS3d5N0o0OEphYldmUDdFb2FWY200aURqc2U5b2VqM2V2V0hSU1RmL0V6?=
 =?utf-8?B?cnNFVWJyMWlJQmFjcjc2dld5Nk10OHBHQWw0b01FRlRicVF3RHRHMytQK1Rt?=
 =?utf-8?B?S0o5Qk9lQTBMUk9TY2crVFFpa1ViSnpudm5TYnREVXU2c1g1dlhzVXdWWGph?=
 =?utf-8?B?djJrbnB2em9uWklnOSs3enhZeW9FVlBOanl0NnozM3hxR2c0WC8rdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6036515-443c-449d-912b-08de835baa52
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 12:58:05.5662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wX8XCIlGmidAchU+Nno/HRT2BQiYad5TqnC3enVfniQoF+6v2etn+pDeAzp3a2nss6/xNMTqs1Fs8qmWPXlJBUWM9nCJmufL6oXOZ8H7RPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16981
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.infradead.org,kernel.org,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29484-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5F308299C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFy
ZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KPiBTZW50OiAxNiBNYXJjaCAyMDI2
IDEyOjM3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC80XSBhcm02NDogZHRzOiByZW5lc2FzOiBG
aXggUEhZIEMyMiBjb21wYXRpYmxlIHN0cmluZ3MNCj4gDQo+IE9uIDMvMTYvMjYgMTA6MTEgQU0s
IEJpanUgRGFzIHdyb3RlOg0KPiANCj4gSGVsbG8gZXZlcnlvbmUsDQo+IA0KPiA+PiBUaGVyZSBp
cyBhbHNvIE1hcmVrJ3Mgb2xkZXIgc2VyaWVzIChbMV1bMl0sIGFzIE1hcmVrIGRvZXNuJ3QgZG8g
Y292ZXIgbGV0dGVycyA7LSkuDQo+IA0KPiBZb3Ugc2VlbSB0byBiZSBjb21tZW50aW5nIG9uIGEg
MC80IGNvdmVyIGxldHRlciBoZXJlIC4uLg0KPiANCj4gPj4gWzFdICJbUEFUQ0ggMS8yXSBBUk06
IGR0czogcmVuZXNhczogRHJvcCBldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMg0KPiA+PiBmcm9t
IFBIWSBjb21wYXRpYmxlIHN0cmluZyBvbiBhbGwgUlogYm9hcmRzIg0KPiA+PiAgICAgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnLzIwMjQwNjMwMDM0NjQ5LjE3MzIyOS0xLW1hcmV4QGRlbnguZGUv
DQo+ID4+IFsyXSAiW1BBVENIIDIvMl0gYXJtNjQ6IGR0czogcmVuZXNhczogRHJvcCBldGhlcm5l
dC1waHktaWVlZTgwMi4zLWMyMg0KPiA+PiBmcm9tIFBIWSBjb21wYXRpYmxlIHN0cmluZyBvbiBh
bGwgUlogYm9hcmRzIg0KPiA+PiAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLzIwMjQwNjMw
MDM0NjQ5LjE3MzIyOS0yLW1hcmV4QGRlbnguZGUNCj4gPg0KPiA+IEkgaGF2ZW4ndCBzZWVuIHRo
ZXNlIHBhdGNoZXMuDQo+IA0KPiBUaGV5IGFyZSBkZXByZWNhdGVkLg0KPiANCj4gPiBJdCBkb2Vz
IG5vdCBjb3ZlciBhbGwgdGhlIFNvQ3MvYm9hcmRzLiBJZiBNYXJlayB3YW50IHRvIHRha2Ugb3Zl
ciwgSGUNCj4gPiBjYW4gc2VuZCBuZXh0IHZlcnNpb24gY292ZXJpbmcgYWxsIFJlbmVzYXMgYm9h
cmRzICsgYmluZGluZyBjaGFuZ2UuDQo+IElzbid0IHRoaXMgc2VyaWVzIGVmZmVjdGl2ZWx5IGV4
YWN0bHkgdGhhdCA/DQoNCllvdSBoYXZlIGNvdmVyZWQgb25seSA5IFNvQ3MgWzFdIFdoZXJlYXMg
dGhlIHBhdGNoIHNlcmllcyBJIHBvc3RlZCBjb3ZlcnMNCjQzIFNvQ3NbMl0uIA0KDQpbMV0NCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDExLXYybWV2azIuZHRzDQogYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzAxMS12Mm1ldmsyLmR0cw0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9iZWFjb24tcmVuZXNvbS1zb20uZHRzaSAgICB8IDMgKy0tDQogYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Nm40OC1yenYybi1ldmsuZHRzIHwgNCAr
Ky0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYyaC1ldmsu
ZHRzIHwgNCArKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLXNv
bS5kdHNpICAgICAgIHwgNiArKy0tLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpn
MmxjLXNtYXJjLXNvbS5kdHNpICAgICAgfCAzICstLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yemcydWwtc21hcmMtc29tLmR0c2kgICAgICB8IDYgKystLS0tDQogYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpICAgICAgIHwgNiArKy0tLS0NCg0K
WzJdDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2JlYWNvbi1yZW5lc29tLXNvbS5kdHNp
ICAgIHwgMyArLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvY2F0ODc1LmR0c2kgICAg
ICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9jb25kb3It
Y29tbW9uLmR0c2kgICAgICAgICB8IDMgKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L2RyYWFrLmR0c2kgICAgICAgICAgICAgICAgIHwgMyArLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvZWJpc3UuZHRzaSAgICAgICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9ncmF5LWhhd2stc2luZ2xlLmR0c2kgICAgICB8IDMgKy0tDQogYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1yemcyLWV4LmR0c2kgICAgICAgIHwgMyAr
LS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAtZWFnbGUuZHRzICAgICAg
ICAgfCAzICstLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk3MC12M21zay5k
dHMgICAgICAgICB8IDMgKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTgw
LXYzaHNrLmR0cyAgICAgICAgIHwgMyArLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc5YTAtZmFsY29uLmR0cyAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOGE3NzlnMy1zcGFycm93LWhhd2suZHRzICB8IDMgKy0tDQogYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA5ZzAxMS12Mm1ldmsyLmR0cyAgICAgIHwgMyArLS0NCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU2bjQ4LXJ6djJuLWV2ay5kdHMgfCA0ICsr
LS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay5k
dHMgfCA0ICsrLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtc29t
LmR0c2kgICAgICAgfCA2ICsrLS0tLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcy
bGMtc21hcmMtc29tLmR0c2kgICAgICB8IDMgKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3J6ZzJ1bC1zbWFyYy1zb20uZHRzaSAgICAgIHwgNiArKy0tLS0NCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kgICAgICAgfCA2ICsrLS0tLQ0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yenQyaC1uMmgtZXZrLWNvbW1vbi5kdHNpICB8IDQg
KystLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9zYWx2YXRvci1jb21tb24uZHRzaSAg
ICAgICB8IDMgKy0tDQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3VsY2IuZHRzaSAgICAg
ICAgICAgICAgICAgIHwgMyArLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvd2hpdGUt
aGF3ay1jcHUtY29tbW9uLmR0c2kgfCAzICstLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy93aGl0ZS1oYXdrLXNpbmdsZS5kdHNpICAgICB8IDMgKy0tDQoNCmFyY2gvYXJtL2Jvb3QvZHRz
L3JlbmVzYXMvaXdnMjBkLXE3LWNvbW1vbi5kdHNpICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJt
L2Jvb3QvZHRzL3JlbmVzYXMvcjdzNzIxMDAtZ2VubWFpLmR0cyAgICAgICAgICAgfCAzICstLQ0K
IGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjdzNzIxMDAtZ3ItcGVhY2guZHRzICAgICAgICAg
fCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjdzNzIxMDAtcnNrcnphMS5kdHMg
ICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjdzOTIxMC1yemEy
bWV2Yi5kdHMgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc0MC1hcm1hZGlsbG84MDBldmEuZHRzICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc0Mi1pd2cyMWQtcTctZGJjbS1jYS5kdHMgfCAzICstLQ0KIGFyY2gvYXJtL2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc0Mi1pd2cyMWQtcTcuZHRzICAgICAgICAgfCAzICstLQ0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0My1zay1yemcxbS5kdHMgICAgICAgICAgfCAz
ICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0NS1pd2cyMmQtc29kaW1tLmR0
cyAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0NS1zay1yemcx
ZS5kdHMgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0
NzAtaXdnMjNzLXNiYy5kdHMgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5MC1sYWdlci5kdHMgICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5MC1zdG91dC5kdHMgICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gv
YXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5MS1rb2Vsc2NoLmR0cyAgICAgICAgICAgfCAzICst
LQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5MS1wb3J0ZXIuZHRzICAgICAgICAg
ICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5My1nb3NlLmR0cyAg
ICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NC1h
bHQuZHRzICAgICAgICAgICAgICAgfCAzICstLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc5NC1zaWxrLmR0cyAgICAgICAgICAgICAgfCAzICstLQ0KDQoNCg0K

