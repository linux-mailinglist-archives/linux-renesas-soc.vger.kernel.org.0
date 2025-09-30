Return-Path: <linux-renesas-soc+bounces-22484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D9BACB3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 13:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28D3167552
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 11:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098D625D1F7;
	Tue, 30 Sep 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SS5OzyGY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BFA24467A;
	Tue, 30 Sep 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759232173; cv=fail; b=BAWUdMiSnMeJ6UTkspcCvWr9NestaI89mVe1agvqtCbzScbZfyz8mjBkToTAZs7rqPgJXtMPltFYXRZnDad3OLYPCcibdegc/0Oqo/m4xsQI9DoYgEIuh2OLdmTpl3eGf63H8DotbzcuYPkIAJzltrvW7z+iVtrSEKtEKlHShCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759232173; c=relaxed/simple;
	bh=w7X9gc4Dv08vBk+qIinGkHkx7eGYP8sV5xHQBFqT94Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XRJxy0JS/HM7AQxXpFJC5bG/PVWnUcLFNERps9UZpP1QnGouA8H9XhWvOSWhQVNCSqI55Fl4LDot4f8h20PtXAYua/KI8XSDfhassfL2quzT9OYiV3i0u+7Ey2hDx5iBP/7CEuJKxDvCvG/X0spG4AKYeue02/Kf4+faJWvuAsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SS5OzyGY; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEyrBnk/xHqMjAt5KqTcqBj2MJWzX/kxGL4yTfXygNzgCsDlwgcmme8quaUeRtYHw/rCsu00lvY1cPUj6w9RW/VaMMWfA0NnAEdUIgqgRC8PB6qSo5SIjSiTxUREmGL85CLoqfWqWF/d2ctyfiNrBhGiXZQ7iQGOyQIzW7Xu8qizYGxMeyRzSCGV3+3k/IORPYWio3j+Now5j8VeRqpTqOQA+WwHtM+Q/8+zDEW/A7+XEWS7FzIU2tuWZslYdNEAEBGsju57SP0dJZFAJiUqf99qA3Qte19vx1zBBPpM+KXzrL7z+NnGCPMRLSwHnpbkpBBO64jzzWokvvHwhTLevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7X9gc4Dv08vBk+qIinGkHkx7eGYP8sV5xHQBFqT94Q=;
 b=eDkTyjNryBJjpVYioTU/9974+X9/kLtmuvc+8Rdt6OBrI+hYBTS87x7CPqzYSTGxUmfNKpG/2vCcXnPrmO3LOHoTAOD0v4zjAmmc6Amgi/2WgiTPG9Z/BH9FpRMDcTM7XaNxg0Ek+LpbcxctOIKCjoEdNbNaRHQsHFleIssF7IWtC/cbeAxZpc8G5g/w6HwwB7wWX5vHcuI5C0oPFO+ovSlFzTOKPYfCgh8mJjxK3XR/OmnA/jrgy01NEyJGwnL4bExavwVoAOEAnWsZMohjXXT6CD58kQpaqjQ1A0runM4U19xhnG+TPvD1XZMVJLUO0J+rKpxdPqapf1zoVwX+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7X9gc4Dv08vBk+qIinGkHkx7eGYP8sV5xHQBFqT94Q=;
 b=SS5OzyGYGUinMqqNQ3NeAVBd+w1a27xK2NZTaduZNmeyiuRDsMwj+leRIwA2afFuLXJ9uhMflUSNhUEUI8EOiWKI4JEmejy+Mofzv5VYk1gibuNNkYCnGvffRi1qznfDdVlg8lqXNufk9APieilwmvQvXkpTru/s9iYmMI650Bs=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYYPR01MB16360.jpnprd01.prod.outlook.com (2603:1096:405:145::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 11:36:07 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:36:07 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next v5 3/4] net: renesas: rswitch: add offloading for
 L2 switching
Thread-Topic: [PATCH net-next v5 3/4] net: renesas: rswitch: add offloading
 for L2 switching
Thread-Index: AQHcGv0bP68iyFXf60yVYYb162XPhLSqkVUAgAE0ySA=
Date: Tue, 30 Sep 2025 11:36:07 +0000
Message-ID:
 <TY4PR01MB14282AA649A90842E68F1E99E821AA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
 <20250901-add_l2_switching-v5-3-5f13e46860d5@renesas.com>
 <a17f9051-9676-4ab0-a69f-75aa2575b933@wanadoo.fr>
In-Reply-To: <a17f9051-9676-4ab0-a69f-75aa2575b933@wanadoo.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYYPR01MB16360:EE_
x-ms-office365-filtering-correlation-id: 9c2f584a-47f2-4098-1813-08de00158c0c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFU5QUttdEZuUHNLaGhGWXVZR3hHSEVvWHB5UG5sS0dGdWNjbXpKUURFVTZV?=
 =?utf-8?B?a3ZLeDJMZ1JEV3EvUVREemdpMERPUGNIUzhKZ21VWFdyM0RCd005N3Y1Qllz?=
 =?utf-8?B?RFBFS3FLQ1EzcjRKaHRHend2MWVnRXZ3VG1LS1k5NTRrMGtVd2R0OGJUTllK?=
 =?utf-8?B?N1Y0RXRGSm9pYkxpVVhwdXdRN3BJUGZqLzB1L1JSNW1rSmtCYnpieG9lOGVS?=
 =?utf-8?B?bEtRUTFDWHFKc3hqU1QyRXRyZkRHOGs0bjM5T0daRVNnK0pKYWdOVCswT0x2?=
 =?utf-8?B?c04yVEhJQ014T2l5SGh4RUY1d25Xc3FOamFzd3hYenczV0xTaGZlYWlENFBv?=
 =?utf-8?B?L2YyL3BXcWpqWk9IejAySmZIMnBQRlhEb0lFRVJmdUtHWlordWZZc1pLMW5S?=
 =?utf-8?B?c0RqMThPaFhBZzlnRlZrbG1kaWZERDlPdm5QVTl1V3VkekpyQXhKdEFlR1JF?=
 =?utf-8?B?YUNuSUxKKy9lQ21RSEN2cmZLdmp4Z09qWWVPVXY4NGl0NEl2bzFLU2w3enpZ?=
 =?utf-8?B?RHhndFdWSUZnVFNNRVBpeFV6SURhMzMvcWtMQ0tQMWwvdzVPcVlUQS9NNDcz?=
 =?utf-8?B?WGZxL2E4SWFaajBxcVN0WGx4WHpGdjJpb2M2d1FaWTdPRWZ4cTVYZ0E4aDJr?=
 =?utf-8?B?WEljcXZyVlB0ZTArU2kwRTZPS01wN2Jib0hzZjRGTW4zTG51NWplbmsvNXRJ?=
 =?utf-8?B?L20yUkdacVJpUmt0d1kxTkZFSDV1cVlxdFZQOU9Rc2R6RnVaV3RFNkQyM3J6?=
 =?utf-8?B?dUhHcVhXd2F4RlYrRVZlc3dsZS9nWmNpQ25kOVByMHFlWmt0U0RXdjM1M3F1?=
 =?utf-8?B?V20yY0dScjRXcWFLbWF0K3lRU21zWEtxcStWNXF4STdqMFY1T253ZHM5dW54?=
 =?utf-8?B?dVZFcGJUdElrTElTTWF2UnhXNytLMU53RVhEbkp6c3hPMkVPZlAxNzU0UGtv?=
 =?utf-8?B?OFVQajEzUUxyWXZTSERwK2phVlhGbkptcGhsQkZadFdxNkFnZVJrMi9mRXhR?=
 =?utf-8?B?eFBscEUzZ2xHQ3VhN2dSdUMyUlZYUFErTFVVZXRkVFZPQXg3eG5IN0N1T2lV?=
 =?utf-8?B?Z3l5YjMza25RSHNjMjJzOUdlbWJaVmZmK3VqWEZTYkF0MnppMlMzRXVCdU5l?=
 =?utf-8?B?QjVvU01QZWpzZnAxUysxckE3MFYyYk4yT3ZFWHFaODhrS3Y1TUhKTnF2M0V1?=
 =?utf-8?B?SzdDc2RkNzkwY0JDZWFWZ1Bua25kMzlIeGVpa20vdWNTOWNJSEJiekpvbXFq?=
 =?utf-8?B?RUZXcWFVYUNLTW1lZGNHdFRwbUR2K2Z6WUtLd3B3ZFkreThtUFhpd2pvZExQ?=
 =?utf-8?B?ZGV0S0M2dFUwa3FLT25jYys0Wks3NHhCMHJpdGN0bWRnZjVRaXZtQ2l1VEQw?=
 =?utf-8?B?VzFBdW1wUE1SZ0dDU1gzaVhiZEExdjFWSWcyYVQray9BMGxNSTNWeEpOQUNO?=
 =?utf-8?B?WWo1UTI3TUpveWpCSzhJZ3c0OUtFTEE3RG5vMTBBYXQwOWw4UmJYTUZoNlF6?=
 =?utf-8?B?aERJUDlyNkYxSlJoa0g3VGtsdEU2NU56OGpRQlZYVUdENjZuNFFlanNmY3Fs?=
 =?utf-8?B?d2JnTCtRb1gzNUpxMkRkNE5kbmxkYkxqeDJGNWJReHg2Q082ZnZiVG9DTHRJ?=
 =?utf-8?B?RUFnbHFOL0Y0aFg4akw5SmFUcVkrS0RPRWhxUjBjMUNEVXJsRDJmNDIvZ2JN?=
 =?utf-8?B?YWp2djVvQmg2SzVHcFliWHgvM0RCKzVOWjJ3RmRoK2ptZ1E2QjF2K05zZkpp?=
 =?utf-8?B?RDhZcUF3NW9rOFNjUXJrVWQwak5ROTQ2eUFWUUxmYzlyeUFyckduS2RqSGwr?=
 =?utf-8?B?T3d4K2JieGFMNkI5WW03Y1plaXpoS0gxek1vK2FBUkEyT3J6azhLVFV3VFJ3?=
 =?utf-8?B?T0xVaE5BRFl4bmljSTBrMFRpT2FJaUJKZTV6UjVhdWx0L2w2aFFSc2lVOXow?=
 =?utf-8?B?ZzdkUm9nVWxOQ2RSa051Vmw0djNHdk16d2s0ZG9MTU1FRGpVMVhrZC9jR3BG?=
 =?utf-8?B?WE1CZDVJQWxtbElnZjY2STZaam96cG5Eajl4TXB2OHBBRCtHNDVVNE1EMDk0?=
 =?utf-8?Q?0J3xwf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUFJNnJvWElpK3FlLzFzZjUrNlBzRmoyeGlwMHkwVDNXeTNXaW9paUttR2Nv?=
 =?utf-8?B?MlQxZjBNd3NveW5HSHJDbGF5QXl5WGpqTzFLcXRNOStVL3NGMFBIZjBZOG1U?=
 =?utf-8?B?N2FMTVJqckYrR2NYeVhvNjVNOFZYQmEwQS9FV3lySWYxekl3VzZXMnZYNGNu?=
 =?utf-8?B?TnNoam9FOGdnTU1GNjM2aUF4MnR6eHBaWHA1RG9hOW5TSy9ldmdydjFNakpy?=
 =?utf-8?B?TEtiMWdvRDBZdVNTOU1nMHVwSGdqaWVjdG5pVFlTalV3dlVrVS9uaEgrN2Vh?=
 =?utf-8?B?TTlrQnVPTVhvNVJEdlgvUjJYOE1yMktHTnJtRlkrMkphVTdWOGg3WXlOdXY3?=
 =?utf-8?B?WFAxaU1WcHFVdGZXcjZoVDB3QTBzbmMrdlRwcVR6VFpyNUFpZDVzSzdtZmNO?=
 =?utf-8?B?aVRrclZvNjl2MGJnRTA1eFlMRDkwS2lsUFRYQThGbTVNeHNRYzAydXpRSDFW?=
 =?utf-8?B?V3BuQUlqcGJUc2o1UXN4NnhUUndJZ1dMT3RGNEs2QzBxSWpsQlYxNnFkSUpU?=
 =?utf-8?B?N2NtRUdqV0h1RkV1SU5uWXpFNTFXTkFUN0cwanhqcGE0V2FNYWxRZWxMR3lh?=
 =?utf-8?B?QS96R1Nia2RmVzQ2c2dCbnpnZzFGSU9DZHhWN1hNc1BucUpuQ1BFc1ppb3c5?=
 =?utf-8?B?NjNFTmxVT21qRUZXL3U5K1BlYURWWEtWTUpTWEorTXkvSW5XTHVtTy9Jam01?=
 =?utf-8?B?RG96eVpnUkRxNXp3SWxnVVJoZnloenRTb2hRbWI5U09Zb0FLR1V1R3ZuQ2sz?=
 =?utf-8?B?Sy9VbzM3NkNsb0c4STNNWXdnWGIvRC9mc0FXbFBEcTM3Lys2ajgyL2xTNnM0?=
 =?utf-8?B?aDc5MWZtNWxjLzNMalNoOFVWanU3bE5mU3YrVmc0eDBOQkFFSmxWWWo4bzZ2?=
 =?utf-8?B?U1F3M0FkNnVuUU1BendYcHc3bm1mK2xIY2dZOUc1dTIwck0vWkZKMlRnV2k4?=
 =?utf-8?B?MzFqd1Vnb3lGYWx2OEQ4ODhmZDZNVUVCdTVhaFRzMkM3cldmSEJ1K28rUitT?=
 =?utf-8?B?M3dCQi9vM2tQTjQ5STY1VFlhZnpsWHIzek53YmYxVFluTEFGaGZxMEYvRWFN?=
 =?utf-8?B?WmdMLzZLMHcyTGYxbUthMEl2MHh1eGowSUFNMlpxbFNKZWZSVE9MR2x0eFp1?=
 =?utf-8?B?MkdLckw2WVBVL04yZkoyZXZnNGN6SUh1SFhXWUgzRFBjR3dhdWlKWmltM2kw?=
 =?utf-8?B?aUZrcmtiTStCT2V0b0NWQ2syMndqRURuN0l6ZWU2M0FMZnRmTk9LSzZEaVF4?=
 =?utf-8?B?U3dLaUxtUG12T3VjYkdXM3l2OHQySmYwaFNjK2FtL2FVZk5TaGJrL0ZrMzU4?=
 =?utf-8?B?b2h2L05YY1lIL3ZZSklKd05OWWdtUzFYVDJwOWFCSlRGcG5tdW1FVVN3cC9Q?=
 =?utf-8?B?K05HYmh3b2NZSUtvNU82NHJ0bVFXZWI5WEVrQVAySkRmSkNadllSb1dQOWZv?=
 =?utf-8?B?VnZTdS83bk1XWFhUb2Eyc3FGckMrdXBvS2hNWDdKSlFWWlpydytRanc1QUVQ?=
 =?utf-8?B?UUlXS3dVM1gyN3ZURTNaZmJPN3E0clZCenVXUUViQ1dxQ1BqbjY0d3dYQ1l1?=
 =?utf-8?B?U1hpMmpRSm4wUE9XclRXQ0JTeitIa2hkTXhZZEVyVzMzWk9TUFR0Z2hKRVIr?=
 =?utf-8?B?MFFpaGoyZWI4T1lYRFZONkU5UExta3U4Tys2TUZrSHN0bnQzWUo0Z1FqS29k?=
 =?utf-8?B?NExDTnVLOXRCT0VtRmswWldwWlBLQzArc3JHTVJUK2lpVk4yNDBkVnpSdm1y?=
 =?utf-8?B?bHN3WUQyNHluYk9rQU9XOUZOTytIVjRMSWJTWHFZeE9zYnZxU0t2ZE00YWxD?=
 =?utf-8?B?bFNrZUpvc3NqODQwN09zUE5xWHFUTFBoUjFTTkErTWhIdDlEYk9hSXpSUHFz?=
 =?utf-8?B?Z254VlQ0YzdVWGtXZmdQMFZqc1M4a1NXOEpjdVlEb2o3RVdsWHFwLzBjbmJp?=
 =?utf-8?B?UUx1VUtjM2VZMmJDdDhuNFYwRWZNdTc4bDlrMDJNWjZic0czK0VVd1kyVE1h?=
 =?utf-8?B?N2UremxNekI0VStQSDRxN3g1ZVpwcmFDNVdpWEJFcDRMWG5rK0loRHBIZDdu?=
 =?utf-8?B?QnhBakZRcHBYbUs4SS9SbG84Y0VBbDhtcStacFpVcWNYNXNKMjhjMzVpbVUz?=
 =?utf-8?Q?GgLKYumx8BivDKGH0v7a0wEa1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2f584a-47f2-4098-1813-08de00158c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 11:36:07.6946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzF5lI2u4LotImLT/FxsJVQR9Ydt+QZnke5uDI35ZCAQjaUPq7svnXJhFUKaPcoCokWEUbTCuSSCLV91XipxwKoV01frw5py2ROJiFZiq0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16360

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0b3BoZSBKQUlM
TEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4gU2VudDogTW9uZGF5LCBTZXB0
ZW1iZXIgMjksIDIwMjUgNzowOCBQTQ0KPiBUbzogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VA
cmVuZXNhcy5jb20+OyBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+Ow0KPiBuaWtsYXMuc29kZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kQHJhZ25hdGVj
aC5zZT47IFBhdWwgQmFya2VyIDxwYXVsQHBiYXJrZXIuZGV2PjsgQW5kcmV3IEx1bm4NCj4gPGFu
ZHJldytuZXRkZXZAbHVubi5jaD47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5l
dD47IEVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47DQo+IEpha3ViIEtpY2luc2tp
IDxrdWJhQGtlcm5lbC5vcmc+OyBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENj
OiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE5pa2l0YQ0KPiBZdXNoY2hlbmtvIDxu
aWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5l
dC1uZXh0IHY1IDMvNF0gbmV0OiByZW5lc2FzOiByc3dpdGNoOiBhZGQgb2ZmbG9hZGluZyBmb3Ig
TDIgc3dpdGNoaW5nDQo+DQo+IExlIDAxLzA5LzIwMjUgw6AgMDY6NTgsIE1pY2hhZWwgRGVnZSBh
IMOpY3JpdCA6DQo+ID4gQWRkIGhhcmR3YXJlIG9mZmxvYWRpbmcgZm9yIEwyIHN3aXRjaGluZyBv
biBSLUNhciBTNC4NCj4gPg0KPiA+IE9uIFM0IGJyZGV2IGlzIGxpbWl0ZWQgdG8gb25lIHBlci1k
ZXZpY2UgKG5vdCBwZXIgcG9ydCkuIFJlYXNvbmluZyBpcw0KPiA+IHRoYXQgaHcgTDIgZm9yd2Fy
ZGluZyBzdXBwb3J0IGxhY2tzIGFueSBzb3J0IG9mIHNvdXJjZSBwb3J0IGJhc2VkDQo+ID4gZmls
dGVyaW5nLCB3aGljaCBtYWtlcyBpdCB1bnVzYWJsZSB0byBvZmZsb2FkIG1vcmUgdGhhbiBvbmUg
YnJpZGdlDQo+ID4gZGV2aWNlLiBFaXRoZXIgeW91IGFsbG93IGhhcmR3YXJlIHRvIGZvcndhcmQg
ZGVzdGluYXRpb24gTUFDIHRvIGENCj4gPiBwb3J0LCBvciB5b3UgaGF2ZSB0byBzZW5kIGl0IHRv
IENQVS4gWW91IGNhbid0IG1ha2UgaXQgZm9yd2FyZCBvbmx5IGlmDQo+ID4gc3JjIGFuZCBkc3Qg
cG9ydHMgYXJlIGluIHRoZSBzYW1lIGJyZGV2Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmlr
aXRhIFl1c2hjaGVua28gPG5pa2l0YS55b3VzaEBjb2dlbnRlbWJlZGRlZC5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRlZ2VAcmVuZXNhcy5jb20+DQo+DQo+
IC4uLg0KPg0KPiA+IEBAIC0yMTUzLDYgKzIyMTAsOCBAQCBzdGF0aWMgaW50IHJlbmVzYXNfZXRo
X3N3X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAgIGlmICghcHJp
di0+Z3djYS5xdWV1ZXMpDQo+ID4gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4g
PiArICAgSU5JVF9MSVNUX0hFQUQoJnByaXYtPnBvcnRfbGlzdCk7DQo+ID4gKw0KPiA+ICAgICBw
bV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsNCj4gPiAgICAgcG1fcnVudGltZV9nZXRfc3lu
YygmcGRldi0+ZGV2KTsNCj4gPg0KPiA+IEBAIC0yMTYzLDYgKzIyMjIsMTUgQEAgc3RhdGljIGlu
dCByZW5lc2FzX2V0aF9zd19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgIH0NCj4gPg0KPiA+ICsgICBpZiAobGlz
dF9lbXB0eSgmcHJpdi0+cG9ydF9saXN0KSkNCj4gPiArICAgICAgICAgICBkZXZfd2FybigmcGRl
di0+ZGV2LCAiY291bGQgbm90IGluaXRpYWxpemUgYW55IHBvcnRzXG4iKTsNCj4gPiArDQo+ID4g
KyAgIHJldCA9IHJzd2l0Y2hfcmVnaXN0ZXJfbm90aWZpZXJzKCk7DQo+ID4gKyAgIGlmIChyZXQp
IHsNCj4gPiArICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3QgcmVnaXN0
ZXIgbm90aWZpZXJzXG4iKTsNCj4gPiArICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICB9
DQo+DQo+IFRoZSBlcnJvciBoYW5kbGluZyBvZiB0aGUgcHJvYmUgc2hvdWxkIGJlIHVwZGF0ZWQs
IGFzIGRvbmUgaW4gdGhlIHJlbW92ZSBmdW5jdGlvbi4NCj4NCj4gbmV0LW5leHQgaXMgY2xvc2Vk
LCBzbyBJJ20ganVzdCBwb3N0aW5nIGhlcmUNCj4NCj4gQ0oNCj4NCkhlbGxvIENocmlzdG9waGUs
DQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50LiBJIHdpbGwgbG9vayBhdCB5b3VyIHByb3Bv
c2FsIGFuZCBhZGQgaXQgdG8gdGhlIG5leHQgcGF0Y2ggc2V0Lg0KDQpNaWNoYWVsDQoNCj4gPiAr
DQo+ID4gICAgIGRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoJnBkZXYtPmRldiwgMSk7DQo+ID4N
Cj4gPiAgICAgcmV0dXJuIHJldDsNCj4gPiBAQCAtMjE5Niw2ICsyMjY0LDcgQEAgc3RhdGljIHZv
aWQgcmVuZXNhc19ldGhfc3dfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gICB7DQo+ID4gICAgIHN0cnVjdCByc3dpdGNoX3ByaXZhdGUgKnByaXYgPSBwbGF0Zm9ybV9n
ZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPg0KPiA+ICsgICByc3dpdGNoX3VucmVnaXN0ZXJfbm90aWZp
ZXJzKCk7DQo+ID4gICAgIHJzd2l0Y2hfZGVpbml0KHByaXYpOw0KPiA+DQo+ID4gICAgIHBtX3J1
bnRpbWVfcHV0KCZwZGV2LT5kZXYpOw0KPiA+DQo+DQo+DQo+IFRoZSBwcm9wb3NlZCBmaXggd291
bGQgYmU6DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jz
d2l0Y2hfbWFpbi5jDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoX21h
aW4uYw0KPiBpbmRleCA4ZDhhY2MyMTI0YjguLjBmMTdjMmUxMmNlYSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoX21haW4uYw0KPiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2hfbWFpbi5jDQo+IEBAIC0yMjEzLDExICsy
MjEzLDggQEAgc3RhdGljIGludCByZW5lc2FzX2V0aF9zd19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgICBwbV9ydW50aW1lX2dldF9zeW5jKCZwZGV2LT5kZXYp
Ow0KPg0KPiAgICAgICAgICByZXQgPSByc3dpdGNoX2luaXQocHJpdik7DQo+IC0gICAgICAgaWYg
KHJldCA8IDApIHsNCj4gLSAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYp
Ow0KPiAtICAgICAgICAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLSAgICAgICB9DQo+ICsgICAgICAgaWYgKHJl
dCA8IDApDQo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9kaXNhYmxlX3BtX3J1bnRpbWU7DQo+
DQo+ICAgICAgICAgIGlmIChsaXN0X2VtcHR5KCZwcml2LT5wb3J0X2xpc3QpKQ0KPiAgICAgICAg
ICAgICAgICAgIGRldl93YXJuKCZwZGV2LT5kZXYsICJjb3VsZCBub3QgaW5pdGlhbGl6ZSBhbnkg
cG9ydHNcbiIpOyBAQCAtMjIyNSwxMSArMjIyMiwxOSBAQA0KPiBzdGF0aWMgaW50IHJlbmVzYXNf
ZXRoX3N3X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgIHJl
dCA9IHJzd2l0Y2hfcmVnaXN0ZXJfbm90aWZpZXJzKCk7DQo+ICAgICAgICAgIGlmIChyZXQpIHsN
Cj4gICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3QgcmVnaXN0
ZXIgbm90aWZpZXJzXG4iKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAg
ICAgICAgICAgICBnb3RvIGVycl9kZWluaXRfcnN3aXRjaDsNCj4gICAgICAgICAgfQ0KPg0KPiAg
ICAgICAgICBkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxlKCZwZGV2LT5kZXYsIDEpOw0KPg0KPiAr
ICAgICAgIHJldHVybiAwOw0KPiArDQo+ICtlcnJfZGVpbml0X3Jzd2l0Y2g6DQo+ICsgICAgICAg
cnN3aXRjaF9kZWluaXQocHJpdik7DQo+ICtlcnJfZGlzYWJsZV9wbV9ydW50aW1lOg0KPiArICAg
ICAgIHBtX3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYpOw0KPiArICAgICAgIHBtX3J1bnRpbWVfZGlz
YWJsZSgmcGRldi0+ZGV2KTsNCj4gKw0KPiAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgIH0NCj4N
Cj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KUmVuZXNhcyBFbGVj
dHJvbmljcyBFdXJvcGUgR21iSA0KUmVnaXN0ZXJlZCBPZmZpY2U6IEFyY2FkaWFzdHJhc3NlIDEw
DQpERS00MDQ3MiBEdWVzc2VsZG9yZg0KQ29tbWVyY2lhbCBSZWdpc3RyeTogRHVlc3NlbGRvcmYs
IEhSQiAzNzA4DQpNYW5hZ2luZyBEaXJlY3RvcjogQ2Fyc3RlbiBKYXVjaA0KVkFULU5vLjogREUg
MTQ5Nzg2NDcNClRheC1JRC1ObzogMTA1LzU4MzkvMTc5Mw0KDQpMZWdhbCBEaXNjbGFpbWVyOiBU
aGlzIGUtbWFpbCBjb21tdW5pY2F0aW9uIChhbmQgYW55IGF0dGFjaG1lbnQvcykgaXMgY29uZmlk
ZW50aWFsIGFuZCBjb250YWlucyBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiwgc29tZSBvciBhbGwg
b2Ygd2hpY2ggbWF5IGJlIGxlZ2FsbHkgcHJpdmlsZWdlZC4gSXQgaXMgaW50ZW5kZWQgc29sZWx5
IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aGljaCBpdCBpcyBh
ZGRyZXNzZWQuIEFjY2VzcyB0byB0aGlzIGVtYWlsIGJ5IGFueW9uZSBlbHNlIGlzIHVuYXV0aG9y
aXplZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgYW55IGRpc2Nsb3N1
cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQg
dG8gYmUgdGFrZW4gaW4gcmVsaWFuY2Ugb24gaXQsIGlzIHByb2hpYml0ZWQgYW5kIG1heSBiZSB1
bmxhd2Z1bC4NCg==

