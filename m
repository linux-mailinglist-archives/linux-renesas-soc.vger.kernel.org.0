Return-Path: <linux-renesas-soc+bounces-16551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E16AA5A91
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 07:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74BB49C79B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800D11E5200;
	Thu,  1 May 2025 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GTVAvnGK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCA1537C8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078184; cv=fail; b=KcMTXAMQWVFaWLhT5YCNEdJYrLIWK0frE+W3oWTL7I2JHLWuMxGO7BASeCLkru/s9OnL59MTlSzkLFvFWAjFtfaQaA/2YCZkXNt+H/561GNFGLmmO9OVoXEec/Mfd21gZaKxC9KGe0ID+6bn2NuAHetkojA49iLTkVKgAsHIAls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078184; c=relaxed/simple;
	bh=e4JpHO39IdhlakFeastkj9HmVS9/FGWyr9i4bVNOaqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BIx4KxfoZvhhiFsWg9coDOzHZ6ACfFi49u7fNZpeBqsdMg1ajllzovjHFIxxLCeFc1UWHJ965ZmLIsNyFwXxWhIMo9gWEqzQPPUNPCM4YEP6iXF9NM9sbfZxH9jZzSjxxuybzyimsPM8nP7Ssd/Ki1k1c1E0TELbf9Huvp8uA94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GTVAvnGK; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y86DuS4Fl5028qxLXY0ITpwssJ1LZTUqSIXrBdJRu03WgMb9SC4dPsfSMvvHFiAV2ASuH26oVNaEtTuogAWQeJMxdaMBOyZXkh5AnlsGUuVVTOPD0tyhjRA3Y+upk4B8vFicre7wA8rGzpkbzi/rJmEsk1I5boxGQK3TPJgQnPfGoqWXdMapLXna1BcFLnsDstYCHOUS2Pc1mC8MMYoH8FVjOQcfLRGoU7G147UeRplmpP7TQfqkmiVqcNwS5aSYRIDBFQfxAujlDfg9anxR5N9x9t1nxg1+3CqFbI9j3UjyP5bNXzKkmiZqFtwEipVoSO0AzhycsqrvuG0VEU2v5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4JpHO39IdhlakFeastkj9HmVS9/FGWyr9i4bVNOaqs=;
 b=TRuL+aMXm48LoH7Ua3isrBoOv6t/aQIszEuQwQVq1YwIpes369kdIrLiZ/nq6ixfAKDIs52p1RrQrC5aunSDx+sg4yAYOeS7SpundmLFdt0iRAD75zfPHFQpplLjo2KyUph4xqjSXqyvfh/EjCR9F5xy5TNng+dh457NUaj5YkAnp3BClgLWN4LEtbXK/lhG1hIfyTPBfyIMN66H3/khklspdMxtdPy4+tqgBIr1d8aXONEHB6l8tiPADHGo3/n5LO8KvUEpxhbms8gwSdc79QMgTShDg5bsuPh9pVamKbAdXSy4fmAGq6ArVBZyi54vx53TlRBtKa9vA+M5hYhEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4JpHO39IdhlakFeastkj9HmVS9/FGWyr9i4bVNOaqs=;
 b=GTVAvnGKHtMSetz4JL0xTRo0x/puEn5fctT4s6LZI6RC3vR8k3ketoXo2kRgtPt0pO3QGdEWkj/LxqoDDLsSgb2QG459RYH5phPvnTyGqBLEWT8yxsPVmVaAKjrj0Cmz7+iZmfJZkKfbytmzL5B/S1B/ZT1auwYeXM3M9RFG3X8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16244.jpnprd01.prod.outlook.com (2603:1096:405:2da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 05:42:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 05:42:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown
	<broonie@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 2/7] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Topic: [PATCH v5 2/7] memory: renesas-rpc-if: Move rpc-if reg
 definitions
Thread-Index: AQHbtPdKRtYBLBMZbkK+xXeHzgMMYbO8lmAAgACz1RA=
Date: Thu, 1 May 2025 05:42:53 +0000
Message-ID:
 <TY3PR01MB113463F1877B0335DD574AF5986822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-3-biju.das.jz@bp.renesas.com>
 <50bf8a28-0a02-4230-9302-0a1b7c2b7793@kernel.org>
In-Reply-To: <50bf8a28-0a02-4230-9302-0a1b7c2b7793@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16244:EE_
x-ms-office365-filtering-correlation-id: 787b8fcd-7cb2-4387-181a-08dd88730464
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUJiaWRYU1ZBQjBuZlFtazRCL2Q4R3NSOUxWYzVoYi91VStjdnJpb0lZWjB3?=
 =?utf-8?B?Mi9lMGxVQ0xUM0FIL0FPcEtNTXBPTU8zSEYvK2E2WHJXQmNpUmIxVU56NUUw?=
 =?utf-8?B?TWhjVmNZM3RiOUdXcUw5bER3Y2x2NmFtdVo2REZsOFR1WXhjdHJjTzRFNTV4?=
 =?utf-8?B?Z3pqSzRBR0RreURDa2QwcjZwVWgzTEVoa1FSamFkS3dMaW4wb045bWNGbTl6?=
 =?utf-8?B?dlJyQm5yUXc2RmpCRHZiaEttbXRDVXh1ZG9KcUpoRUxWQzdxZkNMdTc1L1Fm?=
 =?utf-8?B?eDdNNENKLzQ0SXNTSlllUXZrbEdYRU5VQXhWWThtQk1zN0owdG4xT2p4bkpy?=
 =?utf-8?B?NXdFdTkxS2NIYTY4amVUWXExdHZnTHZaMTlWem92WHp3aUZITnk2YnM3emh2?=
 =?utf-8?B?V0NybkRGejJXYmdaUHZ0Z2htMytoZStYSVpmSVc5NGdLTUZqZk81MjNXdG1K?=
 =?utf-8?B?SGhDTldtZnN2dUJ0Qi85dk5OdkJUTjl3d0FDdW5Kbm9IVitwN25jakhKZUZn?=
 =?utf-8?B?dGZKUldka3VRQXQ1ekxvbzYxR2lpWFJUMjJRM0hyblpaUkZMejl5bis4b2FX?=
 =?utf-8?B?UzE1RjlRS3c1REhYdFB0dVJlaGdaVjRGS2IxeHpDOVV0RXNNb2RGbFN0bG9w?=
 =?utf-8?B?ZzJXN1JsaVJMbi9OdVhzS1pZako2MHNwaEdxOHVDdGluNzdFbDJRaC9rZEVC?=
 =?utf-8?B?dVVkYktnM3g3KzYvbnBXdHArQkNXdXNuOWZHeCtJTkNSU0V1d21YdHdLR3VJ?=
 =?utf-8?B?VUh0UkVXWjNZTTVrUVByckFnTW1JcnE2OWluc3MzQ2NZcEFSRzZhS0lSRUIy?=
 =?utf-8?B?SG5DZHdZYngvRUgwbnFaRWl6UVZUSTNKTlZ3RklmNDhZSWhjYmVaNU8vWG1B?=
 =?utf-8?B?SUFlNEU2Mng0Z3FXK2RYclhwOWRHaTVJZnJvcDN5bUN2ZFQyMkI0NmdwbVJS?=
 =?utf-8?B?T3lWZk1Cd00wdG03SzdsdWhJNWFsYUJUbE9nWlpZd0FpU3BHQkNmREtvYjJD?=
 =?utf-8?B?NENNS1FZa3BJT0R1MmdENEtwOWd4end1bDlMaUhzWDVQdVBMTjkyWnIrQnVQ?=
 =?utf-8?B?YzhqWjBrS2VHSUtHWWJKRlhiQ3dRT3pTTU4wa2hUVUFreTd0Q1drVnhrQWdR?=
 =?utf-8?B?SUJ2VE5ZTVBteE56bmJKb3NtNFluTWdjemlHenhMVTh4eElwaDFhZEwyZmRW?=
 =?utf-8?B?TVNMMGthbG1PTVpucDdxT2J0cHJpWEJOYWpuMUpPSjloSmFHQ0JMT0RnUHRo?=
 =?utf-8?B?UktQOXZidExtb3IwcUk4TGhoQ3RBN3l2aXhSNFZ6ekRodHJaMHo0OEFHOVBL?=
 =?utf-8?B?b2NTcFBoUllIV2lXWEZvMC9sTGJESm0xSU9DcTh4dFMxTjVhTXo5QkhqOXQx?=
 =?utf-8?B?UklIcG5tME9VWUdsWmVLK0VOZFVPVkNOYUxtc0x1UGlNNEVGRXpkVUwwb0Vx?=
 =?utf-8?B?Q0NUUjlyK3B3VUZFMW5ucjFGRkl0NlRRTkErWmNMSFg5Zjd2c1NsWk8rL2pY?=
 =?utf-8?B?TGJ0UVdEVFhZUXJjYWRLamF0TnJKdmZmKzYwb3ZJaWhGeGNHYjFaaXpYclJB?=
 =?utf-8?B?Q0lwN1BTcnUrV0RyS2JuY3dHZWg2M3ZpRUJ6VjJQQ29RTFN2Wlg0THdTRUsx?=
 =?utf-8?B?VmNpcVFMaThJdndHc3RUZmRXNytWOHlqcUNSRlIramFPWUdaekNtMnFjWTJa?=
 =?utf-8?B?cFlzWGZBZHV4N2taQlorOVVLQTd1dVlCb0R2R09qYnkxV0EwbEF1UmthdGZV?=
 =?utf-8?B?OCs2cGlNVFJyWkloeklVNUsvc3VKUE56eGt5VHNDOHQ5V1pYZzNubGwrSTc0?=
 =?utf-8?B?VE5NY0dRN1Q2OFZSUXlKSFNnSEQ5dG1JU3hEK3R4VXpNSXJlcE1HeVNYWVg4?=
 =?utf-8?B?U2dFT1V2bldiWENnTG1CWG9qdnA5UmdwS0NhakFQM3BRTVpzdnZiRjFlRFZk?=
 =?utf-8?B?cFNyT2c3YWRMdmJiOVZCRS9YeERHUS80WVVzWW1qLzZZdTlvbUx0eGNZdDl5?=
 =?utf-8?B?VC9hS1JFQkt3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFBWYmxXcDRhYnNjdysvOVBaa0lLY212T3ZSelhIZ2hqMWU2eFkzV0dWYUF5?=
 =?utf-8?B?Vk43UkRYdDlqVkhqcEttdnlQR1ZsaDFvWnZRYlpKazJpYm1KUEs4ZmE0RVVY?=
 =?utf-8?B?OTdqc2k3ejB3OFhheUFCbFprcjYwZHkyYUJxMUFZbFNsZ0s1NjVoZEIyTE5B?=
 =?utf-8?B?c3gyUHk2MTQ2MEZCTzBFVVcwa2NWUWVGVjhXSHFNVXpxQ001dEczUVFvNGpq?=
 =?utf-8?B?K3lOYldmcFJSTjNhMGJOVmkvVU1GenNiamxkd2ZPNTNvQWZFSVJxUE1kazJ3?=
 =?utf-8?B?Z3NtTXBxYUVRRk5PT3RlN3J2N3lRREtVRWUybS9pSDg2UGVwL00zbkV4Y1p5?=
 =?utf-8?B?V2pVSmUwRXB4TTZxVDFBWHdMRnlXM0pBUUJwL01sY0JmWnM0TzAxZkxNRGtj?=
 =?utf-8?B?ZkwwM0V3UGdUS20ra29KeGt0anZhSi9oU3RFblRaSm43eUw0NFo0azNmZ3pu?=
 =?utf-8?B?R0o1cFdlcWg3bWwzK2lZOUptZzVpRkJWQUZKS29lYkVRN1lMWWNsVnJTcWI2?=
 =?utf-8?B?cGVxQk93MERSSHduS0ZkSUVySCtTdyttWFRpYkFzVEJodnRwVjljMCtsTENR?=
 =?utf-8?B?MzVLQnl1SXlHYjZUVXZkYmlycTVsUnpLcnZROCtHREtLa2wxdkJBWFJZYkxt?=
 =?utf-8?B?UHFvR0JXTWxYejZ5d2F2NkZESk5OcUxvdUNlNGdPbk9qR0h2WlpPelFBcVR3?=
 =?utf-8?B?TzhqbVJiK1pFOWhCdlpzY2w5YzZKWGlBamRnS25RNFA1ZlliZzhVcllVMVhO?=
 =?utf-8?B?aWxLcURiQWR6b1o3WVMrNWo5WUg0cklnelBkYUJ4WVlYOGh6RWFraXlpT25L?=
 =?utf-8?B?ZXZzVWhKQll6YUh4bEwzaVBWbDBtbEtrZFIzNktQOVM3T3FySENCVldycEdE?=
 =?utf-8?B?RkIycWFaQi9qRktZVjBkOEpYaHdtMU8wYUFtdkt4SGFlbkVtamZqUU5sa01z?=
 =?utf-8?B?QXRDbjlsQWxIRUllTXNad2lhcjBGdTE5cWNTNXcrUHgvdUVseGJrd0k4SmFa?=
 =?utf-8?B?dm15bEVGbndhRUNCdEw0VFRIZ01yMUpIcEFUMWpGNVN2dUtkMWRQZkpsV2VQ?=
 =?utf-8?B?dXZRWUJPOE9wT2NmQ09hcFlVOFVhQjJwUnZaLzk1VytJNFpTZHJNemJRRVJv?=
 =?utf-8?B?MUR2M21oaFRNREx0L1Y1NzVDSVpMRVUrMHZ0UzlrbzdST3pURUx1TC82dVln?=
 =?utf-8?B?b1c4QTVpQ2NvWERuZEpaL3lLbmhqTmM3c0V4SXFIeFVsSnN3UEwxOWw3VHFG?=
 =?utf-8?B?eE9WOHJENVdlNEI2c1YrVGJMK04yYURwS3NhSlQ2UnZ3dDAzRXlYTng0ejhU?=
 =?utf-8?B?OG9jRXRDKzI0Vzdzc0NuSjdTeVBFVDNsc2lPM1ZVOG16U2p3L3YxYWxnRE12?=
 =?utf-8?B?aXF2dU1JajNXWjhWdG9Pc1JjRHVoNlZRL1ZqYUNDN3N6dE9xUGEvQXU1ZE51?=
 =?utf-8?B?K09rSEpyUEVBV0M3M2d0b1BoVi9ZeUZLWlRJQ0h3Z2Q1K0hEM3h6RUViZ3o3?=
 =?utf-8?B?QitaMHBQMlNwM2pOTHNwYUNSWHZBNGl4RC85WjkrSUpYTWtFODlBVGxSdnBE?=
 =?utf-8?B?U1ZjOGVoNnV1TFBiajJGQVNNbHpQVjNlOEJocC9TZ1QwQ0lpa05OakY5cnhD?=
 =?utf-8?B?Z09GTW8vb296WHhENGJ1dTgwY3BuTlNmVlBTbDl3SFBsQ1pZQUF4eFQ5ZkhF?=
 =?utf-8?B?bStpYTFSaDBEMlJsbEpORC9yNUJvZHdZM0x5Y0E1M0phTzhmeTU2QmxQMWkr?=
 =?utf-8?B?bnp1eUdiN0Y2bGJuMG1vbUUwT0NwUVhwTFVqdU91bEZnNC8xVXpWZkZUc0NR?=
 =?utf-8?B?ck5pditBOW9VWE5FU0dXY2N4MW5oMENhODUyZzVHajB2cGN2dlVPODR1Mk1Q?=
 =?utf-8?B?bjJ6c1VHRzJ1ekJaamxEQ3p4amZZdEZRcUNMQVBCNVRtVS9TbnBoQ1ZzVyt0?=
 =?utf-8?B?Vk8zTWhsN1R3NHBVZTF4OXZxYnlCVUxiVEJwSWVoVnB3OGRyT0lqQ2FyQkpl?=
 =?utf-8?B?b1pKOEZXVXd3MzFQUTAxLzNDMHFKM3FBUjZ1M3ZhSWd5ZG1mYW1CWWtOd2R2?=
 =?utf-8?B?dmxnS3RuN0VZK2lxamZyb3UxR254alh0Nis2VVNDclFOeFBYWno1RjJkTUti?=
 =?utf-8?B?Tk5OcGZ4OXh4UmQ5emZKeTd6UjNUbjB0dEgxSjVRelQrRkJ6NGhjVFlEekVW?=
 =?utf-8?B?M2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 787b8fcd-7cb2-4387-181a-08dd88730464
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 05:42:53.2691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EHcYGImSXsYbIaQyZ4v79tAEuh6YKCC5Y8/Aff4gRArZNHvP0JEAf66A5p21RMuqbTA9x8+wH0da14Xib+jwn7ndkHSCFRn+QfQWGO2H3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16244

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjUgMi83XSBtZW1vcnk6IHJlbmVzYXMtcnBjLWlmOiBNb3ZlIHJwYy1pZiBy
ZWcgZGVmaW5pdGlvbnMNCj4gDQo+IE9uIDI0LzA0LzIwMjUgMTA6NTksIEJpanUgRGFzIHdyb3Rl
Og0KPiA+IE1vdmUgcnBjLWlmIHJlZyBkZWZpbml0aW9ucyB0byBhIGhlYWRlciBmaWxlIGZvciB0
aGUgcHJlcGFyYXRpb24gb2YNCj4gPiBhZGRpbmcgc3VwcG9ydCBmb3IgUlovRzNFIFhTUEkgdGhh
dCBoYXMgZGlmZmVyZW50IHJlZ2lzdGVyIGRlZmluaXRpb25zLg0KPiA+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0t
LQ0KPiA+IHY0LT52NToNCj4gPiAgKiBObyBjaGFuZ2UuDQo+ID4gdjMtPnY0Og0KPiA+ICAqIENv
bGxlY3RlZCB0YWcuDQo+IA0KPiBXaHkgYXJlIHlvdSBzZW5kaW5nIHBhdGNoZXMgd2hpY2ggd2Vy
ZSB0d28gd2Vla3MgYmVmb3JlPw0KPiANCj4gVGhpcyBkb2VzIG5vdCBhcHBseSBub3csIHJlYmFz
ZS4NCg0KSXQgd29uJ3QgYXBwbHkgYWdhaW5zdCBtZW0tY3RybC1uZXh0IGFzIHlvdSBoYXZlbid0
IGFkZGVkIFsxXSBhbmQgWzJdIGZyb20gZm9yLXY2LjE2L3JlbmVzYXMtcnBjLWlmLg0KSSBzZWUg
cGF0Y2hlcyBbMV0gYW5kIFsyXSBpbiBuZXh0IGFuZCBmb3ItdjYuMTYvcmVuZXNhcy1ycGMtaWYg
WzNdLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBoYXZlIG1pc3NlZCBhbnl0aGluZy4NCg0K
WzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQv
bGludXgtbmV4dC5naXQvY29tbWl0Lz9oPW5leHQtMjAyNTA0MzAmaWQ9YmY2NTdlMjM0YWMxMjky
M2I1NzliMTNkOGI5ZjFiNWNhMDUxOTY5Nw0KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9oPW5leHQt
MjAyNTA0MzAmaWQ9NzRjMzVjODRmMmJhOTQyZTdhNzc0NDY1OGE4MjU3ZDBiMzE4OGFjMg0KWzNd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tyemsvbGlu
dXgtbWVtLWN0cmwuZ2l0L2xvZy8/aD1mb3ItdjYuMTYvcmVuZXNhcy1ycGMtaWYNCg0KQ2hlZXJz
LA0KQmlqdQ0KDQo=

