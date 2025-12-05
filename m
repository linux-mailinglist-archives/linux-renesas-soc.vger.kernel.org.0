Return-Path: <linux-renesas-soc+bounces-25593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0154CA6C58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 09:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3ACC1303127D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 08:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F4B2F5A18;
	Fri,  5 Dec 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XyV/ivYJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C9F3148B9;
	Fri,  5 Dec 2025 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764924843; cv=fail; b=nhcbRZrQR2wcahsmAucpgiIg/wNWUGvU3sg5k5fRryLLUG+qTmOhzi4+R3tJiSoVOTkpBLpUcs9Itzn6qOmspWSQQg+V1XF8/CivVX1CA6Vr2It7lAIrgt1JAr7w84GU0g8eymVuqSwfsVxFsj8zP8M0OUYPwslnfThhgLIYEIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764924843; c=relaxed/simple;
	bh=qOooQ27w5y4wp0NWEbcDv6wFMTa6e8DcnVNM95375Jw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FLFNnD1++O6zARnKdqlopzwToM8e977ro/6axDyJo+tHf1ggicr8SLZZDpFOqsgaMCsnXSrMU23vgl3pG7dUyEI9lzBgnl5KjRk0Iiny3TPDkiw1ZU/On+OxsQgvX35qfEBrsGNbH+3AsrY/IWGo2ShLMf7ICK7PhVN1nW/H9nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XyV/ivYJ; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWsFuUhkXGIvf3o4RcFnMpoNoYckbTuRFkEhy9Or1CCk06M1pEXEEREbdxZnIMM+nUWBbJI/sLjCzRKtIpWncI1rVRZ23YZztm+k8N6serRAFSX9ZaM8Gxr0jj6d1PCC0t95A70EAa5luvubkZjB5zZPJ9Vg7Sj6fpQsciHLt5VmJ94tuug4HG+gHmhSIIBSMjzfhGwPmn9I7QVoPlPKWOjt0KoSkRLPun6+aBhBIZPORPeVEJJIO2tP1RbACnofuNbtDCU3Gr9YfqcWYKJguXGIr+7MHjOUKDqUgrujssGhuf8iblI1Soe71sQfJGXVPphpV5Lqqr57XdYBxMM/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOooQ27w5y4wp0NWEbcDv6wFMTa6e8DcnVNM95375Jw=;
 b=s+tPetS2VdNZe9+3HAJU2foQQ+F49HNx0kuAoE0RgPNhxh52EJX6l6JbimSnrx19DYgpLMc6ZKSCBQ8Y/jve+6LZZeqiJYNmVzZyeP8azC8czElnMRFQkfp4UnL70XKZzRH4JNyK502z89WPvJf/PfwlT7dZKOnBFsipBM9sdXjwogpZfWDSAF7DmQw/+GzVWGJYToKFDg79f6vdz/EWSlCxOvtmfVJ9A5hG1JqIArY+WsqPptqUP9MV6RUwccybYUjZ0MMVomyVrMSuHsuoVlcaOXHZ0dcmrABueAagyJ8Ia70sLpDWX1aZUx9c9ezf1vMo+dWNBnyrlcBvzFe3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOooQ27w5y4wp0NWEbcDv6wFMTa6e8DcnVNM95375Jw=;
 b=XyV/ivYJkLoNq3Ugfx8sRRWkwvT6RG10wKeU9RA+X2ENdkL3qvG2ZyGNXA7WrFF/hSMT7YruLrVZo41+0Rfdm51nQTYv1noqH8C+APCXKd8TIPjMUmqMYFWnZZuhwrxAL3njXbZuqdkoWk8G8oUNpQqE2l8o4aUkUNvugjpc6qQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16889.jpnprd01.prod.outlook.com (2603:1096:604:40a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 08:53:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 08:53:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index: AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfA=
Date: Fri, 5 Dec 2025 08:53:51 +0000
Message-ID:
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
In-Reply-To: <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16889:EE_
x-ms-office365-filtering-correlation-id: f9a37699-bce5-408d-e287-08de33dbd009
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VG5yM1pxUG1SREx0OG5Md0xYbFExNDBBSjdyQ1Q5YjVlb0xVYTQ4K0VqbWpU?=
 =?utf-8?B?cENXdjRuejQweVpvZ1FpVDdEbDNCc0NBd0hXUXJWandLdWdHaklPdkJTM2la?=
 =?utf-8?B?MHpIb3EwYlc3Nk12TDNPbWNPTkJ2cDhJbmtEWDdCSGJjY1lHU1lMY3AxaDFV?=
 =?utf-8?B?UDQ4ZzRlWnA4RjFBeW1WREphd2hKaDlqeWQyck85Y3dpNjh1NTV0R3NsT3Bh?=
 =?utf-8?B?a0xkMXV6VnNpQnhITTN4ZXF4ZEh2cDBGV2I2NkVOVDh3bXZBNmM5Rld3SEZH?=
 =?utf-8?B?UDhkVnN2ZmRYL3orNnpGc0VmQ1hQV3pLUXVORkxuZDExRUZUWEprY05TNUpJ?=
 =?utf-8?B?M2lKZHpXN1ZjNXBaaU1oRE5vajM2NWU1MWk3cXBkck5xc2p0cSt2K00vRHNa?=
 =?utf-8?B?NTcyTVFMOEtGK002L29wYnBIVndMNlJZS1V6WXVTcFh6WkRvZGgxd05VcDd4?=
 =?utf-8?B?aTBKOWxyUFRSWTJjeE8zZHB1TFpDeXVTK0o3bjhMeGJ3c0dPMUFSZ0JTQ3dJ?=
 =?utf-8?B?U0QwWVBlWWtDbS80Y0psMUxyVGpDaVdOOTVjdmMzL1VLWStVbXN6TlVublBl?=
 =?utf-8?B?WTM5TlJMd1FnQ3ZPUHRxY0tjOVFCbzJUSXlGZHZFenIxNlFZdzNCU3U1T3lk?=
 =?utf-8?B?U29nZVNWUFFRWkFIOS93WUVhd24zK0t4L0k1WXlPWDFWaXd6L1Iva3RBT3Rk?=
 =?utf-8?B?WWNHT1VFMzhwRU9yM1ZtQnYzRWRuTHZDRzFoVXM0eHNwc2szZ3c2L1NyYkJp?=
 =?utf-8?B?WE5tVlljRGlxWTZiR0JHSHRRVHIzRm1KeUdtK1piNUhlYjNsMGRoRkFkSkJW?=
 =?utf-8?B?VU1abFNpTFg4Wm9mWTVFMUJoV0xzSzNhNFhVSnF5bGVtZFZETVcrVFU0c1hK?=
 =?utf-8?B?dlA0Z1MvUzhRY0ViVFhFS3pieTg2cWNxRG5sSk5vQWRZeE1GMC8rS1AyUkM3?=
 =?utf-8?B?Nk9nWi9pTFZQVnJPOXRiTUpZdFN5TWVVb2VIM0hvOXlITkk3djZ5Q0hDZHRt?=
 =?utf-8?B?SmlwbXVVNEJjdEFweDVuYzlZbWpXWjlQYmR4eGhrWWdjYTB3SzQ3aVN2cmxU?=
 =?utf-8?B?SUdjVkFOY0ErS282TFBicGl6T002dFh0b2xrUnZrWDFZVC9wNHRFOTZjMEZX?=
 =?utf-8?B?TklKa01TT1pMMGpKNGMyRThYaDUwdndLUC92L3JoV1ZXekhYclZ6NkVpOURP?=
 =?utf-8?B?amp5enltcHQ5VHkrMkRCbzd5UmcwYlNGVkdRMk1GbWZ4bk02RHppclZWUGZH?=
 =?utf-8?B?UHNFc1ErNFlQTXdkNE45MTRxS05ic2kxQk9oeWdtaWNMT0piZXBGUVZ2K0Mr?=
 =?utf-8?B?YWxTU0JManBKc2xuYXEzaUcvU3pxUzRJR3pnQnRaeFc3V2VBVnlBQWdObVc3?=
 =?utf-8?B?MjlSYlc3N1ZhczNoeUhpQXdNc3h1TVB5d2lCVzhlQkZvY3NXMERzMUNRby9q?=
 =?utf-8?B?Qk9hV3cxZmxYaFhvYXEydzdaanJ0NUNuVXV5QzhTTDFqWEZyYitYcVk2eS9j?=
 =?utf-8?B?eWFmRHMwdFVLQk50SUNwVTk1WDNYVWhYMUhNV1hYaDVQbVVZdGZVVWNqaXFp?=
 =?utf-8?B?NVNoWjlZMXBNNVZOVlNscjZCcEhjZTNhUlU1MUFibUs4U29pNW5KamlmaHVs?=
 =?utf-8?B?NDEydVhKeEZEdyt6WklFQjluNEtGbERLWmF5cnowN3hlazhoY2EyZFFTY0VP?=
 =?utf-8?B?bXRQMERsemNrTUtIbTNCR3ZjN3phTkVpNjRXODJuZkJoK0pyekpkdkZjMmYz?=
 =?utf-8?B?ZVc4OHVzQVlTS1B5U0F1bGg2bkZTck8zcVpqMWR5NlhSWW00RXNEU3UzZGFO?=
 =?utf-8?B?OU1TNWdSZ1dZN1ZySUQ0dGlOYk8rUlNvbkQ4dnhOOVlnMmZrWWpoRTdrdFht?=
 =?utf-8?B?WlF5N3NpUE1KRG5CUmRIT3hNVW16b3ozQ0oxZ2ExRzhSWUwyUGpMaWtoZ0Zs?=
 =?utf-8?B?MzZYYU5mM3ErRDk1am51NGlVSG05N1pGS0RrN3RpOEpudERXOHIvSG5ldTdl?=
 =?utf-8?B?Q3VMdXFWTnJXZTUzcjFKN1dCUHkrcU9CZHBTc05iRHFkZnZoMG16VU9VdWVZ?=
 =?utf-8?Q?F95mcf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjRUdHdGaVlJZkkyYitSL2owUEVrYkRnSWFUeUxEaHErdVRJUVJSN0FrTXh5?=
 =?utf-8?B?ZlgrdnU3MmV4disvT0poSktLL3dmRkkyTjJ0dndaMzJmMHpFQ0dFMjBJZHAr?=
 =?utf-8?B?TE4va0lOc3c2RmV4RlozcjEzRDhVTGwybHF1aitEZE9ZYWZLaDRKNFhaUjZW?=
 =?utf-8?B?YVJCRDl6TVZnUzh2UGpOWnVYRVJHNzNReHVjWlBwTkJ1VU4zdXcxSCt4T2d1?=
 =?utf-8?B?bkFuaU1zNC8zVUx6cGk4ejVCNFJLYVVRbmI5NWY3b3BadmJLc2trMm1iVDZX?=
 =?utf-8?B?azl2VFNvUG9saVlRV3VlWXZENFZlTjdXYk1xbUFsRkVjS2ZGUGFMSUN1T2RH?=
 =?utf-8?B?ZUFMU1llSW9FOE5qTk1RU210a2xkZ0lHQnk3d3N5cGlTRno3S2VhUU9GRWRX?=
 =?utf-8?B?a2xPRW91SXNCQUovMm1nZlZVc2pZbjE4S0Z1WEpnQnE4UXNJT2dpRGtRSXc2?=
 =?utf-8?B?YmNQbkIvbEh3QVpsaUQ3NzVMTDJXVXFjWVlTU3I2aTRuczJFN1NmSGVLTlN6?=
 =?utf-8?B?UlNHdWVydXJZWHg5THJla1Z2L3ZUMVJzRWZtSHNZNkhkeHV4Vk0rVFZkSXNO?=
 =?utf-8?B?YzdMbGdSUGc4SjVETGp3Um9WN29OVkpjOHRBbk9sQnBMTFBoMmkxUUFTK1dV?=
 =?utf-8?B?dzJtNE1SRVNDOEUvNVhGNitUZUxJNUJvOWdwZWtaZEdDZlBwOEkrVElTVlpo?=
 =?utf-8?B?TDdOY3orR3cvYUNQckNFSExUODROeUhnRlppVEsrQkw5aTg3aHpaK2lka0do?=
 =?utf-8?B?SmJLUnRaUkkvUzRVa2R3K2VLWE84Y2MwYWt0M3c5bU5vR2ZvWkUyN3pxUUVi?=
 =?utf-8?B?cE4yYWZaakRDbjBaMFpsMGw5R3gzOU9od3JxTjVybFpVd2VzVDF3bU1WWkln?=
 =?utf-8?B?NFNFUUh3UnYveTdhTGR4SU9nMHNvTkFMU2xrNUZ3bi9hTjJFNXR5akEyWlhs?=
 =?utf-8?B?WWowTHNTN2U4cGpMa3dHYVJoZi9wMER3SEVQYmlFd3JwSVltVURoaU54eUNo?=
 =?utf-8?B?Mjc3aVZoUENTUHBnVE01SFZrZmlURjBHUmtvWjlxMWthM1N1OVhUMWs0Vi8x?=
 =?utf-8?B?MjBHN1F2RjYvNm9iaUFORXJUM2YxMm9mN2pKTS9tS1RJRmdXbTB5NVRxY1ZO?=
 =?utf-8?B?NmJPUGJQeEl3RHNoMlNjeE4yc1RsNjh0UjRobDArL2JtcEhkeXovN29SL3BI?=
 =?utf-8?B?NHJ3dzNseTB0Vk5SRGpEMnhrRTkzSlJQSThxc2drYVlWNDh3YTFkZ0NST3dW?=
 =?utf-8?B?c3d5dEsrN2J1WmhrM21pdlZrS1RBT1lYdFp0dFY3UEMzZ3ViNHFiMGYyWW9y?=
 =?utf-8?B?eXlSR0g0YUFLN29IYnJNZ2Nyd1lBekE5T3FPOEtnZzhXeWdMUXdCRkl3OHVu?=
 =?utf-8?B?Qyt4SGp6SmlwVXIxQmZabDBLaW15dzNsTlRRb2J2VVZhajBYSTNiekNUVFNS?=
 =?utf-8?B?NnZyNzR2cmczeHZrVmhoZnFSZFRWL29GVnNJMGJiaVVseXdaYUNVY1pnejNM?=
 =?utf-8?B?SFNvcTI4YjRrMnNjTElIMDNkNFZldEFZUng5M3hhc3lRaE5adTJCZDJEMjk2?=
 =?utf-8?B?VExiOXl4dkJNWUtpRVZwVVIrdzFLSi9jTTZXMkVaS05hOTZ5SVJQUEx4UHV4?=
 =?utf-8?B?bGxjRkk5RDlNYzl5T21QZjhwdlpVYnZkWk5GMHZtYjFlbm1EOUVVcXNOVVNY?=
 =?utf-8?B?MnJpN1A1cTBiYTA1SlB0WVZDenZoVUhNaEpYVjJjS2lENFBMbXdnOC9NalRM?=
 =?utf-8?B?a1Njc1ZUVWVvQzJFbnpRdWdIdUt3K3FDd21jVjJScHNiNktBbzFnMENRTkoy?=
 =?utf-8?B?Z25LcXY5azFiSENuQys1ZUtWSmdLeEhzZUdaaENpdXY0TFpmUGxmaFp6bFdx?=
 =?utf-8?B?TjhQTHFyZi9MeTg3MUtqNEVXTDJlSDNReWg3c0NmRGVsUS80b1NWa3Yxczk5?=
 =?utf-8?B?bDJtUkQycUdEbW1nR25VR1k3eC9NUGlBVitRb0h0a3QzTWtNVmZXR3YwaDRU?=
 =?utf-8?B?aDU5ZU1QTDJvN2x0RzRYSGhxWEVsSEZyMVRuejNjOU1SRkVZak1RSkZSaUt5?=
 =?utf-8?B?OXpmenJ2OHhyN1E1eXhTZ05Jb3h5b1d3T1Zwb2hja3ByVW1Qd2w4ZmlRL3BK?=
 =?utf-8?B?WVZ6ZzlZVzJ6T0hPS3JwNEloSHdjQVVobTYzRTd4R3hQZnBsVDRtMVJsbUxK?=
 =?utf-8?B?T1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a37699-bce5-408d-e287-08de33dbd009
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 08:53:51.4094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yx5dSNEkOEe6B5M/iXsm2FfsVBOD2NLprdP0sxRLKVZB5uLXN3TSK7pPhfUZN7/516jFPPA8oSSqOEerrHi50NaIRWHIrXFObeRXr7cJsrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16889

DQoNCkhpIENsYXVkaXUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
Q2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDQgRGVj
ZW1iZXIgMjAyNSAxODoyNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6
ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZCB0byBSQU0gc3VwcG9ydA0KPiANCj4gSGksIFBo
aWxpcHAsDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55
dGhpbmcgSSBzaG91bGQgZG8gZm9yIHRoaXMgc2VyaWVzPw0KDQpJZiByemcybF91c2JwaHlfY3Ry
bF9zdXNwZW5kKCkgZmFpbHMsIFdoYXQgaXMgdGhlIHByb2JhYmlsaXR5IHRoYXQgaXQgd2lsbA0K
c3VzcGVuZCBhZ2FpbiB3aXRob3V0IGFueSBpc3N1ZSBhcyBjdXJyZW50bHkgd2UgYWJvcnQgc3lz
dGVtIHN1c3BlbmQNCmFuZCBlbmFibGUgY2xvY2tzL2RlYXNzZXJ0IHJlc2V0IHdoaWNoIGtlZXAg
ZHJhaW5pbmcgdGhlIHBvd2VyLg0KDQpDaGVlcnMsDQpCaWp1IA0KDQo+IA0KPiBUaGFuayB5b3Us
DQo+IENsYXVkaXUNCj4gDQo+IE9uIDExLzEwLzI1IDE1OjI3LCBDbGF1ZGl1IHdyb3RlOg0KPiA+
IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4N
Cj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4gU2VyaWVzIGFkZHMgc3VzcGVuZCB0byBSQU0gc3VwcG9y
dCB0byB0aGUgcnpnMmwtdXNicGh5LWN0cmwgZHJpdmVyLg0KPiA+IFBhdGNoIDEvMiBpcyBhIHBy
ZXBhcmF0b3J5IGNoYW5nZSB0byBhdm9pZCBzdXBwcmVzc2luZyBhbnkNCj4gPiBjb25maWd1cmF0
aW9uIGVycm9ycy4NCj4gPg0KPiA+IFRoYW5rIHlvdSwNCj4gPiBDbGF1ZGl1DQo+ID4NCj4gPiBD
aGFuZ2VzIGluIHYyOg0KPiA+IC0gdXNlIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSBpbiBwYXRjaCAy
LzINCj4gPiAtIGNvbGxlY3RlZCB0YWdzDQo+ID4NCj4gPiBDbGF1ZGl1IEJlem5lYSAoMik6DQo+
ID4gICByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IFByb3BhZ2F0ZSB0aGUgcmV0dXJuIHZhbHVl
IG9mDQo+ID4gICAgIHJlZ21hcF9maWVsZF91cGRhdGVfYml0cygpDQo+ID4gICByZXNldDogcnpn
MmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0DQo+ID4NCj4gPiAgZHJp
dmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jIHwgMTA1DQo+ID4gKysrKysrKysr
KysrKysrKysrKy0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkNCj4gPg0KPiANCg0K

