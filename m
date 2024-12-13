Return-Path: <linux-renesas-soc+bounces-11279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B69F0704
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 09:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8478416A3FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83A81A8F64;
	Fri, 13 Dec 2024 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aDEmX2an"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896D189B8D;
	Fri, 13 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080208; cv=fail; b=qzySxiRQ+tq/vL/B4axn2Tw1U/9Hr+IBEhczCsjxRR/46qCJ2oOkswgm57AKhOgZlU2PgRCzKpoDUEYI/8FD/WDfQ/cuLNnCh9+8vfjXVGflo9z5icTvCXZ2pJJVpbr2aQBD98YENdszNIiDSSYpy845vQpLZcAwRd73rYyjMl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080208; c=relaxed/simple;
	bh=PEVyUrCq8gXmUcw/Yk/bZv3Hd2MOE2QducrzUrGmc9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gzx4PZzuQfxqgsbayi564r9OKuyHY+XZTrefdrLLa4RWZtoRbRBJMaZG6FAZypQRCLq8OzlNmOSUfDLnZTJaZKDzQAgKgVR9WOwvllKvu5m2EMpX25vnzeVhFezg7JBkc1Z/A7yGWRnPaX8rktF2QHrqTpLoWmFwYtUjxssq41U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aDEmX2an; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWOv61RpI8y/2BSLGCHkHEuXzVHbvzoeM0Wer+LO7EdHDMEGR+EkCDzwma4A848ukksF9xITAz6RG/V4A5Od8jbTwpN9pvzWTBlPX48oSYIsR5uODXlSo1azCAFeplNFj/kQHxyXWmNs0rOTt0cfSqj+V/hale9rJ2JXRxPOMMuMj2GYMxLJQJSy6yfz/RogVx6ZUz9Te4SWV16NnBvmkw98K0gAyatiC+0DeQxgByVVCufvc01W3pRxdzurA8oyksZO3bnArS22iYU+FDKiDWyHET6tMsVmKVbkoa9h6gu78ans4/O2HVe7PwuHwVb3VKNJt1R1YjOn1m3MVmM4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEVyUrCq8gXmUcw/Yk/bZv3Hd2MOE2QducrzUrGmc9c=;
 b=SXUk6bzTjS1iBddYqmDGhc/WDVnB3KjpNtRQr/ROX3uI22O+kXY0Bbi4Z34y2VVsGL5qYg46xzdWJ60kW3WHbWV5hywrZEFnM0jzoKXGa2yqCvamgZdply3m5v6YqIQlGMs1P7gLouRFpeynFjaw2/D06dPSjb7KwggrwQGpwKCL4l+hZhkGbPl8Bq02I9oKFQlLZyt4sGlnsw/futIAQwBrd/8898l2EokT+clvYQwpPB70u9RUaNRpQ1j1t1QQZiZpW/JOHwOkRNzqdiPcILiYS7GcI3gcndzxCKRMo+lPxCen5jZg7xxowTF4SoMT+gegRIMVtQkOy9m/ceXfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEVyUrCq8gXmUcw/Yk/bZv3Hd2MOE2QducrzUrGmc9c=;
 b=aDEmX2ant1GsGUMLZqEiX4z3g0+VbSFy6TFNMRfud6hjJcSXuYrhCsDHg4LgfkHMd+mpnWfD0IuYyh81iSd/W1Cd/1oEFs0VIW59K5CotzuCsKfzvDidbBAJxV5gmRfdrZHIkeVbwvdeOE1wqggiVAInq6O/1sNti0C9XnEitkk=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB7892.jpnprd01.prod.outlook.com (2603:1096:604:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 08:56:42 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 08:56:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 12/13] arm64: dts: renesas: Add initial device tree for
 RZ/G3E SMARC EVK board
Thread-Topic: [PATCH v2 12/13] arm64: dts: renesas: Add initial device tree
 for RZ/G3E SMARC EVK board
Thread-Index: AQHbRXE9uLWcAAthm0+BgMLO7Y3bVLLizFuAgAEhorA=
Date: Fri, 13 Dec 2024 08:56:41 +0000
Message-ID:
 <TYCPR01MB11332E1521D38013A7EE5492086382@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
 <20241203105005.103927-13-biju.das.jz@bp.renesas.com>
 <CAMuHMdVQGd5WJD3OF6_bEHHzvNE9chTHSJSKbZT3ekM79gYiVA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVQGd5WJD3OF6_bEHHzvNE9chTHSJSKbZT3ekM79gYiVA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB7892:EE_
x-ms-office365-filtering-correlation-id: 9f3fc771-e16e-4b75-2ed2-08dd1b541038
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elZ0V3hxQjF5VjNGc0VWQ1NlcmhNT3BpY0xtdHFucHZsV2gxcjMzT0pObXhP?=
 =?utf-8?B?U2FqZDNUUDlYdFRRU2hvdS9qWWd6c3VIWFdvSjRxQWVJZFdObU56UjBmVkl1?=
 =?utf-8?B?cUxIM3VSQTFxNnYydUFaM1dpb0M1NmNKR1c2TEcrWkhvMnVFZk10c3NqUDla?=
 =?utf-8?B?OHkwUHpZNVIvdDgyQmxISm04UlB1LzNIeVJOOURKYXZSblNORlBlZzYyWFFv?=
 =?utf-8?B?L1lBU1JCNS85bW51c2sraXZZUEc1OEkyeCszZXFiNHd0ck5vZEU0M0NaOUpn?=
 =?utf-8?B?dTNBd2xsMzFoWk5ieTRQYlBmYkV4TzMvV3JOdXd1UXBGY0tYUXRmZkNma1U0?=
 =?utf-8?B?TndjR3ptU2NqV3FqeHF3VWlzZGxPQVdCWkEwaXJ2TDM1dnZLUmk0WnlkTjQ0?=
 =?utf-8?B?MU0xa2hlTzJQL0NVYmNIZEVWb0F2aWVhOWYvZVFaSDN3SFlsTmRHK1VxZklS?=
 =?utf-8?B?YjFNWGhzWmNGODJXOERkTmdid2ZwZHVFYTVZT1IxbGJnY21DRXdIYXJBcFEz?=
 =?utf-8?B?SGxJajZONnNkWkN5SUZ5S3IzZmp5aWdPT3NYR0Q1b241cXJxYVdnVC9hRDFK?=
 =?utf-8?B?L1hyNER0RTljYy9NOC9DaWRlcGZqa1BoYUhaWU9QcGF0TEhyM2FxYUE5UHZQ?=
 =?utf-8?B?MlJQa2c5clMwNWtVd1ZNU0lPanlaSXJHMEtmaWNqSE50TXRPaFVpQjZ0Zitr?=
 =?utf-8?B?aDVIOU8wZTYvUFpwOHMrSy9CSjNTc2U5V0lLdS9EV08raWp3dE44d1FQeVh2?=
 =?utf-8?B?MURxdlVvTm1ZVUV0dERHS0NCNWhSem1QOUhxRmdldHcxYkxENm54SmNRN1NQ?=
 =?utf-8?B?R2wyMXlYMVR5bDJaT1NsbkZOQ2VrTVM2QzUxWVo0LzA0bWNvSC9qVEszY2E0?=
 =?utf-8?B?Q2xCOXNZQXRoblBjcnBTaDlvVFdtSWdiajl1cGlSbXEyYnJNbUNmb2RmcDFG?=
 =?utf-8?B?SWw1QlRuR1hpaWc2TnF3QzhtZTU3RUc5NGZDR3MxemlUSXVPMjB4RkZ1OHRT?=
 =?utf-8?B?U0NQZThLOUgrcm1GMlMwb1dCbi9SL3JJTCsyZE51TTRYdWRpcmxoSmlFS3Br?=
 =?utf-8?B?bW5hSUxKY3U0UHpZWXdQRDB3OXg3eEhxT0cwdGtRMjhlNnZ2enljRVlOQjFn?=
 =?utf-8?B?dFNmOUxzSFVWYVJ1anArbVNkNm5zbklYQnZXdzZ6cFpmYVY4S1RyYm9LT085?=
 =?utf-8?B?RllSTi91cGFla2xwN2dFOWNKemZwNDQ4YVZBcTNsVUNQbXYreW5kOUNEaktH?=
 =?utf-8?B?clhlbGdSbzdyUTBFbG1naDVSWnRsYmVTb3g4TVZrRkx3YUR5VDVjL2hLT0pm?=
 =?utf-8?B?NXVDZ0ZCZURYQ3FvRmdFejFnMVBINENxbWZ6Undrc2gxdldBN1ltRkZoM3Vx?=
 =?utf-8?B?NGZiU2xzbEtvTkMyVzB4UUZOV0NXMWpQb3lPalZoSU1Fa09jQWNDSVNHVmtE?=
 =?utf-8?B?SGwxTmIvWlZTUDhZaDZ3NDIyNDFTS2pMMHN2amswWXFpMkVKenNHYUpnVVNU?=
 =?utf-8?B?M0xxSlVYNEJKbno3YnQ0QU9OY1JjeC82U2hUUEEzMWNsZDRpa0FVMzUrVmlx?=
 =?utf-8?B?QWxmRHl2cXlYaEl3WHErc3lSYzl5cjNrbUhWQllHNXhHbzJPalpJS3pGWDlU?=
 =?utf-8?B?dVNnMmZmWWh6WEI1RDFFMm5vZjNJdWZpLzN0RlRYckdieDBpOFd3T2l5blgx?=
 =?utf-8?B?bTZyaW15cXRNbFRZYk5kNFBRZ2JaYmJNK0lSbFlwZFBUbWM0TnpoSVZWK3RJ?=
 =?utf-8?B?M1FsOTQwTld0Mk4wNUlqSklWeE81QmdaNlZIeTBMcmk5cWkwK05oNk04N1Ro?=
 =?utf-8?B?S0x1cFUwZGoxeVZQaC9XYWNBTHJIVXJPaVNIQ29jdXZ4dHZmV1FWLzZlTTNJ?=
 =?utf-8?B?VUpVaWdnODFhRWFsaTg2dTdBcnM5eVRMTmMxRnUyWFpFUUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3ZnWXZQbll1UXRhSG5RQTZldnIxeGZ2eE83d016Wnc0OWJ3UDNWbGs2Q0xM?=
 =?utf-8?B?QnF6VnJta0JEQW9VUlN5N1JNUEExM3o5MTBMdit5WTArVFAvUWM2NGNVUXlr?=
 =?utf-8?B?OEVHSm9DR1c2VVRuWTJTd2J2MGV3SVIySFJ6Nlhab1dFVEhrUHgwQzdXZ3I5?=
 =?utf-8?B?bzh3RHc5bWwzaHN6dGZGZzlZcWpsUU5pVEUzV1JWQWpvd2JIbHhndEQxWk5I?=
 =?utf-8?B?NUo0aGxGaFhpdGNSOUFJNnFHaGlMMGJpbWVpRks3cTVVUG4xY2tTMjc0ZzZv?=
 =?utf-8?B?VzFSMWtuRUg4Ym9rVmZRK2xpN1p5Ly9XT0xITVNWQm1CTGxVRWVHN0Vjdzk3?=
 =?utf-8?B?OTY5NVhacXZURStOay9ZbzlPOVBDamVRazRBNHlJOStlaUI3U2wzcFd3QjFS?=
 =?utf-8?B?V2wvdXdvV2lCakFjZmVSbDlLcmNMMEdvc0FPa2p5MkRkYnM3LzRpa2QvVDhq?=
 =?utf-8?B?UWZsR3dNSTdoQnlRek5oOXh5UHptWEMzSXRmWitJOE5WR0RaT1RibTgxSGJJ?=
 =?utf-8?B?UHgvVFEyWkVLcmNKVUZNT1ROQ3VSa0k1eVE2RXg5UGV1NHFmZWFkeHBzWVJj?=
 =?utf-8?B?TDF5NW9KNzRPRkJvcTVMYjZQelo3cWlvZmpJUDBwWTFDWlo5R0ZYdVd5aE1H?=
 =?utf-8?B?R0J2d1JqTGVERGZoQjROVmtNbDRjUzVmZGlCZDNWMFp6NGZBaExWZkNxenlv?=
 =?utf-8?B?T2tKV0pHOEgrb3h4ZzJMb05pMXU5MXVOc1VFay9uWlE3am5taEhoc2RUUkZs?=
 =?utf-8?B?ckVvMytzby91NWJacGJjSkN5bU1TN2Fvd1docDZqaXdNaS94WkJMeGZJT2dm?=
 =?utf-8?B?VG5VRERaYVdaVGNQNmUxekZNS0dpeHJ6YUQ3QmtFVVJOQU1mb2FBZVhaaVZl?=
 =?utf-8?B?eG14WUk1RnNjWmNDNC9lRkxKMG8rWUs5R0xmMkRDMHlETThSRmdKaHlvZjE0?=
 =?utf-8?B?Nlc3S2JzNTM2eVFwbW1aUlJndVRpZDY1MTl5Rzd3Rk5MeUprZ3pNczNqU21m?=
 =?utf-8?B?Wmt0NnZZTElnUkdBOG96d0trVkpIR1ZjZVBjbjFBbFBIZ29wTWRIam1SeVcr?=
 =?utf-8?B?dllYa1NwMEd1bE04VTVPTUcyakMvNXBMUDBtU2VoUXZuU2lNQitVTlpwY2t6?=
 =?utf-8?B?WDFHbkQ5bzNFYmFXTDZWcjVBWkkxbVgxMlhoczZjdjhiK1FFck9Mc2RnUWZB?=
 =?utf-8?B?ckZ0WFlkLzd2R29JVUZPUmVvZVg1VUJKZWFHSmRsY29PNVNBM0pjNmh4UFQ5?=
 =?utf-8?B?WmpmWnBubU9ET3NINGNuQjBZc0ZkbnR3OXhMalFQamROaFZMNkNUbDBhM25O?=
 =?utf-8?B?RFI0VlhEcEwyVlBOQnl0QXN2WStoS082SzdKbkNOR2xzdjNsUmdIWkFNRmwy?=
 =?utf-8?B?Q08wOXlmY3pmOTlEVGllZVVaYm5DYXBmL3czRU9zUnZvaktlYVZISklVMEY0?=
 =?utf-8?B?dlg3L1RNUzZkdEFSMytzUTVWOC9jQU95ejlRRWwzZU5RdXVuKy9NWmVTOFlI?=
 =?utf-8?B?WkQ0NzhNOHpnSmpzOGh0ay9ORVNmUUdZd3ZkVjdWelppYmo2cXJFWW8wS3JY?=
 =?utf-8?B?SzRTSkNyTUtPZDAzWGdDVzNRT3pVUEo5L01CeXUrcCszdzN2dHA3a0JhcUVQ?=
 =?utf-8?B?L202UXZwWlYyRmlSZHV2TXcwZDlBS3NPMG9ybk93Rm1hanY5anN6N2tDbVFl?=
 =?utf-8?B?S1h3NS9HWWJocVlDVitlNGpyc3FZOGkrbEtPMFNiZ243Tm1wV0s2cDRvN0F2?=
 =?utf-8?B?cUozK0t6YTlyMHR5allYS0t1Z0M4NFJ2VWlRMm5lRUZSUHU4MmhSVnRFUU9O?=
 =?utf-8?B?bXNETXMwWmd3YnFwVk9QMkxVVGl3azVDaTQxbVJqSTZ6M0cxbDhnUExHbjFs?=
 =?utf-8?B?NEtWaWhOSWNPL1ZXTHVzN3ZsdmIrOVhjQVhuMmZHV1J0RENLd05rYlhqQk1P?=
 =?utf-8?B?NitWZ2V3Q1NRTWpOczUxMzkvbHhXem9yYmI0TmNsdmIrbEg2SGJBWUdQVHhE?=
 =?utf-8?B?ekJUVWV6RUVBTEpxdWFUbTV4ZXNWbm9zZWM3dFB3UjhmbGdXdURIb1Rwdkwy?=
 =?utf-8?B?eldCT2RiaWZpOTdIZWcxb0FJN25USWUxa3BCRCsvUzNWVGt4ZHFzSTdXaFBO?=
 =?utf-8?B?azU5QXZEQSs0YVAyY1dzaXJuSHl4UUQzM3pSc3BmR3ZrNWh0Uzc1ZWpvYnB1?=
 =?utf-8?B?L1E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3fc771-e16e-4b75-2ed2-08dd1b541038
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 08:56:41.9383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9dHLrx806ZdsQekUqScuzz0l85dyxiGjaE4PvkNEVQTBGmCSx1cdfBe9n08L51fdGZh5kEAXjoxiX/PfcgMbPCrPpp2nhTPTgWBPqIMqMR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7892

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTIgRGVjZW1iZXIg
MjAyNCAxNTozNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEyLzEzXSBhcm02NDogZHRzOiBy
ZW5lc2FzOiBBZGQgaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3IgUlovRzNFIFNNQVJDIEVWSyBib2Fy
ZA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgRGVjIDMsIDIwMjQgYXQgMTE6NTDigK9B
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCB0
aGUgaW5pdGlhbCBkZXZpY2UgdHJlZSBmb3IgdGhlIFJlbmVzYXMgUlovRzNFIFNNQVJDIEVWSyBi
b2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNt
YXJjMi5kdHNpDQo+ID4gQEAgLTAsMCArMSwyNCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKy8qDQo+ID4gKyAq
IERldmljZSBUcmVlIFNvdXJjZSBmb3IgdGhlIFJaIFNNQVJDIENhcnJpZXItSUkgQm9hcmQuDQo+
IA0KPiBFdmVudHVhbGx5LCB0aGlzIHNob3VsZCBiZSBtZXJnZWQgd2l0aCByemczcy1zbWFyYy5k
dHNpLCBhcyB0aGV5IGRlc2NyaWJlIHRoZSBzYW1lIGNhcnJpZXIgYm9hcmQuICBCdXQNCj4geW91
IGNhbiBpbmRlZWQgbm90IGRvIHRoYXQgeWV0LCBhcyB0aGUgbGF0dGVyIHJlZmVycyB0byBvbi1T
b0MgY29tcG9uZW50cyB0aGF0IGFyZSBub3QgeWV0IHN1cHBvcnRlZA0KPiBvbiBSWi9HM0UuDQoN
ClllcywgTGF0ZXIsIHdpbGwgbWVyZ2Ugd2l0aCByemczcy1zbWFyYy5kdHNpIGFzIGJvdGggUlov
RzNTIGFuZCBSWi9HM0UgdXNlcyBzYW1lIFNNQVJDLUlJIGNhcnJpZXIgYm9hcmQuDQoNCkNoZWVy
cywNCkJpanUNCg==

