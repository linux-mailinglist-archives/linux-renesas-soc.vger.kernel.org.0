Return-Path: <linux-renesas-soc+bounces-9688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AF99A595
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 15:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F2AE2865F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544282194BC;
	Fri, 11 Oct 2024 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="byV0dhDs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1921733D;
	Fri, 11 Oct 2024 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655162; cv=fail; b=RaqjMvQS7XzJaWCozVj/eK6tMWZCx4ZurXxG7YD615+xqB46F+16qVfXj3kCUnTAIgWykhXln0ePX8Ld0eHVysD8kEYhiB00yEY6wLyzkgcBT/IRXymSqhsaHQO3mo3ddFjU68eBN6TiVWxBb8LQOS7mD/S8d25uN+o3+j8u9RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655162; c=relaxed/simple;
	bh=ymt/AdaLla1nUbhwzUx+JW1W6OHesNYQaeNxtMCQqXg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OM57wZnh6sfaBU/Njx3iuEAmg7QhvCeyM32mA2VneoF1pECyN7myQUun4vpx9Q/OHazg7JXoDyTUiwKpfNnuUB2b9tvM4eN8RKBSnECqZfCGYdXAdtA6L5BP2dasKJrNG7Tjh/zI7SI2mtuAj4cRAbiqwUgydCNrP/KzPQnXDPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=byV0dhDs; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNF6/9/FASL/JiQcpJw5mIjD9JK3YbbdYn0KH/xc0bVsKLrbeWRA4C2ktz0/K3xG2bQxpoAwUWeEOCSfxPvIsoLprkW/aRgJppC7DkeOwO96eob19H5syWy3oXET6YBYNiUFR+9PrtsV4SZaQin1RMftpozsRa2/o0+pM32RprqxyiGY63rXYCqqcTYYxiRgqvEjXvIv0mRtdtv/rccsYBybQsyLbX8R5/3+Hp8t8gkpLhKH8AfGIwUkmWutbExqtO4PbFd4Vs3Ib+/VMEmqa7S6iv5QJkjfkaQwkfDu23B38CV1e/6tVl0tB7kRj5alUQdkU7BDsPSHcSUAMzunCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymt/AdaLla1nUbhwzUx+JW1W6OHesNYQaeNxtMCQqXg=;
 b=jzI+XlRwr+DgV8vp++TVEBYkCyaAzxXmw26mIil344gr+IVj0AIsKTfsI3GTPQAVzMoOR7fq2QCr0sA4L1vTH0tq1UBsVdkW2m6/Xj9OAdZibSl5Ma/vAVUipqc+A9jbCKWgeIeChbN3mNPyBYyz7wMJtORTfMFWByCouw7sRdI71eB3L/VhW+kkKnX21tFQo8Ox2HaGN0Xyxb5demJt8w+O11y9V8Nm3srzvnLDalUo12qqoWjo/IrIHv1N6e9E9HMBk77tqhTlT5dM9rxmelaC+Jgw2iWXGgFnoklJsiFgeFUuYwKsD9tQcfaW/hHsn0QN5n+zX2IQP1EWQ1WxiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymt/AdaLla1nUbhwzUx+JW1W6OHesNYQaeNxtMCQqXg=;
 b=byV0dhDsgJQG+L2u7EYHtRF6wClNtkXY6zQO/ROIrZW89zLG6As9+qiQJdrYZvoD7yKw7U75EbQ3nGrXDwrNSdP15vLhyldOWKXOXDYMk4wCnn0UP3CMJsiYZE2NlHGuaD/IQ5y9ignyaSJ2uj2qg10OJwhIUBp1YtEmdQpbhX8=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12300.jpnprd01.prod.outlook.com (2603:1096:405:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 13:59:16 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 13:59:16 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Markus Elfring <Markus.Elfring@web.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
	<tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Chris
 Paterson <Chris.Paterson2@renesas.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>
Subject: RE: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Topic: [PATCH v3] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Index: AQHbGzNb9jrOqOIN7U6/HbwrYFf+4bKARB+AgAABJgCAAAXhAIABSbEQ
Date: Fri, 11 Oct 2024 13:59:16 +0000
Message-ID:
 <TYCPR01MB120933C3D649803424D94A9EEC2792@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20241010164155.808931-1-fabrizio.castro.jz@renesas.com>
 <2e9bf925-8fcd-4e0b-bc3b-996fffc84681@web.de>
 <CAMuHMdWURj8YzXKbt74KqgEX5fc1ivg_4ctMxUy3QdJGipLuZA@mail.gmail.com>
 <fb7b687e-cca7-4888-8041-bdace6946a37@web.de>
In-Reply-To: <fb7b687e-cca7-4888-8041-bdace6946a37@web.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12300:EE_
x-ms-office365-filtering-correlation-id: d477f1cb-e218-4ab7-4f80-08dce9fce51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Mzd4clZ4OTYzNHpVRFBGVHRtT3BpTVBHRHUvRCtORHpWVDBkZ2VvT1pxcjRu?=
 =?utf-8?B?NERodnBZd1dKQXdZc1RCTU1FWkhIT2NrVmVVUXNQcG5rRXF4eVlIZThlWkt0?=
 =?utf-8?B?dzNqaVJBM294REtiMHFRM3p5NDNtcFNIa2M0M1BUbFVsaTFDcTRkeUhBVFRw?=
 =?utf-8?B?TnRvTUJBbjZRM0JLU056UFArYVJ1QzJ5bUtHRW9FN3pQUHpaN05ERkxCNW4w?=
 =?utf-8?B?OWpXci9VMWE3WkFQRy9RU1d3Q2dHcXo1cnlkK2V0bXJobjVueDI2OWdMa0I1?=
 =?utf-8?B?eFU3bEloQ3ZsTWJVdHlQZXAva2hhVVNMQ2w5ZjVKUEVucytYK3NrVGZidFlu?=
 =?utf-8?B?K1FJNXhuUWhuVGFwMU56OXVsS1FabnlUZlo2ODQ2emFGTkZpTnEwZE45Zmpk?=
 =?utf-8?B?bTVURnFGN1lqQ1hxQkU0bS9HL2syMG50K2pqRUhEUTBtS09mVE1yeERpbDF4?=
 =?utf-8?B?ZFlrZjd3WjJtbmZOQzZNWnkvY2ZmMVo2N0pGMWJ4U20rYlE2WVlUR2ozNVVT?=
 =?utf-8?B?cUZrc3QzNVd0SnRlM2dJZG1mY0JtRE5vcGlyT3ViR0tYWVQ2bGNLS01qOWor?=
 =?utf-8?B?RmdkaTRBK1k2VXpVaTRqTmJXSmZMWERtRThxYjVWcmVORTBsTGxGeTVDY3lr?=
 =?utf-8?B?S3VxdmtJOXNnRXpYZDBOUTh0WFZYWTNpMXlxMzA4Y3dYU2hWNU1xUlBySWJj?=
 =?utf-8?B?a2M1QWJISVRJbzRXV0Jqb0tJMFJWZkptRlVFaVIxMSsxbFpldzVHN1d5YWZ5?=
 =?utf-8?B?aTg1VGI1WWFpK2EzYjY0RnVPUnVmb1RjeVFqVmY0eDkxOGR3Mm9xOVZZdHA3?=
 =?utf-8?B?WktFcE5YL2plVWNoTGhPSVBOTkQ4RHVaUEtnVHNaMk90Vmh2L1l2ak9rZmMz?=
 =?utf-8?B?b3pmQ0pGRmNzYmVNYnFMTGdVSk1CNDVuc3pzcndITVVqalR1Z1o2OHljck56?=
 =?utf-8?B?bTMwZ2l2QnFQZ0tLLytIdGtUK1NXc1dnNXpZRVJMbzNHYnhCdzZiL0N0Z1RO?=
 =?utf-8?B?TnAyclo2ZndZQm9OekJzNnN3U3B1SVovakRuaHhwckllZE1IOEVvR2Ura1Fv?=
 =?utf-8?B?NGVuWWpPbDdDUWs3QVZwbS9jQm5rdGs4bGdUTlVkdEs5L0U3dU1GWUgwcjFU?=
 =?utf-8?B?ODBneVovbjJ0cmlOc2t1ZzducXErdUJoZ3VlbGNhbHFBRC9IaFl3cFlaWDJv?=
 =?utf-8?B?NWpmRkFJQ1NURjNxTzcyVTlSZTc5bGN5NStHRFFrL2dtVW1rcHFuV21yZHJu?=
 =?utf-8?B?V0tRSWRWT0plSHNtU2pFVzJIZSt4aFM1VjhaajdTTVVNRjNEbkl5ZDlST3Rr?=
 =?utf-8?B?dS9zVkpUSjBVYjNBSHRyaUNZS3hKL1g3TmdJMkNhV1o5cVNpVGdVbU12ZW1w?=
 =?utf-8?B?UWJIZFF1aTk4cjEvaUhqdFlTTGp4UWE3QWRWMEJuakZTVXdPcFcrWlBNYTFB?=
 =?utf-8?B?VXhNZ2ZWQkpINlVpUHFPalBQajlRSk02UU04cEd6ZDNMUjFRaFRKZGNXcFJS?=
 =?utf-8?B?S0JMbTd3UzhDR2hEWnhSYmpoaXNtVU9vQjFLdCtESG1yNUY1YXk5WHlOc0ZU?=
 =?utf-8?B?cDY5SExDZnFHMmlhWEY4SExiWjhMVUVXMmhOWVFPTll2eEhhdUZPREJrTTcv?=
 =?utf-8?B?N0JBdjVnRlpvckNkdkxtN2JXUFNRcXRXSzVoVUF3eS9QNjVueElBOGJDUFZ3?=
 =?utf-8?B?ZzJoSXdhSkNYc01iWDJzWE5IWDdFQXFQS3JzL1NyMWp3c3pLMWRqUG5FcTVj?=
 =?utf-8?Q?dSN3c4I5qJilOYmo48=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzVsOWRZYWR5aVd2MWdMaXZVekRJUTRCczlvNFE1RllFTjBXUkpoMUpxM0RX?=
 =?utf-8?B?TVdFUW14cXJ2NG4zSkFyd1d0Qmc4MWQrTFVHWW40ZGZxWWtHd3B5dW0xa201?=
 =?utf-8?B?bVgybE1heTIxL3R1ZzBESlh3RVl2dTNpSmZ4VTBuRk54dVlyUmFhRTdxenB4?=
 =?utf-8?B?V3ZHeEJUL1hFWksyMmI4aUsxWEZPVWtZcnJFQ2MrcXJCTnNBQlpXUnozT0VY?=
 =?utf-8?B?L0JLSkxLMk1La3hZMDlkTG5BT0xEdHZrNElEdGNOSlRuSlNrUnJ6WEpuRHMw?=
 =?utf-8?B?TndkbURuQnJITkM1TzZ0ekJ1ZGRHNUhkSlJ6bW1LVkg4bWd2djdJQWFjKzB5?=
 =?utf-8?B?c2JpQStvSkVmWCtVdklKaWo2cEtOTnlFWVoyS1doYWt5dk94MkRob1dHaTg4?=
 =?utf-8?B?OW5vcW5LQzhCcXJycXlFWTQyblp2NnI4c0NINHpDT280cXpTcDRjSXh4NGxS?=
 =?utf-8?B?YUt2ak8xUjdLbkNUcTFuYzlNMGtBUnJaT3hBUEVqV1NDdTRpUG5jYTVETDV0?=
 =?utf-8?B?Nk9zbEJrMWxmRFpuRmx0cnMyRE1rY0djeDNLTlhNVTNoMnMwdURNUGdHMlhM?=
 =?utf-8?B?Sjl5dDBIZWtnTTY5YUpJZ3VDTzBYQVduQ2xQaVpUcXNaYzYxUXdveWtMK0Zz?=
 =?utf-8?B?Z0RsamxWcGRUeDh6eEEzRTQ2OThSYWVMcWtVNjhjY1VUeWZNQ1hNQWNGUUdK?=
 =?utf-8?B?T2Vqb0h5UjF4RjlVT2J1OUtISjU4NmFrc1hJdlhnd1NFMXpaS2xTUHRZNFRF?=
 =?utf-8?B?ZFhyV1Z5SFc3aTUvYTdVV2xBQVhSMjRWYmdIYXRZaUtuWDc5eSszR3d0V1Yy?=
 =?utf-8?B?c1VjUnFHdm9KL2FORjdtL21XclYxa3pOcnNrT2pEMGJBQ1MrbUJTZVFqcVFL?=
 =?utf-8?B?VG0rQ1dEeTErV2FMYm9FQldCQ0VrWW4vdnJ6MW96QnlVZUUvWm0zQVN4UHgw?=
 =?utf-8?B?d3ZPRzIzcjhHK0gyRWtTcWE0Y1BWWVZkQmVKOHczcFVnZTA1bFR2Z1RDZlg2?=
 =?utf-8?B?RW1qRlFFektRYXpqdXAxZnVrTmZtLzhsQUllRUFhb0o2UWNuWUxGYmdUWWlo?=
 =?utf-8?B?cUFSV3NxN29sZGpxWlY2YUltMVBkN0NMTjJZZjNtdnEwWkJIZVNzNDhMZzFm?=
 =?utf-8?B?UDdvNTRWSFFGWVhXeUJOVGNIaStBenExTXFpWjJEN3gvQysyaGgyeXJCT3Y1?=
 =?utf-8?B?STZMSDdNZDBJZUpjdHUvZjNFUUE2TVg2WW9EcGtFU1IvTGNQaUR3bGExZHJV?=
 =?utf-8?B?NG9nRy96L3c3bmtmZmNOYVlXUklaQWVteW8xQWdtSytONVRRWEhLTVNUM1R6?=
 =?utf-8?B?RkR1dnhzUHd5RXFUQnYrelFOKzc2aTlGZnNucXR5NytFS3lqL0Vqd2wxRVFW?=
 =?utf-8?B?RG5jRENKUkZzZ0xqUFgzTTIzM3pvdmJpaVVFaTc1SnZzS1hrYjBGRFJ6NTUz?=
 =?utf-8?B?ZnkwbG8xSHZxZlI1WkZ5N3NHZEtyVm5SUXBtUUFkR3pibGdnOTVNSmgyaEQz?=
 =?utf-8?B?QngvQ2Q4VGlnZjl0dTI5MERaTW1nMWFkR3k1b2J2VHZPNzlPSmhVS0VpZEdU?=
 =?utf-8?B?Sk5IZFZSTkw4NEF2Nm9FU1VxWmtmUHdaSVJoMUl2NWFNWkVXNng3aEtiVksy?=
 =?utf-8?B?aDdUWHU1alpPYmVLWGNqK0dxdFU1ZVFYNXcyOEdmWCs2WWRYbTcrelJEejZx?=
 =?utf-8?B?cGNDR0l5SWRCa0lMVlNNbmhCTUNaaFBuT0JkS012c0NoSWNGLzFzMUowczNh?=
 =?utf-8?B?UGJ2QVNWUk8yR2oweVhvRlg5R2g3OExrQnQxK1VwR3V5YUV3VERyV0t1MFRU?=
 =?utf-8?B?b05RT1E1RDE3dVVhTXZndHlnZ0o0S3dsUUIvUkNFTDU5QTJIcitaVFpSMTkr?=
 =?utf-8?B?a2VDUUZEbGxnV0U0RU0zQTI5VEc3VkFnM05WaldFNjZwa0VHUVRKenRhN0Zh?=
 =?utf-8?B?NWJqNmVSbDJsSmRXeDZLMVBxMytzamplekFXeDEzS1BUQlFCNkdGNE5XYitW?=
 =?utf-8?B?WmhpQzY4Z0RlNWxKOCs5aHpCUHF3d3dKMXBHYTBBYTNBZGw3Rm8wK0t4K3Ni?=
 =?utf-8?B?NkZTdVdWM3dqMXdVblgrK3d6VXRhcy9xejNqSmtmSTVCZDFGeFhGdXp3eU85?=
 =?utf-8?B?NE4vbkFFblhqL2ZWVEpzSUxIS0FqS29xeEVMMGVaTkZoVWtJRy9IcDFjeGtw?=
 =?utf-8?B?c3c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d477f1cb-e218-4ab7-4f80-08dce9fce51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 13:59:16.3950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZNwiA5woPcjXocaPryPzaekeiNIwAR7U7jnMaqyNGNvITrWKX9c78q5iioSLiRXnKzbbD4yXJJ9p8jFhFL5C/TokILcRFMwE9a85z5nozI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12300

SGkgTWFya3VzLA0KDQp0aGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQoNCj4gRnJvbTogTWFya3Vz
IEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9i
ZXIgMTAsIDIwMjQgNzoxOCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBpcnFjaGlwL3Jl
bmVzYXMtcnpnMmw6IEZpeCBtaXNzaW5nIHB1dF9kZXZpY2UNCj4gDQo+ID4+PiByemcybF9pcnFj
X2NvbW1vbl9pbml0IGNhbGxzIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUsIGJ1dCB0aGUNCj4gPj4+
IGNvcnJlc3BvbmRpbmcgcHV0X2RldmljZSBjYWxsIGlzIG1pc3NpbmcuDQo+ID4+Pg0KPiA+Pj4g
TWFrZSBzdXJlIHdlIGNhbGwgcHV0X2RldmljZSB3aGVuIGZhaWxpbmcuDQo+ID4+Pg0KPiA+Pj4g
Im1ha2UgY29jY2ljaGVjayIgd2lsbCBjb21wbGFpbiBhYm91dCBhIG1pc3NpbmcgcHV0X2Rldmlj
ZSBiZWZvcmUNCj4gPj4+IHN1Y2Nlc3NmdWxseSByZXR1cm5pbmcgZnJvbSByemcybF9pcnFjX2Nv
bW1vbl9pbml0LCBob3dldmVyLCB0aGF0J3MNCj4gPj4+IGEgZmFsc2UgcG9zaXRpdmUuDQo+ID4+
Pg0KPiA+Pj4gRml4ZXM6IDNmZWQwOTU1OWNkOCAoImlycWNoaXA6IEFkZCBSWi9HMkwgSUE1NSBJ
bnRlcnJ1cHQgQ29udHJvbGxlciBkcml2ZXIiKQ0KPiA+Pg0KPiA+PiBNaWdodCB0aGUgYXBwbGlj
YXRpb24gb2Ygc2NvcGUtYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudCBiZWNvbWUgbW9yZQ0KPiA+
PiBpbnRlcmVzdGluZyBhY2NvcmRpbmdseT8NCj4gPg0KPiA+IE5vLCBhcyBleHBsYWluZWQgaW4g
dGhlIGNvbW1lbnRzOg0KPiA+DQo+ID4+PiArICAgICAgIC8qDQo+ID4+PiArICAgICAgICAqIGNv
Y2NpY2hlY2sgY29tcGxhaW5zIGFib3V0IGEgbWlzc2luZyBwdXRfZGV2aWNlIGNhbGwgYmVmb3Jl
IHJldHVybmluZywgYnV0IGl0J3MgYSBmYWxzZQ0KPiA+Pj4gKyAgICAgICAgKiBwb3NpdGl2ZS4g
V2Ugc3RpbGwgbmVlZCAmcGRldi0+ZGV2IGFmdGVyIHN1Y2Nlc3NmdWxseSByZXR1cm5pbmcgZnJv
bSB0aGlzIGZ1bmN0aW9uLg0KPiA+Pj4gKyAgICAgICAgKi8NCj4gDQo+IFBsZWFzZSByZWNvbnNp
ZGVyIHRoZSBhcHBsaWNhYmlsaXR5IG9mIG1lbnRpb25lZCBwcm9ncmFtbWluZyBpbnRlcmZhY2Vz
IG9uY2UgbW9yZQ0KPiAoYXMgYW4gZXZvbHZpbmcgc29mdHdhcmUgZGVzaWduIGFsdGVybmF0aXZl
IGZvciBnb3RvIGNoYWlucykuDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjEyLXJjMi9zb3VyY2UvaW5jbHVkZS9saW51eC9kZXZpY2UuaCNMMTIzOQ0KDQpJIGNhbiBnaXZl
IGl0IGEgc2hvdC4gSSdsbCBzZW5kIGEgbmV3IHZlcnNpb24gc2hvcnRseS4NCg0KS2luZCByZWdh
cmRzLA0KRmFiDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0K

