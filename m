Return-Path: <linux-renesas-soc+bounces-29774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yErACZ2kummyZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:11:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC002BBFD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B045B30179D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339613D75AB;
	Wed, 18 Mar 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vlZyziAI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156CA3ACEFF;
	Wed, 18 Mar 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839292; cv=fail; b=Tpz4v+upnTFn8QFS1T4TaMNtSVcJaTO85VpkdBc4Io706QGiIXzjWGuJyqzuxK26luuuh2T7Hnvm0pumLEHfLrY30EOYRNHRIQ2lvSVfe054+fs1cPzt7mcL+O6OVyvTSHTY9kG2WqJPaSq6JaMkLbOA7OYT7FU+a/25SxniX1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839292; c=relaxed/simple;
	bh=GPF/YLfnUWuw34hsUvqxl7lOY8/jBTz2EiG3X64ebFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZLoVtZsXoqVu6f6iT0L4D0gpF6awLYc7gZlHz7HHpb6lQyV368+Kr4YW29DWVwlO3DX+8nP3N8xlJJ8u7fkwJmu4AiAPVkaoTXbuJr64BHFY/eybrq43vG/fpWgbM/RYtMykz73KxMwe1j/jigWBYBOWWyutYnJOTplSJu8oEEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vlZyziAI; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca7jJqx2n9oOzkzP7Rc93s63fkcX/qfCo71Cupcwahuwc3oRYlo6FcSyTCUE21qmNSyCHZAxWw5lL5N4G274iR9OyiMwoo9qaWgvetsb16781kM7gK46i3etyYSVmRRjTg2R7kgKksw8pw7ikevn2itftjs3XDhlmvXhdVKTRVnfWC6EYbdCU6y5XhveLSKEUh206sO0mIJnqZHvZlJc6vdCJHXXD5bdJ2t8fsR7X/q20gz4bhZgMF1wWdVjr0Q9idrstvOUpNVStFrVaE6ksQu5ikhXA0HeKiA48F3NEH092n2OVXLu8Ma3YGX/Uao+mc2QhdYjLfSnQzdww1hfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPF/YLfnUWuw34hsUvqxl7lOY8/jBTz2EiG3X64ebFM=;
 b=RlktJC2FLp9XGcM0c7iF+adKpTet/s5SYePoghEv898qGT4dlztr92ceHQniURjt/EcG3ELbTyRv1JpDB0QIrpTCjnpgEpP6Lu8Tmqh8nMRNUD/GuZabafKrdMbIWfTtOvmtPBRozOsWpuEI9oGoA2qWZMleC6hS/GEqva/ruk9u/6voE5rYpdDUUKa6Su6gYHwArDx21oaBIZYFdJU9DH87k8lQdgijBgaLkKSk/81tdUTK1ZIvH0/fHkrcorFAZz/ARrQh3SY8NYsDHk5ss9e0rTWZO9TEZ4067xUhXK/EGAj5Jalpgvd5kOcf2I8SlfcPMwfdptNzTGoLBMeHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPF/YLfnUWuw34hsUvqxl7lOY8/jBTz2EiG3X64ebFM=;
 b=vlZyziAIQG2nGHTfc9kBHOKcg9Q/nC8A1G6JZ+i1kZp1d4OlNQUaRZ0kMsj1askcBasPDRLVLIIEY9jCWRiftd86++8CUNK9aj+IAywdfxxMt8jegW172DtzSfi7fWF3lEPrKbvK88eJDZhNkmLNe3K3bQLHxiCq8Jcf9IicPdU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14850.jpnprd01.prod.outlook.com (2603:1096:405:250::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 13:08:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:08:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Pavel Machek <pavel@nabladev.com>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR
 string
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed
 MODULE_AUTHOR string
Thread-Index: AQHcts7pZuw6Ks9jpUyRaoUGm0idjLW0PTQAgAAFcKA=
Date: Wed, 18 Mar 2026 13:08:05 +0000
Message-ID:
 <TY3PR01MB11346D89F6F7C332FEF0D08B3864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW1ROF3VdKzXVNeKtPZPEwX4MHD-kqdunrNYKBprPgPWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14850:EE_
x-ms-office365-filtering-correlation-id: 2b577da9-2e92-428c-9a28-08de84ef64ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003|7053199007;
x-microsoft-antispam-message-info:
 yM4OOYpdXWnOJseZdjCDPEkcmFH6VzsbHB/DrywhxdKn67IVwzqVZiYqIG4ca8H+X9+b+RjUXeGsoBIxOOz3zx9TEvPnsqaBoqTxOUPSbefo/KZ+9Dwz0b96Nm2r3qPExy4ysJhfKdfpvtaSFOzMBdekJv2zmCqmWJ5FqFyu8kLEBApRvviKQwLpoUbhaXualEjp9m9eqD/2hNdlXo998SXDFPtEYnyNvRNor/qs9+lIi3sgIzWj/MxAiv+6l1YgX+P3e2Ckr30aIBUp+CTucVpFVzQT+y4UkewJyb622bZtJlp+b3bvLNw4Fplowtsd/rTGBwZ+p1gZSb8FagzlcReAyaR4OBUMU/amVrcCe+6Htsu/5rDaKUPjPHFLWZZ7BJpnP8XHYchaAAn+4Gs78YoGxhmbkOdnq+MFLHNDT8G7cIqSst7bAQ/6potojXCGfQHH7aSIwJw5oLwpRrTeJnYjyXv4W5LcqtN+6Byj5cbkK9vgGpD3dlBAZjhlsOccn7M7Pvm3GLOto/byvMXRudnXprwlMkzKCWAjR54dQSEpi2dlDOsWjwZJ590b0UfPKAhLce8/Y4Ow5hAmuJIux9hB8l33WB1ieu6LkTA9TrBcLwDhcVxS1BtWJupsf7X0yR0vTKHfvvNbXz4dYuYGSI+GY9dFwJ5aYX1sN9yNiqRHGqMBzUfQ/LfHugGH7tkIxHe9v3yRi1B3A+JYiVaJQrLTJiKJQJ0BVh3V6NwuGi9iaJdxSWnxDHwUx4yt7QVF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qm5nTXBLbE5HRlFqUUxUdUdQUFRVbVVERVJPWnZMTGREWVZZZ3FxazZHS0ZY?=
 =?utf-8?B?U2M1R0dRN1E5TEUxZm9vdzZ5WFQrSTJGTDZtYTVaTmc0eHVzQjZSeW1odHRY?=
 =?utf-8?B?SUxQTWd6bWdRbWRpS0Joek10UisyRUVSVlRTSHlUMkFQTlFpamV2THpwTUUx?=
 =?utf-8?B?ZitpdEFoVlNja1o0MWo1SzJWazZUblRMYWdwaFdSZUFFWm5rWHVZRldYVzlS?=
 =?utf-8?B?ZGtLelRkZVJjYjVBdWlWSHNEU1U0TEdyZnVoUW9OTkdEdytPRFZUVlJadDhD?=
 =?utf-8?B?NDF4dGVKdzdNd1Jyejg4eFlGc3AvRU9tQ2Q2clZoS2xlSzk0bWRpTThJdklB?=
 =?utf-8?B?NS9xMkRuMXg3YnJlVUcrUmw2LzgzUE5aUm5FaFRITTVMa1VXRTUxVDlZelJF?=
 =?utf-8?B?eWttV3ZUSDJjUGdSTWY4dERxMWxpcmcwNXl6R0tCdjFJbjhjUWNjZk1wSmNl?=
 =?utf-8?B?Q1cwN0dUQmNqN1JJTU9WYnJTeU1FYTJkc1JsTkgwUDBOS2ZmTkRISzNMZFV3?=
 =?utf-8?B?NHlFSnU3M3JWY3BLUWxWSWw4UWoxZzZkSzBVbHdvRjBKU1g1RUJYd2NQcjFm?=
 =?utf-8?B?UTJtdXpEdTduMHcwUUppeEowZGlaaW1lQWxsNnpYY3kxSm1Ra0tvbnNXdE1o?=
 =?utf-8?B?RVFxbnd4NVN3YWFoRE50cE1vd016OGREM1M5Zno5aDZwWEQ4czBoRExiZksw?=
 =?utf-8?B?eVFKTHJXTGVFUzdkQVJ0UnZGYlU2TExhSU5raXpHbXFTTjJQUmFCNHc2RFcr?=
 =?utf-8?B?Y0ZMa05tTVZmaXZIWnRYWlFHNXJyZ0NMRjFwcHladXg4YllqemlhNS9rYWU1?=
 =?utf-8?B?aDlKMmFiUWozNTYvbkVwZzZTSFJFbnBtNlNRT0dMRlBwWWxuVXZoc3R4Qkdq?=
 =?utf-8?B?bFFRWFp1MkhXL3hEWSt1SThYZnNsRFpwTFBsNk93V0JnTDdjVWJZcG44T2Ni?=
 =?utf-8?B?TW5uc3JRVHE5V1lNSFlPVFVHaG5vMStTKzhlbW9yNEYyQlZkcU00Y2k0ak1F?=
 =?utf-8?B?ZkRLeXBPZnFic3Y0aXdvL3J1Q0lnVndLbE13T0tVdFJRek9MRktLb3ZOa0JH?=
 =?utf-8?B?TEpGczFIMEFaZTR0QnkyeTJLMkRyWWlkRUVSRXRpWVZ1bmwvRHZFeElqOHNM?=
 =?utf-8?B?bG45U1hiZk90amZTWWI4U1BSL2ptbTd1MDRnNmxhWmJsY2dnckJPSlIxZmF5?=
 =?utf-8?B?K1RJbzkxVkl6VWNURU9GOW1aSEhEN0d2OGM3WUZreVgxbGovY0MzQ2dsYTVZ?=
 =?utf-8?B?N0xvS2JXL3Vqd016QzJZZU82Z2ZEMURxdmZOandZR08zb3d1VWl0aFVQSW0z?=
 =?utf-8?B?eUN0VjFXZ0RJQ25PbUFqd1k4YmUrYUt0b2k5WVkzbXNsRnVQNW1pWFlOcUFr?=
 =?utf-8?B?NVhvYUxwMXdDNUlTN0J1ZU1mQjZVa04rK1VYeEh2QUppOVlPOFovVHBkdVMr?=
 =?utf-8?B?QWxEMG8zQktRNnd4c3hDVWJwbFBjWC8zakNheUpZMFVibnZyZTVJL3JBS1d4?=
 =?utf-8?B?dWl3dnNkNkpBY3F3Rmo2dnZ0aURMeFZlVFJrVS9zZlFPc055M1ptVXB2RmRq?=
 =?utf-8?B?VGNwWUNZYVdBRmdxM005MkpNaE9qNit0eStVTVQ5NVNMNDFoL2FYUGxPb2xz?=
 =?utf-8?B?cHVEQ2JmUFQyY0lOMUR4aUtQV2wxNjNPK3pDUHpiT2FHeG5XcGg3Q0ZPdWhO?=
 =?utf-8?B?OFkzekZaUkpxTGZaRzNBcEtiWWdud1VQU0txdWlWeFZKVjBnYjQ0bDh3VWJD?=
 =?utf-8?B?SnltMzNxUWkxUXhKeUM5MWRSK3ZRQWc5VU9UMzlJZVVQaHB3Zk0weXRiVWZU?=
 =?utf-8?B?M0ZDeVlaRkV1MnVQQ29PSUJaZi8zKy9WVyttYmo5dGVMTjA3KzJoRlRUK0hI?=
 =?utf-8?B?YmlrbnNrcEF6bWhDNW15dW9JTjc2TGFPeWFtUkE0eHdtRlRueC9SWFhzSjhL?=
 =?utf-8?B?RUk1c0RuNk15ZUsxNEhHUWNFb0ZGQmEwNHQ3WTNvbEVNUjh4SWlHbUdPWlN0?=
 =?utf-8?B?Y0FnMnMyZWVQUWVreTNCQ2sxU0VnTlEyUm1BS2FOa0h4Z3NpWm5GZ0s3Z0Jz?=
 =?utf-8?B?MWxZdDlLeURvMzhTdmdSZHpZQVdta3R5dVhCRDFUa1pPbGlZZjdid01PUE9S?=
 =?utf-8?B?dHZaeUNMSGNLK01UcFRnU1BlU3R4SWdzYWdwMm9Jdk5Ca2pkcGdvLzVDRXlG?=
 =?utf-8?B?NUUweVo4L3FacVhHbTloblJnLzh0RGo3aEVrdG9TNkNCWjBPdlJxL3BJOEps?=
 =?utf-8?B?TTN3WUVaMDZFazZtaHN3dThBMFBRdlU5cGFOM2RFeTJza2VWNXE3ak4yS3gx?=
 =?utf-8?B?ZWt0QkhVaVMrQ1JqeDdMQjZjSHlNaUdDWEFlMUhzWCs5cTdtYzVTZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b577da9-2e92-428c-9a28-08de84ef64ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 13:08:05.5850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDdvEKu8sKiUfmvQJ5KJSxA5h93uVE9ZSOnXwvqE2pSYBdkEglLIclkqM/VtnjAs3z+yeyILx2bV6yKgwPM1/UTMAj92m4THUrSBZSbJm28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14850
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29774-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email,glider.be:email,bp.renesas.com:dkim,renesas.com:email,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 7BC002BBFD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYgMTI6NDgNCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gcGh5OiByZW5lc2FzOiBwaHktcnpnM2UtdXNiMzogRml4IG1hbGZvcm1lZCBNT0RVTEVfQVVU
SE9SIHN0cmluZw0KPiANCj4gT24gV2VkLCAxOCBNYXIgMjAyNiBhdCAxMzowMSwgQmlqdSA8Ymlq
dS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBGaXggYSBtYWxmb3JtZWQgTU9EVUxFX0FVVEhP
UiBtYWNybyBpbiB0aGUgUlovRzNFIFVTQjMuMCBQSFkgZHJpdmVyDQo+ID4gd2hlcmUgdGhlIGF1
dGhvcidzIG5hbWUgYW5kIG9wZW5pbmcgYW5nbGUgYnJhY2tldCB3ZXJlIG1pc3NpbmcsDQo+ID4g
bGVhdmluZyBvbmx5IHRoZSBlbWFpbCBhZGRyZXNzIHdpdGggYSBzdHJheSBjbG9zaW5nID4uIENv
cnJlY3QgaXQgdG8NCj4gPiB0aGUgc3RhbmRhcmQgTmFtZSA8ZW1haWw+IGZvcm1hdC4NCj4gPg0K
PiA+IFJlcG9ydGVkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQG5hYmxhZGV2LmNvbT4NCj4gPiBD
bG9zZXM6DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvY2lwLWRldi9hYnA0WTJGVnNwVWdF
cENUQGR1by51Y3cuY3ovVC8jbWE4MDQ1NA0KPiA+IGRmMTI5YzhjZmNiZTQ4ZDc1ZjNiNGFiZTY5
NzkyNWM2ZjgNCj4gDQo+IFRoZSAiL1QvIy4uLiIgc3VmZml4IGlzIG5vdCByZWFsbHkgbmVlZGVk
Lg0KDQpUaGFua3MsIHdpbGwgdGFrZSBjYXJlIG5leHQgdGltZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0K

