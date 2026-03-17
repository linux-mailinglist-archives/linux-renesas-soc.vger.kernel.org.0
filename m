Return-Path: <linux-renesas-soc+bounces-29642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPjSDYutuWnOMAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:37:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA02B1987
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F74F30142BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FA0342507;
	Tue, 17 Mar 2026 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nJNowCZS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ABD33B966;
	Tue, 17 Mar 2026 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776261; cv=fail; b=Xtrk4Z6atBKqgzUzoLLIaahQSSDgVP1csN5JIqcFJNMfN/1zRD2jixiQV23QNxGM6tk0Qx3wmrvqv5Wxge8EjcSGUzstn2RYyL1+1cLHx9Nzuq7ylLJPkOZ7GMUgKqGkbVQ7wd9bJ8uaJ9PVO7fdTXz1FiZE6rxktTtcUAs1u8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776261; c=relaxed/simple;
	bh=+1uFGULrT15KRKb+FIrs6zK7K2u/8G7zpu+92f7+BLE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZM2VVHABuNjP1ZTmW1nNVawlXnpK77Wplr5561XRn2OsOOuoEhNvheaYL535FSzveBDp8ys1rCNQF8gU7GGUXaacbJopw1jGyOaIWS4PGcNIbV6mU4LCYlS1GQ0SD6iZeHEfDf5076V8AGuxkIoQVioQUvKHD0xrE4su9T0ehYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nJNowCZS; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxwLwVxteGJHRK2nYBZbQ+YqNonIzcWRR7/zs+GLAeJZPSTHseNmSfUM/1rRNk69hH2vJnmdhKFNy0l9S6iUqtz7PTKj+OVzO+yuUevdL/EcbItFC/2A4LC+j/IsNZ3YCEaDPrC7LDjvRyGjd23aFmUyNIOcsh+qIcAyH9nFkt5EOYYyqD3eSAPWBlm1dBmgFiVml/Sr6IGCdaK2nW25T8fPFA9LaAly2Ygx0KAoDduN52z5ncXHYmQHcBgGaYtjyDEgSCqTSkQpXx/BrIBOHBrK3vfl2JgtV4PoUsM37VXTcz/2atOr3pxlrh4xepX+fQTPGViS07WsDD6BuqQC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1uFGULrT15KRKb+FIrs6zK7K2u/8G7zpu+92f7+BLE=;
 b=Go2+5b3qHfuPerPQPjeUHKAHsiZHEELfeTy4K5R6Hv6I1rSlapeZDOUEc0nYtZIc3mg8cu1fyeZ/UqWBvAj7bbnwkRdvDbR2phv9Ojqxt3q0Ker1MN1oRJXURy30aWkB//PrO5l9vHjQY0gBx1cU2MWX27ip6NUFlZ5yw2uGoB+iZR/EVUqvsLyWSRcYoFMM76ULt3GW8ioLKVmGXDBmiQAdVhy1p/d5heFsGFa6rr1cAnhvR0aZYYUE+SgnhNYCcRZBDK9HT/oGT3LJhWLqyrPBIupu4B40IjiIzD7hwpOkD+x6IUmVbewBh7Ekq655XeEnMY0TCEoxNn0u5K8n8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1uFGULrT15KRKb+FIrs6zK7K2u/8G7zpu+92f7+BLE=;
 b=nJNowCZS8YAurgV+C7EIsCk+n5tD1HPozIW6NW359o49r1mWfh8cYBZ+eaiZN1CM+hadmoxAe6nPFOLdS8w3AuBqhyvj3X39Px0b7Eq+HV6zNajNl3XblZ1remqQjN9n8MAEdAzgjS64um1I6+uJvL5RJqnj+1SEBi4LTYZ5l08=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14601.jpnprd01.prod.outlook.com (2603:1096:604:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 19:37:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 19:37:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index:
 AQHctgqqun0iZdWPQkGCYHsU3REA1bWy0bQAgAAAR5CAAAU4AIAAAlBAgAAMHwCAAAKV8IAAKhgAgAAL7iA=
Date: Tue, 17 Mar 2026 19:37:35 +0000
Message-ID:
 <TY3PR01MB113469B2E916BDD343BD516F78641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <20260317110112.338259354289bb60a57fc259@hugovil.com>
 <TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
 <TY3PR01MB1134627E19FCEA40819F8C6578641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317121232.39b1728e4d53d7243856a403@hugovil.com>
 <TY3PR01MB11346B55F3F5C28FE9E763AF48641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317145226.b84c29335c5badfdd257d0df@hugovil.com>
In-Reply-To: <20260317145226.b84c29335c5badfdd257d0df@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14601:EE_
x-ms-office365-filtering-correlation-id: 77f782fa-cf0d-4c35-6c99-08de845ca3ef
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 aHHFTO/6PqWCdsKTmw5RLHrDoh+IvziwYt4x5C/OhjvwI1zzmih5jAwM17v5Y7SdB4SJ1H97sayPkjLf0ILHXMzAk7njHJIw8075OSYl6IpthnpG/R/LsFmwNBEFNXgfoY5Th0pyceMsVKZ/gbODsImOLI6JXc0+fp9ZRpyqSSwTVXX2cft8gvMLnk78PZhYGWTu9UUdfSzd1Sd9GnQqCoJNTkFivShLG1q9TjOpO7WTAB0dZxFn5rcDpcerH9wL9SchdH+1NNNPfmE5sfOMnexOWU1QGjA3Osbzxv7HmSZ9ncDUvJS89AkFIzPhqtcalhX4B4ypreH55VK7KVBYxpVVpoAMifBbXYJ7oln7HUoKARljd0E7v8DTmpY0ZzijeNTXyXxuZYt9PvADcQS26ZmzmmxmzpckoVTNSHP1kOmlVjiOO+6aAma5Rx+SkGgxMQ1x8lNRk2ipZSxEg/7dYsJh8vct8TdMAGwhu1pmmXd7rJwCZeMI7RcZwW4dP7aput0H3QNqixYXNCK7ap/fdVVFIUVjIEo9RlDeOXBku6o5DrB+xUtDG6+mXd4syNdGtgAM1mc10ZvuxGWVOej3m+Dc7nPWSJJ5Zd2v6SgZYmpcmTosPfYbDsLgCCpOty2JV0dC/l87cUzWV762tBcPmygYUtNOgmo+ivpXAPNWUX7ZtUZ4fPJRaCqg7Q/b0U/IQ+D0578v0sZv3h3JMsS3p2xwuPWoISEtFILiwGtUkZSpOAOCiLiknFgSW6cEj3C3ny19Xi7GzBw9YPZQx4OPHfzTfpljh85wa4LE8yYK/Iw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2xMUUFWaVN3WkkrRlJQemhVaDNkNFAxaUNoaUk3dWY5UmlvdTB6Yk5XVE9O?=
 =?utf-8?B?T2w3VDZUZGIvRG9JVlA1aU50NTZpVGlBQjBoNUFsZTRDc0U1QTlaSlFYS255?=
 =?utf-8?B?VzBmNldyczdYMHpUOFc3YURaT29FRisrRzMxVXVxSVpWZ0hWZXV2SGdEOURD?=
 =?utf-8?B?Nm9FdEJnNWljRU1MRy9FYlV6alFWbDN2WGFqbEhpdmpPWSsrWUJmUXlOcDdt?=
 =?utf-8?B?VTJhb0pXa0pqQVJEVElRSVYrS0NEdUEzOWIzZzl4WjFDc1E5cUxvMTFqdlRs?=
 =?utf-8?B?aWV3NjU3eFlpeXNuS0V2c0lHejFnaFFOV084NU5LZ1FzNVZWRjk1WFQvSmFH?=
 =?utf-8?B?RUpsNlg1MUNNenY2NzRpZE5abitEVENRM1hHVlFIdnhNam04T0hEZzhkSFVE?=
 =?utf-8?B?VUkwczVmY21hLzZlMDM4QUVoY3FGS1Rsc2x5Y1BHeTliTkZBRU5ZMWc4QVVy?=
 =?utf-8?B?enJ1d2xURTBBd2w0K0JTUi8xUVZNUGlqRTg0bkQ1UHFGbVBPek1ubGVDZjNs?=
 =?utf-8?B?SnBZYmlVblQxZHpRLy9ZdWFuUkI1TDJLcmtZN3ViZWZZSmNUOWpkRTVITkFE?=
 =?utf-8?B?TEJqcnI5bXM2OTJjKzBuVkNySExJN0lEZEUzOW5vNHJtNTQ0ZVd2aDdpdk9Z?=
 =?utf-8?B?WlJCY1cwamR3alBnT2tmaHdzYzkvVUFmN0RoWWxXNU8vOU5oL3dMRjFMMmVO?=
 =?utf-8?B?OVoxNnMwaU5HVi9wVmVKSHcrbTl2c1VjcXJFV2x4U1laQlkxU1hzQjArR1ly?=
 =?utf-8?B?ZWE3cStMOHkvUEZNdlVxcDU1Ly8yaE04QzRNdC84K1RGemVUNGdsNDYxSEdw?=
 =?utf-8?B?cGRSU3RORFJtMVk2Tk9XRTN6QzNkK3B4OU1KNW5kL3YwNXduUlZHQ2xMaC9Z?=
 =?utf-8?B?S1liVWhwbVFTdGxoVDdqMGU0NFNGZDBNQ1VWcFRRSGJNK2NHZ1E3eW5VS1ly?=
 =?utf-8?B?YjZsMWpHNkUrMTN6eSs1RTZpSWExSmZMdWxPUmFrS3lPVG5ZUFY5VTFDZTRh?=
 =?utf-8?B?Q241ZVdkeDJVbTI0T2F6VURHaElnakZZR092c1ZUWWNUZDUva2V1UUJ4UlZQ?=
 =?utf-8?B?Nno1MThyd0RMem85WkpCeUhnQTdmWURmR0NSOUI1MHVRbzk0aXp6K3pyNktt?=
 =?utf-8?B?cXZURHRWYzJueVQ1Vm0wM3J3UjloOEROWHNVdGROUWx6S1pEZnRmUWQ4dGJx?=
 =?utf-8?B?MUtIbnVKNGp4T3NsMUl5UHJoUEtKNjRqclFIdXVZZnc0TnZ6dUtwNnRtQWFq?=
 =?utf-8?B?cEFMUzFsdjdiNys3NmZkb1Vqb2taejBiKzdpdGdWYU00VERxVEFDWEpqU1hr?=
 =?utf-8?B?Z2o4OGFqWUF5VDhOSFFOV2xkanM1WW4vS1gwNUNJY3FrSGhTVFhTcDNtZmpm?=
 =?utf-8?B?S0ZsMVdFMzl2QnJLTUVEclZlV3I2SHdLQ1NpcFN6R1ZRYUREdHg4eWVWanFz?=
 =?utf-8?B?MkJQbTJuUWZGdXhaOVY1Qk85YVZqOTBzd056a3RQYXZFalB0VTEzYUtlb3V5?=
 =?utf-8?B?bTFZS1hvdUZjUXg4RWlCNUZpbVFQSmM1RTd1RS9tZU1TNlZoYm91ZHcvMFBD?=
 =?utf-8?B?R2JwdXQwcWhTanZKQmt6QnZSUTUweW50Lzc0OHQ3QkF0ZXJnODVEVStMRVJF?=
 =?utf-8?B?QnQrR0RISkFNc295enhuTVZsT2ZsQzc4eWFPV0xneUNvNXZjMEhuYUlxdysy?=
 =?utf-8?B?ZG1aNXhJaU5xZkdXUG1LbysrM0VhM2JVYnlHS0x6WDJwNDlzQ2hiWEc5L3pl?=
 =?utf-8?B?UmdodEF3bHVmUHloMEhONHkxZklURDFQUVp3bFhucmNpRkRxalNTOVFFOXlL?=
 =?utf-8?B?eEJQMW50UCtBNnhUMjZIZUVHaVpkT0UwcTNsRmRtMkpwYlBzbENOM3U3NXVJ?=
 =?utf-8?B?Q0VLeVA5eE8vY1l0NXZ6ZWhaSndPRmR2RkdBMUJaUzcwd2pvQU5wb3IrSXZm?=
 =?utf-8?B?RFo2eUNDQW5hOGZmOVk0aHN3Z1NEQ2tZakFMWWlOUWQ2Y20xMWNmQkFXOC84?=
 =?utf-8?B?S1d2Mkora0k1UnlTWlFnMTNlbTZ2ZWlkS215QkRQUE9XQWNWZW9ZZ3p5aWl6?=
 =?utf-8?B?QkVaTklPODBFNE5UNGZwRmZTemovOWI0TytmNlpzNUVYOGwzRENPaCtWeWhs?=
 =?utf-8?B?RkwwekRubitZZjk0VUE1S3VWTGkxcDBoSGdiWnRmU2J5Q3FMSWdpd216cGRS?=
 =?utf-8?B?elp5NkpkV3NLRSsyNXVlL3BzTDhlaWtlWFdZaC90M2hEelRhQXlyWDFGVzEz?=
 =?utf-8?B?VUlVdytXV084bXBGbFh6Yk01SnZvbnFOY3FQQjNtSGQ1ZE8zazdkRlpoNGpF?=
 =?utf-8?B?ZmtBL01ieHBSOGgxVjFOMzVPK2Q2TXBEbFo4L2Q0WkdEVVZTYTc1Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f782fa-cf0d-4c35-6c99-08de845ca3ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 19:37:35.5035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6LYh9IpLOqKIHArLa3dv7fbK9Ehf8kk6/YytGb+mFwt34LVag54UykjaQk6nIA3aUxEa09iIs4NPu8PhxhpnTDq06KGcHmEuEg8QrPjwUm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14601
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29642-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CEA02B1987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEh1Z28gVmlsbGVuZXV2ZQ0KPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE4OjUyDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNpOiBGaXggdGhlIHBv
d2VyLW9uIHNlcXVlbmNlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxNyBNYXIgMjAy
NiAxNjozNjowNSArMDAwMA0KPiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiANCj4gPiBIaSBIdWdvLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2YgSHVnbyBWaWxsZW5ldXZlDQo+ID4g
PiBTZW50OiAxNyBNYXJjaCAyMDI2IDE2OjEzDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
Ml0gZHJtOiByZW5lc2FzOiByemcybF9taXBpX2RzaTogRml4IHRoZQ0KPiA+ID4gcG93ZXItb24g
c2VxdWVuY2UNCj4gPiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgMTcg
TWFyIDIwMjYgMTU6NDU6MjkgKzAwMDANCj4gPiA+IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBIaSBIdWdvLA0KPiA+ID4gPg0KPiA+
ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogZHJpLWRl
dmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uDQo+ID4gPiA+
ID4gQmVoYWxmIE9mIEh1Z28gVmlsbGVuZXV2ZQ0KPiA+ID4gPiA+IFNlbnQ6IDE3IE1hcmNoIDIw
MjYgMTU6MjENCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJtOiByZW5lc2Fz
OiByemcybF9taXBpX2RzaTogRml4IHRoZQ0KPiA+ID4gPiA+IHBvd2VyLW9uIHNlcXVlbmNlDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gVHVl
LCAxNyBNYXIgMjAyNiAxNToxMzowNyArMDAwMCBCaWp1IERhcw0KPiA+ID4gPiA+IDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEhpIEh1
Z28sDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gPiA+ID4gPiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4gT24NCj4gPiA+ID4gPiA+ID4gQmVoYWxmIE9mIEh1Z28gVmlsbGVuZXV2ZQ0K
PiA+ID4gPiA+ID4gPiBTZW50OiAxNyBNYXJjaCAyMDI2IDE1OjAxDQo+ID4gPiA+ID4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm06IHJlbmVzYXM6IHJ6ZzJsX21pcGlfZHNpOiBGaXgN
Cj4gPiA+ID4gPiA+ID4gdGhlIHBvd2VyLW9uIHNlcXVlbmNlDQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IEhpIEJpanUsDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9uIFR1ZSwg
MTcgTWFyIDIwMjYgMTI6MzY6MDEgKzAwMDAgQmlqdQ0KPiA+ID4gPiA+ID4gPiA8YmlqdS5kYXMu
YXVAZ21haWwuY29tPg0KPiA+ID4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBNb3ZlIHJlc2V0X2NvbnRyb2xfZGVhc3Nl
cnQoKSBhbmQgcmVzZXRfY29udHJvbF9hc3NlcnQoKQ0KPiA+ID4gPiA+ID4gPiA+IGZyb20NCj4g
PiA+ID4gPiA+ID4gPiByemcybF9taXBpX2RzaV9kcGh5X2luaXQoKS9yemcybF9taXBpX2RzaV9k
cGh5X2V4aXQoKSB0bw0KPiA+ID4gPiA+ID4gPiA+IGF0b21pY19wcmVfZW5hYmxlKCkgYW5kIGF0
b21pY19wb3N0X2Rpc2FibGUoKQ0KPiA+ID4gPiA+ID4gPiA+IHJlc3BlY3RpdmVseSwgYW5kIG1v
dmUNCj4gPiA+ID4gPiA+ID4gPiByemcybF9taXBpX2RzaV9zZXRfZGlzcGxheV90aW1pbmcoKSBm
cm9tDQo+ID4gPiA+ID4gPiA+ID4gYXRvbWljX3ByZV9lbmFibGUoKSB0byBhdG9taWNfZW5hYmxl
KCksIHRvIGFsaWduIHdpdGggdGhlDQo+ID4gPiA+ID4gPiA+ID4gcG93ZXItb24gc2VxdWVuY2Ug
ZGVzY3JpYmVkIGluIEZpZ3VyZSAzNC41IG9mIHNlY3Rpb24NCj4gPiA+ID4gPiA+ID4gPiAiMzQu
NC4yLjEgUmVzZXQiIG9mIHRoZSBSWi9HMkwgaGFyZHdhcmUgbWFudWFsDQo+ID4gPiA+ID4gPiA+
ID4gUmV2LjEuNTAgTWF5IDIwMjUuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBB
Y2NvcmRpbmcgdG8gdGhlIGhhcmR3YXJlIG1hbnVhbCwgTElOSyByZWdpc3RlcnMgbXVzdCBiZQ0K
PiA+ID4gPiA+ID4gPiA+IHdyaXR0ZW4gYmVmb3JlIGRlYXNzZXJ0aW5nIENNTl9SU1RCLCBhbmQg
dGhlIDFtcyBkZWxheSBpcw0KPiA+ID4gPiA+ID4gPiA+IHJldGFpbmVkIGluDQo+ID4gPiA+ID4g
PiA+ID4gYXRvbWljX3ByZV9lbmFibGUoKSBhZnRlciB0aGUgZGVhc3NlcnQuDQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNlZW1zIHRv
IG1lIGxpa2UgdGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZCB0byBzdGFibGUNCj4gPiA+ID4gPiA+
ID4gYnJhbmNoZXMgKG1pc3NpbmcgRml4ZXMgLyBDYzogc3RhYmxlDQo+ID4gPiB0YWdzKT8NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPSywgd2lsbCBhZGQgZml4ZXMvc3RhYmxlIHRhZ3MuDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+
IC0tLQ0KPiA+ID4gPiA+ID4gPiA+ICAuLi4vZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21p
cGlfZHNpLmMgICAgfCAyNyArKysrKysrKysrKy0tLS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiA+ID4gPiBhL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiA+ID4gPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4g
PiA+ID4gPiA+ID4gPiBpbmRleCBlNTNiNDhlNGRlNTYuLjkwNTNjZTAzN2I3NSAxMDA2NDQNCj4g
PiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9t
aXBpX2RzaS5jDQo+ID4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMv
cnotZHUvcnpnMmxfbWlwaV9kc2kuYw0KPiA+ID4gPiA+ID4gPiA+IEBAIC00ODQsNyArNDg0LDYg
QEAgc3RhdGljIGludCByemcybF9taXBpX2RzaV9kcGh5X2luaXQoc3RydWN0IHJ6ZzJsX21pcGlf
ZHNpICpkc2ksDQo+ID4gPiA+ID4gPiA+ID4gIAl1MzIgZHBoeXRpbTE7DQo+ID4gPiA+ID4gPiA+
ID4gIAl1MzIgZHBoeXRpbTI7DQo+ID4gPiA+ID4gPiA+ID4gIAl1MzIgZHBoeXRpbTM7DQo+ID4g
PiA+ID4gPiA+ID4gLQlpbnQgcmV0Ow0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
IAkvKiBBbGwgRFNJIGdsb2JhbCBvcGVyYXRpb24gdGltaW5ncyBhcmUgc2V0IHdpdGggcmVjb21t
ZW5kZWQgc2V0dGluZyAqLw0KPiA+ID4gPiA+ID4gPiA+ICAJZm9yIChpID0gMDsgaSA8DQo+ID4g
PiA+ID4gPiA+ID4gQVJSQVlfU0laRShyemcybF9taXBpX2RzaV9nbG9iYWxfdGltaW5ncyk7DQo+
ID4gPiA+ID4gPiA+ID4gKytpKSB7IEBADQo+ID4gPiA+ID4gPiA+ID4gLTUyNCwxMiArNTIzLDYg
QEAgc3RhdGljIGludCByemcybF9taXBpX2RzaV9kcGh5X2luaXQoc3RydWN0IHJ6ZzJsX21pcGlf
ZHNpICpkc2ksDQo+ID4gPiA+ID4gPiA+ID4gIAlyemcybF9taXBpX2RzaV9waHlfd3JpdGUoZHNp
LCBEU0lEUEhZVElNMiwgZHBoeXRpbTIpOw0KPiA+ID4gPiA+ID4gPiA+ICAJcnpnMmxfbWlwaV9k
c2lfcGh5X3dyaXRlKGRzaSwgRFNJRFBIWVRJTTMsIGRwaHl0aW0zKTsNCj4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+IC0JcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJz
dGMpOw0KPiA+ID4gPiA+ID4gPiA+IC0JaWYgKHJldCA8IDApDQo+ID4gPiA+ID4gPiA+ID4gLQkJ
cmV0dXJuIHJldDsNCj4gPiA+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gPiA+ID4gLQlmc2xlZXAo
MTAwMCk7DQo+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gPiA+ICAJcmV0dXJuIDA7DQo+
ID4gPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IEBAIC01
NDEsOCArNTM0LDYgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+ID4gPiByemcybF9taXBpX2Rz
aV9kcGh5X2V4aXQoc3RydWN0IHJ6ZzJsX21pcGlfZHNpICpkc2kpDQo+ID4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gPiAgCWRwaHljdHJsMCAmPSB+KERTSURQSFlDVFJMMF9FTl9MRE8xMjAw
IHwgRFNJRFBIWUNUUkwwX0VOX0JHUik7DQo+ID4gPiA+ID4gPiA+ID4gIAlyemcybF9taXBpX2Rz
aV9waHlfd3JpdGUoZHNpLCBEU0lEUEhZQ1RSTDAsIGRwaHljdHJsMCk7DQo+ID4gPiA+ID4gPiA+
ID4gLQ0KPiA+ID4gPiA+ID4gPiA+IC0JcmVzZXRfY29udHJvbF9hc3NlcnQoZHNpLT5yc3RjKTsN
Cj4gPiA+ID4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gIHN0
YXRpYyBpbnQgcnpnMmxfZHBoeV9jb25mX2Nsa3Moc3RydWN0IHJ6ZzJsX21pcGlfZHNpDQo+ID4g
PiA+ID4gPiA+ID4gKmRzaSwgdW5zaWduZWQgbG9uZyBtb2RlX2ZyZXEsIEBAIC0xMDMwLDI0ICsx
MDIxLDM3IEBADQo+ID4gPiA+ID4gPiA+ID4gc3RhdGljIHZvaWQgcnpnMmxfbWlwaV9kc2lfYXRv
bWljX3ByZV9lbmFibGUoc3RydWN0DQo+ID4gPiA+ID4gPiA+IGRybV9icmlkZ2UgKmJyaWRnZSwN
Cj4gPiA+ID4gPiA+ID4gPiAgCWNvbm5lY3RvciA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0
b3JfZm9yX2VuY29kZXIoc3RhdGUsIGJyaWRnZS0+ZW5jb2Rlcik7DQo+ID4gPiA+ID4gPiA+ID4g
IAljcnRjID0gZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubmVj
dG9yKS0+Y3J0YzsNCj4gPiA+ID4gPiA+ID4gPiAgCW1vZGUgPSAmZHJtX2F0b21pY19nZXRfbmV3
X2NydGNfc3RhdGUoc3RhdGUsDQo+ID4gPiA+ID4gPiA+ID4gY3J0YyktPmFkanVzdGVkX21vZGU7
DQo+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGlzIGlz
IG5vdCByZWxhdGVkIHRvIHlvdXIgY29tbWl0IG1lc3NhZ2UgKGNvZGluZyBzdHlsZSBjaGFuZ2Up
Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEFjay4gV2lsbCByZXN0b3JlIGl0Lg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAgCXJl
dCA9IHJ6ZzJsX21pcGlfZHNpX3N0YXJ0dXAoZHNpLCBtb2RlKTsNCj4gPiA+ID4gPiA+ID4gPiAg
CWlmIChyZXQgPCAwKQ0KPiA+ID4gPiA+ID4gPiA+ICAJCXJldHVybjsNCj4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+IC0JcnpnMmxfbWlwaV9kc2lfc2V0X2Rpc3BsYXlfdGltaW5nKGRz
aSwgbW9kZSk7DQo+ID4gPiA+ID4gPiA+ID4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0
KGRzaS0+cnN0Yyk7DQo+ID4gPiA+ID4gPiA+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiA+ID4gPiA+
ID4gPiArCQlyZXR1cm47DQo+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICsJaWYg
KGRzaS0+cnN0YykNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhpcyBzZWVtcyBuZXcg
YW5kIG5vdCBkb2N1bWVudGVkIGluIHRoZSBjb21taXQgbWVzc2FnZT8gSXMgdGhpcyBhIGZpeD8N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBSWi9WMkggZG9lcyBub3QgbmVlZCB0aGlzIGFzIGl0
IHVzZXMgZGlmZmVyZW50IElQLiBQcmV2aW91c2x5DQo+ID4gPiA+ID4gPiBmc2xlZXAoKSBpcyBp
biBSWi9HMkwgc3BlY2lmaWMgZnVuY3Rpb24uIEkgd2lsbCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0
aW9uIGZvciB0aGlzIGNoYW5nZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFN1Z2dlc3Rpb246IG1h
eWJlIG1vdmUgdGhpcyB0byBhIHNlcGFyYXRlIHBhdGNoLCB0byBmYWNpbGl0YXRlIHJldmlldy91
bmRlcnN0YW5kaW5nLi4uDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBvbmx5IHdheSBpcyB0byBpbnRy
b2R1Y2UgYSBuZXcgY2FsbGJhY2sgdG8gaGFuZGxlIGl0IGZvciBSWi9HMkwgU29DLg0KPiA+ID4g
PiBUaGVuIHdlIHdvbid0IGJlIGFibGUgdG8gYXBwbHkgZml4ZXMgdGFnIGFzIGl0IGlzIG5vdCBm
aXhpbmcgYW55dGhpbmcuDQo+ID4gPg0KPiA+ID4gSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFu
IGJ5IHRoYXQgY2FsbGJhY2s/IEhvdyBhIGNhbGxiYWNrIGlzIG5lZWRlZCBvbmx5IGlmIHlvdSBz
cGxpdCB0aGUNCj4gcGF0Y2g/DQo+ID4NCj4gPiBZb3UgY2Fubm90IHNwbGl0IHRoZSBwYXRjaC4N
Cj4gPg0KPiA+IEJlZm9yZToNCj4gPiAgIGF0b21pY19wcmVfZW5hYmxlKCk6DQo+ID4gICAgIHN0
YXJ0dXAoKQ0KPiA+ICAgICAgIGRwaHlfaW5pdCgpDQo+ID4gICAgICAgICB3cml0ZSBEU0lEUEhZ
VElNeCAgICAgICAgIChGKSBQSFkgdGltaW5nIHJlZ3MNCj4gPiAgICAgICAgIHJlc2V0X2NvbnRy
b2xfZGVhc3NlcnQoKSAgKEcpIGRlYXNzZXJ0IENNTl9SU1RCDQo+ID4gICAgICAgICB1ZGVsYXko
MSkgICAgICAgICAgICAgICAgIChIKQ0KPiA+IAkgIHNldHRpbmcgYmVsb3cgbGluayByZWdpc3Rl
cnMNCj4gPiAgICAgICAgIOKIkiBUWFNFVFINCj4gPiAJICDiiJIgVUxQU1NFVFINCj4gPiAgICAg
ICAgIOKIkiBEU0lTRVRSDQo+ID4gICAgICAgICDiiJIgQ0xTVFBUU0VUUg0KPiA+ICAgICAgICAg
4oiSIExQVFJOU1RTRVRSDQo+ID4NCj4gPiBDdXJyZW50IHBhdGNoOg0KPiA+DQo+ID4gYXRvbWlj
X3ByZV9lbmFibGUoKToNCj4gPiAgICAgc3RhcnR1cCgpDQo+ID4gICAgICAgZHBoeV9pbml0KCkN
Cj4gPiAgICAgICAgIHdyaXRlIERTSURQSFlUSU14ICAgICAgICAgKEYpIFBIWSB0aW1pbmcgcmVn
cw0KPiA+IAlzZXR0aW5nIGJlbG93IGxpbmsgcmVnaXN0ZXJzDQo+ID4gICAgICAgICDiiJIgVFhT
RVRSDQo+ID4gCSAg4oiSIFVMUFNTRVRSDQo+ID4gICAgICAgICDiiJIgRFNJU0VUUg0KPiA+ICAg
ICAgICAg4oiSIENMU1RQVFNFVFINCj4gPiAgICAgICAgIOKIkiBMUFRSTlNUU0VUUg0KPiA+DQo+
ID4gICAgICAgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpICAoRykgZGVhc3NlcnQgQ01OX1JTVEIN
Cj4gPiAgICAgICBmc2xlZXAoMTAwMCkgICAgICAgICAgICAgIChIKQ0KPiA+DQo+ID4gPg0KPiA+
ID4gSW4gdGhpcyBvcmlnaW5hbCBwYXRjaCB5b3UgdGVzdCBmb3IgdGhlIHZhbGlkaXR5IG9mIGRz
aS0+cnN0YyB0bw0KPiA+ID4gZGV0ZXJtaW5lIGlmIHlvdSBhcHBseSB0aGUgZGVsYXkgb3Igbm90
LiBTbyBpbiB0aGUgY2FzZSBvZiBSWi9WMkgsIEkgdW5kZXJzdGFuZCB0aGF0IGl0IGlzIE5VTEw/
DQo+ID4NCj4gPiBZZXMsIHRoYXQgaXMgY29ycmVjdC4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gQ3Vy
cmVudGx5IHRoaXMgaXMgb3B0aW9uYWwgcmVzZXQsIGFuZCBpdCBpcyBuby1vcCBmb3IgUlovVjJI
Lg0KPiA+ID4NCj4gPiA+IERvZXMgdGhpcyBtZWFucyB0aGF0IHRoZSBjYWxsIHRvIHJlc2V0X2Nv
bnRyb2xfZGVhc3NlcnQoZHNpLT5yc3RjKSBzaG91bGQgbm90IG9jY3VyIGZvciBSWi9WMkg/DQo+
ID4NCj4gPiByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRzaS0+cnN0Yykgd2lsbCByZXR1cm4gaW1t
ZWRpYXRlbHkgYXMgaXQgaXMgbnVsbC4NCj4gPg0KPiA+IG9yDQo+ID4NCj4gPiBXZSBjb3VsZCBh
ZGQgdGhpcyBjaGVjayBpbnN0ZWFkDQo+ID4NCj4gPiAJaWYgKGRzaS0+cnN0Yykgew0KPiA+IAkg
ICAgcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJzdGMpOw0KPiA+IAkgICAgaWYg
KHJldCA8IDApDQo+ID4gCQlyZXR1cm47DQo+ID4NCj4gPiAJICAgIGZzbGVlcCgxMDAwKTsNCj4g
PiAJfQ0KPiANCj4gWWVzLCBsaWtlIFRvbW1hc28gc3VnZ2VzdGVkLg0KPiANCj4gQnV0IEkgZG9u
J3Qgc2VlIHdoeSB5b3UgY2Fubm90IHNpbXBseSBpbXBsZW1lbnQgKHNwbGl0KSB0aGlzIGNoYW5n
ZSBhcyBhIHNlcGFyYXRlIGNvbW1pdCBqdXN0IGFmdGVyDQo+IGNvbW1pdCAjMSwgb3IgYWZ0ZXIg
Y29tbWl0ICMyPw0KPiANCj4gVGhpcyBzZWVtcyBsaWtlIGFuIG9wdGltaXphdGlvbiBmb3IgUlov
VjJILCBzbyBJIHRoaW5rIGl0IGRvZXNudCByZWFsbHkgbWF0dGVyIGlmIGl0IGRvZXMgbm90IGdv
IHRvDQo+IHN0YWJsZSBicmFuY2hlcz8NCg0KUHJldmlvdXNseSBSWi9WMkggZG8gbm90IGNhbGwg
cmVzZXRfY29udHJvbF9kZWFzc2VydChkc2ktPnJzdGMpIGFzIGl0IGlzIGNhbGxlZCBmcm9tIFNv
Qy1zcGVjaWZpYw0KZnVuY3Rpb24uDQoNCkNoZWVycywNCkJpanUNCg==

