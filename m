Return-Path: <linux-renesas-soc+bounces-24196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63080C3997B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 09:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DCBB735060E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 08:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3EF305E32;
	Thu,  6 Nov 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R94Ik/wn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C9530594A;
	Thu,  6 Nov 2025 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417882; cv=fail; b=RYvYMJ3XerFKIT5YCcdYfwhRPY8Tf2227QwNH6kd/IsZDe8oW1kicyQk+2L9JQFF5vJC6IDckIGMe/63D9a6jWhe8H3z3bG2kMDb8himH2YmNzzmrI2mQFKnKgTPUUHMWz5UBILlzFTcyayvx80PRYOw+HntKVXRJRNVm/b/FGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417882; c=relaxed/simple;
	bh=Gzf81PDWDIDCE3/WWbrykK8htY1X1Ct+TDiEZQSYFbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sns+kyXWOQSz/yXYYvJWW53kwpqAyNj1OkiMUWrDwCHB/fpBvD4+y3mlOSJqTIU3ZPy6e+EQ7cgwnK1EuBl1ZZjtBVDbFdefsi+uYujydj6Z+XCsTg9/BElwWwbrd42q/Px0Oy2s15/ThTUz6XhNs0STPD78aNxIchxLd7MTKmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R94Ik/wn; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmryVRN0OmSXzUB3n5ROeaXh8/05l4tcTdtGYp1Dv1p3fIAEw1kbqztIXIrJ7Q2qbpoHSmjnjVXKap97hDaitdLnHxKRqiaSfNWsXGxgiHXCdaxS0tkzTPWKjTvxNSUeoQJH/IjreHLnnnCkcbWiDMgDZs2NfeKsPKcpJ4JS0DCOZLktQBcid/c90n0he3HS1COumga+dTyOPsbUtXwmEFqsb1BEZOjpSPuNNMLPxQBirZ2TjAixtq5R3MeRy31sXcNcxq5XrTwRG9kbVX/IeAhKEdMuJUiOi3zf6UBaC+y6PMnauz7XG5ewuBXhaERogPsrNt9YXZdQ0Hv/MA29lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1Ek4H6bMcCuauNazpZ27Jk0x/zjgJrRxAohicYF7j8=;
 b=wbHky6kN5EzMiqyqobvjr3nnL1e1Ra7ueZiPeU1Z+y/HWo2LWbqgCA1pL342LVEiQYFM6oQNEoZ1FTMrENcWOeP7GNQFpYcB28NLneuCVJJiraFT1FIuKoSbowFxVKP2q1EvDyeiwgdQcgwN7b7+99mahMF7iXqjj3ZvtfOYVAyaKmObmGwzZymGY6dbGt6lMN/erU35xAbwE1LyypYm088HFWPmswumUHXtsee/WCwDRJa5CftFjcOpQKix0L+ZzXuHZnDDgfSQho8MBo40mN17SCKkikINcpaoGcEvMuYBpGk8cDvXs1b2L7jxOChnDQosz99QGWZWm4THfdGffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1Ek4H6bMcCuauNazpZ27Jk0x/zjgJrRxAohicYF7j8=;
 b=R94Ik/wnc8iTJD3k/UAjDmhmAWEy6ARKpH1Vc8s1xXAA6qdJELxSnWokaVFHgqk6eqSJBRJWAyi1pwJGWpndxkm6XAPaCs7ilvlmZ3A09aCZwh7HP6nlD7lSs8NsSyLi8cWtWpdDX69XHh6V/+xIixrZf9vaf32g29ioojX8B5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB6668.jpnprd01.prod.outlook.com (2603:1096:400:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 08:31:16 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 08:31:15 +0000
Date: Thu, 6 Nov 2025 09:30:51 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/21] reset: rzv2h-usb2phy: Keep PHY clock enabled
 for entire device lifetime
Message-ID: <aQxcu8zNmIi8Hl7Y@tom-desktop>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
 <4b760e6e39679edd7f3d3a9a5b4babc7805ffe29.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
 <180fcd1307af02eadc6136512ef78226bc7c00dd.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <180fcd1307af02eadc6136512ef78226bc7c00dd.camel@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aa316e-5c0e-453f-f907-08de1d0ed9bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZUMGYxY0Joa2tiOUNMRTJlTC82cG0rV3gyVmZsZGRGUVJHeGFCM2VUQlJB?=
 =?utf-8?B?elVDSm5PcVk1dTkrNjhjWDhXVDE1WTRKZytYZkxHNHFhUzRjODNkcG0rRUMv?=
 =?utf-8?B?aWp0a1pCaXdWMkpVbjM3Nmd5T0Z4V0JjQWY4VjFoa0VEVlQvZTJvRjlYTU9E?=
 =?utf-8?B?dG9TS0UxUEtSQko4MmNkWWphU2loQzlpNkFBOTBzV2ZtSjFwV05UNDNWaVhR?=
 =?utf-8?B?b3ZMNHZHUFJSU1g1ellSeUtOcURONUdGRUh4TnFrS1hjZlIzcDZyQnQ1SlVp?=
 =?utf-8?B?cE80cXM3aWNQWmtYOVUrYWRmV1QreWx4WmVQallZcmc4ZTdGeldhN0tSK2xP?=
 =?utf-8?B?bTh3R2hBQXVSNXFNTUZpQWQyRklYYWpzZm10N01oVHFES3htNlF1ZDUwSDVz?=
 =?utf-8?B?WTN3UG9hSlFQT3F0dFNTdERLZG5KR0hEWTJiZmNJMmxZeHdUbTNxOGlwV1do?=
 =?utf-8?B?UTVObU9QNFlCd3ZsMHJQbklKQUVDYkExVkNDTXZDbzNzd1ExSG5nUmNUVzE5?=
 =?utf-8?B?eXBoY2ZrZjdmemo1M3hSajIzU0RpNzZaRnhVMHZlZHpBMVovZEZta3IxTzJ4?=
 =?utf-8?B?V0hEOWhMdEp5d0VXS2VOakk2RTRpUzNXWWhMKzZnWGtwR3JJcmZpSmZ4ODVh?=
 =?utf-8?B?aVZMZUlKcFI1K2RlOUpTYUVlMG8vK3Rka0FQbHAzWHM5OFVRYzhDZ0twUklB?=
 =?utf-8?B?Lys5dGJSMERlRGYzSWs0Qk44OTM1blc2bm1pRVBwdDA1TkMwdWQybU9qSEVP?=
 =?utf-8?B?RGRkVWJ3Uy9SVmIyaEFDd0pValQyd1lvN3Q3dmNnZUtWZ0ZwU0hZVThMaHdR?=
 =?utf-8?B?aVBrM2N1L1poU3NlTzhSLzNOd3l2RURTSkJsWWhsd0l6eDVXcjYwOEh6aHhX?=
 =?utf-8?B?b29tSWRlUFAxZXdmKzVFeXV6K0t4VUxydnpaRnF4QVR4a0N3RU5OUU5CMGF1?=
 =?utf-8?B?MTZCT09QWFpTTE14RWxyeFRGQ2k0UVRJeHFWVHM2ZUppOWUxWEhITXlTcnd6?=
 =?utf-8?B?aitxRWhaZjY4RGtlQ2R1RERZVmJnSHpSNnFIQWNkZFloakNsNnhETUM1M0ZB?=
 =?utf-8?B?aDJrcklhdDBGbkl2SGc5Q3BFLzJneThoQ2VnOEdqRS9Qbml1YmZONTFoSG1T?=
 =?utf-8?B?K0FGRkpsRmtBaEIvcmducFJuYzJ0MEIxQ0lOVjZ2dmxLcXN4TlBTS3Z1SGxR?=
 =?utf-8?B?SnNkcEdzVUJHMHlHM2NoRkVjK1NYSWNVWCt1R0tlSmh3TjRVbk9BNTYrSG1p?=
 =?utf-8?B?aWIvRExnUlRPT2xPNDNCa2FpNWhhMFBRL3RFTVEyeHovMFVmcTVtVGhxZ25B?=
 =?utf-8?B?NmJLMmVIajFrRW1SR2UzRTlwWlNBN0RUTjE2azlYS0JHcnBlbFNhbW5GWVk5?=
 =?utf-8?B?QSsyU3dDRGNDYUgrZ0RXSS9jdFFlREVPRW9MSXNzSnJNZVBqV2JJWmZiYnpX?=
 =?utf-8?B?VldLS1F2bjByRTRDYURZM051QlJoNEhwL0RaYVRWZEUwR3NnTjg0ZUluRnh5?=
 =?utf-8?B?QU1KUUZ1TGxmM0RRcGh3SXV0djdTMDNtQ0paZzJzOEtmZGVEKytXYUtpSzBj?=
 =?utf-8?B?N21rb05JOVFoeG1wTkhNVHQwd24xZ2wyZmxDNlNKcHBuQ1ovT1RJUk1tcjJL?=
 =?utf-8?B?bnBvWTdUZ2paL1M2UzFweWpoOVZ0SHBEM2R6VkMwVFh0eUJWVlFCVmVhWWxB?=
 =?utf-8?B?T25CM3hDVHVZb3I5R0EyYlBuQ01SSVZicUlQOFdHYVFrQzZQYTRyYnZXRDhs?=
 =?utf-8?B?WDArUUkxbjkxaHhoTnRNSVQ2NDI3YUQ5SllaQ2wzKzRRcVA1OURBQTZoeEJF?=
 =?utf-8?B?SmpOQkZ5TmJOeHJRbElLU0l4Yko1LzdlTWVsYWpVaTllVm9aNCtqRkI1WUFO?=
 =?utf-8?B?NU9aU0VMOU5TeHovS2RwMFVFbS93THFtb3lvNDhjbFdSbS81VUYvYkQwRHJp?=
 =?utf-8?B?eEtJdVpkRkxCWm5GbXlWSjVJQ3BBVWg4eGs3SHE2S0JBZ3lldHAzS3JISE92?=
 =?utf-8?B?THNBSDNQYUpHa1ZkSUFUZzV2NkFjdlFWaVdFOVJoVjZLRjg3a2UzSjArdzdZ?=
 =?utf-8?Q?xwY9Nd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlFqN3dkZ05DYXdhRTc5ZHBzd3MwMktHbGRSeDU5Y3pQRURtTEY2NTV5Q241?=
 =?utf-8?B?ODdaekg3S3pQRWNPbmJoZ2t2ZUR5Q3V4VmtDZlA1Wjl4N05PQmhQTlZUZEFE?=
 =?utf-8?B?RnJTWlBUK0pra2wzOEZNck1BUWY1blorNE8zM0JTVitVSkFKV3NZSUxQc1cx?=
 =?utf-8?B?VDJHeThnSyt4VDFWdjRocVIxVG1vd3k2VDNBWjVmNmxQdXhoa09razdvUHBI?=
 =?utf-8?B?NkVKcjFOTFRXc3B6VEZoSmtnUkFFSmNhNjQ0SzZBajI2RGxqd2paems4WXVI?=
 =?utf-8?B?Z3ZZV3FDNEpPNWdIckduc0JwbjJBOEtONHlCZk1zdldyQ3djVm1iL2F5Zm8z?=
 =?utf-8?B?WTA0cUhlRk4zYm02UklDZzhZUG1ETVA5bGU5WHhMV0pLMDFvNjNkT2g0WUlO?=
 =?utf-8?B?VTdCaU1IbTJTN1JwSzhScUFOYUQvenFxN3dMU1YyeUpqeG1iVzFKTFdKQnp0?=
 =?utf-8?B?MGJ5Q0QvWUtJZ2RwL0s0WGtLY25LLzl2OGZicG1DdVhvaGpxelMrR003eG95?=
 =?utf-8?B?cmt6TDhFV0pjKzhLbHdjZ05JVkhjZkloYzdOQlV0R3Q5b1VqcGZlUi8wbzQ0?=
 =?utf-8?B?anV1OU96STJONG1QNCtnYUQrVFBFMUtJK2xwU3RqZGtvSFBMOWpydTcwM0pR?=
 =?utf-8?B?QnBETjVmUWRpd1VSSzkxMW9EQTFocnpCV2VEQVVqRzI3eHJrQU1ZdFdnbkNN?=
 =?utf-8?B?biswLzRMSDAwWXdwam1OUmpvQXdVSmZ0UU1lTGpqdjBBTDVxakxWNFNZNnpK?=
 =?utf-8?B?VFhsTW1nRHJVYWx6R0tnTS9vNlFhVEYyRGZsZ29PSkN5U0VnaHZ6YW4xK3Qv?=
 =?utf-8?B?eGNDZVJZY2l4clpZQVdnWHVkWlhOdkdiY3pwZkszdE5ieVlSYzB1ZkdoQjVO?=
 =?utf-8?B?Z3J6dDdZc0xGWDRod1J1V1F1bVg0SzRSVnJWb0FHZy9EU2hrRnMranRDTWhX?=
 =?utf-8?B?aU1hRlBOK2h2U01UT2lJWmFpWC9PTk1oaUZ6eDQzNHdZVXVnSnorQ2ZUaXR5?=
 =?utf-8?B?bkxxdkZiOGd4Y0ZXVDlrNzBpbFNEZWJ3U1FwanpYeFU0OUtTdUphNWVSZVBV?=
 =?utf-8?B?ZjI3UENLYVQ1anEwVWNCUHBSbi9xTXlvNWV4eXl6WmpzVTZnTllGbDVXOGVs?=
 =?utf-8?B?MDZFN25sRDJxMEFpZ2pzUU1CZTZvSnlwck15UnZBUDQyeTlBVDJmTHEvOWtM?=
 =?utf-8?B?MFh4UzRrYTkycXExR2JRa3U1QXd3OUdKOUpwa0QxZDhHTTF1Q1F5WjRwVU0w?=
 =?utf-8?B?VSthVE1ORjJob2tHcnhzMkFJZDFUMitsUFhXdXlBL1pUNnNLdmdhZS9QS0Q3?=
 =?utf-8?B?NnJjT2FhZVhUUXRFemkxc1cvUTJJVm50NThyNHVXY2lHQVF1T212QnRyMXll?=
 =?utf-8?B?eUM3ekR5dlRmT1BYUWhHRXZaaDJPbzVuVnJuM3Zvci9kRCt0QWM4Skxqa0tp?=
 =?utf-8?B?Z3dqa1c2YW1SMFArTmVwL1hQVDJlUytwQjZYalBjVkxjdmUzYThsTUtWLzl0?=
 =?utf-8?B?OTZvd2pRUkV0OTFBOXBpZnlFdFR6V1d1U296S0txcS9wYjZtYzdlNXdmdDFa?=
 =?utf-8?B?MTZoQ2hwMytWWWNLdjI1bEhVa09PUDVDR09yb2NyRm5QSDIrWkpFeGE4c2VT?=
 =?utf-8?B?K2xySWJFQkpSZ2R4WWR4ZDdNQzJwRFJqTUFVbTlWU3hnU2hTeUxpRXNQS0Zr?=
 =?utf-8?B?YUVvRzFTaUlZR3FHbzlkSDVEdTdCNThPSzJxOEhSRzc3WGFLWDJuTGtVZHl2?=
 =?utf-8?B?cTlQakwxZ1psNGF3QXNWWmVGTS9BcHdMdlFGeUxTNU55TlhReUFYWWkraUhQ?=
 =?utf-8?B?cks2cDNkR0NPRWZ5dXhHU0FGU1pOZ0d5OHBuYnNFZDQrcGxwNzcwVmJFdUt4?=
 =?utf-8?B?bFJsNWR4MGtyRkVxSWp3RGpZNnZQZlJ6eDkxL1FZZnBOS1lZb0JBY2FxdHc3?=
 =?utf-8?B?NU1OUUdSYnZiNDRNOHJKazYxYktXY1pqS3RKSGRCakpSL1B3WGdUWjhEWGpq?=
 =?utf-8?B?cVJrUlJwMlE5MGNleTFvZW5FMUJhZ1A4N2xaWHNWUCtuclNNWEw0eHUrNTR3?=
 =?utf-8?B?Vm1vUTY3NXczdDNkWitscURvUVNRNjNScEZBR3NObm9haXFYc3V3S2VIbDhs?=
 =?utf-8?B?OUhDMDdleW5iMzQ3RUtUWTl6NHF5bDJmT1I4ZUZzK2xWaTRnQ2kzQzZzbFBL?=
 =?utf-8?Q?HO96n0dBomlmtsUjO4a/57M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aa316e-5c0e-453f-f907-08de1d0ed9bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 08:31:15.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzS6LrcQEYxeirKtRmMma4yzFu1cFkhk2jl0pB1ZDn7iKbDSrqPIqqDaIPhFoorY1UrEBlEhH4RSRkZWcAceZ4k30vK94dmRls3uUfNtQ8aZ5+1ahlLTT5K0ZzaT6g+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6668

Hi Philipp,
Thanks for your review!

On Wed, Nov 05, 2025 at 04:59:24PM +0100, Philipp Zabel wrote:
> On Mi, 2025-11-05 at 16:38 +0100, Tommaso Merciai wrote:
> > The driver was disabling the USB2 PHY clock immediately after register
> > initialization in probe() and after each reset operation. This left the
> > PHY unclocked even though it must remain active for USB functionality.
> > 
> > The behavior appeared to work only when another driver
> > (e.g., USB controller) had already enabled the clock, making operation
> > unreliable and hardware-dependent. In configurations where this driver
> > is the sole clock user, USB functionality would fail.
> > 
> > Fix this by:
> > - Enabling the clock once in probe() via pm_runtime_resume_and_get()
> > - Removing all pm_runtime_put() calls from assert/deassert/status
> > - Registering a devm cleanup action to release the clock at removal
> > - Dropping the unnecessary rzv2h_usbphy_assert_helper() function
> > 
> > This ensures the PHY clock remains enabled for the entire device lifetime,
> > preventing instability and aligning with hardware requirements.
> > 
> > Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - Improve commit body and commit msg
> >  - Added Fixes tag
> >  - Dropped unnecessary rzv2h_usbphy_assert_helper() function
> > 
> >  drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
> >  1 file changed, 18 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
> > index ae643575b067..5bdd39274612 100644
> > --- a/drivers/reset/reset-rzv2h-usb2phy.c
> > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> [...]
> > @@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
> >  	if (error)
> >  		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
> >  
> > +	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
> > +					 dev);
> > +	if (error)
> > +		return dev_err_probe(dev, error, "unable to register cleanup action\n");
> > +
> >  	for (unsigned int i = 0; i < data->init_val_count; i++)
> >  		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> >  
> > -	/* keep usb2phy in asserted state */
> > -	rzv2h_usbphy_assert_helper(priv);
> 
> This change is not mentioned in the patch description.
> 
> Is initially asserting the reset not required after all?

Since we removed the pm_runtime_put() call from the rzv2h_usb2phy_reset_probe() function,
and power management remains enabled for the entire lifetime of the driver, we also need
to remove rzv2h_usbphy_assert_helper() from rzv2h_usb2phy_reset_probe()

Additionally, when testing the unbind/bind USB2.0 chain, this causes an OOPS on my side.

I’ll mention this in the next version.

Thanks & Regards,
Tommaso

> 
> regards
> Philipp

