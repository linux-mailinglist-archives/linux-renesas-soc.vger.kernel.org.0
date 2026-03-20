Return-Path: <linux-renesas-soc+bounces-30040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMCcEwK9vWnyAwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:32:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A800B2E16AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 22:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 699D2306779A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 21:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921893C8734;
	Fri, 20 Mar 2026 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OuIedH5T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CD36CE06;
	Fri, 20 Mar 2026 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042342; cv=fail; b=RMuT0ol0fB+jziqFN7lU27TulqPBBICxnbicqCvhFK+hF8k/Ut8VKsNz65IZkgmr4QFNWblfNsOMZeVV9IijeagbX+Gg+Grd3b64nI3/zhBumEirJHCpcUCu5oBTcjd2TcPdONiyA7L6/dxE2AGkZ1aE1St3X2a52xbgW4nAo3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042342; c=relaxed/simple;
	bh=7WsdLrCGDsJYxFXDiZ4Lf/qSP/wYjkSJ5+wbofhiQ+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UfvhigFOfoVugSz5WU57q9OHlXq1nmCAgQwYL7wwABZBHgvQqSTc7okV7Iv9v+2zMudY1FahY8nyQdQ0jpDbVw5oVD7Ca+rAiM83W3SubNpy+Nk8MMI/awjQu8XHewOaYrby0BYTetkn/ENT/hhZV5P7wFortwOCXgMwIe+G8Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OuIedH5T; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNsDYgGBYgmu4cPMP7DY7rETJwXsvR/THyPBxUbu1zPlV6DeZvI+sqZgjNNVmnulFMqXWG2yvUrTdtmAF3skvRilT61/jumpRXvWdOLQDroLcZHTGxnYvCyt+7toLY4Hq9wYk+mUNgzq0O3hFOg8j6oa6wY1LF7vC7afJzbBc888AJPYApFo6XlxsThMIwsjUcuwwsamEZyeUJmNxwb/gEZKOjdB7TuKeI3AYIefsLmoqt1+XQZqEjcrHakjRATpZhQmpLLH147szlkJAXMJaugn0f06lxfogUJVM/kRaAU6qB3+k23HPqQZKyvxEhG+/eBkq0fM4WCtqpUeyLTTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WsdLrCGDsJYxFXDiZ4Lf/qSP/wYjkSJ5+wbofhiQ+M=;
 b=wJfzDjRM2MTDPjjteHmM4+U/YZPBpVO5kVfhNxNjAnpbjaEpumMG6qPHZIT6zB5tJlNLsiZZvDaETK6MGUz4BieLhncPuh3rEGiGdgvbszBMsWBbgH3OxDXmpf9rwD4+VJprEsv0yuXR4/3Epcz1GYpxYh672sWGg7SjvLrZLv0wKCHi0ZbEFqANND6wmiOWFU8K5FDY4A6LENpLjJWIjjguVyBRCBAWhj5Cg62pfqz8G3BJGzv+FHroSIic+S72CCdK18ww9rTvdixM4i5lXbI1jy7oa1yLfZlSe1UkUYAiBsZA2uDrabggXD5PN1R/4QpF85qSVVoHDH2sphqD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WsdLrCGDsJYxFXDiZ4Lf/qSP/wYjkSJ5+wbofhiQ+M=;
 b=OuIedH5ToScr2lHRquNQoJRXQgh6dzl89F83DCuioNs3iqCUyxlhV26/+SBH0JxQu7U6RA2Mzjy3gKUn2JnClRBARCd7B2qrAUIwZ3bml/UG6clJtwuAvDh5aayZAaI1SjUGqXWnn3Abbl82DPu9+ZlU8ij+uANJOaMTRabxiwg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17400.jpnprd01.prod.outlook.com (2603:1096:604:43e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 21:32:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 21:32:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?utf-8?B?QWRyacOhbiBMYXJ1bWJl?= <adrian.larumbe@collabora.com>,
	biju.das.au <biju.das.au@gmail.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
	<robh@kernel.org>, Steven Price <steven.price@arm.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock checks
 in runtime PM
Thread-Topic: [PATCH v2 2/4] drm/panfrost: Drop redundant optional clock
 checks in runtime PM
Thread-Index: AQHcuIh8hfFALj8wyUqqAbYPOoEkkbW37WqAgAADFaA=
Date: Fri, 20 Mar 2026 21:32:03 +0000
Message-ID:
 <TY3PR01MB11346F3DF5ACB55B5FE8DC96F864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
 <20260320164158.487406-3-biju.das.jz@bp.renesas.com>
 <ab25E0kTBA4EjZ3Y@sobremesa>
In-Reply-To: <ab25E0kTBA4EjZ3Y@sobremesa>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17400:EE_
x-ms-office365-filtering-correlation-id: e1a82124-232e-430d-02c6-08de86c820ba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 N3GZeNmECtnglqNOZCnGDaBPVMavhaW0vhYA04mRB8Jsefs1kiOJ98D28e72lNODW8KYZ92te7TQ4TgyAKUivFpOes2SO004jOb7p7atFhu6XxReTBmV/MBLWSE3eaFrW/EhQEF4l2VG3K6AhgXRyyzssolv5CiDHP5h1noISp7PpUt7gkZsVgEk4+w5xzx5dN4jMbJ3LTNx8+c6Up8wMz7nI0Gr9Bj8WvE5dtjmnj5pejGRgUTvg8FIVLMNK/vgxYSUcBSIndnDeYqablAmEOUQKkea09cc+nlqEHT5XGAb2c0aJxuXvJ6NaGlCUauU6WMk+ufMG3GFt7/Y0OO304XCBZghx2dfY78Sj0xJSI1PFBb9WEOdLKF2yLOrHugx5dN2/r1ktOw5dETZ/MikNkO5B4h/Mu2BUmoMkbFBXoEm0BsshFD4LSTDinjYHybZSwP0EqUnxQPBvzKH/sCRDmU3mF1VjNmDBPQ23R8gHup/QNeYO/EKqs0dIkxpYZFAkrBTv+Nntf+K6Ti/XnAtY0PSrLMxLhouGz00WnGFU+RxdZlF6Du+DD9aCRrT1Fna/pLE/MFAzbZ/z7R3mvhJA2fXRyrAEnoBAtKSBGSyYnHMS/p14OPR3XBfbJ9gFCjWw7iEKDIKo5je9vilqBRcWyItG2zT5/eGpvPuBIDj42WrSt09NGllb2NQLgG5oHyjrM0DfdFO4a1ibkIt5d0dt/UbgkKHp4bbKfXwvgHlowYEx1KpH/AsqV7mYDsY3KTQRGJKXfWlmV4LhciqRz0y+rKW8pHD8jvd46k4OmuqKxs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTArMktLWWFvS3Arb09PTE83aDc3L0l6UHFUZUQ5UVd1ZU9lYnFaK3l3dUR2?=
 =?utf-8?B?VkJqRkM5OUFrc0ZXYmNuT0owQ2dSNUlPb3ZjNmk3elhCUWh3SnMrb1ltN3B0?=
 =?utf-8?B?aXc2UjJYeUVJdnV1dHJDWUZxT2t3eC9uc2Q3SlhoSzBzdno2TnBpb0hCQTJF?=
 =?utf-8?B?bmNhSnhtdVpGWmZsSXB5TDRsNjlRZk9aVEhQbHI5bWJNcUtTdWhuYS9BQmFl?=
 =?utf-8?B?S0VvVnVrMTJBTllaRVBwTHc3ZFF6TTVGVG9QeVBreGJmSHMzcmZIb2pQdEt5?=
 =?utf-8?B?em5wQW50ckovR3ZNTlFEV1hEUHJYcmoxNnNIWHozS3c5MHpaK1NUSkl5bzh3?=
 =?utf-8?B?ZVJydGN5REtreEJ1UW5pMDRVaG1YUW5tMVZEZ1JRZlBqNE1qRmtSdEdpaW5B?=
 =?utf-8?B?a2NnQWwyL0QvNy80SEJRUFdtNTRHNlNjeDVOcjlZV2F4V0ZEdFBXNU9QYmtR?=
 =?utf-8?B?NDI3SUhnMUdHcGxtNHk1R09ob25rMzZBM0FrNHVXdnVsdkpsQVF6OFpLcHRX?=
 =?utf-8?B?cHBybE1RSk0weTJRYVJVZFdOVjJtbEgzelYyN0tlOEoxU1Iya09CaU80NFlp?=
 =?utf-8?B?Z1d3YnZDR21sekdjekl5VHZtOWVkWlZiMHpTc2Fqc01HbW9xelorRnE1Y0FC?=
 =?utf-8?B?NWJWOGtmRjJKdUFzY2NoblJFTCtwUGlabUkxeldjNVprbkRJU3V0MmhZbHhI?=
 =?utf-8?B?MkFLUmJjT1NlcDZEeUsvY0hrTFNpeDM5NnFaL1pjbHVWREMzR0Zmc3M1UUU1?=
 =?utf-8?B?MzUrczFZM0dIdjNIZUtVdDJob3R1UW5GendneTRkY25sUjZDVnNTbmJheGZG?=
 =?utf-8?B?QmlLdnhqMVJQdWxjU2o1N0dCaDNDaVNKdTRaQUR1SFlCVUNqblBCdTVkN0VQ?=
 =?utf-8?B?UXQwS0YzSVg4WGRONHV2YVZlcVBhZzM2Rk1YUmlmVjZXcUZLV0RINUxtYy91?=
 =?utf-8?B?OTlrcVZ1dldqRkF4SWcvSGMwcERiNUN0QWNEUlhuUS9GNmUzbnlSZ3lxcFZI?=
 =?utf-8?B?Qjg5RFRrNndGTlFDSCtIaGFGMlpIc1pJeDZJb3p1L3RBalQxR1Qycm53V3hT?=
 =?utf-8?B?T0daVFBKQlNsNGdEbjllQk1YbUpSY3NTK29XWE9hSisrTEdqcWdyNlRkM3Fp?=
 =?utf-8?B?blBLVUNBVjRqcjlQK0k5WVh5ckVxaHIrRktEWjQxYXdMS2pRb21zWVBOVWRv?=
 =?utf-8?B?ZE1Ea3dNQ2x3dWdaL0ZnSnNueUJhdE81cTlrdklrL0xKckRUR0tZbEZodVNW?=
 =?utf-8?B?eWZKVm8ydlRYMlcyZERTZE5vRTFlU3hUdUl0a0pqdi8wbGZ4aEZaaStPZzI4?=
 =?utf-8?B?U0VCcFU0aENOMkJydXR6M1dFenU4UEJDTXFiMkFvTGhmNCttRU1oa0RIVkE4?=
 =?utf-8?B?NkpqZjY4WjZicFFCQ01RcE9vZ2J2YVdzeloxcnovNk0wTWdtbVNLcVg5QlpL?=
 =?utf-8?B?cXhaRzlraUZwQTNPYnNwWXd4OTdBTytZV0hRNndUNzc5eUVNbnkvdjRWbW9F?=
 =?utf-8?B?SFpoeG96T0RjZWFFN3E5c2Q5MmZJU2x0WG1xSER5S2cyVEZlOGZaTThBMzIr?=
 =?utf-8?B?c2J0TG4yN0Y5SnQzMU5Fb0ZNT3ZSckc2UytKcHQ2TjJOa0VWVUJiR1A3VSt5?=
 =?utf-8?B?QjJ3cC9MVW9CZDdtQlJ3M1huWE1tQzFGQXlaUExRczRDTlBXSmJSVmVwUDBJ?=
 =?utf-8?B?aTI5RHVkOGg4VS9sZlFQMnQzemZLbjNzYnVNSW1RdVpTOXdnSUNQQks1NGtW?=
 =?utf-8?B?ZEZ4bHZuVzB3emx3R1B5NERBVGVudkpSSm8rbU1qVmx3dUliaU5LRmMreVk3?=
 =?utf-8?B?MFNsV0JGUGlLTVV0SXBVQndaVzdldVpPV0c1enFFOEl5K2pzNDFDODBSdDZi?=
 =?utf-8?B?YXg2MWtOSlpmMkJDRzBZcHFoUWpBazlsOFdiUzF1S1JhNmNkaXNYOGowMWd1?=
 =?utf-8?B?bTljUFllNlMrVlorZlg4UnFlSG9YZm5HMEo1di84WmdFWUdvREpzQTRpeUZ3?=
 =?utf-8?B?K2t1YTlSYVlUbU5rS21DU3QwOFk4L2pUYkVMaDlwNE93eUJZaDBtYS9KdGZl?=
 =?utf-8?B?dmNrMW1aa1FOeVlkeTAzbGdwQVROY1RKc1laREV4L2QzUitBNUJBb0VIMHor?=
 =?utf-8?B?eCtmMXRTMlhLSitrODg4bVZONXdocFZpWUUyMktaMzN0T0NxVTROT1daWmRJ?=
 =?utf-8?B?R1NrV3Z0bWdJby9jemZ3Sk9mZmVBTmI4TjNYNS9NdDJIdlRobzZVanRBWWdQ?=
 =?utf-8?B?VW13bEFjS1FqemVPdWNCeERJcXRpWWhKV2lOcGhrbEZYQ1RzQVlmc0VYZkdV?=
 =?utf-8?B?L3l3VjUrVVB3bGdyQnRia09HZUp1bTEzYjlib3cwWDlvU3h6S01tZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a82124-232e-430d-02c6-08de86c820ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 21:32:03.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejK1O/hp3kQwSL+2dtrzoqxWVyvQxaJKTb8x56o0doUYIZcXWdBsYxD82RZb6p2BrRPSrtTXA3nCBniYn9lM2KswaF3J5UkIoZtGO9EhHPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17400
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30040-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.983];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A800B2E16AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBZHJpw6Fu
IExhcnVtYmUNCj4gU2VudDogMjAgTWFyY2ggMjAyNiAyMToyMA0KPiBUbzogYmlqdS5kYXMuYXUg
PGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgU3Rl
dmVuIFByaWNlDQo+IDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlw
YXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47
IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Ow0KPiBTaW1vbmEgVmV0dGVyIDxzaW1v
bmFAZmZ3bGwuY2g+OyBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBkcmkt
DQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IFBy
YWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPjsgbGludXgtDQo+IHJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDIvNF0gZHJtL3BhbmZyb3N0OiBEcm9wIHJlZHVuZGFudCBvcHRpb25hbCBj
bG9jayBjaGVja3MgaW4gcnVudGltZSBQTQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIDIwLjAz
LjIwMjYgMTY6NDEsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIGNsa19lbmFibGUoKSBhbmQgY2xrX2Rpc2Fi
bGUoKSBBUElzIGFscmVhZHkgaGFuZGxlIE5VTEwgY2xvY2sNCj4gPiBwb2ludGVycyBncmFjZWZ1
bGx5IOKAlCBjbGtfZW5hYmxlKCkgcmV0dXJucyAwIGFuZCBjbGtfZGlzYWJsZSgpIHJldHVybnMN
Cj4gPiBpbW1lZGlhdGVseSB3aGVuIHBhc3NlZCBhIE5VTEwgb3Igb3B0aW9uYWwgY2xvY2suIFRo
ZSBleHBsaWNpdCBpZg0KPiA+IChwZmRldi0+YnVzX2Nsb2NrKSBndWFyZHMgYXJvdW5kIHRoZXNl
IGNhbGxzIGluIHRoZSBydW50aW1lDQo+ID4gc3VzcGVuZC9yZXN1bWUgcGF0aHMgYXJlIHRoZXJl
Zm9yZSB1bm5lY2Vzc2FyeS4gUmVtb3ZlIHRoZW0gdG8gc2ltcGxpZnkgdGhlIGNvZGUuDQo+ID4N
Cj4gPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIENvbGxlY3RlZCB0YWcNCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgMTIgKysrKy0tLS0t
LS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmljZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNl
LmMNCj4gPiBpbmRleCBkZWRjMTNlNTY2MzEuLjAxZTcwMmEwYjJmMCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMNCj4gPiBAQCAtNDI5LDEx
ICs0MjksOSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2RldmljZV9ydW50aW1lX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ID4gIAkJaWYgKHJldCkNCj4gPiAgCQkJZ290byBlcnJfY2xrOw0K
PiA+DQo+ID4gLQkJaWYgKHBmZGV2LT5idXNfY2xvY2spIHsNCj4gPiAtCQkJcmV0ID0gY2xrX2Vu
YWJsZShwZmRldi0+YnVzX2Nsb2NrKTsNCj4gPiAtCQkJaWYgKHJldCkNCj4gPiAtCQkJCWdvdG8g
ZXJyX2J1c19jbGs7DQo+ID4gLQkJfQ0KPiA+ICsJCXJldCA9IGNsa19lbmFibGUocGZkZXYtPmJ1
c19jbG9jayk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJZ290byBlcnJfYnVzX2NsazsNCj4g
PiAgCX0NCj4gDQo+IEl0IHNlZW1zIGNsa19wcmVwYXJlX2VuYWJsZSgpIGNhbiBhbHNvIGRlYWwg
d2l0aCBOVUxMIGNsb2NrIGRldmljZSBwb2ludGVycyBncmFjZWZ1bGx5LCBzbyBtYXliZSB5b3UN
Cj4gY291bGQgYWxzbyBkbyBhd2F5IHdpdGggcG9pbnRlciBjaGVja3MgaW4gcGFuZnJvc3RfY2xr
X2luaXQ/DQoNClRoaXMgaXMgdGhlIG9ubHkgY2hlY2sgYW5kIG5vIG5lZWQgdG8gcHJpbnQgcmF0
ZSBmb3Igb3B0aW9uYWwgY2xrLiBUaGF0IGlzIHRoZSByZWFzb24gSSBoYXZlIG5vdA0KdG91Y2hl
ZCB0aGlzLg0KDQoJaWYgKHBmZGV2LT5idXNfY2xvY2spIHsNCgkJcmF0ZSA9IGNsa19nZXRfcmF0
ZShwZmRldi0+YnVzX2Nsb2NrKTsNCgkJZGV2X2luZm8ocGZkZXYtPmJhc2UuZGV2LCAiYnVzX2Ns
b2NrIHJhdGUgPSAlbHVcbiIsIHJhdGUpOw0KDQoJCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShw
ZmRldi0+YnVzX2Nsb2NrKTsNCgkJaWYgKGVycikNCgkJCWdvdG8gZGlzYWJsZV9jbG9jazsNCgl9
DQoNCkNoZWVycywNCkJpanUNCj4gDQo+IE90aGVyIHRoYW4gdGhhdCwNCj4gDQo+IFJldmlld2Vk
LWJ5OiBBZHJpw6FuIExhcnVtYmUgPGFkcmlhbi5sYXJ1bWJlQGNvbGxhYm9yYS5jb20+DQo+IA0K
PiA+ICAJcGFuZnJvc3RfZGV2aWNlX3Jlc2V0KHBmZGV2LCB0cnVlKTsNCj4gPiBAQCAtNDY0LDkg
KzQ2Miw3IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfZGV2aWNlX3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ID4gIAlwYW5mcm9zdF9ncHVfcG93ZXJfb2ZmKHBmZGV2KTsNCj4g
Pg0KPiA+ICAJaWYgKHBmZGV2LT5jb21wLT5wbV9mZWF0dXJlcyAmIEJJVChHUFVfUE1fUlQpKSB7
DQo+ID4gLQkJaWYgKHBmZGV2LT5idXNfY2xvY2spDQo+ID4gLQkJCWNsa19kaXNhYmxlKHBmZGV2
LT5idXNfY2xvY2spOw0KPiA+IC0NCj4gPiArCQljbGtfZGlzYWJsZShwZmRldi0+YnVzX2Nsb2Nr
KTsNCj4gPiAgCQljbGtfZGlzYWJsZShwZmRldi0+Y2xvY2spOw0KPiA+ICAJCXJlc2V0X2NvbnRy
b2xfYXNzZXJ0KHBmZGV2LT5yc3RjKTsNCj4gPiAgCX0NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiAN
Cj4gDQo+IEFkcmlhbiBMYXJ1bWJlDQo=

