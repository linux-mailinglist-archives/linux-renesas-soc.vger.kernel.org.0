Return-Path: <linux-renesas-soc+bounces-15203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD8A76AE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A736164DB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6243E214A84;
	Mon, 31 Mar 2025 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kI6tD8Hv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F49214A7D;
	Mon, 31 Mar 2025 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435232; cv=fail; b=KaAK5JSaYk5wawdJGINAMmnsoArf4Hk85kiTXWDV+eX8MB5lTNBy+GO8dq38ugiMFNviA6WHB+d/gHMmp40IvoT6XFwVihdWdWsOI5+9v+rZWuHEniyPihDUe6uTmP/gxgopxa5MOt77l554vQY4KC63MEY+F0uEbcI2r5805nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435232; c=relaxed/simple;
	bh=NE7u8TeKQkwlpNucBiJQtfsya6nZHYH93DRcyCoy0KQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MrX2MHc2h4tmQCQnolVKu+DAB6nuTUV9EKUkSGt2c68OHM0EBmSY4aeY/JXAB2cYXOLAq+uAPIWcB2Cnf3x4OmfBWfgrV2JgMHmjzn7t2K9Rvy5Vud3rK62J9uT3imY8E/23Gtk+E0bRaGiwC9TO7tpo4ak2Qr2dJpOfxm7XjH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kI6tD8Hv; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVtw2M5TAsf7aOD2F/G0opDe5bQp5cLOylDk3MnS4LNw2ovRRDpy63YZR4+MgvZI4VI9CNfTpJnfSiRtrBO1COHi7gc6GGFSNDXuw9OX4VccQ8tN1wVtdum+U+qhsLATLcAsfaMELfFkCLuA282LnhDlisITBQtrqALoSQBuq32k68VcPfjUGSwXoSsP6XA2WggQ8TVTyds2gBGZRTIHQqSpY33l/fJmLga35ue99k92Pwek2HT+1JByh2EFiV+omOOF0jg+j09MBnihklm3Phb8FsT1cNkqK8bnmaLIJbfyUAfaT5AFVXLYwrZ64KhImsKZR+SSV3XeedX7Kd1Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE7u8TeKQkwlpNucBiJQtfsya6nZHYH93DRcyCoy0KQ=;
 b=LBFiKPvFBsm7FoTFutsT7JTkyjjUQitfQ4qra1HGCeOsTfADUCRyz4AZH1o0EWmCBY+VGgWphHmKbPSIvGiuGnqVd+V+ITB8I+uijuClG3owMXQqn3yfqYZWSq+RMj8tpuI0fNXk5iQI2DvNruUpbiMLSuMQf7ZhDAKpqHrAZuDUYI+eGKv1VwgEp84A9o/RYRsEjvkFoExIYzRrVWB5Ic0r5MTkZP22BIeOKOWzbtYdjxlU3Yb9Y9T29D8AOaGhOmPQ9jFfadDdCNgByd1vyzx++6dAzhnD7Vw0jN9e8UfJ3WbesqmN2EqubNrj5fGbvRVDCciB13ciAZ46GYt+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE7u8TeKQkwlpNucBiJQtfsya6nZHYH93DRcyCoy0KQ=;
 b=kI6tD8HvpvCaQYvH/5bOaBwyUikPYGuregJ1jXWYDFx3m/YrrCp6nqBTx4vRy5DWYfVRaemHZZWyTDR65x9oBqIDj3NiYl7E8YHUFuQYs7EnAoXQvuqGln5YVMWUWHSh+KqpBcATp074vvjrcxVPNqXyLNncXAQ0R5G4RM6V6l4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7146.jpnprd01.prod.outlook.com (2603:1096:400:ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 15:33:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 15:33:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4wgAAIGYCAAAV54IAAD5qAgAAAPbA=
Date: Mon, 31 Mar 2025 15:33:45 +0000
Message-ID:
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7146:EE_
x-ms-office365-filtering-correlation-id: a4290067-3dfb-4885-ea77-08dd70696c8b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bisxakd3eEg3V2g0emc4WjRHaEl4bmczaFV1ZHFBaDlLMStGY2szQTVHMnlo?=
 =?utf-8?B?NlNnZ1FtSW95bXJkUTZ4b2k5d25ZWjRGVWY2b21LWW5DMDBQVElMemRCcjJ1?=
 =?utf-8?B?SW9oczQ0cUNhTHA1R2pSNkhta1NGNlVnYnZrNFM0SFhiNndYTHg4SXhhRWZn?=
 =?utf-8?B?WXNhZHR6aW5tRTBHV1gzVER5blNmNnVNbWU1d0NWQWtxYnNHSVRkczA4b2dr?=
 =?utf-8?B?aURueHNOZldGMHBvejZEQVlmRmxpWEFtem5taWtYYlZJaHAvRGJmOXZxYk51?=
 =?utf-8?B?QTlXLy82Y1RFU0lMUjAralFsdS9IbG83aVRvNS9ocjhzV3JBRTluVFNNMlht?=
 =?utf-8?B?NnEycXFiWEs3Rmt2UTFScjVLYXBScTZrQldYOHJ6UnFJekZxamtpSmdER1hi?=
 =?utf-8?B?NVk2d0JmOHkwckVybUJDT1g1MGkzNUF4eDZ2OTAxVW5jY3pPSUp2T1ZmUTZ0?=
 =?utf-8?B?S1BJZWZrVWdZVE01d2pZWkU3OWdhdW80WlA0aVRlTGhCLy83cGRvN1lsZGVT?=
 =?utf-8?B?Rm5kTXM3VVFOTTV5YWlITnhXRXJNYzU2WDJZZ3BQN09RVzdWVnM4TzFOZmdW?=
 =?utf-8?B?MGdRUmJuWXYwRk1jVDdHdDdpY0tsaGJuWTJrQ3I4MTZBbEhtNUM2WWxPNDJE?=
 =?utf-8?B?aWhCb0hOY2lhUnJqbHY1bzdHeG9kVytFeGUxZmRIaVZwVEdWMmljSjBtY0M4?=
 =?utf-8?B?TWY0QWNjUFhzNDFOdTRKWmt1SVZ3VTJFbnhXZmFwRy9RUDZCQktQbDJRVitU?=
 =?utf-8?B?ZTdnemZkc1Z0QjdBa2MycTVvak54cDYzay9yaHd5ZFBDSkZlTG5uenBYRFFE?=
 =?utf-8?B?NllxalRtUkhlaFpYQlNHNlBlL2ZoTUJPaCtya1c0Y3JjakZoR0NPVzRqZXZH?=
 =?utf-8?B?ZlprYllKNjdTOFZpWHI4UnpXczEycWoyRmphU1Nkb2JOZGg4ejE4UE9DMFFP?=
 =?utf-8?B?TXZRcGMxQW1ISnNNc0RKWmxFSHIvWUt6aDZqUGM2SEpNYlJ4N2dkZi81d0FG?=
 =?utf-8?B?K0tIN2VjYjFyVDRtL29SMHJrOGs1MmJ4NnRKbzhlU21jL0E4QTVKK1AwbnhE?=
 =?utf-8?B?ZkNCMGppTzJQWkJtV3NUQ1V2S2pDdmZiZmozcm9scENqOURQTGR3QXZMVFUw?=
 =?utf-8?B?eFZHUFlMRFVjNDhhUm8zUGxsak00R002aGQxSGpRbzdSaWhEOVJRMkRHaW5h?=
 =?utf-8?B?SWlOL05lMHV4WUxHWkNJbkUrSk9YeC9WVFdaaktPVDdNYzB2dnNteXYrUHRu?=
 =?utf-8?B?cm9mU1dVN3VlTjBrL3RrcTh6NjA0d25CYWVYUm1MdVFMZ3JON1kwN3lJUXBQ?=
 =?utf-8?B?cVlGMDBZYmY5MkVZMFhxbGlMZ0R5MW1vaDdBWXpmZ2dMc1dmYVVYMDJhVjhH?=
 =?utf-8?B?cHc2TlByN2ZWUnovMEwreFFhWFdSaWsxMWZsVStUUkpiNGVXUFRKMGRHdnZQ?=
 =?utf-8?B?OXZBWWxqVVp3K0ZVWXl1UmI5NytQM1lwdkNrQkdJeDVPcWhndnQwZmxrK2Zi?=
 =?utf-8?B?YzgvQVgyc3Rmd1JYK3ZldVErRFQ2NHRCSit0QzVreFVBZVVIUC91WGNTTmRi?=
 =?utf-8?B?eHNDWkt3NlhTNHZPV251MDZZM09YeXBUMGZta2V5RXloQVR0dmtqZEJFZStD?=
 =?utf-8?B?elVpZUFyejZXR0dNekJzV2tOM21iUTVsTDBRaHVOR1N6YlpYcVZaMHJ0TU95?=
 =?utf-8?B?TWU5Mm5TdmtsalVvYmJOdkE1eHZRaDdZRGRoOGRscVNRNmkydlk4YnJtTFZp?=
 =?utf-8?B?U3FqQ2M3WXdHVDhPaTRvem9DM3NPaGxHQ1ZBZ2xSUTk5ZXlTT1Jqa2dxTC9t?=
 =?utf-8?B?d3hhZzZvZzRmbzhSSVIvWU5wekNMMGhLNldNUVArK1ZaN0x6eHE2MnRIWmxU?=
 =?utf-8?B?RE8rQlpQa0Y3UWNZT1ZzcjAydnMyaG9NSS93dGM5RlZuSlRWcFB4ODhTVkYy?=
 =?utf-8?Q?iY5sdrAlhik=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2FhczQwSUJhcnpPc09pNnJBdlhmNXU5UjczMHdTeHlWdjIrTFRQajZ6N0hJ?=
 =?utf-8?B?WjlRN3ZsdHpLWVU3ODBlRUFuQzNvbGJSWFZiY2t3Q0s2VlFNaHlST3lPYlh0?=
 =?utf-8?B?enRrYzJ0Y0VDR0o0NDNid0VvV2pyd2NmOEFlRUpTRXNUZFV4bkl0VE04eC9r?=
 =?utf-8?B?eHI0S0YyM3V2TERMalR4bU1NS2xjRXFOTldlWkx5K092VlU3VkdLU2U5YVpC?=
 =?utf-8?B?VG9VYXJOc0NUV0UwUVZtN3VSNUE2UDIxcFlkRnNyc3NCZUV1QTZWU082Z1pv?=
 =?utf-8?B?dDhUNS9wSnlDNmdpaXU2MDdUS2xBa2I1cFVkMmRXZHdrL29uTGl2VUxRREJM?=
 =?utf-8?B?dEYwa0xqbzNjb0V5djFmV0swZHB6a251M2RIVEFFamJiZ1doQjF1QUhVcGhO?=
 =?utf-8?B?UDQ3VjZUVlZ1dEhkM0VkSVZZZlRiNnd5aThiblBQTVd3cVJ1d3UwZVhpK2RT?=
 =?utf-8?B?VEU4QXlsZUVNcFBJUlp3U2tlbm8wa3ZlWlBxQkRsMi8xQ0FrS1hYTVhxL05D?=
 =?utf-8?B?VFlFOTR5TzVCK2ovTXY3WDNCTCtzTXdTKzErS1dBOEtuZ1pqY1VwL2g0R01S?=
 =?utf-8?B?VDBYek55Qy9rL1d6OFNYZ1V1WklyKzhpT2xsVGZCeVBoZlZwRERQRUVzd0ZQ?=
 =?utf-8?B?MkFRNm9uTmZMNWZlYW0yY1FCeVFhOWJyaW9zb0NheHR2L3cvVEsrSVZHeHlE?=
 =?utf-8?B?Z1JwOXhzcmRwbHJ6SDFjbkpXZHI5cXhPV256anpiakQ4cnJQY1BCRThLY3BO?=
 =?utf-8?B?d1pKTVVBZnpkWnhTekJjTlZXa2FncUxqcmRVeWViRDM1YjhCN3I1bmNLRmRx?=
 =?utf-8?B?UTlmejFRQVV3MkhnN0c2U2h6V3hvMjVXa05WRlYxUk40K0ZDd0pPeFZUTTFU?=
 =?utf-8?B?aXBIYUtHVW1xNkUvTUlMSGlxVG1rQkVvOEhmWk44OHAwdHRuL3gvbEFTaWRS?=
 =?utf-8?B?MFNTWVZPbXFMMEwrckU5aVlXRjZyRjhtRHYvamNCZzdGa2hIU3NpOGhZYnB2?=
 =?utf-8?B?cVFpUnVnbU5MZ204QkloWkQ5N1BkMmUzT2lWVXNkNEkva1FXMDZGOG5aS0VF?=
 =?utf-8?B?ckxSS1VQNE04OVpTMi9kRXpQcTlHc2QyWUp6V0hKWDB5WGsrZGhkNWV4L09G?=
 =?utf-8?B?NS9GU3FRaDQ3U3ZLOGlPV0VTQzZuVXp4SEdvd2RQTXlNTkdMQ0M5MmhDL0Np?=
 =?utf-8?B?Ym9WYkVCaE1OV3BYOCtHV0p0amFVbHFqNmpYVXBZMGx5bzBsQUZpSkxkU0Rm?=
 =?utf-8?B?UUQ2NXdGaDgvSGNGeUxvZ1cvY05uSVRGRnZ0RDJXcW80YTRqTzUycXNxSDV6?=
 =?utf-8?B?QWZNRlU0WFkvV1kxV1Fpclhwc2g2cklUMUgvRE42cmZTeTd1ZkhjeDFMSGVv?=
 =?utf-8?B?S2ZLMGREZHVzQ1dYL1F0akdTUXdwZnRTc1VabzRVYzRZQTR1MFFodXM4VWky?=
 =?utf-8?B?RDAzeitHcUpCUlFnOGxITEI3S1dLcUsyLzh6Z3dYRUlYNlU0aGdBS296b1lM?=
 =?utf-8?B?Mk51dGZ2M0pxNEZRdVgwaXFRUDNQVFFNcHg0V0pKckUrckhldjZTaG5ob2RQ?=
 =?utf-8?B?MkVEc3lvOTJKUnFwMkJHdFpLYXZOZm9GaWZ2RUNHVmF3NUsvSGFOQ3ZueEMx?=
 =?utf-8?B?VWltYStTeE1SdzVnUDZBUHNkbGVtVnBzSDM0azRYeHNKVENwM1BCQTlwd3Fp?=
 =?utf-8?B?alpTOHc0MGphRGxKaUkzbGR4dFdjS0RYeVVvTVdZaXpMTElSMGxLWEFmVDh2?=
 =?utf-8?B?RHJMRlRONy9YL3hMRUtBUVllZ3J0ZjdqTFhYUHdEY2t0Yy9ZQ3VLMUFTNjd0?=
 =?utf-8?B?V2VlTGdwTEVTWFZwemVpeFVEaEFTdVhQbFVVM2tBME44VCs1N1BhSXNzSk5L?=
 =?utf-8?B?dmhIMEJ5V3dOR1lCTkRFbUJSOTNPd25WWDd0clRqZFdzTzZPMW1EMTBJRHpC?=
 =?utf-8?B?RnBOUkk4VTAxSHBtV2NHSFgvWHNjN1l6eGtGcDgrbzF6akxEZmthZVBzaGtU?=
 =?utf-8?B?blVZa1VkMnpWR2JlZFVLUENGNjJjUGFrNjVSSENneFlIK0hnYm0yRnF0TGhC?=
 =?utf-8?B?anRrVlNhT3RLbXJKZGlFMG5aWGN6ZDVNMjN1VnZBTi9sbzZEbGY3Q1IrWmJi?=
 =?utf-8?B?RGNPRmZSaW9pN3N1R1JWUFArem85VmdORU1LdEIvZXg0dCtCM3JCUDUvVzMx?=
 =?utf-8?B?cnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4290067-3dfb-4885-ea77-08dd70696c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 15:33:45.1257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0r8/Il8IpZQxNcLSkVQ6laKGSVEhHL5nlJaP97Fy2Tx4vDeUVIDBEc7MugsJRSBVxtyhY0icoMkYseZeSgtUPXe7eQJu9cng60/mEUCJ2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7146

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxNjoyNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvOV0gZHQtYmluZGluZ3M6IG1lbW9y
eTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24s
IDMxIE1hciAyMDI1IGF0IDE2OjM0LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4gT24gTW9uLCAzMSBNYXIgMjAyNQ0KPiA+ID4gYXQgMTU6NTQsIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiBEb2N1bWVudCBzdXBwb3J0IGZvcg0KPiA+
ID4gPiA+IHRoZSBFeHBhbmRlZCBTZXJpYWwgUGVyaXBoZXJhbCBJbnRlcmZhY2UgKHhTUEkpIENv
bnRyb2xsZXIgaW4NCj4gPiA+ID4gPiB0aGUgUmVuZXNhcyBSWi9HM0UNCj4gPiA+ID4gPiAoUjlB
MDlHMDQ3KSBTb0MuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVtb3J5LWNvbnRyb2xsZXJzL3JlbmVzDQo+ID4gPiA+ID4gKysrIGFzLHINCj4gPiA+ID4g
PiArKysgemczZQ0KPiA+ID4gPiA+ICsrKyAteHNwaS55YW1sDQo+ID4gPg0KPiA+ID4gPiA+ICsg
ICAgc3BpQDExMDMwMDAwIHsNCj4gPiA+ID4gPiArICAgICAgICBjb21wYXRpYmxlID0gInJlbmVz
YXMscjlhMDlnMDQ3LXhzcGkiOw0KPiA+ID4gPiA+ICsgICAgICAgIHJlZyA9IDwweDExMDMwMDAw
IDB4MTAwMDA+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsNCj4gPiA+ID4gPiArICAgICAgICBy
ZWctbmFtZXMgPSAicmVncyIsICJkaXJtYXAiOw0KPiA+ID4gPiA+ICsgICAgICAgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAyMjggSVJRX1RZUEVfRURHRV9SSVNJTkc+LA0KPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICA8R0lDX1NQSSAyMjkgSVJRX1RZUEVfRURHRV9SSVNJTkc+Ow0KPiA+
ID4gPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJwdWxzZSIsICJlcnJfcHVsc2UiOw0K
PiA+ID4gPiA+ICsgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMHg5Zj4sIDwmY3BnIENQ
R19NT0QgMHhhMD4sDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAw
eGExPiwgPCZjcGcgQ1BHX01PRCAweGExPjsNCj4gPiA+ID4NCj4gPiA+ID4gT24gdGhlIG5leHQg
dmVyc2lvbiBJIGFtIGdvaW5nIHRvIHVwZGF0ZSBzcGl4MiBjbGsgYXMgPCZjcGcNCj4gPiA+ID4g
Q1BHX0NPUkUgUjlBMDlHMDQ3X1NQSV9DTEtfU1BJWDI+DQo+ID4gPg0KPiA+ID4gV2hhdCdzIHNw
aXgyIGNsaz8gQWgsIHJlLWFkZGluZyBkcm9wcGVkIGxpbmU6DQo+ID4gPg0KPiA+ID4gPiA+ICsg
ICAgICAgIGNsb2NrLW5hbWVzID0gImFoYiIsICJheGkiLCAic3BpIiwgInNwaXgyIjsNCj4gPiA+
DQo+ID4gPiA+IEJhc2VkIG9uIFsxXSwgdGhlIGNsayBzcGVjaWZpZXIgY2Fubm90IGRpc3Rpbmd1
aXNoIGJldHdlZW4gc3BpIGFuZA0KPiA+ID4gPiBzcGl4MiBjbGssIGFzIGVudHJpZXMgYXJlIHNh
bWUoZ2F0aW5nIGJpdHMpLiBTbywgdHJlYXRpbmcNCj4gPiA+ID4gc3BpeDIgYXMgY29yZSBjbG9j
ayB0byBkaXN0aW5ndWlzaCB0aGVtLg0KPiA+ID4gPg0KPiA+ID4gPiBQbGVhc2UgbGV0IG1lIGtu
b3cgaWYgdGhlcmUgYXJlIGFueSBpc3N1ZXMgaW4gdGhpcyBhcHByb2FjaD8NCj4gPiA+DQo+ID4g
PiBBcyB5b3Ugd3JvdGUgaW4gWzJdLCB5b3UgaGF2ZSB0byBjaGVjayB0aGUgdHdvIG1vbml0b3Ig
cmVnaXN0ZXIgYml0cw0KPiA+ID4gdG9nZXRoZXIuIEhvdyBkbyB5b3UgcGxhbiB0byBoYW5kbGUg
dGhhdCByZXF1aXJlbWVudD8NCj4gPg0KPiA+IEFzIHBlciBoYXJkd2FyZSB0ZWFtLCBzcGl4MiBj
bG9jayBpcyB0d2ljZSB0aGUgZnJlcXVlbmN5IG9mIHRoZSBzcGkNCj4gPiBjbG9jaywgYW5kIHRo
ZSBjbG9jayBPTi9PRkYgcGVyaW9kIGRpc3BsYXllZCBmb3IgZWFjaCBiaXQgaW4gdGhlIG1vbml0
b3IgcmVnaXN0ZXIgdmFyaWVzIHNsaWdodGx5DQo+IGR1ZSB0byB0aGUgZGlmZmVyZW5jZSBpbiBm
cmVxdWVuY3kuDQo+ID4NCj4gPiBTbywgaWYgSSBtb25pdG9yIHRoZSBiaXQgb2Ygc2xvd2VzdCBj
bG9jayhzcGkpIHRoYXQgd2lsbCBjb25maXJtIGJvdGggcmlnaHQ/DQo+IA0KPiAocGVyaGFwcyBu
YWl2ZWx5KSBJIHdvdWxkIGFzc3VtZSBzbywgdG9vLg0KPiANCj4gQnV0ZSB0aGVuIHdoeSBkaWQg
eW91IChvciB0aGUgaGFyZHdhcmUgdGVhbSkgd3JpdGU6DQo+IA0KPiAgICAiU28gdG8gY2hlY2sg
dGhlIHN0YXR1cyBhZnRlciBjaGFuZ2luZyB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyIHNldHRp
bmcsDQo+ICAgICBwbGVhc2UgY2hlY2sgdGhlIHR3byBtb25pdG9yIHJlZ2lzdGVyIGJpdHMgdG9n
ZXRoZXIiLg0KDQpCYXNpY2FsbHksIEl0IGlzIGZlZWRiYWNrIGZyb20gaGFyZHdhcmUgdGVhbS4N
Cg0KPHNuaXBwZXQ+DQpUaGVyZSBpcyBubyB1c2UgY2FzZSBpbiB3aGljaCBlYWNoIGJpdCBpbiB0
aGUgbW9uaXRvciByZWdpc3RlciBpcyB1c2VkIGluZGVwZW5kZW50bHksIA0Kc28gYXMgeW91IHBv
aW50ZWQgb3V0LCBJIHRoaW5rIGl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIgdG8gYnVuZGxlIHRo
ZW0gaW50byBvbmUgYml0LA0KbGlrZSB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyLiBOb3RlIHRo
YXQgdGhlIHNwaXgyIGNsb2NrIGlzIHR3aWNlIHRoZSBmcmVxdWVuY3kgb2YgdGhlIHNwaSBjbG9j
aywNCmFuZCB0aGUgY2xvY2sgT04vT0ZGIHBlcmlvZCBkaXNwbGF5ZWQgZm9yIGVhY2ggYml0IGlu
IHRoZSBtb25pdG9yIHJlZ2lzdGVyIHZhcmllcyBzbGlnaHRseSBkdWUgdG8gdGhlIGRpZmZlcmVu
Y2UgaW4gZnJlcXVlbmN5LiANClRvIGNoZWNrIHRoZSBzdGF0dXMgYWZ0ZXIgY2hhbmdpbmcgdGhl
IGNsb2NrIE9OL09GRiByZWdpc3RlciBzZXR0aW5nLCBwbGVhc2UgY2hlY2sgdGhlIHR3byBtb25p
dG9yIHJlZ2lzdGVyIGJpdHMgdG9nZXRoZXIuDQo8L3NuaXBwZXQ+DQoNCg0KQ2hlZXJzLA0KQmlq
dQ0K

