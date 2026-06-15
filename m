Return-Path: <linux-renesas-soc+bounces-34020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3lwVMu7xL2q9JQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:37:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20136686450
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=ZPY4qeXy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81A830C9791
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED52C3F1AB9;
	Mon, 15 Jun 2026 12:30:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760D3ED5C5;
	Mon, 15 Jun 2026 12:30:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526653; cv=fail; b=iDdP8B4rdDrv035/FylPAQSWC9T+YINLwvBws3S8/+jA5/d/Ho2ObBG9/snij3Sv+mnNMK5qry5tE0BbH98LwQW2NOZClHTCuhplqrcoSu3os7717zaPx1ft4A5pCoEkAO5pfhvs8zdmEPp2fK/GFtolCBunDaPKfvIwNrbUwCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526653; c=relaxed/simple;
	bh=Z6jB2qrAQktPFwYFr5amPIvfCuyufgvbHRcQ92raccc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dckuMS/GTLS7aTrh28NwC4xEbYKVXmAs94XpSqcXc0R6bJzcsbKyHamjYrxvN+A0s8hN1fi1xLBri/3jVgaFbt3ycGXd0f2Wjzz/VNv9yKd/xrfCjP/YJ7PflQRC5uB27koom+wJdd3KF/C9juuBccz87RMlleOqLsn2e7RkI3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZPY4qeXy; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT+DqmXrqVQTQfEFfUaC5WBj8bUnkRRQYEyVi+dRJWGrdllcnSLMnzADH75C64tjwUTqEVf8RRurhC8yHe8mHvjq+7NsU/W9TN650yOwo8NvhWwNZi3ETOooNTTx0stjJzUmsIDMOYbwO18iU/DA7sKfAwekOFPX6QYR8+myo4m682APkZwZoscSVpfBQDnn+tFHvNMhYHlC+OGFWby2tsK1Q+1FWQQBoZ2SXoL29kib/n9W4fHMj3VThoI++5iQxQm8vX5ZOZuonhTRS+Sfa7lyX0yq5/uZrXCnUscQn1f+Wk5Aefeghc1pJlfcpJA7jLtsomS/N2kkjjBZXV0E5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6jB2qrAQktPFwYFr5amPIvfCuyufgvbHRcQ92raccc=;
 b=MDdGgQ3OBW6+8tUuyX6yhR6XLHjN6AnTuSApePeVmvxLoNpjaEsvn6PSnbtipz1Eo2hWzPY7qagvId/VVxc8nwG+CeonLROR3LWkr54uEqoo6+qIgw/fbWNQ+DZkxqgqiq2nLS3APqkDDVijZH3nawTlOcCnvd52SI4ME/icZCcOQ7SXCOU+nDOje+fvsbHU6JVFc/D6sxhm2FwtDmwkgslaSyz/cY+ErmOxRrjyfnS2HnCds6R2E6Cubk43zFSVIPLOaxmGoKDWDXSh61+6bMaC3Rh6u8DX7wEGW0gh/XOao+fJSJWUwt8pCW+dEo8BPIljm3205bmo4tkTacY8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6jB2qrAQktPFwYFr5amPIvfCuyufgvbHRcQ92raccc=;
 b=ZPY4qeXymp+lGVvJjDhhI4VhSd1pTK17FLoIFs7+g732j3NAuRyf9p0dHm9UQQ7vdpX6ntnA55cbtYMMHuQjtZdDVJ8orSFwxPPd8o+GCy4pDbVGpTvKuWS7dLI+rj+cD43lBaEod5gtSO+rsywSR0LUnGGaO3ihLECk7JtUn1g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16120.jpnprd01.prod.outlook.com (2603:1096:604:3d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:30:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:30:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, biju.das.au
	<biju.das.au@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Topic: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action
 registration for disabled VBUS regulator
Thread-Index: AQHc+ngaWA394/baeES91naIfR5habY/YB4AgAAHtfCAABvPgIAAAQaggAAKixA=
Date: Mon, 15 Jun 2026 12:30:41 +0000
Message-ID:
 <TY3PR01MB11346185F0071826D74C9CBD186E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
 <2b794049-0c44-4390-a6cd-e5bde5c5f3ca@tuxon.dev>
 <TY3PR01MB113466284D6307E1967286AC486E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <75976eb6-5837-4229-9faa-c77e058d1cba@tuxon.dev>
 <TY3PR01MB1134684AA984BDC881C8A640A86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134684AA984BDC881C8A640A86E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16120:EE_
x-ms-office365-filtering-correlation-id: 481186a5-168f-4b35-ce6b-08decad9e9cd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|56012099006|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 hAWzcG6GptyfkeVK6Cf0wy+9S7rlcIjD+5/pU4m1OgKKs4hCpLFhFiJvi+0GEdOfPWuGlBRg7+RDwgsKOg53JFVrQNkKI0uVZ5OyIBomSjdX52TVOG7sqlKPGaoyoNdLR0IyiW7fGVLA9qn9NbatXEHdhJkTgdxaaEJVCnm8cWg9usUJPGPBwp/jrnJdmLEcSSVLlnznn3/OjmtpjjVOkMyZjYPo15+ooHiAn2o6seY/VJDJKaLd/ItWjn3tva8SJthrtDtgOimSvO51yAFt6RCOnUQcgFMfmc5AhItd1Xt+7WgOv9W40SbrBjThN0tkBWEnPAjToZ0pbFLSfeXarj9/CZdefDkTW0AraCfywa0vm3RKKIyobK7u8y9eMfb6ujtqNZx/tXLiTeTMakYenoGjjC8xRfmQoZ6mys4K8EMg1wkETqALvA2ah5Cyti5A6kIx8TI2xoh27LJIsl2c9kKKklGzlSpCrRaIXzXOZ+XdrqUI1G25Bh2pWuRuskMYxBrUp4Rpol5vJ+aYqqd8gYxiUD7aWerKe45CiOHnhTgbE8EQg2DR2UlfqCfK8WCBcgTZbLrm65nN6Anz7MJ82K0b2zeFRjhOCfTFqJT7181JCbbq/UnTTTf8fr4dE0+luL5Tzz6ryNRP5VOS2AZNzC1C8Co0TlVhr0pktyDup4v7CInbpwPMRO6qlfaF3K90RhWiv/lYhUBJ/SiPyIvmFyKYcv3JQiX3lOUDjOu7ea1r0h5NN336dEINCifxEzV9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2Y0QjNDSVo1SFdPazlvY2owZEJCYi92K0kyOXNaVm5uSXo4WkZaSDB5QmF2?=
 =?utf-8?B?Ukovb2ZCSGFhSXdzb21ha3gxc1Nlbnk1aU5CTk5MNXRTbm1LQ2t4emg0ZG1Y?=
 =?utf-8?B?UlVNUmQzeE1rT0dUamVyWW9yWXVuUzg0b2hTUVI0NnBpcGN2cXZGRm0rRkhj?=
 =?utf-8?B?UXVaVTZ6Yk9xRUVZYWFVNVJ0dmVvbXFPK0tEcHhBcUlRREVMeUhBQWdzZjJ6?=
 =?utf-8?B?b1pGV01iclgxVHhOYXNNU01LNmdSS1haRGxqWVg0Z1BvY3VVTUswWkxFMnJz?=
 =?utf-8?B?V244Tmp3VUovUW5RMU1UOXNQcTFFOFV6SnRHWWFtTnZYWTBIR0J3NW91MlhR?=
 =?utf-8?B?WE11VWhuc0hJM0hicnp1Wm5QdENEL0prVGl4TlI0dlhpaEVkR2JxZHptZW9U?=
 =?utf-8?B?RmlSaDJTRVlhS0E2U0ltRGhqeHc0QTBvYVMrODZBRXYrYXBlUzRiR3BHdjdB?=
 =?utf-8?B?WDlHRC80ZFg1dmlsK21sTGZNdHEyeklZNnl0TDlnck5QWTJFeWEwWjd6MUdt?=
 =?utf-8?B?ajk5SlBKbjU5RHZOMUt2eFphSld3NURZWSs2NS9WaHRuUlIzRnQ3ZzZFYzEx?=
 =?utf-8?B?QWduQlJtVnV5dWs3MHdtMjQzNjlzb3lWdldZem1zUGpxSXJ6VjR3S3VtOUYz?=
 =?utf-8?B?Y2lzY1RQOHRkbElmYXNiV1orN1R6eW1hd2xQZWg0OUhiV0FvRkRnQ21FbnZ3?=
 =?utf-8?B?YWd0akJCeG1TYnVjU3Ivc0Z6c0Z3T01XVi9UZVJtaEM2ZW5jZGdqNnlmai9T?=
 =?utf-8?B?ZHFDdTFyYTY3VE83WDg2KzNYcGNXODNzNERkWGpiY0FKdVJyamppV2tEUDIx?=
 =?utf-8?B?c1YxT1l1QXNyYS9UYUl0d0pvSVpIYkJQcTA5Kzc3QWhwMDFKZTVubzIrMW50?=
 =?utf-8?B?dzNabFAvdDE1dkRYQWl2MlQ4dHdIaEJUVzVLT3B6V3czMU54eEswakpEOGYz?=
 =?utf-8?B?d1FHOHFyOFg0R2tGcXFHWEZMek5FUFRQMWh1c01RQzFkNGhBSEpQVTZKVk5T?=
 =?utf-8?B?RSs5dSsxOWxEa0dxeTg1T2sxYnFWdGt4enZuMklKOHgwNXhTUnV1ZEZZL2t1?=
 =?utf-8?B?NDIwa09MWk5oUFJmcFdzRnZJVEpycFdVTDJiTk5kZnluWEptcUlrT0xuRHpz?=
 =?utf-8?B?WmRXVjJDbTZLdTdjV21sa2ZEWm1hcEFtbk9xcmJocGN3OFBFdWI2YjNmdDZY?=
 =?utf-8?B?Qy9MWkUrYlU4cjRwNTJDU1g4OFcrQUh5NXNveG1zeVNxcEVacEtzUTBTbkdI?=
 =?utf-8?B?YVFOa1lhdmNlc0xZZlRrVW9icGlsRDlBSDZBSFZOc2JmS2w1SVpJa1kraG91?=
 =?utf-8?B?Mm1TTUU3em5aUm5XV0RRdlhoWVg5VVEwSVFxMEtmS0dCMnE1T00wV3E0UVJQ?=
 =?utf-8?B?VStCY3lzUXVoVE5BZnY0VjJGck40Q0Vqbm52WllZbWVySmlmRm9GZ0lUNGpu?=
 =?utf-8?B?aVBrOFcyQksyRVpWMHdmWE1lcmRZR3dRbUxHdmZaaksxS2lLWGJFWEYrQmk4?=
 =?utf-8?B?bXpkdExqMWRCTGF1ekplUWorNDdxYWhlcFZvS3ZvTlB4L2d6bnE5eFV3U2xp?=
 =?utf-8?B?T2hJL0w3azhiUVRMTTlFMkVLa1Q1NW1FNDFMSTJQZDc0UW1EMDlodUUwb0Fp?=
 =?utf-8?B?RHNtNm9vNkEwYzd4SzA5a3VaeXhWUThKNzdWSUhJRjlKNGN6SzYvWVU5MlV0?=
 =?utf-8?B?dTVSY3ZjL1oxd3lGV2JmaU9YbE9EeW5ZRzlMZ1dKaTZETHl0Qlk3alZtRlo3?=
 =?utf-8?B?alpHcVc4KzJPR2ErY3ZGN2JUSnEybGVaellYRGZSQjFxakNsQnlReDlscFpK?=
 =?utf-8?B?YnNVMzR1cVlWRmlGNzNmeC9QQ1ZPWjduTGdLRlNENDNBNFVLeXFsUE1IV0FK?=
 =?utf-8?B?Y1MybjVwSzNlV1FZMmQ0QVBFSDlaZVRUMEVtNFh5RHhWSkhKTHRSYjkxK2tT?=
 =?utf-8?B?QlIxNVpvNUJESCsvOXROS0Y3TjBSSDZvYVhVRlNMa2R6SVlKRkF5SHQwdDBE?=
 =?utf-8?B?VVFTS1NCTXhOZ2xwZ0pBK095WlR2K2VFMnhHL0lKeVBVQTgvMHlrMm9QNjE2?=
 =?utf-8?B?Y2NhTWFLMGZ3U01sYzgvWHQ5Qk50Ymp2MUQzUUxCSmRxQnFiN0pKbE80Uk10?=
 =?utf-8?B?dEppYnUxcWRJMTlYNmZXY3kvdTdiUk1DZWNzUnNlVUtFajVLaE9yUW50SWQ5?=
 =?utf-8?B?cE5MVWhQWGtOazZXWTg3MmdhaXQzYjllRU9pS2c2Nm9xV3d0UVc1aHJBMFpP?=
 =?utf-8?B?WnE5NnpVdXFYd0hsVFlqMFU1VGFWSndvT0xQYmQ5V1loQzJsOUV0RFcwb3ky?=
 =?utf-8?B?K0Q3SnlEaWlQNVlwWXhVd3loa0ZZRXBtSDFId3N0RFVUL09lQVlJQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 481186a5-168f-4b35-ce6b-08decad9e9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 12:30:41.2155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7iH60BC5EkGSx2bbcJF6B8S+9qOyk9xeNIVPmXSaHJ+ALG8aX4DJip/cQIIlhblmfPn5B7X5Ww7QIYv442THrvSgt4yVoaZa7G+K2K34i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34020-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:biju.das.au@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[tuxon.dev,gmail.com,renesas.com,kernel.org,glider.be];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,tuxon.dev:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20136686450

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcw0KPiBTZW50OiAxNSBKdW5lIDIwMjYgMTI6NTENCj4gU3ViamVjdDogUkU6IFtQQVRDSCAw
OS8xMV0gcGh5OiByZW5lc2FzOiBwaHktcmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtIGFjdGlvbiBy
ZWdpc3RyYXRpb24gZm9yIGRpc2FibGVkDQo+IFZCVVMgcmVndWxhdG9yDQo+IA0KPiBIaSBDbGF1
ZGl1LA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IENsYXVk
aXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4gU2VudDogMTUgSnVuZSAy
MDI2IDEyOjQ0DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xMV0gcGh5OiByZW5lc2FzOiBw
aHktcmNhci1nZW4zLXVzYjI6IEZpeCBkZXZtDQo+ID4gYWN0aW9uIHJlZ2lzdHJhdGlvbiBmb3Ig
ZGlzYWJsZWQgVkJVUyByZWd1bGF0b3INCj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA2LzE1LzI2IDEz
OjIyLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IEhpIENsYXVkaXUsDQo+ID4gPg0KPiA+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPiA+PiBTZW50OiAxNSBKdW5lIDIwMjYgMTA6MzcN
Cj4gPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDA5LzExXSBwaHk6IHJlbmVzYXM6IHBoeS1yY2Fy
LWdlbjMtdXNiMjogRml4DQo+ID4gPj4gZGV2bSBhY3Rpb24gcmVnaXN0cmF0aW9uIGZvciBkaXNh
YmxlZCBWQlVTIHJlZ3VsYXRvcg0KPiA+ID4+DQo+ID4gPj4gSGksIEJpanUsDQo+ID4gPj4NCj4g
PiA+PiBPbiA2LzEyLzI2IDE3OjMwLCBCaWp1IHdyb3RlOg0KPiA+ID4+PiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPj4+DQo+ID4gPj4+IGRldm1fcmVn
dWxhdG9yX2dldF9leGNsdXNpdmUoKSBpbml0aWFsaXNlcyB0aGUgcmVndWxhdG9yIHdpdGgNCj4g
PiA+Pj4gZW5hYmxlX2NvdW50ID0gMSwgcmVxdWlyaW5nIHRoZSBjb25zdW1lciB0byBkaXNhYmxl
IGl0IGJlZm9yZSByZWxlYXNlLg0KPiA+ID4+Pg0KPiA+ID4+PiBQcmV2aW91c2x5LCB0aGUgZGV2
bSBkaXNhYmxlIGFjdGlvbiB3YXMgb25seSByZWdpc3RlcmVkIHdoZW4gdGhlDQo+ID4gPj4+IHJl
Z3VsYXRvciB3YXMgZXhwbGljaXRseSBlbmFibGVkLCBjYXVzaW5nIHRoZSBjbGVhbnVwIHBhdGgg
dG8gc2tpcA0KPiA+ID4+PiBkZWNyZW1lbnRpbmcgZW5hYmxlX2NvdW50IG9uIGRldmljZSByZW1v
dmFsIHdoZW4gdGhlIHJlZ3VsYXRvciB3YXMNCj4gPiA+Pj4gbGVmdCBkaXNhYmxlZC4NCj4gPiA+
Pj4NCj4gPiA+Pj4gRml4IHRoaXMgYnkgYWx3YXlzIHJlZ2lzdGVyaW5nIHRoZSBkZXZtIGRpc2Fi
bGUgYWN0aW9uIHdoZW4gdGhlDQo+ID4gPj4+IHJlZ3VsYXRvciBpcyBlbmFibGVkIChjaGVja2Vk
IHZpYSByZWd1bGF0b3JfaXNfZW5hYmxlZCgpKSwNCj4gPiA+Pj4gY292ZXJpbmcgYm90aCB0aGUg
ZXhwbGljaXRseS1lbmFibGVkIGNhc2UgYW5kIHRoZSBpbml0aWFsIHN0YXRlDQo+ID4gPj4+IHNl
dCBieSBkZXZtX3JlZ3VsYXRvcl9nZXRfZXhjbHVzaXZlKCkuDQo+ID4gPj4+DQo+ID4gPj4+IFRo
aXMgZml4ZXMgV0FSTl9PTiBlbmFibGUgY291bnQgZHVyaW5nIHJlZ3VsYXRvciByZWxlYXNlLg0K
PiA+ID4+Pg0KPiA+ID4+PiBGaXhlczogMjQ4NDM0MDRlZmU0ICgicGh5OiByZW5lc2FzOiBwaHkt
cmNhci1nZW4zLXVzYjI6IENvbnRyb2wNCj4gPiA+Pj4gVkJVUyBmb3IgUlovRzJMIFNvQ3MiKQ0K
PiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPj4NCj4gPiA+PiBUaGUgYXBwcm9hY2ggaW4gdGhpcyBwYXRjaCBkb24ndCBzb2x2
ZSB0aGUgcHJvYmxlbSwgYXQgbGVhc3Qgb24gUlovRzNTLiBTZWUgWzFdIGZvciBsb2dzLg0KPiA+
ID4+DQo+ID4gPj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2ggb24gbmV4dC0yMDI2MDYxMDoNCj4gPiA+
Pg0KPiA+ID4+IGdpdCBsb2cgLS1vbmVsaW5lIC0yDQo+ID4gPj4gYWZlMDlmMTFkNTQ5IChIRUFE
KSBwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjMtdXNiMjogRml4IGRldm0NCj4gPiA+PiBhY3Rp
b24gcmVnaXN0cmF0aW9uIGZvciBkaXNhYmxlZCBWQlVTIHJlZ3VsYXRvcg0KPiA+ID4+IGFiZTY1
MTgzN2NiMyAodGFnOiBuZXh0LTIwMjYwNjEwLCBsaW51eC1uZXh0L21hc3RlcikgQWRkIGxpbnV4
LW5leHQNCj4gPiA+PiBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNjA2MTANCj4gPiA+Pg0KPiA+ID4+
IFsxXQ0KPiA+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jbGF1ZGl1YmV6bmVhL2xvZ3MvYmxvYi8y
ZjFiYWIyMDQwN2RmZTYwMzEzODU4MTkNCj4gPiA+PiBmZg0KPiA+ID4+IGVhYmZjNGVhYzc3MmJk
L2xvZ3MNCj4gPiA+DQo+ID4gPiBJIGhhdmUgdGVzdGVkIG9ubHkgd2l0aCBSWi9HM0wgaG9zdCBh
bmQgSSBkb24ndCBzZWUgdGhlIGlzc3VlLg0KPiA+ID4gSG93IGNhbiB0aGUgaXNzdWUgYmUgcmVw
cm9kdWNlZD8gSXQgY291bGQgYmUgcmVsYXRlZCB0byBSWi9HM1MuDQo+ID4NCj4gPiBJdCdzIHJl
cHJvZHVjaWJsZSB3aXRoIHRoaXMgcGF0Y2ggb24gRzJMIGFzIHdlbGwsIHBsZWFzZSBzZWUNCj4g
PiBodHRwczovL2dpdGh1Yi5jb20vY2xhdWRpdWJlem5lYS9sb2dzL2Jsb2IvMDYwMTA0NDkwM2I1
YWU3MTQ1OTJkYjk3NzBiYzRlZDMxZmQ4YmY4NC9sb2dzLg0KPiA+DQo+ID4gPiBJIGhhdmUgZXhl
Y3V0ZWQgdGhlIGZvbGxvd2luZyB0ZXN0cyBhbmQgZG9uJ3Qgc2VlIGFueSBpc3N1ZS4NCj4gPiA+
IENhbiB5b3UgcGxlYXNlIHRyeSB0aGUgc2FtZSB0ZXN0cyBvbiBSWi9HM1M/DQo+ID4NCj4gPiBU
cnkgc3RyZXNzaW5nIGl0IGEgYml0LCBlLmcuIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB0cmlnZ2Vy
IGl0IG9uIGJvdGggRzNTIGFuZCBHMkw6DQo+IA0KPiBJdCBpcyBub3RoaW5nIHJlbGF0ZWQgdG8g
c3RyZXNzLCBpdCBpcyBqdXN0IGVuYWJsZV9jb3VudCBpc3N1ZS4NCj4gVXNiIGZ1bmN0aW9uIGlu
Y3JlbWVudHMgdGhlIGVuYWJsZSBjb3VudCBvZiByZWd1bGF0b3IsIHdoaWNoIGl0IG5ldmVyIGRl
Y3JlbWVudCBMZWFkaW5nIHRvDQo+IFdBUk5fT04oZW5hYmxlX2NvdW50KSBkdXJpbmcgdW5iaW5k
Lg0KPiANCj4gPg0KPiA+IGNudD0zMDA7IHdoaWxlIFsgJGNudCAtZ2UgMCBdOyBkbyBlY2hvIDEx
YzQwMDAwLnVzYnBoeS1jdHJsID4gdW5iaW5kIDsNCj4gPiBlY2hvIDExYzQwMDAwLnVzYnBoeS1j
dHJsID4gYmluZCA7IGNudD0kKChjbnQtMSkpOyBkb25lDQo+ID4NCj4gPiBTYW1lIGNvbW1hbmQg
Y291bGQgYmUgZXhlY3V0ZWQgZm9yIG90aGVyIFVTQiBkcml2ZXJzLg0KPiA+DQo+ID4gPiBJcyB1
bmJpbmQvYmluZCBldmVyIHdvcmtlZCBvbiBSWj9HM1MgcHJldmlvdXNseT8NCj4gPg0KPiA+IElu
IHRoZSBzYW1lIHdheSBpdCB3b3JrcyBvbiBHMkw6IGZ1bmN0aW9uYWxpdHkgaXMgT0ssIHRoZXNl
IHN0YWNrDQo+ID4gdHJhY2VzIGFyZSBkaXNwbGF5ZWQgYXMgb24gYW55IG90aGVyIFJaL0cyTCBi
YXNlZCBTb0NzLg0KPiANCj4gSSBoYXZlIGlkZW50aWZpZWQgdGhlIGlzc3VlLCBpdCBpcyBVU0Ig
ZnVuY3Rpb24gcmVsYXRlZC4NCj4gDQo+IEkgYW0gaW52ZXN0aWdhdGluZyB0aGUgZml4LCB3aGlj
aCB3aWxsIGZpeCBmb3IgYWxsIHBsYXRmb3Jtcy4NCg0KVGhlIGlzc3VlIHlvdSBzYXcgb24gUlov
RzNTIGlzDQoNCnVzYmhzX3BsYXRmb3JtX2NhbGwocHJpdiwgaGFyZHdhcmVfZXhpdCwgcGRldikg
aXMgY2FsbGVkIGJlZm9yZQ0KdXNiaHNjX3Bvd2VyX2N0cmwocHJpdiwgMCk7DQoNClRoZSBmb3Jt
ZXIgTnVsbGlmeSB0aGUgUEhZIHBvaW50ZXIgYW5kIGxhdGVyIGRvZXMgbm90IGNhbGwNCnBoeV9w
b3dlcl9vZmYocHJpdi0+cGh5KSB0byBkZWNyZW1lbnQgdGhlIHJlZ3VsYXRvci4NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQoNCg==

