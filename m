Return-Path: <linux-renesas-soc+bounces-32164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yoMeBBJs+2kVbAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:28:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2884DE18E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91E2F3004C07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF66B3FADE4;
	Wed,  6 May 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="In5BHqc8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011036.outbound.protection.outlook.com [40.107.74.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F33EF0B7;
	Wed,  6 May 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084877; cv=fail; b=lBvFltTZkg60DtW5MwzZv98zyy1iVuOGxC9kMzGhEUGQpldMtaEcVkiEU6Aw3TcMfnHVl4lIGMkFqgZMgBpCXhL5N6bxTHE/tUj+BvPx/ZHtwtUi4jBmk6XDuZ9jfxv7wIgPCQscKIEgcTiiPf32qeDZxQpFhLVzDWLNqWpTVkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084877; c=relaxed/simple;
	bh=gB8vT4G1hfY2j9TUYSdBySQPdCaq2O12gqV9A7VBkSE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cE8zW62rLFadP++uhSkQeZp2O5LtNMjRBzDePKoAXX97hcAbns/yy+DNMuvjuP8baJ5A6f31m65g77EV+7ybFFqxIt/zQY3nCEqWQ7kuGQXfYuQs8MmK+zVFndaNkpIpTrejw1AWtkZWpxTQg3ez/JHTqLwoDomBkNjYdWZbVS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=In5BHqc8; arc=fail smtp.client-ip=40.107.74.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObfFLxy6o66TTwbWDYKl5YgTaHy7DYGTPsxnSBwH97wqrePN1IfRqU3aqE/VO4T/8P3WQxO9w8GRRkVWlVfc3B1ziqmEK4pAx+AThpZNeZCF45fxywbHFsSE0/bz71e9BccQhpU3Y5TYgeRFn8OtuMqD1F7dSguleSgetRilEHl3RU/SQmJbKaqo3ogP2KbhLA/+q9o2kWZBUbF7tznToHZTJSQHUuts3cxU5F5GlZp1RsHqOl052JgDXxTUYwp+xfhMxUwNX4lHXXJN2j93VjP6+rMq0p/fEj/xCuPqRNoawK4Y44AQiM/NS+9eRxr+5132p+6Q76bQUOuf9mgr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB8vT4G1hfY2j9TUYSdBySQPdCaq2O12gqV9A7VBkSE=;
 b=Gj0uJIT6Ub8uBCneVNdOdESLASfyXyMznN0jb3+20bJknUZlHUp3F7HK+kIPIB2Ah7orJY1Nq1gwVB9GK0PY+ulb0gJBwoEa95Ocx2HiubiOLLQtIrcUVvBNN7R2lcRsVr6du91B3QK+SDSx6bU9Lfwqpmmvt0g5xcjZX6Tp+epM0C5gJfO5hGWXfFXO1V2i7/4soElsIEzuHhUczyM+m2fKPp2gb3w+b63UjLpMpPdmYBvXfr1bHgyQu8ym0jGWS42bFsmj4EE6UFiT4DTTlwbrRBA5j4yZB7gaCMOn3sVrTWJdWKANU3jXWu6MNJmR9KEHUgtLpsPd1zHkNgj+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB8vT4G1hfY2j9TUYSdBySQPdCaq2O12gqV9A7VBkSE=;
 b=In5BHqc88hRfGwGqza4c4LUwtfHKcfUaCvkxZe7XCikPjLC/ZRNRXRPT6VVoIhoDaRCXqXG0UpOXH9wG/PdZkUxwun7F6zjPaFo4b6CKTUvmk3Q2DH1fnTh99eFGqMzu97/XwhHNtct+Dm/K7aP+I4m2g+/iDUvXLFeFgkb6j+A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8110.jpnprd01.prod.outlook.com (2603:1096:400:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 16:27:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 16:27:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hans Zhang <18255117159@163.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, "pali@kernel.org" <pali@kernel.org>,
	"ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
	"jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "mpillai@cadence.com"
	<mpillai@cadence.com>
CC: "robh@kernel.org" <robh@kernel.org>, "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Thread-Topic: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Thread-Index: AQHc3WyHWuzP4HYMG0eDqePELVP1gbYBH4gwgAAOTACAAAEoUA==
Date: Wed, 6 May 2026 16:27:49 +0000
Message-ID:
 <TY3PR01MB11346E35A6CFDE8460FAF107F863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
 <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <8932a3a4-ede9-464e-985b-f9b0ab90c830@163.com>
In-Reply-To: <8932a3a4-ede9-464e-985b-f9b0ab90c830@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8110:EE_
x-ms-office365-filtering-correlation-id: 94f0042e-a379-4740-3aa1-08deab8c6a0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ZLt5grpJTTq8eoyAhVUqcsf8KLrnu8u/q8VMysxPikysEviB2evvxf5eUNDTlXa83BvQUuPQUEeO6yBLiGCSKstD5TlRFMg/fT90qwuf2TVl66RVEdgzyLaqYOHtN32IHXBHk1eMzL0f6t8DveYAfUf64/jDmjWWTBJFz2ZmRwn9NFNEu8/hWggaeCT3A+Mdn+FTaYiqsvTx5iKVQFnHI5o6zQXipFzR2ypk/+CXKqgCuO4tSdYS8gwh6ZxIkXHKqsxgkZ7Tdg5GIEpKyCu4r55g7YJH065/x3i6/JulQOCRGJzjZ9el3tUN6p1OIkbmRi0mFtU3LipMen3hzS2AmH3CZo6CKh2R6WVUxihYT/zyxVy+JaTXA31no2SVHlobQ0a+aewb/xq1J8N7gh2+jUrSLx2XBpxeU9YfFzyLdSdNc+EszVj3NofYAxTIr78QNdBCb/ViybMh2Q6kXRqLuJZyr4/40cZsWjg75ktR24LOIrswQ3NMMIJVp6xvUw6dLPuTnztd459xhEoVcFqfkLk3/ZYyEmPtFl54UP853EjRl1F7T1GRH9txFkNcompjORs4uJp7Md5jG9EIZRrdJ4L8cAWWTYyrz0sNbrxwFqWYTlf9e+nXPQchTEYIIlD/B0vZqZ02+RqRaWz9H4Np8AiBXr4xhoF3+svA9lmKmCJQ1cFSifJ89J8L9JGyaxVKzn5ZuwWKsHu07RgJ9/PQfKPEqEtFpFWwV4dTytDvJ00zkuCS/FLZBBezS/nfnrmspUs7o6snutMtNZZwnmMsXg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU1sSUVtWWszYldmT3hCTzB2NU94NTUxcmhIZHYrQ3Jvc1h0a2J2c3pIV1hx?=
 =?utf-8?B?Qzl4ZkFwcGEzeE1WMWs2WmxuMzc5T0s4b3VMQWtmQzk4aVVEZ29pczZ2c3ZX?=
 =?utf-8?B?OWlmMjlPL0o2T3dvYXFyNmlZb3NCY0doNEJtaWNsV0tFVHJhaTJZQ2NpUS9F?=
 =?utf-8?B?N0FEL09xSEY1dGJBVFBsVUN6czFReDhGQ2RZblhVLzJ6NVR3Wk43Vkw3UEVs?=
 =?utf-8?B?ZVlBQVJ3N1RIRjZNMXFMR0MxUW9yZ1MyU1RjUmR2UDJ1TGZVUVBnZjRGalY5?=
 =?utf-8?B?WWYrREhkeExFS2Z1cGQ0b1kyQ2ZNOXRhK0JYVU8wMng3ck12V3pNSzZISGNW?=
 =?utf-8?B?NVk5bk54MXhRdURoWWh5aHd0YjR1ODBHWDI0UFFweFFvQ1pWTzYyYUhObmZO?=
 =?utf-8?B?eEVIMUdyNzZJWGcxWmM5dmx3d3JkMFBzVDdHZGUvM3hKQlpRN1BQdDdvUTFm?=
 =?utf-8?B?Q29iTGkxT0VocW9kdWpzNVFuSnVKdU0vNTA5WUtEQkU1M1R6c0xyWDl2YlFN?=
 =?utf-8?B?am84cnJYaXI0MnE1MEpYdkdRK3hqcy9LZzYvZW12ZFVFN2VabkZLYzZLSHYx?=
 =?utf-8?B?YkpBNnNmQSsyTWMzcnJ2TUw3aUJhdlJjTVEyaU1UY3dDVGtiK1BYcWY0WEln?=
 =?utf-8?B?ZFo4NS9SL0xpUlp3VGIzby9ZT3p0cEY2eDl1YWEydm5tNXVuanIya251M3Zq?=
 =?utf-8?B?QlRiMWxDWHl4QWVoNk1HSzB5R3IxNzBzMnBhc2xyMGgwSlNaZ0l6cFNZRTUz?=
 =?utf-8?B?cjhZRWFWenZ5K0RMTUhJRXZ3eTFrNUIxZWVnc3dNTXcvakl5bDNnSWh2VW1J?=
 =?utf-8?B?SjZYZzZId2tWZmtSUWYyMmhlUGlZeWdTeHMvdFpYeVl3U01GSnh5N3dYTXhs?=
 =?utf-8?B?QXQxWWtFRUgrTVNTeU1VTzJvMU1OZllEN2c5U29wV2VkdlJmemxWSFhuYXpK?=
 =?utf-8?B?NlRiTXNMV3ltZ1dGTVVuZjFla2g2L1FJRTYxcU5UR0RYWmtoa2ZEa1g1T2RU?=
 =?utf-8?B?V1Vla0xLRG1YQW94aDNyVTdLakt4N1NwRk5IdEkydVlrK29KR2VWVFpjVkJM?=
 =?utf-8?B?ZjFpb3VCN3JQMEh3c1J1NGtDOFR6ZVNsSUJCK0pkMUQyb2lkY0w4UmNtVHk5?=
 =?utf-8?B?SVl4cjQyTUVLRXA0dGdkQk91WGlQc3RteUZ0aDRzNDZmcTVvendxaFExYllJ?=
 =?utf-8?B?elp1RnU5Z29GdVB2dVFRTHhPcGZMaGdwWmZBNjNycGV0bEpNQlB1MU5mVWJL?=
 =?utf-8?B?UzE0LzRMRlgzZkRBUDV2M3lXbE1VcXFlOG5ROUp2c2daamtPbnhMZHBkZHgz?=
 =?utf-8?B?Q05XSVpKdW5HU0FpOUVRaDlpbE1wUWliTXp5dlg4YThERXJVbVgwRGY4MFow?=
 =?utf-8?B?MmxhdmsyWmdtdVFwdlNIOFJTTExuQW5RY1lUMEorc0xHbi9UQkVvR0JwUmNR?=
 =?utf-8?B?UjhvdkNYTzFNcEs2a2Y5WUt6RVdEaFhTeVRSaDh4cDdYVk8yZjRDS2Fmc0dv?=
 =?utf-8?B?TVB6eUQrMzdkKzd4WGFXaVlkOVduWGNKU214TVJYdVdnSFNOK3hpOGtkcVE3?=
 =?utf-8?B?TEYvbFJxQ0J4M2N3WWU2TnluMUJsVVdSK2xmL2FhcXdWM0VTdjJkWlhKOHQ5?=
 =?utf-8?B?TWlGQld2S1JWYkV0NVRCQnRBaGhNN01JeXhTZGhWK2VLcE1objUxS2JncU9M?=
 =?utf-8?B?VEFKdFZ3R2Vhd01nYm5JTzkzTHNTbjRzYWllZ0FOdENZRnJHejdvYk5RdHdm?=
 =?utf-8?B?Y0VyTWFJa0RRQmRHa1pWRU10SEFvK21obmVMcVVYQVlyL2lKMTl3TmNmWktk?=
 =?utf-8?B?MVBjdWJQV2JWeHYzZHNKMm5SKzlNL2FML1F1eTV3bjVwNDhBd1Z3eHpiWTV0?=
 =?utf-8?B?UkNjRVp2bkhSZ0l4b0FxTVcwbVJTUTdYLzJPamtnelFramN3L1g3TjRFaTUz?=
 =?utf-8?B?QW8xVTZjb25SVFJaTzJlQWwvRjkrYUlTaEhkOGVON2I2amk5V0lwQlI5M0NK?=
 =?utf-8?B?Szl0Y01IRm92TmRRMEtjcWRaYUJBTTJ6c0hxbzBBbGJZWTNUSUFvUmhtMC9K?=
 =?utf-8?B?cUUxZWZyb205TVJaWEsrT1c5OFB2T2hxWEJhZmtSVXRJZkhXNXBJMVpEeG03?=
 =?utf-8?B?cENwZ1lNbmV1UTlBUmFaeENzRUZ0SkVTc0xCU3Z6U1pWcUxyVlRQZ2ZZUVd0?=
 =?utf-8?B?WkhWS0pEK1pxTHRDOTMvaTgxamNCcEtnNmk2aWp0c3NXK3EvOGpuY2QwQkIv?=
 =?utf-8?B?cGRucGVXK2ZPa1k4Qnlxc1cwaisvMk04QXJ5LzE2Z096SzkyeDVHNU5xWW1r?=
 =?utf-8?B?YnZXTXdCOFR5eEplaEV5dWNQKzh2aWt3bGViUHo2KzdrcTZHU0lTZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f0042e-a379-4740-3aa1-08deab8c6a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 16:27:49.5968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPZaTPKuIRVvurm6a2uNJ95b1UsJUYptkjlvPhID1PlVP9tGu2xoUHeVRA5GciyxK4GjB2vHJWuFa+2OiKmR0CZb4kxosL2nvvOES9ehSRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8110
X-Rspamd-Queue-Id: 9D2884DE18E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32164-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

SGkgSGFucywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIFpo
YW5nIDwxODI1NTExNzE1OUAxNjMuY29tPg0KPiBTZW50OiAwNiBNYXkgMjAyNiAxNzoyMQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDIvOF0gUENJOiBjYWRlbmNlOiBMR0E6IEFkZCBtYXhfbGlu
a19zcGVlZCBmaWVsZCBhbmQgMTAwIG1zIGRlbGF5IGFmdGVyIGxpbmsNCj4gdHJhaW5pbmcNCj4g
DQo+IA0KPiANCj4gT24gNS82LzI2IDIzOjMxLCBCaWp1IERhcyB3cm90ZToNCj4gPg0KPiA+DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IGxpbnV4LWFybS1rZXJu
ZWwgPGxpbnV4LWFybS1rZXJuZWwtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPg0KPiA+PiBP
biBCZWhhbGYgT2YgSGFucyBaaGFuZw0KPiA+PiBTZW50OiAwNiBNYXkgMjAyNiAxNjoyNA0KPiA+
PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi84XSBQQ0k6IGNhZGVuY2U6IExHQTogQWRkIG1heF9saW5r
X3NwZWVkIGZpZWxkDQo+ID4+IGFuZCAxMDAgbXMgZGVsYXkgYWZ0ZXIgbGluayB0cmFpbmluZw0K
PiA+Pg0KPiA+PiBUaGUgQ2FkZW5jZSBMR0EgKExlZ2FjeSBBcmNoaXRlY3R1cmUgSVApIFBDSWUg
aG9zdCBjb250cm9sbGVyDQo+ID4+IGN1cnJlbnRseSBsYWNrcyB0aGUgbWFuZGF0b3J5IDEwMCBt
cyBkZWxheSBhZnRlciBsaW5rIHRyYWluaW5nDQo+ID4+IGNvbXBsZXRlcyBmb3Igc3BlZWRzDQo+
ID4+PiA1LjAgR1QvcywgYXMgcmVxdWlyZWQgYnkgUENJZSByNi4wIHNlYyA2LjYuMS4NCj4gPj4N
Cj4gPj4gQWRkIGEgJ21heF9saW5rX3NwZWVkJyBmaWVsZCB0byBzdHJ1Y3QgY2Ruc19wY2llIHRv
IHJlY29yZCB0aGUNCj4gPj4gbWF4aW11bSBzdXBwb3J0ZWQgbGluayBzcGVlZCAob3IgdGhlIGN1
cnJlbnRseSBjb25maWd1cmVkIHNwZWVkKS4gSW4NCj4gPj4gdGhlIGNvbW1vbiBob3N0IGxheWVy
IGZ1bmN0aW9uIGNkbnNfcGNpZV9ob3N0X3N0YXJ0X2xpbmsoKSwgYWZ0ZXIgdGhlDQo+ID4+IGxp
bmsgaGFzIGJlZW4gc3VjY2Vzc2Z1bGx5IGVzdGFibGlzaGVkLCBjYWxsIHBjaWVfd2FpdF9hZnRl
cl9saW5rX3RyYWluKCkgdG8gaW5zZXJ0IHRoZSByZXF1aXJlZA0KPiBkZWxheSBpZiBtYXhfbGlu
a19zcGVlZCA+IDIuDQo+ID4+DQo+ID4+IEdsdWUgZHJpdmVycyBtdXN0IHNldCBtYXhfbGlua19z
cGVlZCBhcHByb3ByaWF0ZWx5IChlLmcuLCBmcm9tIHRoZQ0KPiA+PiBkZXZpY2UgdHJlZSBwcm9w
ZXJ0eSAibWF4LWxpbmstDQo+ID4+IHNwZWVkIikgdG8gZW5hYmxlIHRoZSBkZWxheS4NCj4gPj4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5j
ZS1ob3N0LWNvbW1vbi5jIHwgNCArKysrDQo+ID4+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9j
YWRlbmNlL3BjaWUtY2FkZW5jZS5oICAgICAgICAgICAgIHwgMiArKw0KPiA+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLWhvc3QtY29tbW9uLmMN
Cj4gPj4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLWhvc3Qt
Y29tbW9uLmMNCj4gPj4gaW5kZXggMmIwMjExODcwZjAyLi41MTM3NmY2OWQwMDcgMTAwNjQ0DQo+
ID4+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9z
dC1jb21tb24uYw0KPiA+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNp
ZS1jYWRlbmNlLWhvc3QtY29tbW9uLmMNCj4gPj4gQEAgLTE0LDYgKzE0LDcgQEANCj4gPj4NCj4g
Pj4gICAjaW5jbHVkZSAicGNpZS1jYWRlbmNlLmgiDQo+ID4+ICAgI2luY2x1ZGUgInBjaWUtY2Fk
ZW5jZS1ob3N0LWNvbW1vbi5oIg0KPiA+PiArI2luY2x1ZGUgIi4uLy4uL3BjaS5oIg0KPiA+Pg0K
PiA+PiAgICNkZWZpbmUgTElOS19SRVRSQUlOX1RJTUVPVVQgSFoNCj4gPj4NCj4gPj4gQEAgLTEx
NSw2ICsxMTYsOSBAQCBpbnQgY2Ruc19wY2llX2hvc3Rfc3RhcnRfbGluayhzdHJ1Y3QgY2Ruc19w
Y2llX3JjICpyYywNCj4gPj4gICAJaWYgKCFyZXQgJiYgcmMtPnF1aXJrX3JldHJhaW5fZmxhZykN
Cj4gPj4gICAJCXJldCA9IGNkbnNfcGNpZV9yZXRyYWluKHBjaWUsIHBjaWVfbGlua191cCk7DQo+
ID4+DQo+ID4+ICsJaWYgKCFyZXQpDQo+ID4+ICsJCXBjaWVfd2FpdF9hZnRlcl9saW5rX3RyYWlu
KHBjaWUtPm1heF9saW5rX3NwZWVkKTsNCj4gPj4gKw0KPiA+PiAgIAlyZXR1cm4gcmV0Ow0KPiA+
PiAgIH0NCj4gPj4gICBFWFBPUlRfU1lNQk9MX0dQTChjZG5zX3BjaWVfaG9zdF9zdGFydF9saW5r
KTsNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2ll
LWNhZGVuY2UuaA0KPiA+PiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLQ0K
PiA+PiBjYWRlbmNlLmgNCj4gPj4gaW5kZXggNTc0ZTljZjRkMDAzLi5lMjIyYjA5NWQyYjYgMTAw
NjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVu
Y2UuaA0KPiA+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRl
bmNlLmgNCj4gPj4gQEAgLTg2LDYgKzg2LDcgQEAgc3RydWN0IGNkbnNfcGxhdF9wY2llX29mX2Rh
dGEgew0KPiA+PiAgICAqIEBvcHM6IFBsYXRmb3JtLXNwZWNpZmljIG9wcyB0byBjb250cm9sIHZh
cmlvdXMgaW5wdXRzIGZyb20gQ2FkZW5jZSBQQ0llDQo+ID4+ICAgICogICAgICAgd3JhcHBlcg0K
PiA+PiAgICAqIEBjZG5zX3BjaWVfcmVnX29mZnNldHM6IFJlZ2lzdGVyIGJhbmsgb2Zmc2V0cyBm
b3IgZGlmZmVyZW50IFNvQw0KPiA+PiArICogQG1heF9saW5rX3NwZWVkOiBtYXhpbXVtIHN1cHBv
cnRlZCBsaW5rIHNwZWVkDQo+ID4NCj4gPiBNYXhpbXVtIHRvIG1ha2UgY29uc2lzdGVudCB3aXRo
IG90aGVyIGNvbW1lbnRzPw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoZSByZWZlcmVuY2UgSSB1
c2VkIGlzOg0KPiANCj4gZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0K
DQoqIEBvcHM6IFBsYXRmb3JtLXNwZWNpZmljIG9wcyB0byBjb250cm9sIHZhcmlvdXMgaW5wdXRz
IGZyb20gQ2FkZW5jZSBQQ0llDQoqICAgICAgIHdyYXBwZXINCiogQGNkbnNfcGNpZV9yZWdfb2Zm
c2V0czogUmVnaXN0ZXIgYmFuayBvZmZzZXRzIGZvciBkaWZmZXJlbnQgU29DDQoNCkJ1dGUgaGVy
ZSBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLmgsIGFsbCBzdGFy
dCB3aXRoIENhcGl0YWwgbGV0dGVyLg0KDQoNCj4gDQo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1yemczcy1ob3N0LmMNCj4gLyoqDQo+ICAgLi4uLi4uDQo+ICAgKiBAbWF4X2xpbmtfc3Bl
ZWQ6IG1heGltdW0gc3VwcG9ydGVkIGxpbmsgc3BlZWQNCj4gICAqLw0KPiBzdHJ1Y3QgcnpnM3Nf
cGNpZV9ob3N0IHsNCj4gLi4uLi4uDQo+IA0KPiANCj4gPg0KPiA+DQo+ID4+ICAgICovDQo+ID4+
ICAgc3RydWN0IGNkbnNfcGNpZSB7DQo+ID4+ICAgCXZvaWQgX19pb21lbQkJICAgICAgICAgICAg
ICpyZWdfYmFzZTsNCj4gPj4gQEAgLTk4LDYgKzk5LDcgQEAgc3RydWN0IGNkbnNfcGNpZSB7DQo+
ID4+ICAgCXN0cnVjdCBkZXZpY2VfbGluawkgICAgICAgICAgICAgKipsaW5rOw0KPiA+PiAgIAlj
b25zdCAgc3RydWN0IGNkbnNfcGNpZV9vcHMgICAgICAgICAgKm9wczsNCj4gPj4gICAJY29uc3Qg
IHN0cnVjdCBjZG5zX3BsYXRfcGNpZV9vZl9kYXRhICpjZG5zX3BjaWVfcmVnX29mZnNldHM7DQo+
ID4+ICsJaW50CQkJCSAgICAgbWF4X2xpbmtfc3BlZWQ7DQo+ID4NCj4gPiB1bnNpZ25lZCBpbnQg
YXMgc3BlZWQgY2Fubm90IGJlIG5lZ2F0aXZlPz8NCj4gDQo+IFRoZSBmb2xsb3dpbmcgZmlsZSBy
ZWZlcnJlZCB0bzoNCj4gDQo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdu
d2FyZS5oDQo+IHN0cnVjdCBkd19wY2llIHsNCj4gICAgICAuLi4uLi4NCj4gICAgICBpbnQJCQlt
YXhfbGlua19zcGVlZDsNCg0KTWF5YmUgdGhhdCBkcml2ZXIgaXMgdXNpbmcgbmVnYXRpdmUgdmFs
dWVzLg0KSXMgdGhpcyBkcml2ZXIgdXNpbmcgbmVnYXRpdmUgdmFsdWVzIGZvciBzcGVlZD8NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+ICAgICAgLi4uLi4uDQo+IH07DQo+IA0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBIYW5zDQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4gQmlqdQ0KPiA+DQo+ID4+ICAgfTsN
Cj4gPj4NCj4gPj4gICAvKioNCj4gPj4gLS0NCj4gPj4gMi4zNC4xDQo+ID4+DQoNCg==

