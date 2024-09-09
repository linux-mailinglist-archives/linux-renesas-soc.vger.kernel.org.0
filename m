Return-Path: <linux-renesas-soc+bounces-8860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54896970DB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 08:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F5B28262E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 06:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A112213AD1C;
	Mon,  9 Sep 2024 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VOGwyPAT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2814428;
	Mon,  9 Sep 2024 06:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725861623; cv=fail; b=DfXKBzo1r84lFuXAz8phi4pnfdXMUfV5frubg1Fn+GuIO9OO9tWcI5RYUH0oA5thFOeTJHHdIrU1U2PCO4/6kAdw+aikzDIk+cnPRGBIAQN0hudN4mm7VwRkGEtzwE9IhWcZhqNlLVGeH+0fSPUvzvnVPlu0jUSSmwA9UUWFk8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725861623; c=relaxed/simple;
	bh=Lm2C9kuoL30njVXTbhqg98ufeR6H3DqMU5eLl5OaEM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SErtbZQMGk31hmt6lf8nMHDUDU2gJgYqIa5Y8E7R0zMTsizGJL8ddj8IwS2AblqfhKU74NxAr6GHh/zS8U3hOL3itgtjestD0fYaP+1zADYAEFY7qKQJPLzhylwFKK68PxrN2/tMQk2E8GCOIsjHCzOOTeMko58WHvDobeCOC64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VOGwyPAT; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yw62w2Yw/jU5oQ0Kj4V7YoriY/o4R5AGk8tAcc02y8YErmkUf0hZp+C9KyRRhugU/ItNy2IZ2gIUTFfOgMdWo0u1ltC/wLW1gCI4PBPeTxZ3f0Cj3pbV+BdJy3+KisPxdkuh9utvlAqIys5thmyGjAtM7Qkj2cqQXVw3n/FFfCfHWwNv5ZlxudGN1vC5Xy8RFhkQ+6mY2M7FIFVqChkJhlJxfPIHh6ODqBmGihOeb6aezrohmcud0cUmLkr4/bVCiA0MY5JD9z+VHnrGulaKbnw3WHXJLgRerF/vLg1V6GaKUgO9h4L4mjkkaj+bsNIPSA/bLneBUk2suYT8Wq8yiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm2C9kuoL30njVXTbhqg98ufeR6H3DqMU5eLl5OaEM4=;
 b=v7JRV8FMUnItM4KTwLYAJKZBlWHBwKVsgDB4pE9bQ1CZs5JayJ3OEDoppG9n2Dwx7KHugYcrav2r0rexjlG9ogJfxzn4vKIUP7A0ZQsc4EuHWUelyu0VJmDESuNe0Rzjad1AxZ2fDAOlsWTtlnc9qjeVSwfAZfnPTpNfnZ4yn6X93qMNbWr/FmD17HV7GQm6l3h4eb2GXr6Loxhz9FqWeO49Ks+HB6Zj2SnFe2Y6Hfw9QvP/YFCsOfbts4giJh7OSNmggE2ydQzM2IM/b2u2a5gO53+vG14K1e83RRN2LTp5QSE+UQ+qyFNLFVERTSmoNiTdvnKmZS/bProbDQdpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm2C9kuoL30njVXTbhqg98ufeR6H3DqMU5eLl5OaEM4=;
 b=VOGwyPATVcyXaG8vlktfSi/Dvor+/hrOQ9LzUhS8RLN57VPQ2qwA43KI+QHHl79fPsWuec/kI3ueBD4c5WplyeFcqbeJnKsU999yJ7tEO4HVLfjbHrXqymV8kpSacI+r0xed0VBK+Zr2mDui44IfnoDr6X/v/o32fAp2VFEiadI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6803.jpnprd01.prod.outlook.com (2603:1096:400:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 06:00:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 06:00:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
Subject: RE: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
Thread-Topic: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
Thread-Index: AQHbAS4ibvRfK4Xud0ioOSFDKFeH4bJOFDsAgAAKLACAANUI0A==
Date: Mon, 9 Sep 2024 06:00:16 +0000
Message-ID:
 <TY3PR01MB113466A2B99EE80E8BB0A94AD86992@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr>
 <TY3PR01MB113468D1573C1E50AC9F97DCF86982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d01bed96-7811-4ace-8b92-1ee9fafac649@wanadoo.fr>
In-Reply-To: <d01bed96-7811-4ace-8b92-1ee9fafac649@wanadoo.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6803:EE_
x-ms-office365-filtering-correlation-id: 869b1605-4c43-46ca-5a6d-08dcd094ad6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEgzVVJnbjRsSXdRWVZSTVpmcG0xOFBhWlhDRFhnNk4rc1MySlNFUnRpVlpT?=
 =?utf-8?B?OStQNyswSlN5U01sbnNoSmR0RlZ2U0NOVmZXSmViY1ZQNnJWL0ZRV0FNZEVU?=
 =?utf-8?B?RlBLaTVxUVdFdmFKR2p1Y045ODZVa0k0cVAxSzc5ZG1obm42ZXpTU003MUdQ?=
 =?utf-8?B?TTNudWRsVDg5UnJGdm13Z1ZkRkQ5TXh2emlCTm9xaGN1dG9qa3E2UWNHVDVW?=
 =?utf-8?B?V2JvSTRUQXU4OWY4UVVMNzNkeGVjV2xPZWVNZDNZdUJKNW93ZXE5YUhEUWN4?=
 =?utf-8?B?MFdZMkJOZmNWKzY3ZVFqSExTZHpnU1lHM0dwazZiaXJFWStRVVYraFcvRG9H?=
 =?utf-8?B?ekVNY21BTUhxeURHOWRhRUlIU3RKOTlqdENwdlI2MVJKZFJ5WlZzS1phUGE0?=
 =?utf-8?B?SzVmcElFb2d3UGM5VmlJU3Y4TFdqdG5EMU5xeVNaZ2tvU1UwTkZLanNGUDE3?=
 =?utf-8?B?K3FuMWdzdmxGbUcwMWpPSUorcjFpUDk0d3MrQi9rRWlqZFlPRVB3VTNkRXNT?=
 =?utf-8?B?VUVyajZ3OTBCMzYrYlhuaWV2UjNDWGJsRjl2bVRLVnF0dFFPM3BESkpBb2hZ?=
 =?utf-8?B?K2Jrc0xQODdZSFo0Z1hRMmdXL2E4T25sTFFsTTBhZTRHbWxBWStLd1dQTFlI?=
 =?utf-8?B?b2NRdGhaY0dkaG51Vlh5dTBNMUs5Y2pFcU5mVjVVK1BHMUQxNFEveko3UTdR?=
 =?utf-8?B?eHhVNTZ1Uy93RkpFM3VuVnNlY0FITnY1emk3eXFDakF0TmZyMmdBanoyOGJT?=
 =?utf-8?B?RlJDcTRpV2Vwb1EwaVpnQ0FzQmRkN2RENEhuVXpCSEdERXZNOWlKVWJUb0JG?=
 =?utf-8?B?Y05IMFk0ZnFJNUJRYm9YUVNBMHM4ckVwOXp6eVVueEwyR0hjTXdZTnl3bzRS?=
 =?utf-8?B?S0cwN2IrbnN5V2dJVElMVDdYVTYya3BucktHV1NkTFVWcTF6MFNiY3YvdjRr?=
 =?utf-8?B?Q016U21PTGtYT05zeGhvbGNmSW9EY0tGMmIrbHdmaHYwUmJCWUNHRHMxWmxu?=
 =?utf-8?B?TzVMWlcxWHlTZmwzdC9mYXVZQTZ5WHkyQVdEVlF1MFVKVVdyWktXRjdQOEp1?=
 =?utf-8?B?YUM2djlHbld1UlRtRmV6cndRa1ZRak0wbVFhTXltZGd6WVRURjdRVWthZFQv?=
 =?utf-8?B?MVUxbDk3SmFBUFkweVQzb0svNjRmQWdsNXFkeEFpZ0JSOFk1R3VMMFN4SUJ4?=
 =?utf-8?B?dWRMdFM5RmdaVFROR2ZyUGJPa25MRTltVEZPWXI2RWJrcWo4Rk9xeE15R1Zq?=
 =?utf-8?B?bnQwUzJNU0hXV2tPUmp0aWtUaDc0TnlpYjdsN1J5WU1raDZmcXhXV2ZvVHdB?=
 =?utf-8?B?OWN3KzdLdXZ0Sm5KQlg1QzB6YWNaRUhNY1M0ZXYxQTM3UFFTcWJwTHJNUG9P?=
 =?utf-8?B?ZXpZbUdKazNjZG9Qc2M5OXBYS3Ixd1ZZdnFkUEZDcGpUeTczei9uWk5xSHBh?=
 =?utf-8?B?SjNYUXM5NmF3Q2hncVV6YVVLTTZaRWc2bitRZUdNQnRYRW9lUGhML0lSakpX?=
 =?utf-8?B?K1pPUkh1YzU5S1E4QVR5RWp6SDhWLzA2enM2MkRlYjFEekgzTTMzamRzRDA4?=
 =?utf-8?B?MzVnWFRiS2lxaHpMMkp0WHJZS2ZOODAwRTdpdjN2MVcyMTJ2SmFXWVhUNHFo?=
 =?utf-8?B?amRVNytTQkxYV00wdVJjcVNZeGFadm9XOEM1aUhhL3dmeWRDVzJ2bE91S29H?=
 =?utf-8?B?UVAyRUpvQkdvVWhneVV1cU43b09Sc21DZzE0UGtyMjRjZVdOZGR6WUJ4ZUlB?=
 =?utf-8?B?NEZkZngxWjI1ZGwrSDI4a0VLUFlyallWWXZ6cjlGeEV3bjNwdVdLSm5RWjZG?=
 =?utf-8?Q?/0GmLT+OVrIWnGOYHbjsudxshDrrps7ZlD8OM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVdnRVRTbmVNTVc5WWVKSU5zektXeGZURHFhcC9nU2daUTBBbzF3a0YzNVF3?=
 =?utf-8?B?ekI2TG1VSGNlS21EMGVveVlHMjI5QnVuK3J1WG9xc2h1T2plZFJBQjNIZC9I?=
 =?utf-8?B?alpVSGFJaEdCZXY0bjlZZys2allFWG1zVjd0QmQxTjdwM0pIb1RuU08wQ0pT?=
 =?utf-8?B?M1dWbGlmSFFyUENLZ3Y2TFRDSHBtcDVNci9jVDZqVmxwV3R3RnVJdkc3QlJm?=
 =?utf-8?B?Z1RwM3NZamhBRjZFamxVc29CbmErUlBLM3E4amxnVVZOZXNCLzFac0EyMVNI?=
 =?utf-8?B?c3lFQnVNUUxDSGFXS3pabEhKQzd1R3JTc0lCWHErQnI5OTlHSGh1OHliTGE3?=
 =?utf-8?B?eVpmd1pSNVhqK3ZYcU4xK1VQbmlwejRuLzVqWmoxZVBwcFI3WFhseHVnTks4?=
 =?utf-8?B?bDZpdXZ3SWFDMzhOOGZBRVhjdnk2cFNKQ3ZlT3BNdzNPUENlSWs0V2F0VUg4?=
 =?utf-8?B?MVc3RGZVOTV4dFlWQi9yUlZtdUduVTBLYnNvWXdqUkZQbi83dEpUM3BtSEtJ?=
 =?utf-8?B?NURBd2RKMFdJdHpxdERyWTRTU1Q0NkR3MENua2h6cmJDeUFKcCtLOEpiVDVD?=
 =?utf-8?B?SW9COUUyQnpETVhJOEJpNlJJWmNqSmhUMFNJbFMyZTdoc2YwT2g0Q0x4QkYw?=
 =?utf-8?B?ZkZTR1l1LzhhaG56SWVPaDFPVldsYXBQR3NGR2FDWWs0OEFWQWg1ZEtHbmV5?=
 =?utf-8?B?ZHozNXRyZjdsaEdrMXo4WngvZGl0KzlkWXFOZms5WFFrWnlUdkQwQmEydFlF?=
 =?utf-8?B?aWlzRVNFT0JIemxZNjdxZ2R4UTZLWmVUS1VSc1craEpKY25jbVBjQTlqcUl5?=
 =?utf-8?B?djVGeVhDd2NDTG1ZVWJHbm5xN1c3ZW1FbzlTUEZFb3QxL0dLSzYxQlFGRHl3?=
 =?utf-8?B?MW9aUDJXeVFHRU83aEpHUUtwZThrWjhQMklrdXQ3Wjgzdk9rZjBsN3ZEY0dV?=
 =?utf-8?B?MUIrMHdYRzEvTkppQ29vQVRDdkJPVTdlZGk0Sm5TdHVsclJJdUdPRmdzMEFo?=
 =?utf-8?B?MGNVWGVFbjJQYnlIMHhSRTJPTGtoRGl5eVg3T1gvOWJPdXRaaGtPSVdYRGo5?=
 =?utf-8?B?RjFvdWFLQzEzSldFQlNYRDJJYWppd1BJVzJnZGpFbFBtcVdmVFg5YzBsYmlu?=
 =?utf-8?B?V0QxS09ZYTBzQW1qZWxwTm1KdExXRzJLdWdQYTk4TEQvdkhVcjNGT1VNYWNI?=
 =?utf-8?B?OEVGY2FoUTA3clN1STMxVGtrRWR3c3B3amM1SFFBMlJJcm5yck5RazVqRVlS?=
 =?utf-8?B?NHBCMFk1U3FDYUtyT3NscmpvT2xzNC8rdVJtRGl0UmVTdTZQeDB3SVkvVmpp?=
 =?utf-8?B?OGJRczRicEFhYkNBbS83dVVSbkhsUU1xRk4xNmdRdEhReXUzRU0vUUtxNm4v?=
 =?utf-8?B?NVA0cVgrRFVsZ0cyRXZkSVFQaHF3LzVvYy9pZjhkUklNRENQQ2daWm5hcmFT?=
 =?utf-8?B?WGhmNlpoeUZJM1MvVHlGQ3lxY3lud2c3NUNyWFViNGJRV2J5WnBsK2NJd0xB?=
 =?utf-8?B?WGI4OXFpcTlBdnBZR3hDd2NOVkRQaEY4aUcxbi9DNlUyU2JwS2dYOTljMFhS?=
 =?utf-8?B?QkdyampRRzZwd25KTk5QMnlOVHZTRzVTMW1JUWl6VmYwd3dnbTlDUDVPSS9Z?=
 =?utf-8?B?OEhlU2pjL2NHUXVIWHhweEgzRXJXZEFHVHAvNUVLUWRwZ0JpcWNpTGF5ZVVT?=
 =?utf-8?B?MUFuY1g0MGJ1cEl6QXBscmhpMUdNTittdkFWVXl5U2szK015YU9vVVQ4aWZB?=
 =?utf-8?B?Z0FmWlRjd2drcmV5Nisva29rNzA4RHJ5ZElFSkp5WDg5K0cxZkl4akw5R0dE?=
 =?utf-8?B?SG9xMHc4YlFzYVhDcXBOT1p0SmtTai9tSEhYRnJoeVJTZENmaDM2NE54ejVN?=
 =?utf-8?B?VGNvekMrVzBwM0ZVcWszY0NRajdXb2IrUTRINURCQVpJN2s5RnBrRU9qb1FW?=
 =?utf-8?B?d3hRcWppdVdqQVVXOVB4OUczcEh3dEo5VytCRVBob2x1NVYybEpYM2Z2ZnM1?=
 =?utf-8?B?dWFHWlZnbTN4bXlFZ1doMldMamlteFBiQy9wLzZBL0VuNWltMTBZdzFDelVp?=
 =?utf-8?B?anNLQ1VqNUhqVDJsMndrb3A1anBIcnllOTdEQldJUzFnSDhrWW5uaFg5ek9U?=
 =?utf-8?B?VXg0U0VqWWFISHFBYVRJQjlCaWNDNlRhMXNHYWhaZ3JyOWpXZWdUaVZtend2?=
 =?utf-8?B?d1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 869b1605-4c43-46ca-5a6d-08dcd094ad6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 06:00:16.2912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0H+s74/A/CKRGDNaIS9ZOhHt5ZibQtbaz3UO5dJj31L4eL6J9oHuWeiqHKyvdnTWiewrJJTnvnqNJxd7dj4mPY7zkaw1p3s56SGVA6N0gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6803

SGkgQ2hyaXN0b3BoZSBKQUlMTEVULA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+
DQo+IFNlbnQ6IFN1bmRheSwgU2VwdGVtYmVyIDgsIDIwMjQgNTo1OSBQTQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyXSBwaHk6IHJlbmVzYXM6IHJjYXItZ2VuMy11c2IyOiBGaXggYW4gZXJyb3Ig
aGFuZGxpbmcgcGF0aCBpbg0KPiByY2FyX2dlbjNfcGh5X3VzYjJfcHJvYmUoKQ0KPiANCj4gTGUg
MDgvMDkvMjAyNCDDoCAxODozOSwgQmlqdSBEYXMgYSDDqWNyaXTCoDoNCj4gPiBIaSBDaHJpc3Rv
cGhlIEpBSUxMRVQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDaHJpc3RvcGhlIEpBSUxMRVQg
PGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPg0KPiA+PiBTZW50OiBTYXR1cmRheSwgU2Vw
dGVtYmVyIDcsIDIwMjQgMjo1OSBQTQ0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIHBoeTogcmVu
ZXNhczogcmNhci1nZW4zLXVzYjI6IEZpeCBhbiBlcnJvcg0KPiA+PiBoYW5kbGluZyBwYXRoIGlu
DQo+ID4+IHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZSgpDQo+ID4+DQo+ID4+IElmIGFuIGVycm9y
IG9jY3VycyBhZnRlciB0aGUgcmNhcl9nZW4zX3BoeV91c2IyX2luaXRfYnVzKCksDQo+ID4+IHJl
c2V0X2NvbnRyb2xfYXNzZXJ0KCkgbXVzdCBiZSBjYWxsZWQsIGFzIGFscmVhZHkgZG9uZSBpbiB0
aGUgcmVtb3ZlIGZ1bmN0aW9uLg0KPiA+Pg0KPiA+PiBUaGlzIGlzIGZpbmUgdG8gcmUtdXNlIHRo
ZSBleGlzdGluZyBlcnJvciBoYW5kbGluZyBwYXRoLCBiZWNhdXNlIGV2ZW4NCj4gPj4gaWYgImNo
YW5uZWwtPnJzdGMiIGlzIHN0aWxsIE5VTEwgYXQgdGhpcyBwb2ludCwgaXQgaXMgc2FmZSB0byBj
YWxsIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KE5VTEwpLg0KPiA+Pg0KPiA+PiBGaXhlczogNGVhZTE2
Mzc1MzU3ICgicGh5OiByZW5lc2FzOiByY2FyLWdlbjMtdXNiMjogQWRkIHN1cHBvcnQgdG8NCj4g
Pj4gaW5pdGlhbGl6ZSB0aGUgYnVzIikNCj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBK
QUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4gPj4gLS0tDQo+ID4+IENo
YW5nZXMgaW4gdjI6DQo+ID4+ICAgIC0gUmUtdXNlICdlcnJvcicgdG8gc2ltcGxpZnkgdGhlIHBh
dGNoICAgW2NsYXVkaXUgYmV6bmVhXQ0KPiA+PiAgICAtIFVwZGF0ZSB0aGUgY29tbWl0IGRlc2Ny
aXB0aW9uIHRvIGV4cGxhaW4gd2h5IGl0IGlzIHNhZmUuDQo+ID4+DQo+ID4+IHYxOg0KPiA+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZmM5ZjdiNDQ0ZjBjYTY0NTQxMTg2ODk5MmJiZTE2
NTE0YWVjY2ZlZC4NCj4gPj4gMTcyNTY1MjY1NC5naXQuY2hyaXN0b3BoZS5qYWlsbGV0DQo+ID4+
IEB3YW5hZG9vLmZyLw0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1y
Y2FyLWdlbjMtdXNiMi5jIHwgMSArDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2Fy
LWdlbjMtdXNiMi5jDQo+ID4+IGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVz
YjIuYw0KPiA+PiBpbmRleCA1OGUxMjMzMDUxNTIuLmNjYjBiNTRiNzBmNyAxMDA2NDQNCj4gPj4g
LS0tIGEvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVzYjIuYw0KPiA+PiArKysg
Yi9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4+IEBAIC04MDMs
NiArODAzLDcgQEAgc3RhdGljIGludCByY2FyX2dlbjNfcGh5X3VzYjJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPj4gICAJcmV0dXJuIDA7DQo+ID4+DQo+ID4+ICAgZXJy
b3I6DQo+ID4+ICsJcmVzZXRfY29udHJvbF9hc3NlcnQoY2hhbm5lbC0+cnN0Yyk7DQo+ID4NCj4g
PiBUaGlzIHdpbGwgcmVzdWx0IGluIGVpdGhlciBrZXJuZWwgY3Jhc2ggWzFdIG9yIHJlc2V0IHVz
YWdlIGNvdW50DQo+ID4gaW1iYWxhbmNlIGluIGNhc2Ugb2YgZXJyb3IgWzJdIGFuZCBbM10gaW4N
Cj4gPiByY2FyX2dlbjNfcGh5X3VzYjJfaW5pdF9idXMoKSBzZWUgWzRdLiBBbHNvIHJlc2V0IGNv
bnRyb2wgQVBJIGlzIG5vdA0KPiA+IHJlc3BlY3RlZCBmb3IgU29DcyBvdGhlciB0aGFuIFJaL0cz
Uy4gRm9yIHRob3NlIFNvQydzIHJlc2V0IGFzc2VydCBpcw0KPiA+IGNhbGxlZCB3aXRob3V0IGNh
bGxpbmcgYSBnZXQoKS4gTWF5YmUgYWRkIGEgY2hlY2sgKHBoeV9kYXRhLT5pbml0X2J1cykNCj4g
PiBmb3IgYXNzZXJ0IGFwaSdzLCB0aGF0IGd1YXJhbnRlZXMgYXNzZXJ0IGlzIGNhbGxlZCBhZnRl
ciBjYWxsaW5nIGEgZ2V0KCkgYXMgaXQgdmFsaWQgb25seSBmb3INCj4gUlovRzNTPz8NCj4gPg0K
PiA+IFsxXQ0KPiA+IGNoYW5uZWwtPnJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJyYXlfZ2V0
X3NoYXJlZChkZXYpOw0KPiA+IAlpZiAoSVNfRVJSKGNoYW5uZWwtPnJzdGMpKQ0KPiA+IAkJcmV0
dXJuIFBUUl9FUlIoY2hhbm5lbC0+cnN0Yyk7DQo+ID4NCj4gPiBbMl0NCj4gPiByZXQgPSBwbV9y
dW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7DQo+ID4gCWlmIChyZXQpDQo+ID4gCQlyZXR1cm4g
cmV0Ow0KPiA+IFszXQ0KPiA+IHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoY2hhbm5lbC0+
cnN0Yyk7DQo+ID4gCWlmIChyZXQpDQo+ID4gCQlnb3RvIHJwbV9wdXQ7DQo+ID4NCj4gPiBbNF0N
Cj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMS1yYzYvc291cmNlL2Ry
aXZlcnMvcmVzZXQvY29yZS5jDQo+ID4gI0w0ODMNCj4gDQo+IFNvLCBpZiBJIHVuZGVyc3RhbmQg
Y29ycmVjdGx5LCB2MSBbNV0gd2FzIGNvcnJlY3QuIDopDQoNClllcywgSSBhZ3JlZSB2MSBbNV0g
aXMgY29ycmVjdCwgaWYgd2UgaWdub3JlICJyZXNldCBjb250cm9sIEFQSSBpcyBub3QgcmVzcGVj
dGVkIGZvciBTb0NzIi4NCg0KQW5vdGhlciBzb2x1dGlvbiBjb3VsZCBiZSB1c2luZyBhY3Rpb25f
b3JfcmVzZXQoKSBmb3IgY2xlYW51cCBmb3INCnJjYXJfZ2VuM19waHlfdXNiMl9pbml0X2J1cygp
LCBzbyB0aGF0IGl0IGlzIGFwcGxpY2FibGUgb25seSBmb3IgUlovRzNTPz8NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo+IA0KPiANCj4gSSBkb24ndCB0aGluayB0aGF0IFsxXSB3b3VsZCBjcmFzaCwgYmVj
YXVzZSBvZiBbNl0uIEl0IHdvdWxkIG9ubHkgV0FSTl9PTi4gQnV0IHdpdGggdjEsIGl0IGlzIG5v
dA0KPiBjYWxsZWQuDQo+IA0KPiBXaXRoIHYxLCByZXNldF9jb250cm9sX2Fzc2VydCgpIGlzIG5v
dCBjYWxsZWQgaWYNCj4gcmNhcl9nZW4zX3BoeV91c2IyX2luaXRfYnVzKCkgZmFpbHMuIFNvIFsy
XSBhbmQgWzNdIGNhbid0IG9jY3VyLg0KPiANCj4gSSBjYW4gc2VuZCBhIHYzLCB3aGljaCBpcyB0
aGUgc2FtZSBvZiB2MSwgb3IgeW91IGNhbiBwaWNrIHYxIGFzLWlzIChpZiBJJ20gY29ycmVjdC4u
LiA6KSkgb3IgeW91IGNhbg0KPiBqdXN0IGlnbm9yZSBpdCBpZiAicmVzZXQgY29udHJvbCBBUEkg
aXMgbm90IHJlc3BlY3RlZCBmb3IgU29DcyIuDQo+IA0KPiANCj4gSWYgb2YgaW50ZXJlc3QsIEkg
c3BvdHRlZCBpdCB3aXRoIG9uZSBvZiBteSBjb2NjaW5lbGxlIHNjcmlwdCB0aGF0IGNvbXBhcmVz
IGZ1bmN0aW9ucyBjYWxsZWQNCj4gaW4gLnJlbW92ZSBmdW5jdGlvbiwgYnV0IG5vdCBpbiBlcnJv
ciBoYW5kbGluZyBwYXRoIG9mIHByb2JlLg0KPiANCj4gDQo+IENKDQo+IA0KPiBbNV06DQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mYzlmN2I0NDRmMGNhNjQ1NDExODY4OTkyYmJlMTY1
MTRhZWNjZmVkLjE3MjU2NTI2NTQuZ2l0LmNocmlzdG9waGUuamFpbGxldA0KPiBAd2FuYWRvby5m
ci8NCj4gDQo+IFs2XToNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEt
cmM2L3NvdXJjZS9kcml2ZXJzL3Jlc2V0L2NvcmUuYyNMNDczDQo+IA0KPiA+DQo+ID4gQ2hlZXJz
LA0KPiA+IEJpanUNCj4gPg0KPiA+PiAgIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCj4gPj4N
Cj4gPj4gICAJcmV0dXJuIHJldDsNCj4gPj4gLS0NCj4gPj4gMi40Ni4wDQo+ID4+DQo+ID4NCj4g
Pg0KPiA+DQoNCg==

