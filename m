Return-Path: <linux-renesas-soc+bounces-24327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9386C401D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A393B7580
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335DF2E3AEA;
	Fri,  7 Nov 2025 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mXs0XfPA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524B2857C1;
	Fri,  7 Nov 2025 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762522182; cv=fail; b=eqCtolOkhRR1B9yTN2qgRzvRxgrvniY0lhDAVLPkGS3hhFlecNHUhuPiHIF+8wDNZ56kzVijEOQBjPJNsZlb4ciZZiiE880zA3tJ4xTA/WuJqNJLkY40Gc0zM383xzEddBot03YkYeGtlySPNP9WUQCn4VOxcmSgz21vrK9zZBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762522182; c=relaxed/simple;
	bh=xNExEg4KpD9WX0Zcux1IMbf5wmcnRTu/Ej9Onzt+Cv4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AYgn96DW2k0JbhfAh7jiRKqEygQ1Mn+zFQ+RkZgqHb+uvMt3JI4PJJ2ZERxmnhggP7dnSDFGhkmkfwC+Jb/O3uSHhbjHNNgAGxJEjuRvyW1dWCvottA49I7MUTHWNhvGpdbyB9RbR3igaOQK8NURbgdzlWmH7t7qYBTY4IOCWBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mXs0XfPA; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9sFyS005JvL3bocGZ97CcHqQhSKLymbMpKEd9S+NXAJ9G0M7v8Y223u3T7K8CadaoTjiqVNy06TO1bjBG3EFKXIFkr/QVtZ/DGGJBUhHf1uz9ugcbrSSgkYzpDL1hQBsiS6YWf3/i1tkjVqdf94i9EgNiTijEnRb3NpvI5NUWah2WQL3o5K9g9xxLWHV15HK0mbLOdf+ikUprufG/mEh/fNfWMi6123kJMC52Va+fAEnSS3/HFDVn3Uqiacw2trP5EOS0QWXEpJsGp1XPAJfUlywL37SGm92cARH3cb1Cq6YP5FdEJ4+/qKCOryTZjQNTFK/yFLCXPUNSn1gAvr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNExEg4KpD9WX0Zcux1IMbf5wmcnRTu/Ej9Onzt+Cv4=;
 b=euiNhO+3+/6B4+erc6L35J+jg8JCttmOvJXhsIWZ+HKbZhj3+bv++1Sy8wMDPExC89hhpU7lIRYvRHJ7uvqaGsCfRhbOZ4RAu4GXAPL33YlLHsKPGhrLE1EMd2L41zDvxKD6XajU2rkJfYyznhopFXHkuu8XBrjblQgGKZDjQ1IJfWl6geznkdj6rSbkQ+J+OmgzNEDCGfbgrer4fWA32X1owjPbZyWRpNpUqcXo30SkKeGIEVvP454CjUosUu3t210VpvpMpwCSzqnCXFy/762XMkmY/KgochmB3CVZ01rY+4eFdnCy+KsPckM62EfXN9dl60Ejj3C90xyxvXwzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNExEg4KpD9WX0Zcux1IMbf5wmcnRTu/Ej9Onzt+Cv4=;
 b=mXs0XfPAPRXhkL+wBBvzzUyHICzbdmqNNEhWqS+sdGKOXuAhT/8SFwI4270dLR1ED5p8bgeyxN3dPk5EDVvB01+cdQ/o3XPFux7Boqmo4D3QCJo4sZmehBIsAhh1dSd2rGqY9XIE//OmzE3Xyb+mQTGK3MwZggGn9r5xcdENUIM=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB9548.jpnprd01.prod.outlook.com (2603:1096:604:1d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 13:29:33 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 13:29:33 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
	niklas.soderlund <niklas.soderlund@ragnatech.se>, Paul Barker
	<paul@pbarker.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: RE: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Topic: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Thread-Index: AQHcTxzKoVdV1cP1k0WlN+3+CViRarTmfzwAgAB9rQCAADmHQA==
Date: Fri, 7 Nov 2025 13:29:33 +0000
Message-ID:
 <TY4PR01MB142826AEB522E9717D6B1E59B82C3A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
 <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
 <03012c3b-ae9d-4591-8ac5-8cf302b794a5@cogentembedded.com>
In-Reply-To: <03012c3b-ae9d-4591-8ac5-8cf302b794a5@cogentembedded.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB9548:EE_
x-ms-office365-filtering-correlation-id: 3cd3e0a7-a2a3-43fc-6460-08de1e01b026
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0pIUmJYdlZVaGF1bkxLOUtFU3I4SGpEbWJYRmZ1UGRpSWhxWUd2UkJPdVk1?=
 =?utf-8?B?V0tMWThJQnBBWks5K2NKZWcxOEM5TXZjSUZTZUM3RE55bDRCTW4vWjhIVlo4?=
 =?utf-8?B?OHBJNEZ0Sk1LbEVBYkRwQTFhcUprM3p4eVpIL2RDc3lKc2x6QVFJTHExdERP?=
 =?utf-8?B?dnVmRkU0aWhXYjdNMitTWE9CY0RMYXdPNm5uTEQ2NWFybGpnVDNzLzZ0QmRz?=
 =?utf-8?B?bnFuQi9lZXExUlZ3a2U5VmhlRnIxZnBEenlTQ3VDMlJBRGFMeW1WeFZ3UkZZ?=
 =?utf-8?B?bVlaTE0xYllXN0V3dFlEU1kzUldGNm5OUFdNVkJ6QUxTN0M2WmZtRGo0QzNR?=
 =?utf-8?B?Sml5bFJ5L00rQWF5bDFqbW5KYUlDOFlsbGdUcmxWN0lyZlNZMlZvYjAvaDll?=
 =?utf-8?B?ODd0SjFVMTlOaGw4SUlDb1N3L2VJT1VsYnFDZS8rN0tZSW95L2VJSXk3d2Nr?=
 =?utf-8?B?MmhobGlwemVLVjI2TThGNkpvNE9rMzhWb2ZJWFBEaDNxdU5YZUZsaEJHQ2hX?=
 =?utf-8?B?ZXRJbjVnSkV3RU9YMTNjU0V5V1N1cjkrUHNyRjJsREdmMTFUY24rc1pTS1Bh?=
 =?utf-8?B?bmwvdjRiLzlENzNkc1NUSFdza0ZIZ1BtY054Y3d2SU95WldIZjZIOEZjc05D?=
 =?utf-8?B?T0JvSDFld0JrQjNqK3Z3WHZLenFkQ2RtWEIxVHNGQXY3OWJkd1krQTBMZzU0?=
 =?utf-8?B?WDBiR2RsNEVZRE1xMVZ0c2dUWVJEL0JpRFN2a0NiVVdiU2hjOXlvZkZ1bCtK?=
 =?utf-8?B?cTQxblpvZklydlJKazgrMkdzbVJwQjQreWw5YzR0bGhRSE9SY0xoSWp1Tkxq?=
 =?utf-8?B?NldERGpwY1h4cklUV1F5RU5VQmFna083WiszaWF6UzNjZ0NCcjJPVVpBZjVC?=
 =?utf-8?B?VksrTzZGb3BseFNrMkJyajFSVlg1UTBhREFzdlNuVGNaMDBHakZGWkdIQXc2?=
 =?utf-8?B?ZXNNNEJ1QlZNdnI0dnJKZzQwdFMvaGhpZzlab3M1N1dNMnhSUE5qWEpjNkFu?=
 =?utf-8?B?TmJYY1ZtMVJ3aDFSYkI5OHUzdFMzSEtNWFVXUmpRdlVUWXZKZTVmS0Y3WUNW?=
 =?utf-8?B?a0lMOUUzdk1BSG91dUtBcVY1QUZTeitOeDF1QU9GMlVjUmNjTWRyeC84Ums5?=
 =?utf-8?B?VWVub0h0VHgzQjYzR0ViVjhCWUp4d1dHSU5iSmRxOG9nN1oySWpWK2VDWUsv?=
 =?utf-8?B?Z0ludm9wR2hoZCtubXNyS1pFbndkczg5UzVBaDVJd3lmTmh6K0U5ZjJFTVZu?=
 =?utf-8?B?QWdWenBobW5vTmZubDcvMmVudjBnbUhadjErai90QzZyNlU4d0ZWTHVIakdM?=
 =?utf-8?B?NzN2US9GQXUveFdMOUxnbFVBSnBMNUlnd1o1aFh0ZkVSVnRyRmpLdy9YYzhS?=
 =?utf-8?B?cHUyMkxYL280ZXkwb0tNTWh1K3B0UHpJcHJsbGU0dUs1MVhTVlFybXowbVNu?=
 =?utf-8?B?VHFMSGYyVFFrQ1EvcjBnQmxNYzZuUDllQnhpTHZERHNzRmhxdEVXWENLbXBS?=
 =?utf-8?B?aDRNRmpZUERuVmw0V0djNDBsQTFoenl1WjJ0K3hFRWZZaGpVOTVqa0RjMzlq?=
 =?utf-8?B?dWhncFp5T2pvRDdseG83WkdBbDRXbldPbWlnT2hwVUx2QjFSa1pKUjluV016?=
 =?utf-8?B?ZXM5ZlQzY0QwVGk5NDdLaStOb2NsdnRCcUlsVTAzQXVFKzVHem93TVlLZ1lF?=
 =?utf-8?B?YUlwRVJlR1hGbmVlY3JIcEwwSWExRlYrUTVhNjZlMWpVaElsOXVzS2VVWG9R?=
 =?utf-8?B?bzJ4UDF3aUQ0bW81cFJSVGQ4L3RwakVka3M0N2hhaVB0b0xCb2hkdjIreGdH?=
 =?utf-8?B?N1ZSWW0rSlN3cUpWNUoycjhpNytpOUsvSEloZm1XS0libVUzVGRqN1BqWEJD?=
 =?utf-8?B?cW5lQ0FmaTg4YVpVTGFJYlBWLzM5dWJabmpabjN6OERzR3A1Um5iS2U0aTIv?=
 =?utf-8?B?ZjQ4U1NxM3VoMVlhMnUyNWcxLzZmTU1ra2JXTDdMWE9BVUV6eHNDZm8zcGJX?=
 =?utf-8?B?aWRPRFZxOFovV0pxRUJxSXNObWhxWVZSVnJOSFNGeFVHeThwcW1FWmJ5VXJt?=
 =?utf-8?Q?UFbxON?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1NMWndaWGI1OGRJUWxCMk5kWHA5RjRTall6VWE4WWpXbmNOSzI5YVYxS2Fw?=
 =?utf-8?B?dis2U21RNDAzOXozc2JqNDd0bE9zaVFCOFRZNGFwUEtGYVZOMnNIamFhYTNt?=
 =?utf-8?B?amRBWWcwUlo1REtDSFhIeGJjaEhkblhScmVvZ1p0NEQ2QlpxeUw3S29JRFR6?=
 =?utf-8?B?eWRuODVtZys2M3Q1U0lLQkF2czhuQ3VWblBsSW1rbjMvSC9Mc2w3MkkvRmZO?=
 =?utf-8?B?VjhRanluSzUxaUpOOW9mRUtoYXNTUk5ONlRTSW1nYVJ3UEpEWmN2SnF6ZXRV?=
 =?utf-8?B?VkdzSVZTOGJOcW5SZXZxR2U2N2pUL1pyNUphNnlaYm1kZWJvSGR0ZkdyTmZv?=
 =?utf-8?B?MFkxNEx5RzRENnpDTm11YmFKS1NINnIva1dvZWNxb0U2MzlIejZvYXh6VFdx?=
 =?utf-8?B?L2dndnlZc01aQy9yK0pLZ2x3a0lUK0h1RTRSdSs5dnhBSVFRUXgxUzVkb1dx?=
 =?utf-8?B?NGpxVUsrQ2c4TWYreHZBcW9vU1VMUVI1SzFFYjllUEQ1MmNVQzRBVnZjd3Vl?=
 =?utf-8?B?bUMzZlV3dWhtMGlraWUwQm5IVjg3cGFMeUpRMDIyWEMwRUIrV2lzV2NCZVFE?=
 =?utf-8?B?dE1QeFB4bzF2TkI1VXBMKzVOSlhYRGxaS3pBMEsvbEYySnZuc01pVmtzSk1o?=
 =?utf-8?B?S0lzTWw5MC9YUmJkV0owcjZuNVJUQzloa0xVc3lvanRaQnRQMWhwdEZwZ1VT?=
 =?utf-8?B?akhBVXNCbDhhZVhib0ZlczgxSU9hWFpqc2J1S0FaSW0wODJmc0M0Tnc3aDVG?=
 =?utf-8?B?WjF1QU83d3BNYTdSZ0l0Ty8xL2MvL0t5OGtFMmM1QTcwKzloaWhHV3h5Wk1n?=
 =?utf-8?B?dWNBU1ZROWJGTUloWUJqaEJjaFVzTDlYb25DZzZuejVwNEJ5eWQ3alBMUEs3?=
 =?utf-8?B?Z21HRE44NEJRUEVEUXE1bHhRRmsxSjFKTktKWFpnZ05abzJLQ3ZwbXBqaFVX?=
 =?utf-8?B?cEMxWVZaYUpicnQ3N3dOWmlxSXM2QVNxMFBxRUdnVEsxVktMR1YwK3B4MjV1?=
 =?utf-8?B?V3VrSjFMSzY1ejBoVEY1V0lzVHVTSTRpcHBNL1FrQjVhakUvWFIrWXh3ZGky?=
 =?utf-8?B?UVhkQVhDeEF4cjZMSDExcEtwNFNnNW5NbkVmYnBCZkN0enJ6SzBiMGZpY2N0?=
 =?utf-8?B?dTZkRE9Hak5oY0w5U2pDOXlLaGpzWDV4NGY4STZiNWtBY1dDV1p0ZUwrajBu?=
 =?utf-8?B?OUw0MDNtaUh0RC9ld3JpR3dhcEpHYmJOL0lqdUFmMnY1RmVQZW12Y3Z4NHRJ?=
 =?utf-8?B?N1FLUkZFSi9ON2pNTGdMeVQ1YUsvMWtLVUdaaTJwS1NVZWJDUTV1TngyaHBD?=
 =?utf-8?B?Z1NWbDI0OTZhcVZXR21FVUhrRk5iU0N4WUxrTE1uQkJKTTNZekpLSVNSMkZR?=
 =?utf-8?B?UHlFVzlmT3BUekMwUGErcFh1ZkdxdzVDOGhuTVM1dzZRWVg1UW45MzFqejVY?=
 =?utf-8?B?dTFvbTcyR09wWm51N0FQbkNmNzA5bExpalg1ZjZNQlpwZFhpbW1JQVJZQ1pD?=
 =?utf-8?B?KzVrc1pwQ0Zhb0lwWDE4cXpYd0pBaWoyODFpODVIa1R5UG9zWGJEcVpzY25x?=
 =?utf-8?B?SDFOWU9ETXFXTHN4b0NRKzdCaDdxcHI4azhIdTRkeHhNZzYra1lRMkdzVCtp?=
 =?utf-8?B?dWl2YWE3b0Njb2hTSFkvc0JBSXE0Sk12SWxPb1puUHV0amt2SjBIZG5qVXE5?=
 =?utf-8?B?bGFxeGY1Tk5LMVVRNk9SRnoyZVdzeXFqSS8ySFpPRnBxZ2VOSXRKZ1o3WU1x?=
 =?utf-8?B?c1dtVW1KVVBKdGtueFJ2T1RkY0s4YlcrbytKWUFyYk1kYnVYZzd3ZUxMOHNz?=
 =?utf-8?B?TVkwdXd0WndQbEE5V3NSN0cyYjY5VlhrMFF1a25acGVzQzNvcUVaWERuZXkw?=
 =?utf-8?B?VjFtM1dkVzJpN29FMjUvcTNaRUtRbjZacHRPUHE3Z3RYNTFqTit0RkNRMlBw?=
 =?utf-8?B?Qk4yWE9UVWlPcHIrQWZRa3RZWnFsUUxoNVM4a3dSQjh6T0tkWVorYk1lQTNu?=
 =?utf-8?B?S1ZFc29nZms5d2lBNFkyQktRUURQVFk3ZEsrNjNqRnM3RkxGTXZmN0RKRjhF?=
 =?utf-8?B?bTdSTG1WekFiejZZV3EzTTNSaVhaN3ZEdFByMnNhSWNLcHRBM3dhbThWTnVB?=
 =?utf-8?Q?vgMbM5iGCg5c7XBjGIK3hunWR?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd3e0a7-a2a3-43fc-6460-08de1e01b026
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 13:29:33.2059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SoxJ10LDjAC4dpAGnzdvRNOBYHk6ohfnrfUWMz8buvxj818T+LhoxeHZFsBwr47SPeegiD0qaAkxhTqEDJJON4QGvZqAyEJDraL+o/8QWPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9548

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlraXRhIFl1c2hjaGVu
a28gPG5pa2l0YS55b3VzaEBjb2dlbnRlbWJlZGRlZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92
ZW1iZXIgNywgMjAyNSAxMTowMiBBTQ0KPiBUbzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNo
PjsgTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5jb20+DQo+IENjOiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+OyBBbmRyZXcgTHVu
biA8YW5kcmV3K25ldGRldkBsdW5uLmNoPjsgRGF2aWQNCj4gUy4gTWlsbGVyIDxkYXZlbUBkYXZl
bWxvZnQubmV0PjsgRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPjsgSmFrdWIgS2lj
aW5za2kgPGt1YmFAa2VybmVsLm9yZz47DQo+IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNv
bT47IFJpY2hhcmQgQ29jaHJhbiA8cmljaGFyZGNvY2hyYW5AZ21haWwuY29tPjsgbmlrbGFzLnNv
ZGVybHVuZA0KPiA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2guc2U+OyBQYXVsIEJhcmtlciA8
cGF1bEBwYmFya2VyLmRldj47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9y
K2R0QGtlcm5lbC5vcmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IG5ldGRldkB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBDaHJp
c3RvcGhlIEpBSUxMRVQNCj4gPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IDA5LzEwXSBuZXQ6IHJlbmVzYXM6IHJzd2l0Y2g6IGFk
ZCBzaW1wbGUgbDMgcm91dGluZw0KPg0KPiA+PiArc3RhdGljIGJvb2wgcm1vbl9pcHY0X2RzdF9v
ZmZsb2FkX2h3X29wKHN0cnVjdCByc3dpdGNoX3JvdXRlX21vbml0b3IgKnJtb24sDQo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJtb25faXB2NF9kc3Rfb2Zm
bG9hZCAqb2ZmbG9hZCwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
OCBmcmFtZV90eXBlLCBib29sIGluc3RhbGwpDQo+ID4NCj4gPiBXaHkgYWxsIHRoaXMgYm9vbCBm
dW5jdGlvbnM/IEVzcGVjaWFsbHkgd2hlbiB5b3UgaGF2ZSBjYWxscyByZXR1cm5pbmcNCj4gPiBl
cnJvciBjb2RlcyB5b3UgYXJlIHRocm93aW5nIGF3YXkuDQo+DQo+IFRoZSBvcmlnaW5hbCBpZGVh
IGJlaGluZCB0aGF0IHdhcyAtIHRoaXMgaXMgIm5vdCBzdWNjZXNzIiBmcm9tIGFuIG9wdGlvbmFs
IG9wdGltaXphdGlvbiBzdGVwLCB0aGF0IGlzDQo+IG5vdCBleHBvc2VkIG91dHNpZGUuIElmIGl0
IGZhaWxzIHRvIG9mZmxvYWQgLSB0aGVuIHRoZSBzdHJlYW0gd2lsbCByZW1haW4gaGFuZGxlZCBi
eSBzb2Z0d2FyZS4NCj4NCj4NCj4gQnV0LCB0aGVyZSBpcyBhIG1vcmUgaW50ZXJlc3RpbmcgcXVl
c3Rpb24gYWJvdXQgdGhpcyBwYXRjaHNldCAodGhhdCBhY3R1YWxseSBzdG9wcGVkIG1lIGZyb20N
Cj4gc3VibWl0dGluZw0KPiBpdCB3aGVuIGl0IHdhcyBvcmlnaW5hbGx5IGRldmVsb3BlZCkuDQo+
DQo+IFdoYXQgZG8gcGVvcGxlIHRoaW5nIGFib3V0IHRoZSBlbnRpcmUgYXBwcm9hY2ggdXNlZCB0
byBkZXRlY3Qgc3RyZWFtcyB0byBvZmZsb2FkPw0KPg0KPiBUaGUgc2l0dWF0aW9uIGlzOg0KPiAt
IGhhcmR3YXJlIGlzIGNhcGFibGUgb2YgZG9pbmcgTDMgcm91dGluZywgd2l0aCBzb21lIChsaW1p
dGVkKSBwYWNrZXQgdXBkYXRlIGNhcGFiaWxpdGllcyAtIHJld3JpdGUNCj4gRFNUDQo+IE1BQywg
ZGVjcmVhc2UgVFRMLA0KPiAtIHRoZXJlIGlzIGludGVyZXN0IHRvIHVzZSB0aGF0LCBiZWNhdXNl
IHNvZnR3YXJlIEwzIHJvdXRpbmcgZXZlbiBhdCAxR2JwcyBjb25zdW1lcyBzaWduaWZpY2FudCBD
UFUNCj4gbG9hZCwgYW5kIGZvciA1R2JwcyB3aWxsIGxpa2VseSBub3Qga2VlcCB0aGUgc3BlZWQg
YXQgYWxsICh3ZSBkaWQgbm90IGhhdmUgaHcgdG8gdHJ5KSwNCj4gLSBidXQgLSBnaXZlbiB0aGUg
Y2FwYWJpbGl0aWVzIG9mIGh3IGFyZSBpbmNvbXBhcmFibHkgd2Vha2VyIHRoYW4gY2FwYWJpbGl0
aWVzIG9mIGxpbnV4IG5ldHdvcmtpbmcsDQo+IHdoaWNoIGFwcHJvYWNoIHRvIHRha2UgdG8gZGV0
ZWN0IHN0cmVhbXMgZm9yIG9mZmxvYWRpbmc/DQo+DQo+IFNlY29uZCBxdWVzdGlvbiAtIGhvdyBl
eGFjdGx5IHRvIGdldCB0aGUgcm91dGluZyBkZWNpc2lvbiBmcm9tIHRoZSBrZXJuZWwgc3RhY2ss
IHRvIGFwcGx5IGl0IGluDQo+IGhhcmR3YXJlPyBJIHdhcyBub3QgYWJsZSB0byBmaW5kIGFueSBl
eGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgb2Ygc29tZXRoaW5nIHNpbWlsYXIuLi4NCj4NCj4gV2hh
dCB0aGUgcGF0Y2hzZXQgYWN0dWFsbHkgaW1wbGVtZW50cyBpcyAtIG1haW50YWlucyBpdCdzIG93
biBzaGFkb3cgc3RydWN0dXJlcyBmb3IgKHN1YnNldCBvZikNCj4gcm91dGluZw0KPiBpbmZvcm1h
dGlvbiwgYW5kIGdlbmVyYXRlIG9mZmxvYWQgcnVsZXMgYmFzZWQgb24gdGhhdC4gVGhpcyBpcyBk
ZWZpbml0ZWx5IG5vdCBlbGVnYW50IChiZWNhdXNlIHRoZQ0KPiBzYW1lDQo+IGtlcm5lbCB3aGVy
ZSB0aGlzIGNvZGUgcnVucyBtYWludGFpbnMgZnVsbC1zY2FsZSByb3V0aW5nIHN0cnVjdHVyZXMp
LiAgQWxzbyB0aGlzIGlzIGRlZmluaXRlbHkNCj4gYnJlYWtpbmcNCj4gYW55IGNvbXBsZXggY2Fz
ZXMgLSBhY3R1YWxseSBhbnl0aGluZyBtb3JlIGNvbXBsZXggdGhhbiBzaW1wbGUgZGVzdGluYXRp
b24gbWFzayBiYXNlZCByb3V0aW5nLg0KPg0KPiBJIHdhcyBnb2luZyB0byBwb3N0IHRoaXMgYXBw
cm9hY2ggYXMgUkZDIGF0IHNvbWUgcG9pbnQsIHJhaXNpbmcgYWxsIHRoZXNlIHF1ZXN0aW9ucy4u
LiAgYnV0DQo+IHVuZm9ydHVuYXRlbHkgSSBkaWQgbm90IGhhdmUgYSByZXNvdXJjZSB0byBjb21w
bGV0ZSB0aGF0IDooDQo+DQo+IE5pa2l0YQ0KDQpIZWxsbyBOaWtpdGEsDQoNClRoYW5rIHlvdSBm
b3Igc3RlcHBpbmcgaW4gYW5kIGV4cGxhaW5pbmcgdGhlIHNpdHVhdGlvbi4NCg0KTWljaGFlbA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBF
dXJvcGUgR21iSA0KUmVnaXN0ZXJlZCBPZmZpY2U6IEFyY2FkaWFzdHJhc3NlIDEwDQpERS00MDQ3
MiBEdWVzc2VsZG9yZg0KQ29tbWVyY2lhbCBSZWdpc3RyeTogRHVlc3NlbGRvcmYsIEhSQiAzNzA4
DQpNYW5hZ2luZyBEaXJlY3RvcjogQ2Fyc3RlbiBKYXVjaA0KVkFULU5vLjogREUgMTQ5Nzg2NDcN
ClRheC1JRC1ObzogMTA1LzU4MzkvMTc5Mw0KDQpMZWdhbCBEaXNjbGFpbWVyOiBUaGlzIGUtbWFp
bCBjb21tdW5pY2F0aW9uIChhbmQgYW55IGF0dGFjaG1lbnQvcykgaXMgY29uZmlkZW50aWFsIGFu
ZCBjb250YWlucyBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiwgc29tZSBvciBhbGwgb2Ygd2hpY2gg
bWF5IGJlIGxlZ2FsbHkgcHJpdmlsZWdlZC4gSXQgaXMgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUg
dXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aGljaCBpdCBpcyBhZGRyZXNzZWQu
IEFjY2VzcyB0byB0aGlzIGVtYWlsIGJ5IGFueW9uZSBlbHNlIGlzIHVuYXV0aG9yaXplZC4gSWYg
eW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgYW55IGRpc2Nsb3N1cmUsIGNvcHlp
bmcsIGRpc3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQgdG8gYmUgdGFr
ZW4gaW4gcmVsaWFuY2Ugb24gaXQsIGlzIHByb2hpYml0ZWQgYW5kIG1heSBiZSB1bmxhd2Z1bC4N
Cg==

