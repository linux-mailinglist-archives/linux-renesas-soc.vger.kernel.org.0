Return-Path: <linux-renesas-soc+bounces-13754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C07A47ACB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 11:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9918A16421F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B5D22A4C6;
	Thu, 27 Feb 2025 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gFuqZQ95"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5D229B3D;
	Thu, 27 Feb 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653329; cv=fail; b=BpzAxuVQfiiz3QQL08cQJR2CNfQqjCx1ZwHlJNDHhE8MtJfBiNn5P9yiIRzHxib3V148ULNmuJcXiLWT8AUtx/ibFgeco4ATgnDc2yV/Pxn1UdkfjDBeWLCvFq3UOE5SbODNWzEHXLvzUPivxqzOBeWy0YHkPpROQ7G+X29k2hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653329; c=relaxed/simple;
	bh=6SioxVhZ3dokGFo70w49iSu7YEjgXjRZzdmR2MKuGAU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RPcelLyR9Jan7Tvw1eytVvYVgrTQLgknoc/SbhQYy1/JB63PZOXfK3VjQDTpopDYWLWNbum4+R0TB25PkJUIll113Mu8ejntoEkotvkASM7Xs68tDSZD3Cb21Qyam/wBp5VxWVpRoV1dJd/rDu/Oie7EZtcRCF1gNElwrOafPZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gFuqZQ95; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqjpa75Hl49kZhgbjJtRm8DsipxaS5XIqjWhxaOk99jNsI6CXyvorliwfQhpTmt7HtALqR7rdau3O2SCDjIJ/bRzmtnvrDMUnT88NgLmx6a1tOfkhHMGV09JzNrDmR0nuePUStrV+QK6hg8hMLnWQxUe7ASliCypilwZZCbZBL12TqWoqy1EDCZco7Gkd2xt+3KvMoFLNjDsCQue3N2M6T45NTX+P5mcXJZ+vNluUd+Zbbo4g1mTaGeV7SQuOlJ1RBynceOjkZeqKwuNxkSG/HWg6jZwACjj0xRktvuiGK9q9T0U/Ce+BpQXGKyXxdtjM6b+JKWmCVLC8jNZ1L7NhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SioxVhZ3dokGFo70w49iSu7YEjgXjRZzdmR2MKuGAU=;
 b=F5USU70Xdzaj1SS5gzT6LMZI08+GC6Ksa2JiRFOzGnUurn6fjMX2wTHQYX+imDVZJz2Av6KmZ69h0hi78QSXUwF60/u7+6JrKJAOiEgHkcgbECURnR8LPsrZebp3AP07mDtgoqsoNGEuDXHUlpgn13Xykd5+W/tPi80F6wbHUkHNIZ+uo+sk2xGVRJq1eHlwMn2wt83AEgEKFKDBqBUSvLS0mdSoYUOt9mQ3tbjUTUwF3U6UNnQEKSgG8o2TVwF/Nx0fG5Ig3Y7MfsJmIIoZ3E1SxBpo4NcFm7DWpncrEJ7aRzhRtY/vJbLP1aRvP0R0RNQAgySvkmC78Lv1dI7brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SioxVhZ3dokGFo70w49iSu7YEjgXjRZzdmR2MKuGAU=;
 b=gFuqZQ95uyot5dgmm+/JVe6UmG1UOLMA9QaHWxY4YP4s4U16vnpHInGZOAn5onen/dHAkoX31YGWKx7tL8VNAGFdam3sUkbvET7/zLkjy9Inxf7IWJNJRBs7DIkzbfer8SxPWaRwtMKax/ZgMOk3bXS4dHnfjTgIWmOKL408owY=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OSCPR01MB12706.jpnprd01.prod.outlook.com (2603:1096:604:338::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 10:48:43 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 10:48:43 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Topic: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Index:
 AQHbiE/a4G/Z4/2QWkiecfuwWl+1JrNZow+AgAAA7rCAAAP8AIABOh+AgAAFSwCAAAtxUA==
Date: Thu, 27 Feb 2025 10:48:43 +0000
Message-ID:
 <TYCPR01MB11492DBCAD461B83B3CBE75E68ACD2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
 <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
 <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
 <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org>
In-Reply-To: <4f737623-6083-4ef9-b7a3-d09ebafa92de@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OSCPR01MB12706:EE_
x-ms-office365-filtering-correlation-id: 84930455-328f-45f0-c854-08dd571c4dcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?amh1UzVEajJIWUU2ektnNUJrVC9lcytiUXU3Ky8veXhDdjFpNk9zdXZOeUE2?=
 =?utf-8?B?NjB1cnFBYmRLL1JsT2xURlVVL3hQL3liSDlLQlhRUGVFYXRZRDJVZmo4cjdn?=
 =?utf-8?B?VzI3MER4akp3RHdNMkNqRXlUVjg3ZUtxVTNJZ1FOMTgwbmc5Z0NvUTFzVHpS?=
 =?utf-8?B?UHRMcStzbFE1WE12UWFIQzdjYW50TEFyZTZQY2FsV29RVW1PMnJ4OWZva0hn?=
 =?utf-8?B?eWVtOWYrRHNQYmZ4SEpxN2NXYnpRYmVSTkNzNGpiN0dNSStHMlgycDN4VUJi?=
 =?utf-8?B?Tm9RNEt3c0FucXBlQnF4YnZvTHVvYTVJR1hQaHFrVUFzQkpTZ21LOHljK3h0?=
 =?utf-8?B?SHlvWDlZK2hZaFIxQTRiQ0U1NjZUSWgySUxZWlhhV3gxWi9NM2VQZEY2RWVR?=
 =?utf-8?B?dE1OSklERlBaRmFyNUdNTFJsZjdvZjlVWDJPRXFlVDRZdE5kRnNYVlQ0V3cy?=
 =?utf-8?B?K2dsU0JqeVpkbHhMSktNN0ZqV2lmSTczb0dHR1FhK3RnNXhhSVlnMlp5L0dF?=
 =?utf-8?B?R1VEZi84WDZiK2R2UlI5bWV3QlVaSXh2b2JIUWlLay9lMENXV0RuU3Nlc1Jr?=
 =?utf-8?B?cUdPTG1EeGVDRjh1OVRZRHZYSVhIUWwwci9kaXBGM0dIRGc3NmI1VitFRTZP?=
 =?utf-8?B?cXphZVdHTGdUeHk0Sm5hQTBCK1pkdFpTWlg0dXdjVHZjU1FGTndlMWd1NnY1?=
 =?utf-8?B?VEg1RWpnUjVEcFBiMC9HL3pqbkhQcHd3OUtObWFKYm92UEJRcUZjTTh5RTV0?=
 =?utf-8?B?K1cwZzlrbGRsczNXaURDbG9kOVNmdGFUWHZOWWZaNEdVVW9kdkV6aFk2eUhh?=
 =?utf-8?B?RGhBa3hVa0RHY2ROMGl4c1JheTU0YnhUeWRxSTFmc3FNRW1Hbi9OVTYrbTRK?=
 =?utf-8?B?ZWJBelkyWG14R0ZSOGU3VE12b3gxY0ZpUU9xUkppV0I3VFUyQ1ZPclQwbFI0?=
 =?utf-8?B?dS9RVE96TnF3SnQyMWVmaHFsVzloenZZaVFlYnV6a2JBc0h4cjdlQURmOTl2?=
 =?utf-8?B?SFpTVWJlNldIQWd1OTVkbzFySTdEZTh3OVBVZVZhdmxpY1NaSXNSa2VPMDRi?=
 =?utf-8?B?dU92ZFoybmp1RG5qendDOWFKakZKNUUreW50c1JpRjNtNzFPOXdmcWw3R3BW?=
 =?utf-8?B?VEU1d0lPeVA0WmJFZFV1Z2VzNDQ4ZmhmVVM3ZWhuUWxXa2xNeStqSjNoRFBC?=
 =?utf-8?B?TFhGZjFGZjdkV1l1Wm1KRHFKeEU1alZyQ1JGWFFvMkFmUFpUYjNxT3RKdkxq?=
 =?utf-8?B?SHZXMEdJeTcvRXFueXBHOURPYVR4K2tvU2lqNy9OeFlwK2pKZzJ6emY4OFRq?=
 =?utf-8?B?SnBTdDNNWjF3MHZVQnN0U2xEdjgxVmZIWU94c2pIVlZBdXRPeXJobEtnRlVo?=
 =?utf-8?B?a1Jlci9COFpYbHk2WEJaMmdNVWluYS95UmtER2N3dDhkQTVYTWRoM1lBMlA4?=
 =?utf-8?B?YVhKMWl4ZWdLVzlZVU4zdVQzWno2WHFQYm92UEdyMjFTdThJV3lZWlAwd0l2?=
 =?utf-8?B?TGM1M3Bjclk4RnoyNVNsbzM3WnpoalIxc0YxMnYrTUNjVzNwaWdFTUIyWlRa?=
 =?utf-8?B?Y1pIZk41TUtyeHhVWkxLWGN3TndlTGlUV1V2T05CVjNxcm45L3p0MncwM1NQ?=
 =?utf-8?B?VisvZGNjM0lDMGNzZ0xId1VyaSttQTZmbkRhZEdrNlpaeUdtRE4zbDIrWXlT?=
 =?utf-8?B?UDEvcU9QNHlReTdNb1dOZjFscEFHcWxhcW1LMWZNZmMzNTR1bnBjSHpLYk5G?=
 =?utf-8?B?MkIzWmNVUXVPaUlhaGlRcG45bzFrODY1T1ZveUtySmNRVDMySDFzcVVtb1Ja?=
 =?utf-8?B?OER2SU12UTZFaW90RDlMRWd6ZzNoVnU0RzFjYjF2c2R3aUNXUEl1U1ZYdTNT?=
 =?utf-8?B?QjZZNnEyb0RoQlo0Rm9mMUZaMnZUVm5NS1ZERVZzenZJdXhGUkNJMnZjZnJ1?=
 =?utf-8?Q?7/oRaMOTjDj0hyf2pIb3udQzPwWI0qxi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blAxcUZ3NUM5QWNwR1BrelovamJ5dVBHSXFPVEpOTEpMT0pmSzY5MTFhQWdp?=
 =?utf-8?B?SUoza29RSVpvelRsUGdyRFVUQnNpVmZkY0Nub3dxT3VZU2JEVUJsY1JHNkJ2?=
 =?utf-8?B?RFZUU29ySjkxR1AwQnJhZitiTnhsM0VPM3VpaGQ3cWhHdFhEZUJEeFhYMnhw?=
 =?utf-8?B?WFh5SExVMlljRDZ3OHdTRHhIK3ZqQ1k0WkY2RVBSS1ZkU3VFa2pxc3JuVkEz?=
 =?utf-8?B?ZlVxNEZlVE81blkvdVVpZE1zc1BmR0FtdmY4S2pEc0NjUlk0YVN3YlNJVmUz?=
 =?utf-8?B?TUUxYldrL0g5cWVUZ2hhK0hEUmx4QzE5T1VJZW1KaDBYUTRSUytMaDA4YTlW?=
 =?utf-8?B?cHlNN2pjZVdFbDVQclM4NldiczJTekt0b3kvTWMrVkZEanVDZ3pmSmFLY21V?=
 =?utf-8?B?Tkt6TkIvclkvc0QyN3pla2VPblZhMEQ5WHVQZGRUZnNKbktEM3FqVkNxeGps?=
 =?utf-8?B?ZkQ3QXJHTWtRMnE3RE9SRVFZZEFMV3hKSWFQeURrVUlHeStIZDlzcVRUZmRQ?=
 =?utf-8?B?UXZqdWlHaGlVVCtaNTdEMTh1bGtqMmNLNW1DbTdtaGlOcG9uRC9oNGdUWjBh?=
 =?utf-8?B?aUVuTGdxZDVxVGlnSUJtNldVd1htQlhUeGs1bCtzdVF2MmRrbWY1a0NaK0NL?=
 =?utf-8?B?QUxHYTE1QlFJWUFDaEVCdkROZjU3VkhLdnN2YWpvbG00WWRNRnhtVjRsb1Vs?=
 =?utf-8?B?RUlnU0ZpcnoxcEZYWGxRVlRZdE8rdko2aHc5aDA4WDNMVGZudkxCOElnWDRY?=
 =?utf-8?B?TDZPL0ZHWk5ERFJjenFSakJhM3dNRXQ4TG1QWlJLV2htWi94VWc5aHd3UnQw?=
 =?utf-8?B?d3JZMXBSaFArbVY3WHYrOFYxSjlveUk0Q25RUU9xd1k3SC9sbmRneVozRGZ1?=
 =?utf-8?B?d01KeC9GRVNxamtlRGZRVXMySGlEY0U2THlncnlUQ2hXNHZUemtxZ1Uxc3d4?=
 =?utf-8?B?eHN0UldMb09vZ0J2NnN0N1hXTS8vVWg2WHdvdmNLeEZIZlVBNW1idWdJMDZk?=
 =?utf-8?B?ZTVwTWphcFY0cng1WCtrTDUzaFJibWxjK3VkUmVmQjgzYXRkUWlrSXFsbVF2?=
 =?utf-8?B?OTNoQnhCY0x2bno0dGZaUmJvYWVXR0pCTzg1NTNiRy80WndIampXd0hBa3N3?=
 =?utf-8?B?S0MvcG8ybXFWK1VqaVNqUHhRSGVzT3JOejNPUGQxNmoxMjd5eUR6UEJLZHN4?=
 =?utf-8?B?bHlackg0d3hhbXhJNUpVZ2NnbE15RFRlRjhkbzRUZ2RNOXFMVUZBT0RmNG0v?=
 =?utf-8?B?NTlBRjRmTFYzd21KN1VienBCSm5IOFdxUk5IVzlodXg5TUx6REUwbytwSlRG?=
 =?utf-8?B?Q21uOXZVd01TaUM3RjBRckdINWEwZkpHNmZqYVBWSzQrR0p3TG13eTRHTmdS?=
 =?utf-8?B?OEVLc09vVVdSeXZLZjBVQ1lDZmtnb3UwSFQvYkxsRTFxbWJPY2ZBV0JFdXpy?=
 =?utf-8?B?cDNUcDM4Rm9wcVp1bzl1NlhsSjRoTHpaVFVkSm9zTDJjcG1TbjRXQ0JBWDUr?=
 =?utf-8?B?OXpJNGczNVdKdHpHbjVONEh3VzMvVFhxSU9kNWVJVkhxRXdyRVZubzYyS29n?=
 =?utf-8?B?WnpxS0JyWEc4Yk9mNkZtRWFNZDJCQzBzNk13TWFPUnZsdjlKMzJvYk9GTGJt?=
 =?utf-8?B?WG1BZGl1cll4ZEpCVDVTYVNwanQxVlE5bzdHM09HaTkzMEgvTjZnSjNZUC9o?=
 =?utf-8?B?akFrZ3RsVmFuRXcxQlhpUWgvenlMTk82YzFkc1gxTy9Wb083TnlwckEzeGpq?=
 =?utf-8?B?cytOQVFBREJQSWViWVd4ZmhZdkpiVk5SWjBSNUErd0lKYWUyaDRSeXBWWi82?=
 =?utf-8?B?a2JvRmkxS0pDaGdPZFZjUDRvUE1lVVNNQ1kvbVh4TUJRRGprWnRNTXQ3V2Fp?=
 =?utf-8?B?ZytNaml5WVlHc3V0aFVtRFlWVzhDN0lRRW5JQW9odnFRckJ1UllYZHVzNFlN?=
 =?utf-8?B?Z1ZFQ0NVZWF5NkcrZ0tJL01DbnZPNG9za2RrM0wrc0tQRmZiNU9IUERsRW45?=
 =?utf-8?B?Tm9vWWVtdGdUdE53cjM3Snc3a3VrR2dVcmN3eG9Ham5haGl5UFJQbnZodWw0?=
 =?utf-8?B?aHpDSzlFc2d1eFlCcEVaQWU0T3B1QU1BandkQWhuaC9kdzd1TVdoTUl4eHUy?=
 =?utf-8?B?NDJ4YllkQjJseUxkN2JkT0I2NzhvcndEZmpGNEp3L3JRcW1CbzdjUGJEN1Ru?=
 =?utf-8?B?bWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84930455-328f-45f0-c854-08dd571c4dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 10:48:43.2122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFNDxL+WUeUzZWI1LFS0eWL2G1oB2eET0ZE+pcawY5ZJPw0w7q8X5X+qRN7dRFw7vbKJhvN4WPk81qQL3ifnxLm+NAKOz8J1Kgbo+9nIuzyFwWhFwPj7k9Jmu0c109kt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12706

VGhhbmtzIEtyenlzenRvZiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IGpldWRpIDI3
IGbDqXZyaWVyIDIwMjUgMTA6NDMNCj4gVG86IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+DQo+IENjOiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAu
cmVuZXNhcy5jb20+Ow0KPiB0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcjsgbGludXgtcmVuZXNh
cy1zb2NAdmdlci5rZXJuZWwub3JnOyBQYXVsIEJhcmtlcg0KPiA8cGF1bC5iYXJrZXIuY3RAYnAu
cmVuZXNhcy5jb20+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxMy8x
M10gYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIFJlbmVzYXMgUlovVDJIIFNvQw0KPiBvcHRpb24N
Cj4gDQo+IE9uIDI3LzAyLzIwMjUgMTA6MjQsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4g
PiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPiBPbiBXZWQsIDI2IEZlYiAyMDI1IGF0IDE1OjQwLCBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+PiBPbiAy
Ni8wMi8yMDI1IDE1OjMyLCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4NCj4gPj4+PiBTZW50OiBtZXJjcmVkaSAyNiBmw6l2cmllciAyMDI1IDE1OjIy
DQo+ID4+Pj4gVG86IFRoaWVycnkgQnVsdGVsIDx0aGllcnJ5LmJ1bHRlbC55aEBicC5yZW5lc2Fz
LmNvbT47DQo+ID4+Pj4gdGhpZXJyeS5idWx0ZWxAbGluYXRzZWEuZnINCj4gPj4+PiBDYzogbGlu
dXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBnZWVydEBsaW51eC1tNjhrLm9yZzsgUGF1
bA0KPiA+Pj4+IEJhcmtlciA8cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNhcy5jb20+Ow0KPiA+Pj4+
IGxpbnV4LWFybS0+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEzLzEzXSBhcm02NDog
ZGVmY29uZmlnOiBFbmFibGUgUmVuZXNhcw0KPiA+Pj4+IFJaL1QySCBTb0Mgb3B0aW9uDQo+ID4+
Pj4NCj4gPj4+PiBPbiAyNi8wMi8yMDI1IDE0OjA5LCBUaGllcnJ5IEJ1bHRlbCB3cm90ZToNCj4g
Pj4+Pj4gU2VsZWN0cyBzdXBwb3J0IGZvciBSWi9UMkggKGFrYSByOWEwOWcwNzcpLCBhbmQgU0NJ
IChzZXJpYWwpDQo+ID4+Pj4+IHNwZWNpZmljIGNvZGUgZm9yIGl0Lg0KPiA+Pj4+Pg0KPiA+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVu
ZXNhcy5jb20+DQo+ID4+Pj4+IFJldmlld2VkLWJ5OiBQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXIu
Y3RAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+DQo+ID4+Pj4gWW91IG5ldmVy
IHJlc3BvbmRlZCB0byBteSBjb21tZW50cyBhdCB2MS4gU28gSSBhc2tlZCBhdCB2Mi4gU3RpbGwg
bm8NCj4gYW5zd2VyLg0KPiA+Pj4+DQo+ID4+Pj4gVGhhdCdzIHYzIGFuZCBzdGlsbCBzaWxlbmNl
IGZyb20geW91ciBzaWRlLg0KPiA+Pj4NCj4gPj4+IFllcywgSSB1bmRlcnN0YW5kIHlvdXIgcG9z
aXRpb24gYW5kIGhhdmUgYWRkZWQgYSBwYXJhZ3JhcGggYXQgdGhlDQo+ID4+PiBlbmQgb2YgdGhl
IGNvdmVyIGxldHRlciBhYm91dCB0aGlzIHBvaW50Lg0KPiA+Pg0KPiA+PiBXZSBkbyBubyByZWFk
IGNvdmVyIGxldHRlcnMsIHVubGVzcyBsb29rIGZvciBkZXBlbmRlbmNpZXMsIHNvIGlmIHlvdQ0K
PiA+PiBkaXNhZ3JlZSB3aXRoIHNvbWVvbmUgeW91IG91Z2h0IHRvIHJlc3BvbmQgdG8gdGhlIGVt
YWlsIGRpcmVjdGx5LiBOb3QNCj4gPj4gc2lsZW50bHkgZGlzY2FyZC4NCj4gPj4NCj4gPj4gWW91
IGtlZXAgYWRkaW5nIG1vcmUgYW5kIG1vcmUgc3ltYm9scywgc28geW91ciAib3V0IG9mIHNjb3Bl
IG9mIHRoaXMNCj4gPj4gcGF0Y2hzZXQiIGlzIG5vIHRydWUuIE90aGVyd2lzZSBldmVyeSBjb250
cmlidXRvciB3aWxsIHVzZSBleGFjdGx5DQo+ID4+IHRoZSBzYW1lIGFyZ3VtZW50cyAtICJub3Qg
bXkgcHJvYmxlbSIuDQo+ID4+DQo+ID4+IFNvIGFnYWluIE5BSyBiZWNhdXNlIGl0IGlzIHNvbWV0
aGluZyBvdWdodCB0byBiZSBmaW5hbGx5IGZpeGVkIChhbmQNCj4gPj4gaXMgbm90IGV2ZW4gdHJp
Y2t5IHRvLCBzbyBJIGRvbid0IGFzayBmb3IgaW1wb3NzaWJsZSkuDQo+ID4NCj4gPiBBZGRpbmcg
UkFNIHRvIGV4aXN0aW5nIHN5c3RlbXMgaXMgdXN1YWxseSBxdWl0ZSBoYXJkIDstKQ0KPiA+DQo+
ID4gTm90IGFsbCBSZW5lc2FzIFNvQ3MgYXJlIHVzZWQgaW4gc3lzdGVtcyB3aXRoIG11bHRpLUdp
QnMgb2YgUkFNLCBzbw0KPiA+IElNSE8gaXQgaXMgc3RpbGwgdmFsdWFibGUgdG8gaGF2ZSBmaW5l
IGNvbnRyb2wgb3ZlciB3aGljaCBTb0NzIGFyZQ0KPiA+IHN1cHBvcnRlZCBieSB5b3VyIGtlcm5l
bCAoYW5kIGUuZy4gd2hpY2ggbGFyZ2UgcGluIGNvbnRyb2wgdGFibGVzIGFyZQ0KPiA+IGluY2x1
ZGVkIGluIHlvdXIga2VybmVsIGltYWdlKS4NCj4gDQo+IA0KPiBUaGlzIGlzIGZpbmUsIEkgYW0g
bm90IGFnYWluc3QgZmluZS1ncmFpbmVkIFNvQy1lbmFibGUgb3B0aW9ucy4gSG93ZXZlcg0KPiBh
bGwgeW91ciBTb0NzIHNob3VsZCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQgKGRlZmF1bHQgeSBpZiBB
UkNIX1JFTkVTQVMgb3INCj4gYW55IG90aGVyIG9wdGlvbiB3aGljaCB3b3JrcyBmb3IgeW91KSB0
aHVzIHlvdSB3b24ndCBiZSBncm93aW5nIHVzZXItDQo+IHNlbGVjdGFibGUgY2hvaWNlcy4NCj4g
DQo+IFN0cmljdGx5IHNwZWFraW5nIHRoaXMgc3RpbGwgd2lsbCBiZSBjaG9pY2UsIGJlY2F1c2Ug
eW91IG5lZWQgdG8gdHJpbQ0KPiBjb25maWcsIGJ1dCBhbGwgcGVvcGxlIGFuZCBhbGwgZGlzdHJv
cyB3aWxsIGp1c3QgaWdub3JlIGl0ICBhbmQgZG9uJ3Qgc2VlDQo+IGl0IGluIGRlZmNvbmZpZy4N
Cj4gDQoNCkkgdW5kZXJzdGFuZC4NCg0KQWxsIHRoZSBBUkNIX1hYWCBTb0Mgb3B0aW9ucyBhcmUg
YWxyZWFkeSB1bmRlciBhIG1lbnVjb25maWcgc2VjdGlvbiwgd2hpY2gNCmlzIGRlZmF1bHRlZCB0
byAneScgaWYgQVJDSF9SRU5FU0FTLg0KDQpTbyBJIGd1ZXNzIHRoYXQgdGhpcyBzaW1wbGUgYWRk
aXRpb25hbCBjaGFuZ2Ugd291bGQgbWFrZSBpdDoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L3JlbmVzYXMvS2NvbmZpZyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KaW5kZXggOTFh
ODE1ZTBhNTIyLi4yMzE4ODBjMjFhYTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2Fz
L0tjb25maWcNCisrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KQEAgLTM1OCw2ICsz
NTgsNyBAQCBjb25maWcgQVJDSF9SOUEwOUcwNTcNCiANCiBjb25maWcgQVJDSF9SOUEwOUcwNzcN
CiAgICAgICAgYm9vbCAiQVJNNjQgUGxhdGZvcm0gc3VwcG9ydCBmb3IgUlovVDJIIg0KKyAgICAg
ICBkZWZhdWx0IHkNCiAgICAgICAgaGVscA0KICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0
IGZvciB0aGUgUmVuZXNhcyBSWi9UMkggU29DIHZhcmlhbnRzLg0KDQpSZWdhcmRzDQpUaGllcnJ5
DQoNCj4gPg0KPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gPg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQo=

