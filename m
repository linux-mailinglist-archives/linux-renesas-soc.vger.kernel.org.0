Return-Path: <linux-renesas-soc+bounces-27154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHQaMEbxb2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:19:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED234C204
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 448ECA228B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F333A1A42;
	Tue, 20 Jan 2026 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DR9yCotR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573686277;
	Tue, 20 Jan 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938759; cv=fail; b=dCwgq7VCk9D+z9znPCV2RJgMx6mQKnhhmcTeMzbPHL5z6Wcr/UqqVrYKTjGd268qe1+Sh5coZzAKASseuKMemOiamElqxNbqi5qLTpGHgESOQT+9dtMW3oPzNsOLkixVPQiX97KbFnQwnaDqlKb0hBanMrK07Umk8Y1og4EhzWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938759; c=relaxed/simple;
	bh=isFXY6iV/4TVStZkAx8RsRaumXJw9mY2FBaIOO8jFE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vmh3CqPM4VeO5rddZ2XH/XymUTnFp6KW1htzsBJeD8icqGj65tbMgch2hBZMyusfFeySiQ2eKlgcTU3FYsvVmqcAAfiDSuCWFZv1zX+eGrQVB/uiMoIfivMV5JLClmjOMXpbBcTg3o6miDyAZ/n1KfJtIGhHqbVbTfNCYHPgjUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DR9yCotR; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpTUUek98U2c14gZOXSDRTnIdPFTFQvN0Gr6iRbWw1fWRsxOCIH15qvtk8hZ4NFlGro16yyBxzKRXisVxBdefXP0RNAIQ0cNtwW+PwP8efyMgEna0KVX0AGq+huvKk/zTdxRrSgTMcBzi1NFNmgThuGLdFxGmHYb3aT9JNP+X6MfZ4IyV+i/HxYfSZQf0QoiQFNinxwPmc2cghMqYV8F6vd46s1MvwUALOxBX6cXqzDHzVNGNFJ24CmZ5eXkxRl3CVVtZPpFEiUNwT+Pm+Kcjcc3+RWMNYBcu49sf8couUp5q6O5PURtcLkDaEgnSQi7Lyo2J4dkojTaXcWrK9aYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isFXY6iV/4TVStZkAx8RsRaumXJw9mY2FBaIOO8jFE4=;
 b=rLLy8/TTQ3UClvZPl8IUfMrPOflCGxuhSkV70XL9g8GOmAq004/Mws/aMXrHNdN14aal7hvtwljrKEzFxy/1G9ktNV0t5+35PSOkJ2oU3VSVKxHVZfv4cRIPiAtXfsGhXqr39pDCViJPClHff/aX+8Iy5PPITIzKp5REvvXf1H6aEa5RKtE7nQ5aHnXX3Gf8Gn6UqJn9KXqPFh7aKZocYqVhFLSNWIrf04joLl6JoEOHQxIvEoTFPvxfDRkDZ8e9N2nlXb1g+yrYp8tJnGOxk16sCHcrSS5KuroE1pmublJi4a+bU6Kp/cjsLcvETDs6e+rN829IcfXNGPsgeA8dWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isFXY6iV/4TVStZkAx8RsRaumXJw9mY2FBaIOO8jFE4=;
 b=DR9yCotRJBWL6JoHwInAuyQg+Ygy5n5MsqOMgS1A2S/XA4fuOCyrmwNw3mFQYobSemwJpet0sEWx0Tk/yCf/kpCp/T6c/WqI+V4qcv7MBqRvEurpCm0rFMHE38sc/vGDE6128h0CbL4tPrXX35GLUQtuR5qHdCE1BWx2McUMbTY=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB16988.jpnprd01.prod.outlook.com (2603:1096:405:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 19:52:32 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:52:32 +0000
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
Subject: RE: [PATCH 08/16] PCI: rzg3s-host: Make inbound window setup
 SoC-specific
Thread-Topic: [PATCH 08/16] PCI: rzg3s-host: Make inbound window setup
 SoC-specific
Thread-Index: AQHchWuNPoocmdq7CkqZr+DrAvCP7LVZ1E0AgAGtGSA=
Date: Tue, 20 Jan 2026 19:52:32 +0000
Message-ID:
 <TY6PR01MB173770967CF275CD79449AA1EFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-9-john.madieu.xa@bp.renesas.com>
 <9e76a2ec-1684-42b6-b2e0-6f7935c95d61@tuxon.dev>
In-Reply-To: <9e76a2ec-1684-42b6-b2e0-6f7935c95d61@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB16988:EE_
x-ms-office365-filtering-correlation-id: 5b1a7ee3-c9fa-48c4-886c-08de585d736a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QzkzMklGcFZHS2dRZXN2dFdlcWo4UDZoU2lXWDN1YkkvSk5BLzhiZzRQWkFz?=
 =?utf-8?B?a1IvR1ZTZnk0T3JiZjRQNkk5R2VSZWdmbmp4SFF5UlFvZUcwSnNGSEZtT0xM?=
 =?utf-8?B?SDF6UEM2SThLTTBJMFpCclR1NWcxNzczU2xqVERKaVV0dXRaV0JlQUpBWllx?=
 =?utf-8?B?SUR0Z0xKak5kWVVoUWZTc1FjMVUrVm4xTVJuZmsyWTk4M1d4VHgrRThzSTNT?=
 =?utf-8?B?QzVsem0vWHZBR3pLVWZzUGJRWXBsK3ZNN2xQcTVXK3ZLaHJuZVJQcWk5SDZ1?=
 =?utf-8?B?MzRFdnJmZGtNR08rcXVUdFZjQUt3UUkyakx6aitTRU5yM0tYenJJaUszRTFZ?=
 =?utf-8?B?WHNqQXo1MHl1MmVrT1JMbUFGU0l6Vjk2Tk1aVjQyTlZCWWdnK3JCR0hQUTNB?=
 =?utf-8?B?b0lqR0pKQmkxZ0U0RVFwdlV1cHhOTzR3aUJuaEczVlc2THZaNFFvSWxhQk1Q?=
 =?utf-8?B?NDd4SkJxeVpNYTFMa3hmYXZyV1VSNjBmRjVjL0ppa2U1Q2lMUWdpbHpCV0xW?=
 =?utf-8?B?VmgxaklVSHZPM2h4QVMyb2E5eThhR0RzNG02eHVSQ0pvbDJLcWx0dmM3cjAx?=
 =?utf-8?B?NVhkdkFnYmUrelFBc0dlakdEV2M5aDVFK0ZibVB6NndyQVp3QmdnYzRTSmx0?=
 =?utf-8?B?cVdONnhSQUhzMmNZT0hRQ2EzUHpyUDBHQWx2WDBXMGNSWVJmZlpIOHdaZmJV?=
 =?utf-8?B?TEhPYTJ1ZE9qSmZuTnIwR2FaTVdacXpoNFNqZkZMelhuU2tGQktEZTIvY1Ez?=
 =?utf-8?B?cTFMbnpUa2s3YUlkRVJsdXJOMGFsdFFuaFRkTVhDTDlCbzNjQWVkODV6K1E3?=
 =?utf-8?B?akViTUdUSkYxbXc2MmpjdmVCVzFLbEI1cUFMTk9MSitTSmh1QjZacTdhcUkw?=
 =?utf-8?B?T1NqbnVBMGtkbnB3RUt3YTV6Ymphb0hkVTNrMys5SlJoS1JpN0ZYMDlaNWVM?=
 =?utf-8?B?a0JDWTRWTER5c1VKL3REcWo4ZDVhR0JsN0pxNlJ6OTZ0WkNuMk5hQVNoakFB?=
 =?utf-8?B?blZsUExibStPZ3hlNmpsT3pQTVNYN2tULzlRZEJqYURBd01BSklUeU9ESlRS?=
 =?utf-8?B?Vzd2eVlOckk5QUtjMnovL3h5d3Ava2pPVXpYc1l2VVRsRmRCVHByZ0s2ZGhF?=
 =?utf-8?B?dVJTOGZrL1RHSTZCNkVmK3NqNnJTUDh0cm5PTzJ6MXVkbTFqa2NBNGxvOGda?=
 =?utf-8?B?ZlhHUGtPblRsWlVYeVVia2V0bzlXK0FzdytpM2ZvelBSNGlNUm5RVFFGb2pI?=
 =?utf-8?B?bm9qbVpBVStOZ1UrdTRhcFZlNDBjVTJsamF3ZGVJNC9uejVnZy8rUVhaakVK?=
 =?utf-8?B?bXBGcUh4S2NhUXNVUVpKVDN4SlNUcTZjUnJyNGxtTDZzYnZIaUU4Sklwdi9M?=
 =?utf-8?B?UExpL2NRZWhQNXV2aWMwTVNIaExDZFYvU3V5WHZ6UkNWYlhNaEcybmZkUDlV?=
 =?utf-8?B?c0hFNkJNV3FxVlh2SjU5L1ZjeVVvOVdqeGt1ZERSdFhwYTJoNFg3ZWl2ZnFK?=
 =?utf-8?B?YTBURzl4TGgySU5oMnZuZzZiWm1yRDlHeGNlbDhEWkU3UnlCUkI4cXcwTmZO?=
 =?utf-8?B?T1B1ZDVaSEk5OTBjNkFkZEZrcG1sRTkzNUFlRGQ4RkpDZ3RYbFpDSmh5Nkox?=
 =?utf-8?B?Q2wzaG9DODBWWTJ5WEhWaUpxTlFhM1ZNZEwrU01YNnNyUW9UN0pFVEluMnFF?=
 =?utf-8?B?cDJDdUNlVVJyQ1ZjdEE1bkNvODlhby9vcHUwZkl3bDlsRDVOWW8vdjg0NEhV?=
 =?utf-8?B?VzVIN2JEbzdsbFZkdngzaFVZUFo2MXByOVRYalV2QzVoT25weE9UVWZCYVlQ?=
 =?utf-8?B?YU5Oc2g3NjJycGFyV0Q2YnB0UTlhNm1nYXhyNHV4Qmx2QXFoQ3I0SENqY3hi?=
 =?utf-8?B?ZXk2SkdIa2JLb2Z6ejR5cEt0Z3JudkdtRUZlWmJNdzA3cDBuQnRSaGNwbWs5?=
 =?utf-8?B?SGFvT3VRMlpOaWxhS1k5M0FRODBHR3pSbHd4NnNRaENzZDI2c3JXR3F6VitF?=
 =?utf-8?B?RmhBUHlBWkg2KzFHUnU1TThWK002Tmd6OEFDQVNtbmFpOUc5dHBvK2VheS9G?=
 =?utf-8?B?MkpZZDFCaGRWaFhBVnM2c0VCL2ZaZzlzalRpL1Y3MlFNY3VlUlpUblRDWlpm?=
 =?utf-8?B?T0dKWXgxd29jeHp0SHJ4S2JDNm1say85ZGMvWHZ4NEh3WUpvMEVjRWRLOVF4?=
 =?utf-8?Q?gfFWvn2EFMLUgkbH/DaX3b0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGN0YXlHb2Rjd2NMRGg4L3pob2tmb0FGMUkxdWw1Rm5SYUtjS0Z4NjQ1WEU2?=
 =?utf-8?B?UUJYb2dBd3V6UGkzNk5laFJDNTJrNHlsNzVlNlVDMy80Q1dOblVWdWlMeEt6?=
 =?utf-8?B?NXh1MldKZlpycXdIYUYwSjhZRkhTWkMyQW9KaTF0MDhiZC93V0htdjJOb1dr?=
 =?utf-8?B?R0VJb2xGbXNkNERHWGo3aStVbHhOdzJyay9NbmY5c21lTHZTVW9LaHZFSTV5?=
 =?utf-8?B?OVh5ZWdBeXphTFgyL2JTOTRHTWg3SlUxbDFoZ2xVaEVqaUQzNTBTcGR3NFZ2?=
 =?utf-8?B?UGJ2VlpOUjI2OUcrbnNTM3hVaXViSTZKSlNxNTFqTm1teXJUZjN1SGtteURC?=
 =?utf-8?B?bS9uenJmWStvS21OZ3h6YzlXUmtPS3pxY3dFWFowK1ZZVmZ1ajVldXFMSnJj?=
 =?utf-8?B?a0dvMnRueTg0YjhobFZzUmY1MXVIN0krb3U1Rm1UcjNaWDJvWHVjaWczN0Y4?=
 =?utf-8?B?MWZoVkJENlFnK0syZDQxckE3ZWtiRVN2Q1QySjFrR0ZtcUN4SWlBeEJYaHpL?=
 =?utf-8?B?SlJsb2R5a1VINitwYUlyV1Y0R014cVhlMlB1NnVmM1JGWUVmQ0VycnpwcVZV?=
 =?utf-8?B?UHB5Wjd0d0p4cUtSWVl4Nzl5MGs2NTF0SzhUajFUbExaUS9vdWF3dW1JMHBp?=
 =?utf-8?B?QzcvLy91dXpwdGVaWnFDT2Z3d09JNUZIZFYvOG56ak1FVGo1U2U3NGorQks1?=
 =?utf-8?B?WTNTTkNtZWMrNzJ6SUFaZkJjd3Y3dnpGN3IzZzNJZ0JkOGxzMG16dVlmdTkv?=
 =?utf-8?B?LzdQWHhlNXJSa3R2SmVjY1c4aEovbW04U0ZwQVk0Zm85U25oUThFUVpyZTll?=
 =?utf-8?B?V0YwbE1hUjN1bFRvNm1mRGNSNm1jUnZxTzRrWEZwc0hTeUtPU1F3cTBTbTNr?=
 =?utf-8?B?dW1Vc3pJazVrZ1YyMFJBaWt6cEpHd2tHcTNyTSt0U2UvSjVvc1lPVlo3eDM3?=
 =?utf-8?B?eGEwQWVIdC9GQThsQjk2b21lcW9lQVJncUdUMWJjc2pVMVNwbEtlZUwyMytp?=
 =?utf-8?B?Q2JjYkdKbmI3VDNYK2Vma1FtR0RTSVFWWnlCWDIrK0FMdEUvNFp5djlFdk5i?=
 =?utf-8?B?azZKSXVMVmJTQzB0aHRkS216V3ZEMmZ1MWRVTXRqM2RtVDNBeFI5eXUvRVR0?=
 =?utf-8?B?ck4ySlFuemdlKzN4UjA0TDFTWTdqcGl2ZWtpTVBpS0xLOXkyT2tDdnRyM1pB?=
 =?utf-8?B?a3NxZHNPT1grejRuc0szelo2c1BXeWlTeEV2b2phd1JFdW5mRjBhT3g0SWZW?=
 =?utf-8?B?N1ZBVUNpSjk3S0c5WCs1eklZckFKY0xZUkQ0bGNCenZPR0dUaWpsdlZhZy9E?=
 =?utf-8?B?U1ZyVlljdkF2V0dnVnVUcERkZXhWTG5oa2J2NGNZSXNzT1hZT0VqUEV6a0JM?=
 =?utf-8?B?TUxMMVBocW41VmU4QzY2dXN0ekVrZS9LNkFpSGFISjkzT3Y1T0x0QStBb0F5?=
 =?utf-8?B?SWFmdkczak5OSW5DdEZnSndHWk05R01meGgvTWdtRm45TkFLU2FGaklpWHB4?=
 =?utf-8?B?TTg4cWE5ZVlVS2l6b3Z5M245T1NXc24rU01FbGZuSmhKWGpJWkszOVJ2WUJk?=
 =?utf-8?B?QlNER2pDN3NKc1pCTlBCbjZuRlk2b2tFRHBJL0dTZ2p1SS9vczNhUWRiWS83?=
 =?utf-8?B?VHJMa2JMYmFYRUNMQWY3U25VbGxpZUg0K0xPNEp0REtQb0Y3UW5pdDllM1hy?=
 =?utf-8?B?N1dyNU1CU1BuMm1nYzFMcmJOMTUvVlpIYWRxVzdZOENiYS9pazdLTE9nSjFL?=
 =?utf-8?B?Rjk0QjFwSWpOOWdhQlVpaG1YM1AvczFDN0E1azJ1UXBmWXkwM01zRGxtQzhl?=
 =?utf-8?B?S2VlaWhsbythaW12S3JpaXYxTDNrcmpNcHM3TnA3SEpxR0pRSEwzeXY3QUcz?=
 =?utf-8?B?RUx5NGNqUTF0UnR6eUVZK2xyT0tkTjNpRmZUNmlzUEQ2ajg5Tjl3MXBaS2o5?=
 =?utf-8?B?ZnV3QVdUdm9jM0M0TmtRVXFGbmhaNzJNdnBGUGZGeWYrOHRydHRreTdaQktB?=
 =?utf-8?B?cEl2SHU3MFkwb2pnN3BZUDU1dHdHOTVFZC9nU2I2cVp5aEZpUkZqb0N4dnBH?=
 =?utf-8?B?STlQMGFPeVlkVHRPRGt4cUJDZE94L05yTnIzK2k4RG81MjluTWdiRTNKY1Ur?=
 =?utf-8?B?RlhnSFV3VytYR3pSOC9EZmw1ei95OUt5YThYbmI3b3ZpNEh5S1hoSEF5Kzkz?=
 =?utf-8?B?cTZsa0hxTFNyQ0tLTkt3YjVIT29ydERiM0tQc0JZbVM3UGp6ZHpReXZ5NUll?=
 =?utf-8?B?a3dOa29ud3BEOC9QS2IyemFIL2dHdk5MbkxxdUZuWkw0SWxQQ0hVbzVUQ2hw?=
 =?utf-8?B?MDBRcDNzTGkxUGZKSkIva3RVS2VRa01ydStKQSsyTU5jeXZiS08yNi9veE54?=
 =?utf-8?Q?oH+gJQ+7X6md2AYE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1a7ee3-c9fa-48c4-886c-08de585d736a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:52:32.4537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xj74KeARd2gVQ18lApN+gmN/s9tbC0hiQp09Ub8dqA0FTe0b2oTDVzSFmf/vewpjzmS7PyAE1QDpGiYy/dElKA4qbBngHroT/gMUvi3jZEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16988
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27154-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,bp.renesas.com:dkim,tuxon.dev:email,glider.be:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3ED234C204
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2xhdWRpdSwNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24u
ZGV2Pg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMTksIDIwMjYgNzoxNSBQTQ0KPiBUbzogSm9o
biBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpuZWEN
Cj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPjsgbHBpZXJhbGlzaUBrZXJuZWwu
b3JnOw0KPiBrd2lsY3p5bnNraUBrZXJuZWwub3JnOyBtYW5pQGtlcm5lbC5vcmc7IGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlOw0KPiBrcnprK2R0QGtlcm5lbC5vcmcNCg0KDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMDgvMTZdIFBDSTogcnpnM3MtaG9zdDogTWFrZSBpbmJvdW5kIHdpbmRvdyBzZXR1
cCBTb0MtDQo+IHNwZWNpZmljDQo+IA0KPiBIaSwgSm9obiwNCj4gDQo+IE9uIDEvMTQvMjYgMTc6
MzMsIEpvaG4gTWFkaWV1IHdyb3RlOg0KPiA+IERpZmZlcmVudCBSWi9HMyBTb0NzIGhhdmUgZGlm
ZmVyZW50IHJlcXVpcmVtZW50cyBmb3IgaW5ib3VuZCB3aW5kb3cNCj4gPiBjb25maWd1cmF0aW9u
LiBXaGlsZSBib3RoIHJlcXVpcmUgcG93ZXItb2YtMiBzaXplZCB3aW5kb3dzICg0S0IgKg0KPiA+
IDJeTiksIHRoZXkgZGlmZmVyIGluIGhvdyBub24tcG93ZXItb2YtMiBtZW1vcnkgcmVnaW9ucyBh
cmUgaGFuZGxlZDoNCj4gDQo+IEFGQUlDVCwgYm90aCBSWi9HM1MgYW5kIFJaL0czRSBIVyBtYW51
YWxzIGRvY3VtZW50IHRoZSBzZXR1cCBvZiB0aGUNCj4gaW5ib3VuZCB3aW5kb3dzIHRoZSBzYW1l
LiBQbGVhc2UgcG9pbnQgbWUgdG8gdGhlIHByb3BlciBjaGFwdGVyIGluIGNhc2UNCj4gSSdtIHdy
b25nLg0KPiANCj4gTW9yZW92ZXIsIEkgdGVzdGVkIHRoZSBjb2RlIGZyb20gcnpnM2VfcGNpZV9z
ZXRfaW5ib3VuZF93aW5kb3dzKCkNCj4gKHByb3Bvc2VkIGluIHBhdGNoIDEyLzE2KSB0byBzZXR1
cCB0aGUgaW5ib3VuZCB3aW5kb3cgb24gUlovRzNTIGFuZCBJIHNlZQ0KPiBubyBkaWZmZXJlbmNl
cyBpbiB0ZXJtcyBvZiBtYXBwZWQgcmVnaW9ucyBhbmQgZnVuY3Rpb25hbGl0eS4gU28sIHVubGVz
cw0KPiBJJ20gbWlzc2luZyBzb21ldGhpbmcsIEkgdGhpbmsgYmV0dGVyIHRvIHVzZSB0aGUgc2Ft
ZSBjb2RlIGZvciB3aW5kb3cNCj4gc2V0dXAuDQoNCkluZGVlZCwgdGhlIFJaL0czRSB2YXJpYW50
IHdvcmtzIHdpdGggYm90aCBTb0NzLiBJJ2xsIGtlZXAgdGhhdA0Kc2luZ2xlIGltcGxlbWVudGF0
aW9uIGZvciB2Mi4NCg0KUmVnYXJkcywNCkpvaG4NCg0KPiANCj4gVGhhbmsgeW91LA0KPiBDbGF1
ZGl1DQo+IA0KPiA+DQo+ID4gLSBSWi9HM1M6IFVzZXMgcm91bmR1cF9wb3dfb2ZfdHdvKCkgdG8g
Y3JlYXRlIGEgc2luZ2xlIGxhcmdlciB3aW5kb3cNCj4gPiAgICB0aGF0IG1heSBvdmVyLW1hcCBi
ZXlvbmQgdGhlIGFjdHVhbCBtZW1vcnkgcmVnaW9uLiBUaGlzIGFwcHJvYWNoIGlzDQo+ID4gICAg
c2ltcGxlciBidXQgcmVsaWVzIG9uIGhhcmR3YXJlIHRvbGVyYW5jZSBmb3Igb3Zlci1tYXBwZWQg
cmVnaW9ucy4NCj4gPg0KPiA+IC0gUlovRzNFOiBSZXF1aXJlcyBwcmVjaXNlIGNvdmVyYWdlIHdp
dGhvdXQgb3Zlci1tYXBwaW5nLiBNZW1vcnkgcmVnaW9ucw0KPiA+ICAgIG11c3QgYmUgc3BsaXQg
aW50byBtdWx0aXBsZSBwb3dlci1vZi0yIHdpbmRvd3MsIGFuZCB3aW5kb3cgc2l6ZXMgbXVzdA0K
PiA+ICAgIHJlc3BlY3QgYWRkcmVzcyBhbGlnbm1lbnQgY29uc3RyYWludHMgdG8gZW5zdXJlIHBy
b3BlciBoYXJkd2FyZQ0KPiBhZGRyZXNzDQo+ID4gICAgZGVjb2RpbmcuDQo+ID4NCj4gPiBNb3Zl
IHRoZSBpbmJvdW5kIHdpbmRvdyBzaXppbmcgYW5kIHNwbGl0dGluZyBsb2dpYyB0byBhIFNvQy1z
cGVjaWZpYw0KPiA+IGNhbGxiYWNrIHRvIGFjY29tbW9kYXRlIHRoZXNlIGRpZmZlcmVuY2VzLiBU
aGlzIGFsbG93cyBlYWNoIFNvQw0KPiA+IHZhcmlhbnQgdG8gaW1wbGVtZW50IGl0cyBvd24gd2lu
ZG93IHNldHVwIHN0cmF0ZWd5IHdoaWxlIG1haW50YWluaW5nDQo+ID4gdGhlIGNvbW1vbiB3aW5k
b3cgcHJvZ3JhbW1pbmcgc2VxdWVuY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1h
ZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jIHwgNyArKysrKystDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+IGluZGV4IGZj
ZWRjY2FkZWNmNi4uYTk3NzNlNWYyNWM3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1yemczcy1ob3N0LmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4gQEAgLTIyMyw2ICsyMjMsNyBAQCBzdHJ1Y3Qgcnpn
M3NfcGNpZV9ob3N0Ow0KPiA+ICAgLyoqDQo+ID4gICAgKiBzdHJ1Y3QgcnpnM3NfcGNpZV9zb2Nf
ZGF0YSAtIFNvQyBzcGVjaWZpYyBkYXRhDQo+ID4gICAgKiBAaW5pdF9waHk6IFBIWSBpbml0aWFs
aXphdGlvbiBmdW5jdGlvbg0KPiA+ICsgKiBAc2V0X2luYm91bmRfd2luZG93czogU29DLXNwZWNp
ZmljIGZ1bmN0aW9uIHRvIHNldCB1cCBpbmJvdW5kDQo+ID4gKyB3aW5kb3dzDQo+ID4gICAgKiBA
cG93ZXJfcmVzZXRzOiBhcnJheSB3aXRoIHRoZSByZXNldHMgdGhhdCBuZWVkIHRvIGJlIGRlLWFz
c2VydGVkDQo+IGFmdGVyDQo+ID4gICAgKiAgICAgICAgICAgICAgICBwb3dlci1vbg0KPiA+ICAg
ICogQGNmZ19yZXNldHM6IGFycmF5IHdpdGggdGhlIHJlc2V0cyB0aGF0IG5lZWQgdG8gYmUgZGUt
YXNzZXJ0ZWQNCj4gPiBhZnRlciBAQCAtMjMzLDYgKzIzNCw5IEBAIHN0cnVjdCByemczc19wY2ll
X2hvc3Q7DQo+ID4gICAgKi8NCj4gPiAgIHN0cnVjdCByemczc19wY2llX3NvY19kYXRhIHsNCj4g
PiAgIAlpbnQgKCppbml0X3BoeSkoc3RydWN0IHJ6ZzNzX3BjaWVfaG9zdCAqaG9zdCk7DQo+ID4g
KwlpbnQgKCpzZXRfaW5ib3VuZF93aW5kb3dzKShzdHJ1Y3QgcnpnM3NfcGNpZV9ob3N0ICpob3N0
LA0KPiA+ICsJCQkJICAgc3RydWN0IHJlc291cmNlX2VudHJ5ICplbnRyeSwNCj4gPiArCQkJCSAg
IGludCAqaW5kZXgpOw0KPiA+ICAgCWNvbnN0IGNoYXIgKiBjb25zdCAqcG93ZXJfcmVzZXRzOw0K
PiA+ICAgCWNvbnN0IGNoYXIgKiBjb25zdCAqY2ZnX3Jlc2V0czsNCj4gPiAgIAlzdHJ1Y3Qgcnpn
M3Nfc3lzY19pbmZvIHN5c2NfaW5mbzsNCj4gPiBAQCAtMTM1NCw3ICsxMzU4LDcgQEAgc3RhdGlj
IGludCByemczc19wY2llX3BhcnNlX21hcF9kbWFfcmFuZ2VzKHN0cnVjdA0KPiByemczc19wY2ll
X2hvc3QgKmhvc3QpDQo+ID4gICAJaW50IGkgPSAwLCByZXQ7DQo+ID4NCj4gPiAgIAlyZXNvdXJj
ZV9saXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmYnJpZGdlLT5kbWFfcmFuZ2VzKSB7DQo+ID4g
LQkJcmV0ID0gcnpnM3NfcGNpZV9zZXRfaW5ib3VuZF93aW5kb3dzKGhvc3QsIGVudHJ5LCAmaSk7
DQo+ID4gKwkJcmV0ID0gaG9zdC0+ZGF0YS0+c2V0X2luYm91bmRfd2luZG93cyhob3N0LCBlbnRy
eSwgJmkpOw0KPiA+ICAgCQlpZiAocmV0KQ0KPiA+ICAgCQkJcmV0dXJuIHJldDsNCj4gPiAgIAl9
DQo+ID4gQEAgLTE3NTMsNiArMTc1Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnM3NfcGNp
ZV9zb2NfZGF0YQ0KPiByemczc19zb2NfZGF0YSA9IHsNCj4gPiAgIAkuY2ZnX3Jlc2V0cyA9IHJ6
ZzNzX3NvY19jZmdfcmVzZXRzLA0KPiA+ICAgCS5udW1fY2ZnX3Jlc2V0cyA9IEFSUkFZX1NJWkUo
cnpnM3Nfc29jX2NmZ19yZXNldHMpLA0KPiA+ICAgCS5pbml0X3BoeSA9IHJ6ZzNzX3NvY19wY2ll
X2luaXRfcGh5LA0KPiA+ICsJLnNldF9pbmJvdW5kX3dpbmRvd3MgPSByemczc19wY2llX3NldF9p
bmJvdW5kX3dpbmRvd3MsDQo+ID4gICAJLnN5c2NfaW5mbyA9IHsNCj4gPiAgIAkJLnJzdF9yc21f
YiA9IHsNCj4gPiAgIAkJCS5vZmZzZXQgPSAweGQ3NCwNCg0K

