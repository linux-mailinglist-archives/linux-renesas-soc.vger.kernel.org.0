Return-Path: <linux-renesas-soc+bounces-11308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2959F1377
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 18:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314FC16AF20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184EB1E3DEF;
	Fri, 13 Dec 2024 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IzcRxPkd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FB0364D6;
	Fri, 13 Dec 2024 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734110316; cv=fail; b=T8HMyP2t1krmaeRsPA7pKNigT+nEotK+hWXUChVMWSZvAilE7U5wnAqN5eibMOQmdjlRfoWsjXesdfLN/ogDPRp28avcfxN2tjA775uKIElec9gn1wZ0H8FgBJAgGkKzRKq87B4cBVM+i2NIa718ojPYZr1LoLuYlHvGUj2RPXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734110316; c=relaxed/simple;
	bh=x8dsD0ImFipGy5VJaF182Jbl/rruvEprarYP+cJibCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e/vPKApT1OiT7AvEuGfS7n9JeKaxVGUqglH+3JL4ukU/QaSLr9Jh8Po7eWXmFY2Mf/E8sZzJ3Oi8RXg+mKJiS0QjwwUzfuU4b7DEpA5LD2M5RbnVZyfrokLunKORyRGy8S2lVEWMrKjBIsNgH7i8amWM1B1SHPs8KQD2aRGCv3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IzcRxPkd; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4DRe+qW7+a+XYTa1Y/4gawySu/vAI8UbvG7OSzbh5Wz7UjQHlI7szi1+iyCM6jY+jUXLW8vFVASe9wGJsDq7c+M/EEk9XMDyrAgjbx8H9ysoJAyyBzMGNUxtb3p9O1drEVZNCPSRqq0NKtaWyAHbYKled8Z8s1chScmdJNYMuaYp3MwOvRkKEDHXauKUIZPgiaeBQdcUATBXW9lCOTWMamKQUPW06uL/cgZMI5iZZCPwj+WM9VtTJNR7tYQF8rMaxPjJuIcQY2T65L4+t76t8PAhWCX/uBuTju/WF3pfq2cbE3ankWjwrNjZbY8eNptl2nCLKAEisH7EaTpNbArVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8dsD0ImFipGy5VJaF182Jbl/rruvEprarYP+cJibCg=;
 b=R5Q7+R5VKoy0ugTmloA+NcSZzZSO6WxAO7yq3PCJk3n0z9PWN3D39FyXqo16qsiZu5dWvjP3wGH93Lg2oGNkBMi10lvCjaRzFrJuX2EBple0UF55as70gmOxZ88xaSyYN7CSeNXEsDg+1hDmgKp1Ed+h6JzHMke2er3r1fIde6z+KQVbH98tco9Nfbd+bjwiRaHCoaftboH8ml2siWJuyEfUWnFl3cycAvn9aS9xFwZ2CW0rot8SxaGRdbg3DYGiwcTnQ/3uoN21nC4Pz5AgoVKpZRgdkULGk5B2kcLkjPocyN/uKPkXyUkZJIPrLbuOpQeCAJLAtVIyRnvjJsSekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8dsD0ImFipGy5VJaF182Jbl/rruvEprarYP+cJibCg=;
 b=IzcRxPkdnGyW5frPEsq7buQmiL+Z9vM0TnQQCrtcD8IcW7kns9ZvF6MYW9MJRFG2WI/dDw4JLHnU0yLQkW9ChvgGdoEfI9TYONVsvNtxpybdOMUXuPg+WJ7DBNVqLxBzijAdCYKaxQXZYhw9srVlSpjd9pXV9G9Ftxi0XEl0mCA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8415.jpnprd01.prod.outlook.com (2603:1096:604:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 17:18:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 17:18:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add pincontrol
 node
Thread-Topic: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add pincontrol
 node
Thread-Index: AQHbR8j0WnlPMHrh40ynZtoUbswwqbLkWVWAgAAc72A=
Date: Fri, 13 Dec 2024 17:18:30 +0000
Message-ID:
 <TY3PR01MB113461BA504A94B0D0DA5893986382@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9QK-w1XTD_wR_1LP-bh3j1QkL+z+374bVhgk4bEP_hQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX9QK-w1XTD_wR_1LP-bh3j1QkL+z+374bVhgk4bEP_hQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8415:EE_
x-ms-office365-filtering-correlation-id: 04609250-1545-4bea-49ea-08dd1b9a2a91
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2hSV2tZVmhlZEMyL0srVysyK1lDWmkvNklhbGpVMmd2bWxNM25FcC9rYmNp?=
 =?utf-8?B?d1hNTzVqdTcxQys2K1pRRGJ6YmlXd0tFTTlJcERrS2dTUyszSDhFVzJMVXFE?=
 =?utf-8?B?ZTlZSGd6RE0zYWpnMTNhbVVUZXRpbFh4UldKN0dBbFRoMDVQbFNBdDF6U254?=
 =?utf-8?B?Vnl3UXBDd2RnQTEwRURMWWlRT05MeGh2UlNMZmNSZzBVU2xtNmRrMVlzSjVT?=
 =?utf-8?B?aVg5aGM3bG1LSnF5QlpaMldrNkRFNXFNRElIanhvVVdNYURQYnhXRksxN2dG?=
 =?utf-8?B?Rjg1SWRYVncyTTQxSHU4NDdzT1VDM2dTQkdydW8wVGR3dmtyNGp3c2x6bU9l?=
 =?utf-8?B?UEhkNml4WUp1SFI4ejh3cVIrNm13OWdHRjlVNjFTdkJWaGJxKzRvZXpEQUhz?=
 =?utf-8?B?TGhZOWZuRGlrdFZETXpQSHRIV0JWMU9OOHVyOTc2WEhQZDhkMkVvckFFN002?=
 =?utf-8?B?UTNuRjdtRHRZaU15MTNCUnJ4NHY3L3B6Q0JYZTVyeFNPaEttN2FycUhPVlhy?=
 =?utf-8?B?YzNxYStWdjZFRm93QzY3SzBLMmVQSzFTTERMd0FKbWlDU2ZrbHU1Yks1NHJr?=
 =?utf-8?B?NExFdStadElCRExrclhKdE4zSkJzakMxaVpaUFdKRkE1aTZTdkU4V1lzb3l4?=
 =?utf-8?B?QWV4eGVIRk5TbTQ1OUliaHUydzF6SG0vWGhCTWlJaXZseHZxL2d1RTFrVFN6?=
 =?utf-8?B?Wm1VU1dFdnNCZjZNM3VTMDRoUEVOajcwTnJvZmQyTDZidzJndm1yaU5BbFl4?=
 =?utf-8?B?d2hIdDM5ZWxxdTdpL1FPQmF0dDRiTUtVMXNtSklISUNtMW05VW9EYmRCMjlo?=
 =?utf-8?B?c1YrZzFGWEgyVTd0Zno5ajQwb1I2WTlWUGxtZDBUU2U1VWdlNExkOFoxdW9U?=
 =?utf-8?B?MFl2RVFIZVhlejIremFuaUFWdzdqNFR2cnZvbFhzWUFGK1NoTDMwRkUreFZv?=
 =?utf-8?B?WHBwWElkRWtxbmxNeWNNeElyZlVUK2loenZ5ZVczbUxDWTVheFRSWTk2dXFO?=
 =?utf-8?B?SCsvNlIyMVpXWmdJUHR3cjNOVjBuL1l1QWRzOWpmaTFYbG1CbEw3V1YxTTdT?=
 =?utf-8?B?enBlbHVwOUorRW1VQ0tSRVVEd2IzNkpoMDg0c1lHd0VsSFRIaEFuSStqZWNC?=
 =?utf-8?B?amdKM2dSNkJhUVliamRLR2k5Z0xPeU5adksxMlRNVUZkbWUyUkFuMHVZU1Vw?=
 =?utf-8?B?Y21KRGp1ajBrc2V6M0hKNjEvSmx6aE10V0hsNTRYMkFGK2lnbi9vcVdxdDdK?=
 =?utf-8?B?YTlvOHBEMW03ZDVvK01VSnFxWXhXcjdWUU9yMWg3WUxvM0M4cDVFY0x0OXow?=
 =?utf-8?B?b2t0SGFOaEhicEw0L3VjaXNSQVBtZytaeWxWWjRNWjN6QWR1bmV1L1lnay9N?=
 =?utf-8?B?NnpxV2k4WHU3TXJ4dmQvdUJZd3hJc3hHNlh1aDdBY3ZBOENDQlZtRU4wRVpT?=
 =?utf-8?B?OXlFNVRNZk1sQWpmd3puNDZUVGhLVlZiU3Fxa0xwYktqOEF5VEd1eDg5N21K?=
 =?utf-8?B?SEtIaDdXNGNtZzVYa1g0K1NDa0JrYWhISTVpOWoxSHdxSVhOVVRBa0xxMmNL?=
 =?utf-8?B?RjJ0eGRGODJjTzFPaDRMTDNQRkJmdkZrdXV0RUhnNFdSWnliTnpqeHI4K3VV?=
 =?utf-8?B?RkdvbytGOGZyVkdDbG9tMGNXZHAzOFdEaHZIRFMrRExibVhINHZpOE1GV0xp?=
 =?utf-8?B?WUFUKzFnT1h0bE9jV1VLbU1BTm1PVTl6WlFiNXE1L05vaU9Cc2lLenF3d0tE?=
 =?utf-8?B?dVl3VjhTNElWMFFudk95UnNUbmJma3RvWm9tRlJSeHBGaWJNNHVmOTJqaUNB?=
 =?utf-8?B?UHNYRkRONEVlT1p5VGp2Q2tJK2hJZ0pRK3pTUW9reGhBc1dyd2VkZUN6Rzg5?=
 =?utf-8?B?K3l4SVQrUW82aFd1QnJza0cvQzczNDBOWlJkSERaNzNDMkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1lIQTFWQTJsY3UzYVBXTDRxWkwySldsem1KalMwWHhDRU85bDB3dkxJa1hW?=
 =?utf-8?B?ZjUxVmRRN0JpcEZQVmI1ZlBjYzBUcFF2aDVYcnVDbXU0MERPZkMzcW91b0ll?=
 =?utf-8?B?Z0VNcnhSelYybGdQSk5oV0NqOGpVU0RYZzJMMC92OUhxUXNvd25zMTNndFM0?=
 =?utf-8?B?aVA5clV6T2ZnZnJsWWJGaDNrSFZKNU54TUJxV3VPMm41N2pUVkh2dVIxNWp2?=
 =?utf-8?B?eEpJR3lNZjhvM2tzc1RFNFdTcjA1bVlPMk93UlhvOGtvak1hemE3ZFY1Uk9R?=
 =?utf-8?B?UVpZNDRsK3FFRTBTRnZaSEF4eFdCTkFjeW05QVJzT0J5NEVXSFliM0hRNkp2?=
 =?utf-8?B?Q3ZFVTJ5RUVtaUNtdlV1TlpQcWlzWGtCWXJnZGJRZll2R0x6YS9WZ2x0Z2Zn?=
 =?utf-8?B?WlJDcEluQk5KUUdLdHhYRkREcGFzZWJhcWt6ZXVhYnk2QjU3WXVRTGJSQmll?=
 =?utf-8?B?WTNzUUNmYmo2V3V6RXg1TmFVbHJ3VWJKNzkwaHA2NkNjQTVPQ0ZYRFYrYUkx?=
 =?utf-8?B?UTc0aWRUbCtxV1NzR2NGcG1FMnF1a290WGIxRTFuc2gzcWZYWG95N0VLbWpH?=
 =?utf-8?B?VmQ5cmlkb2V4SXhEMEpQeWJMbTJYQnZEK3FvaGFtOVRnQndOZTN0YjhsR21m?=
 =?utf-8?B?S21oYmVOSUE3Rk5LQ0U4RkZvRTIzRjk4cy93Q0o2cTQ5S1RPOW4vamdXNlJp?=
 =?utf-8?B?ZnRxaVNLT2twSEd2YTFiTGhoaWJsZ1FEWlNMaE5heGllK3pyaXpHbG1lTGVF?=
 =?utf-8?B?YVJZRlZQdUlrS0hHU1VwbFBhS3hKUXd1RWwrWVZDZ3NXMXJBYlU4d0ZUanBY?=
 =?utf-8?B?SGpaUFRXa2RrY0xnMWYyeGFYL2pabFJKem55UEI1cTNmdkM0SzhZUnM2V25M?=
 =?utf-8?B?R1hUNVBOOUExZzBJRStJditteWhlcEhwcEFRYjMyRlBCbWhtTWFvODhmUm5y?=
 =?utf-8?B?TWFjL1IzYjd5UWNURlRrY2g0NHBqc28zaXJIeXNGSTJPbXF2cFJlZ2ZvU1BX?=
 =?utf-8?B?c3krQVJibXRGQjRVMEVSNEJvTWRuUEZXVVlmNk1SNm5VdzFRdDRrRVJ3L3Zk?=
 =?utf-8?B?YlRkakVOSTNMK2dyQ2tqbHN0aUU4RXBObXU0WTJ3enZUNTkvVDNnc2JmOHlp?=
 =?utf-8?B?dUQ5SlNIRVRLVCtkeDBhWTUxZm9leUNTbVdWaGhGSHRlVlEycGNYcnkvRjNx?=
 =?utf-8?B?TTFWY0ZKYjUwczVjdGwvK29mME8zbVpuV2VGTDN2NnBDUVpqcURSQm1oSW8v?=
 =?utf-8?B?bGg5VnNBWXBJZGtZMUlMTklSSTA0enovVlFEYitVVysrTkVXd1BGdnVCbUtD?=
 =?utf-8?B?ZGNmaEdTWXN3TE5RcXlNeHJEOVF0T2d4bmIxRkhRUmVwMVhpcTVhazdkY3dl?=
 =?utf-8?B?WWFDek00Z200K0x4Y3hPUXZvZXM1VHIyeU4yRFl5WVI0dEdOcWs0TnhGTkRL?=
 =?utf-8?B?ak12cTlpZU8zQks1RDJmT3d2cVNYQ25zdTRLRnU2SFowajJTbGNnRkRnK0xy?=
 =?utf-8?B?L3NhbXBKUU9yWU5iV1B3Vm9zMEM0Tko5RW94UGVZbEFmZjdNeDVrZTZkb3Iy?=
 =?utf-8?B?SWRaMUxuOHpUaVFVdmxIWXpnczl5ckx2dW9hMDdiTnFVVS9UQkdGcjRGaUli?=
 =?utf-8?B?RC9ZVHRPNVFHVlV2eSs1bWZqNjRBTW9mQzdZM3paTm1EZHRrd20yZHFJSHY1?=
 =?utf-8?B?MldjNG01b0JYbkhmNkJndHFUWU1TRlEycExUUURUMVpmN1c5dFMzakZJMzhJ?=
 =?utf-8?B?WHR6S0gxcS8zZ2xrWlZuUXNMbFQ4bnpsZks4c0NXM1ZUeHFBWDRHb1JEU0Q2?=
 =?utf-8?B?RGl1VElYOGdMVCtBVGxBWmxxaHMwdUdmUERJQXA4bDltaHdOM3lpM3RrWTYr?=
 =?utf-8?B?SnV1dFBEbkJEdWxjZ3hVS01BWkZleEdiMXl4Vm5mR1c4cFMzbVgyTVRWYk5Z?=
 =?utf-8?B?L2dqV2o3eXlNeGduQk5nOW9PVHh1OS9ET2tsSDRGTWE1eXVXcnhXNzNRRmEw?=
 =?utf-8?B?dzJWM2xQQkw2WVZLSXd1djlOQ1Nvcjg5c1NjeVpzcFlWdDZFRVVMSFBwZUpw?=
 =?utf-8?B?SG5CYTRCWkVDQWpGTnkvSStRTjgzVFd5NzMwd0o5UFZwZHRCTHUrZXpBSnBq?=
 =?utf-8?B?RWU0RmY1R1A4U2Z3dVMxVFAwRHR5RXhHVUw3UW1NakRiZ0lQT2JhV2NGalpE?=
 =?utf-8?B?S3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 04609250-1545-4bea-49ea-08dd1b9a2a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 17:18:30.8999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7V3QEbmjwO3MUw7LMthUV6P18DLRhO0vpDTs3A7dY0maTuXZvQ+uLce42kXTgPmyQsbsPgn6HW7sp6cp/fKQ8l1Ezv8bMq5qlgXjsq9Xyoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8415

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTMgRGVjZW1iZXIg
MjAyNCAxNTozNA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNF0gYXJtNjQ6IGR0czogcmVu
ZXNhczogcjlhMDlnMDQ3OiBBZGQgcGluY29udHJvbCBub2RlDQo+IA0KPiBPbiBGcmksIERlYyA2
LCAyMDI0IGF0IDExOjLigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IEFkZCBwaW5jb250cm9sIG5vZGUgdG8gUlovRzNFICgiUjlBMDlHMDQ3Iikg
U29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiAoYXNzdW1pbmcgdGhlIGN1cnJlbnQgYmluZGluZ3MsIHdo
aWNoIG1heSBjaGFuZ2UpDQoNClllcywgdGhlcmUgaXMgYSBjaGFuZ2UgdG8gc3VwcG9ydCBSWi9W
MkggYXN3ZWxsLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRh
bGtpbmcgdG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcw0KDQo=

