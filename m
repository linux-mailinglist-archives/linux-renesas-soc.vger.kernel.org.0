Return-Path: <linux-renesas-soc+bounces-6094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B13904BF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 08:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546541F21499
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 06:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55B0167DB1;
	Wed, 12 Jun 2024 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uuXlW+OX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2042.outbound.protection.outlook.com [40.107.114.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AD167D9F;
	Wed, 12 Jun 2024 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175090; cv=fail; b=GxnAf2gADix/eZvVWX233IhzXBBcKpggYd5vP66H5GEyGEtuXdTIz7Gp6O2x5RgqYshE92Tl/lBEYxOgA1FZS6MYEM4LbZhhvr6WKJtcMOXpMuTUcZ89pDNqSunD4kkEQMZ2MPlXwHPxMX1pLyXIcoSHn1tojs+MZsAg1Y9kQbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175090; c=relaxed/simple;
	bh=WCPlX9urK67CqJiZ9rors6gWf9TxCz74W4a+b4W905k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eDJl7k2uwHOkqUBkPpycj2q0AThrnanHS/rc9Sk3VeeP4gcDcLSJQ98Zk4g2ZvNut9BwyS5Aj1DV/3+8V63XrjsqoNbd4GkMvk5gRPVlm9tEqGo9acenag2/QAPeYe8IfyJeszx0LcQ+pb9Fw8Id/4D/vBX6yloGw51cMflFc+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uuXlW+OX; arc=fail smtp.client-ip=40.107.114.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h262tcS8z2uPXvL4kl7BKzm8KBVGQsdUnSUIf9jrtbbS2HAWtV6c5LLZbz/IE4ZCCcjU9pNTvN8ZkHcjKm6RzjzLh4SEoDLlfm8Z2MKVBwTbaKU66z7kPBIWA3XDig3E8eT5GTweo8qEGt4Hljo010XxL3ke91HqyUsmAvmUt2lyyhtN492JR89xwz8ee2aAPl6YQGqLBgPDgjJ3aH1jYPBqTSOWLKMSA+vFQPcB0vOmk9s4/M2hXOYF9IuIe0ZtxgHICbudKePbZs0wtQQUwlJwdpzaJ1fKmeYifJF0vIviOiOBeIrRIe//dsC+WC9Y2IpHzFqzaq3Rj3zLpgvDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCPlX9urK67CqJiZ9rors6gWf9TxCz74W4a+b4W905k=;
 b=K8jL38C8pk92on0dy/5+MY7gwJtPUeOvMHZF8DrFKQzqX7dcAiTBe3Zl1X7pJRHerW5soTUHxo1/g8rem6uFiZ4w/SC9Lf856wyX6YsLD/8vxTIuDGU7QSA9rzrOpJ8KDXiBvVV91cDRCkLCZM51tdxyKz6lMUezFXI7FFT7bXHTAgCitx1m8nbdLNl8Nw8I0Y7b1oSLmQSzuekBpRSE/FiwLyHkSzNaZ3bApSuldLPq4elITvHhVUV+7df5tRBuLaWtuYVmnrvZ+vn9Xdg7trJYJPnPH2l+wzqI+9ZthLjYBJ3p9XDeQXP0wafjq6KHsthxrPpWwR4da8Wf42WuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCPlX9urK67CqJiZ9rors6gWf9TxCz74W4a+b4W905k=;
 b=uuXlW+OXJPPQG7iKkc+fDndoZdgv4c2URU5VG4CbQ7hNCWIT0Hl/CcONVi/Ftvp6pGSE3/bE97elgQjAmulqs/OI56UgrweBIUjHV8ru8coVP8FNC/b5p4gyAhbZMgaBCr8HacP5XwkGNBihozx9Equ3vgNtClbNkVO1RBBX37o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10001.jpnprd01.prod.outlook.com (2603:1096:400:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 06:51:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 06:51:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/6] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document USB VBUS regulator
Thread-Topic: [PATCH v3 1/6] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document USB VBUS regulator
Thread-Index: AQHau+8aKgu/3bs/OUat+7WW1GU+FLHDrhaAgAACzEA=
Date: Wed, 12 Jun 2024 06:51:17 +0000
Message-ID:
 <TY3PR01MB11346FF975168631D8061362B86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240611110402.58104-1-biju.das.jz@bp.renesas.com>
 <20240611110402.58104-2-biju.das.jz@bp.renesas.com>
 <3f2bb2e7-94e9-424c-895a-7d3d6e84d561@kernel.org>
In-Reply-To: <3f2bb2e7-94e9-424c-895a-7d3d6e84d561@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10001:EE_
x-ms-office365-filtering-correlation-id: 381b0096-0491-4da2-cb51-08dc8aac0f47
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|376006|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDBwMmVza25vL2ZBTVkrVTdMVnNPbjhuTjBBeHpEb2h4N2NSQzZTbFJDMTdZ?=
 =?utf-8?B?a1FJSEpjV2NlbGlpNkdxanR3WC8zbHptRHhxSkh5a0JHT0k5eEgrY0d6M2Y5?=
 =?utf-8?B?MnNpK0xhT0pZRE9IbWtCbTRnc05xTW1NZlh4V3cyZ3VvMEh2dGRvcnltdGJ3?=
 =?utf-8?B?cmYyZnFWelVtTVZOOVBPUWt4cDdtbkV5WXpJSWk0Y2YxNGxSZmI4SExtZWdU?=
 =?utf-8?B?Rlh3K2JlMStVTkIzRHNlbndhV3EzNmgwN0VGaG9zRnVCUWwrQmVSYWZDb2hr?=
 =?utf-8?B?NlhROHBHb25XcHZnazgrOHRTdEc5QTZzbWNCS2lxRE1YZGU5OGtaN1J2Q2lG?=
 =?utf-8?B?RG02N2VtRWxUZUdNdXFVSURRR0trSENuVjdNdy9McFlSRzdCaFFKVVdVK0ZD?=
 =?utf-8?B?bWlOR1pXTnROTkJ5NUw3S0NSekhMb1IzaVRNK2xadnFTZkxqRTRiSWh6S3Nu?=
 =?utf-8?B?ZVpvMEVZY1RBU3dKR29RSEpNU21ENU9mV0wxN2EvU0Y4N2JoK0dkQS9CUWF2?=
 =?utf-8?B?SUN2M1lOdFhFWTV4REp3V3FYektUZ09TWVBjYUJzYVZoQUFSYWhGWmhtRFI0?=
 =?utf-8?B?MkVSNENPTE4xMnVqaGR3dytWREZOb3ltZzMwU01EWlZlcENTcEFHa29Kc3lx?=
 =?utf-8?B?bThyOTU5ekhGWGRKek95bHRqK2RLTUYrNmZqdWNxYXRpNXRHSXdncUhlVDF5?=
 =?utf-8?B?bDFZQ1NtenNJY09IUERwNm94OExtT0JydUZKSlh4cnRXb0JZUmdnRHhac0FK?=
 =?utf-8?B?dXdJTE11SFdIbFFGMDZXUWJJcHVEakZIWXZpdkdDTUx6SjF1NmxXMlkzbXhi?=
 =?utf-8?B?TG1hNmdXWU9YMkpLVXZNVFlHYmRGbnk0RER1MWc1cE95dXI5dHhxd2M5QWtV?=
 =?utf-8?B?TThuNHpIbGg3bHpVemZDOUdDTWUxNldSOHVmOUhxeGMxT3QvS0NIc0pVR29o?=
 =?utf-8?B?cmZxVkpVYUh6RjBaZVBZbUFIaDdGcjVnaU1PV1JiTjdEWWJTSG9JN0pzaU80?=
 =?utf-8?B?aTF4cko5VTZkSEZ0dkt1WG81cnRrellIUEJzOGVPMHBjRWQ1UXZKY043Y2cx?=
 =?utf-8?B?bGV2NG83NG9tajczWVlMZ3psUVluWnhEaWFtZGk0MWc0TnJzRHNBa2xTbmVE?=
 =?utf-8?B?bjNwMTJqUmxqWE9wQkRnY2wwTjJkc0VrZFBhK2Y3NzkwU1A5U0VvNDVHbk5X?=
 =?utf-8?B?NmttMHZYWWlCa1hCNVlCcTZ2SE9jdm1MNHlabmpOV0gwUExZanVjNjdpQW1V?=
 =?utf-8?B?L1BxMWR4b1ZGTis4OWNFQnM1ZmlWdjJXZGFtdkRtNmVWQ2xjczlpUnlFMG9Q?=
 =?utf-8?B?V3pWTWpRdEk4akgyMnNXU3g3Wis1SzkxdEVxR0ZQek9EejJRUytYOFZvUTV4?=
 =?utf-8?B?dzI4WTRpZmxMOHB4T1daNmZkSWY2cWF3ck1Ucmpjb3d6QTErNnY2b2VVS2Vl?=
 =?utf-8?B?OXFZdDNWeHAvL3h4U3cyRGtpMDdRNWxFdmlOb2QxdUhvcGNTbUpzNm9Oa3Yr?=
 =?utf-8?B?UDdqSkZrQVJabXQ0N0dmVjc2Tmk0Vis4RWtZQVBKNStZSEdXbXg1OXArY3dT?=
 =?utf-8?B?UVZNZEhQcmovRWNibFpRWTJwRXR3TGpFYUMyaDc4RVRwTHlXbyt6bXBLQUxD?=
 =?utf-8?B?SjB0MzVhUTNnNGtuUWRiZ3lyZHp0cGRwRzkxbkdOakNtN2lzSUZsNUlLa3JF?=
 =?utf-8?B?cUQ4SUpFNnE1WWJhVDFpTVdIdXVtNmRMWDFEUlpCeGRTaUJiOGRNYlUrdHR5?=
 =?utf-8?B?dkw4Kzc0c2dSMzhzQ3R4UDJjWndaOFhBNVJCcitGSXprYUtZS2I4UkN5OTlM?=
 =?utf-8?Q?BOHNgEHpDjJ0S+oIPD4SvEs3c2wQ5O9L9XWTA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVcrNmp2clFqZ1JJYmlRVFRaQllHV2U5QytKMGtJTnRTYWp4dWpEZDNVZG5l?=
 =?utf-8?B?blZnbXlPRUhuYWFVVzh1V2l6MGprSHFyRm5FWkloeStLZDNOQndWQXE1eW1l?=
 =?utf-8?B?RjB1YjJlaUFBQzBpODYyM2EycDBRMDFxSUdnRVo3eFRwQ3A0QTJkcUlaYnpu?=
 =?utf-8?B?aUhqMytRVHBMenBwR2lHbXpQTTRLOFFOY0ltOHRnTGZDVDNlUGkzMUdQU1BM?=
 =?utf-8?B?dStsbERxZmxCWGFueTdZZEdVUnJ3VjhuQksybVZVeXovWVRqZjdIRXJ2Q2xN?=
 =?utf-8?B?czJ3TE91Zzh5dE5SblE5WUFQbXZjSENpQUppWnNHMFRmdjhYcDV2T1F1OXE5?=
 =?utf-8?B?a2VoRzN3VmhPaEJYS05QQys2Wk5XUHoralluenY4dUlTbGhnU0o2Um5Ga1da?=
 =?utf-8?B?Rnc4YjNkNTVDMzZqSi8rajFkckxkdmprYmozVEtJUW5BM21mcUhYNHhqcFhG?=
 =?utf-8?B?SE9HT3B4dlFpTEpHTXo5WmUvUitaUCtTdTVUWDJlMFlGZHF5cExBMm1QamlH?=
 =?utf-8?B?R29kYWtRNi9JTDAxY29GNVNtVG1xMU5lNDJxSmN4K1lFaEY2VWpDODd6T0ln?=
 =?utf-8?B?cTAxMkt4ai9jbDBJWDBZUHM3MTIwWVNBTk81UWorNExJa2J1STVVZkRESytF?=
 =?utf-8?B?ZGVsSEVkd0cwcUJnbmEwN2JnRnY1eWFQSi9VVzdzWkg4NzljSmdMN2JQSm1p?=
 =?utf-8?B?NXhBQnMzVWUyKzRBbk9uUlZBL0NLNHp4T3k4M2xSMUd0STc4MG53TllaMXND?=
 =?utf-8?B?SE5YVTN0Z3lHaVd4M0d2VkUxcUx2NmcyWXk4TkwzcHBxWjBCTFYyNkRoVDBK?=
 =?utf-8?B?VkpOZnZXeUFmSVd6MlR3ZS81QmMwTGtzRUF1TFVWYTd6QUR1Y1hOd2FOdlFX?=
 =?utf-8?B?akoxSlJaeDV1cTEwNHUrQjJkWGpoU3E0M3dxbHBRRFI4M2xNZStJN3F2NDhL?=
 =?utf-8?B?MEZNdzRTRFNsMUVqcGNYT3B4aXpHTEpKY0hFc1dpVktFU0ZYVU9nbmdtdTJO?=
 =?utf-8?B?UkRHR3JKZXJjb1psOHU1czNURkx3YitRbVNwc3pqQzI2K0hNQUw3dVRSdURj?=
 =?utf-8?B?N1Q4cXBWNkR4YnU1NHZ3MEdJdm04UXUrOSszQmhZcXV5WWI1RUhZSjhpVzI3?=
 =?utf-8?B?c3JUZ2xMdkJOdVVabTY0TmRUV3FLUGtoRFA3UEtCUTNCWmJnS1o5SG5KQk53?=
 =?utf-8?B?aGEzdmtjN1FXS2FpSDNRRGV0UEdhOXlsMnJrc1oyUUo1NWhBeTBRb0FHMS90?=
 =?utf-8?B?Z3ZDWU9pM2xVRGozOGpaQ3ZYcGxqbnd3aU5XR1ZtLzZuWWZ5a1hJZ2s5WEJx?=
 =?utf-8?B?SmdqSVFNYThYVVFUYi9aMXg3MTQ1VzJtSlorS2RoMTBUcUFlcmwwUzZpSmI4?=
 =?utf-8?B?akhtZ0FJWGFtdC85MkxIdWVEV1VENVRJY0dPTmEvMmJqNUVxNUZXMjJRUEJI?=
 =?utf-8?B?Um1HcTArdWh1eVU5dkZ6T3poTU9QWXZjeDZKL21PbXlsMDlXYWZxdHBPZE5u?=
 =?utf-8?B?Qm8ydDlzMVE3ZFVYeWhIV01tNTVUUUJWandVQmNWZWZobGxYQVkwWnUvNjNO?=
 =?utf-8?B?TSt3dnZ6cWF3dElRZ0JtOWJSTVA4eEFqcm1nWFdoL2d6eTRDOU5RUi8wMlhi?=
 =?utf-8?B?dGxKQTB3UXp5S09EeCswZ2JOam8xVEhKaTZNajljVTRpZ2UxRTlMUk52a3pi?=
 =?utf-8?B?SzlJZmtvT0hNTEhjc01HZjlpMzVpM3FObnVJYVhMdVM0anBOVDd5S1UyMnlE?=
 =?utf-8?B?blZJVmpWYVgvS3lkcTdEL1VOWlpyWTRnNVZrdTJBYmtrWWJWR2lQYzg0cjRH?=
 =?utf-8?B?cHN5MHRCWWwwZGl0bUEyTjJjV0FPdDNiY2ZGbTlwRldNT3FVc1JGV2U4a3JJ?=
 =?utf-8?B?TGZvSzNmOUMzTUZxMCtXL1ZpU3BhSmRnMUkxaWNKZ1lobFVDTWRUMmZWL3da?=
 =?utf-8?B?c1pSMXpYSUM0dGttSmF1cEpCR2dGM25OVll5OXFPTEhJbXZRZm44MzZkU0xu?=
 =?utf-8?B?TXFZYk5wY0lkVWhtamVkR3UvYW53OGhKMXpQckk0VjZQdHJFNzBnay9tc3dx?=
 =?utf-8?B?NDZWWTRmOFlnb0FGUUR6QUNFWTdUMGRpM0QwVU9QMFUreFFrYjl3eE14Zkg4?=
 =?utf-8?B?WkFrS0x3N0FiLzFmNTNMU2c5Q3RpWnl6R2lwb0tMS3E0L1NkUDF3K0o1ZFB6?=
 =?utf-8?B?a2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 381b0096-0491-4da2-cb51-08dc8aac0f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 06:51:17.4858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LiF8BigpP39kHBgkYxkhKV5piKPY/h1crcvCY84OSgidBOpmR19q0wxoGQY/9toObREBav5Gwjqgq1AAr+fJ+CJWeLbYTJLikbeXRkvDpdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10001

DQpIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxMiwgMjAyNCA3OjM3
IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS82XSBkdC1iaW5kaW5nczogcmVzZXQ6IHJl
bmVzYXMscnpnMmwtdXNicGh5LWN0cmw6IERvY3VtZW50IFVTQiBWQlVTDQo+IHJlZ3VsYXRvcg0K
PiANCj4gT24gMTEvMDYvMjAyNCAxMzowMywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gVGhlIFZCVVMg
ZW5hYmxlIGNhbiBiZSBjb250cm9sbGVkIGJ5IHRoZSBWQk9VVCBiaXQgb2YgdGhlIFZCVVMgY29u
dHJvbA0KPiA+IHJlZ2lzdGVyLiBUaGlzIHJlZ2lzdGVyIGlzIHBhcnQgb2YgdXNicGh5LWN0cmwg
SVAuDQo+ID4NCj4gPiBEb2N1bWVudCB0aGUgVVNCIFZCVVMgcmVndWxhdG9yIG9iamVjdC4NCj4g
Pg0KPiANCj4gDQo+ID4NCj4gPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4NCj4g
PiBAQCAtNjQsNCArNzEsOSBAQCBleGFtcGxlczoNCj4gPiAgICAgICAgICByZXNldHMgPSA8JmNw
ZyBSOUEwN0cwNDRfVVNCX1BSRVNFVE4+Ow0KPiA+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8
JmNwZz47DQo+ID4gICAgICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgIHJl
Z3VsYXRvci12YnVzIHsNCj4gPiArICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gInZidXMiOw0K
PiANCj4gTWVzc2VkIGluZGVudGF0aW9uLiBXaGF0IGlzIHRoZSBpbmRlbnRhdGlvbiBvZiB0aGUg
cmVzdD8NCg0KT0ssIHdpbGwgaW5kZW50IHdpdGggNCBzcGFjZXMgaW5zdGVhZCBvZiAzLg0KT3Ro
ZXJzIGhhdmUgaW5kZW50YXRpb24gd2l0aCA0IHNwYWNlIGNoYXJzLg0KDQpDaGVlcnMsDQpCaWp1
DQo=

