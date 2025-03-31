Return-Path: <linux-renesas-soc+bounces-15178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9AA7672F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D5BD167DE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129A6212FA7;
	Mon, 31 Mar 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kJbGfTdk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96910211A3C;
	Mon, 31 Mar 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429344; cv=fail; b=OdvdduaVc2XqUjUpgSfyqlOewIGtxJgGaS1PDM2joPmyA6f7Tyz/lwyl1y+DKaOr5gNVIH18WwkZZAY6TWMJQUJuJ7DQ6P+BhlNK+2Wg5kZhkXVmzpO/P0pyp6GhMpx/FxQZKCFqkfPbPNWTAmp/GZxqwN62QFYfdBuIcvm5lFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429344; c=relaxed/simple;
	bh=kV5MYJKeCtLDZzfyn3H2cCAy9Y1FpcFf3qa8H/F+xqo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dpALi2e5etpedZSAn4N7A4v9vsiRLtfvui1RggoxTQ+7XfVT6zvkC+VFihydvDg5zjE2CB4/ZqnWD2+/VC9bQJJzkVxXWa4eYosjgAvem+XDNaluApPcRl2sTDVPDuA3aEVvpVdWireUAc0RTN17sDa3e8Lrg5cdTniMZN7A0QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kJbGfTdk; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHvBJqScfpZxtecrxrx0M6b48nGdKxegyGdJ8/N5J6OB/vtwr4bRqpd+XuPgvqqHS4eE1waxZckBJf1zQkx6xJFTGNHvLP1HoaY9rO1r7asV42OaEKjB2fnxuV8aHDdF3dRz+/YZXvdNqPw4jFDnwVAvLvjc6Yq3UrIEpCHeHwAs+xiO6G24CmFeX7yTA5S0E3a0NiF0HTGkGHGPYFCS0JLTBv8d2VVXRGhXG/p4XnMxOobMiCPA8Vv3Q/j7wR2DIm6JAN/M6ynzxg0mpAv8J5Aq1L3tenj6aENbMzHv15TBS50owkw8Kl2jbXTINsHG9I/KD0MvZQiCM9fl94YeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV5MYJKeCtLDZzfyn3H2cCAy9Y1FpcFf3qa8H/F+xqo=;
 b=yYsgKpP2VQRCbDbYmHieFKZpnW9hwPaToZPQst2ZZWLXoH1OQbX4m4b7GJCuptlcdbSOh3uSr+ybo9d2YtZL6aRScEYN8inZ/c4sPD1vpPie24PdkwgycSYMb+LEeFjrgpJcWc0uHrd/xUwjS/ULyx/7krB+QVbQtYPZR8p5hbFAbYXMQaRZpGjgxDQ/1QbV2QidVjgFqPz2nnEmx0pq3GMoODqhCu5p32O15bayORqE4dzlQf1X9ZphfLli7gjHlBqYBo60n1OlveuYqUj6HDegqhDkKHLClC2al2XQr/iQx/OF8KFrmw/sGLaU6JFh06mi4/RaqNf/mdjvgXTe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV5MYJKeCtLDZzfyn3H2cCAy9Y1FpcFf3qa8H/F+xqo=;
 b=kJbGfTdk3cmwVijDpgkqs5YthzOM9tObaVBY8ExNk2G2NX838P3aWvR6tHsanh3UfxwpF0CMyvC8zR8Wq6g5dtT0kPHTD46LO9GzOsDdUHEsCEdGbZ60YZEInRurbtEvkcCQwNqfNXspQ4QQ0x08PR1q6MvtxaPBC+HiwcxzuCo=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYCPR01MB7726.jpnprd01.prod.outlook.com (2603:1096:400:17b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Mon, 31 Mar
 2025 13:55:38 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 13:55:38 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, Rob Herring <robh@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v6 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
Thread-Topic: [PATCH v6 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
Thread-Index: AQHbojhMCMlCdvECE0apZmAm4Nzr17ONNm+AgAAMfVA=
Date: Mon, 31 Mar 2025 13:55:38 +0000
Message-ID:
 <TYCPR01MB114921C523043FDABA2A3EDCE8AAD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
 <20250331122657.3390355-4-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdXeAueSWf50OhTnCxu3tFq6Rq8YLJ=r67WDnOfv0Yv-oA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXeAueSWf50OhTnCxu3tFq6Rq8YLJ=r67WDnOfv0Yv-oA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYCPR01MB7726:EE_
x-ms-office365-filtering-correlation-id: 5c74974c-92aa-427f-d52b-08dd705bb7eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFpMdXVXMHFqa21xZjhHeHdTeDZ3TlhobU9TaWUweWhOTFE5NzdpYzlnbmlx?=
 =?utf-8?B?N1llQ0Rtelpxcy9xRzFwSXlxc1NwSlFocVEwZitCMzZTWDZkQWUxZFpzdTE3?=
 =?utf-8?B?V2dvdVFCOW50OEpsR0wvOUJ1R0w0YmVVeUJnNUFvZmVQZi92RlZIajFBUnk0?=
 =?utf-8?B?RDk1ZnpPdnlGOERrM05DNng0RG43MXVaeW1YQ3VxQVkrR3c2TlJ4SHgzU2ps?=
 =?utf-8?B?aXBCNUgrVEVsYzZ4NGxWd2JIam1WWnd0QWthQldJQk54SXFNdExhTDBCU2hE?=
 =?utf-8?B?V1VaZmtkRytHQVVLUmtjWkdlMmFndFo1cmZGbXBnMTJUYmlZZ1JBbndJTWNu?=
 =?utf-8?B?ejNidHNXd0FEamRqREh4QlFvaFgycHEvL09lRmtjWHhrZStyNTJzWndZRFp5?=
 =?utf-8?B?bnBINk96RlJFYUtBZ0QzQXM4dEpCNVpYQ3l1SEl1Ky95TkVtZWd1NjNmdDhs?=
 =?utf-8?B?ak5SSVBLS0JmU3ZSQ3NZRGlrUkZlL3FCY3ByU2FIV09YQVplWVE1cFZRcVc1?=
 =?utf-8?B?QllySDVIZXNwWjhtVUxGd3MzNzUzYXgxSmZjSm5pejNIS2MxbFFSajRESzdG?=
 =?utf-8?B?Y1QwRFloQld3aW5OWGVtQ2ZiT1dSS2t1SWJoa3hoRDFrWUdKYmowRjFMb0dS?=
 =?utf-8?B?Vk5qODZWdEE4UEN6d2xCcWtVTnF6dklHcDFkYTd1eXF2WlhxZ2xCYjdpTGZP?=
 =?utf-8?B?aHJpdmNxVUpiSXdDQUVkNGxOMmFwbE5sTzA2YTdERG5ReGRyUmp1Q01FdjRY?=
 =?utf-8?B?UG5xcjM4Z2g0UEFJbGwxTTJzb3ZLa09LTFlLdWt2MThKQ3hxN1JLVURLWTFX?=
 =?utf-8?B?cFVyK0NjN3NBNU1ONFRDdzNPWTBrUjdIZXFNMkJaTENZbkMwekdLNkF3UG11?=
 =?utf-8?B?TW1OenA1bXdlSkRrL3M1c2hZaVREaHo0aEpUYTZSRE93cmJxdTZLa0xBeUVU?=
 =?utf-8?B?bzZPRkh3YnRwdkZOV00xR2FBVm9sSk0xUWVIMW1sQXV4MU43cWtsTXZDR2lY?=
 =?utf-8?B?cFJ1WkU1M0V6M1QwNWl1bndlU1JyaExQR1hSeVk3MHJGRThPOTdSK0RuSUZp?=
 =?utf-8?B?cHZIQU1SMlAvemFZOWptQmRHTUc1YnFIMVhaZVpLR2hSWmVEWGlBaVFsK1BV?=
 =?utf-8?B?R3dWSzFSUlpuK0JBaGF6d2ZpNE12TUR3bEFIOXovbVZ5aDZ5SEJwL1hJM3NS?=
 =?utf-8?B?MVcwUUxBUXRYelpOTnRlWXY0OGJHdW5FaTVCdFhDbnhRNGxSaUFXc1BucllZ?=
 =?utf-8?B?Mmw4Sm0vVzBzdWxTQWwrWk1uYnNweWtPd2tVSGxqR0VicWV3UmcwOTdVbWxS?=
 =?utf-8?B?ZU9OSlVJdFc0SnJDVkJhditmQ09hTzNNcmgzVU1LaXc3RTlBaW14eHVDNFNJ?=
 =?utf-8?B?d2Q2TStMTDg4cnlTdk1jZDl0WiswdWNkVUpjUmJrbWJmZDRUVjJuV2lQZmVs?=
 =?utf-8?B?ZEE4K0hmNmowYStkR1lpa21ac0E3Wm5oSnNKNzFtMG1GVGpUUmsreE4yY2JX?=
 =?utf-8?B?ZUNMQ01Xc2pMMys3TXZ0cnJNdFcyV3JWY1FuSkNwdnJ2TGxEclJ5SWdKYlRZ?=
 =?utf-8?B?VTdXODVFTzdlOWRFYjRwLzlGc3J2VGdFejRoeVprWjhtWFBPcFZFUHJlM3JI?=
 =?utf-8?B?THhBNkhhNEZtVjVnS3lWU3RFYmZrK1ZpWmVOTlNKQWt1UDRyUHZTRFc4U3h1?=
 =?utf-8?B?bGVsbEZ6TmVtM0NUSi8wM3B3MDFCWFdQM3ZFdmNlQ2gyRVd4Q3NTZWxXYzRW?=
 =?utf-8?B?T01xc1ZFZ1loLzZ0MVg2U0RxU3Y4dEhqWHpJcUdYbGYyNGxCakQ4T3dZT3Yx?=
 =?utf-8?B?L3kvMjdmTDFmMHpvWE5jWkdGOENSWHdabGFubyswT1hCSXFFTFN3eEF2aTZz?=
 =?utf-8?B?eTVoOGthWVdLM1JuQWoxSDZCZ081S0pWSDIzRSs3TmhsN2VDUVhwM21rMWpF?=
 =?utf-8?Q?TA6RKcrzYdqsbuuM69/hQ+r6Gnd2+RgW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkUwWmdWK0NwRkFvelN0VGFhbGwvOEIzc2pLdGJ4WUZWeWhIdW94QzN4Q1dG?=
 =?utf-8?B?d2hmaUxCSlJsdUxJRlprajVQM2NROG5zMmFFTGJpazloUHJsREJIZTdGdWp3?=
 =?utf-8?B?TVRWVkw5d2ZWUEVhK0xqRjhqWFZldHBoTUFrTWpMYjBDYzE5MEpFQ0JDYUlZ?=
 =?utf-8?B?R3JCeFpmcUE3bE9YTC96bjRwNU9Zd28zY0RqOFpKUkZoVVY2Z0FkRVBmUC9Y?=
 =?utf-8?B?NmpIamJvdk5TZFpwdHFsbUF5UkJvTkRsVVdxOEF6ZmRjVEhwanA2Zy80d0ZW?=
 =?utf-8?B?TGsrNzF5dGtLb2htQWwwbmtVV2F3Skg0RVRteUd1RU93UStOYTA5cVhySmN2?=
 =?utf-8?B?ajBBeGNEdS85bTNJajd5TDdkVTJUY1BrTlJiUWpFUFIyRXNxbHh1UUlXV01L?=
 =?utf-8?B?YnhYU0RNWGFTNG85SW1SSFVXWEdoZDNmT0cvbWxMVXhtZTduZkRMT1ZudUtO?=
 =?utf-8?B?R3l0NUFFTUZxODBVZVRRSUViLzFCYi9uQmkzNDRBdFJKQWhtMWNiYWFOc01Q?=
 =?utf-8?B?NGZ1QnhHa1VWQXhUSkxKTHVuZjRSUGxqSmlWODJqZVFKVCtyM1dCcktzSERi?=
 =?utf-8?B?VkpQUWV6U1NLZlVHTTFUM1F1TDVBSEswTVV5clB5amJyb1d3VTg4TlplTUlm?=
 =?utf-8?B?SElDUndQa3pWQ1VmR2d5RisvaGR2MG5kdCtqVENGYkJrMXR2MTRxKzdyMCti?=
 =?utf-8?B?RHlTR3QxSGptQ3pLbUkvaWgySlBCRXRCSWZyR3Y0U1R1dUFrWHlvL1ViM0lj?=
 =?utf-8?B?d211enIwMjJTd3NFalNrNlZPRUhwSlZLamtsN3BzQkVMSW1aTEE5cFZ4Umth?=
 =?utf-8?B?RWpOeERsUldPU0FTa3FKR0pjMXc2YkltMmhYd1ZHZDA1aUYxYXZ3NVZ3SFQr?=
 =?utf-8?B?OWUvRm8zZHdxN0tnYmxZcWJHUElzTDAxTlVYMllINjNZRVN6aUt5NjZ6ZDh0?=
 =?utf-8?B?YW1UZEdRTmRGbGZUKzlOWWRkdjFLVFZ5QW1FWFFqd3FvR3hERGpRRVNtYlNu?=
 =?utf-8?B?cHNXSlgrUWFhVmpPaGl2M0l0NEh4bG5RM1VFbElTL055NlQ4RUNsUWtJOHBy?=
 =?utf-8?B?bG1zVUUwQndtUVV0T280QUQra1JwbHRPUVFmU1pPRjhGTllnQVpGU3hzSzUv?=
 =?utf-8?B?dlNQTTJRc0Z1bWVKU2lkVWZIYnRSTWRqa0R2Sm5VdDh4eXN0c0x2a0MvM09D?=
 =?utf-8?B?d0sxYndId3JrdHY5TzJwZDk4QWJNUnhLcS9udWYwS281Y3VMSzBIRTZGRUVM?=
 =?utf-8?B?L2dhaEhBWVRobDRod2hVdVk4NjdaUmdTSjlSdkFSdWF3STVQbGwrSEIwYkhi?=
 =?utf-8?B?VWJaVVhWTHFOSFpXTXF0Uyt2ZUdYUzZ5THNqeEVBQU5MSWRJaG5ZR1U1NllF?=
 =?utf-8?B?U1ZQcm92Q3oyeVZuMEJDaDAwbFdvdi9BOUlJZjRZQ3QrTFhPb3VkVkpES3Jo?=
 =?utf-8?B?a0ZtSWpUeGFjTUhqRTB6ME1jamptMUJaYTVoSTJiOUFDTEZ0d1p6WFZRd1F6?=
 =?utf-8?B?M3cvUHYvVkJ5THNHQW9IT0hCNWYwQUV2bGNmOTFFUjliMytxVXJUWlpuME5l?=
 =?utf-8?B?Zlp3ck1CaXFEQlV2UjlmcGpIYS9IYmFjMzBUMXRJRGRzaEFQWGhSZE1pNmZD?=
 =?utf-8?B?aDhVenVHbnhnT216Q1dSc3Fka2d0WWVmSFRZRmllZkhwVVNUbnJTdEwzSE5I?=
 =?utf-8?B?aXFZU08yM2hzWTU5em14ZEJ2S3MwMUpqSlg2VkV3US82WU40Q28zYWx3SWZU?=
 =?utf-8?B?bGtnbVVkSVBoY1owM0hxVDFjd0l5b0ZQNzV6ZUtoUVhROWZ4TldwOTcrbkVt?=
 =?utf-8?B?MXJWc1YzdEdSa3lBUTh2RXpmdTFDZ1RGUS9CMXRWaDRiZDZhQUhCQWRlbXUw?=
 =?utf-8?B?b01JOXFMUG5iZ2tHZkYyRUpLNkt0YzNWSTMyRVdydktaT1FYcnE0Um5WRVh3?=
 =?utf-8?B?QnBwODJQVkE5MUhkNmZCNEVMMFM5YXM3WGdXcGUvcWNubk5IQnQ2TjJVTlRv?=
 =?utf-8?B?K1hIemNlNnBTbTBBZzlBaDhONWN6TVFhNnFpZTZLU2oyU3Vublc5cU1TUlZO?=
 =?utf-8?B?OUJWM2F0WCt5QlNkSlF2UDFvUmU0TG4zR3ArRkNzbjRjSVFuQmlXWTFidDdX?=
 =?utf-8?B?dkJmMmh6WS95V0lpZGhGdW53eGZqMXEydmhrNXNETGg0TE44ZW9iMzZuVDYr?=
 =?utf-8?B?UlE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c74974c-92aa-427f-d52b-08dd705bb7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 13:55:38.6043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eECKpA3plPDPHBzqaxUmUhtzmozJJ6k3nWQMpax2gP75Z97QzApmbdQN5fEINOhSHvmMMJ5+sdLDjuhz0kbqiCii6nM5mzWReFYH0xLLEEW15wjCxzVfYyDtCO3lkuwC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7726

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogbHVuZGkgMzEgbWFy
cyAyMDI1IDE1OjA0DQo+IFRvOiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAu
cmVuZXNhcy5jb20+DQo+IENjOiB0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcjsgbGludXgtcmVu
ZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBQYXVsDQo+IEJhcmtlciA8cGF1bC5iYXJrZXIuY3RA
YnAucmVuZXNhcy5jb20+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsNCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IGxpbnV4LQ0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAzLzEzXSBkdC1i
aW5kaW5nczogc2VyaWFsOiBBZGQgY29tcGF0aWJsZSBmb3INCj4gUmVuZXNhcyBSWi9UMkggU29D
IGluIHNjaQ0KPiANCj4gSGkgVGhpZXJyeSwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEN
Cj4gDQo+IE9uIE1vbiwgMzEgTWFyIDIwMjUgYXQgMTQ6MjcsIFRoaWVycnkgQnVsdGVsDQo+IDx0
aGllcnJ5LmJ1bHRlbC55aEBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIFNDSSBvZiBS
Wi9UMkggU29DIChhLmsuYSByOWEwOWcwNzcpLCBhcyBhIGxvdA0KPiANCj4gUlNDSSBpbiB0aGUg
UlovVDJIIFNvQyAuLi4gaGFzDQo+IA0KPiA+IG9mIHNpbWlsYXJpdGllcyB3aXRoIG90aGVyIFJl
bmVzYXMgU29DIGxpa2UgRzJMLCBHM1MsIFYyTDsNCj4gDQo+IC4uLiB3aXRoIFNDSSBpbiBvdGhl
ciAuLg0KPiANCj4gPiBIb3dldmVyLCBpdCBoYXMgYSBkaWZmZXJlbnQgc2V0IG9mIHJlZ2lzdGVy
cywgYW5kIGluIGFkZGl0aW9uIHRvDQo+ID4gc2VyaWFsLCB0aGlzIElQIGFsc28gc3VwcG9ydHMg
U0NJZSAoZW5jb2RlciksIFNtYXJ0Q2FyZCwgaTJjIGFuZCBzcGkuDQo+ID4gVGhpcyBpcyB3aHkg
dGhlICdyZW5lc2FzLHNjaScgZmFsbGJhY2sgZm9yIGdlbmVyaWMgU0NJIGRvZXMgbm90IGFwcGx5
DQo+IGZvciBpdC4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgQnVsdGVsIDx0aGllcnJ5
LmJ1bHRlbC55aEBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1sDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1sDQo+
IA0KPiBHaXZlbiB3ZSdyZSBub3cgdXNpbmcgdGhlICJSU0NJIiBuYW1pbmcsIEkgdGhpbmsgaXQg
ZGVzZXJ2ZXMgaXRzIG93biBEVA0KPiBiaW5kaW5nIGRvY3VtZW50Lg0KDQpBbGwgcmlnaHQsIGJ1
dCBJIGhhdmUgdGhlbiBzZXZlcmFsIHF1ZXN0aW9ucw0KMSkgSSBhbSBub3Qgc3VyZSBpdCBjYW4g
aGF2ZSBnZW5lcmljIGZhbGxiYWNrLA0KZS5nLiBzb21ldGhpbmcgbGlrZSA6DQoNCnByb3BlcnRp
ZXM6DQogIGNvbXBhdGlibGU6DQogICAgLSBjb25zdDogcmVuZXNhcyxyOWEwOWcwNzctcnNjaSAg
ICAgICMgUlovVDJIDQoNCi4uLiBpcyBqdXN0IGVub3VnaCwgY2FuIHlvdSBjb25maXJtID8NCg0K
MikgU2hvdWxkIEkgYWxzbyBjaGFuZ2UgdGhlIG5vZGUgbmFtZSBpbiAuZHRzaSBmaWxlIGZyb20g
J3NjaTAnIHRvICdyc2NpMCcgPw0KDQpUaGFua3MgIQ0KDQo+IA0KPiA+IEBAIC05LDkgKzksNiBA
QCB0aXRsZTogUmVuZXNhcyBTZXJpYWwgQ29tbXVuaWNhdGlvbiBJbnRlcmZhY2UNCj4gPiAgbWFp
bnRhaW5lcnM6DQo+ID4gICAgLSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPiA+DQo+ID4gLWFsbE9mOg0KPiA+IC0gIC0gJHJlZjogc2VyaWFsLnlhbWwjDQo+
ID4gLQ0KPiA+ICBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICBvbmVP
ZjoNCj4gPiBAQCAtMjIsNiArMTksOCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAg
IC0gcmVuZXNhcyxyOWEwN2cwNTQtc2NpICAgICAjIFJaL1YyTA0KPiA+ICAgICAgICAgICAgLSBj
b25zdDogcmVuZXNhcyxzY2kgICAgICAgICAgICAjIGdlbmVyaWMgU0NJIGNvbXBhdGlibGUgVUFS
VA0KPiA+DQo+ID4gKyAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDlnMDc3LXNjaSAgICAgICMg
UlovVDJIDQo+IA0KPiByZW5lc2FzLHI5YTA5ZzA3Ny1yc2NpDQo+IA0KPiA+ICsNCj4gPiAgICAg
ICAgLSBpdGVtczoNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsc2NpICAgICAgICAg
ICAgIyBnZW5lcmljIFNDSSBjb21wYXRpYmxlIFVBUlQNCj4gPg0KPiANCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQg
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

