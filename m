Return-Path: <linux-renesas-soc+bounces-9949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E29A703F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 19:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369A71C21C94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 17:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461FF1EABBA;
	Mon, 21 Oct 2024 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oaBqRfuz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBA19939E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Oct 2024 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530004; cv=fail; b=Dlkz/g5qwsv2H4YBpdrH8QzY7Oluslt3R67C06lSnAmKvMVsc8Fdtrq4YA34KRNFb8F7FBO76GnXpGESsPdM/D/LVaNTVQBxyZrhJNdMVs6Eh0IIStHguZL9wa9dgbX8c6coxbICkKqe4eLGaESd7dxYbDc0a4DFmYdjjd7XQ1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530004; c=relaxed/simple;
	bh=GUzaAB3STyPkRXne3F40/b3ULera5tBy3Q3WkumLvqg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NL7jf5Ru2FF80YQqNkVxZB62mx1VEZSEJbC6tYEMxA/My9smPuUkNfLtwDAZKzDphAO4SX+02AdaCAwWaDObLkPjyj/7bqB7n9FKuWGw+JUONbqxz3N6QE1moZLtH7vBuJw1SsenE6tHxAYHPrHO5LZ93Ivx4D0i93NM1rZM7RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oaBqRfuz; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE0x3oFN7nBhhHWXz3cnowRl0thKtNnxR32a/N6R8Ms5dEOab3YWFcv8xIGbkdpf05h1mns8D3oCU4yR1PiutxlMubk5A1VSKJ+ikckm8cTfSADrAuWLjCIUh0C2A8KjkBbYEjFmKqL5RWmnrPI8WbCVW4dEd+cFUzo+g+EUrPVKyKbmE9oq38akFOvJSfdaGHEtGzOwBVErgtq2rF8OY9VZ7JIU29/VnbKQHSdeXPHStynjE8Abg+lJyfb1MYw9jz6fL14LIc/dSve6QdbcJrATFH+mT3X6SAj7lliZD859G330CIyqqhiK3iTKWafOX0xakE+lvWKrxZ4UpHuIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUzaAB3STyPkRXne3F40/b3ULera5tBy3Q3WkumLvqg=;
 b=DJJPkoJRZPjDdyP1pszJik9dydOuL4RkfmIK3QUGQ8I09i70BBNRDCXPQJc63ggC3Lh981hGDYHe09ZtN69p0doBbEcJo0UGH6Q0h5xZ/e4qYngGsAVut+Whf+KzruW5fLu/9nnmdRLM8HSLODfyAoNEjCm51KNLW2xUlfc+QnvOtvUM6vc745Tg1Pc48G400IZhdTBmMVTdwMDwxHj7IYui9clk5vzFXYieQh9s8zogQJ2qv72ulJHfWcYn0tafEzAy6tfg7Ki+OhnSKBBl2ts4aLvhbyw4jpSIN97Ts1QyaetErp6rInNDpmC4FCFPsXvcQ8g/BFd4WxgQHhgEmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUzaAB3STyPkRXne3F40/b3ULera5tBy3Q3WkumLvqg=;
 b=oaBqRfuzbr6NGdsC6U5E1t82lEv6IEaU6++dsWvv/3iE7j/jLnb4nxzUPZdFdFQtiohjqDN7WA1YAAcYRQ3mpk5yco9yCYJCqF22GvHX7RoWuii8fC69ErEI4Heex6sEygmwjkF0YWuyTyCdrnZhDbdjUXykSBF2RGOn+qOyT6U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11644.jpnprd01.prod.outlook.com (2603:1096:604:22f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:59:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 16:59:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: rz-du: rzg2l_du_crtc: Fix max dot clock for
 DPI
Thread-Topic: [PATCH] drm: renesas: rz-du: rzg2l_du_crtc: Fix max dot clock
 for DPI
Thread-Index: AQHbFzyIqj9Ndvm3dU6BXuboquhBQLKRclzTgAARK/A=
Date: Mon, 21 Oct 2024 16:59:44 +0000
Message-ID:
 <TY3PR01MB113466FC1EAA5E66CF5E03E8086432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241005153733.109607-1-biju.das.jz@bp.renesas.com>
 <20241007183433.GE14766@pendragon.ideasonboard.com>
 <CADT+UeAT_=38YeeOMPpLtBzoUmb_vA15BTFT0CPjDZWN0Ph06g@mail.gmail.com>
In-Reply-To:
 <CADT+UeAT_=38YeeOMPpLtBzoUmb_vA15BTFT0CPjDZWN0Ph06g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11644:EE_
x-ms-office365-filtering-correlation-id: a2e329ab-6a13-4e1f-b6d9-08dcf1f1c36b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bERKNmw1cXBnbUVGUHg3bU5tTWllTENqQ3dreVBZVS9mbGRDTFdJakhTOUJP?=
 =?utf-8?B?YTUwbDJaOElZRDZHUko5a1JwL0c4T3hhc2sraWloK2FPY3h2dmJCT2JSSG9N?=
 =?utf-8?B?b2FkMG5hSUQwMStEeTN6b1VmUmhlZEVyU0ZMUGdyd3p5WTMwSTJ2Wk00OEh4?=
 =?utf-8?B?Mmk4VlBJbDlwMmhnUTJiVHhZYi9RYkI0aTE3aXB4c1RKWlJiYllhbkxZSmRE?=
 =?utf-8?B?TjdxYXJXWEJDWlJONFVRUllIWVlFdkEwTEtkSnVtMWlYT2lMMFczdHlLOTZ3?=
 =?utf-8?B?WHc2b0YrdjdUWXllR2NuVFpLVGJpWFhoS2I5SXc3WkhnSkFEYlR6cFFYR3NP?=
 =?utf-8?B?dXNISXIrbWtBQWF6VXZ5enlhZDdSZWl5ZzNTWmttamFkQnpocTZXaW95WXYw?=
 =?utf-8?B?WHhsakVsVVBjbFFvZGFTODg2RElnOEVSUVp3NTZFaVlMbm5qVXMrK09DSHYy?=
 =?utf-8?B?cXlvdUFhYTE5Z2tJN1cyeDJVMGkycnpxdlZEeDRCdGxueHd6Wk92L1VTR3NW?=
 =?utf-8?B?RHFnMW9UMy9ua2FzdjhKaW9FbEQ4dHhOZEtqM2VkU2VhM01MNmVDQmNHSlZz?=
 =?utf-8?B?Mm1PWkFUalNBRGVGTUVkYjdneDJCcy8wN0FPZ1daQ0kvejNPTXBOUGs5MEFt?=
 =?utf-8?B?UFQ2WWxEVnZkaldESmdSK3VZZkhLMjA3V2kyd28wZnZjdUtpV0tCU1hvUWs3?=
 =?utf-8?B?YW5FYjVBV0kwMCtJNXRhblJKczJRNjg1YzBhWkxJc2NYSWQ5RFdiSERZWUJM?=
 =?utf-8?B?aENFUWtpTDhLU0FkZ0xTQ0hoVGVyc0w1RUVFOENoSTlEdmRPeExWZDl0Y216?=
 =?utf-8?B?TDFUMERPaks2TkZOT25UeEpNNmtuc1grdjFpYjhlbVkydG1td3N4dU80eERT?=
 =?utf-8?B?eXpxdTMzKzVJc1IzYUxYVW9LVXhTaVlzU0lyUWVXNmlYT1VLODNYNGxES2pR?=
 =?utf-8?B?andqM2MzeGk2MWZWMFZZZEYrbEYzSm1rQ0Q3NnpBRWZKenlCdmJuUDJmZTIz?=
 =?utf-8?B?MWVPZW9NTFo1V2JndWxFYkFwSWFFN1J4UnpRTVFLT2FVWVdJZll6M0JFeHhC?=
 =?utf-8?B?VGs1TWFucTRBQngxbW5sZ0luZHJ6Y0cwNHFhWHpyUk5YbjBmMzFzMmp1OUdR?=
 =?utf-8?B?NCtiZDZvVFZ1R1VpcnJtQ0QzQktmOTdqbDBDcGhUak5ZZHY1STlndFB1bS9Y?=
 =?utf-8?B?T253QnFMSGE1dldmTmVUOFRuUmNUZm40OGlTWEpjSFFYaHcrM3lRM3cwZVdl?=
 =?utf-8?B?YzY1aGZ1Um1XUUprWkYvK2RIZENLcGRDd2hPVWdvRko1RXZmQVJrNDc1U0xG?=
 =?utf-8?B?aWsxUTJSUzlzTnkyN1M1UXpVdFJoMHl1ZmRoQ0Y3djVabXd1b0loNkh2d1lu?=
 =?utf-8?B?N2ljb0JKNVNSUktndnRGR1ZOSUFGR1FjN3BmY2dORXY4RXNSb2oxUHVVdTYx?=
 =?utf-8?B?RGQ0WC9FYlRGQnhUSGdPNWExb3JBOWxhN1VtRk9kWUlVU21tcm9Lc0pmdHh1?=
 =?utf-8?B?aCtwSVZiVklraUxXdmtlZVZES3FmQ01RRXJHUjFGWTVjVXhIMXcycmJwUkY5?=
 =?utf-8?B?T1VEa1o3YzhHL1pMSGp0dTg3U0w3eFR4WStUN0FaZng4Rys2R0RjTG4yMW5H?=
 =?utf-8?B?Z3lBSHBuQjQ2K1dxZjN6RWxobThOV0JvMnJtbkgxT0NqWnUxV3k1MDJYYWx6?=
 =?utf-8?B?L1lSUmdXSmYxd3ZscDdGNnJSc0VJMzRsUnp0cFp0NnhPMFUvRG9RYW45cHJM?=
 =?utf-8?B?RzdwZWpndEtUYnZRcnNjMDl3UVNIazZJbTBVdDRlS2ZMRStTWmw2Z2I3ZXBN?=
 =?utf-8?Q?UTqCOFE+5B5xd+EbtesrgKFrBnz1bIn0pBdIw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cCsrZ3EwTEpWTkZDZkFDT3ZiL1o4Q1p3STN2RVhsMWkwSzN1ak92eXVXQmFw?=
 =?utf-8?B?NHdWVVU4V1ZEV2pRaXBIRHpCUi9wdks1ZHFWVGhVRCsrNXhHbnBOQ2I2MURu?=
 =?utf-8?B?Y3RBUzBOejR2TmZwQXA5ejZRdi9yaVhKVVBkWnhLUExDT3hOYzF2dDZJUFcr?=
 =?utf-8?B?S2dueEhCcjJiU05aclpPTlRpdWJjSy9wMEUwOGFJcmNGWDczYjYxUVRYQVhq?=
 =?utf-8?B?Y2V3NUsxYkVtaDhSVnI1SUxITCs1QjllL1o3TThnd1JSS1hSOGRMRCtCbHpL?=
 =?utf-8?B?Z05OMHphcjU2cXdTbmwwRFM4ekR6bnFFbThUV1Mrd0U4RzVCTFdaTm84SnJS?=
 =?utf-8?B?NE9QOUptWjJKTGRjNTlyK3JOdFdLSWRmbDkwRkQ2SXVINCtCd0V2WVl4NUsw?=
 =?utf-8?B?WVFxWnREYVRCMzYrMUQ2NkVLbEQ3MWJjUzhXZG4xaUg4Q1VOM21tK29TbVNx?=
 =?utf-8?B?dzNXeWFIcHhCRWZKUDl1OHh2WHVrRUZsRGgwejFTbkRZb29USnBWUEg1UjVJ?=
 =?utf-8?B?M0tEeHB2TlhzZm14V2JFZnIxTzJSSWJvRDdTTEpMd3RVekxMYXB3L2luNzdO?=
 =?utf-8?B?dHgydkF1dTcycllTMm9EdjZ5Qkk1aEJ2OFNGN1M2K0hsREtiTXR4K042bnV2?=
 =?utf-8?B?cTNGWWZLMHRPNWM2bDhnTTlvMWlNeFQvZFlWNWVQSDVmL1RyblV4TkhBbk1K?=
 =?utf-8?B?SzhwSTRkazI1NmhXUDgwdkl1UGQvZjlpVFR4VTJjeVkxUXBaOE53d043cGFv?=
 =?utf-8?B?bWV6bysrUUMxaFdXY1h6N0VGREdlWXFzeEhGeEdMcEFGak5YMHd1NGo2V3ZU?=
 =?utf-8?B?Q2xjQ050MVBaV1FyZ2UrTkNMZzdIUjB0NXZCSHQwUFZOSGVYWndoSzZtVk5M?=
 =?utf-8?B?clYvU01ERU81TnZuVVJtYmp1YnF0U0w5SlA3V3VHTi9vNjI2dHcxRUNNZ0ox?=
 =?utf-8?B?V09YcWdkbVI4bE9ZbzZLb2ppVVpQMUwycGQ3dHovRE96bDBEdnMxRG4xa3JF?=
 =?utf-8?B?dE11U2xaSCsxN25LVmU1OFllV1Y5SjgvUHpOWkNmUVYyMUdjTHFFRDArclF5?=
 =?utf-8?B?Rml4TytQUmM4MjJMNFM2dWhZNVVXMk01Z1JpNXpJaEdFZzhOL25Sdkxzajk3?=
 =?utf-8?B?dkFtQ2RTN0NJQVB6cE4yWnhMOXZFYjlmbGlCN0FTTlU2bmY2Ykp4QVo2L3JJ?=
 =?utf-8?B?LzlQUThXZjBIWURCYzBJVVl6OFZQMWdHTU5jTTlVcU9tcDFzaWN0c2I3cGYv?=
 =?utf-8?B?cldseXB6bjhhbUprVnRueWgvR21uZnUxQTk3UjlNWGVXSkQ3RTRUdTRjYVRM?=
 =?utf-8?B?TDhjNnFRNmFwb2FBYlZmdjJVQVd5ZWFBM01nUFhFK3JRa1UwS1d5azlxOWYz?=
 =?utf-8?B?cU1QS21XTTlBZXg3NVAxR1Z0KytkMVlmMmNNU3lKeDlqNXJ3eTlhUGNGdzM2?=
 =?utf-8?B?KzFZZmhPT1RwV3ZKRERjMjNpckFJdGxHMDVBSkdaZW1wR2NGMGRzclp5L1ho?=
 =?utf-8?B?TFVyWHNaNm1yanpTZ2I1NmdvRGtjVGVvZElXQWV1WG1MalVqUzIyN3VIYW1a?=
 =?utf-8?B?ekhpWjltWi9JeWNlL0g2S1pXNk9ueFZWeVRVRVVxWGwrMkJDSm4zTk01U203?=
 =?utf-8?B?d0J5K21Db1doWVJrU21UR0FPQmU4OVpvZFU4a3d0U21OOUVZOFovb09HVmth?=
 =?utf-8?B?R1dIN1BocHNwV1l4b2pzcUcrelpmY3BFMGlmMjM4TGsxZzBibUVERS80ay9j?=
 =?utf-8?B?SCtyVXJkQjl6eXRkQW1SVmc0MFVsUkZxeXJPTzRQcmJXSWVMaE1sUS9LQ0FZ?=
 =?utf-8?B?OHoycjUyNFRjRy9EeDQzR1ZaS09SSTdnQVNHTldpek95NlpWMDNHSEk4c1h5?=
 =?utf-8?B?ME5pVjdEUy9XREc1SzdzVTdFUWM0ZmtraFBmT3dubjlyV1hZRER5Rm1vNzhI?=
 =?utf-8?B?aGZzUGtjdjV6OWJRYVZmQjRjUk1CZnFTT2JZb0JJQnorK1hhSkN1bTVYNWJ3?=
 =?utf-8?B?UUVYMllBYVBtM0hRMjIvZ0tVNkR2ak9rS1hiUHpDNUtoL3l1QmtteTdlOXlr?=
 =?utf-8?B?ZzJ0YjNYL3NGR2t5NjZzeVl3Z2s1TFJIbXpmeXA2UXNid0JUUyt4ZSsrbG9Y?=
 =?utf-8?B?SlR0bHJUMzA0V1lZa0NZYVVaTE51bnJwMnFmS0VyYjIwaHNVWWVOcVRLR1pZ?=
 =?utf-8?B?blE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e329ab-6a13-4e1f-b6d9-08dcf1f1c36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 16:59:44.7160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /N+mDx/b8wf15RB4GsTyajlnOiJrBqGp+73VFg0+yIqeKxjqP/KrxA/PX4/vfW4pRQFByd1ChawM7c4SjpKUzXHASOtJg6MmskRmUN/VCqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11644

SGkgTGF1cmVudCwNCg0KSSBtaXNzZWQgeW91ciByZXNwb25zZS4gU29ycnkgZm9yIHRoYXQuDQoN
Cj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPg0KPiBEYXRlOiBNb24sIE9jdCA3LCAyMDI0IGF0IDc6MzTigK9QTQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBkcm06IHJlbmVzYXM6IHJ6LWR1OiByemcybF9kdV9jcnRjOiBGaXggbWF4IGRv
dCBjbG9jayBmb3IgRFBJDQo+IA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHBhdGNoLg0KPiANCj4gT24gU2F0LCBPY3QgMDUsIDIwMjQgYXQgMDQ6Mzc6MzFQTSArMDEw
MCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQXMgcGVyIHRoZSBSWi9HMlVMIGhhcmR3YXJlIG1hbnVh
bCBUYWJsZSAzMy40IENsb2NrIExpc3QsIHRoZSBtYXhpbXVtDQo+ID4gZG90IGNsb2NrIGZvciB0
aGUgRFBJIGludGVyZmFjZSBpcyA4My41IE1Iei4gQWRkIG1vZGVfdmFsaWQgY2FsbGJhY2sNCj4g
PiB0byByZWplY3QgbW9kZXMgZ3JlYXRlciB0aGFuIDgzLjUgTUh6Lg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IEJlZm9yZSBhcHBseWluZyB0aGUgcGF0Y2g6DQo+ID4gcm9vdEBzbWFyYy1yemcydWw6fiMg
bW9kZXRlc3QgLU0gcnpnMmwtZHUNCj4gPiBFbmNvZGVyczoNCj4gPiBpZCAgICAgIGNydGMgICAg
dHlwZSAgICBwb3NzaWJsZSBjcnRjcyAgcG9zc2libGUgY2xvbmVzDQo+ID4gMzcgICAgICAzNiAg
ICAgIG5vbmUgICAgMHgwMDAwMDAwMSAgICAgIDB4MDAwMDAwMDENCj4gPg0KPiA+IENvbm5lY3Rv
cnM6DQo+ID4gaWQgICAgICBlbmNvZGVyIHN0YXR1cyAgICAgICAgICBuYW1lICAgICAgICAgICAg
c2l6ZSAobW0pICAgICAgIG1vZGVzICAgZW5jb2RlcnMNCj4gPiAzOCAgICAgIDM3ICAgICAgY29u
bmVjdGVkICAgICAgIEhETUktQS0xICAgICAgICA1MjB4MzIwICAgICAgICAgMzAgICAgICAzNw0K
PiA+ICAgbW9kZXM6DQo+ID4gICAgICAgICBpbmRleCBuYW1lIHJlZnJlc2ggKEh6KSBoZGlzcCBo
c3MgaHNlIGh0b3QgdmRpc3AgdnNzIHZzZSB2dG90KQ0KPiA+ICAgIzAgMTkyMHgxMDgwIDU5Ljcy
IDE5MjAgMTk2OCAyMDAwIDIwODAgMTA4MCAxMDgyIDEwODcgMTExMSAxMzgwMDAgZmxhZ3M6IHBo
c3luYywgbnZzeW5jOyB0eXBlOg0KPiBwcmVmZXJyZWQsIGRyaXZlcg0KPiA+ICAgIzEgMTkyMHgx
MDgwIDYwLjAwIDE5MjAgMjAwOCAyMDUyIDIyMDAgMTA4MCAxMDg0IDEwODkgMTEyNSAxNDg1MDAg
ZmxhZ3M6IHBoc3luYywgcHZzeW5jOyB0eXBlOg0KPiBkcml2ZXINCj4gPiAgICMyIDE5MjB4MTA4
MCA1OS45NCAxOTIwIDIwMDggMjA1MiAyMjAwIDEwODAgMTA4NCAxMDg5IDExMjUgMTQ4MzUyIGZs
YWdzOiBwaHN5bmMsIHB2c3luYzsgdHlwZToNCj4gZHJpdmVyDQo+ID4gICAjMyAxOTIweDEwODAg
NTkuOTQgMTkyMCAyMDA4IDIwNTIgMjIwMCAxMDgwIDEwODQgMTA4OSAxMTI1IDE0ODM1MiBmbGFn
czogcGhzeW5jLCBwdnN5bmM7IHR5cGU6DQo+IGRyaXZlcg0KPiA+ICAgIzQgMTI4MHgxMDI0IDc1
LjAyIDEyODAgMTI5NiAxNDQwIDE2ODggMTAyNCAxMDI1IDEwMjggMTA2NiAxMzUwMDAgZmxhZ3M6
IHBoc3luYywgcHZzeW5jOyB0eXBlOg0KPiBkcml2ZXINCj4gPiAgICM1IDEyODB4MTAyNCA2MC4w
MiAxMjgwIDEzMjggMTQ0MCAxNjg4IDEwMjQgMTAyNSAxMDI4IDEwNjYgMTA4MDAwIGZsYWdzOiBw
aHN5bmMsIHB2c3luYzsgdHlwZToNCj4gZHJpdmVyDQo+ID4gICAjNiAxMTUyeDg2NCA3NS4wMCAx
MTUyIDEyMTYgMTM0NCAxNjAwIDg2NCA4NjUgODY4IDkwMCAxMDgwMDAgZmxhZ3M6IHBoc3luYywg
cHZzeW5jOyB0eXBlOiBkcml2ZXINCj4gPiAgICM3IDEyODB4NzIwIDYwLjAwIDEyODAgMTM5MCAx
NDMwIDE2NTAgNzIwIDcyNSA3MzAgNzUwIDc0MjUwIGZsYWdzOiBwaHN5bmMsIHB2c3luYzsgdHlw
ZTogdXNlcmRlZiwNCj4gZHJpdmVyDQo+ID4gICAjOCAxMjgweDcyMCA1OS45NCAxMjgwIDEzOTAg
MTQzMCAxNjUwIDcyMCA3MjUgNzMwIDc1MCA3NDE3NiBmbGFnczogcGhzeW5jLCBwdnN5bmM7IHR5
cGU6IGRyaXZlcg0KPiA+ICAgIzkgMTI4MHg3MjAgNTAuMDAgMTI4MCAxNzIwIDE3NjAgMTk4MCA3
MjAgNzI1IDczMCA3NTAgNzQyNTAgZmxhZ3M6IHBoc3luYywgcHZzeW5jOyB0eXBlOiBkcml2ZXIN
Cj4gPiAgIC4uLg0KPiA+IEFmdGVyIGFwcGx5aW5nIHRoZSBwYXRjaDoNCj4gPiByb290QHNtYXJj
LXJ6ZzJ1bDp+IyBtb2RldGVzdCAtTSByemcybC1kdQ0KPiA+IEVuY29kZXJzOg0KPiA+IGlkICAg
ICAgY3J0YyAgICB0eXBlICAgIHBvc3NpYmxlIGNydGNzICBwb3NzaWJsZSBjbG9uZXMNCj4gPiAz
NyAgICAgIDM2ICAgICAgbm9uZSAgICAweDAwMDAwMDAxICAgICAgMHgwMDAwMDAwMQ0KPiA+DQo+
ID4gQ29ubmVjdG9yczoNCj4gPiBpZCAgICAgIGVuY29kZXIgc3RhdHVzICAgICAgICAgIG5hbWUg
ICAgICAgICAgICBzaXplIChtbSkgICAgICAgbW9kZXMgICBlbmNvZGVycw0KPiA+IDM4ICAgICAg
MzcgICAgICBjb25uZWN0ZWQgICAgICAgSERNSS1BLTEgICAgICAgIDUyMHgzMjAgICAgICAgICAy
MyAgICAgIDM3DQo+ID4gICBtb2RlczoNCj4gPiAgICAgICAgIGluZGV4IG5hbWUgcmVmcmVzaCAo
SHopIGhkaXNwIGhzcyBoc2UgaHRvdCB2ZGlzcCB2c3MgdnNlIHZ0b3QpDQo+ID4gICAjMCAxMjgw
eDcyMCA2MC4wMCAxMjgwIDEzOTAgMTQzMCAxNjUwIDcyMCA3MjUgNzMwIDc1MCA3NDI1MCBmbGFn
czogcGhzeW5jLCBwdnN5bmM7IHR5cGU6IGRyaXZlcg0KPiA+ICAgIzEgMTI4MHg3MjAgNTkuOTQg
MTI4MCAxMzkwIDE0MzAgMTY1MCA3MjAgNzI1IDczMCA3NTAgNzQxNzYgZmxhZ3M6IHBoc3luYywg
cHZzeW5jOyB0eXBlOiBkcml2ZXINCj4gPiAgICMyIDEyODB4NzIwIDUwLjAwIDEyODAgMTcyMCAx
NzYwIDE5ODAgNzIwIDcyNSA3MzAgNzUwIDc0MjUwIGZsYWdzOiBwaHN5bmMsIHB2c3luYzsgdHlw
ZTogZHJpdmVyDQo+ID4gICAjMyAxMjgweDcyMCA1MC4wMCAxMjgwIDE3MjAgMTc2MCAxOTgwIDcy
MCA3MjUgNzMwIDc1MCA3NDI1MCBmbGFnczogcGhzeW5jLCBwdnN5bmM7IHR5cGU6IGRyaXZlcg0K
PiA+ICAgIzQgMTAyNHg3NjggNzUuMDMgMTAyNCAxMDQwIDExMzYgMTMxMiA3NjggNzY5IDc3MiA4
MDAgNzg3NTAgZmxhZ3M6IHBoc3luYywgcHZzeW5jOyB0eXBlOiBkcml2ZXINCj4gPiAgICM1IDEw
MjR4NzY4IDcwLjA3IDEwMjQgMTA0OCAxMTg0IDEzMjggNzY4IDc3MSA3NzcgODA2IDc1MDAwIGZs
YWdzOiBuaHN5bmMsIG52c3luYzsgdHlwZTogZHJpdmVyDQo+ID4gICAjNiAxMDI0eDc2OCA2MC4w
MCAxMDI0IDEwNDggMTE4NCAxMzQ0IDc2OCA3NzEgNzc3IDgwNiA2NTAwMCBmbGFnczogbmhzeW5j
LCBudnN5bmM7IHR5cGU6IGRyaXZlcg0KPiA+ICAgIzcgMTA4MHg2MDcgNTkuOTcgMTA4MCAxMTIw
IDEyMzIgMTM4NCA2MDcgNjA4IDYxMSA2MjkgNTIyMTAgZmxhZ3M6IG5oc3luYywgcHZzeW5jOyB0
eXBlOg0KPiA+ICAgIzggODMyeDYyNCA3NC41NSA4MzIgODY0IDkyOCAxMTUyIDYyNCA2MjUgNjI4
IDY2NyA1NzI4NCBmbGFnczogbmhzeW5jLCBudnN5bmM7IHR5cGU6IGRyaXZlcg0KPiA+ICAgIzkg
ODAweDYwMCA3NS4wMCA4MDAgODE2IDg5NiAxMDU2IDYwMCA2MDEgNjA0IDYyNSA0OTUwMCBmbGFn
czogcGhzeW5jLCBwdnN5bmM7IHR5cGU6IGRyaXZlcg0KPiA+ICAgLi4uDQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X2NydGMuYyB8IDQzDQo+ID4g
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6
ZzJsX2R1X2NydGMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfY3J0Yy5jDQo+ID4gaW5kZXggNmU3YWFjNjIxOWJlLi42NTBhMmU0MGNhZjUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfY3J0Yy5jDQo+
ID4gQEAgLTI0OCw2ICsyNDgsMzIgQEAgc3RhdGljIHZvaWQgcnpnMmxfZHVfY3J0Y19zdG9wKHN0
cnVjdCByemcybF9kdV9jcnRjICpyY3J0YykNCj4gPiAgICogQ1JUQyBGdW5jdGlvbnMNCj4gPiAg
ICovDQo+ID4NCj4gPiArc3RhdGljIGludCByemcybF9kdV9jcnRjX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKSB7DQo+ID4gKyAgICAgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUo
c3RhdGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3J0Yyk7DQo+ID4gKyAgICAgc3RydWN0IHJ6ZzJs
X2R1X2NydGNfc3RhdGUgKnJzdGF0ZSA9IHRvX3J6ZzJsX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7
DQo+ID4gKyAgICAgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOw0KPiA+ICsNCj4gPiArICAg
ICAvKiBTdG9yZSB0aGUgcm91dGVzIGZyb20gdGhlIENSVEMgb3V0cHV0IHRvIHRoZSBEVSBvdXRw
dXRzLiAqLw0KPiA+ICsgICAgIHJzdGF0ZS0+b3V0cHV0cyA9IDA7DQo+ID4gKw0KPiA+ICsgICAg
IGRybV9mb3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2RlciwgY3J0Yy0+ZGV2LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3J0Y19zdGF0ZS0+ZW5jb2Rlcl9tYXNrKSB7DQo+
ID4gKyAgICAgICAgICAgICBzdHJ1Y3QgcnpnMmxfZHVfZW5jb2RlciAqcmVuYzsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAvKiBTa2lwIHRoZSB3cml0ZWJhY2sgZW5jb2Rlci4gKi8NCj4gPiAr
ICAgICAgICAgICAgIGlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RF
Ul9WSVJUVUFMKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICByZW5jID0gdG9fcnpnMmxfZW5jb2RlcihlbmNvZGVyKTsNCj4gPiAr
ICAgICAgICAgICAgIHJzdGF0ZS0+b3V0cHV0cyB8PSBCSVQocmVuYy0+b3V0cHV0KTsNCj4gPiAr
ICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiByc3RhdGUt
Pm91dHB1dHMgaXMgdXNlZCBpbiByemcybF9kdV9zdGFydF9zdG9wKCkgYnV0IGlzIG5ldmVyDQo+
IGluaXRpYWxpemVkLiBJdCBsb29rcyBsaWtlIGFkZGluZyB0aGlzIGZ1bmN0aW9uIGlzIGEgYnVn
IGZpeCBieSBpdHNlbGYsIEknZCBzcGxpdCBpdCB0byBhIHNlcGFyYXRlDQo+IHBhdGNoLg0KDQpC
YXNpY2FsbHkgdGhpcyBpcyBub3QgcmVxdWlyZWQsIGJlY2F1c2Ugb2YgWzFdIGFuZCBhZnRlciBp
bXBsZW1lbnRpbmcgLm1vZGVfdmFsaWQoKSBvZiBkcm1fZW5jb2Rlci4NCg0KWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDI0
MTAwMTExMDE0MS45NDUwNC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KDQo+IA0KPiA+
ICsNCj4gPiAgc3RhdGljIHZvaWQgcnpnMmxfZHVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gPiB7IEBAIC0yOTUsMTAgKzMyMSwy
NyBAQCBzdGF0aWMgdm9pZCByemcybF9kdV9jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QNCj4gPiBk
cm1fY3J0YyAqY3J0YywNCj4gPiAgICAgICByemcybF9kdV92c3BfYXRvbWljX2ZsdXNoKHJjcnRj
KTsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMNCj4gPiArcnpnMmxf
ZHVfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKSB7DQo+ID4g
KyAgICAgc3RydWN0IHJ6ZzJsX2R1X2NydGMgKnJjcnRjID0gdG9fcnpnMmxfY3J0YyhjcnRjKTsN
Cj4gPiArICAgICBzdHJ1Y3QgcnpnMmxfZHVfY3J0Y19zdGF0ZSAqcnN0YXRlID0NCj4gPiArDQo+
ID4gK3RvX3J6ZzJsX2NydGNfc3RhdGUocmNydGMtPmNydGMuc3RhdGUpOw0KPiANCj4gSSdtIG5v
dCBzdXJlIHRoYXQncyB0aGUgcmlnaHQgc3RhdGUuIFdoZW4gLm1vdmVfdmFsaWQoKSBpcyBjYWxs
ZWQgZnJvbSBtb2RlX3ZhbGlkX3BhdGgoKSwgdGhlIHN0YXRlDQo+IHlvdSBuZWVkIGlzIEkgYmVs
aWV2ZSB0aGUgbmV3IHN0YXRlLCBub3QgdGhlIGN1cnJlbnQgc3RhdGUuIFRoZSBpc3N1ZSBpcyB0
aGF0IHlvdSBkb24ndCBoYXZlIGFjY2VzcyB0bw0KPiB0aGUgbmV3IHN0YXRlIGhlcmUuDQo+IA0K
PiBXb3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGltcGxlbWVudCB0aGUgLm1vZGVfdmFsaWQoKSBm
dW5jdGlvbiBvZiBkcm1fZW5jb2RlciA/IFRoZW4geW91IGNvdWxkIGNoZWNrDQo+IHJlbmMtPm91
dHB1dCwgeW91IHdvdWxkbid0IGhhdmUgdG8gZGVhbCB3aXRoIHRoZSBzdGF0ZS4NCg0KQWdyZWVk
LCB3aWxsIGltcGxlbWVudCB0aGUgLm1vZGVfdmFsaWQoKSBmdW5jdGlvbiBvZiBkcm1fZW5jb2Rl
ci4NCg0KQ2hlZXJzLA0KQmlqdSANCg==

