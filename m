Return-Path: <linux-renesas-soc+bounces-31614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK/fDFkh62k9IwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:52:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477F45AF45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375C03018D41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 07:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696B7346791;
	Fri, 24 Apr 2026 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qQ0TO/Vd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A792E7621;
	Fri, 24 Apr 2026 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017144; cv=fail; b=fnWNBSn5bwdiOdxG8ZaAFxj9xL39RTuPiid4rL1nMPcnImcwbGPRDqbTdDfkW0hh02IfAww3XzpNG8kRNVlfDRpzhyHR0OLOMGmccGPQOh/ioaamPGBKqSiQcyy/dXzaox0ahTovQIcJP2z5ZjwkQQB1fW3ii8A4k3YHTcVYsV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017144; c=relaxed/simple;
	bh=tniZiIBj8BDrtraLM7xH50DoJQvR4Oi8b+JeoO0PJWw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bNtdt7PkQkruY/IJN+xKWSF/sCM9bUjOP28VKbb/s+h4w1bRzYu2Wthz5nG18MxV10h9kKDlB0Gegf5jh0Ik+XhagHmW1cNCF+r/QPs+3SB/u1lfQ8nwQbmwKJfSXn8b6BtN9uVKyQGCQBYYI9aHX0ZJtaBMwgdAmY+EF/pniZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qQ0TO/Vd; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qxuaa0IpiTiQqrQM3zjbEvLuoVqaF9JD2kR02PGlqFQaWt6vKodD514DfuzjPZyvMQTG0UGXlDy1Uje9g2R2KXfWM1nJf21lt0ogw1rKZJKCBSa44Sl+wfLqJ1ATm2unInQYzGqBAs6zP5CS6mpoNIisUWWv6FPPAKvH0nE3whRLKEaRB20aDVs2S0DhTFNGVtp0rZtK/98l4pZWIu2j6rG1lSb0jncQZk7YDw6fGqNwhOpeHxGNIlabnc2egJDEfSvDzk/j3x6znQMUQjuwJNFnfjN98mSu3ztWaUhpOvHZYfjFuBy3XozlxVYKmvwF+BF/UaKL1+dCuONhe0Qz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tniZiIBj8BDrtraLM7xH50DoJQvR4Oi8b+JeoO0PJWw=;
 b=q3pQA3uAxwKQFlGpVTkGE/R4p+6rc1BIyGRL4qa5hPu6dDfvD2wPDEePN6TEe3J26NC9urU3+RWeIvVoHlDCsX+UzOUaorqjOv46ixLo8HNueRZAoriSvOa+iCkYr0DLRKJMxFGkIQ8FdmCkvm2bHU350sxTLOtxruDerG4+aOc5JCII1LJlvMbczdlDEACpAnoG8Y+Ir1nT+XUTgCDQ5fyYX8NUpXHDSqbRmMSLdw8TjYLY5mljkIMJGYV+taxAAfvHpw9lQocfUNEYxVLo3F3LnO4TOkQMHfjtTNx+uErwu+i09xHJ6LAds4HarSj6LiJ1JYUV8InqBGmsM5ylqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tniZiIBj8BDrtraLM7xH50DoJQvR4Oi8b+JeoO0PJWw=;
 b=qQ0TO/VdPowlG43h9dS7xtyOnIHxRhygmlFwoC7t1erm6wYsneNQDa06uT6bhASH3/vpxf7/npS03T7k8v0DeHL5SQhmEL6JjGWS21Uot8X1kr84ewYb1q/2+BtkD5V62/3Lk6EJryce9MkIgsSiIyw14GH5gw5+w5OA+SOBCes=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9376.jpnprd01.prod.outlook.com (2603:1096:604:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:52:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:52:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHcvRCsLffu7uqAf0KGQAXivH+B0rXskAIAgAAZx/CAAU6hgIAAC2Qw
Date: Fri, 24 Apr 2026 07:52:16 +0000
Message-ID:
 <TY3PR01MB11346618E3305645B5B6A4C55862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
 <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9376:EE_
x-ms-office365-filtering-correlation-id: 17df4652-94f1-4a13-dd0f-08dea1d667ce
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 QD+pjzqPkTtOZlp9vLGQop5ZBld8lx0eGSQm4eci16uLz5UzYO0/Z39vWLWLh9Wkz4hVK5fcBLsnoc3uyAj5fV/Wp1afXrMUlU/SgyR45A6BhM0mcHMXxI687K+SAgBvin9doqE268sM8XmlIWF324HtCtxc6aS8Q2xYvtr0u+mr4Z0j+C1JsB5KBlIS2k7c/kRvKq0W7B+ryBGUbz9TOGHoPWk79ER+XrKZRszN4gG+2bQ8FFX0TPXT17GSl1VKQuI/FUJJ7+o2cbOaaQpU8p8p27PENubjQZ3W5jgaUNkuHI0s8afbmKykXNS8QGwno/F7QKjEz2KI23rf2BgfrwdVKcdc9EC+StwfiD2jt9cH3JOR9UMKFqvbHAWnzO+ADrdQI4W0zR5R/1WBLECf53/t1s0yAmNG4g7SJNr6DkEPJ313UUb7IWtGuWYCz0TnSVFBmXCYee5MUaTeJ3fN3Ke1Y+qbFdW6CAbAvXcAe5k4i0wSiKGsP6318bY8OHfFsXhCdQx0ASbE91kSucsJjoK5MOIUuwewP3at5n6RgZrqYuGfc/P/6lzJgBSxrnrT9w0n1lodmTzKvW8sgZXO9byhr8/bZva6X3BByeVARv9y7tA7UHOvTS+DQL/RAf2iqRgerIrSve2LNpp7UP0iHViWGJ2tomom7b7dixaIP8FXbLJ/Oz8xCzMbBNDuSTk8BPUnAdPDr3KyLcGPaNcVzsayAwebf6BCky6zelMvsRqP0GTnVNnV2DzvnRoXdg7lkYOkqusImWqoq+2LesgN/NLLJwyOI2/zuE1JftZm72g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WThqRGlmR2o4Zk1xZFU2TVlBeU5Ia2JIVFZ4dUpjZXBuK0ROUGt6a25hMmlE?=
 =?utf-8?B?RnVhUEpKR2lMeUVjb3NmK005bWJ5aGR1L2RkZmplR0RraEFZTjlnK0RNdGZo?=
 =?utf-8?B?Q2J4bWRRYUpQOFFZa3ZwK2V2RWhzZFFUblJycC9qVUw0MkdHRllqUkdDeXA4?=
 =?utf-8?B?amsrbEZXakRPa2xlb2wyZGxsLzVvaFlBeEkrdUVCY0V5VldPMGpCM1dJZzBE?=
 =?utf-8?B?SE5nT2FsNkZsdk9OSUZKRDZqeDd6a1NPRENKR2JPTTRjOWpWK0N1emF1TEpW?=
 =?utf-8?B?bFFQR01iOGtUODNFV21lK2RmelE0Y3FmVXFiTys2blJjU2xuN2pQQXpJaTJ3?=
 =?utf-8?B?OENUQnZQT29PY2pMR0RZbC9ScExYWWRvYThDVlU4d3JVNFl1NEFyNytzRnYx?=
 =?utf-8?B?a041T1hTKytUanplRldpK2FMQXRGQWhhYzRYaWs0eWlBMkpIWFBQMTQ3ZDZa?=
 =?utf-8?B?QVY5RllBR2V2aVRSZEx2SllLRWNjUXlNL3dXQmVTTmhhUXBIeXFCNys0OEVW?=
 =?utf-8?B?L3VWNzBTVHRGZk5qTUZ5RjliQy85ZG5aKzFDVUZuNWhDa3RTVzYya25paVht?=
 =?utf-8?B?T09EVUtwenFpMGRjTExhakJGbU8xdjRZckZ1U3RxcGQ3akprazR4UE5HZXpF?=
 =?utf-8?B?OFhGRm1qdXhWckszVk9GWTdxcWhreDBWMGk5Q2xhSU5MV1FDMDVOWVFYUEFp?=
 =?utf-8?B?T1EwNld1WGttdFp1SU5MNTBxeXFlSTVHL3NUeDIvRS9kTlpRTWJRemFmUjdI?=
 =?utf-8?B?TGpjeThIMHd2a2MzT2dOMlhYb1d0THQ2WkMvaGhYVFZsUmdpcjNTSFd6anNJ?=
 =?utf-8?B?NVpIamdNWmUyUjJTNWVYaUk5cHZzbEMyYTJOQTBWZ2w2RERkVW05SkFHdUpT?=
 =?utf-8?B?amdETFU4VmVmZlRwTExLLzhyQkM0MDBFYkU0RHlMendNWEluc1l4L1hOdE8x?=
 =?utf-8?B?V0J1TTAvSmN0RTRsdTVmMUJqb2hWbnY1UTBmODFCd2tacVJESUhxZEd5Q3R4?=
 =?utf-8?B?cU41MEJwVnF3eTFrUzNtcm5HZ0NJVDBlMGdaYVVqM2ZlUVE0eGJ4TkVxRHpM?=
 =?utf-8?B?bGdtWTBUZG9Fb2lYNVBFZml3elJvZG0vSDFjTUhtUWk5TnJtQWF1ZTFQWXZN?=
 =?utf-8?B?Q2oxNWdzYjdKVXlmeVR0L2JWMHlXQ0RtUm5ROVlINElad3pNYnk3OU41RGh0?=
 =?utf-8?B?WElwUllWTkJqcitWQmpXb0Ird2dNTzBpZldjaUpLdWV4cGtaK29iUU9uSXB2?=
 =?utf-8?B?MGl6K3ZPK3NzdG84S3lIbEVGekZIWDhGL0UxR3BmaFhsRDc1L3g3Ukl4L0h2?=
 =?utf-8?B?ZmJNRWFJTnhqb3ZMTjNXNVlNQkRyeGYwRGMzMDEyN1RMcUVuZU91b09rTjRi?=
 =?utf-8?B?NVEzRUgzNm54Wjh0cVU1enJROFg5cDlYYU85cG9FWXFrWHlSckRId08xdVlJ?=
 =?utf-8?B?bDRrZHlRdndHL3FDT092WDNRMXZsWFRMNWxuVjQ2TGVJL0IwR2tKdmIxSWFq?=
 =?utf-8?B?V0FTVitIOEVkQm1XWmMxQUMvU1ZodXl4MUdCTHZYZm1xcGczUUZ0S1kxYmFp?=
 =?utf-8?B?RGFraWhkUE40YXdseGpUOXBOTjVWV3c3eUhLTlQwN0VhelRncGdWTUdwZ3pW?=
 =?utf-8?B?QUNlcWxydnoyOGh4MVVhZHRoU0YzdG9oRnlpUmtMTHpiRUJTT2NoTXBGaE1U?=
 =?utf-8?B?bFNRMDhCVVBKQkhpbmtKelFsb1MrbUV2QmNybWdLOEZidVh4SFBsb1Jveld1?=
 =?utf-8?B?NHI5RjVyV0VBcHNPL3RJT0gweTdPVzhUcThUczI1aVV5WDRnV1p0REZjdmRn?=
 =?utf-8?B?NVpUakNBWnZEWUxYUjhNdUY2OFlWUkxMRW01Z0JpMDVjZmZoamhpa2VUdXpH?=
 =?utf-8?B?WjBOK1dRZDA0NTNKeE5rQVJEVW5IMnJnaENZczBvdlR6WTNaVXQyOGR1aG1G?=
 =?utf-8?B?Z29JYWduaG84ekt1RFZReGpWYldkSXQ2VU1GREhOYnRpbUtzM2RkdXRwb1ZF?=
 =?utf-8?B?K3NlOG45bXVWVXdwa09BeElJY1YzU1hOY2xPRTVqcEJnMm1XT0JyS3AvYVdw?=
 =?utf-8?B?QkdhV05nYktZNmU4YmFXQm94ZjJYb0F1MzRDUUQwR3RuSlRzWFBST2N0WmZa?=
 =?utf-8?B?VUE1YzhvbFRMVDVURGhYeGRMODVuLzd6cjc2aE5yM2NIYUtVbkkxc0o1Qmkr?=
 =?utf-8?B?SThVSm9rY1c4MCt4U052S01VQ2lYYTd4ZWpzSkcyS0lHaTQybW9DR09Scmcw?=
 =?utf-8?B?aU9aNExJbHorVUsxU3A2c0JseEVXZnRRaEoxZHB6aGxjcnY4Mlc1T21LMG9M?=
 =?utf-8?B?d0VPdWdEalkyeDFiMXlsRUdwK3hyWGZkWC9UN3lxajJYSW9aOEYvdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 17df4652-94f1-4a13-dd0f-08dea1d667ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 07:52:16.9422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6erI6mTYWVD2TER8zoory1EehcCtEzgqZll1eePKqYJUldwfSTGGhOPPSwRVIRGYXnP5DODBW4A5fszkp7y3lV8TpRE/JTswIXcEAe0pKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9376
X-Rspamd-Queue-Id: 5477F45AF45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31614-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,glider.be:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjQgQXByaWwgMjAy
NiAwODowOQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDQvNF0gY2xrOiByZW5lc2FzOiByOWEw
OGcwNDY6IEFkZCBjbG9jayBhbmQgcmVzZXQgc2lnbmFscyBmb3IgdGhlIEdCRVRIIElQcw0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgMjMgQXByIDIwMjYgYXQgMTM6MTQsIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBUaHUsIDI2IE1hciAyMDI2DQo+
ID4gPiBhdCAxMjowNiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+
ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPg0K
PiA+ID4gPiBBZGQgY2xvY2sgYW5kIHJlc2V0IGVudHJpZXMgZm9yIHRoZSBHaWdhYml0IEV0aGVy
bmV0IEludGVyZmFjZXMNCj4gPiA+ID4gKEdCRVRIDQo+ID4gPiA+IDAtMSkgSVBzIGZvdW5kIG9u
IHRoZSBSWi9HM0wgU29DLiBUaGlzIGluY2x1ZGVzIHZhcmlvdXMgZGl2aWRlcnMNCj4gPiA+ID4g
YW5kIG11eCBjbG9ja3MgbmVlZGVkIGJ5IHRoZXNlIHR3byBHQkVUSCBJUHMuIEFsc28gYWRkIHR4
LCB0eC0xODAsDQo+ID4gPiA+IHJ4LCByeC0xODAsIHJtaWksIHJtaWktdHggYW5kIHJtaWktcngg
Y2xvY2tzIHRvDQo+ID4gPiA+IHI5YTA4ZzA0Nl9ub19wbV9tb2RfY2xrIHRhYmxlIHRvIGF2b2lk
IGVuYWJsaW5nIGJvdGggbm9ybWFsIGFuZCBybWlpIGNsb2NrcyBieSB0aGUgUE0gZnJhbWV3b3Jr
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+
ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4gPiA+DQo+
ID4gPiA+IEBAIC04Niw2ICsxNDAsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjcGdfY29yZV9j
bGsgcjlhMDhnMDQ2X2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgIDUwMDAwMDAwMFVMKSwNCj4gPiA+ID4gICAgICAgICBERUZfRklYRUQoIi5w
bGwyX2RpdjIiLCBDTEtfUExMMl9ESVYyLCBDTEtfUExMMiwgMSwgMiksDQo+ID4gPiA+ICAgICAg
ICAgREVGX0ZJWEVEKCIucGxsM19kaXYyIiwgQ0xLX1BMTDNfRElWMiwgQ0xLX1BMTDMsIDEsIDIp
LA0KPiA+ID4gPiArICAgICAgIERFRl9GSVhFRCgiLnBsbDZfZGl2MTAiLCBDTEtfUExMNl9ESVYx
MCwgQ0xLX1BMTDYsIDEsIDEwKSwNCj4gPiA+ID4gKyAgICAgICBERUZfTVVYKCIuc2VsX2V0aDBf
dHgiLCBDTEtfU0VMX0VUSDBfVFgsIEczTF9TRUxfRVRIMF9UWCwgc2VsX2V0aDBfdHgpLA0KPiA+
ID4gPiArICAgICAgIERFRl9NVVgoIi5zZWxfZXRoMF9yeCIsIENMS19TRUxfRVRIMF9SWCwgRzNM
X1NFTF9FVEgwX1JYLCBzZWxfZXRoMF9yeCksDQo+ID4gPiA+ICsgICAgICAgREVGX01VWCgiLnNl
bF9ldGgwX3JtIiwgQ0xLX1NFTF9FVEgwX1JNLCBHM0xfU0VMX0VUSDBfUk0sIHNlbF9ldGgwX3Jt
KSwNCj4gPiA+ID4gKyAgICAgICBERUZfTVVYKCIuc2VsX2V0aDFfdHgiLCBDTEtfU0VMX0VUSDFf
VFgsIEczTF9TRUxfRVRIMV9UWCwgc2VsX2V0aDFfdHgpLA0KPiA+ID4gPiArICAgICAgIERFRl9N
VVgoIi5zZWxfZXRoMV9yeCIsIENMS19TRUxfRVRIMV9SWCwgRzNMX1NFTF9FVEgxX1JYLCBzZWxf
ZXRoMV9yeCksDQo+ID4gPiA+ICsgICAgICAgREVGX01VWCgiLnNlbF9ldGgxX3JtIiwgQ0xLX1NF
TF9FVEgxX1JNLCBHM0xfU0VMX0VUSDFfUk0sIHNlbF9ldGgxX3JtKSwNCj4gPiA+ID4gKyAgICAg
ICBERUZfRElWKCIuZGl2X2V0aDBfdHIiLCBDTEtfRVRIMF9UUiwgQ0xLX1BMTDYsIEczTF9TRElW
X0VUSF9BLCBkdGFibGVfNF8yMDApLA0KPiA+ID4gPiArICAgICAgIERFRl9ESVYoIi5kaXZfZXRo
MV90ciIsIENMS19FVEgxX1RSLCBDTEtfUExMNiwgRzNMX1NESVZfRVRIX0MsIGR0YWJsZV80XzIw
MCksDQo+ID4gPiA+ICsgICAgICAgREVGX0RJVigiLmRpdl9ldGgwX3JtIiwgQ0xLX0VUSDBfUk0s
IENMS19TRUxfRVRIMF9STSwgRzNMX1NESVZfRVRIX0IsIGR0YWJsZV8yXzIwKSwNCj4gPiA+ID4g
KyAgICAgICBERUZfRElWKCIuZGl2X2V0aDFfcm0iLCBDTEtfRVRIMV9STSwgQ0xLX1NFTF9FVEgx
X1JNLA0KPiA+ID4gPiArIEczTF9TRElWX0VUSF9ELCBkdGFibGVfMl8yMCksDQo+ID4gPiA+DQo+
ID4gPiA+ICAgICAgICAgLyogQ29yZSBvdXRwdXQgY2xrICovDQo+ID4gPiA+ICAgICAgICAgREVG
X0czU19ESVYoIlAwIiwgUjlBMDhHMDQ2X0NMS19QMCwgQ0xLX1BMTDJfRElWMiwNCj4gPiA+ID4g
RzNMX0RJVlBMMkIsIEczTF9ESVZQTDJCX1NUUywgQEAgLTk0LDYgKzE1OSwyMSBAQCBzdGF0aWMg
Y29uc3QNCj4gPiA+ID4gc3RydWN0IGNwZ19jb3JlX2Nsaw0KPiA+ID4gcjlhMDhnMDQ2X2NvcmVf
Y2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgIGR0YWJs
ZV80XzEyOCwgMCwgMCwgMCwgTlVMTCksDQo+ID4gPiA+ICAgICAgICAgREVGX0czU19ESVYoIlAz
IiwgUjlBMDhHMDQ2X0NMS19QMywgQ0xLX1BMTDJfRElWMiwgRzNMX0RJVlBMMkEsIEczTF9ESVZQ
TDJBX1NUUywNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICBkdGFibGVfNF8xMjgsIDAsIDAs
IDAsIE5VTEwpLA0KPiA+ID4gPiArICAgICAgIERFRl9GSVhFRCgiSFAiLCBSOUEwOEcwNDZfQ0xL
X0hQLCBDTEtfUExMNl9ESVYxMCwgMSwgMSksDQo+ID4gPiA+ICsgICAgICAgREVGX01VWF9GTEFH
UygiRVRIVFgwMSIsIFI5QTA4RzA0Nl9DTEtfRVRIVFgwMSwgRzNMX1NFTF9FVEgwX0NMS19UWF9J
LCBzZWxfZXRoMF9jbGtfdHhfaSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIENMS19T
RVRfUkFURV9QQVJFTlQpLA0KPiA+ID4gPiArICAgICAgIERFRl9NVVhfRkxBR1MoIkVUSFJYMDEi
LCBSOUEwOEcwNDZfQ0xLX0VUSFJYMDEsIEczTF9TRUxfRVRIMF9DTEtfUlhfSSwgc2VsX2V0aDBf
Y2xrX3J4X2ksDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBDTEtfU0VUX1JBVEVfUEFS
RU5UKSwNCj4gPiA+ID4gKyAgICAgICBERUZfTVVYX0ZMQUdTKCJFVEhUWDExIiwgUjlBMDhHMDQ2
X0NMS19FVEhUWDExLCBHM0xfU0VMX0VUSDFfQ0xLX1RYX0ksIHNlbF9ldGgxX2Nsa190eF9pLA0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgQ0xLX1NFVF9SQVRFX1BBUkVOVCksDQo+ID4g
PiA+ICsgICAgICAgREVGX01VWF9GTEFHUygiRVRIUlgxMSIsIFI5QTA4RzA0Nl9DTEtfRVRIUlgx
MSwgRzNMX1NFTF9FVEgxX0NMS19SWF9JLCBzZWxfZXRoMV9jbGtfcnhfaSwNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIENMS19TRVRfUkFURV9QQVJFTlQpLA0KPiA+ID4gPiArICAgICAg
IERFRl9GSVhFRCgiRVRIUk0wIiwgUjlBMDhHMDQ2X0NMS19FVEhSTTAsIENMS19FVEgwX1JNLCAx
LA0KPiA+ID4gPiArIDEpLA0KPiA+ID4NCj4gPiA+IFNob3VsZG4ndCB0aGUgcGFyZW50IGJlIENM
S19TRUxfRVRIMF9STSAoaS5lLiBiZWZvcmUgdGhlIDEvMiBvciAxLzIwIGRpdmlkZXIpPw0KPiA+
DQo+ID4gT29wcywgSSBtaXNzZWQgdGhpcy4gWW91IGFyZSBjb3JyZWN0Lg0KPiA+DQo+ID4gPiA+
ICsgICAgICAgREVGX0ZJWEVEKCJFVEhUWDAyIiwgUjlBMDhHMDQ2X0NMS19FVEhUWDAyLCBDTEtf
U0VMX0VUSDBfVFgsIDEsIDEpLA0KPiA+ID4gPiArICAgICAgIERFRl9GSVhFRCgiRVRIUlgwMiIs
IFI5QTA4RzA0Nl9DTEtfRVRIUlgwMiwgQ0xLX1NFTF9FVEgwX1JYLCAxLCAxKSwNCj4gPiA+ID4g
KyAgICAgICBERUZfRklYRUQoIkVUSFJNMSIsIFI5QTA4RzA0Nl9DTEtfRVRIUk0xLCBDTEtfRVRI
MV9STSwgMSwNCj4gPiA+ID4gKyAxKSwNCj4gPiA+DQo+ID4gPiBMaWtld2lzZSwgQ0xLX1NFTF9F
VEgxX1JNPw0KPiA+ID4NCj4gPiA+IElmIHlvdSBhZ3JlZSwgSSBjYW4gZml4IHRoaXMgdXAgd2hp
bGUgYXBwbHlpbmcuDQo+ID4NCj4gPiBJIEFncmVlLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBp
biByZW5lc2FzLWNsayBmb3IgdjcuMiwgd2l0aA0KPiB0aGlzIGZpeGVkLg0KDQpUaGFua3MgZm9y
IHRha2luZyBjYXJlIG9mIHRoaXMgbWlzdGFrZS4NCg0KPiANCj4gPiA+ID4gKyAgICAgICBERUZf
RklYRUQoIkVUSFRYMTIiLCBSOUEwOEcwNDZfQ0xLX0VUSFRYMTIsIENMS19TRUxfRVRIMV9UWCwg
MSwgMSksDQo+ID4gPiA+ICsgICAgICAgREVGX0ZJWEVEKCJFVEhSWDEyIiwgUjlBMDhHMDQ2X0NM
S19FVEhSWDEyLA0KPiA+ID4gPiArIENMS19TRUxfRVRIMV9SWCwgMSwgMSksDQo+ID4gPiA+ICB9
Ow0KPiA+ID4gPg0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9tb2RfY2xrIHI5
YTA4ZzA0Nl9tb2RfY2xrc1tdID0geyBAQA0KPiA+ID4gPiAtMTA3LDYNCj4gPiA+ID4gKzE4Nyw1
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX21vZF9jbGsgcjlhMDhnMDQ2X21vZF9jbGtz
W10NCj4gPiA+ID4gKz0gew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTVNUT1AoQlVTX1JFRzEsIEJJVCgyKSkpLA0KPiA+ID4gPiAgICAgICAgIERFRl9N
T0QoImRtYWNfcGNsayIsICAgICAgICAgICAgUjlBMDhHMDQ2X0RNQUNfUENMSywgUjlBMDhHMDQ2
X0NMS19QMywgMHg1MmMsIDEsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBNU1RPUChCVVNfUkVHMSwgQklUKDMpKSksDQo+ID4gPiA+ICsgICAgICAgREVG
X01PRCgiZXRoMF9jbGtfYXhpIiwgICAgICAgICBSOUEwOEcwNDZfRVRIMF9DTEtfQVhJLCBSOUEw
OEcwNDZfQ0xLX1AxLCAweDU3YywgMCwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwgQklUKDIpKSksDQo+ID4gPiA+ICsg
ICAgICAgREVGX01PRCgiZXRoMV9jbGtfYXhpIiwgICAgICAgICBSOUEwOEcwNDZfRVRIMV9DTEtf
QVhJLCBSOUEwOEcwNDZfQ0xLX1AxLCAweDU3YywgMSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwgQklUKDMpKSksDQo+
ID4gPiA+ICsgICAgICAgREVGX01PRCgiZXRoMF9jbGtfY2hpIiwgICAgICAgICBSOUEwOEcwNDZf
RVRIMF9DTEtfQ0hJLCBSOUEwOEcwNDZfQ0xLX1AxLCAweDU3YywgMiwNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwgQklU
KDIpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX01PRCgiZXRoMV9jbGtfY2hpIiwgICAgICAgICBS
OUEwOEcwNDZfRVRIMV9DTEtfQ0hJLCBSOUEwOEcwNDZfQ0xLX1AxLCAweDU3YywgMywNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJ
X0NPTSwgQklUKDMpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX0NPVVBMRUQoImV0aDBfdHhfaSIs
ICAgICAgICBSOUEwOEcwNDZfRVRIMF9DTEtfVFhfSSwgUjlBMDhHMDQ2X0NMS19FVEhUWDAxLCAw
eDU3YywgNCwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1TVE9QKEJVU19QRVJJX0NPTSwgQklUKDIpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX0NPVVBM
RUQoImV0aDBfdHhfMTgwX2kiLCBSOUEwOEcwNDZfRVRIMF9DTEtfVFhfMTgwX0ksIFI5QTA4RzA0
Nl9DTEtfRVRIVFgwMiwgMHg1N2MsDQo+IDQsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNfUEVSSV9DT00sIEJJVCgyKSkpLA0KPiA+ID4g
PiArICAgICAgIERFRl9DT1VQTEVEKCJldGgxX3R4X2kiLCAgICAgICAgUjlBMDhHMDQ2X0VUSDFf
Q0xLX1RYX0ksIFI5QTA4RzA0Nl9DTEtfRVRIVFgxMSwgMHg1N2MsIDUsDQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNfUEVSSV9DT00sIEJJ
VCgzKSkpLA0KPiA+ID4gPiArICAgICAgIERFRl9DT1VQTEVEKCJldGgxX3R4XzE4MF9pIiwgUjlB
MDhHMDQ2X0VUSDFfQ0xLX1RYXzE4MF9JLA0KPiA+ID4gPiArIFI5QTA4RzA0Nl9DTEtfRVRIVFgx
MiwgMHg1N2MsIDUsDQo+ID4gPg0KPiA+ID4gSW5jb25zaXN0ZW50IGFsaWdubWVudCAobW9yZSBi
ZWxvdykuDQo+ID4NCj4gPiBJIHRyaWVkIHRvIHNxdWVlemUgaXQgaW50byAxMDAgY29sdW1ucy4g
TWF5YmUgSSBzaG91bGQgaGF2ZSBzcGxpdCB0aGlzIGludG8gMyBsaW5lcz8/DQo+IA0KPiBObyBw
bGVhc2UuIEknZCByYXRoZXIga2VlcCBpdCBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyIGxpbmVz
Lg0KDQpPSy4NCg0KQ2hlZXJzLA0KQmlqdQ0K

