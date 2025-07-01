Return-Path: <linux-renesas-soc+bounces-18983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274FAEFA31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76B817138E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565C627700C;
	Tue,  1 Jul 2025 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="acAIvK+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF72741D1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376064; cv=fail; b=W5bGKKjOcPqOsHMYWQwrybG1McwpzwQU3I34gMUqjw/bI/GSHLo/buLD20l1r6RcsawPurX3UbZSMDCxs0uNMtHQdDRF8WXPrixh5reaVd+CCn+6jAH/ZgIZr9aeLt4Oo9owdWQAPPUGFGwSLW70yBjC/eAChHhIklJTSVZCqkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376064; c=relaxed/simple;
	bh=Zph4WhA//buhpbxH3iZwzt4Qe1Mq+Is+fnb9gHCIKFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kv1kfztDcvEPiF1mlMpAiKb+Hic0mluIjjnDMtaA6bh59GBSr6jIdFOU0+CHu/rIAzd1sSX5cf8E2J1yXzgnZGT3EMGqThww0Wk5/kDm0sHIbRf9Mu0aviy82/HyJ005IJpOP0WORtNMJLWSgo5TXew/BMOcCWuVj/b/DL00Ty0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=acAIvK+w; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ3hOKlM6n4usjxfkYMH73XT1G+yF6Dy1QNi6rCt5wh8KdrNsm7ddlqYswc9+wWcQ03uxZwln0eJm7O5bMAz2/8MFkHW35l5H6KY4t8j6KcmJMlMUHj/si6zGFSgWT3vw984mGys3NngfqdjRXPZ8Goo5O3fcxlJMLIM+xmh4SGbfIdN2Do91mPeCbBb7oXR/5XpIDXgy2CFceBdSYcJy1QMhP9uR1jkLlYvmxictXhartDvbqIVVx9xAPYfY4CafaNmL+hfNz+B+uGrYnPAGC+2RepkJmLmp+GlvReluuZl2wZg8ydrwmhOm8/oGXxf83KYFSXnXbV/TdeKHF9j5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zph4WhA//buhpbxH3iZwzt4Qe1Mq+Is+fnb9gHCIKFw=;
 b=ZslBi8263P2eO8kFi16j+aNLZKNupnRkjxzjjbQq3WXjyC47dSbFd9tyLb7JOgm6vibKluMDVAOrCOHRDl+zy0lzmvWEqLgnvcw2Lhq3T6dJOHyf4mqsSOWonJYvrpd/B5qGjG/c0L23ILKWZI7OmsSeZfndV5RzEOXdUK2uJgXGz0b+CJhyTN4TtQSCca27wGoGSv517+fKP51t7eSlCyyBJ7accTrD7ZlNYMRWeWfQgosln2mYencCcRrnC7gOZ8voYpVHOa3IeKrXQPDzpgLPljLPgVeYEUnKgLpelak6cCqmCsbUXXrU4c+l0CMty6ap01HcH1s3M8LqSMP+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zph4WhA//buhpbxH3iZwzt4Qe1Mq+Is+fnb9gHCIKFw=;
 b=acAIvK+wa0ZTFdDaphanJmUX6f0xqnfdbpi8wp1VUI0xSB/FuKGzpdWGUhHqfGu59cAudJa+J4fWgbHDb+Ptq6HRvhohN0ZkWIE6NTbJ/JjnuRqm1qlAFVQKtXtIzK/NfaOYRVW56f8gKcIpJkX6aWw6xuPUalW546u2cLoyj3Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13776.jpnprd01.prod.outlook.com (2603:1096:405:1fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 13:20:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:20:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
Thread-Topic: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
Thread-Index: AQHb6nc4GoXyynlWI0KlXyMSa1SelrQdPKwAgAABYMA=
Date: Tue, 1 Jul 2025 13:20:56 +0000
Message-ID:
 <TY3PR01MB11346482B233A523CC80A23298641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVfusCsJawffmo1AUS4yPoC_MFyetcPCufuFEiGtvjuuQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVfusCsJawffmo1AUS4yPoC_MFyetcPCufuFEiGtvjuuQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13776:EE_
x-ms-office365-filtering-correlation-id: 8bc5cc98-5897-467f-107f-08ddb8a21cd3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXdDMUNZbnpOVVNzdnRuNG9wUXJYZThpci9oNnZiUUdmQjRPVkpBVy9qUlJo?=
 =?utf-8?B?NStoZmZsSGFsMEppb2hRV2ZOY3lvdW9oSXlRWFJ3bDgyZTBpM2lBcVNncFhh?=
 =?utf-8?B?ZlAzNUhkbHp5Vnp2YkU0bUZFRG8rdzliV20xaWNOUk1PQjhURkJSU2x6YVcx?=
 =?utf-8?B?TEtIaVc5VkhybVdaZjgyeCt6YVhsTFJ2bGhQQi8yUjcweUZ2ckh4WUt5aThR?=
 =?utf-8?B?aXJUM3NwN2lBaUJheDI0VnI0R1FtaUtDbkdoVmd0N2tMMTA1dkw2bGZQakk2?=
 =?utf-8?B?VWxnMEFnSUJ6NzZRTnY3TE9Na3p0SzNXb2NCeFREM1FSYy9CUEFlTy9RVFRJ?=
 =?utf-8?B?cld6WEwyY21obHRpcmxyMnBDZXFRWlUzWTVCNi9rWldBdUk1WnRqaTdPV1NW?=
 =?utf-8?B?djBDY3lsZDJpb3lQQndVY01SNGFLN25YNUQ2T1E5Z2ZhVXNGNE4yL3gzTExX?=
 =?utf-8?B?M1FKMlg4dGVGWWZoOHM1bE5YMWhnandLb2Iwc3FGWDFXNFpiNEdwQnJlK2FB?=
 =?utf-8?B?L0hBeUs5dzdjUEEyeDQ0U1lSU1lHcEIwUW1JWDNTeVpDL0ZIdDYvQStmdnZC?=
 =?utf-8?B?Y2JBZEoyYUozZ1NZM2dyeFNhZ2R1MkRsZkVnckp0VmJkdjYxSEF5ZFoyblBv?=
 =?utf-8?B?VlhqTW5YNkZ0OVJ0cTErdDk0VVdJYllMeFlvWG90c0NjUEtMZzQrTndKdnNK?=
 =?utf-8?B?ZWhMR2thWlNJUDR2WEVEdktlZzQzN05pUVdtQXlaK0M4VmRqYXBWdVFPT25a?=
 =?utf-8?B?YUJqZ3kzUUpjbHkxbXdBdHcvS1NuTFVselZyaTJUeHoyV3ZkeFRlelRKZFFi?=
 =?utf-8?B?ZUx3dmx6UDc4OTlDZ2NzcnJQVGJlZUVXaEE5NjdtazhpSzNMeFg5Vk5GWDlv?=
 =?utf-8?B?QTdkYng4b0pIRkZPNi85K0krV1R0Z25JZjh5dnhlb01JaGNwRllJU0hpUno1?=
 =?utf-8?B?SVlJM3g4S2lJa0xGLzdxSCtyaGhMQ1dUREZEcTNTNFg5UTdjak9wZ2ZDbDBv?=
 =?utf-8?B?Sm8xaVlRL1Y5VmZmMjJ4TWw0VitXeWxXTFU2ak9GamZ3Uy85cUdIanI1OUxk?=
 =?utf-8?B?UU5tRkExbnRxOHhrbTZ6SFk1SkI2QnZrS3JVWmRWRjZjbUtHWXk2eE90Ry9a?=
 =?utf-8?B?b0pGSnBadVJzOGdtRXFMRGt0RXRIK3NvMlM3TnpGL3lvVEdpWndVaG1EeDQy?=
 =?utf-8?B?Uk1WaEJlQWd1U2pSWU9DdE1qaUU3WDFtaXl1bmFQSjNIQjZucnRINUJHNGNi?=
 =?utf-8?B?YWtTYk9wVzJuWUcvMEdHamRwb3JrMzRnekFkWlFwR0MwLzd4M0xvbzhLVDJR?=
 =?utf-8?B?bmlIeTgxUGp6emQ0b1ZWL1NZcnk4Y2hGZHBkSVRYR1RsRkgzdk1BYlF2RnRm?=
 =?utf-8?B?YUVwaWZtWUlyUzBNTnFLc3dmcTRneEJHemN2Qzh4VVZIMWRjUUZQTjV2cDNu?=
 =?utf-8?B?TXNTbytoVG5XditmaTgzVFRxT1N3V0F1M1JmcDdYdFN1RTBwVmpVUWwyMDZl?=
 =?utf-8?B?Q1U5eHNSQVNSZFhWUVB4NUdia2NrRGl3TU9TSXplRUdzSlovQU1hb2toOGJF?=
 =?utf-8?B?eVFKVnlBUWFlT2U2TGNqaW5LamxJM3dYQ1VYTWMzbWxGTUFRQUU4NTNtUHNp?=
 =?utf-8?B?d1Uya3U4OGRqSFVQb3Qxd2EvNWhFaE56UFMyRkk5WkdKcy93NzgrNnRRRXpz?=
 =?utf-8?B?UWdEVUV1Tks4b1VFNWZRaHp1SWZOOTQ0L084cUs4NVp4dkF4STNFQnZmWFJG?=
 =?utf-8?B?RWx1dk5QQmFxT1RBOEh6WHBSNmZ4NWVad1dEd3FTSXk0My9IOGdTTGZVVVdv?=
 =?utf-8?B?MlRneFA2dzkwR0dueUNFeTg2RUlLWmRrL0tSSVpKQ1cvSXdlcitPeHdHZ3U1?=
 =?utf-8?B?SzkvWVRwY1pIL241K25UY3NWaTBnNGtyZ1F6dTlvREk4TVk2bTJwTThQSkhp?=
 =?utf-8?B?cENibzVVa2tNTTlFN3I0MUpLdkhDYUU4dnFSYmFQM3JrWmRVazFzMHpFUEVB?=
 =?utf-8?Q?GXQRCtkwv1nxR02LxA/GtohGMXsrFw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0tTTDRQbVVsaVJFV1JmTnlLYktoaG1GMmJBUUNzUmFKSktMNWhTbUdNeUVE?=
 =?utf-8?B?TGZSanlFeDBQUmFKUEt0dGVRR0hWWG9qQmd3WFVkd2RwZzBnNW45UUFsV1c4?=
 =?utf-8?B?NkRRVjhMQU9tMVYzSXV6cWJFdjhvaG84N3NTL0tPcU1LVTZBL2FiUUNFTGhG?=
 =?utf-8?B?L2N2NEVtSVdERzZFeUloUW5VNEpaTnhrQ1ZXTUR3N3EzVnNhcGE0Z2tTM3RG?=
 =?utf-8?B?azhBM2VFamVsWnNlTXlTeHVWSWl0Ry9pbU83RnQ5TEc1NmpDNXA4RGJRbGNo?=
 =?utf-8?B?ZkZwQkxUY3owNTVQVWpBSW9uK01iSEZRYUtoTnczeDNmODhiUG9WOXBGVCtH?=
 =?utf-8?B?bXJFSk9kMGNBWDFsSkhNWldVQXRuWmR3Q3VIQW84S1Z4alNsMWw5bmtla1A3?=
 =?utf-8?B?L1IrTG9BMEFCOWZqeGJPREZFazgrQ3ZjVDhBWE12d1NHNytod2J1UGFzQU1L?=
 =?utf-8?B?UDZpYWhNak83NXRoWldpdEx5MUNmV3h1TVFzQjBLRUx6eTN3NUM4ZWNlM29t?=
 =?utf-8?B?d0pGSzB6U21OMTJuYzBqOEJsSE40VDlkN2pXcUFHS0JlbFNzY0JEYzFpNGJu?=
 =?utf-8?B?dU9KYzE0amhSRlZSeHJoZFcyQ0IvOTYvbGpoakhwdDd5WXpvOE9HUndpdHJ5?=
 =?utf-8?B?Zk05a0MvcmNYSGhsbkRlNjl1dWNieXJjQnNSVUFwTjh3SG9ZaUV5bW54RS9F?=
 =?utf-8?B?TTZkdStxVEovNFpJTzFvTlh5cExNdEhaSDZFWmczUnJQclRWamtXcXUvZkNX?=
 =?utf-8?B?RndpMkU3UHJXbzE2aEZYV3BNT2FSdnBVNGlUMW5wTmkxS0g2RENrY25mV2sx?=
 =?utf-8?B?Rm1KbkxqNm1tcHdxdDlMU2h6Vk95QUdDc0tnRDFrcmpqbFZuZUQ3SXhCR2x0?=
 =?utf-8?B?bTdCTHBObGExdVlTWlN3RWQ1Z2JoUFdmdXk1d2ZvdzVzNWdKMGhxUFRuMTZO?=
 =?utf-8?B?L0wyMU14T0hSK1pvc1dVcXZUSzNvbVp1Yk1VNTErYkErRmNTZ2MreVk4ci9t?=
 =?utf-8?B?Z05seG5pM0ZJNG1jY1Bxekw4TGtaSjRiMC9ZNnNWem9FL1ZaTDFBNVNIY1FZ?=
 =?utf-8?B?WXhyMExHcWFQajNqdjVQejhMZ3B2RzlDVTF4Y29Fais5TnlKODdyb3d3ajcr?=
 =?utf-8?B?TXVWdEV2cFR5cVdBbjJZM2VmVzROQ1g0amo2NkJncU5YbWl3bjlaNFZldGJn?=
 =?utf-8?B?cFhYMnNnYzEyQWtEdERtNDluUFFrRlg3NFR0V29nZ2I0SlRPZlhUZmxNVElN?=
 =?utf-8?B?M3lzdkxKLzV6QlJCbmVMR20yMkNiMDJ6MEk4RDlIN1F4ekpNeVk5V1hQaTBh?=
 =?utf-8?B?KzJtLzN1bDRsNDBNdTRKTWUzTTE1SnI3V3RLUnh2R2YwRnVnaUR0dHBiSzE2?=
 =?utf-8?B?bFFFWkpKTzRtdHdxVURPalJBTkFYUUNoNEg3T09qeDJDSHhBaXJidnUxbnVB?=
 =?utf-8?B?MDVHc0xyL1FxdDlDMlhCVUJVNTlvV2xIYUJDbXVDandMVFRnam5uWDR5YnNU?=
 =?utf-8?B?V21qWjhkRTlsek4zS2EzeTQyL0FHRVA4eHR3L2xQbGNTYm4vSmxVY3JTa1RG?=
 =?utf-8?B?Mm10Q0Y3MTVxMzFPNUlKM3RYY1BvSUNhMUVhVGplUU5kTlorTHJESHJldjVU?=
 =?utf-8?B?bEdqUlc1emlKUHFFMGkyVHA3T0hsdGppWUhmTVlKN1Q1bGxJUFFRVGx4UzFK?=
 =?utf-8?B?Z25ydFpWN2dMeGtDWjRkYUs3dHg3VGpmVW1Fc0ZBaHFNem5jUlJ2U002b0s5?=
 =?utf-8?B?MnBDaWthQ3UvSUIrNGdpckt3RHRCNzVTS3Q2QjhMVUZOTEJuMmh1ZHoxcVYy?=
 =?utf-8?B?ZENQOHdleXY0a1RCZXRRNW8yVXY0TTdSR0FhVVZqcTdXR05BTGJYdmlKNlJ3?=
 =?utf-8?B?KzBEQXJLNmdPT2NiRzFJMEdKOHVSWEh6bnVDZFNmVnRZM0tTZzBpRmQzaUM3?=
 =?utf-8?B?Q0k0ekVxWlNGdlliN203TFJPWGRBMitGMlhwd3BrcDdDVXFCWFlZWkFSY29I?=
 =?utf-8?B?bm5ORGh2U0ZmQ09jcmw5Q29oeWovVWZxQUVycThHdE1oNVZ3YjdJLzh6Tml0?=
 =?utf-8?B?bzAxdWFYWVpUTkNaUUlyRHBKQXgvS3A4VUl4NmJTMmQwamFneUUzUnJZNith?=
 =?utf-8?B?Rks1RUhrOEZmK0lOUCtteGhyaEU2eHdWcEtGSWhUV0FKYUpRQXpndmlJT1JU?=
 =?utf-8?B?ZkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc5cc98-5897-467f-107f-08ddb8a21cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 13:20:56.4055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: av6bt61o/fD1ZqW4R+I8dww2I55goMJr/MRn1qiq2maNW3vSv+q8E+g9tgvhQpXlZZzQWUS/PFkFbCdhgz4vDNI8+hyxVKXR5Hv5aoNtlMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13776

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDEgSnVseSAyMDI1
IDE0OjA1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogRW5h
YmxlIFNLSVBfU0VUX1dBS0UgYW5kIE1BU0tfT05fU1VTUEVORA0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIFR1ZSwgMSBKdWwgMjAyNSBhdCAxMjo1OSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgZm91bmQg
b24gUlovRzNFIGRvZXNuJ3QgcHJvdmlkZSBhbnkgZmFjaWxpdHkNCj4gPiB0byBjb25maWd1cmUg
dGhlIHdha2V1cCBzb3VyY2VzLiBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgdGhlIGRyaXZlcg0KPiA+
IGxhY2tzIHRoZQ0KPiA+IGlycV9zZXRfd2FrZSgpIGNhbGxiYWNrIGZvciB0aGUgaW50ZXJydXB0
IGNoaXAuDQo+ID4NCj4gPiBCdXQgdGhpcyBwcmV2ZW50IHRvIHByb3Blcmx5IGVudGVyIHBvd2Vy
IG1hbmFnZW1lbnQgc3RhdGVzIGxpa2UNCj4gPiAic3VzcGVuZCB0byBpZGxlIi4NCj4gPg0KPiA+
IEVuYWJsZSB0aGUgZmxhZ3MgSVJRQ0hJUF9TS0lQX1NFVF9XQUtFIGFuZCBJUlFDSElQX01BU0tf
T05fU1VTUEVORCBzbw0KPiA+IHRoZSBpbnRlcnJ1cHQgc3VzcGVuZCBsb2dpYyBjYW4gaGFuZGxl
IHRoZSBjaGlwIGNvcnJlY3RseS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnp2MmguYw0KPiA+IEBAIC00MjcsNyAr
NDI3LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfY2hpcCByenYyaF9pY3VfY2hpcCA9IHsN
Cj4gPiAgICAgICAgIC5pcnFfcmV0cmlnZ2VyICAgICAgICAgID0gaXJxX2NoaXBfcmV0cmlnZ2Vy
X2hpZXJhcmNoeSwNCj4gPiAgICAgICAgIC5pcnFfc2V0X3R5cGUgICAgICAgICAgID0gcnp2Mmhf
aWN1X3NldF90eXBlLA0KPiA+ICAgICAgICAgLmlycV9zZXRfYWZmaW5pdHkgICAgICAgPSBpcnFf
Y2hpcF9zZXRfYWZmaW5pdHlfcGFyZW50LA0KPiA+IC0gICAgICAgLmZsYWdzICAgICAgICAgICAg
ICAgICAgPSBJUlFDSElQX1NFVF9UWVBFX01BU0tFRCwNCj4gPiArICAgICAgIC5mbGFncyAgICAg
ICAgICAgICAgICAgID0gSVJRQ0hJUF9NQVNLX09OX1NVU1BFTkQgfA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJUlFDSElQX1NFVF9UWVBFX01BU0tFRCB8DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUNISVBfU0tJUF9TRVRfV0FLRSwNCj4g
DQo+IFRoaXMgZHJpdmVyIHVzZXMgUnVudGltZSBQTSAoYnV0IGRvZXMgbm90IHVzZSBhIHBsYXRm
b3JtIGRyaXZlclsxXSkuDQo+IFNvIGRvbid0IHlvdSBuZWVkIHRvIGltcGxlbWVudCAuaXJxX3Nl
dF93YWtlKCkgaW5zdGVhZCBvZiBzZXR0aW5nIElSUUNISVBfU0tJUF9TRVRfV0FLRSgpLCBzbyB0
aGUgSUNVDQo+IGlzIGtlcHQgcnVubmluZyB3aGVuIGl0IGlzIHBhcnQgb2YgdGhlIHdha2UtdXAg
cGF0aCAoY2ZyLlsyXSk/DQo+IERvZXMgd2FrZS11cCBmcm9tIGFuIElDVSBpbnRlcnJ1cHQgd29y
az8NCg0KRm9yIFNUUiBzdGF0ZSwgdGhlcmUgaXMgbm8gd2FrZXVwIHNvdXJjZS4gV2FrZSB1cCBp
cyBvbmx5IHRocm91Z2ggdGhlIFBvd2VyIGJ1dHRvbi4NCg0KRm9yIFN1c3BlbmQgdG8gaWRsZSBz
dGF0ZSwgSUNVIGludGVycnVwdCB3b3Jrcy4gSSBoYXZlIHRlc3RlZCB3aXRoIFVTRVJfU1cgYnV0
dG9ucw0KYnkgYWRkaW5nIHdha2V1cC1zb3VyY2UgaW4gYm9hcmQgZHRzLg0KDQpXaXRob3V0IHRo
ZXNlIGZsYWdzLCBjdXJyZW50bHkgc3lzdGVtIGlzIG5vdCBlbnRlcmluZyB0byBzbGVlcCBzdGF0
ZXMuDQoNClsgICAzOC41MzkyMjhdIGdwaW8ta2V5cyBrZXlzOiBmYWlsZWQgdG8gY29uZmlndXJl
IElSUSA0OCBhcyB3YWtldXAgc291cmNlOiAtMzgNClsgICAzOC41Mzk0MDJdIGdwaW8ta2V5cyBr
ZXlzOiBQTTogZHBtX3J1bl9jYWxsYmFjaygpOiBwbGF0Zm9ybV9wbV9zdXNwZW5kIHJldHVybnMg
LTM4DQpbICAgMzguNTQwMjk5XSBncGlvLWtleXMga2V5czogUE06IGZhaWxlZCB0byBzdXNwZW5k
OiBlcnJvciAtMzgNCg0KQ2hlZXJzLA0KQmlqdQ0K

