Return-Path: <linux-renesas-soc+bounces-31074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BpJAOt712mXOggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:14:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF883C90B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CC753006039
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 10:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5C83BE15D;
	Thu,  9 Apr 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gn8/5l2x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055E3A8747;
	Thu,  9 Apr 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729633; cv=fail; b=NUyitYSFVn/ylCf2yUekJWSGHsgbicUsiuYrpcAbnoaFO0yX4EQv0GjPMmDaYIkLNzWERWKHcRqyYFbuD9db3KrCz3rlV2xJ/NkrW7v7KMvfrFvn505w3R098OgwMjsrpXPlO6BcJxIQ8ukqEp7sqWIfMtiLOLZZK1pPpVDYuTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729633; c=relaxed/simple;
	bh=jz+h+HtFQZjKW2K73ygLQIvKJnv4eN3+6uq59ydjlDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pZoE8OY/iKmw47Fn3S/k2J7O387G+V0D+viR6qhBTMABh5qhV2VKF677HXe+esMRJa4fKjuQOE0/5AJn4X6xxy0SU+7+V0ZyCEn5wf657m+esS6hXgPPsXCl72msNjAxGQEcboNDUoL3m0CJikYPooJfIPU8dnrVqQHBXSdChBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gn8/5l2x; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9SRkPsNvj9jHhzu5t19ofOa+weDOm25dyIPjPJ5ks04n5kNd/VWwjQPq5mYNTbUVbyGaSaVJSxUGObD3+gr4q0iP2+GMRYzpSQ4p49lawN2BiXTqLtdkmzBrqa4RB2Kv2ei5Y7Dppol2KMS/DkBsl+K1OOnwrwL5RBIBF3p+JKyjTTjIEGlVs45V5F4Fk9Z9p6f95rYH2tdslnXnaN5gqqeEraqyN1ldn+/p8MTs9IjrbVab6aLBil7iuHfTyB5Dotf+3qdTTBqLasHx2dYt4jSb/xJv8gDd8ITV7/AvVmZtlBcA5mKibkUrePclA0kdj3iNsKCeI1CPnUfNt0Ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz+h+HtFQZjKW2K73ygLQIvKJnv4eN3+6uq59ydjlDw=;
 b=upMbZ5qETRLCyzYmijEGE0QU1rGPMwWv2y45abrqJYEgdyKUgoeFTV1vZrDpO90bi8gCRUSZJMpAVRMEorM0YahGcnOnW/ysQhtA4o5rBLKWTuhB3ce1zP5zbKc6gWveI9yVNbhVem+3nt/0Cq2RcTV5qCZ5AXoRfF4bqN2k8uWtbFCTTNQGaoUvyU1pxb42GkrC9elfVQjDmeRTvWBQqamAmc6clJwHa4yFOrCeRo64wfskw6/h08Uva+GtlFUqcfBveKEwDo1HyhA2nwaaZ6aY4cWtv8Orl/j32l/ay5C45rqZ4cnR5DURC3yWGedZd78EX6MDH7NsxIVuGaSodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz+h+HtFQZjKW2K73ygLQIvKJnv4eN3+6uq59ydjlDw=;
 b=Gn8/5l2xePBS04gtIxYIcNPnkGCh7vGKgL4X/Wz5efR92U83N/3IdVnq6VFpLyMbRE2mNVwZ+/Dq+8ZEbXjAwY33fFyN/eOwvWR4iahGL7TXfnwU9mdnpSTPZ9Aemnlx6hM+RvKCT1B7536PPHlPiTpWDCEOtiMiVkTJIzk9xS4=
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:465::6)
 by TYRP301MB1226.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 10:13:44 +0000
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180]) by OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180%4]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 10:13:40 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index: AQHcw1uO2X7KYPO6jU26NrM/2Ym+OrXVE6mAgAF0bVA=
Date: Thu, 9 Apr 2026 10:13:39 +0000
Message-ID:
 <OSOP301MB19764BF6368424CCE8F0A111D3582@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <CAMuHMdWQiRpCVMuimOMo4Mz2EAG+gbnKyXY7oSXh7mL_fkdGSQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWQiRpCVMuimOMo4Mz2EAG+gbnKyXY7oSXh7mL_fkdGSQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOP301MB1976:EE_|TYRP301MB1226:EE_
x-ms-office365-filtering-correlation-id: 2078549d-d192-410c-d40b-08de9620abd6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +ng8A4A7dKQ4w88FrJLACtLYUZpXv20Q/pxmDrV1f5N6EppqigJyUJtL03jP8kwdBNIlwTmIX0xYTeH0in9utfeHRtYk19+QZ7ITBDDCmoHexi4niA/liq0DMpvviyGqSKwHHRiTYXXCFuekIshZu1p40nEVoiY8M6cSXpZYAS8hvQ8fvmCnLtJQLr+3jjJ6wGCM7Wve/aZpg8Q6TUdmqpQs61Mprd99foxKVPmn5jkvUNyu3wzMcSAzxtZ3/Rj6AP55p49r7e1KcLqSozhjT5iI8N5SuBwlWce+soxcscT7IG1Fkm7Q/zLC5RPDuArUlcv5cb67VX2T9ul+JEWaVNtxAA23rCfGfUAZCU/vtKxXOBC846QFWoROEh2zQe4GNQufSwIL2Xn6d4Vfoq+xBJLKiHjqRlJK67kpmKl38e/vKO0Lc1tOScJ7oWl5GtHKKfYYX/K/caOFrQm4vLkD8gvhWjJdzhwgKRlE6sTdbuTjsoRGVsSu3SdHjPfVYiYDn98e0ysoU9S1py4FMXBKxojCf0cz/+0tk7m+9oJWARJ4Mg0bw7AaEmjzb7Tb/uZX5N5CPLyIx5IWVaTCOkL2kMw3jzBaIZNOZvZhtUDGvssg43LV+6IJHaIr9l3XYDi5zuhFPrxwBNYBmmy01INzwf+vtAVrGEtyQyyEhAyCjRulRvaXhd+PM5HMfc7WmVvkP8OBoHw1lw25XVPM2IBEryYMtRasnwcXJKkGzNOlKEzyEZFhfBgyl8B2foApxHlLDqXHmvkujR0rSjHsKP/LHVpjnO3txBHy24AIxS6xY4Y1rJ9q/1EcNW04/NZOsvNA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVcvSGIzVFFmL0cxdnZnL2R2dWR0bTNsNVpuUVBQVE8wUWhxUWRZVWc2ajhV?=
 =?utf-8?B?dldVUzZDMHYwVXdVZExXQUpma3plcTg0U0RHY3JnamVsNldsT1A5UWhvdTNZ?=
 =?utf-8?B?S2NORnRUYVRMcDRaREFIem1LNDA4SmJtUURwWG1NTkxMZysyaGozeDJtalla?=
 =?utf-8?B?bitOL0RKam5pbFczNGNNMXEwWXhOVDlrVjA2OGlXdmNGT3hGZmFrbDdhVVpC?=
 =?utf-8?B?Tlh0dzdDemdIZVdFOHFvRU4zOHMyWTgrbDJFS0dEWm11bFY0N1FucS91SUd5?=
 =?utf-8?B?MjNpSktsdzBPK1d5V3B2TExzbU94MjU1eXhFQlBIcDYrSEMwM0VPRkJQM0cy?=
 =?utf-8?B?aGtuZTlCZ1c0Qmpyc1dYQ2FGTHRWWjJnaUk3OXFaa3M5Q2ZhakNvUk42alpB?=
 =?utf-8?B?d1l2N3pNTzZqeFI0ZGFuQ0FyUDFTUXM2Ti9TSmQwRzFBRU5ZU0k4MXpJUEcv?=
 =?utf-8?B?ZGM4Ny9xZE5Pd1VKR0xHOVRPMm1rcXlPYVlITWxUT3pkcWk3RmNoT3lXbGFt?=
 =?utf-8?B?dUtYSEVwYVo0b2I0V3dtUFkycmxXWUY1M0Job0pFemFZNEM0WS9NdWJ0LzRJ?=
 =?utf-8?B?M2ZReDVKWE1PNWtsZE11VHNMekEwdGxhMWdwK0xHYTNuU3NsbHBwM3hEdGhU?=
 =?utf-8?B?dEVyT2lseVhwQkhGTGhseTEvVmxuSk5qWGNsb3dNNjBUL2d0c0VxVEh2Zk9X?=
 =?utf-8?B?akJxSnhCNURMdnBDck9UZHZxeG10THFUTVk1c0lMRzJnTi8wRnBsNzFvNDdl?=
 =?utf-8?B?amVPd2NuUHoxekdrV2g3NG8wYTZLTFhqNzdYMW84cnNLRTRrOVZBcFRyTGYw?=
 =?utf-8?B?bVpGZFZhOFZidHZ3S2NwNWF1MzMxc2N0dVo5OG1hYnd0UGRRaDJCYzFVTjBV?=
 =?utf-8?B?WGhEQW5tOUdob3pocVlScHZHN0c3djIvanFmeVF2VVB0RFBNazdNYlpRaGZK?=
 =?utf-8?B?Zm5BeCtiYURRY084VklReWNpZWxWbHlGZzlsUmxrRGlFQVpVSFg4RU93RytQ?=
 =?utf-8?B?U1RIMU1ZNkJOQ0x3cUJwSG1EMzFieE5FQTFBV0laMWFvNWp3cEx6ZFdGNmZr?=
 =?utf-8?B?ZjlySURPT3Bzb25kMnBReDZHTjNnMGQ1bXNUMWFsRDUvSlNBQjJCTEM3bE11?=
 =?utf-8?B?WU11eFBGalZmZitObFJEZlpCUlpFblUwS055SXlFYUlJQlAxMExEcGFmdkxq?=
 =?utf-8?B?TDJEZzJvNVVYM2MrbENTem9GWGxMMWdqKzQrT0dNRmRxZDZxVit2ZTZZSWRG?=
 =?utf-8?B?d2RjQ3lYN09IRHBnU0dLMCtSWU8wWjRRVVkxZmRWTWNPNFF3N3RGckFFbk9q?=
 =?utf-8?B?SS9yaXgxTVQ3ZnlOSUI0anJVa2lrc0xUMFdOeWRBYnkzVUI0UEZ6YWlWU21z?=
 =?utf-8?B?bDhvWFM3ZEFVT0lOd1c3MUdTdHFpaTVKRUs1MFJoVmpqQnRoc2dnVjZXTVRi?=
 =?utf-8?B?Q05aTzVVZEl3MnpPUG1rZEdpZ0Z6UTdvTm8yY3V5SzU2eEt3MWZCaloxSWNk?=
 =?utf-8?B?SkZ2dmsyNkNPbHc2bnFOWkh4a1R6YnZzUnRVajBFNmtCOEUrMGNaYkhRZWhw?=
 =?utf-8?B?eXFxUTRrK3hRSmk2ZUNIUEpCVTJ0QUNxK01EV0xkUi9CVklWbE1UUWU4eGdG?=
 =?utf-8?B?anpTZ0ZXWTUyNUlJM21HQUh0MXhnVGo5T3MzVzNpclh3ZTV3NHlKTXhadGFB?=
 =?utf-8?B?MzdEU0lwU1BpY2FxaHlNRVgvOUxZeS9FbGFNTGozcG5MYS9XZWIxZUtzVE9l?=
 =?utf-8?B?Y2hXYmFFT1p6VE1HMHd6OFRtNExzKzZxdWJ5RXdZSDFDWFlZeHdwM1d3ZFZu?=
 =?utf-8?B?NkR6MWNSV0RqUDFkakc3UCtzSU5EdXIrWW4yYnlQRG00NUVzK3pQVy9qczVG?=
 =?utf-8?B?a0dkdTFoVi9jdFNTcVRQS1dYZVlzMnQzWHcrckNDY2c4WDk2QmhpSlNMZTZJ?=
 =?utf-8?B?dU42VVNIdmZWOTdTbjdiYTdBTkxreFBHV09xSVhKckR0Ymc4aDBJMjFyNEYw?=
 =?utf-8?B?b05BWTFpalpQcXJpSFNIQWFTa2M5VFg0YndBMHhrR3dQU0g5UktWNDAvbmg1?=
 =?utf-8?B?MTgvaVpzV2haMUJKV0w0eWVZaW1KcUtjRldyNmZEdnUyZGxFMElQQWowSlp3?=
 =?utf-8?B?dzdRdTJwaW9CVEpvM0NJOHFwQkFub1F4aUtNZlhlSlAvMlZNTndiZG5RYnh1?=
 =?utf-8?B?UmZBVFpTL2libjRHUVpiV0RTMTdCSThERmdWaVI3R2pCSkJYY2tGWkR2NGU4?=
 =?utf-8?B?ZkVGMWc3bms4cmxGNTdsRithUHhOZDhiRHFHczRCbHBUdDRhSWxFT09makl3?=
 =?utf-8?B?S0xHQ3FSdWRrTnBNQUNFWk1mVXdZYXhKUGp3cXJuOGliemNkN2Z2TVQzb1U4?=
 =?utf-8?Q?uwNeQl1Bw/IKID04=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2078549d-d192-410c-d40b-08de9620abd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 10:13:39.9098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G56fQmuUeVmiurYNqwgc56UNv7l+DNmaNi1s1jmE4jwdwcTY0xWtPEtEb97FWSYOlTA/lCKYXOSCmyJJnK8gcsX/vdXP+CQz1qt9FNmtQ6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP301MB1226
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31074-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,vger.kernel.org,ragnatech.se];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 0BF883C90B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gDQo+IEhpIE92aWRpdSwNCj4gDQo+IE9uIEZyaSwgMyBBcHIgMjAyNiBh
dCAxMzoxOCwgT3ZpZGl1IFBhbmFpdCA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gRHVyaW5nIHN5c3RlbSBzdXNwZW5kLCBwaHlfc3VzcGVuZCgpIHB1dHMgdGhl
IFBIWSBpbnRvIFNvZnR3YXJlIFBvd2VyLQ0KPiBEb3duDQo+ID4gKFNQRCkgYnkgc2V0dGluZyB0
aGUgQk1DUl9QRE9XTiBiaXQgaW4gTUlJX0JNQ1IuIEFjY29yZGluZyB0byB0aGUNCj4gS1NaOTEz
MQ0KPiA+IGRhdGFzaGVldCwgTU1EIHJlZ2lzdGVyIGFjY2VzcyBpcyByZXN0cmljdGVkIGR1cmlu
ZyBTUEQ6DQo+ID4NCj4gPiAgIC0gT25seSBhY2Nlc3MgdG8gdGhlIHN0YW5kYXJkIHJlZ2lzdGVy
cyAoMCB0aHJvdWdoIDMxKSBpcyBzdXBwb3J0ZWQuDQo+ID4gICAtIEFjY2VzcyB0byBNTUQgYWRk
cmVzcyBzcGFjZXMgb3RoZXIgdGhhbiBNTUQgYWRkcmVzcyBzcGFjZSAxIGlzDQo+ID4gICAgIHBv
c3NpYmxlIGlmIHRoZSBzcGRfY2xvY2tfZ2F0ZV9vdmVycmlkZSBiaXQgaXMgc2V0Lg0KPiA+ICAg
LSBBY2Nlc3MgdG8gTU1EIGFkZHJlc3Mgc3BhY2UgMSBpcyBub3QgcG9zc2libGUuDQo+ID4NCj4g
PiBIb3dldmVyLCBrc3o5MTMxX3Jlc3VtZSgpIGNhbGxzIGtzejkxMzFfY29uZmlnX3JnbWlpX2Rl
bGF5KCkgYmVmb3JlDQo+ID4ga3N6cGh5X3Jlc3VtZSgpIGNsZWFycyBCTUNSX1BET1dOLiBUaGlz
IG1lYW5zIE1NRCByZWdpc3RlcnMgYXJlIGFjY2Vzc2VkDQo+ID4gd2hpbGUgdGhlIFBIWSBpcyBz
dGlsbCBpbiBTUEQsIGNvbnRyYXJ5IHRvIHRoZSBkYXRhc2hlZXQuDQo+ID4NCj4gPiBBZGRpdGlv
bmFsbHksIG9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgUEhZIGxvc2VzIHBvd2VyIGR1cmluZyBzdXNw
ZW5kDQo+ID4gKGUuZy4gUlovRzNFKSwgYWxsIHNldHRpbmdzIGZyb20ga3N6OTEzMV9jb25maWdf
aW5pdCgpLCBub3QganVzdCB0aGUNCj4gPiBSR01JSSBkZWxheXMsIGFyZSBsb3N0IGFuZCBuZWVk
IHRvIGJlIHJlc3RvcmVkLiBXaGVuIHRoZSBNQUMgZHJpdmVyDQo+ID4gc2V0cyBtYWNfbWFuYWdl
ZF9wbSAoZS5nLiBzdG1tYWMpLCBtZGlvX2J1c19waHlfcmVzdW1lKCkgaXMgc2tpcHBlZCwNCj4g
PiBzbyBwaHlfaW5pdF9odygpICh3aGljaCBjYWxscyBjb25maWdfaW5pdCB0byByZXN0b3JlIGFs
bCBQSFkgc2V0dGluZ3MpDQo+ID4gaXMgbmV2ZXIgaW52b2tlZCBkdXJpbmcgcmVzdW1lLg0KPiA+
DQo+ID4gRml4IHRoaXMgYnkgcmVwbGFjaW5nIHRoZSBSR01JSSBkZWxheSByZXN0b3JhdGlvbiB3
aXRoIGEgY2FsbCB0bw0KPiA+IHBoeV9pbml0X2h3KCksIHdoaWNoIHRha2VzIHRoZSBQSFkgb3V0
IG9mIFNQRCBhbmQgcGVyZm9ybXMgZnVsbA0KPiA+IHJlaW5pdGlhbGl6YXRpb24uDQo+ID4NCj4g
PiBGaXhlczogZjI1YTdlYWE4OTdmICgibmV0OiBwaHk6IG1pY3JlbDogQWRkIGtzejkxMzFfcmVz
dW1lKCkiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IE92aWRpdSBQYW5haXQgPG92aWRpdS5wYW5haXQu
cmJAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0t
LSBhL2RyaXZlcnMvbmV0L3BoeS9taWNyZWwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3BoeS9t
aWNyZWwuYw0KPiA+IEBAIC02MDE2LDggKzYwMTYsMTMgQEAgc3RhdGljIGludCBsYW44ODQxX3N1
c3BlbmQoc3RydWN0IHBoeV9kZXZpY2UNCj4gKnBoeWRldikNCj4gPg0KPiA+ICBzdGF0aWMgaW50
IGtzejkxMzFfcmVzdW1lKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpDQo+ID4gIHsNCj4gPiAt
ICAgICAgIGlmIChwaHlkZXYtPnN1c3BlbmRlZCAmJiBwaHlfaW50ZXJmYWNlX2lzX3JnbWlpKHBo
eWRldikpDQo+ID4gLSAgICAgICAgICAgICAgIGtzejkxMzFfY29uZmlnX3JnbWlpX2RlbGF5KHBo
eWRldik7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIGlmIChwaHlk
ZXYtPnN1c3BlbmRlZCkgew0KPiA+ICsgICAgICAgICAgICAgICByZXQgPSBwaHlfaW5pdF9odyhw
aHlkZXYpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHJl
dHVybiBrc3pwaHlfcmVzdW1lKHBoeWRldik7DQo+ID4gIH0NCj4gDQo+IFRoaXMgZnVuY3Rpb24g
aXMgbm93IG5vIGxvbmdlciBLU1o5MTMxLXNwZWNpZmljLg0KPiBJIGFtIHdvbmRlcmluZyBpZiB0
aGlzIHNob3VsZCBiZSBkb25lIGZvciBvdGhlciBNaWNyZWwgUEhZcywgdG9vLA0KPiBlLmcuIGJ5
IG1vdmluZyB0aGUgcGh5X2luaXRfaHcoKSBjYWxsIGludG8ga3N6cGh5X3Jlc3VtZSgpPw0KPiAN
Cj4gRXRoZXJuZXQgYWZ0ZXIgcmVzdW1lIGhhcyBhbHdheXMgYmVlbiBmbGFreSBvbiBTYWx2YXRv
ci1YIHdpdGggS1NaOTAzMQ0KPiBhbmQgUi1DYXIgTTMtVyBFUzEuMCAodGhpcyBzZWVtcyB0byBi
ZSBzcGVjaWZpYyB0byBSLUNhciBNMy1XLCBhcw0KPiBib2FyZHMgd2l0aCBSLUNhciBIMyBvciBN
My1OIGRvIG5vdCBzZWVtIHRvIHN1ZmZlciBmcm9tIHRoaXM7IGRvbid0DQo+IGFzayBtZSB3aHkp
Lg0KPiANCj4gSSBoYXZlIGp1c3QgdHJpZWQ6DQo+IA0KPiAtICAgICAgIC5yZXN1bWUgICAgICAg
ICA9IGtzenBoeV9yZXN1bWUsDQo+ICsgICAgICAgLnJlc3VtZSAgICAgICAgID0ga3N6OTEzMV9y
ZXN1bWUsDQo+IA0KPiBpbiB0aGUgS1NaOTAzMSBlbnRyeSwgYW5kIC4uLiBzdXJwcmlzZSEgRXRo
ZXJuZXQgb24gUi1DYXIgTTMtVyBub3cNCj4gd29ya3MgbXVjaCBiZXR0ZXIgYWZ0ZXIgcmVzdW1l
IQ0KPiANCg0KSSBjaGVja2VkIHRoZSBkdHMgZm9yIHRoZSBTYWx2YXRvci1YIGJvYXJkIGFuZCBp
dCBzZWVtcyB0aGF0IGl0IHVzZXMNCnRoZSBSQVZCIE1BQy4gVGhlIGRyaXZlciBmb3IgUkFWQiBz
ZXRzIHRoZSBtYWNfbWFuYWdlZF9wbSBmbGFnLCB3aGljaA0KbWVhbnMgdGhhdCB0aGUgTUFDIGRy
aXZlciBpcyBoYW5kbGluZyB0aGUgc3VzcGVuZC9yZXN1bWUgb2YgdGhlIFBIWS4NCg0KSW4gdGhp
cyBjYXNlLCBhcyBSdXNzZWxsIHBvaW50ZWQgb3V0IGluIFsxXSwgdGhlIE1BQyBkcml2ZXIgc2hv
dWxkIGJlDQp0aGUgb25lIGlzc3VpbmcgcGh5X2luaXRfaHcoKSBiZWZvcmUgY2FsbGluZyBwaHlf
cmVzdW1lKCkuIEkgc2VudCBhDQpmaXggZm9yIHRoZSBwaHlsaW5rIHJlc3VtZSBwYXRoIChbMl0p
LCB0byBhbGlnbiBpdCB3aXRoIHRoZSBNRElPIGJ1cw0KcmVzdW1lIHBhdGgsIGJ1dCB0aGUgUkFW
QiBkcml2ZXIgZG9lc24ndCBzZWVtIHRvIGJlIHVzaW5nIHBoeWxpbmssDQppdCBjYWxscyBwaHlf
c3RhcnQoKSBkaXJlY3RseS4NCg0KQmFzZWQgb24gdGhpcywgSSB0aGluayB0aGUgZml4IHNob3Vs
ZCBiZSB0byBhZGQgYSBwaHlfaW5pdF9odygpIGNhbGwNCmluIHRoZSBSQVZCIGRyaXZlciwgb24g
dGhlIHJlc3VtZSBwYXRoLCByYXRoZXIgdGhhbiBpbiB0aGUgUEhZIGRyaXZlci4NCg0KWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hY19VZHZ0cmowQmwtNndsQHNoZWxsLmFybWxpbnV4
Lm9yZy51ay8NClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0MDkwOTU2MzMu
NzA5NzMtMi1vdmlkaXUucGFuYWl0LnJiQHJlbmVzYXMuY29tLw0KDQpUaGFua3MsDQpPdmlkaXUN
Cg==

