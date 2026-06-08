Return-Path: <linux-renesas-soc+bounces-33675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmDfMHXMJmr5kgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 16:06:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422D656EE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 16:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=cFZTfH3g;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5217303CE2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 14:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0B93C3C02;
	Mon,  8 Jun 2026 13:58:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3EA3C3452;
	Mon,  8 Jun 2026 13:58:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927131; cv=fail; b=a0MzTODpHad7O/YGJ2qGu5XCjhqiawW7/DmJhY/SRnC5rsBl+3b8/jg39T9UdfBRg4mAOuKqQ9vXn6x8dPWBgQsoE6Jm2MHGiHj4gpdH8s0cIi4TZegaxF3pGAnWuTMFa8/DX7NG58FYGxwtuhlfhQv+JldWebwWf8tMYGhFYGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927131; c=relaxed/simple;
	bh=+/6c4ukkCZmukQDhVpmSmy7EEAVZzw1ypBNnSFLoy7s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aoWvcSSQiaDHU4FaS3SyN40X3KB6L58Z1XavtP0q1skwc++BFkKMjWP+D14rpUjwSZQcS7jdMMQf2t5CQ4WfbPvmVqzsIcUDum59iqoDCZGlA1w5ZLJo3xJ99FOivrPTP4brF7Do299ni3/GWeFrAGZ5Yl9J3KPvqScw4XnrZC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cFZTfH3g; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF5YHs5qbhD9i4hi1xQqVY/Ig0KGmIfaS8obIx5MMgy8/CqV9XXlv6zQLweJ9yr4mGi+PQijqwWKjDhdclpWnhXZnejuR5MuMxO+ky4iWbNY6jLsjNTbU95aK3KhSaTsc4nO0tiwauebj+4aL6uIpyAI2OzlLs4k5GTcrHyh6/qqCREq9oGCICP+T78R1ULFRarcNQzd6I+e+FiqCsqPigVaC8isZLncRXGiqE/re6wkQqofbDhPZrkeS3XlR9fKw9fGqv0fTBpqNPiZh2SzH+DowBOR7CnOTaFv+YU7L6Bs1ZKBLS5Ei2o2rRJ4BBJF2evFlH7xSSMu7ucfwtNO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/6c4ukkCZmukQDhVpmSmy7EEAVZzw1ypBNnSFLoy7s=;
 b=Is/moU15E653PB5crrSvu4H20KsEyyVRfGGoq1n2TZ3e2AF3gRUI18ORuo1pK5fpt05pOdLyQJ7YIEE1qk86B7Is0o1YrWF4Oj8dNBwEJm0/n1GXw1iklhMdfdiE1x1rPFQEAKngkCCrpgixbNSxx/EyHvOhR1RD7s7MyEU74xvioD1pkfggMdvnkl4HqYwv4ftmwKV+VRHkwPYKEufjLedTvRJWmOZUD3CpLxl0p4EdSyEVui4MWvIkDA78iswgHu5WKzMir59X6rZunAsXZOgvimfzLe2A4qIEOn+GT/g2zSgThBRj/U0ej9GvutTqiDuMrUdGSpUej/TxiKvd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/6c4ukkCZmukQDhVpmSmy7EEAVZzw1ypBNnSFLoy7s=;
 b=cFZTfH3giGuO72THV0KdQ5HpS02OqHZNfV1v6wjcleMg2ofhX5tGb17kt4dOsNrFripLTF6aPpz2+WMgO8dYbaaYAVjaX0yLKFptKGWJ1fBpF78fC4qcvwcScxgTn+2oidtzSB15V81DXYieLfbezRh11qx9MDfJYtXsOQ+4QEo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10629.jpnprd01.prod.outlook.com (2603:1096:400:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 13:58:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 13:58:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Topic: [PATCH v3 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Index: AQHc7OP30qWUroMyqUO8R6EwR1nJwbY0t1SAgAALa0A=
Date: Mon, 8 Jun 2026 13:58:46 +0000
Message-ID:
 <TY3PR01MB113462796AC38F766EF3188F9861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260526074746.20371-1-biju.das.jz@bp.renesas.com>
 <20260526074746.20371-2-biju.das.jz@bp.renesas.com>
 <06ee3c40-1d4d-4e66-a722-3f3267c1f094@kernel.org>
In-Reply-To: <06ee3c40-1d4d-4e66-a722-3f3267c1f094@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10629:EE_
x-ms-office365-filtering-correlation-id: 39404b01-89f3-4c44-a748-08dec5660f6e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|11063799006|4143699003|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 f/RHWGufUUmva/O7NrvBvJp36HImEI6m9BSEdRYzzzqvevHJn8kI8Yu+/aAu4fy0AH54VD7zXfKmv1G8JCEGLNgjVlLThrvjRIRv1uX8IAEgVlysmSrBQB9N4j/YWfq88NVpSXTB2dXKL+6yToFT0SBbhyMa6TVdm7UA6DA42V4Zm1/orbWr9B8Bb0YUMVMjtnSRVeDHz4LTJdqdXXhjNjhhS4xDjk5xcle0WuLTB2fgpwhaAC4gvyfdmB1iu4hFMWqNqQ8t2WctAfSVcdkbEllZ5ECUM6HKjnnDvqTm17gYo/YYFM0mR1c0MmqhcEwK35SRkzY46wDpX7B2iFxP6afp71Lz4JyiiYRweqic14WpuPkgvTgL+RvNNG1/YiO3W6FgrU0HnAnTy8jm144bsDJDN2cVVU5/wPaQlt56WynBGEkqtPo9D5YFHNflqL9hsAgRoktLvjNpsHUw1jBUhYkYAl2NYp0Sjs0pM+DAlwpXdB2Qdiw9QIEe9MjhShxbvVdwvGMgW7hTcs4lsefIk+6ZDusmMoltRbCenOJgEdXSOW56ufvNOKO/qPKG6N3hPia79us2CvesiVjvzUthAyGru413UASutVnVrCT96c6SYK29VnqV3ZvgyN47K3QcQStgmJCptZez1OjtE0GrxjujwSnR2MeO56SgTbFT+NERI4B0F2m1A7wmvTQb0a9bTukLHjURRsBAfnD68mtL7lACaHksQUWe6diqBAVXtm1srk1tiI426JfcQzhTRfJKfGe5jKqzQBtm6F8yikt50Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(11063799006)(4143699003)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjI0cHJxRHhmMXcwOVNpb1RDdjk4dVJIV043OGZrSm54R2M5TnhZbGM3RC8w?=
 =?utf-8?B?V1NaUWM4cllhaUdMRjk0aVlKK3B1eE5EZzdtdXEzbnVvYXFibCt3U2RHYkVa?=
 =?utf-8?B?Y3d1bkxyRkp6ZjFyV2wzOEgzK01oaDU3ZWhjV1d0VTJzdkFNL1hoVWtRWnJv?=
 =?utf-8?B?SkFkNzhabDY5K0dKRGd3dnlGQTNHV21WMUJYYVllNk5WL0ZVTFQ1RHpFV0wv?=
 =?utf-8?B?bE9EYVZQWjhpQXByWXlhdUloQ0xlamlkOEtsaDdZRHhFeG84Yy9FbVFqT3Av?=
 =?utf-8?B?Yk1ZbEJjcnVpTmcwSEhNL3JnZXYrY1V3U3pmTDU1Vm1qNWVieWVITThuTjVD?=
 =?utf-8?B?OXRzQ3VqdWI3Sjd5NDBWVzZuN3VuMUIwL1pwd0xaSzNSaXorNlo1TXNQbHdh?=
 =?utf-8?B?TzVvclFLY3d1L0MxWWR3MnBIeCtkRDZ2TUF0R0Z0WkJNZVp2ODh4UCs3aXE4?=
 =?utf-8?B?SER0YmVuMEhKOXBXNDFIVUp6dS9xdkVISzhZa0U3cEJ2amh5UlB3cStCbFRs?=
 =?utf-8?B?czh1YzR4cGFnMnB1VlBia2ZMRlMyT29HZEVVajREMG1mSzlLOXFyVzlia2hZ?=
 =?utf-8?B?akQ3Vi9pTEk1Um04bTQ5OGxxR1BkVzRSK3krTSt0K0lVdEdRSGtBZHAxenVI?=
 =?utf-8?B?QVVzYlZQcjlnZnpvTHhtMGhsZW1QRGl2QUZPZEFhVUFEQXROeEllNlBoN0dp?=
 =?utf-8?B?bWtYUEYxOHh4U3JmTEVXd25VZTcrNS9RR1ZTTGJ6NGFWNTJPeHpRUUNUZkJF?=
 =?utf-8?B?TnlPajFFeTlVbmRTTVhxMUF5bm11NCtRRTAvZHJvbUYrRUJDOXlldUtSS1ZV?=
 =?utf-8?B?Y091VkpzU0VYY1JvTTMxQnhiY1BUZ0swWDZRck1IZW9BK0lXaGRmT2p0YWFJ?=
 =?utf-8?B?T1ZpQmpqK1U5TEg0c2paa2M5cWJkOG9pOEl5K21jQ2p3Sjc3bTdqWEh3d0xY?=
 =?utf-8?B?c3B4N3p4UWY3cExkRTROVVYva2c5czdhR1doc2EzaXpoY2IrZ2JkRVNMZXlG?=
 =?utf-8?B?YWFNeGJjV2VxQURlVFdmYkx6WlR1d0JBcVpBVVNnR0dmWEc5c2RxQ1hOalkv?=
 =?utf-8?B?YnkvZzNZenpnZVlXOTVhOW03NlJhbzJoN2MzdkVLVzI0eDl0cUY1am5rbHgz?=
 =?utf-8?B?bVIvZ3YxZTYrdzFXeXpWT0NyUXpwWGNzK3N4cmF5eEFTeEpYV1VBdXM5eGtN?=
 =?utf-8?B?elQ5UmFsckxWVXRWWEM0NXZ1QU1KWDJIMkxHYzEwNUNXQlB1UUx1ZWljT2pR?=
 =?utf-8?B?YzYwbm44RnZiRVhhWkNWR2E4eHV4Qnd0VStPNGg5b0tCSUI5QUF5MCtSQ1ht?=
 =?utf-8?B?bjVXWHVsT0E2N1BVMjVGcEpRcldGZE9FRjk0RGl2TG1tS2xUZzZrZTZwYXI2?=
 =?utf-8?B?SUp4ek40M3RIOUpmdzRYQ1dhUXdWbGpwWWYydkpza0MybzNGOWQvMUlRaFpM?=
 =?utf-8?B?TkNweDNnTWEwVmJUR3RJRENpRzg5azN1dzU3bmZvdjQ4R1RQTm4zU1FKWVc0?=
 =?utf-8?B?VjF4a0QzNzl6NEVZbEdseFdxU09OeUZHckRmREp3MGxKTjJtM2sxb0V5L0tu?=
 =?utf-8?B?Y1pUbmwxQkMwdzVZeGV0YzB0TEN2YlpFZFZvQ0JITmsyVW1ablpCZkxzWGx2?=
 =?utf-8?B?c2FOM1hkWUViZzEyYVJvMTh4YXAzTlNVNDNtaXV3azFKRWJVWlJoV0Y0Rzc0?=
 =?utf-8?B?eGorS1RqQTRhcXNPMk40S1ZoNjZ6bUpMYUVaRVFXdlFpdUxaU3kxM3FRdG5v?=
 =?utf-8?B?cmxUbXJEWFlvd0VDZWtDeGwxMjN5NWs5cUdVdE9Wb0ExNFU2UUViSTVoSWtE?=
 =?utf-8?B?L000WXByZy9yUU1hbnI0bWNZZjVBZE0xK3VMTFFzQmxmb3JiQ2FpSk9DSDM3?=
 =?utf-8?B?SXN4MC9Ka0pGRnZqQ1NkU0lqcGo2R2pQcjMxSE5seW5jaElXOGJRZlA5ZmVP?=
 =?utf-8?B?OFJKdDVWb0hiR0RMbXdUaytvd1dWcUtHSTA4bUNPZGtMOHNqQlpJODVFcncr?=
 =?utf-8?B?eDVUOE5SU3k3VVhhMlJYY3JhUWkvNUpEeS9zUnI4Z29BV2taRzROaFVmTFJC?=
 =?utf-8?B?Z2ZqMDc4VmdCOUpILzl5YWJZT0RCUnlqUVhMeWp5dkFUcWZoVjFFem9MV1cx?=
 =?utf-8?B?U1R0SGRrWURHNXd2OXI1VWUwV1JRTmJXNDRyS3pWd2lWZmZ3ZHdkdHJQbExC?=
 =?utf-8?B?MWt0c3BJV0VaaXphZW1SYUg0ZTliU2xrWmIwYUJONUVqaU9MRzBiVUJwby9G?=
 =?utf-8?B?MFRxVDR6YzFRTkZMejNWaTArSTRQdEgyYXBGRWpXUlQ0SjUvYTE2bFZWcjNO?=
 =?utf-8?B?TE53TjE3enVFdHp4VjdobDZFVU5OUFlEc29sREt5WmFsRk5WNThBUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39404b01-89f3-4c44-a748-08dec5660f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 13:58:46.9180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXbD273CytXyYq6f1YvB+LCJ5+nDpKEdpBqBboTrd2Ab+HZf0o56+wP5E0OdJuaq6VVtpHyj2Ox6IQihzWlSw9DvMWgKhXIBgdiiUrvnxdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10629
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33675-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,linaro.org,ffwll.ch,linux.intel.com,suse.de,glider.be];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:tommaso.merciai.xr@bp.renesas.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,bp.renesas.com,lists.freedesktop.org,vger.kernel.org,microchip.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2422D656EE3

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxNDoxMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gZHQtYmluZGlu
Z3M6IGRpc3BsYXk6IGJyaWRnZTogRG9jdW1lbnQgUmVuZXNhcyBSWi9HM0wgTFZEUyBlbmNvZGVy
DQo+IA0KPiBPbiAyNi8wNS8yMDI2IDA5OjQ3LCBCaWp1IHdyb3RlOg0KPiA+ICsNCj4gPiArZXhh
bXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
cmVuZXNhcyxyOWEwOGcwNDYtY3BnLmg+DQo+ID4gKw0KPiA+ICsgICAgbHZkcy1jbW5AMTA4YTAw
MDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1j
bW4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAic2ltcGxlLW1mZCIsICJzeXNjb24iOw0K
PiA+ICsgICAgICAgIHJlZyA9IDwweDEwOGEwMDAwIDB4MTAwMDA+Ow0KPiANCj4gSW4gY3VycmVu
dCBmb3JtIHBhdGNoIGlzIG5vdCBjb3JyZWN0LiBNVVNUIE5PVCBCRSBBUFBMSUVELg0KDQpJIGNv
bXBsZXRlbHkgYWdyZWUuDQoNCj4gDQo+IElmIHlvdSBhcHBseSBpdCwgaXQgd2lsbCBpbnRyb2R1
Y2UgbmV3IHdhcm5pbmdzLg0KDQpZZXMsIEkga25vdy4gQ3VycmVudGx5IHRoZSBtZmQgYmluZGlu
ZyBza2lwIHRoZSBjaGVja3MsIHdoaWNoIGZvdW5kIGR1cmluZyB0aGUgdGVzdGluZw0KdG9kYXku
DQoNCj4gDQo+IFJldmlld3MgY291bGQgc3RheSBpZiBub3QgdGhlIGZhY3QgdGhhdCBkZXBlbmRl
bmN5IHdhcyBpbmNvcnJlY3RseSBkZXNjcmliZWQgYW5kIHRvIGRvIGl0IHByb3Blcmx5DQo+IHRo
aXMgcGF0Y2ggc2hvdWxkIGJlIGNoYW5nZWQuIFRodXMgcGxlYXNlIGRyb3AgYWxsIHJldmlldyB0
YWdzIGFuZCByZS1kbyB0aGUgcGF0Y2hlcy4NCj4gDQo+IE5BSw0KDQpTdXJlLCBpdCB3aWxsIGJl
IHRha2VuIGNhcmUgaW4gWzFdLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1RZ
M1BSMDFNQjExMzQ2NkY1NzlGNDA5MzIxN0RBQTZCNzA4NjFDMkBUWTNQUjAxTUIxMTM0Ni5qcG5w
cmQwMS5wcm9kLm91dGxvb2suY29tLw0KDQpDaGVlcnMsDQpCaWp1DQo=

