Return-Path: <linux-renesas-soc+bounces-31204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MxJJ6GK22moDAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:05:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC493E3B41
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 327B13000A4B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B772877F7;
	Sun, 12 Apr 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R0ogudmP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D5D4F5E0;
	Sun, 12 Apr 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775995459; cv=fail; b=ehbrAnCpzV6ZGFKLLVMw3gWUCT4ZVFlBAHdFNgzJmuuarIi2W7gJKFRMJZI4Av3JndJqb2/h/VSh1GawAAm63zMLDfQIX/kNwQOc/kKGMfj5Ha2I0DrM6xP9WVPPVEa2uyqtrwqjqvdRQSSsj4+iL8X9MsAn5o9URg3Oej20t3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775995459; c=relaxed/simple;
	bh=eOFVBOT0exDlh3ESJFEyvTgiSCg0xjoM6D5aEKFhSUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dr9JqBsU+LCrhannYfS8ObF8lf09Ntds/L92T0F3kjp2byM5tc6+TESl7YMJFEBQt5KSOo6kGWB3SCbWTbCq5Jh13lXukbtmWXdLfwRDLeRnPrIYGIabLFyhnDuutGIZyUzVNhvLGKseTT6ITFvggjI/QjmcFhRCkzMw/5xmd04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R0ogudmP; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s24qhwZhvLQK0IftNPPNGqawjl4I2psTlY6RiIQGxAvJnC9sbAocX3BicR1wvAfMbzomlM8SkAAfzLtzx4zQ2ue0AE7UyRaphL/ZMdBn7FVHPT6As9voNMZf5CctC2zFg0WD8tP32Wpdot2x7Jhvwx1CUcRFXDRrSEssYgUbu7XqMM91kj6MLiayz4bBqV9Udwfgixwme3aJJy2+5Z+E/OHUiWqGQIOPy7ftl1/9IgjHHkx21bKhLYtNSK04dqvTMe+TCJtrUkR7YzjkT+IX4tsY/Ov2RcPPt0dXGbbuFs9VUOjFj2K6SBSv+QQi/aC1mVxOS+3YmK5SoeRC8/2g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOFVBOT0exDlh3ESJFEyvTgiSCg0xjoM6D5aEKFhSUc=;
 b=f8XTgCd71ZaCMN3usyDedvHZMW1DZaRKwcziuG18mtYlHbhiJPGaRTHZXYlL9/G9tBRHF3o0m0xdUt9JScilIH/4TOF5xq/mxVBZYDuqLBCHI18LLPNVmjtqjImGzNERML2LLQEyFMwaoJ1zgzfwVQO60aSHlVYp+OsORHoJON+ZWYMEcmkQIGuEFGoruq5OmFMxTF7s6GPm+F2RAMUOqUeZfmXQI39ttDP0XA6RJbh9tmbZlJLjjUdbBmOTP9wbC7OD1GqhAdUHaODG4BDBNXQ6xCRDMGRclD5TDsRpYoV5OZPFqppRNI6YmLNwqBTbObGMmA6vhcJvRsFR1bvzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOFVBOT0exDlh3ESJFEyvTgiSCg0xjoM6D5aEKFhSUc=;
 b=R0ogudmP0D/Bcq7Ssl0k7a8BlmY0jx6NKuQvpH8ys6u4Eu4bFIE3vmzS5qwQxnAGt1k6OGx0RguvFLUUBS4IdaIDhk8KL4S/jcH1NBkW60P9VonH2Nd7gypTG2DRI/ECUp5N900fUvyTsO5O199RfN099Iar6J45J2Wbn9AUYhg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11783.jpnprd01.prod.outlook.com (2603:1096:400:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 12:04:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 12:04:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, biju.das.au <biju.das.au@gmail.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
	<linux@armlinux.org.uk>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH next-next] net: phy: mscc: Drop redundant phydev->lock
Thread-Topic: [PATCH next-next] net: phy: mscc: Drop redundant phydev->lock
Thread-Index: AQHcycrfhoFzrwC03kKFqOO7eyOFUbXaVIeAgAEAr9A=
Date: Sun, 12 Apr 2026 12:04:10 +0000
Message-ID:
 <TY3PR01MB1134692A87B739A042A75A71C86272@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260411154959.200091-1-biju.das.jz@bp.renesas.com>
 <bcacb8ae-f35d-49fc-91a8-995387dc07ca@lunn.ch>
In-Reply-To: <bcacb8ae-f35d-49fc-91a8-995387dc07ca@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11783:EE_
x-ms-office365-filtering-correlation-id: b90c6529-7157-45e4-5630-08de988b9b18
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 MH/DjfDzm4TsyFhhfAHCbqiJrnNsdaSBNARbwzvwm0d7NQu/3a5lpmguFjiQs5Al4IoisYxUq/c+k8cngkXmx882qz5/mfeUCWyZs8Ax//X9rQupEyM67yjNLpKRhxQnlD3Ss1PzS90lla+xcDOPpU8/7hhVT2wv1YtKT04Ff2+07j1TUMP4aIYJeNr/PQV4fzzP6oOgiAwSKcZTFr0K4XMBxJhA1RX/BcBUymzjnuih91HScUheRCIjpeo4t/PiZAOqXpz5XOkaSo5in2J3omThiBL5dG5z9iHaI6C0TDPiRddKstYRA4VsaNkirtNf2izndUjRVF9e37zqfZk2gTN7xlQDVj2wIgoTojFDJK9C1hLqzmB0zeoZigzJglbLM1ycezg0KD1Hbd9RehuPo4yhEm8mZXxYQwXI7o0KfXN5oWhx/0V4hFVuVxmQo+NKClMSynpl9dAOPVrWhyYmgy2Au5lR4YZdI9CjofDvdLGuv7R4whCZLHj3e0fzULMs02U12fxxhDSSf49bMzq3exWn07jc5trJXnnHSU7S/eVhmKw2oe8f7NC0V4bk3Uy+EfARdhAZxUkE5BjRLPpxzVxN5t3WNZj5Vo1lnmeoNhUSBTwiakE1cWKKue9oZ1QMRXG81xdokAEVennJPyYzVZ9d4tICP7haMoKRFmzC7OU8wSEyMI/vfhlDY44/dMf0upEMz2pftgDa1bRd6qlhQ0nsp6lJ/AfYllaUsE+arTf+cfYIMyU2j6AHN01a1mdnfO9ZTWJQqaHJI4cEdQS6viV67e2NpDoEX61K2X3NNxg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWxZbFhNQ09RNjRkUHBLOHIxWEJWaEtzRENEc0JaUzZXVWp6bzZ6dlFyMVVE?=
 =?utf-8?B?MFBqRzkrbU9jWGdoRm1neXpGdW9ZOTF5NWZqSzluTFJXTDhaeW9SUmFxa3lS?=
 =?utf-8?B?ckZEWWxsZDVSQXRPaTZWenhlOCthenBFbjUyT09KcGhJMGdXT2lZdHprSnk0?=
 =?utf-8?B?b3B4cUlMZFM0L2YvTlltM3ZXa1EreG5NMWNTZGM4R0tvcHYyUnVDZGc3cXFs?=
 =?utf-8?B?ZklSTUtHWGV5djNKclZhck96OWdVa3Y1Y0c3SHFJREhDSXNGdUxzNFNlQkFH?=
 =?utf-8?B?cnBFeHhGT1BsS0NOSGNkUEptYlRTdGY0dnN1dTJoa0RtbE1oaENvb09ubGJ0?=
 =?utf-8?B?YWh1aGtMMW1yeXZsWmtnMVJrR0h2YVJpa1p1VXpqZ0M2YXJySzJEbWpEQlFD?=
 =?utf-8?B?KzVSUlA0U2VGODRkRk8wSkF0cTJIWjY2MXRyYlo1d0lYc3N2ekt0U1pxdm1J?=
 =?utf-8?B?QUpHYmd0ZGhISUIvc3F5bHZuWW0rYVVoblBiYWd0d1dON3RmT3YyeHIrTzh3?=
 =?utf-8?B?N01VaHdVQkFzNXBCR2ZTY1hrRzBvMGgwLzNzdXFvS0pPM0ZkYjVVZEw3TlVZ?=
 =?utf-8?B?NGVMTTA2RHhvYnZYSXF3TmNtZUtoMFZsYlVaVXZPUVVIWGVweWZJT0xuZVBk?=
 =?utf-8?B?eVF1S1BiNkNiL0xjMyt4M0xGaXp4K1BIb1lFTVMvbFcrd01nVmhXQ0E0NzZ1?=
 =?utf-8?B?MHdVQ0RrajArUVFXRjhJcjE0K3B0ejJaVUdnbUJUVHJUa2lKdzdMVXVmSzFG?=
 =?utf-8?B?WWpVQVF6WncvRGhhblNEMmdEWFpuZCtueXpGU2U5VmdjcEcvcTZVVXFOOVdn?=
 =?utf-8?B?OGJQNVZvVEltL3NuRzhFbVJhU3JmTzNkOUFpaGxJeFBiRzhXQnNBZHpaNTB5?=
 =?utf-8?B?SDkvR2JnQ2FXemlrL0NpRjVIdjZmdzBEUkJqY2RrVUhPaXhjTDEvanNXSUhV?=
 =?utf-8?B?dlpEZmZqOXJaRmxoM3dUNlZwdGlPNm1uYm1xeVJQZDVwbjJjYzZremwrNGtz?=
 =?utf-8?B?UlVOdWh5clRiTlRwRC92RmxMeEIxZC8wdnZkazJXUVd5ZzVaMExYU2xiUEc4?=
 =?utf-8?B?WkxNTStCQkF5aEdEQkVXTm8xTmJpVk10UmxjOEhVQUhkc0NLZDM0djF6NUpt?=
 =?utf-8?B?eFJYZWxVN0JXdjZEQTdkNFZQamFIdjdwY0R2SXU0YU44L1dYRFQ5N2cxekx4?=
 =?utf-8?B?cVI3Q1JOMEErQzFVTHNuVzNmNExadGw1eGlCOXdXdVBHZW5ldlBEdzF0RC9R?=
 =?utf-8?B?Wm1uWlpKZUZaQ3RyQTRhM29DUDEzNTFEQTFMSHVOZHA2MGpjbk5GQytWWVJx?=
 =?utf-8?B?eUxIMEFYVENHa2pqQWhmR2R1NERLY0pPSzBCbk5TWTh0T1pnMWIrdDBPRDFX?=
 =?utf-8?B?M3BuMmE5amFwaTB6QkVkVDhEQTNhcjVoWnkxcXRtTjNkcUlkeUl1cE9vRUVm?=
 =?utf-8?B?eTRnVjl4ZFY5M1RtdWg5V2M3aUpLUFhjaXkxemNGMmJwT2FLSkhld3lySTFr?=
 =?utf-8?B?QU9mTUlBUmpEbC9FUUZXTXhGdEt3ZUpSOHorSElyU0dFMkNVaWZJYVdFOFpK?=
 =?utf-8?B?ekFnVWtXMWpyWXNaaUlsOW9aRVY0R0I3TEpLdEdjSGIxOFNhclVZcnN5cnk4?=
 =?utf-8?B?V1BmbWlCMmx2MXNBL1NzYnRpUzhLbDRrL0lBbDFFa0pnOEdvSVdDSmo3RDUr?=
 =?utf-8?B?V3lQUUxsRlZjS01TU0JTNXFDMG5GWklORXY1YjlkQlRYNmNRd00rZlFLc0lC?=
 =?utf-8?B?ZVp0RE81SXNGNlRjWkl2MzNJV3ViSXd6Y0FRVjhta1ZPd2hrL05LTjVIbXU3?=
 =?utf-8?B?STgwc3RqZnROY1NIM01nT3NKOVlmRlVMYlZrdE1zVTA5RWpmSmVRZHE2YURC?=
 =?utf-8?B?V09vdUVqQVhQVm5DMUhLL0djVGdtVXBjUlczbmZvMjk0OWFjb2d2Zk9NeXN3?=
 =?utf-8?B?Z1hXQ3Mza0NwNk1nUkM0aEpKOUZMYWgySEZ4RWlpSFZQc2hYazZXa0g0VnBZ?=
 =?utf-8?B?ZzBjNE5uTnFld3hiMUI0SWk2SXRUbkJyZVJmcGpwZDE5MGh3a1B4aC9YcHpy?=
 =?utf-8?B?VUJ1Um1odExuTmsvY2k2ZnA3ZG1TNW5ESWRMRkc5WDdYSnU4WVgxQWNCZmNV?=
 =?utf-8?B?NmVKV0dlenpOUGZ4TFV3ekxveGx6KzFicFlIZU14b3ZnVWJ0WXJTL3B4bVlW?=
 =?utf-8?B?TVJaWFJhT2Z6MHNSWUxKVEJWcHQwQzZHR0psYTR4U1lDdWxsZ3QvTi9TN3lz?=
 =?utf-8?B?VG4raXJBdHh5dEF4T0pwNlV0MnBPOWZ4VGpMTTFVU0NzVmdIVDNLSnhqaktO?=
 =?utf-8?B?UmV0cU4yc2NuSkJhdUI3UU9Dd2l3QXAwSUsyN1hUd0FXYmZUSDV2QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b90c6529-7157-45e4-5630-08de988b9b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 12:04:10.3020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auN2Mgr557mOjXuFKCQSY0J0X3uzJSw5GDTcBoYAlUim51TkzcjfcuCmrW86qNwdcRg0pSyVMT0fkFTFdqDWVgyI/95hzeE/UgbU7di7ocs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11783
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31204-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk,bp.renesas.com,microchip.com,nxp.com,vger.kernel.org,glider.be];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,lunn.ch:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEC493E3B41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBMdW5uIDxhbmRyZXdAbHVubi5jaD4NCj4gU2VudDogMTEgQXByaWwgMjAyNiAyMTo0NQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIG5leHQtbmV4dF0gbmV0OiBwaHk6IG1zY2M6IERyb3AgcmVkdW5k
YW50IHBoeWRldi0+bG9jaw0KPiANCj4gT24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgMDQ6NDk6NTZQ
TSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiBSZW1vdmUgbWFudWFsIG11dGV4X2xvY2svdW5sb2NrKCZw
aHlkZXYtPmxvY2spIGNhbGxzIGZyb20gc2V2ZXJhbA0KPiA+IGZ1bmN0aW9ucyBpbiB0aGUgTVND
QyBQSFkgZHJpdmVyLCBhcyB0aGUgUEhZIGNvcmUgYWxyZWFkeSBob2xkcyB0aGlzDQo+ID4gbG9j
ayB3aGVuIGludm9raW5nIHRoZXNlIGNhbGxiYWNrcy4NCj4gPg0KPiA+IFRoZSBhZmZlY3RlZCBm
dW5jdGlvbnMgYXJlOg0KPiA+DQo+ID4gdnNjODV4eF9lZGdlX3JhdGVfY250bF9zZXQoKSDigJQg
bG9jay91bmxvY2sgYXJvdW5kIHBoeV9tb2RpZnlfcGFnZWQoKQ0KPiA+IHZzYzg1eHhfbWFjX2lm
X3NldCgpIOKAlCBsb2NrL3VubG9jayB3aXRoIGEgZ290byBvdXRfdW5sb2NrIGVycm9yIHBhdGgN
Cj4gPiB2c2M4NTMxX3ByZV9pbml0X3NlcV9zZXQoKSDigJQgbG9jay91bmxvY2sgYXJvdW5kDQo+
ID4gcGh5X3NlbGVjdC9yZXN0b3JlX3BhZ2UoKQ0KPiA+IHZzYzg1eHhfZWVlX2luaXRfc2VxX3Nl
dCgpIOKAlCBsb2NrL3VubG9jayBhcm91bmQNCj4gPiBwaHlfc2VsZWN0L3Jlc3RvcmVfcGFnZSgp
DQo+ID4NCj4gPiBBbG9uZyB3aXRoIGRyb3BwaW5nIHRoZSBsb2NrcywgZXJyb3ItcGF0aCBsYWJl
bHMgYXJlIHJlbmFtZWQgZnJvbQ0KPiA+IG91dF91bmxvY2sgdG8gZXJyIG9yIHJlc3RvcmVfb2xk
cGFnZSB0byBiZXR0ZXIgcmVmbGVjdCB0aGVpciBwdXJwb3NlDQo+ID4gbm93IHRoYXQgbm8gdW5s
b2NraW5nIGlzIHBlcmZvcm1lZC4gSW4gdnNjODUzMV9wcmVfaW5pdF9zZXFfc2V0KCkgYW5kDQo+
ID4gdnNjODV4eF9lZWVfaW5pdF9zZXFfc2V0KCksIHRoZSByZWR1bmRhbnQgaW50ZXJtZWRpYXRl
IGFzc2lnbm1lbnQgb2YNCj4gPiBvbGRwYWdlIGJlZm9yZSByZXR1cm5pbmcgaXMgYWxzbyBlbGlt
aW5hdGVkLg0KPiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBU
aGlzIHBhdGNoIG5lZWRzIHRvIGJlIHNlbnQgYXMgcGFydCBvZiB0aGUgcGF0Y2hzZXQgd2l0aCB5
b3VyIG90aGVyIGNoYW5nZS4gVGhlIG9yZGVyIHRoZXkgZ2V0IG1lcmdlZA0KPiBtYXR0ZXJzLCBv
dGhlcndpc2UgYSBnaXQgYmlzZWN0IGNvdWxkIGxhbmQgb24gYSBkZWFkbG9jay4NCg0KT0suDQoN
CkNoZWVycywNCkJpanUNCg==

