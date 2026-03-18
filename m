Return-Path: <linux-renesas-soc+bounces-29777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFJhEuWnumlpaQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:25:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB42BC182
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDF4302351A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D943B8BB0;
	Wed, 18 Mar 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GvYczk53"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985B39E198;
	Wed, 18 Mar 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840354; cv=fail; b=aJ9/NSFwyrC21wGdbPStbgbW9qaDKDrjPX0agNIPZETsTMz0JWZcH0J+ZKjHCEJjfKxtuXxSSbU3G5fUgdeeUqqD3BVi8ieM4oa11+kDlf6VojOvcDu/97wRoPEZ6oBKpv2vtrZfXipKCw86GfV+mNDmgO1+otif2zaylaRJdTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840354; c=relaxed/simple;
	bh=HpUoh12x2OUzKlY2YV5EmcnnlCifqr5/qBZUoFiD9Q4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhtyQ4lCueDfaxx5MF1xX8InBi1K2TD8DsS6Cd0eCIKpH2i320r/ngmAHmrfYuQrTCMkY6c63oeryiVwIO/XWzl/p13UcI284gRNfzKJJbulAjh7WaeplXyat3+tjcpJUl1VMkWqO0H7TGJwa1rbpTDRAklI4atsI7kKrTTRhEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GvYczk53; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmPi+2AMELOykPH3mVs6CYSCwCekPGL2ZgJS1mfgp2Uv65+uqi7jbM7gmtDnulw6UPmQsgCiqKDRlEocstfZf5lvST7fNftw1WGRiq+g6G9gLCfBBytUkW1ujbhMrOZ/TGJ35+PYNDRHf++p1COkLJzHXeyWSpIk/Mq6ggxEg17AMUbSFGoQ4/87GXaBCNeuaIoRy2AXinr4ZkDrifLUtXL3vnI3f0Q8YciegHsKp+RSmwsFLMWtROh/scZe2Q8Tt5+AR4JlVjEIsivg+9Q+kCngL8CfSaR2Ib5VACqkFuhUCZMrn2UBs1xT08lkyiDJWfamK7sk3F1Ih9TjJETZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpUoh12x2OUzKlY2YV5EmcnnlCifqr5/qBZUoFiD9Q4=;
 b=LmhaNsDn1nrVHBeLqY27YF0tfP9SXSyViUU9k2obXbuGMa/gTHVoBUROJM69YX0RrzxEA6l+H94wVgsJCLJOp/q7wc2iKPK22xiVOFOti35DVxNpq9eFM5jPx+1keYyLFPK7ARhKjpD0wWoWwLqgpbNSCH7A3yjiv47bvjykw4FPNx26ff62d8cOwsYeUMgbZ0e0KfEqsA1Ton8ena9KnQZDOq73xfhz6G6gGFHUYbamtgmc/Hp28iVoTSFHeZ9mPuSyGFFqH9LutlT2WALFYW9QjB8VKhnBXxFVRuEUVGVnxx7SaETDMxkLTb8fXSU0T1BMzRxS993OgCINut5PZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpUoh12x2OUzKlY2YV5EmcnnlCifqr5/qBZUoFiD9Q4=;
 b=GvYczk53rzQF8/LBtHm75NKSiY4e5V7gKHvNBQ5qrSPuU4uMIKSL3IHlfFS+kJTftqMeoYH9DMFJiHIUNBKuyAzJRNgXQX9bJSRObSX4Lc23sW1G2hLSUtdF4Bu2EU/n4o+aVaXOXqlDH5v0WEFVW1TggXCT4Ohj0adD+5JpLcw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12568.jpnprd01.prod.outlook.com (2603:1096:405:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 13:25:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:25:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Pavel Machek <pavel@nabladev.com>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR
 string
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed
 MODULE_AUTHOR string
Thread-Index: AQHcts7pZuw6Ks9jpUyRaoUGm0idjLW0PTQAgAAFcKCAAAHWAIAAAyVA
Date: Wed, 18 Mar 2026 13:25:48 +0000
Message-ID:
 <TY3PR01MB113464A821E0E2C9AA6D92E73864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com>
 <TY3PR01MB11346D89F6F7C332FEF0D08B3864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXph-ns=8hHWoDKoNgUiGQ4=A9+aASim6qrLDdAE_mPMw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXph-ns=8hHWoDKoNgUiGQ4=A9+aASim6qrLDdAE_mPMw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12568:EE_
x-ms-office365-filtering-correlation-id: e908670d-6ca5-47ba-a524-08de84f1de80
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 VgYClAFJCOOf7E5+C4gYzS1n+hj3y4dJ83GBstFy8KQK6zeU2b9cUxeIAjvVOGlYSaWqT9nNsui5AIy0xvjcaqO8pRLQf9MMqBnZ5YBTLz7fl8krf+P/y9j0yl07wvLpf8bD+AIjuBze+Wr/XrA1p/RlzJFjqqZ5QcH7f4z1Lz5dSgfrzU5xoouuv4sN7IMh7Cts0oQtjvaPOoFKgc4hd8sm332T4PC14Vb+1LXh9RkIvOEUhmny+LvnHepUnrYn0I4apisMK5BBTrwUq/Hph9/nVDcqCBFMwjmGKDNxcePAIVR96RwN59DzvtipphKr70XzGYlKGCf7Na0xEkVIq0rnMzk86Kk2t0ipXLA0v+Bh0w30BGY6O8THSnf95uvk+dxPDf/HEBWQOyRCAbToAZ+7prxzaL80GL/Mo/xWfUfcmd3h37xYH5eESESELRg/V/xmOaXDRCGz6IVUzbRDPI0rSUMZCvpWYEOoTqhdH7krW43ABFcOEKqir2nChDggMMTIW7CVaqd2p4NRFFGA5jLVWhtSK+z2ovDDt0GghvSJxTNpPni/6GpOKfqk/MNObFPSsgJ81+5vBrYwIraAasabGPFTRwevDvcJvACjp/GWoKvs7C3lfK0u7eXeQYXrYrlpdkslk2GStVs4A6d2pW8pOWGuxpz0d98Vs82w9Eb79XoBTukiLNnxNGxEnf9/B8RODtPW1AdE/qw1Vvwr3/Ku9Iu/+/nH7bFDtpzJarzDISCnBifHekrcpfXB4uAq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE01OHhtbTBxWWhYczBoQ2FQODJiY1hMWlNMRkFJS3J5SHZjNmZKaVRiVC8y?=
 =?utf-8?B?eWlwdndGMGVHeFl6dVUxS2ozc1NhVUEyUWJHWnNVRkdQdC9oMkhYN0M3MGlO?=
 =?utf-8?B?UTFiS0gwM3g5QXhUS0xUSHd0ek0vM1dqTklJeTh6M1ZhU2VtOUwrUURXTTU3?=
 =?utf-8?B?ZVhQMXkxOEVqSDYweEUzZGFmMFBHTWFvOWIyNWtjamw5NGpBdWVhTUo0dFFZ?=
 =?utf-8?B?QytXeHBRcWs3Qmx3NEhsV01SL2twN0xHeUNlYzNFTCtFRUVvMEV3NU9FaTJS?=
 =?utf-8?B?cmtXT3ZFcEN6b0ZGV3ZkaThqQlVYYnpVVmp6T2hnYWo1MEhBQ2dyUkhNVU9Q?=
 =?utf-8?B?ZTZmdlRzSlJLSGJicFI5TzBMQnVRTHJEeHZKM0ZJWVFLYU5yeTJEaDUrZTQ4?=
 =?utf-8?B?QUtjbHhZenMxeXVsUXJ1YVZsV0VWVFdmS1NCTkhmRkJkNUdsWURWMXd1dWtY?=
 =?utf-8?B?dkh5UldZYWNqT1ZLWDUzWmtPQitFTjN0b1hPVXUvS2JWZWhZOEJma1BBSDFh?=
 =?utf-8?B?TUs2QlhQTDNROEwvdnl2djYzd05FU3hLblNOaUlTaTBwWVR5Sm4xMm1nMVl0?=
 =?utf-8?B?U2xlckoxaWljVW5QandDUTNyelNPM21UUTQ4TkpVZjNELzZSQXRpRjJvZ0Qw?=
 =?utf-8?B?cjdzMFEwY2dHN3dLdkRwVEpEVTJuNUQxMjUxczRsMlk1bHJDZURrWWl1MHlv?=
 =?utf-8?B?NzJOb2s4Q2xEeVhGNTFqUGdzWndiRXFVY2JqT0lDYnRYd1MvdS9XaHdUQTBm?=
 =?utf-8?B?ZkhtdytteFVzMVpzUGxYSFA3SEtMbm1OU0w5VEMwWVFQcVlIbXBPczdDWHUy?=
 =?utf-8?B?czFWMm5scm9Bb0w2OVhGTE94bFRnN1ZCZnNmak83a1Q0U3kvc0lyQjN2Tk1M?=
 =?utf-8?B?cFlnNlFBMlc5bzFoWmdkYVdzMnJFd0FzdjExQXRzZ1pnZm5xS3RjM0xLNXg1?=
 =?utf-8?B?UThZQ0JjNmM2aXBYcWZGbnUzY25GTWVISU10RXZJZ3U2YnVGRU1rQTN2dUl1?=
 =?utf-8?B?QjZoQUpScW8zNndIdzB4MGJIWWlOMnp6bk5XWk96QlF1aE5HMjB5ZGZXY1JN?=
 =?utf-8?B?WkZxUVk4NjJOUnF2NXN5UzZpeTBQcWlOeDIyWjhxa1B4ODNleW9Cd3cvS0Qv?=
 =?utf-8?B?MTB4UHhqdzNwV0pGVEhLWUlKRG05MVZhWUR2L1FjNVl1L0g3by85dG4yQ0Ru?=
 =?utf-8?B?NkZnbnJZaUZQK05wUGZRNjZpcGRTUkszVWNDVFF0eklvLzdFdmVDTFZLUytE?=
 =?utf-8?B?OGNlbFVrM0RwOU45cXcvSStMOHJaRmwwMitUR0plQy9SVXRZdW8xTkQxdStV?=
 =?utf-8?B?cDlXTGNEd1Jvams1SlBQYStSNzZKZnVYSVJJam5wSytyQVJXZ1Q2T2RrQXI1?=
 =?utf-8?B?cjdkd213b0VxRE9UL3BmTDgzdzJFUlNBTkJhcVVOZ2dWc2dBTE43T2NhOHpE?=
 =?utf-8?B?Q2Y2NmhyU2xGM0JBMlNRSkl3clNtbGtCbjZoeGx6VGprNFBQRlhzczFmSEh1?=
 =?utf-8?B?SmdKeExLQ1VCSndiem5QT3lWaCs0TDBoejFGL2U0aHlNUHJ0MGRBYWx4RzNB?=
 =?utf-8?B?WjR3K3dodTA0ZnFuc25tVGNQTVhJQm5JVFBBQmxBTVlmckRTS2JkeDMwUlEv?=
 =?utf-8?B?dTlzVzJlM1BCdDdFUzhONDkzcUZ6Vm5nTUpuOXM2NmdMdS9LWW5xeGxPR2JX?=
 =?utf-8?B?N0pOcytYSzZmZFk4aVNKOTBreWNhUHM2MnljTlA2YzFNWWdYZE5vMG1oeEYx?=
 =?utf-8?B?RFRDTmdrWGRVZWhtS3ptUUloVW1zaTRNRWZVNWJaMU44Rlc1cU9qSkQ5WWNH?=
 =?utf-8?B?WXdDdjZyVlRmV25IUWM1TmwyRWtja2h6d3VTU2hQdmFhVW1UL2lxWkxLVDhO?=
 =?utf-8?B?ejRhUTFXdkFqRm40b0Y5bGhoWXBzaWN0YXlOeGhSeW9Dd2xXYnNRczZEbVJU?=
 =?utf-8?B?VTNEWDY2VERHNng4UXdCWUU5clE4dXQ1clo5bVpiZ3VXZm43dzRsTkhTSlc0?=
 =?utf-8?B?Skt6bnFCeG9xUy9OTnhMV29kUUhYakNKVmZLellTdUdiaTdJQzRXZ3RFaE1y?=
 =?utf-8?B?SG0vNmlxZUJZd1F5V1ZmdWNueXhScWFIZ2RFMVdSOC9HOVpKeVphbVFacytB?=
 =?utf-8?B?S2xJcFZtUWVhcjRaZ2hwcHpjLzFQZ2lBOW0vWjFDbWlIVlhjNk02L2Q4cERw?=
 =?utf-8?B?NjBIbHNaOGozcGFVcDdSTkU5Wms4bDljVkNRWkV0L3pMcElqbmFGYUZoeVMy?=
 =?utf-8?B?QnBhdEhOUlB3cVdCSGVNcGRDTk9xd1ZMWUtvVzc1ZFN2N1MzS0FYM3NxMWZm?=
 =?utf-8?B?YWZQTEZqcjRPRkxWVmtNYllzaUlYUkNacFJhWWd1V1k0YjVpbGV5QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e908670d-6ca5-47ba-a524-08de84f1de80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 13:25:48.8055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QO5lLhf4C4R6lN/NTUmjDPdbbtFpflZsHWUgOAFQzj7VJM620Rnwqay2iswmguWuRwgzXEN9WRImA+CA45IK1vsiMitpCXXIB1mN2B08EcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12568
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29777-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linaro.org,lists.infradead.org,vger.kernel.org,glider.be,bp.renesas.com,nabladev.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,nabladev.com:email,renesas.com:email]
X-Rspamd-Queue-Id: A3DB42BC182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTggTWFyY2ggMjAy
NiAxMzoxNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaHk6IHJlbmVzYXM6IHBoeS1yemczZS11
c2IzOiBGaXggbWFsZm9ybWVkIE1PRFVMRV9BVVRIT1Igc3RyaW5nDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gV2VkLCAxOCBNYXIgMjAyNiBhdCAxNDowOCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIFdlZCwgMTggTWFyIDIwMjYNCj4gPiA+IGF0IDEzOjAx
LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IEZpeCBh
IG1hbGZvcm1lZCBNT0RVTEVfQVVUSE9SIG1hY3JvIGluIHRoZSBSWi9HM0UgVVNCMy4wIFBIWQ0K
PiA+ID4gPiBkcml2ZXIgd2hlcmUgdGhlIGF1dGhvcidzIG5hbWUgYW5kIG9wZW5pbmcgYW5nbGUg
YnJhY2tldCB3ZXJlDQo+ID4gPiA+IG1pc3NpbmcsIGxlYXZpbmcgb25seSB0aGUgZW1haWwgYWRk
cmVzcyB3aXRoIGEgc3RyYXkgY2xvc2luZyA+Lg0KPiA+ID4gPiBDb3JyZWN0IGl0IHRvIHRoZSBz
dGFuZGFyZCBOYW1lIDxlbWFpbD4gZm9ybWF0Lg0KPiA+ID4gPg0KPiA+ID4gPiBSZXBvcnRlZC1i
eTogUGF2ZWwgTWFjaGVrIDxwYXZlbEBuYWJsYWRldi5jb20+DQo+ID4gPiA+IENsb3NlczoNCj4g
PiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvY2lwLWRldi9hYnA0WTJGVnNwVWdFcENUQGR1
by51Y3cuY3ovVC8jbWE4DQo+ID4gPiA+IDA0NTQNCj4gPiA+ID4gZGYxMjljOGNmY2JlNDhkNzVm
M2I0YWJlNjk3OTI1YzZmOA0KPiA+ID4NCj4gPiA+IFRoZSAiL1QvIy4uLiIgc3VmZml4IGlzIG5v
dCByZWFsbHkgbmVlZGVkLg0KPiANCj4gQW5kIGFmdGVyIHNlbmRpbmcsIEkgcmVhbGl6ZWQgdGhl
ICIvY2lwLWRldiIgcGFydCBpcyBhbHNvIG5vdCBuZWVkZWQuDQoNClRoYW5rcywgbmV4dCB0aW1l
IHdpbGwgdHJpbSB0aGlzIGFzIHdlbGwuDQoNCkNoZWVycywNCkJpanUNCg==

