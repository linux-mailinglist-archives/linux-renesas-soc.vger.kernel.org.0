Return-Path: <linux-renesas-soc+bounces-33340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNHSElF4GWrewwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:28:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851C6019B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5F673013854
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7968E3D47C8;
	Fri, 29 May 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vIpgOmhw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A4439F191;
	Fri, 29 May 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054094; cv=fail; b=EG5KTmcl8gsahRSOUlmPmMF4n4UQyKDVx2MlVXTpqm4FkwIEBV0XdQitPU+B28XuuvlypobC9GeJ1vGmXliAPbJ8DlsKo5aWCHZbIF/05gvSu2Lm38vk8oORsuJ8pI7kFLPy9ubwr5iefhivio89kTghnfkNp3+LY0vL7bUyO8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054094; c=relaxed/simple;
	bh=zMCuIlgJ7GZsdR6LZtAl8lNWL0QAfebrcz43UeWvlDc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rO+9qrhoAogsVVwUHyyg9dANWe5iLDWEBcx9/+Oh7JrgG6+MRgpfgvfAk+Y7ppwDqu1quqXK5k4kag583+lVLxjSKe+gWo6hGvuPmv2PKZiwAHmcK+c2gdHbJOyVxFt4D7THymqi3XTVRbb8j30Ywp8W39H5NRLkOAPd7SBvhCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vIpgOmhw; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etgyI7/O2Eajooeo//mJERaEkKv5YZhHFp8/YTZEIFKME6FmrzFgNheb/kUvhCFsVoFzk1MokkdPyNbkKRwmdm9SzXNc07rgOkl3KevQuYr9ZZIkG1L64XnEkTT/PcW21X6DnuIlXpgqLf9A5dQusn8o6sEDtmTYfjSwqG1WaQVWOOMI1JVdcp7SrLZxrqkKXkhDOTZXz7+ZKyg6KTpDtnzZ0AT+aOUWDts3p8qUO9LoJimR/do0+1/00UOhIiA4MM7KyKMyZMcLQJoF0gH+PD8E8USSxBssYy3rUzK4qNzS4kRCiMrx9gKYT26ot2sMWnaz9TGKkSxXFGqQ5S3UiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMCuIlgJ7GZsdR6LZtAl8lNWL0QAfebrcz43UeWvlDc=;
 b=ik+EqYt1WS8amG58v4Fq9o00nyQ2TrUM2tSBP4+qhhfgJxZNJHuwakEi8IAZs1Ui0bdlmqtrhdI2dc8lNcLDZIpizswK/sHUhCUn1ZZBdL3m9jEQBaNMUfpQvYDtr6tf1yUyJMBOKzkxHGxky75YU3srS+Ovqn/f1djIUQidXFhsOutdDu6vSS14yCVjhF5PsnKCnYw7M0EVAWeVrSK3aRpI+Cj7lw2x7IwdB7zouG5zC5yuXolRPRKge53fYaHt8le9xmVrf+tvRXx/lcSkcIeGh1oyD1thTPZvbbGt9TcbyjxqeA7xTZyHDiBtM6Fw51i8C7eU0swy00JTQGqZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMCuIlgJ7GZsdR6LZtAl8lNWL0QAfebrcz43UeWvlDc=;
 b=vIpgOmhwZuvjzoEn8d/DobkF3aszRdUU8OrEqcl4ukpEH54NPOKieX3bm47kJ5PR66NUzxJP1IliLqR1anRgdhwb5d6GftOa3qHyjZoJ6H/mkkgi175i3yWtoFwK2a6ca1X+aUDw89A3QfhmBTFfVeC95W/qb91M3H+hIlasWPs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8822.jpnprd01.prod.outlook.com (2603:1096:400:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 11:28:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 11:28:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Thread-Index: AQHc54F0N31V6fbiPkmyIxeaQ1X46LYk3CyAgAAOCxA=
Date: Fri, 29 May 2026 11:28:08 +0000
Message-ID:
 <TY3PR01MB113461471EEAE696471371AE686162@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
 <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXGjA3FCsO0QGLaRbYm0FaJYUXkd27qiW+NM8R2q5Mwdw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8822:EE_
x-ms-office365-filtering-correlation-id: c1b1b4b0-d3d8-4ec5-177d-08debd755bf7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 MKJf/gDj8chSwb9Rpd+8GNJfZ3agNEXuSXk6IVZixbNLLXsVU9bzH0kdhp6LiQgZlxn876F5IYsd4QJGIiNTpSlYxy7mpUC3vCX/jeR8dw/HPTdESA68Wd681ehg9c+ZWy46T6GWXmWco/jDfdWeKBDBLhC9d9zZ3hbBZtRxpTsWHlkCoY8AIJuDlQu213XaxaLfHKB1GjSl372JcyrJ6AA0msCrCDNXYXmxPQXE4EScdbkXfIeirZHxBL609OktDtC0KEePKQ8jMskbscWCQDpVup6PfwOZ21UoxqJlNdAt6VHoLBSmssEZudS8Sj3QJaJ7KZNbEznD8hZ/AN42KJ83YHcddVzpjXj0VIVLZQYm1XOKTbYE/SAkCjUvPFZQv4UYjarzn9bBnU1l5OUKNFAfS4shhcqtcFlELpmKhMjtvA/gbr8NHY9tPUybGH2OXgHkQ9jcXJRpY7e9W7QeFq33fdsHYVYZEJMkZPXBADIfLvCG+Cs5ApsbfrQRPlFAVEyb/eMY26mfo/z8JP/hNk852pm6tS5hYD4dshY/FzOaaoXHJtDtRTjdM29oLyAjlKDEhE5NtjnHWVrqYaf/afMTCPKBsZqEU0RGmUYyyu/eA0YNIYKLAUE746iFnr2NQNqVrOU5g6fIj4UR5yelQMcFAQL+pqy90ktNRGci+/UQSxT0sPF4t02KTK3UkmYN+R25lec5aF6WtWjlLBrneTfxAaKm6hywd/qVo0QXg41bFP+IoCZSMrt1X8hMYuVQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXdtUFdPL0k3WkZsR0VBcTIyQVpqYnYzdW91ZUZ6Q3lnRUxZeUZ2b05pM0FQ?=
 =?utf-8?B?dVdLNDJlTmxpTEI3TWJWZlFQVnpnZFN2TFlTRk5ULzNrWDB1OGN4cFFJUU9U?=
 =?utf-8?B?N3QvbmJkeUQ1aVdVRGV5MG9rU21BbG5ZZE41NWFhQzFuTnN0d2l6UWJkWjZN?=
 =?utf-8?B?QUJhRDhwMk9DNENHMHpETzNBWjdCR01UaGlHaUpMazFnejZ5LzFieVc0eHBU?=
 =?utf-8?B?bjhaOTAvYkVyd2JKSk1LTG9ERG1oQ2gzK2dlRkE3SWNQNCtSQ0s1K0xYMytp?=
 =?utf-8?B?Tk8xQ01YV0VXeCtnbW9WWlhFVFdvZERFU2xldlVCZ29kbmgzQnhuS0hDaTQ3?=
 =?utf-8?B?UnYrZWgzZ2xaL3V5N1A5Ry9sNHNCN0dqNUJiMFR3aUFlUnU5L09YUE1kQzgr?=
 =?utf-8?B?ckk1N1JOR01xZkdYdG1YRGYzYko5YVRTTSsvZUpoTEFCWFdoVHBUTDlaeUF1?=
 =?utf-8?B?dm44ZytPaUVpSVMrS1NvTnJHRmwxTGZocnpPaEdoVFBqcVRxeFgvVmJCelFm?=
 =?utf-8?B?VVZIekhyRk9JQ2kyMnBSMWt2UDV3VTF3WkI3dUZ0KzdDU0tBZjM5NjRoVEhW?=
 =?utf-8?B?bWNwWVJCbFByY2pBMHdnMHcvV3l0YlVPUGtvUkdZeVF4bDhCbEYwWnZrTHh0?=
 =?utf-8?B?VVB3Zi9ML2NubEg2Uzk4Z0tmM1hYTnhFRzIwcFBUTVRVTStCQTZwaEV1REFK?=
 =?utf-8?B?czlsYkNyTXNIR2hnb1NZMWJicW9IdjZ0VFlNTnVJa2lxYVMvaWRjc1VQVWFU?=
 =?utf-8?B?cmx0SzZTNDl2Ui9iN2poOGtuamhPamZPbk5FejZUcWRmMzdPVmkyWXVJc0dY?=
 =?utf-8?B?bWhTK1pjUVlqODJnbVhINzVHYWJGQVpZenJPSERRRUk2THgvdlhyQVVXZkha?=
 =?utf-8?B?d1JmQzNiYjVIeXNyMGc0OXpncFJZNWhyYmhvRXBnNXF4amFBQlc1UER3SGZl?=
 =?utf-8?B?dWVWWklGOGpXYkpUVGFvcW1KVkVVQ1JPdm56bGVkY2JtVmFCdUs4V1dZSkVx?=
 =?utf-8?B?MlArNnBnV25ickN6MWtmVmJNWFpEYzB6eFdCVkROUHN1V3V6ZGQ4WnpDbnFl?=
 =?utf-8?B?QW9ZNkJYNVZnL1I5OWNZeUplVVpvZzlqOUFmelBqZXBmcWpFMWhwL1dFWHY2?=
 =?utf-8?B?MXJXRzJoNWU2djhzekZOdFVKU2pKbUdkQzQ0ZXlLa1FFL2E2U0diWU5xR3l0?=
 =?utf-8?B?Z2xXelhnT04zRXNyMjFaNkF4UlBOSCtCYUVXRU9wM2pPdWFpWlVuN2h0QkZT?=
 =?utf-8?B?ck1qSXdWblVxVmk5cTVsL2l5OUE3TjZkS0JhUmNIcXFndURHSHFMd3JKK0dS?=
 =?utf-8?B?TXZDNU91TE5aOTlwRE5MVE03VE1DdHdRZytkclp1ZTlna2lJL0xQbTY4MS94?=
 =?utf-8?B?Rlhlc2ZWbUxlTWNEbWs2aVJrWC9oN0hhdGkyTzZmcitTSjV5UjllNzVINmRD?=
 =?utf-8?B?Q2ttV1JNU1ZUOCtqNHB1U3AydEM4NWlqK3dxL0NNR2hGNG1lakJhci9tSzVV?=
 =?utf-8?B?V3p2RnIxaGxJU1pxSXlHTnNyMlptekpaQklkUW1tU05zT1RJWGpLWUZVRTQ2?=
 =?utf-8?B?NU9hZ2tBei9TVlZqMmVOS083ZlBEWmJmTlNndHJwSEFoSkMvR29NNW9uVnZ6?=
 =?utf-8?B?aEswb0tST0UvR01tUkNEN1ltdkZsZ1VZR1kwLzJseTRlWmxlSldHKy92QlIy?=
 =?utf-8?B?Q3JvTjlHYWRONzZyZFVpR0NQdlB1U3ErTHI2UGpBU29tYlFWN3pVYkNuUDdE?=
 =?utf-8?B?SWxjZFQxUW1YR1pnT21CUm5qZ2lmM3Y1ZHNwVkVXR1NsLzRiTy9tRFFjcUw0?=
 =?utf-8?B?MlBoK3c3NGFQUjllR2tYZUhPK0FadHNQbFlQMGc2RHdpNHd3OG9zSVMydnpG?=
 =?utf-8?B?cXlpYnZGMEVsdjZXMlY3RUtjQTVjN3dTN2daWG1GVCtzZFhkOHBTZHQ2WWd4?=
 =?utf-8?B?TWJzbjF3SlpaZXRJNkthM1E5M2xBMzNPblpRaUZLeXNPNGhTaDZOUEo4Wk0y?=
 =?utf-8?B?TGFZeGNvREI2RmhXSU5VaXZXbmJDWFp3TEgrcmlwYTBNdTRIYm14S0VTUzNm?=
 =?utf-8?B?L1k4YzZya2k3NEVMUWl2UlpNSElTVHRLcUlmSXpENldHTkFGLzcwWVpqaXYw?=
 =?utf-8?B?amVwb01DRFBHK04ycG03REJMcWUzelpFZUhnbktuTDFrcTFYMWZHaHBoQis2?=
 =?utf-8?B?dUtJMlVmRWN4dVA5ZW1jZ2QwQmpZUzJ5d0oyZko1aGtGOUpONU5lWFFUbFVv?=
 =?utf-8?B?cU5Wc1RpRUc0UlplcU1FcnI2M0lXMVNiY2lCRHp3eGh3MW9TKy9ldmFaK3lm?=
 =?utf-8?B?cndOc3cxa2p2YUhTK2lQUVN5ZDdXRnhIWnh6bG1zUnh1K2VVQWt6Zz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b1b4b0-d3d8-4ec5-177d-08debd755bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 11:28:08.3873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r63riqJJ+YQCJk6qbU0YuvjtNmK5en7hOlr8OH26vYsnSuAejyFlzC6tlxfzsowjb8/yAg4tt+e0ZnViH5LdGbdrTaBNnReeLAk+yOKxXZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8822
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33340-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7851C6019B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI5IE1heSAyMDI2IDExOjI2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDY6IEFkZCBSU1BJezAuLjJ9IG5vZGVz
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxOSBNYXkgMjAyNiBhdCAxMzoyMCwgQmlq
dSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgZGV2aWNlIHRyZWUgbm9kZXMg
Zm9yIHRoZSB0aHJlZSBSU1BJIGNoYW5uZWxzIG9uIHRoZSBSWi9HM0wNCj4gPiAoUjlBMDhHMDQ2
KSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiBJIHNwb2tlIHRvbyBzb29uLi4uDQo+IA0KPiA+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDYuZHRzaQ0KPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDYuZHRzaQ0KPiA+IEBAIC00NDIsNiArNDQy
LDc4IEBAIHJzY2kzOiBzZXJpYWxAMTAwZjMwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4g
PiArICAgICAgICAgICAgICAgcnNwaTA6IHNwaUAxMDBiMDAwMCB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA4ZzA0Ni1yc3BpIjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDEwMGIwMDAwIDAgMHg0MDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA0NDAgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDxHSUNfU1BJIDQ0MSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDQyIElSUV9UWVBFX0VER0VfUklTSU5HPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNDQzIElS
UV9UWVBFX0VER0VfUklTSU5HPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPEdJQ19TUEkgNDQ0IElSUV9UWVBFX0VER0VfUklTSU5HPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiaWRsZSIsICJlcnJvciIsICJlbmQiLCAi
cngiLCAidHgiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQ
R19NT0QgUjlBMDhHMDQ2X1JTUEkwX1BDTEs+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1JTUEkwX1RDTEs+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsiLCAidGNsayI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgUjlBMDhHMDQ2X1JTUEkwX1BSRVNF
VE4+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIFI5QTA4RzA0
Nl9SU1BJMF9UUkVTRVROPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1l
cyA9ICJwcmVzZXRuIiwgInRyZXNldG4iOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRt
YXMgPSA8JmRtYWMgMHgyNmYyPiwgPCZkbWFjIDB4MjZmMT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZG1hLW5hbWVzID0gInJ4IiwgInR4IjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IG51bS1jcyA9IDwxPjsNCj4gDQo+IFdoeSBzcGVjaWZ5IHRoaXMsIGFuZCB3aHkgb25lPw0KPiBU
aGUgaGFyZHdhcmUgaGFzIGZvdXIsIGFuZCB0aGUgZHJpdmVyIGhhcmRjb2RlcyBmb3VyLg0KDQpP
SyB3aWxsIGRyb3AgdGhpcy4gTG9va3MgbGlrZSBJIGhhdmUgY29waWVkIHRoaXMgYWNjaWRlbnRh
bGx5IGZyb20NClJaL0cyTC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdo
ZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0KDQo=

