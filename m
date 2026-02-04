Return-Path: <linux-renesas-soc+bounces-27877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ENAFCUxg2kwjAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:44:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54430E5437
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0AFF3009F92
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 11:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047913ECBC4;
	Wed,  4 Feb 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RVkSjPdM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EC286D7E;
	Wed,  4 Feb 2026 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205472; cv=fail; b=YqdzFCH+3P9cFHQNAnTaXRw+nnTvCDHzMvJEpzUeslicu8VKRv1Wjx3g0eQePYnkmCRevjFXsh5fW8P4LTikdzzqlbWroEA76MwCucD1onV1BLW1a9c/myl8IuNXvx7jHU9J5uVz6aprU1dYaxW0HA0gid/XfydoAGOqg8uSQEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205472; c=relaxed/simple;
	bh=zQRw2FIoB0oXHqM9CBrAFWdZxTikO4PZhO/0Ia5NsF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RfAHtJfdC+uNTQXouiHA43+wKJFMU+CaW3velSCdTFBUq/XHmDFzZq4177sf75cK5CRFeCe9fYK3qzHJuu7gvDS/1q5nFZpjWCufwlLOR4HqVLT2wzpMgUpyrPIsQzVgCo7HvvsAzlcyoIJTf9y/yJuuYTe0YyEs7kbTLssTWYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RVkSjPdM; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT5+F9V0TyMCVi/SNaYLFLwE9rCfPlz8J8OwWEcKogyDcNTdU5QtEPn9JEK+5VFALUVzjSGMcXfvnRcOFFF2fw+pioZuHBBo4Mhb5H9lbtRWYmlZJ1kvPQ+CsoN5FL2puLDBqynZUebwFgu5DLx9PJFG/I7a4DRYDc+23oOcWNu8+sItetS2XY2ZyOryC1FMVyvtSjxtOSm8R4hXm2sjpUHi5x7eY9qr6N3Q0X0tB+UpJUuJ4lePmmp4v9FwHArkCZVAVW0u9Nh3gp3UoRKjoBdd5ADUaQZ/sjVyvKzLnF0SRLj0SvR7VYY90Hdp8ULaUymZKroD1LEx6DJ6sZDqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQRw2FIoB0oXHqM9CBrAFWdZxTikO4PZhO/0Ia5NsF4=;
 b=Pd6lGxdko7KHznnxhCAwtRq0p2io/kdeb96lGkZ2F9C/fj6vnC97igzPlRkk+9cGOvjQfMYZIEp4Dy+bBzMt6o64jXk0BzluiRhe51HkOxQdQ5Unrw7pTC8JWRkKqP57IZfxFEXDH01FvVeAuH/BfU2Ot+Sqe2W9b51sAO006IKa8EyKY4n8FVzZGgbk28lDnjQc83ZrLjkPiyGzKokh6oAXCaPYfNqK4gyICH2QAUc1oFKsCEwki5IQrOetEnoqvW7tB1m9OKQoeS2Vi/mLkyn8eTJ4gdm705VhggzttYhCMvORl4LB5QPu4XdT0HcD3saB1MUn+kxUuOHxthTCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQRw2FIoB0oXHqM9CBrAFWdZxTikO4PZhO/0Ia5NsF4=;
 b=RVkSjPdMSYe+0uxRa4tL00iObyOwrb1maYQbiah/oeXgpXi3f7BxWBJVYBuyBdIp6gny+vGIsPsWUG9eoAYGejCcsbOaS/jNVLpUwqtcmH8npmEv7PZ3odYU2DEHqiMnEQFTRZPJlkQ24xKZO+GwZykLwpkL40VYQ6DyNgAuRuc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8558.jpnprd01.prod.outlook.com (2603:1096:400:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 11:44:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 11:44:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Topic: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
Thread-Index:
 AQHclWNsQepXURhRS0aTtfgvJAtpW7VyFyQwgAA9qICAAAEloIAAAjsAgAABdKCAAAV6AIAADMHQ
Date: Wed, 4 Feb 2026 11:44:26 +0000
Message-ID:
 <TY3PR01MB11346C8DB7330385610B222818698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
 <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uYBYM-VnUXQA3YwEMn1NzWLMkeGYgmW2jb8oo30aPvcQ@mail.gmail.com>
 <TY3PR01MB11346E1CF9827B7C76B20ACEC8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vg5C0HN+nwW+iNFvqGPQmqO1iBp154ifNEvSErkdvVrw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vg5C0HN+nwW+iNFvqGPQmqO1iBp154ifNEvSErkdvVrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8558:EE_
x-ms-office365-filtering-correlation-id: 65788edf-460d-4764-5c1c-08de63e2bfd6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGluUExFMEJQaC9tbFVPRWpOMHRPU05POCswRlByaXZBRmtYeWloT3FKeUR2?=
 =?utf-8?B?SXh1RHpWb3c2cXRvalh5UXVJR01xZ01PSlBtTHhZN1laVG1memlONTd0Q2ZD?=
 =?utf-8?B?ckMrZ09DRG1KRXExUEZQU0d4a1pqT09MRENqVUR2NDJ3VlNJcDZ1c0pUOTBl?=
 =?utf-8?B?dVBqUERFbmxqVXhJSnRyTWoxbFVuaFlENUZZaFpvTXhMWmZJUTlVQTdncXND?=
 =?utf-8?B?ZDJyQnQ1RC9FQzAxbDA4aW5ROTg4NE8wYmgvOUJPaUtxcEJ5c3UreTgzUEFY?=
 =?utf-8?B?REpyS2pxdkY2dC9ZQzdiL0R1ZmhISnNQL21zc3ZjbjNBbmhndG16L05meXkx?=
 =?utf-8?B?TUJZeWo3c1ErS3I2NzZaaGo1TGNwWEYwemtjSmJibnZQaUlOSGc2OUg0MWU0?=
 =?utf-8?B?WGFhOFhreVhhb0E3QTQvTG44ZXFSU2pob1kvOHdXZmZ3UUJ6VSsyTGNuUGE3?=
 =?utf-8?B?dEEvL2NQMmk2enZQRndOMXdJTHVJU25IbzZ2Qzd2aldtQjYwR2pOVVpVdFJJ?=
 =?utf-8?B?cDU0RXZuR0tLeGYxOWo3SXN4WHRhd2RWd1JvYnhzTjU3cm1kclZWZWRmdm5j?=
 =?utf-8?B?aHdaMnRmT0M4MjE1RUhxM3dZTVRLbGE4NzJKYm91bHdiU1FVSUhFVFlMYzdG?=
 =?utf-8?B?K2RlWUpMSW1jNHpaZjJPWk1hNWlrbzRtdHdnSm1aQkZ1bzE1Qlo1S0ZaZWJK?=
 =?utf-8?B?dVg2L0VpNy83UTRtM3JoT2xlY05wb1JVVmFBVDRFK04wRnFrQ0NzUVZuZTV5?=
 =?utf-8?B?a2I2Qms1a1lhNXh4RjkrdnBXT000RWZrYnNqVUFZa08rdE1GeFI1cllvRmJz?=
 =?utf-8?B?dEU3U2JYL0t3RERRUkxIWW9HemE3b25LSlV0MXNpZ3FNRXgzdm1LTE1NeUJ2?=
 =?utf-8?B?Q3hNRFdFTnhlQlhhLzVlejFKNUxtZ0M1eWpkRmJGaTJlRDBoNHY5cTlROWpL?=
 =?utf-8?B?c2trR3Y5K2I4RnBjd3Q1TGZLRlBvRjEranJSdk85eWRxenJQU1RBTHNWcGRw?=
 =?utf-8?B?ZGYrRlhpbEJpMEhvUXV5K0dxbDgxdEYxMTJya042anNySVJsQVVRZmExL1dS?=
 =?utf-8?B?MDl2ckVQeTkrOWFHV0tlU0wwclRrLzJFRUJMVGdVWjc0YkwrQlVVQzB5YXIz?=
 =?utf-8?B?NU9yQklLQXhmMDZLV083SXgycHJOQVZXZkpDdmZjTFc4V0RiOHIvZ1I0UmNT?=
 =?utf-8?B?QitVdlh2clRmNWM3RG0vV3V0b05hY0xEVklqK3F0djFpOGtKQVpFNW93cGh2?=
 =?utf-8?B?bENFTTA4dXZNSHBsOFVrTytmYmovWWdBS0RweVpLZ0VCSjFZQ21TSHFSd2Rk?=
 =?utf-8?B?aDNkeXFPSmJ6N3NzdzBJUXlxRzhNUXNPK2R0YlY5Z1JSeUMrV2QrQm1QUC92?=
 =?utf-8?B?bm9Mb2JBRGhDbm9mMVdad1k4VlErdnVManFTSWJYUENYZ0dvZlBHMTNmc2Vj?=
 =?utf-8?B?TC9POGFNTkJGN2NDQnJJNFZkd3VFWHY1RUpsR2RqRkFwL0Z2SnV4M1JBR0N5?=
 =?utf-8?B?STh6dlpvMHVLKzFzUHJheXhuOU9MQUppN0hpUW12Yyt0N09OMHA4TXIzQjEv?=
 =?utf-8?B?UStpZVM1TlNwdlpSTEpyQ0c5RnZENys0VmtPVEZiZE1CQ0ZiakRZanBDdGNG?=
 =?utf-8?B?MWYyUzFPK2dQTmx5WHorNnE1VWRnb3c0L1hIdXc1VDZsRm0yTEMzZHB1Q0N5?=
 =?utf-8?B?Qlc4dDAvNXBTdElLNVJ2VHExYnZxaW8vanlBVlJsa3hCUFpJMlpGL0lXcldB?=
 =?utf-8?B?QUFiQW9RQlUyZXp3M3hoVGd0amRlOEZLNVdjcW40bDh6TXZlamQ3ZGF5d3c3?=
 =?utf-8?B?d0U1U0JKVHM2eEtnUG9NOUdJTUlXeE1VQU5Scks4SEcrTTRwb2FVOGt3Y01B?=
 =?utf-8?B?SEFTcXRGYnRYTU53bU1CNTVuNDRYcW1jOTdQa1NJUDFibkg4ejBjRFY3cE96?=
 =?utf-8?B?ZTFMV1JKdXpwdWg2R3AzR1pJRXpmUUp2RlhLUzlTMHpqMHg5dTY2SHJwLzdh?=
 =?utf-8?B?SWxwZU91WGxIVzhwRFBqWjBuT0NGTXpPU1Z0czcvWnp1elBGZ2RlOEsxN2kv?=
 =?utf-8?B?TVdjM1BzdW5SWjYyamtiQ1JPL0NBalZZOFg1eUQ2aHk0YkNwZERwckhaSFJC?=
 =?utf-8?B?emlKMWxEQ3VUdDNTMVI3SGRJckk2TkdudUJMcXdyRUQzZzZoTjhmSzlTY1hU?=
 =?utf-8?Q?qAypiOpJc7Yq6p93gnvQSmQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFlGU3kvdk9HdHlnY1hRM2VrR25GdjNsRkJjL0V0UUJQQnBhK3BoQ1o5TzlS?=
 =?utf-8?B?SU9va0hBK091bmptTDNHNXlpUW1tTnlKbjk0OVlOamxXc2hLcDlXYmRlL2Jp?=
 =?utf-8?B?R216M0E5VHZlRUFPWFVzc0grZFoxNkNhUmdqUkU0REhid2pDbnN2cUF0elJu?=
 =?utf-8?B?VmxiSys5T1k0c2NRMVZROGFrZlBtRjhtL0tJR2lPaW5kNXZ4REZqUlRJN3Zx?=
 =?utf-8?B?cmxhTHFCRFZxT2JCR3g0ejNXdUZoVVBUbXdhZjNVTUhNT0FWK3JyemhraEdU?=
 =?utf-8?B?UGJBU3MrMDRqMExsc2loWU00RFl6MGplVVRxUVNwc1ZSZUN5QkNtcVNSaEls?=
 =?utf-8?B?ZUhOcCtmbk9nTG00T2FlR3dDQUg0eVdhUXFIQlJ4NGNDUmlWd01wdkVxK2c0?=
 =?utf-8?B?V3NmZ2lPbmpFTzB5QjhaaXFPK1RCSnpRUEViTTZqM0F5ZFJYb3B3M0toOGNJ?=
 =?utf-8?B?eHBTQkxNTEU3QzZmbEtSTGVVcVJZUU55TDBaMGlPaTdOVEcyeVlPeVJqVWli?=
 =?utf-8?B?a0lQNmswV0RxbDlGM1dWbWxPbG9aRFR1bVJ0QnRmVVRydHR4S1d4WlJFdVEv?=
 =?utf-8?B?T3kwdHNaaUROOUNobnB3aEVlTnhCSHRGdjhERFVnL2RSdUpwM1lMenZaWmtI?=
 =?utf-8?B?MlZyVUh5YUtjczZxOW85UzcvOG5FNVhUMVhTVWh0REptKzVyaUIyQk1uYWtG?=
 =?utf-8?B?bTA4LzR4a1FzVW9aWjk1WTJORzB3MTcyaVdySWI3QVFBTUxrL29lVXVKRk1x?=
 =?utf-8?B?Ymw2TW5PNVFxMFhKMDZEbkg3Ynk2TUJjT2xpSDJaTnZjMDVKeEVQSGV1eFh3?=
 =?utf-8?B?aFdKa1NJY3dnaUl1MXBFN0tQQVM0YXRtV2lHamEwWjE0U0djeWVIc0ozM0t1?=
 =?utf-8?B?bGk2UitneVBOTnJ0YlA1UXh4U0tIZXhWUlVzMXZGQjU2eERlRFJUOXNnZjNQ?=
 =?utf-8?B?bUFLOWtzQ3B2TWl4V1M1SWl2Qy9EU3A2MVViSkpxRCtxVm83MWpneGlzZTVy?=
 =?utf-8?B?YzlMNk1uZFZBZVRsbk5VYXIwUXkzNnFGcDlrbDFJTWtSRVJvM3FvSTBrczZs?=
 =?utf-8?B?WGxaSmJ1WGtEYVl5WE5aaHhFd0srck5sMnZkcENtb3pQWTBLZnhuRWZoS2ln?=
 =?utf-8?B?cnA4cGlEeU1oZDBMcm5GRExiVUpwMXN6S2I2STVvUy9SLzZEQTk1T0JOTHdG?=
 =?utf-8?B?RnVEWVc3bGNYU3c0emxsWU1KYVNzZzY2NGpKV3BWRnUwbFRYRmZEcjdQT2ZJ?=
 =?utf-8?B?cnFUZVRGTGZ2OC91U0pTY0IwR0tOSStGb2VSQVNxNWhYUjhUaEdUajhZOWpq?=
 =?utf-8?B?cU9Yd25vNkZRcjNiTWJEZUVxWXFRK0RZVUxObnBFMXlYazJsU1NieGw0eUU5?=
 =?utf-8?B?MHh2UkNPenVOclJhQWE3SFlYNzcwTzdsV2UrTGF0NFdDbERCdlNtem5sR3dK?=
 =?utf-8?B?WGltTWdSQW9rVEJXaHNhd29va3NjVXl1bjVHRk1YWHFFMFhaT1lpMTFvOHFY?=
 =?utf-8?B?eXhOYlk1bUlETmpKczZ2QldEMmVQU0tmWEkvM284VjNSWGVDdmFzZkMwZklK?=
 =?utf-8?B?QXl4S0FibFByQmZJMWpNa3FPZ0Q0TUNrOThSZlIzZ2paUlBEclFEb3BvdDVv?=
 =?utf-8?B?US90TjJOKzJFQjNCb2YwT0s2MWFKcTdTaUZWcG9lZ1dIbVRDbExCT0JWbkxO?=
 =?utf-8?B?R1lGZWVLdkVpNkFVcUx4SUxQTjRPL0ZZUnQ3eGdaN2xubG9HNXdibzMvUkU4?=
 =?utf-8?B?L3FVd2V1SW8vak84RUVjM0NGODd0bmtabWRGM0E5MmhRdHpFQTZTMllwQUlo?=
 =?utf-8?B?RG5FdW1FMWVQbTk5NSsrSHdGK2RML2ZTckFlRU13c2pSYWVxZFpTbFBLektT?=
 =?utf-8?B?dTlKczY1T3pwdlBXN1dXcWw3NkdHem5nNEh5QVFZd05SVG03djdTUm4wODZZ?=
 =?utf-8?B?V1JBZkZHS3JzV1lhQ1NXbXcrZmN5WlRTT2FVbWdWakU2aXMxSDBiVHhrQ0tL?=
 =?utf-8?B?bVpFbXVEQVJqRHlhWjF2K3FnYXBtMU4yNjcvUFllVmJmUzZMVHBCSnNTNGha?=
 =?utf-8?B?NGJyQWtOMVdzTjExRW9Nd1pYTlRCeHJhMXJ5OWtIclZvT2JTVGhYQldMWUti?=
 =?utf-8?B?T3ZtWUtsSndZbnNuOEl4dVFOWW1IMHFZa0ZNdTZ6R3ZYTXFYNzlpamQ1NTJM?=
 =?utf-8?B?NE9QUG5MVTlNS0MrcG9kM3dFSk1YazI0L3JKRFdIeVE5Q1ZRVVVuUVU4Uksz?=
 =?utf-8?B?dkNVUEU4ZGFLZ2huQWhjcEx2KzRwS2ZYYUVPcDBzZTN6RGs3T0pRZjB6Q0N2?=
 =?utf-8?B?akxYOEIydE53dU1Uc24wUlBuQnFkak1va2R3bi9WaHkwWWQxSEZZdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 65788edf-460d-4764-5c1c-08de63e2bfd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 11:44:26.5357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5sJEBFqi6Xneu/k/ORKicFFugu5a5Mzo/DFJAyP3C46mgIvlU2rlycKqB9xXoYt9/OtKzKOPOg6TyxhOXLRgnYgwg8NY5j3GbJliLS5dnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8558
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27877-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,renesas.com:email,pengutronix.de:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 54430E5437
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDQgRmVi
cnVhcnkgMjAyNiAxMDo1Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNl0gaXJxY2hpcC9y
ZW5lc2FzLXJ6djJoOiBNYWtlIElSUSB0eXBlIGhhbmRsaW5nIHJhbmdlLWF3YXJlDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gV2VkLCBGZWIgNCwgMjAyNiBhdCAxMDo0MeKAr0FNIEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQcmFiaGFr
YXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBM
YWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBTZW50OiAw
NCBGZWJydWFyeSAyMDI2IDEwOjMyDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNl0g
aXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBNYWtlIElSUSB0eXBlDQo+ID4gPiBoYW5kbGluZyByYW5n
ZS1hd2FyZQ0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgRmViIDQsIDIwMjYgYXQgMTA6MjXigK9BTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gRnJvbTogTGFkLCBQ
cmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IDA0
IEZlYnJ1YXJ5IDIwMjYgMTA6MjANCj4gPiA+ID4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2Vy
bmVsLm9yZz47IFBoaWxpcHAgWmFiZWwNCj4gPiA+ID4gPiA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA+ID4gPiA+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT47IG1hZ251cy5kYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+Ow0KPiA+ID4gPiA+IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+ID4gPiA+IHJlbmVzYXMtc29jQHZn
ZXIua2VybmVsLm9yZzsgRmFicml6aW8gQ2FzdHJvDQo+ID4gPiA+ID4gPGZhYnJpemlvLmNhc3Ry
by5qekByZW5lc2FzLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA+ID4gPiA+IDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiA0LzZdIGlycWNoaXAvcmVuZXNhcy1yenYyaDogTWFrZSBJUlEgdHlwZQ0K
PiA+ID4gPiA+IGhhbmRsaW5nIHJhbmdlLWF3YXJlDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBC
aWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBGZWIgNCwgMjAyNiBhdCA2OjUy4oCv
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBIaSBQcmFiaGFrYXIsDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
VGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJo
YWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gPiA+ID4gPiBTZW50OiAwMyBGZWJydWFyeSAy
MDI2IDIzOjE4DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiA0LzZdIGlycWNoaXAv
cmVuZXNhcy1yenYyaDogTWFrZSBJUlEgdHlwZQ0KPiA+ID4gPiA+ID4gPiBoYW5kbGluZyByYW5n
ZS1hd2FyZQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2Fy
DQo+ID4gPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFJlZmluZSBJUlEgdHlwZSBoYW5kbGluZyB0
byBleHBsaWNpdGx5IGJvdW5kIElSUSBhbmQgVElOVA0KPiA+ID4gPiA+ID4gPiByYW5nZXMgYW5k
IGRpc3BhdGNoIGJhc2VkIG9uIHRoZSBoYXJkd2FyZSBJUlEgbnVtYmVyLg0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiBUaGlzIHJlc3RydWN0dXJlcyB0aGUgbG9naWMgdG8gY2xlYXJseSBz
ZXBhcmF0ZSBOTUksIElSUSwNCj4gPiA+ID4gPiA+ID4gYW5kIFRJTlQgaGFuZGxpbmcgYW5kIGVu
c3VyZXMgb3V0LW9mLXJhbmdlIGludGVycnVwdHMgYXJlDQo+ID4gPiA+ID4gPiA+IGlnbm9yZWQg
c2FmZWx5LiBUaGUgY2hhbmdlIHByZXBhcmVzIHRoZSBkcml2ZXIgZm9yIGFkZGluZw0KPiA+ID4g
PiA+ID4gPiBDQTU1IGludGVycnVwdHMgaW50byB0aGUgSVJRIGhpZXJhcmNoeSBkb21haW4gYnkg
bWFraW5nIHRoZQ0KPiA+ID4gPiA+IGludGVycnVwdCBjbGFzc2lmaWNhdGlvbiBleHBsaWNpdCBh
bmQgZXh0ZW5zaWJsZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJq
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gdjEtPnYy
Og0KPiA+ID4gPiA+ID4gPiAtIE5ldyBwYXRjaC4NCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA8
c25pcD4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gICAgICAgaWYgKHJldCkNCj4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gPiA+ID4gPiBAQCAtNTA3
LDExICs1MjgsMTEgQEAgc3RhdGljIGludCByenYyaF9pY3VfYWxsb2Moc3RydWN0DQo+ID4gPiA+
ID4gPiA+IGlycV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgaW50IHZpcnEsDQo+ID4gPiA+ID4g
dW5zaWduZQ0KPiA+ID4gPiA+ID4gPiAgICAgICAgKiBmd3NwZWMtPnBhcmFtWzBdLg0KPiA+ID4g
PiA+ID4gPiAgICAgICAgKiBod2lycSBpcyBlbWJlZGRlZCBpbiBiaXRzIDAtMTUuDQo+ID4gPiA+
ID4gPiA+ICAgICAgICAqIFRJTlQgaXMgZW1iZWRkZWQgaW4gYml0cyAxNi0zMS4NCj4gPiA+ID4g
PiA+ID4gKyAgICAgICogQ2hlY2sgaWYgYml0cyAxNi0zMSBhcmUgc2V0IHRvIGlkZW50aWZ5IFRJ
TlQgaW50ZXJydXB0cy4NCj4gPiA+ID4gPiA+ID4gICAgICAgICovDQo+ID4gPiA+ID4gPiA+IC0g
ICAgIGlmIChod2lycSA+PSBJQ1VfVElOVF9TVEFSVCkgew0KPiA+ID4gPiA+ID4gPiAtICAgICAg
ICAgICAgIHRpbnQgPSBJQ1VfVElOVF9FWFRSQUNUX0dQSU9JTlQoaHdpcnEpOw0KPiA+ID4gPiA+
ID4gPiArICAgICB0aW50ID0gSUNVX1RJTlRfRVhUUkFDVF9HUElPSU5UKGh3aXJxKTsNCj4gPiA+
ID4gPiA+ID4gKyAgICAgaWYgKHRpbnQpIHsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJcyB0
aW50ID09IDAgZG9lcyBub3QgaGFwcGVuPz8gIEkgbWVhbiBHUElPaW50ID09IDAgaXMgaW52YWxp
ZD8/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+IEZvciB0aGUgUDBfMCBjYXNlLCB0aW50ID0gMCBh
bmQgaHdpcnEgPT0gSUNVX1RJTlRfRVhUUkFDVF9IV0lSUShod2lycSkuDQo+ID4gPiA+ID4gSW4g
dGhpcyBzaXR1YXRpb24sIHdlIGRvIG5vdCBuZWVkIHRvIGVudGVyIHRoZSBpZiBjb25kaXRpb24u
DQo+ID4gPiA+DQo+ID4gPiA+IFlvdSBtZWFuLCBubyBuZWVkIHRvIGRvIHRoZSBiZWxvd2NoZWNr
IGlmIHRpbnQgPTAuIEJ1dCBkbyBvbmx5IHRoaXMgY2hlY2sgaWYgdGludCA+IDAuDQo+ID4gPiA+
DQo+ID4gPiBObywgSSBtZWFudCB3ZSBkaWRuJ3QgbmVlZCB0byByZS1leHRyYWN0IGh3aXJxLg0K
PiA+ID4NCj4gPiA+ID4gaWYgKGh3aXJxIDwgSUNVX1RJTlRfU1RBUlQpDQo+ID4gPiBPaywgdG8g
ZG8gdGhpcyBjaGVjayBJIHdpbGwgdXBkYXRlIHRoZSBpZiBjaGVjayB0byBiZWxvdyBzbyB0aGF0
IHRoZSBhYm92ZSBjaGVjayBpcyBkb25lLg0KPiA+ID4NCj4gPiA+IGlmICh0aW50IHx8IChod2ly
cSA+PSBJQ1VfVElOVF9TVEFSVCAmJiBod2lycSA8PSBJQ1VfVElOVF9MQVNUKSkgew0KPiA+DQo+
ID4gQnV0IHRoaXMgd2lsbCBza2lwIHRoZSBod2lycSBpbnZhbGlkIGVudHJ5Pz8gZm9yIGVnOi0g
dGludD0wLCBod2lycT0yDQo+ID4NCj4gV2lsbCB0aGlzIGNhc2UgZXZlciBoYXBwZW4/DQo+IA0K
PiBCZWxvdyBpcyB0aGUgY3VycmVudCBjb2RlIGluIG5leHQgWzBdLCB3aGljaCBkb2VzIG5vdCBo
YW5kbGUgdGhpcyBjYXNlLg0KPiAvKg0KPiAgKiBGb3IgVElOVCBpbnRlcnJ1cHRzIHRoZSBod2ly
cSBhbmQgVElOVCBhcmUgZW5jb2RlZCBpbg0KPiAgKiBmd3NwZWMtPnBhcmFtWzBdLg0KPiAgKiBo
d2lycSBpcyBlbWJlZGRlZCBpbiBiaXRzIDAtMTUuDQo+ICAqIFRJTlQgaXMgZW1iZWRkZWQgaW4g
Yml0cyAxNi0zMS4NCj4gICovDQo+IGlmIChod2lycSA+PSBJQ1VfVElOVF9TVEFSVCkgew0KPiAg
ICAgdGludCA9IElDVV9USU5UX0VYVFJBQ1RfR1BJT0lOVChod2lycSk7DQo+ICAgICBod2lycSA9
IElDVV9USU5UX0VYVFJBQ1RfSFdJUlEoaHdpcnEpOw0KPiANCj4gICAgIGlmIChod2lycSA8IElD
VV9USU5UX1NUQVJUKQ0KPiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiB9DQo+IA0KPiBQbGVh
c2UgcHJvcG9zZSB0aGUgY2hhbmdlcyB5b3Ugd2FudCBtZSB0byBhZGQgaWYgdGhlIGFib3ZlIG1l
bnRpb25lZCBpbnZhbGlkIGNhc2UgZXZlciBoYXBwZW5zLg0KDQpZb3VyIHByb3Bvc2FsIGlzIHRo
ZW4gb2ssIGFzIGl0IGV4dHJhY3QgaHdpcnEgb25seSBmb3IgdmFsaWQgdGludCBpbnRlcnJ1cHQg
Y2FzZS4NCg0KaWYgKHRpbnQgfHwgKGh3aXJxID49IElDVV9USU5UX1NUQVJUICYmIGh3aXJxIDw9
IElDVV9USU5UX0xBU1QpKQ0KDQoNCkNoZWVycywNCkJpanUNCg0KDQo=

