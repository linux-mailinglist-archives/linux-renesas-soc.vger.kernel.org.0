Return-Path: <linux-renesas-soc+bounces-27734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJLSMy8RfWmUQAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 21:14:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960DBE578
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 21:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70A02301C142
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 20:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA3633C507;
	Fri, 30 Jan 2026 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oAuOJDjk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC07314B84;
	Fri, 30 Jan 2026 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804069; cv=fail; b=mgM7mIdT4drwp4OhnqsP/Sfao9YLQnT3tpNQgCT+T0GXntRMOGQcAjbs4emCTuo8zGdk4PJDtzQFu+MYFY90XN7+G0fjWM0oYrOq7mEkc3Bll0twyjivVytYUdqWYl4Dp715CrQXcpnnzoRQNJCOOoRXLILL3pazSH5JiEmlfp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804069; c=relaxed/simple;
	bh=/oVxEokFha2qHdWHw62u1YUqbr/lV/zdjMh1c4G20ow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jeVjbcpx4ay8qbA08Nc8bH2TLkCNaG+XtbHfARRNYa5BgAeuaMC81bO+OsbyPSBwYsyDoMm37BvsamloDyb/a7EZTRzTuzI3oi3cBX2/mDyLp/7x+AM/PT4T6vA8vjRi0ymZwfgY7jygq+rRzIjNJECu7dQ1oJ4npREDxLoJZlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oAuOJDjk; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVf63bigscQ1o9pFUSA8N0f8HanE/xfUBprniQFZ3s6fjLPhT4z4nuRakV3+UkmOZeW9pypJzm3DCKEioOERZ1WmMQ/mSzYx0VBNFxkjVJegHPIIxQFnlo40hHcLwMmiTEWCyJir8ctqb2htFwPqdjVxiQ+vOX+DMAWfc0GvNWbW4CObnH+XP6zXXfojKBjln/xXAiZWj9apeohH3YtWGzNfFhuj8/3+H4nFTHuLAtpJfLtwyUIO8S7k1tdzZH6aCr9MNfgq0jfblh2PNvuyw1XDI06ODim2/Og3Y+hNh6QWePH8gukgSGnxuG0pzHRgcUxeIqgl4opbBkZN17qKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oVxEokFha2qHdWHw62u1YUqbr/lV/zdjMh1c4G20ow=;
 b=NYDlonAPIFUQci4lD3MIMg/EjmQP46R/pDfsOLmCiGdNZ6x2WpPIjgf3+BJkNv2Iz4ZZGOicOeacPY9N4s+v91YW+sdGwMNXj/mLoYHfb9zb2lYqOm/MQuiS6H0/QRyyoxoejUshUryMLtGHs7flKgwhrhx2pD39wW039dnNfyzwxeuxOlAtmbreEPcC93VTl6ejSyy0POxbAcyzrWU5iVjZFKICsbqruGPV/PdWBULVtTmhTIuMBwEy8os/sK/tItnvBTb3mG4tEVgyrzCOtzRMprMSdtEABYoeBLEm8P8R0JOK7X4bSLcSe7cEarl/VFbAYlmoAS432qhWPV81KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oVxEokFha2qHdWHw62u1YUqbr/lV/zdjMh1c4G20ow=;
 b=oAuOJDjkeMCyTq46hbDrDMWFjD9ZPp30So4HZAUtEdhJE0EZYfkF8H+1S8V83SgSOH7wVAbuEGV1evzwc+1WukqQLC7sCKbaov7Mw9Ltzy/HkvIadwyWPbpWIggbOicW6k+o+ZmAFRVo+qnCoAmOQ9PJq3xNU1jaNU3aKnEz5iI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB16933.jpnprd01.prod.outlook.com (2603:1096:405:334::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 20:14:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 20:14:19 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v4 02/15] PCI: renesas: rzg3s: Rework inbound window
 algorithm for multi-SoC support
Thread-Topic: [PATCH v4 02/15] PCI: renesas: rzg3s: Rework inbound window
 algorithm for multi-SoC support
Thread-Index: AQHckWgjSCy/DoU0CE6zTg9haScSQ7VqvJ2AgABqQgA=
Date: Fri, 30 Jan 2026 20:14:19 +0000
Message-ID:
 <TY6PR01MB1737715A8E2E5593AC90AAA43FF9FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-3-john.madieu.xa@bp.renesas.com>
 <4b4ddd9a-35d1-43d7-b25b-5101f914a68e@tuxon.dev>
In-Reply-To: <4b4ddd9a-35d1-43d7-b25b-5101f914a68e@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB16933:EE_
x-ms-office365-filtering-correlation-id: 315dd828-64d2-45ad-6570-08de603c26cf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVlUeXRTaTc3TmVtbzUrNlFuU2NZbExIK0Y2Sm05cmtsV1NVKzhEZGlZdGRn?=
 =?utf-8?B?V1dHUmp5REdmZFZwZkxmT3VDaWFuZGpsc25OSnZHOXNOWnZzWEJEZEg1aC9V?=
 =?utf-8?B?QUlsdmdoWEwwaFlJa29wZ0I4L0lCTzIzYXljMFVES2RoNXpwb3FjNVo5N2t2?=
 =?utf-8?B?YjZPZ291bWx5My9aSDFEbld0WVU5YXg2Y1ExMnZROWx2d3VoMUFWVVoya1Zr?=
 =?utf-8?B?cU9NMDVSandQMlFSRTRqMVM0and4Slo5bEFRTm1jNGZpZExkYitiem95TnVW?=
 =?utf-8?B?Q3FuVWtjc0JJWENINVBRT2RoaWJtZzJEM2FrNWNxMWVIM25rTU5BVmF0Uktm?=
 =?utf-8?B?OTFiMk01MHZ1dUJTWkpnMlJWWVBBSWNnYk43WjMvV0JxNzd2dXdsdXhaQnBQ?=
 =?utf-8?B?Yk9YZ1U1NlhoMnpwYm1jYWgxNUZ5N0NId00wbXk2ZnAxSDhlSklDT2treEow?=
 =?utf-8?B?S2Jvc3ZUSGRIUGpUcU40dlVibnplM2NWL0EyNTNWZDVjcm9sVlo1VG5sRTg1?=
 =?utf-8?B?VkVJbE16THN5WGlaUUNJcWxHeW1lS1hKa1RZc091QThkc1Y3Yjg1dkl3NWRH?=
 =?utf-8?B?N1poM3M0dlZYZytZdUdnQVhEdHVUc2NHVmF2Qjg2M0FsZ3FjS2lCbUpCTFZt?=
 =?utf-8?B?VmRrUGNJNDI2a2VTUThxSVNNbDU1U2REZDhkTGpKakVFaFJveG1wMEIzWUta?=
 =?utf-8?B?L2FZTzJGQjlHQlg0eDl3Yi9sallGdmZNaVhkbVF1a0RzUng5a2VBZ0p5cG96?=
 =?utf-8?B?aEpINDFUSzNOQ3p3UkhLUnFPSjhYQU5JZHl4aDdMb1hBTG1FNVRGbzRTVzBs?=
 =?utf-8?B?Nlk4RkQwTmxhQnlydzAvZlI4N2p3akFoV1R6OVkxREZjWjBUWXFudVJhVlYx?=
 =?utf-8?B?WEVlL0luTm1tWGVOTzFTWE11c2xLMEg5YlBURS90di82aHBlTzEwZUEwNy9k?=
 =?utf-8?B?Nko3YWFNaERSNWVRNmJBcmVSdHRKWnkzekZpZDAvZVdWYTAyeTZOaWRIL3U1?=
 =?utf-8?B?TVNIYlQrcGRtYkUwVndjazAycG1HYTEyNzdtRGVVK0loR0pRbHphOHRTdVRO?=
 =?utf-8?B?V1FnMjNyUzZFMlM1T1VNVHVRS1JKdkNPNHFYZVFGa2NPbkN1dGJIN2JmTmxI?=
 =?utf-8?B?R1VDSTFKK28xRldLbTlwbjR4MWl6aWwyR2hxNVRsdWlkL2pvOXUzSmZJcEFH?=
 =?utf-8?B?Q3BoVElwQzBSZ0VBY1c2NW9rb1hvVjU1bXJOVFBCY2ZtZWxjZUowekpUSTcx?=
 =?utf-8?B?Rmg3K2FabWFmYys0Y1Y0Y3NDOEhhQ0hZdnV4UDJoZ0pZUzM5Rkt1alJBUVFZ?=
 =?utf-8?B?bXRzd2s0Q1ZwVUsxaktVK0NSOVZ6VFk1MWM1YVliZ3RmMFk3ZzBaQThKL2Nn?=
 =?utf-8?B?TUY5YWw5TkQ1MVhaS1o2MGdvdk95K3FuYzNGL2oycitoRW5IdkY4YlJRL1Fj?=
 =?utf-8?B?dUpVeitwZHFPZEh3aEdDdXpZWk9tMUVyUzlXL3JOdVVBLzRNay93dm96Y25P?=
 =?utf-8?B?THBNWXlISXFKaHhJYmd0dzJRY3J6Qjh1UzlBclR3Z2UvUDU1QzArTkdrSXBN?=
 =?utf-8?B?R1FCSVlKZTZFUG55WXlFTmxGU3cvdldMeGE2ZVIrb2s2Q0NNUGtpcnFqdDl6?=
 =?utf-8?B?bkpVY0xtb2RZWGJLZjhDYWJVenRTRXlwTmNwZkJGNGY4a0tXOFIyTTJUd1p0?=
 =?utf-8?B?ZHhKR0kyQTUrUGtxZU1PdlMxVjVQSlJZWGxrN3dUMDgydUp6OWg4WjA0dUVl?=
 =?utf-8?B?MmxvemkxUUw3emhCRmhwMU9KZ1RHUVRWUXZaSFJ2VnJrQStlc3BMendpaHZ3?=
 =?utf-8?B?bjhvNjI5RE1oRTdYQXd2eXFPclFoSGl5VzMyOFJlQmVzbk9ZWlU3WlVYSnpF?=
 =?utf-8?B?WFFLSDk4OXhOZWJyQkhWaVluS1dpMFh2MkxwaG4xVjJITTYvR0EydW5YS3pt?=
 =?utf-8?B?SmZaVTBraWkvNjdjTSsyUDVBeDJhb2lNQ3BDY0gvb01TTktpc0NPTHRmVGZN?=
 =?utf-8?B?QTFLdVFJUlNFV29kaTJYNSs5YWhicXQxSFUwWmt6N0lZTitoUERNZlN2R2g4?=
 =?utf-8?B?cjlkMW5Ja1dqajhHa1JhUlVtem9yQ3JZemJXUXMxNVQzaE04dU1xRklIWERp?=
 =?utf-8?B?MUkzRGhnMktTUCtvRkdrSUljaXRqdktVNFZnQldYRUJ5WXZJWmQzYno1MjZE?=
 =?utf-8?Q?E3LFninSwU2bEdU3wu5N7lQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R21PY2d0QXIxTW5zcC91cG52VFRRU0VMTXhSbERycndEeU9ZK0ZWajh1cmtD?=
 =?utf-8?B?djhjVUk2em9ZTk1CRktyOTBWdHBrZlhJbTVvRDJPRWI1S1hha2NrNkg2cE1U?=
 =?utf-8?B?MERZZzE3Vi83aFZIWmdPWHgyaDh1dGFTTjVCZlRDWlVuWDRKa3NRekJqdXFE?=
 =?utf-8?B?UStQR3pUaHpYMDM3c2xzK3cwRGYrQk9rVGE3TVhVb0RYRUVkNElsRXNhZ2tZ?=
 =?utf-8?B?T011RWhJbEcyS3M4dUNSaVJpYzZub2ZjdUtqUlovVnpEYTRIdWs5SW5yaHFY?=
 =?utf-8?B?bkYrY3dlb1ZCZWtxdDRLcGV3NWRMV0FVbDVsSWtoVGpUT3pMdVZDUWNTVnlL?=
 =?utf-8?B?Z3pDUE9VN1pObkdVTWQ0Z3FyQUdkQzlRUDBZWjR6MGo0WHV2QklWT0pTdmcr?=
 =?utf-8?B?MlJHVVlKTnFBTlREODlaMEwybWpwWDg1Wkxycy9BdWJ6c0xBbG9Dc1lJeW92?=
 =?utf-8?B?UGFQYUJ1Wk15Rm42cWd5bHM4RG16UFRKcForQnc3QTB4NkhSQ0hjRUNHRWV0?=
 =?utf-8?B?VjdJRnl6dllCSHFNSGtpZTVnYWJyVkxZUStxMHAwckovSk81R1RVb1RGcEs4?=
 =?utf-8?B?bWxhMUkvdkpnU25CK2NRbldTZE1KZUlNcXp4Z0NLWTJ4VjF2ZnRLS2NtcHdt?=
 =?utf-8?B?YnRFeCthd0lTUUtuRHhySUcrSC81dSswcUVFS3JuajRYUzNvSkU4NzlnVEZx?=
 =?utf-8?B?bzlHQ1g3eXZYTlA3d2tMdGFaTkkxVEZUeDQ5MElxaTdkdmZnOEdJV3Q3TmUr?=
 =?utf-8?B?UjIxTTl6aGErOWFZc1JselhSMW44bmExeGQ4RXY5QnpXTWNBWUpIem8zSFg1?=
 =?utf-8?B?VTZSR25icUJLUG1qblZScmM3dkgxNzAza1pqK1cwRWJmTzgzZlZZazM0dDg3?=
 =?utf-8?B?V1RMRTR2RnZYdGJ6WUFMclQvRHo0eFcyWW9IYnFLSUxBZ2g3TDNtNHNubzRJ?=
 =?utf-8?B?akRmbVQyRzU1d0hhNmtWeC81Qm56azQyT2owYmtHeWxSRkE3aXZuQThXQ2ov?=
 =?utf-8?B?dFVHNUp2NlN5cDkzV3FCeEZQeDY3akZGQW5aV2tzaEhTbE0xNkpxaFVSRklI?=
 =?utf-8?B?ZU42bGlFLzFGQmNtakhDL2labisyKzlSNmdvNWYvM2VjQm5URjlvVFkxM09P?=
 =?utf-8?B?anZwRDlFTUVnOEdYSHNCamVQZFYweFVLcXdKS0ErQ2VrR3ZjWGhNb0JqZmpv?=
 =?utf-8?B?S2JsNUNZSDBtYW5SME9ZSkdNNGRkWUpoVGx4ZHpOMkZ0aitvSXRqVXpGWEkw?=
 =?utf-8?B?T2N3ZkVOTFFCOHQ4YnBWS3RmTWFrTzVOYnpad3lETGd3YWNMZ0RMcTNLcjRq?=
 =?utf-8?B?c0s0cXdnTkdpNDY2YXhRWDh6bFdOUXdxdGxzdTBrNkp5VnhYcTBVRU5GUmdY?=
 =?utf-8?B?L0R5OUM2QSt2TjloYjRIN3hJK2FIQzNpZDZkMzB2Zyt2NVhBMWhGK3FXQjAv?=
 =?utf-8?B?SkIzRWxPVys2RkFqSm1rMUJuY0RheDI1c28vQUJGcm1NOURXRnRmaWhxTjFM?=
 =?utf-8?B?d2hyclh3NG5GT2p1SzB2TjdENjhBYnNsbUR1UjFRTG82K0ZjTFpvQXR5RmhF?=
 =?utf-8?B?Zkl6UzNVRmEzUFVudVBuL25tWGYvSUpQUVlBdXpqVDZDNGZRejcwcDM1azFM?=
 =?utf-8?B?d2J6Vkxlamp1Wjl0VWRGV3c1NFhteWI3QllpdDcwU2RYN1RsWVprUXl2UlY1?=
 =?utf-8?B?UklNQld5SzhRSXJ1NlpqTWh4ZHh3R1BIZ0tvZ0RuUElnUFJkeDlSY08rVkZ2?=
 =?utf-8?B?bEpBYkkxWTdFd3lVZjlCVTdQRS9tVTVjcWlQeFhLb2RpS09oZ2QrU3M2eGJi?=
 =?utf-8?B?RlZBSTdSZVowOXhNem9hNmpOZWJYclRuUUpoSnRqYXlqdTR1RG91MmdiTUlP?=
 =?utf-8?B?T1ZoVDlsOWI3VUFnTFoydTBVWUx2MkZ1dTJ2cGpyVzArYTBXUnFZMFhzSXkr?=
 =?utf-8?B?d0tSN1NFRVFyQzMrZjkzZHJEVnFZbGZjQW82cGRza0N0eTA1T1ZZZzJUbXk2?=
 =?utf-8?B?TklRL3NweTQxYmZZa1FDVFdjQVEwQzhPenhLMnF5VEdST3dPNStCZHlRcnNx?=
 =?utf-8?B?Y2xGeUlQVC9ITnpTUjBMS2dac0hEOG1lTXNPNk1YallZdXBRcnM4OWxUS0pJ?=
 =?utf-8?B?cjBNa1FMZmZXL0pCZUd3bU1yNmFVYVdTd29lb1czdFE0OWRRZXlXbUVZdkpi?=
 =?utf-8?B?bE1RaXVLbjRnOE9McFNiSkZiNFBzcm5nNytNcFByUWJ6Y2ZUY3prenBQSFE3?=
 =?utf-8?B?UlQ5UlpLVTdOQXB2blB0eEpYTWUwRGVtSEV0Wmd2cEU2OG1odkhkQk9yZW5t?=
 =?utf-8?B?UXlaemVld2NqalU1eGFYcUlaTTBNdk1hRGYxNWlzMFlHa0JOdytLajJTMlQ4?=
 =?utf-8?Q?P0aLy8QPcaUl6NYw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315dd828-64d2-45ad-6570-08de603c26cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 20:14:19.8157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKn3t3b8Zo1zLc9LForWawjWnas9tJRs/7ZP77VNwsUPatjPRxFQ3YQQJ4HL9dz31/4cZw6z96opCT7i3/HgJdBuiQlvuc3ivcXok+apt1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16933
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27734-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,renesas.com:email,tuxon.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7960DBE578
X-Rspamd-Action: no action

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMzAsIDIwMjYgMjo1MyBQTQ0KPiBUbzog
Sm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpu
ZWENCj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPjsgbHBpZXJhbGlzaUBrZXJu
ZWwub3JnOw0KPiBrd2lsY3p5bnNraUBrZXJuZWwub3JnOyBtYW5pQGtlcm5lbC5vcmc7IGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlOw0KPiBrcnprK2R0QGtlcm5lbC5vcmcNCj4gQ2M6IHJvYmhAa2Vy
bmVsLm9yZzsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsgY29ub3IrZHRAa2VybmVsLm9yZzsgbWFnbnVz
LmRhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT47IGxpbnV4LQ0KPiBwY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1jbGtAdmdlci5rZXJuZWwub3JnOw0KPiBqb2huLm1hZGlldUBnbWFpbC5jb20NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NCAwMi8xNV0gUENJOiByZW5lc2FzOiByemczczogUmV3b3JrIGlu
Ym91bmQgd2luZG93DQo+IGFsZ29yaXRobSBmb3IgbXVsdGktU29DIHN1cHBvcnQNCj4gDQo+IEhp
LCBKb2huLA0KPiANCj4gT24gMS8yOS8yNiAyMzo0MSwgSm9obiBNYWRpZXUgd3JvdGU6DQo+ID4g
VGhlIGV4aXN0aW5nIGluYm91bmQgd2luZG93IGNvbmZpZ3VyYXRpb24gYWxnb3JpdGhtIGhhcyB0
d28gaXNzdWVzDQo+ID4gdGhhdCBwcmV2ZW50IHByb3BlciBvcGVyYXRpb24gb24gUlovRzNFOg0K
PiA+DQo+ID4gMS4gT3Zlci1tYXBwaW5nOiBVc2luZyByb3VuZHVwX3Bvd19vZl90d28oKSBvbiB0
aGUgcmVtYWluaW5nIHJlZ2lvbiBzaXplDQo+ID4gICAgIGNhbiByZXN1bHQgaW4gd2luZG93cyB0
aGF0IGV4dGVuZCBiZXlvbmQgdGhlIGludGVuZGVkIG1lbW9yeSByZWdpb24uDQo+ID4NCj4gPiAy
LiBBbGlnbm1lbnQgdmlvbGF0aW9uOiBBZGRyZXNzZXMgYXJlIG9ubHkgYWxpZ25lZCB0byA0SyBy
ZWdhcmRsZXNzIG9mDQo+ID4gICAgIHRoZSBhY3R1YWwgd2luZG93IHNpemUuIEFjY29yZGluZyB0
byB0aGUgUlovRzNTIEhXIG1hbnVhbCAoUmV2LjEuMTAsDQo+ID4gICAgIHNlY3Rpb24gMzQuMy43
LjYpIGFuZCBSWi9HM0UgSFcgbWFudWFsIChSZXYuMS4xNSwgc2VjdGlvbg0KPiA+IDYuNi43LjYp
LA0KPiANCj4gU2VjdGlvbiAzNC4zLjcuNiBkb2VzIG5vdCBleGlzdCBvbiBSWi9HM1MgUmV2LjEu
MTAgbmVpdGhlciBvbiBsYXRlcg0KPiByZXZpc2lvbnMuIEkgc3VwcG9zZSB0aGlzIGhhZCB0byBi
ZSAzNC42LjYsIHBvaW50IDcuDQo+IA0KPiA+ICAgICBiaXQgY2FycnkgbXVzdCBub3Qgb2NjdXIg
d2hlbiBhZGRpbmcgQVhJIFdpbmRvdyBCYXNlIGFuZCBBWEkgV2luZG93DQo+ID4gICAgIE1hc2sg
cmVnaXN0ZXJzLiBUaGlzIGVmZmVjdGl2ZWx5IHJlcXVpcmVzIHRoZSBiYXNlIGFkZHJlc3MgdG8g
YmUNCj4gPiAgICAgYWxpZ25lZCB0byB0aGUgd2luZG93IHNpemUuDQo+ID4NCj4gPiBXaGlsZSBS
Wi9HM1MgdG9sZXJhdGVzIHRoZXNlIGlzc3VlcywNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgaXQgdG9s
ZXJhdGVzIHRoaXMgYnV0IEkgaGF2ZW4ndCB0ZXN0ZWQgbW9yZSB0aGFuIG9uZSB3aW5kb3cuDQo+
IA0KPiA+IFJaL0czRSBzdHJpY3RseSBlbmZvcmNlcyB0aGVzZQ0KPiA+IGNvbnN0cmFpbnRzIGFu
ZCByZXF1aXJlcyBwcmVjaXNlIHdpbmRvdyBib3VuZGFyaWVzIHdpdGggcHJvcGVybHkNCj4gPiBh
bGlnbmVkIGFkZHJlc3Nlcy4NCj4gPg0KPiA+IFJld29yayB0aGUgYWxnb3JpdGhtIHRvIHByb3Bl
cmx5IGhhbmRsZSBhcmJpdHJhcnkgcmVnaW9uIHNpemVzIGFuZA0KPiA+IGFsaWdubWVudCBjb25z
dHJhaW50cyBieSBzcGxpdHRpbmcgbm9uLXBvd2VyLW9mLTIgcmVnaW9ucyBpbnRvDQo+ID4gbXVs
dGlwbGUgd2luZG93cy4gVGhlIG5ldyBhcHByb2FjaCBpdGVyYXRpdmVseSBzZWxlY3RzIHRoZSBs
YXJnZXN0DQo+ID4gcG93ZXItb2YtMiBzaXplIHRoYXQ6DQo+ID4gICAtIEZpdHMgd2l0aGluIHRo
ZSByZW1haW5pbmcgcmVnaW9uIChfX2ZscyBvZiByZW1haW5pbmcgc2l6ZSkNCj4gPiAgIC0gRG9l
cyBub3QgZXhjZWVkIHRoZSBuYXR1cmFsIGFsaWdubWVudCBvZiB0aGUgQ1BVIGFkZHJlc3MgKF9f
ZmZzKQ0KPiA+ICAgLSBEb2VzIG5vdCBleGNlZWQgdGhlIG5hdHVyYWwgYWxpZ25tZW50IG9mIHRo
ZSBQQ0kgYWRkcmVzcyAoX19mZnMpDQo+ID4NCj4gPiBUaGlzIGVuc3VyZXMgd2luZG93cyBuZXZl
ciBvdmVyLW1hcCBiZXlvbmQgdGhlIGludGVuZGVkIHJlZ2lvbiBhbmQNCj4gPiBzYXRpc2ZpZXMg
dGhlIGhhcmR3YXJlIHJlcXVpcmVtZW50IHRoYXQgYmFzZSBhZGRyZXNzICsgbWFzayBtdXN0IG5v
dA0KPiA+IGNhdXNlIGJpdCBjYXJyeSwgd2hpbGUgbWFpbnRhaW5pbmcgdGhlIDRLICogMl5OIGJ5
dGUgd2luZG93IHNpemUNCj4gPiBjb25zdHJhaW50Lg0KPiA+DQo+ID4gVGhlIHJld29ya2VkIGFs
Z29yaXRobSBpcyByZXF1aXJlZCBmb3IgUlovRzNFIHN1cHBvcnQgYW5kIHJlbWFpbnMNCj4gPiBm
dWxseSBjb21wYXRpYmxlIHdpdGggUlovRzNTLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9o
biBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+DQo+
ID4gQ2hhbmdlczoNCj4gPg0KPiA+IHY0OiBObyBjaGFuZ2VzDQo+ID4gdjM6IE5vIGNoYW5nZXMN
Cj4gPiB2MjogTmV3IHBhdGNoDQo+ID4NCj4gPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1yemczcy1ob3N0LmMgfCA1MyArKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4g
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4gaW5kZXggNThl
NzhmYzUyOTEzLi43YjQyZjk0MTVkM2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpZS1yemczcy1ob3N0LmMNCj4gPiBAQCAtMTI3MCw1MCArMTI3MCw1OSBAQCBzdGF0aWMg
aW50IHJ6ZzNzX3BjaWVfc2V0X2luYm91bmRfd2luZG93cyhzdHJ1Y3QNCj4gcnpnM3NfcGNpZV9o
b3N0ICpob3N0LA0KPiA+ICAgCXU2NCBwY2lfYWRkciA9IGVudHJ5LT5yZXMtPnN0YXJ0IC0gZW50
cnktPm9mZnNldDsNCj4gPiAgIAl1NjQgY3B1X2FkZHIgPSBlbnRyeS0+cmVzLT5zdGFydDsNCj4g
PiAgIAl1NjQgY3B1X2VuZCA9IGVudHJ5LT5yZXMtPmVuZDsNCj4gPiAtCXU2NCBzaXplX2lkID0g
MDsNCj4gPiAgIAlpbnQgaWQgPSAqaW5kZXg7DQo+ID4gICAJdTY0IHNpemU7DQo+ID4NCj4gPiAt
CXdoaWxlIChjcHVfYWRkciA8IGNwdV9lbmQpIHsNCj4gPiArCS8qDQo+ID4gKwkgKiBBY2NvcmRp
bmcgdG8gdGhlIFJaL0czUyBIVyBtYW51YWwgKFJldi4xLjEwLCBzZWN0aW9uIDM0LjMuNy42KQ0K
PiANCj4gcy8zNC4zLjcuNi8zNC42LjYuNyBvciAzNC42LjYgcG9pbnQgNw0KPiANCg0KTm90ZWQg
Zm9yIHY0Lg0KDQo+IA0KPiA+IGFuZA0KPiA+ICsJICogUlovRzNFIEhXIG1hbnVhbCAoUmV2LjEu
MTUsIHNlY3Rpb24gNi42LjcuNik6DQo+ID4gKwkgKiAtIEVhY2ggd2luZG93IG11c3QgYmUgYSBz
aW5nbGUgbWVtb3J5IHNpemUgb2YgcG93ZXIgb2YgdHdvDQo+ID4gKwkgKiAtIE1hc2sgcmVnaXN0
ZXJzIG11c3QgYmUgc2V0IHRvICgyXk4gLSAxKQ0KPiA+ICsJICogLSBCaXQgY2FycnkgbXVzdCBu
b3Qgb2NjdXIgd2hlbiBhZGRpbmcgYmFzZSBhbmQgbWFzayByZWdpc3RlcnMsDQo+ID4gKwkgKiAg
IG1lYW5pbmcgdGhlIGJhc2UgYWRkcmVzcyBtdXN0IGJlIGFsaWduZWQgdG8gdGhlIHdpbmRvdyBz
aXplDQo+ID4gKwkgKg0KPiA+ICsJICogU3BsaXQgbm9uLXBvd2VyLW9mLTIgcmVnaW9ucyBpbnRv
IG11bHRpcGxlIHdpbmRvd3MgdG8gc2F0aXNmeQ0KPiA+ICsJICogdGhlc2UgY29uc3RyYWludHMg
d2l0aG91dCBvdmVyLW1hcHBpbmcuDQo+ID4gKwkgKi8NCj4gPiArCXdoaWxlIChjcHVfYWRkciA8
PSBjcHVfZW5kKSB7DQo+ID4gKwkJdTY0IHJlbWFpbmluZ19zaXplID0gY3B1X2VuZCAtIGNwdV9h
ZGRyICsgMTsNCj4gPiArCQl1NjQgYWxpZ25fbGltaXQ7DQo+ID4gKw0KPiA+ICAgCQlpZiAoaWQg
Pj0gUlpHM1NfTUFYX1dJTkRPV1MpDQo+ID4gICAJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShob3N0
LT5kZXYsIC1FTk9TUEMsDQo+ID4gICAJCQkJCSAgICAgIkZhaWxlZCB0byBtYXAgaW5ib3VuZCB3
aW5kb3cgZm9yDQo+IHJlc291cmNlICglcylcbiIsDQo+ID4gICAJCQkJCSAgICAgZW50cnktPnJl
cy0+bmFtZSk7DQo+ID4NCj4gPiAtCQlzaXplID0gcmVzb3VyY2Vfc2l6ZShlbnRyeS0+cmVzKSAt
IHNpemVfaWQ7DQo+ID4gKwkJLyogU3RhcnQgd2l0aCBsYXJnZXN0IHBvd2VyLW9mLXR3byB0aGF0
IGZpdHMgaW4gcmVtYWluaW5nIHNpemUNCj4gKi8NCj4gPiArCQlzaXplID0gMVVMTCA8PCBfX2Zs
cyhyZW1haW5pbmdfc2l6ZSk7DQo+ID4NCj4gPiAgIAkJLyoNCj4gPiAtCQkgKiBBY2NvcmRpbmcg
dG8gdGhlIFJaL0czUyBIVyBtYW51YWwgKFJldi4xLjEwLA0KPiA+IC0JCSAqIHNlY3Rpb24gMzQu
My4xLjcxIEFYSSBXaW5kb3cgTWFzayAoTG93ZXIpIFJlZ2lzdGVycykgdGhlDQo+IG1pbg0KPiA+
IC0JCSAqIHNpemUgaXMgNEsuDQo+ID4gKwkJICogVGhlICJubyBiaXQgY2FycnkiIHJ1bGUgcmVx
dWlyZXMgYmFzZSBhZGRyZXNzZXMgdG8gYmUNCj4gPiArCQkgKiBhbGlnbmVkIHRvIHRoZSB3aW5k
b3cgc2l6ZS4gRmluZCB0aGUgbWF4aW11bSB3aW5kb3cgc2l6ZQ0KPiA+ICsJCSAqIHRoYXQgYm90
aCBhZGRyZXNzZXMgY2FuIHN1cHBvcnQgYmFzZWQgb24gdGhlaXIgbmF0dXJhbA0KPiA+ICsJCSAq
IGFsaWdubWVudCAobG93ZXN0IHNldCBiaXQpLg0KPiA+ICAgCQkgKi8NCj4gPiAtCQlzaXplID0g
bWF4KHNpemUsIFNaXzRLKTsNCj4gPiArCQlhbGlnbl9saW1pdCA9IG1pbihjcHVfYWRkciA/ICgx
VUxMIDw8IF9fZmZzKGNwdV9hZGRyKSkgOg0KPiB+MFVMTCwNCj4gPiArCQkJCSAgcGNpX2FkZHIg
PyAoMVVMTCA8PCBfX2ZmcyhwY2lfYWRkcikpIDogfjBVTEwpOw0KPiA+ICsNCj4gPiArCQlzaXpl
ID0gbWluKHNpemUsIGFsaWduX2xpbWl0KTsNCj4gPg0KPiA+ICAgCQkvKg0KPiA+IC0JCSAqIEFj
Y29yZGluZyB0aGUgUlovRzNTIEhXIG1hbnVhbCAoUmV2LjEuMTAsIHNlY3Rpb25zOg0KPiA+IC0J
CSAqIC0gMzQuMy4xLjY5IEFYSSBXaW5kb3cgQmFzZSAoTG93ZXIpIFJlZ2lzdGVycw0KPiA+IC0J
CSAqIC0gMzQuMy4xLjcxIEFYSSBXaW5kb3cgTWFzayAoTG93ZXIpIFJlZ2lzdGVycw0KPiA+IC0J
CSAqIC0gMzQuMy4xLjczIEFYSSBEZXN0aW5hdGlvbiAoTG93ZXIpIFJlZ2lzdGVycykNCj4gPiAt
CQkgKiB0aGUgQ1BVIGFkZHIsIFBDSWUgYWRkciwgc2l6ZSBzaG91bGQgYmUgNEsgYWxpZ25lZCBh
bmQgYmUgYQ0KPiA+IC0JCSAqIHBvd2VyIG9mIDIuDQo+ID4gKwkJICogTWluaW11bSB3aW5kb3cg
c2l6ZSBpcyA0S0IuDQo+ID4gKwkJICogU2VlIFJaL0czUyBIVyBtYW51YWwgKFJldi4xLjEwLCBz
ZWN0aW9uIDM0LjMuMS43MSkgYW5kDQo+ID4gKwkJICogUlovRzNFIEhXIG1hbnVhbCAoUmV2LjEu
MTUsIHNlY3Rpb24gNi42LjQuMS4zLig3NCkpLg0KPiA+ICAgCQkgKi8NCj4gPiAtCQlzaXplID0g
QUxJR04oc2l6ZSwgU1pfNEspOw0KPiA+IC0JCXNpemUgPSByb3VuZHVwX3Bvd19vZl90d28oc2l6
ZSk7DQo+ID4gLQ0KPiA+IC0JCWNwdV9hZGRyID0gQUxJR04oY3B1X2FkZHIsIFNaXzRLKTsNCj4g
PiAtCQlwY2lfYWRkciA9IEFMSUdOKHBjaV9hZGRyLCBTWl80Syk7DQo+ID4gKwkJc2l6ZSA9IG1h
eChzaXplLCBTWl80Syk7DQo+ID4NCj4gPiAgIAkJLyoNCj4gPiAtCQkgKiBBY2NvcmRpbmcgdG8g
dGhlIFJaL0czUyBIVyBtYW51YWwgKFJldi4xLjEwLCBzZWN0aW9uDQo+ID4gLQkJICogMzQuMy4x
LjcxIEFYSSBXaW5kb3cgTWFzayAoTG93ZXIpIFJlZ2lzdGVycykgSFcgZXhwZWN0cw0KPiBmaXJz
dA0KPiA+IC0JCSAqIDEyIExTQiBiaXRzIHRvIGJlIDB4ZmZmLiBTdWJ0cmFjdCAxIGZyb20gc2l6
ZSBmb3IgdGhpcy4NCj4gPiArCQkgKiBIVyBleHBlY3RzIChzaXplIC0gMSkgZm9yIG1hc2sgcmVn
aXN0ZXIsIGUuZy4sIGEgNEtCIHdpbmRvdw0KPiA+ICsJCSAqICgweDEwMDApIHJlcXVpcmVzIG1h
c2sgdmFsdWUgMHhGRkYuDQo+IA0KPiBUaGlzIGNoYW5nZSBpcyB1bnJlbGF0ZWQgZm9yIHRoaXMg
cGF0Y2guIEl0IGNhbiBiZSBkcm9wcGVkLg0KPiANCg0KV2lsbCBkcm9wIGl0IGluIHY1Lg0KDQpS
ZWdhcmRzLA0KSm9obg0KDQo+IFdpdGggdGhvc2UgYWRkcmVzc2VkOg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+ID4gICAJCSAqLw0KPiA+ICAgCQlyemczc19wY2llX3NldF9pbmJvdW5kX3dpbmRvdyhob3N0
LCBjcHVfYWRkciwgcGNpX2FkZHIsDQo+ID4gICAJCQkJCSAgICAgIHNpemUgLSAxLCBpZCk7DQo+
ID4NCj4gPiAgIAkJcGNpX2FkZHIgKz0gc2l6ZTsNCj4gPiAgIAkJY3B1X2FkZHIgKz0gc2l6ZTsN
Cj4gPiAtCQlzaXplX2lkID0gc2l6ZTsNCj4gPiAgIAkJaWQrKzsNCj4gPiAgIAl9DQo+ID4gICAJ
KmluZGV4ID0gaWQ7DQoNCg==

