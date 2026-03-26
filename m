Return-Path: <linux-renesas-soc+bounces-30319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGtnMLEAxWkz5gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:47:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B195332991
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C79383018AC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3980F34B426;
	Thu, 26 Mar 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f0+JmkWK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE92347BDB;
	Thu, 26 Mar 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518067; cv=fail; b=llBKIYnNgWdZbRyMaQ6+BhYl5c/3+wDJA6XmyhnZJN2wBPpWe1M/N/9Wyg25njAkfrfGSyuij65a7MXexHRYbBjzLnHsRyFhaSJcWP//V5BMl/Z4hOsW1uo8h6xI/ozfidg4JtWiD+j0iMvNuzcxS8yvwetYt24mhAFhY3W5Tls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518067; c=relaxed/simple;
	bh=WmFHw3yqaKPBXMC3icSB7NRWZR99Es3ZdLaGfZ3jg78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lvKzIh0iEC1fG+/rwLQ1mu50sCO+e5f1K89A7oP3uDKZCig3/IZkdWGWGMVPfyxMGvF7l0jPaEiq5O92yz0a2UsYOTORMi2yy4uQ2xBmS1ZJCErtJz6jDLxqHJANdb72TiBmB7tai7+R/WE1BsMSK147YQez7VYtINQcfTVLcO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f0+JmkWK; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS2v3bQLHaF6V4GQOsletlg5tqAKBNCfYUuguCWIKNIV/tN4B6u4lBvFfJywDkwz6wYKySJcwCB6KfRCAdNUu5AO7T4fHk0Pk/KXVsDJVdxPrDT/H9qIkJv0mmyJC32qUFYx2Wd4j+NQsUMsh+S5fY9dylgf/3tV3ZgSU+IVJihLBIoo71oIiiYkT4L/o/Gr8cUaAMaAeSCkgMFJ81msZbImynEPeaZ1Noj/aVASlmPBGwHmzs92YywSyb/sQ5CNImejlOU1W4Vy5rYObR27ghXlrMgxFoHQBvCQPOazo+LpNPV3VECxYak8Btq0UAkB8Ueg/D+0PgReqnRiRObxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmFHw3yqaKPBXMC3icSB7NRWZR99Es3ZdLaGfZ3jg78=;
 b=zVIiK3Fe6kHSjFOABfETUcxF7fDOevJcnbko+mk2vwk7g+4fr+t4bq6Aez1RlJ7+UCrr3fWR+Xtui/N7/c78/pjq7C2plgYExw7cRfJncFa8eifre5qy0K5Le+G2hq2WxKLzErlhvQ87k92qNWDCaA6ATvSJbLcOL5Jf6BPElMg4R3R71BYFUWWJSrSoj0efOm2baTxNXGtVZfamqmb7HS6cp50oDZBwT14HvqWFtPe8bLbGhsVIchbPe6iO3lxOhPWZ+gHpPVM5bCpJQMaIii1K4oScnnHRktifmIOr1HMh0M8DUIIzf6LcsGKgeG8VHmfxRioyQVfuGrxgJtE/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmFHw3yqaKPBXMC3icSB7NRWZR99Es3ZdLaGfZ3jg78=;
 b=f0+JmkWKrgCDGRwnQA1TmE5W9wraQAAG5mhS/Ui6J472eGohorVeY+vtLMnFWd+r/xk5yvjLjLF0iXDul94reijz1Rq92sO7x0BPHDLE+9SMVlqQyT143+R7NTpUALTV9gUNJ2P8SdSc9AUbccfL2JgmL4n1kesUI6EHsWodDLE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6961.jpnprd01.prod.outlook.com (2603:1096:400:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:40:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 09:40:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
Thread-Topic: [PATCH v2 2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0
 (GBETH0) interface
Thread-Index: AQHclQmM7h71ErUjmECmB8lXVXpwgrXA3BoAgAACxRA=
Date: Thu, 26 Mar 2026 09:40:59 +0000
Message-ID:
 <TY3PR01MB11346B37301FA95115C1DFC8F8656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203123503.314755-1-biju.das.jz@bp.renesas.com>
 <20260203123503.314755-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWS4QuPL31T8TGhs_iK3oG0wkRgtoMXF0n0YVBdBJk-ww@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6961:EE_
x-ms-office365-filtering-correlation-id: 1ad74697-0657-4ab0-a4e5-08de8b1bc966
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QSEiNiyyo0z/bat/qaJcJhTBAaYh03HVM0E1w4qKNpOvAoc6Eh8dJTTytM8K1daxeltZ+6a4f+erq7I3JhEWZBiGGvCj/BZcHvn01S4rRdgN/np3NlJuFYeQ6K3g1f3g4pKaclfSCid9Xgg6v5OG5XAc66VbgebZ9vvMaWMlRrS90dh5hPPsptdWCa2oHeT5udFv8iClhGO7+cIjfNdFOqZTBpOxeYz7SEeD2EsasIwLTYNPPNacjc0MKRUoEPi8sG1jf4dl9jkEA38CusNDjo5Z7wLoYFV2WGBfE4tdre8wKIg+5gmFGyGqg/uKmI1dSRtKxkPzCF2EnIKalvHRa+BHIllERh1n17fgNsNv4DqCW0Lby1cLRZd6553NtRrZG1Fv4wM1hv24NdRl4dC2HrNglk9bG4u/faSx/DBPw535gh/cCSWti/ylOtti9i/9NOoPxg/l78gMHm6gC8vbV4gTXW7sGFfUelrIAzM/9AgjeJcZRyqI8URFPgpRxz/D9t0PxE3Cp6yu2NIz/hbTjmIfXGOL5BkhJh95cQ5uUrsk1GJx5ex/NaSR3roZ7QoWtmxg+U9SJdWFHjfE5XP74MP2x6ovSWmt267oZ5biFGD9J9EXc8vBk42DC3n6vx+ggupGv2EhKp5yObIodcnkYo42VRUD/CNvG86JoMBZFjZKYj1oA0KmQx54HmoCzTBl0asbi1ZB34RaTUY/sS5ZYEFV5ztm8mrqQi43Hdu7hQ8G/AMjE2X6/aYcKZWprcX4HML0aTwqGpl+x9G/U0xmzWgdd8hiC8g55Au9QSXVJD4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUsvR2R0TW5FWksxYzVrdkFQZG5xWnRTVG9xeHNkSlJlYTZXUko0ZkRTdVVw?=
 =?utf-8?B?ZnE2c3l1TjhlMjQyWjNiSWVWeFRmR3YxeTA0MVQyWWFxb1RTN21wa3k3VDFR?=
 =?utf-8?B?UUdDbzBwSlhyanFCR2NScTJYWXh0R01uT0c4c2ZhTHlqdGtWV2VISWNoNXA5?=
 =?utf-8?B?M1NQZCtBbjdEYnZJT3RKR2J0b1A3QUg2a3RqK2FETEV3WmYvZEFaY0lzdnpp?=
 =?utf-8?B?RHEzRHR6ZC9rTXhwSVdXenBxb01mOWcyOGQ1VzFHcVBGdmFBRnB6czZpL3BR?=
 =?utf-8?B?NEQ0YTQxTnlVSFdhZ0gxMVJkQXdJeW4wdHpkQXhqdHNHNGYyd3J2K1Q2eUh6?=
 =?utf-8?B?RmNEMUVrYzlPVWVuSHVYYXVaanVaMXZtcHFlajIzTnJ1Z0lnVUNWaXAyV0pJ?=
 =?utf-8?B?SHlNS1l0czVnWFJxWkhId3FReUxrbFFKMUtSVlJzcmpYZk5CRmZMd2pLbEVw?=
 =?utf-8?B?TWgyaGY1RWFsSGpoSXMvK0ZWQkhZUXNST2czaERnYW8xaUJmYzZCMDB3NTV2?=
 =?utf-8?B?UFJWUVllKzlLTDZDZXBaWXZSRHBiZkFvRC9xeXhmM0tsVEJhVTBkMVllYkt0?=
 =?utf-8?B?Mzh6RWpwQWl4ejArTXZoVG5ZT3JpQ3NscXU3c1czdDlyTW1tdGN6dTc3QnVs?=
 =?utf-8?B?VVRQK050TEk2QVIwQncvRml4Zzl0UjZvdUxhMnFEODZiMnR4UWNkL25xamZa?=
 =?utf-8?B?VElsL3FHQm5CdWkzNWZ0TVYzVGRvNWZIRTFFT0dhTHcvUDhqbFBTOCtQRHlT?=
 =?utf-8?B?VndkbGlMT1B4bC8yYzJCVUtqYTIybDlZNGJiL0Eyd2tFRXpzcERTalRjM3B0?=
 =?utf-8?B?bGI5bi9RbHdzcWx5dVd6ZVJkU1R3KzFGc0NGczNHSENyUEJJTGU3VlRPWWxX?=
 =?utf-8?B?WFQxVzA1TWhQOFBpcFBjaDVud0JJcXV1YU1IS3ZGYXJ6RUhya2tJYTBncVJ6?=
 =?utf-8?B?T1lRNXo0NkJiRm1pYjAwUHlhRlBBU0p0L2ZFTzMrOExZY20vWVZtY1doL2M5?=
 =?utf-8?B?TEliZ0IxbXdxZ09ieFppNHMyT1ZEc3dZQ25UcWJSRlkrbmVQYXNic29BSnc1?=
 =?utf-8?B?Rlh2SDhUZ094bVo2YTRnYXU0ZHdHSzRaTndWVUpYOHZxaU9Ta0xRdUd5UnhD?=
 =?utf-8?B?ZEt3VWVnVTNFVHpYT1FiOTdGNFh3STl6YnRIQmtTb3dQcDlWQUlDeTk2V2J6?=
 =?utf-8?B?TnBzM0tDTVJqc1dxellSOHBPQlhsK1lvczlyK2lBRFpHWUk0alRrRTdCcWor?=
 =?utf-8?B?L3JaQ0tXY2pwRHNnL3c1dmJLMGMzMmRmN3B3RGZJZU9Bd2JJVDVjQzBJc0Qv?=
 =?utf-8?B?MkxkU3F2QkdRRFUyckl1TmV2L2hSVVZVNDBxbWNFN1MxRVZZN3kxOXBCV0pu?=
 =?utf-8?B?VnAvbzczODR2ejdoZkhhZzhBcVVCa2h2NXl4NFR4WCtGTzI2ZGlnak1YTXR4?=
 =?utf-8?B?ZWxIMG40c3JiVERZVjNIYzVISWZScjIrODRodXhoN3FvK1BBUmdwSUVJemVk?=
 =?utf-8?B?R2tBRzR0UDNFRTZnZzlyZnNJZE9KbzlTL2tCQTNQRDRHRXRyTW8xUG51Sy9M?=
 =?utf-8?B?OHVxTU5HSm81YzNSd25yUHpIem52TnllU1k2OU50cWxtZ05UMTFBakVyRVdP?=
 =?utf-8?B?QWY4Y3dSeFFrYWMzWkJWTG8wdk1sS1Q1R1g1K0tucVhTOEVSaElpaXJ5WmRl?=
 =?utf-8?B?MzZqMWNRZ3dOODFNWE1RYlQ3WmhxWWdKK2ZLUGFDSnhqcG4rSUlSOWpsaW51?=
 =?utf-8?B?VGNQMzBhM2hnSithNFkzWXdUeGtwbDV4WGkzUFhXbjlIMmt2bHZFbE82Q0tu?=
 =?utf-8?B?dEtWTWRmU1I3Rmk1VHJOVTRpL2NCRkN4SFRpSjFyMGEyWXcvNi81UWpUd3hG?=
 =?utf-8?B?M1Q2eW5lUEVXRzdCUktBWThNTWZrV0JKOFVuWmJrbU1pSUwzNG5vd0pQMElY?=
 =?utf-8?B?QjNmcGc3RExXRkcxbmI2OVZtTHRHSXYrZnhiWXRtdVljem8vazF4ZmEvNWxy?=
 =?utf-8?B?VGRqQ2c2M1JZdHhEZmFxR1IxYWlGUHozZFQvaE1qdDdpWDJ5QlNNaENKV05j?=
 =?utf-8?B?cTRJTi9RdUUxMzh4bUU0M0doM25PZjY5QTBoS1ZkQUVlcHF6L1JZeC81cE9w?=
 =?utf-8?B?Mll5U0ovMVRoNlNsVnM0WVZZMWx1MmVxYkZsWjcvMDlrVVRKWDhpNFpKdlVi?=
 =?utf-8?B?V3JzV0t3NkU5UjdGRVlTR1lRbVBmZldhNk5UV0Nacy84R0s2cVgxQTVrZ1F1?=
 =?utf-8?B?bjBaOWp5TG9xVEZrSlZRNmVyMXVPYzNlblVaWlFLMS9hVDJmRnFZQWQ3UUtq?=
 =?utf-8?B?cGYvRFJpY3Uyb0VZQS8xQ3BSWGpRZHhtNVhYVGxSOFFpbU4zWExMdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad74697-0657-4ab0-a4e5-08de8b1bc966
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 09:40:59.1921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbAZdcbE8+Toa4C0uKLXuI+MbBz0cvzXE4wzw33d8SzTLvPIaGl0nxOeePMlmQZDyAc3BJ43wD9LW/ZImZwk+OdaZDTIlxZPDS5n2QimT7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6961
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-30319-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.7:email]
X-Rspamd-Queue-Id: 6B195332991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI2IE1hcmNoIDIwMjYgMDk6MzANCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNsLXNtYXJjLXNvbTogRW5hYmxlIGV0
aDAgKEdCRVRIMCkgaW50ZXJmYWNlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAzIEZl
YiAyMDI2IGF0IDEzOjM1LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+
IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEVu
YWJsZSB0aGUgR2lnYWJpdCBFdGhlcm5ldCBJbnRlcmZhY2VzIChHQkVUSDApIHBvcHVsYXRlZCBv
biB0aGUNCj4gPiBSWi9HM0wgU01BUkMgRVZLLiBUaGUgZXRoMSwgcGluY29udHJvbCBkZWZpbml0
aW9ucyBhbmQgaG90cGx1ZyBzdXBwb3J0DQo+ID4gd2lsbCBiZSBhZGRlZCBsYXRlci4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNvbS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNvbS5kdHNpDQo+IA0KPiA+ICAmZXh0YWxf
Y2xrIHsNCj4gPiAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47DQo+ID4gIH07
DQo+ID4gKw0KPiA+ICsmbWRpbzAgew0KPiA+ICsgICAgICAgcGh5MDogZXRoZXJuZXQtcGh5QDcg
ew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMjIu
MTY0MCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZXRoZXJuZXQtcGh5LWll
ZWU4MDIuMy1jMjIiOw0KPiANCj4gRHJvcCB0aGUgbGF0dGVyPw0KDQpBZ3JlZWQuDQoNCj4gDQo+
ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDw3PjsNCj4gPiArICAgICAgICAgICAgICAgcnhjLXNr
ZXctcHNlYyA9IDwxNDAwPjsNCj4gPiArICAgICAgICAgICAgICAgdHhjLXNrZXctcHNlYyA9IDwx
NDAwPjsNCj4gPiArICAgICAgICAgICAgICAgcnhkdi1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAg
ICAgICAgICAgICAgIHR4ZHYtc2tldy1wc2VjID0gPDA+Ow0KPiANCj4gdHhlbi1za2V3LXBzZWM/
DQoNCk9LLCB3aWxsIGZpeCB0aGlzIGluIFYzLg0KDQpUaGFua3MsDQpCaWp1DQoNCg==

