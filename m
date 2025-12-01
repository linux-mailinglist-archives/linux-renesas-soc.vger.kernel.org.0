Return-Path: <linux-renesas-soc+bounces-25449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B464C978B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 14:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 331D74E18A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 13:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85239313266;
	Mon,  1 Dec 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M5ymnObo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916D3128B1;
	Mon,  1 Dec 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764595055; cv=fail; b=kgmXAb9CXSix2+NW3vyNSqOkQbCkjB6liBldL2lAd7e0ekik90XRU0hwUFmqzYC4H2qYosc7yREf5uev5sAeJ37B+p4JTTU3LrVBjgZzOYpV70A6hG3qzrtEiSG0zrrqFQMYdgnVcbUlPhlMRIOz1b+0V4UDxMLuZD3Vra2ov4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764595055; c=relaxed/simple;
	bh=9CCHuYSauwFpatua6jND/UszLbdsp5RC5FcQ6hnrsW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dJ/OxGeoM2/nZXSACXwJG36UjBh/vW/1GaDksUzgtAgSBaPrOwV47uRIvYqMnnDQHIYpft5O6XSbKFl4xg+SL+ypzG3m3gVciLfWreBHiZG2UqckwFGMkxCJRFPIfE49iWxhKU3isCWtmfmoBl/Y3y1LOAyQM4o3pDSUDlYn/Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M5ymnObo; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFUxgb3VSFc8RliDor9NIt9upY2eAb3IAjUbqrL8/3G3z70T4ldFQe48U2+D5RgyqTWUXZtjiWwASaj3iFRxjXl0xG9koPyykN8L1+ueJCANGIoOfKU7FGC8PQqwWWYDSSZLjIGTf4Ja8/kh9eIoChykM7qVUg+MDC9Upt+xLKA84JDqXOQOfZdjmkl7VWeFX6YPRE9IIySK9sHdNz9LagPmEumeEAOXuJnEUghsd0OXRh+DxiJqeH35DtxvBDY36vYWUeLVZKPbAKIJFL0cCQnK0O+xjzKTxM8oYn3UYIaRKzD+wjuEoH87j8kxGVGhrQvzMFNaDymfw4Vy9H0aFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CCHuYSauwFpatua6jND/UszLbdsp5RC5FcQ6hnrsW8=;
 b=DuWimfiEpYDUzeyr2LO/ONTp/Ao28DN8MFXn5eez6uN2y47KnQ2w/EoLTmWdDkSfVT3YKIYNY9kblL6slQVhOR5RWWnjkMsCP8UAyawhDgpi5WARL8vI0JJJuCskS8hJSOr+kGC8gZK1wwPo1pt9lmcxGykZ+yiTh98yMmihehxkoLlUAXYQR2j80QRZRUHaHGmfk1FA8X6PLgY2pwfadltYDS7O/YbEpTYFa6A3gPvkXjGvmd2kmWm0uKcNJlnhHRz2RThDuTWjurDV6a3z+EgtqOj4mB5dsSm0DFbamBopS8ju/pTHVC5LqCYBeRBsU7yk9Zdgb5DT4wU6h4f9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CCHuYSauwFpatua6jND/UszLbdsp5RC5FcQ6hnrsW8=;
 b=M5ymnOboL650oALfAgCVM/hODd1kZlDTJeqYRB6cJ8OszjK9ASa7nlbUgBXHoalCL8hpgAmGECHGbUi9y+b0jXkidD9S9D6ZdFau///czP3Bf+zFFYY9FpfxjUmINF6oLHY4yt42/gwwIHhX+0WipML4WWazufi21qGwqHYyJvQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9794.jpnprd01.prod.outlook.com (2603:1096:400:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 1 Dec
 2025 13:17:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Mon, 1 Dec 2025
 13:17:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Topic: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Index: AQHcYr6LYTcT8lhXR0OypeESa6beirUMwsBw
Date: Mon, 1 Dec 2025 13:17:26 +0000
Message-ID:
 <TY3PR01MB11346F6A9485A334E8BAAD0E586DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
In-Reply-To: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9794:EE_
x-ms-office365-filtering-correlation-id: e10888a4-2110-4be9-9768-08de30dbf89e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QTFXLzNqRzk5enJtTXdnVk50MU9WbDUzLzBDNHlWckpNUklOWWVqTlBlZ1Nn?=
 =?utf-8?B?c3FmYnBVVEFvY0RJUVpjNVozOG00dmxRWVdJS2pROUMwSTEyaWJjQndkRkY4?=
 =?utf-8?B?aHcyMmhqaXZ5VS9ZQys4Q2NINSt6ZnRFbXBHTFVydGY1VXBHZzZHVGJ4b1NO?=
 =?utf-8?B?NExLZWxxY2VKbXVkdnBqVng5MWl3amNBeXh5dmpJQnhYdUN4TVVrVlI3RFdh?=
 =?utf-8?B?RHdDMkpKU1dmT2REV1FTcm85RGZKcW1lZVNmd2wvU21jbVVtaW1RVGNTNG0z?=
 =?utf-8?B?ckRWQ1RERlcxSFVUQWthNURKWFQxNEZhZUhsWExTNTZ6ZGpWWUZ4SE9kdm5I?=
 =?utf-8?B?Mis2MzdVZkRjZnNsaVRZd3Y5eGJpZEJIczQ3VXBBM0lBVzREL0JVdmlHbTM4?=
 =?utf-8?B?cHFWZlBweG5PZEJodWhZQUpSR3d3NzZoS0xhenZYY2dhdzdwSWNRTnUxY284?=
 =?utf-8?B?eDEyZ0RYZ25pMnI1UmFZbFlxN2FBMUdJbGJBTjFBeUM0LzBleW14UWgzc3dL?=
 =?utf-8?B?c3h4alR0dDZOQU9QMFBubDQ4NXVPSDBCT0c2UEV0N0FadkNzVVZtVnlqUzVW?=
 =?utf-8?B?NmVnRGZKQXdUN0toM29zNU5sUCtkOGlKb2hjMG9OT2lrV05zNzF5WkszMnVC?=
 =?utf-8?B?SmxFS2dXMTZUVVF1Sjd5bjUzZ3pUcGJkZkxZdmE5d0xEekhudU5NM2dVR1Mr?=
 =?utf-8?B?ckx2SWZVNzdBM0w4L3hjd1MwRkFkUHVoeGFyZytVMDk2eU5PR0h6ZWhXcXA3?=
 =?utf-8?B?cUZNZnJicndQNlRwdTB6R3hnTUo3OEMxSDlWSmRla1VBb1JXSjlwcXpPbmJC?=
 =?utf-8?B?SWJvL3VYSzNtdkY3NUFaYUpxMlRTU0hwMjVRcURWelRES05KYkZHMW9wU3FI?=
 =?utf-8?B?UHBPdkJYa2k0dWRGZWIxRE8zV1FWL2ppeHV0ZHVsRkJTVFVLcjdsclJtOCtK?=
 =?utf-8?B?V1FnT29JOXB0MXRKRHY5eXBNYUdoRThhL2pGSU1XSDduRmhYaGprMVp4SFF5?=
 =?utf-8?B?QWJaTW5SWk9nRXNTMk5pQzVJRnM3VUozNXRFc21Obm1GYlR5OC9ab1JhRHFi?=
 =?utf-8?B?OWNGdnBaZm1QT2FoVTVucjZycXlUZHFzZDBKUkhDblczc3JHelNKaVI2akZY?=
 =?utf-8?B?S3BoK0FGdTRMcEVmUnh6V1RDK0ZadDJxcGVjNTFFeTNZWUJxTVJFdm5yU2Jx?=
 =?utf-8?B?ZjN0V1RnZkRGV3pGMWxPdDYrQkdma1FuLzR2bFpCbjdJL0k4WTFkR1prcDJP?=
 =?utf-8?B?NHBndjNrNzRmT1JQaVZjL2R5S01sYlZiMEx5VHlMVFg1N25IcG5OVThaZjJY?=
 =?utf-8?B?N0FuMitJeFlIOERHblNuUVQvbGJRM3VCcjFmTktCNmU2eGdvUXRSWkV5STZS?=
 =?utf-8?B?cFRtbFEwOS9OWjJsVTg5MFVDNW51cy9nMVJBSWdaWXo4bG44QUdIWmhFTXky?=
 =?utf-8?B?eUNNa3cyMk56Z0VTUG05OW9xTTNDSzRzZm9jQ0hPWFRrd21IZnpnZlpNb2pI?=
 =?utf-8?B?N0lUaWlTcStxN3plb3NhcDZMeWhrNm53VEZlWEZoSVBpRnNGOFF3dDk5djVm?=
 =?utf-8?B?MDcwOHhTYlMrOTl6ajY4VUROSGs1aWdOWERnUUI4UURYd0c5R016VjgyTktV?=
 =?utf-8?B?bERUODdIdW1GcnE4WXlwRy9iMHpiL2pGekQvQVFZemVGUXN5cHZWb2RaRzZM?=
 =?utf-8?B?TzQ2RFhyWnhWWXlhN1NSbnNnbFRselkwbDdGWmE3Z1RFQTZraGVGbzJmQ2Jv?=
 =?utf-8?B?dXpTWjNqVmNGaFUzd21JUlk5Slhvc3Z6Zi9qaDRhTGYwbUpmbkVNY3k0OTR3?=
 =?utf-8?B?RjV2SEVkeDRQNktkZXdlZ1QzaWFSbk9rZGxJVHlHZ3dna0JITWhlYjNzYVpw?=
 =?utf-8?B?aUcweFlWaWsycFVhcTgrRnNRZjFOWGNKSjV4WmlieE96K0RxOTh5V0lXZDY0?=
 =?utf-8?B?QzhjcCtyWEZQRDkyNG5RZ0lRcEFpeXpCMlRKV1NrdmlsSVBkYWk5RGkrM0Nx?=
 =?utf-8?B?RldGS2VSb3I5d3d6VjFrNHBzazlyQTVYRGxoZzdxV1JBbUJmaFhuSFlYMGZ0?=
 =?utf-8?Q?M1Cuju?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnB6ekxEVTVHc1kzc3RGVGtJeGR6QU12VjVBZzU3S2oxbTNqeUxXMFhYRU16?=
 =?utf-8?B?aDAweUtGT1BHekxGT1J1K2srMHJhWVQyaDBaWUpibnppV25uNDFQRmZUUm1p?=
 =?utf-8?B?NC9CQlBtak9ZTGl1azU5Mm5VT0ZQcXBwUnNOWHZNbjFJdmxlQW5yaFNpS3A4?=
 =?utf-8?B?VUpTU09xbXR5UGFVa3pRSUVWMGZFd012STZKcVhZZjh1MkZhODhWaFNpam5R?=
 =?utf-8?B?Qm9iUm5vdFBjK2VZSXNZZXRHaTdBNUM1QUNkcGp5a2wvdFEyK0hhR1pZbTU0?=
 =?utf-8?B?S0lZc05pTFlJemkrK21hcEtISDRRTHhvZnJMVWd1Tno5YVR6QWg2SVcyOTg1?=
 =?utf-8?B?ck5aOTF2cWVaUnRMRHNLa0EraDdHYXhvS0FJUWZFNDVJWGVSRW1ZbW9VR3lD?=
 =?utf-8?B?YzVxU3VsSDRHSXNmVHROaFNBR2xTMHVNYWlSZy9BVCs4SWpTQlBsQWFHWnhE?=
 =?utf-8?B?Tm1Md0lQdVNpSmRoMkQzNFFITDNsT2sxZUl2TUtQOTZOUEFaRUkrK1pFN2E1?=
 =?utf-8?B?M2tPclJpSk05NUU3bkVxNnhVWDM2Nk1CZWJXKytmY0hjL1oxU2dHV0pXaHBm?=
 =?utf-8?B?RDBlZERQQy9ZcCtxbWJnQUZrYmUxRTFpd0w3UFFFNXprU0VhdzkyMS9IaDFU?=
 =?utf-8?B?UnF0RUl0eUtPb0k5L3BjT09jeE5sNDRPU1VtSlMyTkV3MVN1RFlaME5ZVFoy?=
 =?utf-8?B?UGluU1ZUNlB3eU1LTUM5MDBjWDhra2VHZnYyNDhhVTJ5Y3BEejlkbnhydmZC?=
 =?utf-8?B?OVQrNHNWYm5MdmNiYngwQ21vQlJobmdNaklXUlIvL3pnM3Uwb3Fsc2ZMQXl2?=
 =?utf-8?B?dE9aUDBVLy91bUN2UkNaazdmM01KdEZFWXVrYmJkUnJuNVNvaGpNOGxlSVdH?=
 =?utf-8?B?YXZGK0V0UXQxc0ZGTnlxL1Rsc0NNWnFvSy9YdEFpQUFFTWY1Y0xWaDU5cnor?=
 =?utf-8?B?QjFlWUFRWVliK1JtYzZkVVJaTzZ5SG1wcldCZitOT1h3L2hUb0FINVE0UzFI?=
 =?utf-8?B?Zk1xQ1BvaDhVVVF2M095TXBBdXZvc2huZ09WRUhzWkpiQlRFUk1oSG1VNXo1?=
 =?utf-8?B?R3BrNmxrcFh3V0Z6bFRzSWdZeGFoeWsrc1NVTVo4R0djRWpXN1IxTStYa0Zk?=
 =?utf-8?B?NG1mdFlRRWtUcDl3dXdMSkt1TndXRDFCZWQwemtvRWg1L2VpYnR2ZWFJK1Fi?=
 =?utf-8?B?K0pmc2Rod01JQmIycW0yd3Q4elNrSFExWW1CelVGZC9ZeXptd0UvV3hvb1J0?=
 =?utf-8?B?OG5maTYzUzZEWkdwcnhNME9sTmQ1bmtEVU04U0JSUW1WTnNFaXAvakVyT0Ew?=
 =?utf-8?B?RDZSVFN0S0wwZkdUOWRUdytlaGZsMUI0a3ROZzNhajFqTWQxcTV0dm1mbGVZ?=
 =?utf-8?B?MXI5eGNpbEt6bFBaOUlaMlcrOHpLbkVXbkc1SXBnQnE0UVFtcytuN0NWTmlE?=
 =?utf-8?B?aWU3d0tUeGhUU1VsaGZwcVo0akNWQm8rems5NFZZTGJhVEJGSzRnV1ZLRGJO?=
 =?utf-8?B?Q0kyZk1HZUlBTW5US1RDYm5BbmgyWjllb2lLUHQ3Yk9JV0E1RnJjYm9sRHdB?=
 =?utf-8?B?SFhlMTFiOUd3cHNIWWpTRFVjZjExcExVMDlGRFFmOHcwTlFuc0x0K2Rxblkw?=
 =?utf-8?B?ektuc1ZHSXBWQ3VCa0xQOThPSzUwbWhBV3gyMXI3Q0hRdXFESm1QN2VsNWsr?=
 =?utf-8?B?SWl0NlhDenBwTlBaalhvN1dwY2VnZmFrZnFzVVI3dFFKbCtjVDY5OFpNWlc5?=
 =?utf-8?B?T2pOREJSK3dvWXczVUVhOFlDYlY5SGJ1VTFVMzRFMWR4RFVSa2lMcFkzWjI0?=
 =?utf-8?B?U0FudGVXdUR6d2ZjUGhKM3lEVFFiNEl6NVM1NHYrSnV2RDBrOGFlK0k5cEVh?=
 =?utf-8?B?aGJaYnVHZTNyVFAxTHJKcDZGRzJ1N1FHUnE2UXpBWFpiK21PSUNCK25tY3pH?=
 =?utf-8?B?N2RlWkE5T1pHMmVmZlNZVXQraXo5a2lucHhlc0Q4WHhPcC9kZVZUMFQxTTh3?=
 =?utf-8?B?NUZCdFlKNlA0eDNUQ2NieVhhZm9ORUFnT0NiQ0c4V0ZBRGtkZmVZZ1dUM1oy?=
 =?utf-8?B?YmFmWXJTVE4yQzJLWXBHOGRjNVVpbUNRQVl0K0Vxd00wUzNSVTIzaVFGOUZo?=
 =?utf-8?B?YW5lWkdmclNwYVZmSDJ2emdGZzBuUXF6TXZUTUF2cCtkZWtFTDZlQTY0dG1p?=
 =?utf-8?B?Q2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e10888a4-2110-4be9-9768-08de30dbf89e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:17:26.0186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8VEIPrZ7T23gUiz+0M8XJW2hs0CZBbf70K7DQB/13JSdhgJn7xnfe2WM14JtEV3nsUoArnei3QhjtxGk/G2oepwh24cCCXu2nkaYMJKBec0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9794

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+DQo+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjUgMTI6MzENCj4gU3Vi
amVjdDogW1BBVENIIHYyIDAvMl0gbW1jOiBob3N0OiByZW5lc2FzX3NkaGlfY29yZTogc3VwcG9y
dCBjb25maWd1cmluZyBhbiBvcHRpb25hbCBzZGlvIG11eA0KPiANCj4gU29tZSBSZW5lc2FzIFNv
QyBiYXNlZCBib2FyZHMgbXV4IFNEIGFuZCBlTU1DIG9uIGEgc2luZ2xlIHNkaW8gY29udHJvbGxl
ciwgZXhwb3NpbmcgdXNlciBjb250cm9sIGJ5DQo+IGRpcCBzd2l0Y2ggYW5kIHNvZnR3YXJlIGNv
bnRyb2wgYnkgZ3Bpby4NCj4gDQo+IFB1cnBvc2UgaXMgdG8gc2ltcGxpZnkgZGV2ZWxvcG1lbnQg
YW5kIHByb3Zpc2lvbmluZyBieSBzZWxlY3RpbmcgYm9vdCBtZWRpYSBhdCBwb3dlci1vbiwgYW5k
IGFnYWluDQo+IGJlZm9yZSBzdGFydGluZyBsaW51eC4NCg0KRG9lcyBpdCBtZWFuLCB5b3UgYm9v
dCB3aXRoIGVTRCBtb2RlLCBib290IHRoZSBsaW51eCB3aXRoIFNEIG1vZGUgYW5kIGZsYXNoIHRo
ZSBpbWFnZSB0byBlTU1DPz8NCg0KYW5kIHRoZW4sIHN3aXRjaCB0byBlTU1DIGJvb3QgbW9kZSBh
bmQgYm9vdCBldmVyeXRoaW5nIGZyb20gZU1NQz8/DQoNCg0KT3INCg0KYm9vdCB3aXRoIGVTRCBt
b2RlLCBmbGFzaCBlbW1jIGltYWdlcyBhdCBpbml0cmFtZnMgbGV2ZWwvdS1ib290IGxldmVsDQoN
CmFuZCB0aGVuLCBzd2l0Y2ggdG8gZU1NQyBib290IG1vZGUgYW5kIGJvb3QgZXZlcnl0aGluZyBm
cm9tIGVNTUM/Pw0KDQoNCkNoZWVycywNCkJpanUNCg0K

