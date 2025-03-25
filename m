Return-Path: <linux-renesas-soc+bounces-14802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB535A70559
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C351886516
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 15:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCFD1EB5E2;
	Tue, 25 Mar 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D/4MVZDQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5A1A316E;
	Tue, 25 Mar 2025 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742917428; cv=fail; b=M5hvmXkLU/JIm6d1XKb23xu0ZXywxreI2mTHVG82/kPSALiZEdKaUzV+ejcoqNbkN8AYetifulgYZXY5YyN3fgutGnsB4NtH/9HR1y2UnQmpuUju1oNefcwIwJMNl/e3v0KN6koVoE01NGPYHq1Ie2w+G8jKcUmSYfg3FwIr96o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742917428; c=relaxed/simple;
	bh=+xrrjUPQaGiqsdlNhae7okG8puF1T1ezkxNi6Po7gGY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aFWbBVgmCy0v4wlOd6F1TCie1rBRx9DRQYiiTpjAFCGWyPO9LERDIiHDoVHjUSQP3esbAXMZ2pnQurRCjY4ZOs2Qrvevr5f+Ya0ujoeBDgGeBT5txhdJYzKGGbx206aQi+HeeuLh65fYu7DL/OVXzN/4RwBUvJpEvQCEga2vTKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D/4MVZDQ; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CU0uL+PnBo0zGWao5V76MpuHbcB5hdJ9ZUaZLPwou02wKM+C7cHOOsE+yXU5q2U9LJG6ffwAqgrKaSKphK8tNt1yY1EUWsqNXJOtu0IRX2kyOWjTHaooouqEvIU61pUfqO7r4Q2qrZNaeqeVFqJdI5jNlbYFbPSjhek6nypGW30FmJXYZHfwjmprMg/QEFpfVugBY5NCteosereAL4ksF1sOEmL2k6aAQP8QiislfGGHIOMXHEWnFaHYi9Tpc2oD0x94FfgVk/liFZ+BKXy6JNHfmYhvedZ0JJVD8n9b71ysaD1ps8iKWBtwjy5HOEgT9w37OJ1qZsbXjJ9Ht5x1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xrrjUPQaGiqsdlNhae7okG8puF1T1ezkxNi6Po7gGY=;
 b=klCCVUFj4zibnZ2gD73D5GaVozr9Ks7+zrCKwdztaXZ+6Or89VdTtcLtstros2ldDYoHYC2TvMHGEK3O/mQmMFSDtaav/oVSgJYDr6V3QtfgLbKSydekQWclTmhTEFqzt+8Rf/ZubVN9EYk3IPdViHhoeETmlviU6dcxVUaFbfZ2mVPCtTQH1OdnSZj2f+kEx5n85tM39SGOyz0NSc8Eq/Q4FTN2S561+e1LP7S/72z9gvJAH1FySgWcuSAC6gdKbEK2pe83q3xABmVM1/pzxCh1PSoN/gCzNXuD/YkNTVgUNAW9S1kZddpxPMnDMkWCUKV5Yf3dszJIKrISHar5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xrrjUPQaGiqsdlNhae7okG8puF1T1ezkxNi6Po7gGY=;
 b=D/4MVZDQ8Rq7V+v+7pFEPJaUzHCPGy0bBiYIaCOy5wbI6YK0j2dNEzDpAetTTgocfIk6d93BQyFAReC6JxUqNM4FeApfYKqVqLfhp7O4toU/ORbdi3ojAT4xfcSxfuAbjcYy9OLB9lgPGQjmt7ujVnzflJE0Z8X/CwwQXLLL6Do=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12399.jpnprd01.prod.outlook.com (2603:1096:405:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:43:40 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:43:39 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Prabhakar
	<prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Chris Paterson
	<Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Index:
 AQHbjcumAKkaq95VEEiIxX0Tw+LMrrNwypcAgAAaTMCAADDqgIAHvOcQgAtCfwCAAAfKUA==
Date: Tue, 25 Mar 2025 15:43:39 +0000
Message-ID:
 <TYCPR01MB120937131DE070FC67C96825FC2A72@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
	 <TY3PR01MB12089B78E1DE163B740A51134C2D32@TY3PR01MB12089.jpnprd01.prod.outlook.com>
	 <c27ab4ca4563d20a73ffc8a577f960fe59ffa88f.camel@pengutronix.de>
	 <TYCPR01MB12093DB963348A8FD58409E5AC2DE2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
 <ce3426b50a2593c23052b83848e95db8e49fdb8a.camel@pengutronix.de>
In-Reply-To: <ce3426b50a2593c23052b83848e95db8e49fdb8a.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12399:EE_
x-ms-office365-filtering-correlation-id: c493493d-6d71-45f6-703c-08dd6bb3d036
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WE9UTXdJYTkwMnFFOWc1aXJDYktFR1NUVlBFRVd1VW9FT1Nld3RyU0VOU3I2?=
 =?utf-8?B?MmFWWjVHeTBVRUcycVcwWTFZOHhydC9PdDlOVlFNeWVHUGlYY0llNjZ2TkV0?=
 =?utf-8?B?Vi96akJHZHlEVXJXMkp3KzY5UFlOZVFINUZVdnBXZkcvaklBK0VqZUt2NjVV?=
 =?utf-8?B?M2c0VUxrSkN1aFQrTnpGR00zc3ZzeGJzVHFVL0lDWmFOMHNGbXRIV29EMmFR?=
 =?utf-8?B?ZVl0dkFLc1VuZDFVOXR4cUdXdklzaGpXVGRQQkt0UCtQYlB2SVRQelVtSUtV?=
 =?utf-8?B?bnZPRlY1VG5WYnJXT293d1B2TDJOOFpTQVpQOWxVMTRiL09oaXhLVWVUTUI0?=
 =?utf-8?B?MEp3L2hmR3VQOUl2NDU3N2NPU29VOFUyR0pabVlzN1MvUDkvbUhsWjd0Rmg4?=
 =?utf-8?B?UjB0WlhWSmY0VkRSN3RHc2VXNDM0MVZJbHVXejE3K1BzOVp2bzhuK0lXK01h?=
 =?utf-8?B?UjlpY2QzTk42dzZCRHZkcFpZTlpPWkw4ZlJ5a0VrSzRmeUxhNm44ZVA0TVRl?=
 =?utf-8?B?bWxDMW9XSm9ZMGt4MHNNMUxZSytwVktQQmdqZGJkWXA1dWVjUVNpSU42MXdV?=
 =?utf-8?B?aFJDeVlnR2pzeDFoZnBvbTluNTVYMmZmQkhmdGdMK29rTnczWlVVYXVDa2Zj?=
 =?utf-8?B?ZXNaK0RzaXZrLzQvTmNUaW5HOVdDd09scnBKSHdEbk1mMmJDcHJnVVFOWFg0?=
 =?utf-8?B?L1ZScG9YR3hENkVQSGVkZ1lUU2lHeHdsYXdZcXFYbjk4V20zemJxZmhMTjBs?=
 =?utf-8?B?TU1ZY0N0WGxhRzBFUTkyR2FKWDhhK0xzKzliR0tuZTJkQzh3WDNmcXZNUW9Y?=
 =?utf-8?B?OWpIaE4vdzU0TkNQRDNlWHN6YkVzeUpkRS84Z1RVV1lFbzN2TGtOM1VGN09o?=
 =?utf-8?B?MGRYUGYxZHg1NUs3QWNEdmkrZ0xIS0tvaVUveTh2MmVremd1K3Q4d1pPWmkr?=
 =?utf-8?B?bmZjc0N4NG5wZkFvNloxdDVhSGpWbkVlMEdDUVIxL3hHYmpjTXZwR1NlbStt?=
 =?utf-8?B?QkpRckxoS3hnSTVDemUrM2VSWnJlUFptVTZ1alFLZjV6Y0YzRU5peVY2M1Nl?=
 =?utf-8?B?WmhzRTUzR25HSjJITXdhVDJmVXlubWZLUWEvWUdqUy9EeGp3QitzQlJXMzJm?=
 =?utf-8?B?TUFhUHNCL2czdVNqZjlFcUd2d3pOZW9yK2NCYTh4OGRYUXBXcy9TMWM5ZDJv?=
 =?utf-8?B?ME1mai9vdDBRS3hZcHpSZ2o2bTdCVUIzMExvSG9KYzIyRk8xSzBKK2pFWGFF?=
 =?utf-8?B?TkNxTlRJMktpSzdtWk5Ha0Vma3kwM0toMnFMRW50RUozQmpscEFqdDYzV1Bu?=
 =?utf-8?B?L09SYzF2VTAzS0szNnR6QXZaSzh6WmRWVFdOcnVnelpTZmNJK1NHS2NBNGpm?=
 =?utf-8?B?WCtuRk11U2s0cU1HMEdPV3BGYkpjbk9MdGVBVUZzNEcxaFpHT1RwbHBwVmdF?=
 =?utf-8?B?ckRDTFB5S1N4TjF3clV0dThNQ2FpODViN1BpTjhBK21zSnNmY0ZsTXVPenZi?=
 =?utf-8?B?OFY2V0tZNUQ0ek1iSGxxWG5JV01lUHZWak51REowRGJ0TXRWT2cvMzR5Z0hp?=
 =?utf-8?B?VDBkbmVXUVkvZ3NrTWhQbzc1Y0RsaTl2VGNaU3JtODUxRnhHZ1l6RFpJTFlu?=
 =?utf-8?B?VU11RGZueHJYZFMxaFcveDcybmpwcjNBN3k0M2FnQ3g0L2tIQkxEMFVUWGYx?=
 =?utf-8?B?S05YRlNLSDNrM2NsUUNtVlI0ZjdxMTNML29ZRDJFcnFlS0ZoanZtY2tSODRV?=
 =?utf-8?B?WUpKZTVRWEtJeGR3U0xDL3NMQ2RqOVV1WEY2TlJuV1BheVI5NHV4Z3VzdG4w?=
 =?utf-8?B?L1NBTTdsYW5RaFU5ay8rN3VHTGtKb3BxZklBZ1VBMUhNSzZmTE8wUEJlK0dQ?=
 =?utf-8?B?bE56Q0hsQjdmc2lybVNtbUF1Wms3MGJRR2o2WWV0ZWViY0NpSFdzdkhLV21Y?=
 =?utf-8?Q?Mlak1kfVfwKHAVY/H+hss3qgNjs6ksvS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlFWSDdybVVwc3dsMDNxS2JwQit2S0xYZTlqOERQUU5KN0ZwaGlIakE4SW5a?=
 =?utf-8?B?cHZvNXJsWDFvQ25xUVBEZms1d09IaU0vaHd4YWtmWXBOMWRsUmtUQ1ZuUzBF?=
 =?utf-8?B?d0lMbEdXN2NTYzAybHR6b1J4Y3RVV1hFWFU2bVVvbVFOeit0TFd4a2FCSmc2?=
 =?utf-8?B?T0F5UlBsYTUreWlEeDVJWi82bDRmMG1XZEdiL0xuSUxQMFBVb05uL01oeklt?=
 =?utf-8?B?R1lUUWpGOWZKcGptcmQ5UGJ2eW0wZFVJdTZ0QWI5cFVkcEd1eUtqU1doNDRL?=
 =?utf-8?B?UURYaTgwL0ZIbFgxMXF1bFUvOW9GdExIUTl0UlNzQWVxUUcyRFZLSHg2dmdw?=
 =?utf-8?B?SENIQVMxTmZJUjgzdzhyNjhqeXZvTGJxbHJCNEphT29FWTh6ajEvRFZSYUxO?=
 =?utf-8?B?WGpNQjh6Rjh6S0dnQzFBYTZUbi9KUklCUEZRTk5FMTg3bUc5S2UrVWFIMHAr?=
 =?utf-8?B?M01KUkc3eE5KUEw0UUJFay9FbHZmeUluVllYNTM0MDVENjVudlB5RkVGVGlt?=
 =?utf-8?B?SmQ2YnpNQ3JSRHRnWnV3cEs5cXdSczdmaEYvV3dzTmRKdmdzZnc0S1IvNDRU?=
 =?utf-8?B?ZWd2SHlnMDQyKy9zRE1lSjduZktwTC9MbFc2VGZmVisvQy9ia3dlaVpyNnc3?=
 =?utf-8?B?dGlPcUhiUnpJYzM5U2JxUG1QWGI0alhmdmY4SlVpdjdtQjF0cFhSMlBZY1B4?=
 =?utf-8?B?M01pT1F2TWdSdVZYWndvYmhCRkxwaVZSaSsvUVQyMGNhSWlyMHd4bTlVcFYz?=
 =?utf-8?B?SUhBaGN6UnNUUXF4TG5MN1pmVkhSaUx1TE5OL0FQSkZSNTVmaCtGZ0k3anc1?=
 =?utf-8?B?cGpjYWk2S0pxSmVucURWb2JRL1A0RG13T1plSGo2eVh6YWJkU0pmZkRWQUNK?=
 =?utf-8?B?TEdOVG5hYyt3aEJ2R3B0UmdpTWg2eVZUMm0wT2thbHc4bkVnclpNNTRoOHBM?=
 =?utf-8?B?UUt6dytwWVlnczdkWHMwTE5HUys3RjYzVUlwNlJmMmppcUgvL0xKWC81Tmxk?=
 =?utf-8?B?bkphRDB1UTRxOWR0Z09hTTZ1N085M3lGWllMQkI0MVNsNUZWRzZUWTBBQ1Vy?=
 =?utf-8?B?VDJoWHFGQVBaazhPQlNKOWJlWlZTbEFkWmJQMGZ6d3lGaE5YNHpsM3dvM0Er?=
 =?utf-8?B?OFJCcmJlM0NyaHllbkpOaGZjV1lHTGJJVnBvcFhsdG5sTE1Rd3hibzd2Wmxk?=
 =?utf-8?B?K3JaYnZSNkJxMkp4SFZncUkvTzJWRkdBaWFRNUZ2ejRpVkxGRUt3clJaaWdH?=
 =?utf-8?B?Q3daVk1BS3IzVmRlcU5CdUNHTHNVSGZIY3dlclUvdHR2S01DTGNCMG13dThM?=
 =?utf-8?B?SUsxY2lTYm5vS3NIRE9kemZmWHNTRGdlR3pqYmdIalJjSHBkSzhpazJaNG9D?=
 =?utf-8?B?YXZHWWRMbUdQZ3VTR283b1Joc0h5TGhPRko1V1AxQ21JL0tHdEp4Mmhyamoy?=
 =?utf-8?B?TGNyVmtJSnZlVjZpdGUyWU55U25KNDlOdnlHTUI3UTV5Mi9TWmJWbkNYZndE?=
 =?utf-8?B?SEJMeUVxaEp4blpTOWk3c0t1cjFtT0Q0VnNLZ0pHUU9qT2lhbGtlSzZlaGVM?=
 =?utf-8?B?K1Y5MitsN0NpblFhbkpqSmg5bjN5aFVleUh1dE1XcE00WWcyVWgzektxT09t?=
 =?utf-8?B?VHNNV1VqNG5iaVFQNkprOGVMb2FyMVVZbmVxUkpybUNtRnJxb2ZhNzZaT2Ew?=
 =?utf-8?B?MEtiSE5TYXVrc0NRRHF2T3UwbjhVeXBGcUNSRjd0MHdRbjVzbkhLOGl4QTVm?=
 =?utf-8?B?SmRQbDY1L2ExN1htSDNSdWJGY0MyUmNaM0dDUUhUQWV2RHN0ck80MGtCS3Vm?=
 =?utf-8?B?ZzYzZitxcHhNcE8wOHVZV1NJNlZFZXRYcURqOTRtSmRoWlI0Y1JNeDllM1Jo?=
 =?utf-8?B?STl5MVdEdHBUUkV6QTloelYvd3dnVnAzTWxtbUxPaXkzSUJRazdBYytkMXhZ?=
 =?utf-8?B?MlVQU1ZOeUJiVG9TSFFiZjFrekN2b0pucllJNjFFV2R5ZGN1TERrNWI1Y3Bv?=
 =?utf-8?B?Z3VNR0J2UWJjcnRMcm54U1k5UlNHODVtZjdPYnludkVTSkptWllvQ2ZBWVo5?=
 =?utf-8?B?Mk02L3ZPV1M1eFZWbFZkaW1PUlpZUlJ3aURJWHd2RUlOSWw4U3lMNWk1UTQ5?=
 =?utf-8?B?dDNvOVdsU0dJS24yZS9lenNFSUFKeXJOTTFsY0VzdXEyM2xvYUxDYUdHaGdo?=
 =?utf-8?B?NHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c493493d-6d71-45f6-703c-08dd6bb3d036
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 15:43:39.2921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mUNjNcQxZ+myJZo1Bzvef7mkLHngNLGF/8CMYzx+cVuL54Z2+5Y3TCJlU8OQpmUFs4g7xjNHl/1kCHeZpnVSL+DNFDV0Q6D9cRUJDCQcohU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12399

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IDI1IE1hcmNoIDIwMjUg
MTU6MTMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIHJlc2V0OiBBZGQgVVNCMlBIWSBj
b250cm9sIGRyaXZlciBmb3IgUmVuZXNhcyBSWi9WMkgoUCkNCj4gDQo+IEhpIEZhYnJpemlvLCBQ
cmFiaGFrYXIsDQo+IA0KPiBPbiBEaSwgMjAyNS0wMy0xOCBhdCAxMjozMSArMDAwMCwgRmFicml6
aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IEhpIFBoaWxpcHAsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlv
dXIgZmVlZGJhY2shDQo+ID4NCj4gPiA+IEZyb206IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+DQo+ID4gPiBTZW50OiAxMyBNYXJjaCAyMDI1IDEzOjA2DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gcmVzZXQ6IEFkZCBVU0IyUEhZIGNvbnRyb2wgZHJpdmVy
IGZvciBSZW5lc2FzIFJaL1YySChQKQ0KPiA+ID4NCj4gPiA+IEhpIEZhYnJpemlvLA0KPiA+ID4N
Cj4gPiA+IE9uIERvLCAyMDI1LTAzLTEzIGF0IDEwOjE0ICswMDAwLCBGYWJyaXppbyBDYXN0cm8g
d3JvdGU6DQo+ID4gPiA+IEhpIFBoaWxpcHAsDQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3Ig
eW91ciBmZWVkYmFjayENCj4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gPiA+IFNlbnQ6IDEzIE1hcmNoIDIwMjUgMDg6
MzcNCj4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gcmVzZXQ6IEFkZCBVU0Iy
UEhZIGNvbnRyb2wgZHJpdmVyIGZvciBSZW5lc2FzIFJaL1YySChQKQ0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gT24gTWksIDIwMjUtMDMtMDUgYXQgMTI6MzkgKzAwMDAsIFByYWJoYWthciB3cm90ZToN
Cj4gPiA+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBZGQgc3VwcG9ydCBm
b3IgdGhlIFVTQjJQSFkgY29udHJvbCBkcml2ZXIgb24gdGhlIFJlbmVzYXMgUlovVjJIKFApIFNv
Qy4NCj4gPiA+ID4gPiA+IE1ha2UgdGhlIGRyaXZlciBoYW5kbGUgcmVzZXQgYW5kIHBvd2VyLWRv
d24gb3BlcmF0aW9ucyBmb3IgdGhlIFVTQjJQSFkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
UGFzcyBPRiBkYXRhIHRvIHN1cHBvcnQgZnV0dXJlIFNvQ3Mgd2l0aCBzaW1pbGFyIFVTQjJQSFkg
aGFyZHdhcmUgYnV0DQo+ID4gPiA+ID4gPiBkaWZmZXJlbnQgcmVnaXN0ZXIgY29uZmlndXJhdGlv
bnMuIERlZmluZSBkZXZpY2Utc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24NCj4gPiA+ID4gPiA+IHZh
bHVlcyBhbmQgY29udHJvbCByZWdpc3RlciBzZXR0aW5ncyBpbiBPRiBkYXRhIHRvIGVuc3VyZSBm
bGV4aWJpbGl0eQ0KPiA+ID4gPiA+ID4gZm9yIHVwY29taW5nIFNvQ3MuDQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAg
ZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ID4gPiA+
ID4gPiAgZHJpdmVycy9yZXNldC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+
ID4gPiA+ID4gPiAgZHJpdmVycy9yZXNldC9yZXNldC1yenYyaC11c2IycGh5LWN0cmwuYyB8IDIy
MyArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MjMxIGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9yZXNldC9yZXNldC1yenYyaC11c2IycGh5LWN0cmwuYw0KPiA+ID4gPiA+ID4NCj4gPiA+IFsu
Li5dDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZXNldC1yenYyaC11
c2IycGh5LWN0cmwuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnp2MmgtdXNiMnBoeS0NCj4gY3Ry
bC5jDQo+ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5hNmRhZWFmMzdlMWMNCj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4g
PiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnp2MmgtdXNiMnBoeS1jdHJsLmMN
Cj4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsMjIzIEBADQo+ID4gPiBbLi4uXQ0KPiA+ID4gPiA+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgcnp2MmhfdXNiMnBoeV9yZWd2YWwgcnp2MmhfaW5pdF92YWxz
W10gPSB7DQo+ID4gPiA+ID4gPiArCXsgLnJlZyA9IDB4YzEwLCAudmFsID0gMHg2N2MgfSwNCj4g
PiA+ID4gPiA+ICsJeyAucmVnID0gMHhjMTQsIC52YWwgPSAweDFmIH0sDQo+ID4gPiA+ID4gPiAr
CXsgLnJlZyA9IDB4NjAwLCAudmFsID0gMHg5MDkgfSwNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdo
YXQgYXJlIHRoZXNlIHJlZ2lzdGVycyBhbmQgd2hhdCBhcmUgdGhvc2UgdmFsdWVzIGRvaW5nPw0K
PiA+ID4gPg0KPiA+ID4gPiBVbmZvcnR1bmF0ZWx5LCB0aGVyZSBhcmUgc29tZSBsaWNlbnNpbmcg
cmVzdHJpY3Rpb25zIG9uIHRoaXMgSVAsIHRoaXMgaXMNCj4gPiA+ID4gdGhlIGJlc3QgdGhhdCB3
ZSBjYW4gZG8sIGFzIHBlciB0aGUgbGljZW5zZSBhZ3JlZW1lbnQuDQo+ID4gPg0KPiA+ID4gSG93
IGFtIEkgZXhwZWN0ZWQgdG8gcmV2aWV3IHRoaXM/DQo+ID4gPg0KPiA+ID4gRm9yIG5vdywgSSds
bCBhc3N1bWUgdGhhdCB0aGVzZSByZWdpc3RlcnMgYXJlIG5vdCByZWxhdGVkIHRvIHJlc2V0DQo+
ID4gPiBmdW5jdGlvbmFsaXR5IGF0IGFsbCwgYW5kIHRoYXQgdGhpcyBkcml2ZXIgc2hvdWxkIGJl
IGEgcGh5IGNvbnRyb2xsZXINCj4gPiA+IGRyaXZlciBpbnN0ZWFkIG9mIGEgcmVzZXQgY29udHJv
bGxlciBkcml2ZXIuDQo+ID4gPg0KPiA+ID4gQ2FuIHlvdSBjb252aW5jZSBtZSBvdGhlcndpc2Ug
d2l0aG91dCBicmVha2luZyBsaWNlbnNlIGFncmVlbWVudHM/DQo+ID4NCj4gPiBTb3JyeSBhYm91
dCB0aGUgZGVsYXksIGFzIHlvdSBtYXkgaGF2ZSBmaWd1cmVkIG91dCwgd2UgaGFkIHRvIGRvdWJs
ZSBjaGVjayB3aXRoDQo+ID4gdGhlIExTSSB0ZWFtIGJlZm9yZSBtYWtpbmcgYW55IHN0YXRlbWVu
dC4NCj4gPg0KPiA+IFdlIGNhbiBjb25maXJtIHRoYXQgYHJ6djJoX2luaXRfdmFsc2AgY29udGFp
bnMgdGhlIHJlZ2lzdGVycyBhbmQgY29ycmVzcG9uZGluZw0KPiA+IGluaXRpYWxpemF0aW9uIHZh
bHVlcyByZXF1aXJlZCB0byBwcmVwYXJlIHRoZSBQSFkgdG8gcmVjZWl2ZSBhc3NlcnQgYW5kIGRl
YXNzZXJ0DQo+ID4gcmVxdWVzdHMuIFRoaXMgaXMgYSBvbmUgdGltZSBvbmx5IHRoaW5nLCBkb25l
IGF0IHByb2JlLg0KPiANCj4gVGhhbmsgeW91LiBQbGVhc2UgZG9jdW1lbnQgdGhpcyBpbiBhIGNv
bW1lbnQgbmV4dCB0byB0aGUNCj4gcnp2MmhfaW5pdF92YWxzW10gdGFibGUuDQoNCldpbGwgZG8s
IHRoYW5rIHlvdS4NCg0KPiANCj4gPiBBZnRlciBsb29raW5nIGludG8gdGhpbmdzIGFnYWluLCBJ
IGhhdmUgbm90aWNlZCB0aGF0IHRoZSBwcm9iZSBmdW5jdGlvbiBpcyBtaXNzaW5nDQo+ID4gY2Fs
bGluZyBpbnRvIHRoZSBhc3NlcnQgc2VxdWVuY2UsIGFuZCB0aGUgc3RhdHVzIG9mIHRoZSByZXNl
dCBpcyB1bmRlZmluZWQsIHNvDQo+ID4gdGhhdCdzIHNvbWV0aGluZyB0byBmaXggZm9yIHYzIHRv
IG1ha2UgaXQgaW5pdGlhbGl6ZSBpbiBhc3NlcnRlZCBzdGF0ZS4NCj4gPg0KPiA+IFRoZSBhc3Nl
cnQsIGRlYXNzZXJ0LCBhbmQgc3RhdHVzIG9wZXJhdGlvbnMgYXJlIG9ubHkgdG91Y2hpbmcgcmVz
ZXQgcmVsYXRlZCByZWdpc3RlcnMuDQo+ID4gTm90aGluZyBlbHNlLg0KPiA+DQo+ID4gVGhlcmVm
b3JlIHdlIGJlbGlldmUgdGhpcyBzaG91bGQgYmUgYSBwb3J0IHJlc2V0IGRyaXZlci4NCj4gPg0K
PiA+IFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSBzbyBmYXIsIGFuZCBzb3JyeSBmb3IgYmVpbmcg
Y3J5cHRpYy4NCj4gDQo+IExldCdzIGdvIGFoZWFkIHdpdGggdGhpcyBkcml2ZXIuIEknZCBiZSBo
YXBweSBhYm91dCBhIE1BSU5UQUlORVJTIGVudHJ5DQo+IGZvciBpdC4NCg0KVGhhbmsgeW91ISBB
bmQgd2UnbGwgZGVmaW5pdGVseSBhZGQgYSBNQUlOVEFJTkVSUyBlbnRyeSBmb3IgdGhpcy4NCg0K
Q2hlZXJzLA0KRmFiDQoNCj4gDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

