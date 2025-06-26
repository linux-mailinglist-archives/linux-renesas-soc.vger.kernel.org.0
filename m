Return-Path: <linux-renesas-soc+bounces-18765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20029AE973D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67434172F6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 07:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E804423D29D;
	Thu, 26 Jun 2025 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jLITSKSo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011070.outbound.protection.outlook.com [52.101.125.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3F20013A;
	Thu, 26 Jun 2025 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924306; cv=fail; b=SbMKpYHIXicR4k5dmxsp0bJSqQ/bT3lAs26r9xetf9tj5Qa6ycQA4HOHKmgg9jJtr4cGGDzHjmpzOecQvyhHkJ+0a2tE+JG6p7fD2YCcgVIwQDNtkpKQelNmuGiP/IsJ4QacveAbtZlkuCJFo4hf3CFSYWX2Ewv2+GnG+ESpi00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924306; c=relaxed/simple;
	bh=XEkEj1qMl4WwR4+L5ZDXD+y8e8cP/kxg/4srBF3/H8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iHs2YKezaQTeCX7/Gtx2bSjokR4G2x+RQFyByQ3rTI0M3gFPWmEN7lR2mPrQwL8DbnjgvVBKpMqHPg0L6vtQAWNVlVKSlw6n+So6xm83kThuD+P2jyQ06tZsIhqG7G5fR+OD48lBSHNUDujIMkM82RlD6fzpmzaBX9hcreNOZ8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jLITSKSo; arc=fail smtp.client-ip=52.101.125.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in2yO1belpOlFSQF7e9vgvljn+Bjy3j111O31zfLGu12VweGpFec2gYIdBPTDxlNS0M69ldS6ucaVoNCjCtMryy2MQYlnMr5jhzfhjsDZcfmva7xNSAA0LR5HZLJD3WkrHsrQRNh0ow7UtjX/g0xMUnoBwDtxrFQ2yMZ/i3Yup/VISdzHfszg8ENYHM/MnlOovl9x7hEfnbgA1BJdSRXwm7dHeOqf2tvrLyNYJo3qSCCREqCjBtUfyQWgku0DnyZvavVmMPZqn9v7eymhsRd6v6PSkwxyrMUB3s5BD/oZJ5j9wgLSm4+k/7yMqfXb6dF60NZwldRCO2wm0axKIRq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEkEj1qMl4WwR4+L5ZDXD+y8e8cP/kxg/4srBF3/H8U=;
 b=rhlQZIJp1NlXjXGkrivKj2mTC2uWuZQzJmh167HVPuUm2Bb0Tm3qO2U+YZH1Cejt8w99gKpLwHiHzsitkLMm263YBr+qV9BPAdfcPF6G4BuLV4UMISoPvn/mMlt40cnLddFvJlhLyzN2fvyGCOKb+KtfVQCKMyv+TsZswtnpLDcibpNl1cXYyE6ukFkuNtNqWNcvqbi3NhqmrC0S0ZCJiQREFNRkgc5giPk3/T5F4N4+EUGGqIUMC/7pWCJ6C5lCx3rBiq3TG2gDDhPLGH30DBS8ZupamV4K+EFDt6VSf+AtRu6H8r5/cBTubQeXAmnBTiHKqLPOWQsvC3mqFkmwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEkEj1qMl4WwR4+L5ZDXD+y8e8cP/kxg/4srBF3/H8U=;
 b=jLITSKSo6ELppdOr6KOwJ816Wk2ECZOckwXS6Bk3z28rpKOLC9VwYf/6+n0msd9VGl5Vg5uI9lbiZd7HsjWbwL5hCqmvJbelBR4NgVZHgwuY5x6ZzDusQ9hbg4EnRGqdkPDcs/vaGGrd9XYL9iigY1opIQQW8ey3Fx1h5FR+PP4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB12113.jpnprd01.prod.outlook.com (2603:1096:604:265::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 07:51:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 07:51:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, John Madieu
	<john.madieu.xa@bp.renesas.com>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Topic: [PATCH v3 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Index: AQHb5BWCKQYhL2RsjUudvpKiVbgmqLQUACIAgAEVNoA=
Date: Thu, 26 Jun 2025 07:51:38 +0000
Message-ID:
 <TY3PR01MB113467747667812091F42CA6E867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com>
 <20250623080405.355083-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWtciRt+H3eQjwLw3O5T=NCG7Vqx8a=pGWBoHTJ2Q_G1Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWtciRt+H3eQjwLw3O5T=NCG7Vqx8a=pGWBoHTJ2Q_G1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB12113:EE_
x-ms-office365-filtering-correlation-id: f7ddd3a2-c4ea-4290-191b-08ddb4864859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDRmc0tsWTZyM3JwUzcvYkh6K1ZEUUpRWUtBZUZOTGVVMG9QeTlGd2w2RkUv?=
 =?utf-8?B?VWJMczd1K3FRVmhqWW1ONTNlNUR1UVErcUwvK3cvY0pka01PSkgzVURscXZP?=
 =?utf-8?B?SjZqVUxZODloVGFySDczNkp5ZDlFVVRYNk5yUDhaMUgxc1psR1FNVVV1cEFs?=
 =?utf-8?B?S1RLejBrbEptUEhmOUtJMjNKdytBa092YUtqZWM0bVZwZUdLcURjLzh3bi9w?=
 =?utf-8?B?WlowV1BqWmdEb1NxaW4ydEYrbEFLblFMcnlxcU5KSS9pb3MzWFdUVWw1SmNy?=
 =?utf-8?B?M1FNV2trRGwwYUdWUFJ5NHg3djNicTltMTE5S3NBSDBRR3Boa01TbmpqdGdm?=
 =?utf-8?B?Mkcvb2tqTWw5RE5WOTFMeDVSL25JUjFDSjUzbmpDM1p5ZUoyTXMrMWt1WWVX?=
 =?utf-8?B?ckRDelVoSE5JblQrY0lXaERzMFEraW9sYXk4V2kzNlFOMDFMeE9aVWRXc2xJ?=
 =?utf-8?B?T2RwdzFCUmdCano2VWc2amRIcUl5cGM0QkRuVnhXZnR2RHZBYjZyUndjZU1k?=
 =?utf-8?B?dTkrd2xKT1VrTit0YkRSV1BZYjdGeGZUZ3BPbVllb2hKK1hhRDVuMHpzcHFB?=
 =?utf-8?B?Rk1OTHd0Ym9GOXBUWlVDSVluVnpuMGczcVZjMWRsajlNU0NEN05kWmFhQk9v?=
 =?utf-8?B?M2UzbEE0R0ZEVWlITktKOGYxTFNQMERHMnZ6WEdDaHB1b1BKRjRXdzdaUmE2?=
 =?utf-8?B?QnEyVDJKSkZrcUM1ajhQbWcreGhjd29qUDdtZExSdFhmalRNYmI5b3gvbzVG?=
 =?utf-8?B?RnRnZU8zU0J3U0FSTHlnSFZEMGNYSlMrWjNwUTdYWk04RTNHSGNRSFRhbXdv?=
 =?utf-8?B?VXFUc2VCZm5GNXFXS3RiemJGc0x0d25DVVlQdmRKbUVwL2crOWpIZnBzMTB3?=
 =?utf-8?B?SVNwaDdIczhRaEUyUWZXR29ObUxweDZnS2FobjIyUGxZWXova2t4N1BzTHBm?=
 =?utf-8?B?T2NYSk1YMDVjYzhvVldHQVYrVnBOOElHcDRUTVpiNGo0NVNaTXFaZGlsa2JL?=
 =?utf-8?B?eXNFaEUxRVhSaUlWK0UzYXNZUUx1am5VRklRNlRpeTZxVGovTmhOUnVub0pL?=
 =?utf-8?B?OE1NTXpPK2ZVMEU0UlNnRDc2VjdZMkJGdWVHb2FmckFxVmMwL2o0aHZNTnBC?=
 =?utf-8?B?NGdIZ28waC8xTEtpRWs1ajFCTlJSN2V0R1VEaklacVdEYytTbDJoLzFja2ZI?=
 =?utf-8?B?eW16cFpJdkhMMUVzZU9UaEZtSUoySkswSElCeE5TUGVxZkJDRFNsOTMwZVEx?=
 =?utf-8?B?cXNJamRFTUxZT3UySnRiSXpla29QTGVrb015NWxIT2hmK1FaWjZKZ25pdVRm?=
 =?utf-8?B?QnRMQ0FENVIvTGRIN1JaZXdTdUF6ZzBSbnJYS1J4bDFKVlZMZGI5TlhaNElL?=
 =?utf-8?B?WjdJcyt1R2RrN2R4VDB1VUp3Y0srQ1BQcGNVTlVhL01ab3BRVTdrby9iNzli?=
 =?utf-8?B?OE43WEZzK1BndFBvR2w3d211YVVqT05HanFGVU1wYXlMN0FlNkg1czJRTU1X?=
 =?utf-8?B?ZkJmZDhWbUFUd1lFVEJkK2NGTndtRU9TNEdMcjhYUkFZZHNzeC8wNlVtNC9K?=
 =?utf-8?B?ZkwzK1BleWRjb2krQ0FUcVhiQTdJSGRaSTR1VXY0MGpMbnkwdFROaE53WjBq?=
 =?utf-8?B?RFlCNld0aWxOWS9PZGhHVFRNZW9Yc2RQeEdCczJmeFNYMzgzY25GZEkyTjBJ?=
 =?utf-8?B?OEpNUm5rRXhUL3Vtb1B5WXNJT2lGa0FRNC9rK2lDNmxWN3RUR2FlQWdNcXZ6?=
 =?utf-8?B?VVFUSlJ5MTJ4Q0FmRmtDb1RkaTRna25xK2VZY2ZtMG9nc1JRZmhYZlVLMjZ5?=
 =?utf-8?B?emhYU1BQRDZvMnRURlhlaWk4N0ZzNUo4RUYxaEFvbmdWMFc0VEl2TlMyUWNi?=
 =?utf-8?B?c3c2SXVtMEZ3SmlNVFNBWDFlT2F3SGdIc1FobWIwbml4OVFrSG00SkRsRVJi?=
 =?utf-8?B?RXUrbDRHM1hkbU9obERqc0ZLMFczTzFTQWtqQ1c1SmlLMUxZM0dZcUtQU1ZH?=
 =?utf-8?Q?g3qKuxWuKaoLoyEzYkYfcoTknC0pwg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekNvcUwrL3RXdmJPTjcwek5mYTBreXhwY21zZGpyTGdvY1NZYkdmVDdXNHpC?=
 =?utf-8?B?NWxGRUNGMW8xa3pURUkyMkJWTmdsbXFiSlJtYlA3YlNSZHVSaS9aaEhEaUlu?=
 =?utf-8?B?d0xJRlU2TktrTTVPYVR0MFhBbnJVMnh1M25nSklITnpKQzVjWVh5SStWUEJv?=
 =?utf-8?B?S2JYM1c5QVh0dlZ2OHpsUVQva1R5RjBCZnhWMEVmamw2SW9mam1kQWlINkVV?=
 =?utf-8?B?L0xicHN6eDZwSGEvNk4wY0w1Nm9QeTVwSVJxc25LVVM0L0JaSElQb0szVkJJ?=
 =?utf-8?B?TEx4aUI5WldOUVVoT0JlZ0VVeE1qQWlpcTJrNVJHdkdvZFZic0lRdXF2amlM?=
 =?utf-8?B?bFRnSmVKUHNJS0MyUFNtY25IRXMya3ZZQXkxMEVxNHJOanVRNTZ2WW5EUnNx?=
 =?utf-8?B?STlFNDJOOHEyeElqU3RUc1VVRm0wZ0x5QW5OdU9UR1dySlhqaWxkS2syQjk1?=
 =?utf-8?B?ZzYxdU0zZERZWG9pa044WVkvK3pyVEJyS0dMclJJcUN1VEtCazhwcGFYTW5w?=
 =?utf-8?B?YVF1S29vQVRUOFh2NEpaa1pIUDQwbFhTb201aW4zOUplRlRnQytHTlp2N1JJ?=
 =?utf-8?B?Q0YvZ09kTUdLSGlQeXZ2L2U3YndOZDUrZG5HdWl1M2Fldkpma001eTVPT0lz?=
 =?utf-8?B?cjEzTGZ0SHRnZG93Q1pBRFFoNkY5eTJma0ZlVXBiMlBDckZQdC9hN3VwenFp?=
 =?utf-8?B?UjhDVU13YnNrZ0JNbXMyOG5Ub0ZZV2huL1R3YUhRK0lkOElqNmRaR21mVnZV?=
 =?utf-8?B?WHQ2a1p5Yi9uN2N4bUdwMTRoMjJ4bXcyVnFUY0hKeFVYbG1iZ2pnbllSby9a?=
 =?utf-8?B?OGc5YjVhTEN1cWE1dnNhQ0s2TUhlMmNsNTFsbU53Rms1QmxTTlZqUmg1MmFM?=
 =?utf-8?B?VW94UnMvZG83b3RyWnp2dDBKenhHL3U3OXRkb1pMZEduNXk5U3Y2Nm5CdjJl?=
 =?utf-8?B?cEpXeEFFODJsL2kra29JanZJWW5HOU8rM3RuajFObGE2UU9DZlJoOW84R0Y5?=
 =?utf-8?B?Qk1kN3Y3aXRZVDlQZUZPR1h6aXpUTnBYY3hKbEtMUFRrYUNtUDhZdTlEMlF2?=
 =?utf-8?B?V1V6OGZRL0REUmxUY0NENU9oUkZtclZyZXRjeHFTRmpKbEpXRS9kS3RhOU93?=
 =?utf-8?B?a2hGeW1GTmFuL3JZd2J2a255Y3ZzdFgrdWVXZ1d1SWtxUnNHd1dIWGpLeURs?=
 =?utf-8?B?czdQQk1PN3A4Ky8wMkdmMzRqZU1Gd3RlQVdZeVBiV09Rclg5VnEwUG9jUVlu?=
 =?utf-8?B?L1dLdnBFV21WK0J4OHNUMHUrb3ZSN2RJTDNObWIybnBmSzROMXVnOTMxM2Ns?=
 =?utf-8?B?eHN5cjkrUTNoSDZWVk1wb3BaY1F4WlhSZm9vTHgzaGExQUlTT2RqNnV1czhw?=
 =?utf-8?B?S1JsT0ZWaFY5VnhvWEcwZXFjcmpaMkhOc0hjS2dXaXdGdGZ6U0dKbVVNYW1q?=
 =?utf-8?B?VVhPeGI5eWZTSDFrK0dSa3hPVkoyRzZWeDNQb0tvb3BYUnA1bnM5U0crMURE?=
 =?utf-8?B?K1lFUE9CeDkrekM2VUtTTTJKbm1MeE5VZ2RQTXVGRFRzNUZZbmdGQzRCVDlm?=
 =?utf-8?B?eFVlMWhibXdGWllvcTNlWi9WWmhSMzhmSFFoNm82azFwL1NmSnZ1Yi9jaTNz?=
 =?utf-8?B?YndIQklyQzF6SXlNY0pRVlZCT2ZHWktlWFVCczBwTEFZM1d4bERHc01RRXd2?=
 =?utf-8?B?eUdRM1NCR0V1Mm9DVjNsakxHNlArZkFvUjRncmdlb0RlU0laSUVNUlkvRFFr?=
 =?utf-8?B?R0dLcXdHSUZNMVNJdnNwMFBKTWV0YWJLK1QrQ0x4ZFRWVHJlVFliSzY3WEd0?=
 =?utf-8?B?dVVIWmV5cUNMa3Z4NmhmYjh2NG9tZ2tHUGxjdDNvVDRmVSt6aG94cUR5RXMv?=
 =?utf-8?B?TzRHY0J6VnJ5VjlOSkdIbjdrZm1lVVlNMmJFUmg2czJtU3labTdodTkxbVcx?=
 =?utf-8?B?TjVSWFNqNFl4K3ZBTVVBVnJFTTJiQmRXKysxTExUT08xbUF1aTFxcitaMDVG?=
 =?utf-8?B?dEhFT1dQYXlKWDRJeTVNZS8yRmwrQ0MxTFBYcnZqb3NrZ2U3NHpTTjJqaEpp?=
 =?utf-8?B?c01kY3Q5Y2NJM1E1REtGZ0FWdjl0QVR6UDNhZTAzajc5QTdpMWx2OFFwc3Nv?=
 =?utf-8?B?QnZTSnN1MUhIMk1PTmtlR3YrdGhrSU9vNllFZ3VscDJxcDVic3JmMTFWRFNI?=
 =?utf-8?B?L0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ddd3a2-c4ea-4290-191b-08ddb4864859
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 07:51:38.8797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdWiiui7TH/kCTgr7zOLF36qsWLYTbwx5iQL4/0TF9TBs+596vGTy8GtYgdyBzJGtLdo5OuY/mR1wnB0JZj7bss5x1zZnILHz5wSGJbj7Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12113

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjUgSnVuZSAyMDI1IDE2OjE3DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemczZS1z
bWFyYy1zb206IEVuYWJsZSBldGh7MC0xfSAoR0JFVEgpIGludGVyZmFjZXMNCj4gDQo+IEhpIEpv
aG4sDQo+IA0KPiBPbiBNb24sIDIzIEp1biAyMDI1IGF0IDEwOjA0LCBKb2huIE1hZGlldSA8am9o
bi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVuYWJsZSB0aGUgR2lnYWJp
dCBFdGhlcm5ldCBJbnRlcmZhY2VzIChHQkVUSCkgcG9wdWxhdGVkIG9uIHRoZSBSWi9HM0UNCj4g
PiBTTUFSQyBFVksNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4u
bWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiB2MzoNCj4gPiBVcGRhdGVzIG1kaW8g
c2VwYXJhdGVseSwgYmFzZWQgb24gcGhhbmRsZXMgaW5zdGVhZCBvZiBub2RlDQo+ID4gcmVkZWZp
bml0aW9uDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRzaQ0KPiANCj4gPiAg
JnBpbmN0cmwgew0KPiA+ICsgICAgICAgZXRoMF9waW5zOiBldGgwIHsNCj4gPiArICAgICAgICAg
ICAgICAgcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKEEsIDEsIDEpPiwgLyogTURDICovDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChBLCAwLCAxKT4s
IC8qIE1ESU8gKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElO
TVVYKEMsIDIsIDE1KT4sIC8qIFBIWV9JTlRSIChJUlEyKSAqLw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQywgMSwgMSk+LCAvKiBSWEQzICovDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChDLCAwLCAxKT4sIC8q
IFJYRDIgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVY
KEIsIDcsIDEpPiwgLyogUlhEMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpH
M0VfUE9SVF9QSU5NVVgoQiwgNiwgMSk+LCAvKiBSWEQwICovDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChCLCAwLCAxKT4sIC8qIFJYQyAqLw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoQSwgMiwgMSk+LCAvKiBS
WF9DVEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVY
KEIsIDUsIDEpPiwgLyogVFhEMyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpH
M0VfUE9SVF9QSU5NVVgoQiwgNCwgMSk+LCAvKiBUWEQyICovDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChCLCAzLCAxKT4sIC8qIFRYRDEgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEIsIDIsIDEpPiwgLyog
VFhEMCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgo
QiwgMSwgMSk+LCAvKiBUWEMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNF
X1BPUlRfUElOTVVYKEEsIDMsIDEpPjsgLyogVFhfQ1RMICovDQo+ID4gKyAgICAgICB9Ow0KPiA+
ICsNCj4gPiArICAgICAgIGV0aDFfcGluczogZXRoMSB7DQo+ID4gKyAgICAgICAgICAgICAgIHBp
bm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWChELCAxLCAxKT4sIC8qIE1EQyAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRCwgMCwgMSk+LCAvKiBNRElP
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChGLCAy
LCAxNSk+LCAvKiBQSFlfSU5UUiAoSVJRMTUpICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIDxSWkczRV9QT1JUX1BJTk1VWChGLCAxLCAxKT4sIC8qIFJYRDMgKi8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKEYsIDAsIDEpPiwgLyogUlhEMiAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRSwgNywg
MSk+LCAvKiBSWEQxICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JU
X1BJTk1VWChFLCA2LCAxKT4sIC8qIFJYRDAgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgPFJaRzNFX1BPUlRfUElOTVVYKEUsIDAsIDEpPiwgLyogUlhDICovDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChELCAyLCAxKT4sIC8qIFJYX0NUTCAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRSwgNSwg
MSk+LCAvKiBUWEQzICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JU
X1BJTk1VWChFLCA0LCAxKT4sIC8qIFRYRDIgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgPFJaRzNFX1BPUlRfUElOTVVYKEUsIDMsIDEpPiwgLyogVFhEMSAqLw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoRSwgMiwgMSk+LCAvKiBUWEQwICov
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWChFLCAxLCAx
KT4sIC8qIFRYQyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9Q
SU5NVVgoRCwgMywgMSk+OyAvKiBUWF9DVEwgKi8NCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+
ICAgICAgICAgaTJjMl9waW5zOiBpMmMgew0KPiA+ICAgICAgICAgICAgICAgICBwaW5tdXggPSA8
UlpHM0VfUE9SVF9QSU5NVVgoMywgNCwgMSk+LCAvKiBTQ0wyICovDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWCgzLCA1LCAxKT47IC8qIFNEQTIgKi8NCj4g
DQo+IEJhc2VkIG9uIHRoZSBmZWVkYmFjayBmcm9tIFByYWJoYWthciBvbiB2MiwgSSB1bmRlcnN0
YW5kIHRoaXMgbmVlZHMgdG8gY29uZmlndXJlIG91dHB1dC1lbmFibGUgZm9yIHRoZQ0KPiBFVDBf
VFhDX1RYQ0xLIGFuZCBFVDFfVFhDX1RYQ0xLIHBpbnMsIGFuZCB0byBhZGQgc3VwcG9ydCBmb3Ig
dGhhdCBpbiB0aGUgcGluIGNvbnRyb2wgZHJpdmVyIGZpcnN0Pw0KPiANCj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9DQStWLWE4dWl6dTVNQ3VyXz1nNXZKeVdiV1NUU1AySjZGa1E4
OUpCOGdlczdHV2RzamdAbWFpbC5nbWFpbC5jb20vDQoNCk1heWJlIHRoaXMgY291bGQgYmUgdGhl
IHJlYXNvbiBmb3IgUlovVjJIIHNlZXMgY2xvY2sgbW9uaXRvciBpc3N1ZSBkdXJpbmcgdW5iaW5k
L2JpbmQgYW5kIFJaL0czRSBkb24ndCBzZWUgaXQgd2hlbg0KdXNpbmcgREVGX01PRCBtYWNyby4g
TWF5YmUgYWZ0ZXIgdGhpcyBjaGFuZ2UsIEl0IG1heSB0cmlnZ2VyIHRoZSBjbG9jayBtb25pdG9y
IGlzc3VlIG9uIFJaL0czRSBhcyB3ZWxsDQpmb3JjaW5nIHRvIHVzZSBERUZfTU9EX0VYVEVSTkFM
Pz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=

