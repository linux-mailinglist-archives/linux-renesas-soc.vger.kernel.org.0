Return-Path: <linux-renesas-soc+bounces-29297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJTYHZ7lsmktQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:11:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2A275455
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964C03290EB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A648D3F54DF;
	Thu, 12 Mar 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BpnFb445"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D73F54B0;
	Thu, 12 Mar 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331231; cv=fail; b=juKVi4i0s+EFVGQoJaf6x0nMeNxqmaTqJbbHNzKePq2Ck4QcTXyjN442V2YQ2kzZzdvBp3gXUyTm57abAL5eZqv5Wj5lsr9Zsl9wvyydd350okdhCY4aEkCoT1KmZLS+Qkx2CoJf0NEs8B5JySKBxcNo2/mgiOHxn/PLmDCqOfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331231; c=relaxed/simple;
	bh=z3aAcSpElEoOY5sUIvRonqJpWMivpPsl6fcCTR0Wso4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ed4dBHjjAi9bWWFca09/UlWK3MvNdz1PPJgiFjLUt2TAEydZ6unYhOInQTQPryDL2YQOPO1x1HIH3Lx1e+91D9Y6OnhOCPBWhxtiS/OjwkXLOCzQITNF8J/znvkDVfZH3AEw9lKOWaFlXMz/1vUKIE1af2joIhLXiN2DrqI62Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BpnFb445; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXVfN8qHKruXPCLrw/x0v4BCFG0MPuqozFP4cpEsYNQFYzAXJD3CPsl0dRrtsBqf27gPkQTLMcH8cDIBZMMbd3CIXoN5yObwkYMUJqTO5d1u2k6/zopAqW/zxbteAVbe4+SpHfSSTLAnsN35Ht8a/J5kWm0SsWTDRgl0O1ieAtaiqPAXo5qG6xexBJE5v+3OzMtxwg0EOmHgwjv/X/UUoxVxYtb7U53ayNU9HZ8pkuvJDpAz6Sg5jXWsKXMqGIY11+2eIzTK0BykGxoucHE9Z5saXiJbg33bAB2WqRCAGQ5AXT0RlIousnHlgruLKuG4y9ixz8Nkn9zDfcVk9yM98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3aAcSpElEoOY5sUIvRonqJpWMivpPsl6fcCTR0Wso4=;
 b=gGbii4TiUHFaRzQBRogyOpwOYtw6YnR5b4GwNLSW/x4vIF1qgvM2VafKava3Yl6sPkfWKq23qTm5LrFpMbXBaIHDuruUMWKNbLZhmTLnWR4tkk/1AGqcOXvMqYsMKrP+thp3tknCT2eRL5CZujZEe4zO+Nsp+ntRjKjrKyS3u56atdDZEUgfYC4lUJxuLzu4OXZtx1xWVr7sQOK/3E5HLZYbOG2IuGeLkk6K3MtitSQOdA0UCfR/YgmUjSA/R0HRMWz8g3x0LML3pEBs7RHGJLzarmsFusNNIrsfvGzdSVNR+CxbeOcP8vppM48JNr7BL0VfBqvqgpe6kXFNuwVmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3aAcSpElEoOY5sUIvRonqJpWMivpPsl6fcCTR0Wso4=;
 b=BpnFb445ZCA0jcoNHMMiPf+uN0IYh9kh1OZDtkVg6509YNG7zlblU1cPmeyweUc2uwOGdHFF7ZlSrOGafGDFlpgkwoXLFtZ0Nn6oorfgoN4Wy0J/zlQu83ys0r6hqpZoCGF3IN3h/AU9VVejNrb0OUdILl/fc/Nd/shCep/5vPA=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB12872.jpnprd01.prod.outlook.com (2603:1096:405:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 16:00:18 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 16:00:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stefan Eichenberger <eichest@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Thread-Topic: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
Thread-Index: AQHclQcRZ95CLxaU3UmEg4/YkLVjErVxjuiAgAC09sCAONYMgIAABD8g
Date: Thu, 12 Mar 2026 16:00:15 +0000
Message-ID:
 <TYCPR01MB11332068B2A70F52A3963016A8644A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
 <CAL_JsqJK3brXxSeD-U42PBCeHoxUhWJYho3ZWj__t5C1LL-n-Q@mail.gmail.com>
 <TY3PR01MB11346B87DF83086FCFE19B15D8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdW7GeCF-xTNpRRNEBfzbqUA8ZNqFxctT8zufdRHkvSiAQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW7GeCF-xTNpRRNEBfzbqUA8ZNqFxctT8zufdRHkvSiAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB12872:EE_
x-ms-office365-filtering-correlation-id: 3e106524-d3d2-4aeb-7ed6-08de805073ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 1+ZMRWhPdju+M7FYMHUmbE+/0pE8nKvttMjBiSKEL6yqemxWoUZ99URiC5UXMGoYK/qj4OxR5qFzkGfXCGNDz5CFynk9LKOYYdwwcXSY4II0+lT2dQTKf+upL8PbTxO/Lv9swRyv1cOo0FzcolehvaJTWEJWW1rXXjmwOKHqr1BT13XSFm+uE04nVfU6G+6UpLy34Lyx+LuMfmGxEcHfoQv8/ABdQJc3NxNsn3VoA2g4sHO2K5MQ/HgafrUIMewoAPPuj1NxLVYAKJGDkQxmfYeg1P1+jiV7DL+L9WewXO0CJAqpO73UiJM61eGYzbaN4zLcT9zFFhZmyj2XvTjv999aM77Ju8XVGIhrctKlEKj6NTTGTXyh9FSzT6znzwdDH2LeHdmD8neiicbED80mrFcw49rILSSoGfmAE6DTxNS6S5ogsnBtg+LJ/wOuGljD503EK0dXtkvyHuFSEjJ4G9Yw4Il1aQ4D2H+wnfXUyszVzrzDS6g5nIGjdBLS3iCHmQfOEgNRAZ+1eCLCHMkQ727M8FGVADVXK7djlTVkh/pneXZUkVQuuufGtXP1jJkfYJyi34okMp2P1vylhL8Rh3kdwiM4AvECU+SDd2mwuKlrjzF2zc2eFNRneV1qm7TP+0+T5Jkqb/Hb7oikX3w/rp16AP3rdFEH6vXpyDmom9Rfm84wzM5m93xpbT09C3/OQPaoTuP/z0f8pjx9N+ocz2y+D2P4t1IhZI/ByCmxFSxyTwFmcaOFU1ZIqBx1mUUExM4S/M3JglNG7b6WQRuh874wN5ElEhU8j9GSSuNNZf8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUw4MWtjQ0wyd1psZldEeU1mcGpuVDZWd044U1V0Skdjdzh4THBLMm8xU1lF?=
 =?utf-8?B?VzZXQng5cVljU3FheVU3MVdaWExjWmRlWXVVMTFraVNOKy9lekE4TVkxRVZu?=
 =?utf-8?B?TlhDK2RvbGtnbzJOMExnZnVjQWo3QU9WWG1xTzRob3dmejZVQXF3M0UxWm1L?=
 =?utf-8?B?QnAvb0RtbGRjdm5uNGpVUWIrSFROWjhwY2N3WG81Ymg2Tm84d0hDVU9wYVFF?=
 =?utf-8?B?Q0JOakxFMXlBTEFXL0hWQTlkbFJhN3RFOU5KVEVGQm1wa2hQcWFHMzNFakRs?=
 =?utf-8?B?T0VJb09PZm90N3dYL2FZNXlqQjNUZnZGS0tOdWc2Nm05a200UnNvNThNcW8x?=
 =?utf-8?B?bkNTVU1qd2ZMYnFFdWtETmEwRHhycXo1cW5RclZpczM0MCtqOWNSOUgzOTJt?=
 =?utf-8?B?N1lkTG9McVRoVFVpOXlsWm5INkNpVG1uelFrRjMwUUVEQkdqRHV4VzEvM0pD?=
 =?utf-8?B?YzdybkpvSUgzRHh1aTk0RXh3anphc3l6bElrU0k3SklmdWl3Kyt1V2M5S3p3?=
 =?utf-8?B?K0lXalFueFhVai9Hd2UrZnV1Z2l2Z3dVWWdxRjBXbXlXZ0toYXVxODZSL0s2?=
 =?utf-8?B?VzhoSHg2eDRFZ0NXWnFSS1NySTFielFXdnpybzZ5Um5lVnhxOWdUc1BzREVo?=
 =?utf-8?B?cUhvd3AvWjhJTU4wQXRDTVZnVFZBb285U2ZvUDdndVE4TmgvYlRNMkZjdFFp?=
 =?utf-8?B?NWdKbVpTclQ3RXRSdDI2NlZyd0JyL0w3REYrZERUSzNVcERpVmp4ZUhTcktN?=
 =?utf-8?B?NHpOR3orOVJaY1Yyb0gxTE1VcWJtTFpTUUNzUHRBdFNjeWY0a3JJMlVyMS9W?=
 =?utf-8?B?eXpzODhzeTRJR3N3Uis2NGxBcWdzK1RkVGk1SWlEdGJvSU9PeWRWNjBOaksx?=
 =?utf-8?B?S2hsY0hkem9wNkkvZno1UlkrdWVGSEUwbE1HSUlqK1oxc0UyVUpWQXh6cDVo?=
 =?utf-8?B?RjZpcTJIU3ZPT0JwdVB0UERGUlBYK1JyMXRPTTRsTjFNVmczeTU0cDUwaE5k?=
 =?utf-8?B?U29yaEJVRzJ4SnM4MjE5TGpXY09XaTNyQzl0TE1nVnBaNkdmTDdpRExUY08z?=
 =?utf-8?B?azZqdG0rR2Q1Ky9mR2crU0NuOS9RYnFrdkE2QmxqV0VWTlBJZEJkbnArSER5?=
 =?utf-8?B?aTJzdGEwRDJiWjhHWUIrK3N2MmN3VXFWOXpjZ0o4eVNZQ1AxcDE2WlVNOUxQ?=
 =?utf-8?B?TXVpYXVGdXUxb1AwaEl0aTlETWFsM1hiampkamZ1bDZxVDR0REYreGx2Zy9O?=
 =?utf-8?B?K0ZXSEtVakhaZWdhYUIvRml2R0hxRXh1MVVpTWFRQmlmQkFHOWlGT0I4MGE0?=
 =?utf-8?B?WEplZVE5TVRIclNDRjRlY2dMWVB6ZlBCK0kwUVhnS044MEtEUnV6YjdaTXFv?=
 =?utf-8?B?Wi80UGFpWHRDSG9lWEpWaDlEenhpMGMwQ2JYV25EZmJiRGVvbU91RGJpRjhi?=
 =?utf-8?B?UWR0clMydXBVQ203dlRreXFoU0E4emlhTml2eDllZjV3ZVUxdWNoL0hqT2pF?=
 =?utf-8?B?R01RUUk1c05xQjlsaFo2dnI0bVJjZDZpUmd0T0VhUHlPWThVcm9hUnRTN3Zk?=
 =?utf-8?B?ck9maGhiTmFQTG4wMVF5SThNOHltdzhXdXJQOElBbkVMVzd2Yms2Q2pUTHor?=
 =?utf-8?B?cEF1TFRHYnRZemdUUzllL0NOeUVmRGo4L09LMHdZc21HK1h3MHp2cWVOd1Zs?=
 =?utf-8?B?NGZLa0Qwa0xVRWhxTCt5N0Q3NEIrMWRYSW4yT0JYVTNIc0lGUmxJUk5veVgv?=
 =?utf-8?B?Nkx5VzFBRC9kR1hmY1M1eXA5SDkrZ09aYU5sRUFSWnRyMk5kcWI2Z1FUT3RI?=
 =?utf-8?B?S3FTb1lpbHdwd0swSEswdmgzYVNkdWYrcDgrZVRNMllRUE9MR1ExVHZuVjIr?=
 =?utf-8?B?VmZrZ25JU29iTUFwSk4vTGRRL2w1RDBFd0x2RUNNYmlUWUpWUjdQd3prTTRo?=
 =?utf-8?B?cmFCWWF4UDJzQUk4eElpWVY2eUxiVGlxbkFDMmM3blFCcFdMYy9wam5UWCtz?=
 =?utf-8?B?UVhtbFhmN25TaGJ6ZGpzOFA3d0k1bFdmRVRQR2FYS2ZCZU13ZDBNd3N2UkVp?=
 =?utf-8?B?aTIwL2ZWRWRWRlVmZyt1RUxvekNtMDJRdncwZWNLOXE2Q0RwQXVxUGF3T1Vo?=
 =?utf-8?B?dm1nQURYc1NrVnAwLzdsTnA3bk8xaC9idkhQU3NEWFAzbm53a2dSczVabndU?=
 =?utf-8?B?QWpadnVFKzdWSEUrSkJyQTNxQkdqeS96azBVK0VDUlVzQWYwZlVnQUJ5NFBK?=
 =?utf-8?B?bXdvSkZGYTk4UFk0SU9lS1lndUp6TGZJckFpM0RERjJrZ1BBWEJFcTA2M3dO?=
 =?utf-8?B?aEs3L1B2QzRzNXlXYm1tMHpLSEdyQ0thL212QjNzdnhiSVVBa0lJZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e106524-d3d2-4aeb-7ed6-08de805073ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 16:00:15.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVaFVoqwMcsMSZiR6ewlBSe5dEpFvcp9FnGZd9eM5mkRcwLygJkJnNFOGsdXtt1QYbV5ERqHTq4DXCciQYBG+yFFlQs7yXqBm3sB/fliUUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12872
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org,bp.renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29297-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1BC2A275455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEyIE1hcmNoIDIwMjYgMTM6MTMNCj4gVG86IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dF0g
ZHQtYmluZGluZ3M6IG5ldDogbWljcmVsOiBGaXggZHRicyBjb21wYXRpYmxlIHRvbyBsb25nIHdh
cm5pbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCA0IEZlYiAyMDI2IGF0IDEwOjE4
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJv
bTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiA+IE9uIFR1ZSwgRmViIDMsIDIw
MjYgYXQgNjoxN+KAr0FNIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4g
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gVGhlIEtTWjkx
MzEgUEhZIGlzDQo+ID4gPiA+IHN1aXRhYmxlIGZvciBJRUVFIDgwMi4zIGFwcGxpY2F0aW9ucy4N
Cj4gPiA+ID4NCj4gPiA+ID4gRml4IHRoZSBiZWxvdyBkdGJzIHdhcm5pbmcgImNvbXBhdGlibGU6
DQo+ID4gPiA+IFsnZXRoZXJuZXQtcGh5LWlkMDAyMi4xNjQwJywgJ2V0aGVybmV0LXBoeS1pZWVl
ODAyLjMtYzIyJ10gaXMgdG9vIGxvbmciIG9uIHRoZSBiZWxvdyBkdHM6DQo+ID4gPiA+DQo+ID4g
PiA+IHI4YTc3NGIxLWJlYWNvbi1yemcybi1raXQuZHRiDQo+ID4gPiA+IHI4YTc3NGExLWJlYWNv
bi1yemcybS1raXQuZHRiDQo+ID4gPiA+IHI4YTc3NGUxLWJlYWNvbi1yemcyaC1raXQuZHRiDQo+
ID4gPiA+IHI5YTA4ZzA0Nmw0OC1zbWFyYy5kdGINCj4gPiA+ID4gcjlhMDdnMDQzdTExLXNtYXJj
LmR0Yg0KPiA+ID4gPiByOWEwN2cwNDRjMi1zbWFyYy5kdGINCj4gPiA+ID4gcjlhMDdnMDQ0bDIt
c21hcmMuZHRiDQo+ID4gPiA+IHI5YTA3ZzA0NGwyLXNtYXJjLmR0Yg0KPiA+ID4gPiByOWEwN2cw
NTRsMi1zbWFyYy5kdGINCj4gPiA+ID4gcjlhMDdnMDU0bDItc21hcmMuZHRiDQo+ID4gPiA+IHI5
YTA5ZzA0N2U1Ny1zbWFyYy5kdGINCj4gPiA+ID4gcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0Yg0KPiA+
ID4gPiByOWEwOWcwNTZuNDgtcnp2Mm4tZXZrLmR0Yg0KPiA+ID4gPiByOWEwOWcwNTZuNDgtcnp2
Mm4tZXZrLmR0Yg0KPiA+ID4gPiByOWEwOWcwNTdoNDQtcnp2MmgtZXZrLmR0Yg0KPiA+ID4gPiBy
OWEwOWcwNTdoNDQtcnp2MmgtZXZrLmR0Yg0KPiA+ID4gPiByOWEwN2cwNDN1MTEtc21hcmMtY3J1
LWNzaS1vdjU2NDUuZHRiDQo+ID4gPiA+IHI5YTA3ZzA0M3UxMS1zbWFyYy1wbW9kLmR0Yg0KPiA+
ID4gPiByOWEwN2cwNDN1MTEtc21hcmMtZHUtYWR2NzUxMy5kdGINCj4gPiA+ID4gcjlhMDlnMDQ3
ZTU3LXNtYXJjLWNydS1jc2ktb3Y1NjQ1LmR0Yg0KPiA+ID4gPiByOWEwN2cwNDRjMi1zbWFyYy1j
cnUtY3NpLW92NTY0NS5kdGINCj4gPiA+ID4gcjlhMDlnMDQ3ZTU3LXNtYXJjLWNydS1jc2ktb3Y1
NjQ1LmR0Yg0KPiA+ID4gPiByOWEwN2cwNDRsMi1zbWFyYy1jcnUtY3NpLW92NTY0NS5kdGINCj4g
PiA+ID4gcjlhMDdnMDQ0bDItc21hcmMtY3J1LWNzaS1vdjU2NDUuZHRiDQo+ID4gPiA+IHI5YTA3
ZzA1NGwyLXNtYXJjLWNydS1jc2ktb3Y1NjQ1LmR0Yg0KPiA+ID4gPiByOWEwN2cwNTRsMi1zbWFy
Yy1jcnUtY3NpLW92NTY0NS5kdGINCj4gPiA+ID4gcjlhMDlnMDU2bjQ4LXJ6djJuLWV2ay1jbjE1
LWVtbWMuZHRiDQo+ID4gPiA+IHI5YTA5ZzA1Nm40OC1yenYybi1ldmstY24xNS1lbW1jLmR0Yg0K
PiA+ID4gPiByOWEwOWcwNTZuNDgtcnp2Mm4tZXZrLWNuMTUtc2QuZHRiDQo+ID4gPiA+IHI5YTA5
ZzA1N2g0NC1yenYyaC1ldmstY24xNS1zZC5kdGINCj4gPiA+ID4gcjlhMDlnMDU2bjQ4LXJ6djJu
LWV2ay1jbjE1LXNkLmR0Yg0KPiA+ID4gPiByOWEwOWcwNTdoNDQtcnp2MmgtZXZrLWNuMTUtZW1t
Yy5kdGINCj4gPiA+ID4gcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay1jbjE1LXNkLmR0Yg0KPiA+ID4g
PiByOWEwOWcwNTdoNDQtcnp2MmgtZXZrLWNuMTUtZW1tYy5kdGINCj4gPiA+ID4NCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9uZXQvbWljcmVsLGdpZ2FiaXQueWFtbCAg
ICAgICAgICB8IDIzICsrKysrKysrKysrLS0tLS0tLS0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZm
IC0tZ2l0DQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9t
aWNyZWwsZ2lnYWJpdC55YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9taWNyZWwsZ2lnYWJpdC55YW1sDQo+ID4gPiA+IGluZGV4IDM4NGI0ZWE2MTgx
ZS4uMjg0YzNiYTM3OWYzIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L21pY3JlbCxnaWdhYml0LnlhbWwNCj4gPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9taWNyZWwsZ2lnYWJpdC55YW1sDQo+
ID4gPiA+IEBAIC0xNywxNSArMTcsMjAgQEAgZGVzY3JpcHRpb246DQo+ID4gPiA+DQo+ID4gPiA+
ICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiAtICAgIGVudW06
DQo+ID4gPiA+IC0gICAgICAtIGV0aGVybmV0LXBoeS1pZDAwMjIuMTYxMCAgIyBLU1o5MDIxDQo+
ID4gPiA+IC0gICAgICAtIGV0aGVybmV0LXBoeS1pZDAwMjIuMTYxMSAgIyBLU1o5MDIxUkxSTg0K
PiA+ID4gPiAtICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2MjAgICMgS1NaOTAzMQ0KPiA+
ID4gPiAtICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2MzEgICMgS1NaOTQ3Nw0KPiA+ID4g
PiAtICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2NDAgICMgS1NaOTEzMQ0KPiA+ID4gPiAt
ICAgICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2NTAgICMgTEFOODg0MQ0KPiA+ID4gPiAtICAg
ICAgLSBldGhlcm5ldC1waHktaWQwMDIyLjE2NjAgICMgTEFOODgxNA0KPiA+ID4gPiAtICAgICAg
LSBldGhlcm5ldC1waHktaWQwMDIyLjE2NzAgICMgTEFOODgwNA0KPiA+ID4gPiArICAgIG9uZU9m
Og0KPiA+ID4gPiArICAgICAgLSBpdGVtczoNCj4gPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBl
dGhlcm5ldC1waHktaWQwMDIyLjE2NDANCj4gPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBldGhl
cm5ldC1waHktaWVlZTgwMi4zLWMyMg0KPiA+ID4NCj4gPiA+IFRvIGF2b2lkIHRoZSBlcnJvcnMs
IHlvdSB3b3VsZCBuZWVkIGEgY3VzdG9tICdzZWxlY3QnIHRoYXQgZXhjbHVkZXMNCj4gPiA+IHRo
ZSBjMjIgY29tcGF0aWJsZSBmcm9tIHRoaXMgc2NoZW1hIChJT1csIGxpc3RzIGFsbCB0aGUgb3Ro
ZXIgY29tcGF0aWJsZXMgaGVyZSkuDQo+ID4NCj4gPiBPSy4NCj4gPg0KPiA+ID4NCj4gPiA+IEhv
d2V2ZXIsIEkgdGhpbmsgdGhlIGNvcnJlY3QgZml4IGlzIHByb2JhYmx5IGRyb3BwaW5nIHRoZSBj
MjINCj4gPiA+IGNvbXBhdGlibGUgZnJvbSB5b3VyIC5kdHMgZmlsZXMuIEkgZG9uJ3QgdGhhdCBj
b21wYXRpYmxlIGlzIHVzZWZ1bCBvbiBpdHMgb3duPw0KPiA+DQo+ID4gSSB3aWxsIHdhaXQgZm9y
IEdlZXJ0J3MgaW5wdXQgdG8gZHJvcCBjMjIgZnJvbSAuZHRzIGZpbGVzLg0KPiANCj4gTWFrZXMg
c2Vuc2UuDQo+IA0KPiBTbyB3ZSBzaG91bGQgcHJvYmFibHkgZml4IHRoZSBmb2xsb3dpbmcsIHRv
bz8NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ldGhlcm5ldC1waHku
eWFtbA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21zY2MtcGh5LXZz
Yzg1MzEueWFtbA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVz
YXMsZXRoZXIueWFtbA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Jl
bmVzYXMsZXRoZXJhdmIueWFtbA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L2FtbG9naWMsZzEyYS1tZGlvLW11eC55YW1sDQoNCk9LIEkgd2lsbCBmaXggdGhlc2UgYmlu
ZGluZ3MgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

