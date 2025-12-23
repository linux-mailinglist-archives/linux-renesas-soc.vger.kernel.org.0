Return-Path: <linux-renesas-soc+bounces-26028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07FCD87E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 09:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADDD230022CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 08:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D47D322A29;
	Tue, 23 Dec 2025 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dKgmi+uA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C843195F0;
	Tue, 23 Dec 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480137; cv=fail; b=dZIe015G8QEcASMh2QqfMV9ghgdM7E0skREvce7a/BJGM3Nu9jS4esVFjVpAFah6dWSMm3oFTWANgV5+EUTOHy5E0UMHVztHtdzIB5JX9S/WBqkxToo8nJy1Z4guiPjGEpxAKvTIdO8PRlCcEnc5s4t1eQa1vIaBo7hL+dDAZKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480137; c=relaxed/simple;
	bh=3FYhWiBjlaCApDVvJtpdYQ2D+h4/jA8kAewBRHKq8gg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bE2iqAqysgrOy+My1AfAvgPVHh9X9ZKGz+m0vxxOUQwRsvgOLqCm8YnWGA0H7kCC6uapRD3KJKY2Dc/vmm1uxRF8NekmCgpW4AtsOQBnl5XenBtNMw9+7I2QrqQJCR0XCscfelPZN6HtjI/CkL6Pdg4KjGYSVg4HWvW7f23uz0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dKgmi+uA; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f31Sd84mO3PjQrqZvHZvXjTlBB7SqleKCTHt4UdgwzBJySF69HDEv0nKF5BdgIECQ9nv5z9T3dQXYMJ9wiLebLFimEc+B5zonkLJTOyBEdYCMNuU7dcrQxWhmfEp92Gz1WK60xEm1PiefN3rF9WMf9eptdKPeqvMVjhvAkDA02yvv+PRpJXL7TTE7BNzN6x7fcfs2rbj5RpeAQyv3KPqtjDa/F7NLeBaLXj13aMp+oTovOZZOQ4BABgjE5QvD7ZVZp8cZVRRWtoATgJObxBwD8O6kxyIV65Bnv0GkKOeIlPYYhNdY/FtdmGvKutebopaywnnQE8tEzA90e1sh+s9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FYhWiBjlaCApDVvJtpdYQ2D+h4/jA8kAewBRHKq8gg=;
 b=n73k5Bhy5HyqmGBsS0zLV9jzZ/w+ol1U5QyzF9YVpyHNjZ72Rr1ogyuGRBEk8jJZ8RskCz4MjMHIsS/VZP6nbOaPy0DeMrx6oRKkn3qpjZS+VJsWtbwWU5TSSEcF1yS2qO2RjkUzaniBGgZdMfAPYN6oETMv0uPe9FgKx1ahKZfok4NCLPnx01KWemYXAYyCb+VgD9cO3dcz0bUjOU7TDAHVmbi7w1RdSXsuUUJbe123uz0PGHuaDK4T/iKJw8KLTdxs+FyBQKOPdXFEkQwM+kTiPQ/+I2nf/emPcQGZG0z0ZM6xiboXdIeKPpUaSfRztBSitDWHJpHFnQCiSnU/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FYhWiBjlaCApDVvJtpdYQ2D+h4/jA8kAewBRHKq8gg=;
 b=dKgmi+uAMW0ZlWmq6QVF//1B5h8ZNYr2+Z8jhu9b6L0t6fNKKot2/pGZOIFQ0vrqiAO9e4HCPQefcTbvxQUCWvLAq++eW76PBNvZ0ZxUlO4EkuoyH6kpMMqtRlPnXzM64NPCFYwCTbYjKFtn/OyALt/BWKWx+rbd9Sv9H/p1wQ4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13506.jpnprd01.prod.outlook.com (2603:1096:405:1d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Tue, 23 Dec
 2025 08:55:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 08:55:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/4] arm64: dts: renesas: r9a09g047: Add RSCI nodes
Thread-Topic: [PATCH v2 1/4] arm64: dts: renesas: r9a09g047: Add RSCI nodes
Thread-Index: AQHcYWFFDuay7Opb5EyMmqGcJjmCFrUvD1MAgAAAoCA=
Date: Tue, 23 Dec 2025 08:55:30 +0000
Message-ID:
 <TY3PR01MB113464F1D4CD8D0EF5AF7A14186B5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
 <20251129185203.380002-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdW5vhJTCjg6AtxDk3Okgzj_b5=8RBSNAR4at389oh-O_A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW5vhJTCjg6AtxDk3Okgzj_b5=8RBSNAR4at389oh-O_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13506:EE_
x-ms-office365-filtering-correlation-id: 60c19961-ad97-42ed-cd6d-08de420106d1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZnUrZmVZVlZtaVNHc3pXeFZWc0dld0FpWDlBWXBVcCtacFh5RDdZYW0zMEJR?=
 =?utf-8?B?UXFHTWY1QkpJMHQ5ejlRd1FydmhtcDRkZ3hnb2I2RUVTVUpJUVJ5NHU3S2g1?=
 =?utf-8?B?Tml6elB3b3JXNklsb25BNnV6d0pUcUhYQzBEbkU4bTJIT2ozbHpoejc1ZlFB?=
 =?utf-8?B?NkNWeWk5NlNTWGpCa3VKZTRHSHNPU05FeC9odTM1K3JSaWFqRm9LUzN0VHdX?=
 =?utf-8?B?Rzk1a3ZDVG91cUtNeGR1dmZLRXF6dHpjUnhkaW1oOWZVWDFrMFBkYVNGQ2ZM?=
 =?utf-8?B?Wmdqc25lWlBWdlVRUG9tREpRRWMzS2plVnd2NmxQdmY1RkM4blpRWjFleTFJ?=
 =?utf-8?B?b2VTb2d4STdxck4zSFpWWjVpOFhWbHEvWEVHaFI5UEZXYlFPeUd3SVZnQ0kr?=
 =?utf-8?B?ZFVtK2JidUNic2xBcXZraTBYcldmOE9XeU5qb0M5cXViL0RUTHh0eTJKcHFa?=
 =?utf-8?B?RDZkK0VhNVMwQXpFUjhuVjluUVpjQ3g2clBWQ0c1RzFMMTUzTHlJZStUMGtC?=
 =?utf-8?B?RDFDOFRQRlRUQXhJMGhsTFVzc0JZYlhDZFdxYWp5NnpYKzQ5ZUVHYU82NEs5?=
 =?utf-8?B?VHRQb2lUZXJuR0ZjRzJxUENLRUxMZ1ordHhnaWxzRXEwT1pEOTJuUm1nMDBw?=
 =?utf-8?B?dDk2bXBjejllUDVhMkFrejd4T3U4KzNpTTNnekNCaFdGOWZsZkRJTXlHbnBz?=
 =?utf-8?B?dDBSYXAzdEFzSDUwTi9OTjRnN3k1dlc2OVRiU3lNRGdWVVBCTjhSMldXdWg4?=
 =?utf-8?B?T0tMQVNLcG9HS01UVlBqWkx2dktZSWNROUl4RDlPV2NNem8xQUtRSWh1SktI?=
 =?utf-8?B?NGpUQ09WZzcxcEJSRVAxSTB0bzErczhValRCckZBeFViWTBqSGtmZGdhdE1T?=
 =?utf-8?B?VkdDWVordytXWjBRbkd6em9idjhWMVovWWlOQmRrZE92TGVONCthUHVZcllH?=
 =?utf-8?B?ZGxTUzhTTUFoeEhsWitSWEpzMUpDVlhSME4vYWRrRncrK0l3cG1JMW9QZ0gr?=
 =?utf-8?B?U0VDL1pvNGlHekk5M3V2NldNRlpoNjZWTDBodWlpQlptbTdXSGtldUZueDNQ?=
 =?utf-8?B?aVJ3a3ZyMVRPUlY5aUZRZ0hYSFd0K0kvVjFLRVhiZVFjbjNwOGRCUTBGVjY5?=
 =?utf-8?B?UTUvZXU0VTV4cmg2NCtFRkN6RTZKakZVRmVpbStaQzliY0tEZTExdklsY3pI?=
 =?utf-8?B?KzhXWkZuVkZGVlp0QlhaSTlDalVSc0lkSlphd3luZVpPUW82ZGRMT09lN2lm?=
 =?utf-8?B?OE5CMXV0aVdWSDF2Wm81Rk8zRlFnMGJqWmh1aVhLVU8yRytiOWdjZlJseVFU?=
 =?utf-8?B?d2NwZU1oMG1GekRXdGxKREpxOXRFRUpaNGR2UU8zWVlpbXY4L1UzUTVkQytn?=
 =?utf-8?B?ZXlzRVJWanVCOVI2NDNTTC9wMDc2Z2tPTW1mbWQ3cFhybUhTUVc3OE50UHdv?=
 =?utf-8?B?QWZ3MjhTMFU3WkVYMlNGdXUyVFVnVWY3K3RoTFdlbHpGaWltTGprVm5IY1dM?=
 =?utf-8?B?Wm1ERXJLaW82RHVtT25PUUNuRHllZUE1MmVZZW5pVkhOTmNZK1U5Z1g3djVQ?=
 =?utf-8?B?V3VVSDhjay90K0N4ZjlMUzJxSG9EU1pHbks4bFJxUEhQaVVDTnNiMm1zMExp?=
 =?utf-8?B?eFZ6MHhNRktOdHlPR0JJTU1JcDh3WjJ5MGYrYXpoRjJGUS9JOUVZN2hONlYv?=
 =?utf-8?B?aDY2Y3ZiSFNnaENZSXBjRU9ubnV4TXRQWk9GcHpYbkhZcGJxNERWK29WZ082?=
 =?utf-8?B?OXRFYVZQcGNMaDhXNEU5R0llVnZTWjFwcklGczZVTU1PQ0ZCM0hUWkR2aDcx?=
 =?utf-8?B?aENkZVQ0bmlUVHI2SVdwU0VvY1pZbUJCTDVPVWo2NDNzVk81NjF5azhrcFYr?=
 =?utf-8?B?R2VFVmFteUoxbHpwUit4c2xWbFBhRWZhZ1VqbGJvakZHeXEzYWl5L3BvLzNk?=
 =?utf-8?B?YmI3SVRyUkFLS0pUV0VtdTRJNXVBcDkxa21xc1hNN0NuZHNWTlJBQ2ZnUmpz?=
 =?utf-8?B?ZVJDSUtVWTZvczRLQWlHeTJYTUYyUzBDVUErb2NKeDQ1bUZicVprWU9IZlJq?=
 =?utf-8?Q?yd9Zls?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uy9QdU1NYnEvR2tvWWlmc29YUkk1TXZGYTVBNkpVMVhZWmptL0d5MEkwaXBa?=
 =?utf-8?B?VFhuVHVPZ3psYnhyTXVkc2hCdnBZcVdRcHZJRG9jQmxCQTBhRjVoUHJkZnFP?=
 =?utf-8?B?c2tWNUpwMnV1WjdXaWlSYzRlaXZoUHVEMDl0Mkw1NGE0d1dTOGRUSEwrRm1Y?=
 =?utf-8?B?RksrZmpZRWl3clBwR0ZvSjFyVWd4dkd5VTJFUW5iVFNsZFFJb3VCU2JuSkM5?=
 =?utf-8?B?ZW1BOXF0dEpVOGNDMDZGUERibWRybTV4KzUzSTBJd21vemszMVZsU1dzQmZh?=
 =?utf-8?B?K2hvVVgvaU5pbkhQc0VTUlNkb2hITDZXY2Y4RzJZc0xzRWVYK09oZTJpMFQw?=
 =?utf-8?B?Y1hZWUdxVlAxZGZiMWpwcngwRTNDVWFzcGdCU3QyMmViWkY3NTZ2NWZXc1hn?=
 =?utf-8?B?OVlTK0dzNEtQVnVVUnoyeTUwWVNkcER5RFlVUytkajAwTGZQMnBDT0k2WWFE?=
 =?utf-8?B?aXZtSXNFWFdWVGhIZ0dyM0dqOWlTcWJWbklqVEdHclVWc1VOK05ZeGk3czNr?=
 =?utf-8?B?YzNQeEtJczYrLzFieStVdlV5VEQ5RHJubGtLbC8vNWp1ZDFJVTFwc2tsV2xL?=
 =?utf-8?B?K1FXdmhvV09xUjJ1ZWh2MnZTWWlQL0lwRFdHWEdMYmRGMWViejBPcEIydHBT?=
 =?utf-8?B?SzhEWVloUkxiOU5HS2dkclhFVUNYeXF1WnNuTUlFUElmRlpzbk4yWThKTUkv?=
 =?utf-8?B?a2Z2UnB6ajBXNTA5T25xRnpIUGVzYjB1REdtQ3dzdUZwL3hxN0g1US9RRFVu?=
 =?utf-8?B?aGUwc1FMVnEvYjZpcVpTT1FDc2ozeUs4dXdqTjRaV3J3RGZuQ2JlVVdqWHRL?=
 =?utf-8?B?RUtIa01zeFpPKyt0QkN4TDNqSXNmeU04Y3Rjc1VDbWdVTnlkUGY1eDl6ek5N?=
 =?utf-8?B?cU0wdVZkRkJnTGk3eVJ2eWJnVnhOMDV3YmQ5U1BCNzMrTkwramQ2QnpacXpp?=
 =?utf-8?B?cXI2Uzh4ckxGRzFpcUovdDRmUkpMMFRtd3ZPaTZ1bDBiRFZIRllISksyYTh1?=
 =?utf-8?B?OEozWldLbHJuVEJUUEhnTGs5b0E4WktPVTRjS0N5SUF5N2E2MU1rZUpsTkhP?=
 =?utf-8?B?Y29mc3EzTFFWQndzT1ZQbmhPZU5MeGJFd1pyeEhtajN2VERKWkxXUGpycWVY?=
 =?utf-8?B?bXlNdEgwd1ZsZ2dNRXRsL1ROYzJ1dU96Yjl4Yy9nT3d6V2hMTXFzWVhpdDFJ?=
 =?utf-8?B?R090LzdIajc3a2dGWFJNd0xUQnpZTU43TkMyQ1J0K21SWG5ienduNG12QWQy?=
 =?utf-8?B?VURPMmZHdkZiWVA4YVRIYUFtVW5zSWsvK1d3dE9HWEsxd0h5L2E5WXpqK3VR?=
 =?utf-8?B?b1ZLSnY2TWZselVkNThmRXA2MG9haU95WXhIdEFMRmdsbHRuV1RRRGIrbGVT?=
 =?utf-8?B?WkUzdDV1cGN0V2M1eFduaGhqU21ScFpXUExDVjUyY1VKSFUvNVJ3ako3Zktk?=
 =?utf-8?B?YXRXQ0JVczRNZ3hEclhDL2NtSlVSWldzR0RpQk1jODdySU5mUEJZSkQwTWcv?=
 =?utf-8?B?d0xUblRzbDN1Vmp2Z2lKWUYrVGpQcHovWlI2aHF1Rm1RYmZBVFp0Y1FLWjBG?=
 =?utf-8?B?d1FKODJXWjcrNVlZay9mZGFsVUF1N3YvL3VpZEFrb1lOMFMyK1RZM1dzYXUy?=
 =?utf-8?B?NXRSZGxjdlJzSnRnRVdWb2JzM2IrR0dheFRnNlJ4bWd2ajlheTJ3dm4wbUh3?=
 =?utf-8?B?MTFOUUt6a2lPQTZ2TnhBYUZDbnNHc3R0OFk3N0dqcTdrc0ZjdC9NSXVNdWcz?=
 =?utf-8?B?L3FYM2E5dHdCSm5iYlZ4bzdFdWZRMGZCQ3I5SGFVVE1oaW1xRmE2YlNRYllB?=
 =?utf-8?B?czFWV29QRjh6VzJyQzNTZ1hMVmFVMEZuZUJFcEVlb2ZETW1LcXVOL2dVNHZW?=
 =?utf-8?B?VG1xbFUvNDM0QWJ1Q2F5OWIxVU9sc2hXbEY4c2JwMTlaUDlXZVk3NW0xamJW?=
 =?utf-8?B?VDF6ekY3SmNtNE5pdXQwZTRPYzNTRzlEQ2IvK2ZJejZTK0thZkpaNkJkV2p3?=
 =?utf-8?B?cEJ5RjJHdFRPYVVtU0p1SURXWUEvK0tDMXI0WmF5QWdjNndxbVl4K24vYnVV?=
 =?utf-8?B?TFdzN3Y2RFVTVEw0Nk9XcXU3L0lKVW1FMXBsbHprY1d0Wi9YeC9zSDBzYmxk?=
 =?utf-8?B?K2VTMzVhTGVlcE5Fd01VVzQ5a0VxTXZxR3M3K1piQXl5ZGx2ZEY2aUE5dGxo?=
 =?utf-8?B?M2ZTdnM4YW9nbnkrTDZIQ2F2bk9oVG0xbUhkUDJ0SkRLRjRvM2M4RVRFSmJM?=
 =?utf-8?B?a3B5TXdkVE5LUkxKVEpueDA2d1RkT3BiSzJ1ZlNXQzF5bjBoSGdqNmJHWEJz?=
 =?utf-8?B?a2g2MlJaOW5oTTMyQ0hBeW94YTZsRFVHV2l0eXpFVlM0Z0ZwU2NFbzFlQVVy?=
 =?utf-8?Q?c4l6Ckh3XZrvmdsE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c19961-ad97-42ed-cd6d-08de420106d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 08:55:30.9457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVoArFwBIFB2AX6bxAw3b54G1WVrjmqq6YEjPTuFnB3zac+svQ4uf7+T91rVtMFswyDU4+xYtz6OblIo+qW2mMfRxD3i4JxvcbUgya1Wxhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13506

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjMgRGVjZW1iZXIgMjAyNSAwODo0
OQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvNF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlh
MDlnMDQ3OiBBZGQgUlNDSSBub2Rlcw0KPiANCj4gT24gU2F0LCAyOSBOb3YgMjAyNSBhdCAxOTo1
MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgUlNDSSBub2RlcyB0
byBSWi9HM0UgKCJSOUEwOUcwNDciKSBTb0MgRFRTSS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+
djI6DQo+ID4gICogVXBkYXRlZCB0aGUgY29tcGF0aWJsZSBmcm9tIHI5YTA5ZzA0Ny1yc2NpZi0+
cjlhMDlnMDQ3LXJzY2kuDQo+ID4gICogUmVuYW1lZCBjbGsgZnJvbSBidXMtPnBjbGsNCj4gPiAg
KiBSZWFycmFuZ2VkIHRjbGt7NCwxNiw2NH0gY2xrcy4NCj4gPiAgKiBBZGRlZCBtaXNzaW5nIGly
cXMgYWVkIGFuZCBiZmQuDQo+ID4gICogVXNlZCBoZXhhZGVjaW1hbCBudW1iZXJzIGZvciBtb2R1
bGUgY2xvY2tzIGFuZCByZXNldHMsIGZvcg0KPiA+ICAgIGVhc2llciBtYXRjaGluZyB3aXRoIHRo
ZSBkb2N1bWVudGF0aW9uLg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDlnMDQ3LmR0c2kgfCAyMjANCj4gPiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0Ny5kdHNpDQo+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiBpbmRleCBkMWJmMTZjNmZm
NmIuLjgyNGRhMGI3Yjg1YSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiBAQCAtODIzLDYgKzgyMywyMjYgQEAgaTJjODogaTJjQDEx
YzAxMDAwIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQi
Ow0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgIHJzY2kw
OiBzZXJpYWxAMTI4MDBjMDAgew0KPiANCj4gTW92aW5nIGJlbG93IGNhbkAxMjQ0MDAwMCB3aGls
ZSBhcHBseWluZyB0byBwcmVzZXJ2ZSBzb3J0IG9yZGVyLg0KPiANCg0KVGhhbmtzIEdlZXJ0Lg0K
DQpDaGVlcnMsDQpCaWp1DQo=

