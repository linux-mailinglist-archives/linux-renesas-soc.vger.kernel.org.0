Return-Path: <linux-renesas-soc+bounces-12592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480ADA1D7DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7679F3A6B04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDB84A1D;
	Mon, 27 Jan 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SytwCg44"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3F3FC7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737987150; cv=fail; b=eQkvGo1Rk4fWtFmp2ADqjMHjycdHCBgCf4aWxetBMepWXOwpjj1dWutkPrQegZHlbwVaXRcSRdfhph19rKPIfcK3quH7o2t1wE3AbIBoJHVvAQ85rMi9zJe07uYDuUN6mb3vD1Jma7Vvt8v2spbm9luNKznaYV9XTy15U4TOTyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737987150; c=relaxed/simple;
	bh=jyeiK8LGCiTa5/7Y4YHKIbTj3/ATIFd+01knVgW1GJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oVt/L0bHvsOiVc3F/asrPcnnR4/h4dt3E1OizX3dI/eLR7tK5ZOXzFpgIqblQWpzSCsrVRfzuebXjS3KNjSTMbmKaD6Z19d+rqTwjQxanx4b/4T1okV/QobS49UEQU+/TMFjtf0R5EXSSNi12kQwmPxuUuvaPjTazb9tC+xaBvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SytwCg44; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/5G0c28Koti1nDTgWrYl88SdJvo8RurHzm5u1K69pMnixfulGKCogDQs0+QSTZKST03MaU+rV74y/f+9UD1lHpx/0a1bqQtxkstsdEgdBcBcQStFSu4wfR9iNQGJxKVJCN3l7tf2KJZGkKr8hq8M6dD5+UnRSWDkDVnurF6ilbbVTmBGdBZkM9jjc/+y6ZXOQkZz/wvJnSw8I46+4CVvnmwNlHp6uLVHnIpjZxEfrp3jLo9hW75lc1o+33pY6IPMX/CFuhCP//NcF5ZZ4DnKpeTmGIN6S+gGVd+Hhe4QnCdVaInBbpqctCKmRSdm1naBCWHAzVoyIrcxq7ePFkHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyeiK8LGCiTa5/7Y4YHKIbTj3/ATIFd+01knVgW1GJo=;
 b=pq6R1OKEBmTlRkJzm2P41l8HYbFqSunlctgiwN9u+fZN8i9jaMawTijuhrQyS/RYCFui3FxfBRKCQfWXLtXDhOL4qHDqZTksPPPC6HycC73JBzkZI5yPPLqRpYA9CgZEeClyKYUNK+6JBBDQBOzvABEIiwabYQ1G7qkOHgAdiK5KZEXubnpdioXjo9KaJRGqsM668pkhQ3dcyOdcke0/rRAcReLe4HBmKsZvXdZxTI+xhhKhRRjGRSy48Rdnx/EotV40s/JSTdE2Xw3esfvPxEPlHMq6T88zTcDuNhv2uxFR7GK81XSOYEsnxpD7sVLxYiIhjhYrcOjl6MaEsqgTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyeiK8LGCiTa5/7Y4YHKIbTj3/ATIFd+01knVgW1GJo=;
 b=SytwCg44WZuc23wI3ri9CcZzfRRJXDrljq0Re0wzAre48101oRQk0hqHgdOHFtZX9jkpnFmaJSABXNLel40PyUTZinKa2P1BBqAM/wJqJoZd481IhzLjIYkyJVRkDEKtggYgcX6qGxfiTRwfzYHeTqTID3KTMFNbyWqI55LmDLk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12322.jpnprd01.prod.outlook.com (2603:1096:405:f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 14:12:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 14:12:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 04/12] irqchip/renesas-rzv2h: Use
 devm_reset_control_get_exclusive_deasserted()
Thread-Topic: [PATCH v2 04/12] irqchip/renesas-rzv2h: Use
 devm_reset_control_get_exclusive_deasserted()
Thread-Index: AQHbcK/n6NhJD2d2JEysQrKhGJvGtLMqp0GAgAAA8IA=
Date: Mon, 27 Jan 2025 14:12:22 +0000
Message-ID:
 <TY3PR01MB11346303771B9159281704F2086EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
	 <20250127113723.24479-5-biju.das.jz@bp.renesas.com>
 <96331f6cdaaec5d5f3e31441f7880173d371d1c8.camel@pengutronix.de>
In-Reply-To: <96331f6cdaaec5d5f3e31441f7880173d371d1c8.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12322:EE_
x-ms-office365-filtering-correlation-id: 68044207-fd1c-4f91-b39b-08dd3edc9e18
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bDBiQWdhemphc3BBcy9SaVBBdHlFT2MzaXZjcG9ocnd5RkZTQzBhSThTTGky?=
 =?utf-8?B?UnJWRFhpYXNPYm9mLzJtMXpZdnhNMlV3VThLaXNUTFhiUXUvUXlxQnAvSXNq?=
 =?utf-8?B?Ui9CSC9UbDZLZHNHMFMyenZKTjdURW1WR3BGTUs1Ykk0Nk9VZEROcWh6R24v?=
 =?utf-8?B?bVkvOEJFMGlMYkJhaE9HWnE5VmNBNHpMdVdhTExaVDJzSlBnYjUrOWc5eHJ5?=
 =?utf-8?B?K1dUcjN5K2JTNGxINTV4NXF3UzN1Y2FiT0pxWWpyc28wNGM4RFF3UjBEREcv?=
 =?utf-8?B?RGlDTjlLTFhOS083RXZSVHphUktXOVZMUC83dFZtTjdNSHJpbHk4bTdPbTU5?=
 =?utf-8?B?aGdxQ2hSS2JpYU1STytGL1NPZGJMeFFYR0xPRGJIUysxdDdEME9LazVkaWFz?=
 =?utf-8?B?RmoyK2k0cTJ6bWxqUVNDZTJqeTZWeVRpQWVOTUV0bEVnUitaYzZZTllNeWtJ?=
 =?utf-8?B?ZCttV1V2SmJ1V0RJVW1RUi9sTDRycXBMRnhyQllSRkhySDJhVjF0dXFKa1o0?=
 =?utf-8?B?K0VvWjVwQzJLV0J3NzY3Y1l0MmJRSzhKa2FnejJLOFZaTitXZ3VOMmRUWlc2?=
 =?utf-8?B?R0NrZUhCcGc3Zzh0U3k0aXBhRTJWdTN1YlRRak83Q3lYK2xUNG9yemlXZzRn?=
 =?utf-8?B?dzNQTmo1TUt2NVhib3RtSVZnb1lqaE5sdFo5S0s0RmhLRXRPZHhxU3VoQmla?=
 =?utf-8?B?b0IyamI3VnQrSXBPMHZPTm5LMURmOHZzVjZmVHZleTBZVGdyU2xyblAvQXJw?=
 =?utf-8?B?QzQrUnFKTFNZQTQvWEdzWmVmVHVYV25nK3hCdSs5V0FoTEtaWnFlNFlaSXd3?=
 =?utf-8?B?RmxWYXFsVm5Fbm45MzhVYnV3emdKZHc2ZTV1ZlNiYk42WmhHUlllT1IyS2E2?=
 =?utf-8?B?dmhvSUVOUUJZaHBwZ3VUY253VnBMMGtXQWhublZ6cjd2eEhCNCtJVndiQlNq?=
 =?utf-8?B?ZjViQkNwU09QK1FJclVNWFA3YzFHMThuTk9wU1haRWQ0djVnTGRpT1hjNFJ2?=
 =?utf-8?B?Q2tNa3dvUGw0Nm9lcnlNSTZpelRQM0IvT3ZQTUZIeE8yK1ZOVGpjSDBZQnh4?=
 =?utf-8?B?eU5IcVpQaXN0eGZNMHdGbDJRNmxDSm5ZRDZyeEhhdVNtNjVyUmloWlZ4MDE3?=
 =?utf-8?B?TkIxanhHYXpIWk0yRmxUek5IQjJIOUY2MnVncXk3V2c1T1FlZlEzRGp1R1Z4?=
 =?utf-8?B?RHZuUURYSVVSNXQyWHlndUlVOG1XYytnQzVvSU1uTEFWY2lwYjF2L0ZmTWdz?=
 =?utf-8?B?K3FlN1RtTk5ZMXVHdzFVTHI2eURieERnSC9JZkVBWDZTTytBSW4zRkJHZmlz?=
 =?utf-8?B?KzhIdkM3enhLYjFMTTBiS0xqbDAybGYrM1JRNFg2RlJ3UzFGb3JFOWJOaCtW?=
 =?utf-8?B?UExBVGY5R2ZtWm1wRWFpejR3by8ySjhpL0s0Rm5wckNidXlhYXhoaXRDY0pB?=
 =?utf-8?B?dVFyd1VCQkFMaXZTR2hUNkxMdDlQaXgxOFJlNDgySEUzSEVEUnNNUFFnR3ZG?=
 =?utf-8?B?ZUdlbTNNQnlwN1BDbDRSQ2k1ZXdxSFZtNTB2UFpqU0dIWEdJenNCRzdxR1M0?=
 =?utf-8?B?ckVlU2NlQldsS1VBSXIzVnQ3OXJNN2hYQXhBdHZ3bVRCQ0JZNE9JVmNvZ1Zm?=
 =?utf-8?B?TjRBVm5USE1vL3BONnQzc3Y1NlR0alZhRXZZSy9iVTBEZE4vRTQ5cDNCOWRV?=
 =?utf-8?B?SVZwYWV1RkxScG16NHlkREcwTUhaM2lscVZ1OW41UUo4eklBU2Y4RnFkTFZI?=
 =?utf-8?B?NEN4SGdZTk5DeGpUMndKeTRwWDlFck5FUWZQSVVUWStwV3U5eCtXZlVmeHVL?=
 =?utf-8?B?dkRjRlhJZm1hcTJZaW41d1pBT0pCTGxpbXN4YTl1MWVGdXluTXQ5cVJ6QkYx?=
 =?utf-8?B?VmJ3cXZxNnlLK2ZhWnRUclRNcXAwdk9KRFJMT1lVUHN6SUY4RkJOcy85ZEl2?=
 =?utf-8?Q?ESiWrL2zvaAZDXBRNh65/7lBgxM80zDq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1F3VlU4WkFOdEtUQk03WHN4QUNXNXJDRUlpZkZJMWpZdi8vbHZwZmdpNm5j?=
 =?utf-8?B?dEpBV294QWRrcjBEc3MxSzA4NXBaSFhSSGlPMU4xT0plakxCd3NscW5RRUhY?=
 =?utf-8?B?VkNNdmxVN1lxR21BWVAxcGN3Q25hbDB1OGduZkR0ZkNqRE04a1pTZU0xT200?=
 =?utf-8?B?bkhEcDFaWFRDOUhKOEV4dVNpRkNsNFd4T1V3UUp4aWlZUTVhRmZNdDFZTjVk?=
 =?utf-8?B?d3NJMEhHbkQrT0tkSXJQRS9XYndFVDhMbis5em1HZkJGa0N2M0hrM0h3TnVu?=
 =?utf-8?B?dDNKNUJwVk4yMDFzQ2NucXJsdEhVVm0yTXdpaU9qUG9vc3RHelBLOVoyeWJT?=
 =?utf-8?B?Qm13eWU1blZMaStac0x3WS9uRlc5bU1ra3RNNlQwUHAyZUlOV3ByYTdGeERx?=
 =?utf-8?B?T3JGeXlSTHY2VlY4cElMdUlYK0ZSQXJlTW5YVWRRYVFUQ3FESFdwTndha29r?=
 =?utf-8?B?Q2M3eldSSnpYOENnbW0xbFZIdVJNaDBPV2ZFN1Z5bkRaMHBMZksvRThURUZN?=
 =?utf-8?B?OCtQQldkekc2QVNHK3l3bkswWFpGclIwRy9KVExoWnk2MDhtY2dZUWU0LzZa?=
 =?utf-8?B?RkZoMnZWUnY2TXdsQWFWa3h3L3JkbGhrRis4M1EvQXFFR3hacllXVHUxY1dL?=
 =?utf-8?B?YXdtTEdNYkxqdjdWNFMvT3dzcW8zLzd0eW9NUWlDc1FPTUhCN0t6M2tMUWUx?=
 =?utf-8?B?amM5blYxVWgxQVM1ak1obDc0eUxiL0JXTUNZZXZsWjMzNzVVa3JRWDRYSGIv?=
 =?utf-8?B?VW1OQkZCK3BTV3FYeHp3MkhrTnYvVUpPTlZZTTlFZUNUeUdlbnNjZUEzN1Qy?=
 =?utf-8?B?ald3WW1ka1FibkdTRVZGdjA5QzlsN0VNTU5QRHA5eXFrdERucm91RDhVTVRO?=
 =?utf-8?B?aDdpTWtkUGxPVzRIN0VXVnp3YzFwcnR1bTUrd3BXQ0huQkdzZnV2UXhnTm51?=
 =?utf-8?B?VitaazdSWXo2MFE4bjgvMlpVclpxS2c4Y05kYzgxSzNNU1lGejIwUmkvYmZN?=
 =?utf-8?B?R2thaGVoME4yWlZ2aDVvNG5vOWVjcm9Ic2dKYnpMYlhEYW9lR0pMR2NHbGMw?=
 =?utf-8?B?d0VJc092T3d6WndoT2srL08raUtwTTBrNnRBQmMxeENnNFVOUkl1UGVMa3cr?=
 =?utf-8?B?NGxrUFNmTjBnc0ZVd1FvWmRIVWNPMVRha0gyYzFYdGpVd3hVQlJlYVN2cXkz?=
 =?utf-8?B?b2JxTEJFLzRLclhMRDEzM1BaQVlOOVl0OFpCTzQ5U2JGRDRLZWxMMjVpTHBS?=
 =?utf-8?B?S1dsMU45N0wyZHlNY3VVV21LMVpiSmhuN2RlcWJxZ0VCZGlRRzJZeGljRDZY?=
 =?utf-8?B?aU1GUVdsenRWbjRITStuV3dJNGxXN0VmZHNaL0xlb0ZRRE1SZHh4TS9xc2tH?=
 =?utf-8?B?ZnA1TVY4UXlNMmc2cEdGdG1PQXp4b2ltUEhZdHcxVDJnK0VwUHFJclY4R3N0?=
 =?utf-8?B?QnFNK21ubDZ6YXM4b1FhNTF4a05udTRPQTEvQ1pLampxNE4veTAwb3phaVlV?=
 =?utf-8?B?a0NEMkdrWGpsc1o5R1lvdzFJZWNUYmxzWWd1ZUpKeTE5VVM3MUdnbkVDa05n?=
 =?utf-8?B?T1FjT1paRmUwOEJSMHpKSnRsOE53STdDb3E0cU9jYkx5ZHhkWkplcThrd3dK?=
 =?utf-8?B?bnVJNzBud0wxRnVHQmo1ZGlsSjhlM3kwTmxaN1RocEhnMmdQcklDVm5oYlJr?=
 =?utf-8?B?MTQwVXNYM1NJRFZDb3B1aWY3L0prLy94aDNOb2R1eGxoUDhBZjRCbWNodml2?=
 =?utf-8?B?eVpOVmFMaURoZWJVMFZ3ckxYN2J5dlgxV09WWEQ1ZVRrZTBCQ0l1dC9VVnBq?=
 =?utf-8?B?NmxrNU8zMmtjcEhiYVUxaEpib3hIeEdCdjlXSUsxOTlEa3FKWitwcmN0OXhz?=
 =?utf-8?B?eTRnZ21LYnZhSGs2eWh2TnB5SHpoNUFMYUhZaFppVkN0a2h0MjhwZExMOVd3?=
 =?utf-8?B?ei80NEk2RXBMalRsUmRwaXFpM0twRTdrYXlKT1llYjFPaGdKK3JKakNLcjRQ?=
 =?utf-8?B?R3R1N0tRUmdUZEY2TkxOb00rMTFXZzJmaE5kL1Q2QXBqOHNDeHNDYUZ3eGsr?=
 =?utf-8?B?ZEp5VHozeFc4cG90OFMxS1VveWJtakFDNnFVSEY3YzRlNms1WFExYUZNM2ZB?=
 =?utf-8?B?VDYxUnRjVE5id09ydVdZdkVqNVJCeHlQdkh2NHRDaW5mT1pRZHFxWTJMZnNO?=
 =?utf-8?B?dmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68044207-fd1c-4f91-b39b-08dd3edc9e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 14:12:22.2376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofwTUd3mLjgPzzTFSjSwmMR6hVNNxsReKMHYOXZPlB2aC7LMSb6rfaT95MZkR+edr/5HIqm7wZ42Hk728f5J4Dx8qYLiWeslqDH9+XiY2hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12322

SGkgUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gU2VudDogMjcgSmFudWFyeSAyMDI1IDE0OjA0DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMDQvMTJdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogVXNlIGRldm1fcmVzZXRf
Y29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKQ0KPiANCj4gT24gTW8sIDIwMjUtMDEt
MjcgYXQgMTE6MzYgKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFVzZSBkZXZtX3Jlc2V0X2Nv
bnRyb2xfZ2V0X2V4Y2x1c2l2ZV9kZWFzc2VydGVkKCkgdG8gc2ltcGxpZnkNCj4gPiByenYyaF9p
Y3VfaW5pdCgpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBTcGxpdCB0aGUg
c2ltcGxpZmljYXRpb24gcGF0Y2ggaW50byB0d28uDQo+ID4gICogVXBkYXRlZCBjb21taXQgaGVh
ZGVyIGFuZCBkZXNjcmlwdGlvbi4NCj4gPiAgKiBSZXBsYWNlZCBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkKCktPg0KPiA+ICAgIGRldm1fcmVzZXRf
Y29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKS4NCj4gPiAgKiBNb3ZlZCBzaW1wbGlm
aWNhdGlvbiB1c2luZyBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgdG8gbmV4dCBwYXRjaC4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMgfCAxMCArKy0t
LS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6
djJoLmMNCj4gPiBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYyaC5jDQo+ID4gaW5k
ZXggZmQ0MzJiNDM1MDZiLi41YzVkMmUwMTVhODggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJlbmVzYXMtcnp2MmguYw0KPiA+IEBAIC00NTYsMTUgKzQ1NiwxMCBAQCBzdGF0aWMgaW50IHJ6
djJoX2ljdV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgc3RydWN0IGRldmljZV9ub2Rl
DQo+ICpwYXJlbnQpDQo+ID4gIAkJZ290byBwdXRfZGV2Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gLQly
ZXNldG4gPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgmcGRldi0+ZGV2LCBOVUxM
KTsNCj4gPiArCXJlc2V0biA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNz
ZXJ0ZWQoJnBkZXYtPmRldiwNCj4gPiArTlVMTCk7DQo+ID4gIAlpZiAoSVNfRVJSKHJlc2V0bikp
IHsNCj4gPiAgCQlyZXQgPSBQVFJfRVJSKHJlc2V0bik7DQo+ID4gLQkJZ290byBwdXRfZGV2Ow0K
PiA+IC0JfQ0KPiA+IC0NCj4gPiAtCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocmVzZXRu
KTsNCj4gPiAtCWlmIChyZXQpIHsNCj4gPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQg
dG8gZGVhc3NlcnQgcmVzZXRuIHBpbiwgJWRcbiIsIHJldCk7DQo+ID4gKwkJZGV2X2VycigmcGRl
di0+ZGV2LCAiZmFpbGVkIHRvIGFjcXVpcmUgZGVhc3NlcnRlZCByZXNldDogJWRcbiIsDQo+ID4g
K3JldCk7DQo+ID4gIAkJZ290byBwdXRfZGV2Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gQEAgLTQ5NSw3
ICs0OTAsNiBAQCBzdGF0aWMgaW50IHJ6djJoX2ljdV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSwgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQpDQo+ID4gIAlwbV9ydW50aW1lX3B1dCgm
cGRldi0+ZGV2KTsNCj4gPiAgcG1fZGlzYWJsZToNCj4gPiAgCXBtX3J1bnRpbWVfZGlzYWJsZSgm
cGRldi0+ZGV2KTsNCj4gPiAtCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJlc2V0bik7DQo+ID4gIHB1
dF9kZXY6DQo+ID4gIAlwdXRfZGV2aWNlKCZwZGV2LT5kZXYpOw0KPiANCj4gVGhpcyBpcyBtaXhp
bmcgZGV2cmVzIGNsZWFudXAgYW5kIG1hbnVhbCBjbGVhbnVwIGluIGEgd2F5IHRoYXQgaXMgbm90
IG9idmlvdXNseSBzYWZlLiBTcGVjaWZpY2FsbHksDQo+IHB1dF9kZXZpY2UoKSB3aWxsIGJlIGNh
bGxlZCBiZWZvcmUgdGhlIHJlc2V0IGNvbnRyb2wgaXMgYXNzZXJ0ZWQgaW4gdGhlIGVycm9yIHBh
dGguIFRvIGtlZXAgYXNzZXJ0aW5nDQo+IHRoZSByZXNldCBjb250cm9sIGZpcnN0LCBwdXRfZGV2
aWNlKCkgY291bGQgYmUgY2FsbGVkIHZpYSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKS4NCg0K
T0ssIEkgd2lsbCBhZGQgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgdG8gY2FsbCBwdXRfZGV2
aWNlKCkgaW4gY2FzZSBvZiBlcnJvciBpbiBwcm9iZSgpLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K
DQoNCg==

