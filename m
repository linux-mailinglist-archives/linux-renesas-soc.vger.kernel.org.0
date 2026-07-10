Return-Path: <linux-renesas-soc+bounces-35059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AXz4CDMDUWq+9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:35:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62D73BC93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=dMJYPkDj;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DFCD302ADAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F5334BA49;
	Fri, 10 Jul 2026 14:31:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBCD24677B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 14:31:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693889; cv=fail; b=UcL+mTJgNexK3/Ost7XaFL6kTuv5pe+ZsqnQlNK/QfRfae3BzfjcqPDhrN81ry/vBCBYDTbh9IMAneUNxS9JtBqucHh7RxWoaRXLrg2qobn16/l38SNLHnSvgMyRA0Eday12qqYgUqkhTBEFJwRniKXtEvcKWoSiKlMoKz2Vc1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693889; c=relaxed/simple;
	bh=IVvU/m6IPfL7yIxylVY1d9XjiroBW1tu90Ne4ijEWGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l3NMMRTjyhFR/qTAZFUudSGKMHyzpSnUUn93IvfhjGPJO0KwkXDfZzOB4h+iltXfKJwjuvXNZfdAYeuOd9WaNGa07Su/S3Ic6z/9xddxOy+GgutqvT5HtoVJolk4LS8e7CiprRsa6xdGKCs4ehNd2bsyhUtWZXtnU6bAr7c78xM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dMJYPkDj; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLut1mPOXSlzwySGUdqewKvJqdLicW83iupX16j9P5GNhZ0sO06trUqKrjHcrGF1Se8RZckJWz3uxTFV5btC4CqmaKMQjo8uTDtgtN7Q6QCdX5B2ObL2UTJC9ecUeX4wn2y4dGJrxPcvINngWizbpvk++97Xroy1YFqz2BZp2PAzf5l8WXLgiw8onQpnUlyqa4eQ4vCLSbEcie6klo134p85GrQ56w/7+w9Oz+Ogxw3Msx1+f0meOyyHml7SOYrW1egp455mPrhq81wQimV/X1Pnpv2LPSDsQugD+AqfAK7Y5Zk3WjbO47sFbJeBn9tWAG5aRXFeT20ZJHi+r/rnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVvU/m6IPfL7yIxylVY1d9XjiroBW1tu90Ne4ijEWGA=;
 b=Iwn245R4bkewopOjMRzHCv+hi2CR6t31UNou/42XjnJPVMV9yMyggLlIV1OqsBsWgjdAkfR90hKAsizwLEkLAPjmhheY3LGs8hoJubNYuKsyTGz9cT188Ty07ZD7KUCTkR4gHWhGV6C97MDbtRNaxive2w8VOWsnlmvAZykozgSAjv8hSMZ5xXbRXACLMhNaINFJbafwzEZs5UQROoBshpYzkpO3gN4qYdzMemqhthFfwPYssdOZZif4Bo641Ui+8DU1jHalRqF27eXj5cjiZ1sYW/isY6dzkBnO32bUk7+01Fe4Olw5cLhHgnu204JY58jyk0n2vd9CGjmS3ZpfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVvU/m6IPfL7yIxylVY1d9XjiroBW1tu90Ne4ijEWGA=;
 b=dMJYPkDjOJHLM9F5400AgOeAFuvIwQAkuGbXIZCZltdeYkNTBEqpTLBUNwZCJeJsMMmZAv790suS3P9VbjgMjXg4/QInXsYHmbyYDM0BQKOPswQbEJ221T0hJ8wia/tKSd+zPZ+z4It/oeHXVGlSl3s6VJcnkekjU94O8tY1yBw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11550.jpnprd01.prod.outlook.com (2603:1096:604:238::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:31:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 14:31:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 52/60] drm/rz-du: Convert to atomic_create_state
Thread-Topic: [PATCH 52/60] drm/rz-du: Convert to atomic_create_state
Thread-Index: AQHdD5mEtpcnp0HZPU2yrCvIevvfLLZm0fmg
Date: Fri, 10 Jul 2026 14:31:24 +0000
Message-ID:
 <TY3PR01MB113466EB8E5118D6708C79FA186FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
 <20260709-drm-no-more-plane-reset-v1-52-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-52-302d986fe5f0@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11550:EE_
x-ms-office365-filtering-correlation-id: d3796cab-0e0e-432b-b866-08dede8feb5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|38070700021|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 19nR8KAt4LOcVWpKV1qn6h3VILtp777TfQpdUSczixBGfQP++64Y7Dm8/KLvfHf+6z5X66p4dYESVOdmeMkpOFzqHp6t+8g842rCvfhuMjSIJOYQGeQaXfM3GRxNbnZmPpH9LohelL2SfLjk/qCkHc69T65xAY5FxZHKl3mFJrRMNOHPuLl/KiaGcpTmDcWtk0j1tqMD3hAzOaMY65ZqbW7ESGgp+4yBpGm275M/2L0HfLhw4Q9SfSwMbaTfRKVEFjuY1VlXNimswVGYXntMT+T88b6rkwKfqXmhy+QZZld/aD/SSDDupi7ZgV2knr4Oc/KDMKo91rZkFSqLtEUDip7gXMyrBjzaP5ZaSjZ7qcMn3InnGFoDDJyI1u7m0y+FL2ibiXI+588EDJxFVENTr+X3fej8K8jCVAnKJ0CqyPDgO+bsNy1ahHQZol+HIGdqpJlPlH/pn4bMQ+6bfNz8t7U4Qq7CUSvCk759NnYf/XjR12HjxcmbUjf3xFap68nBJHUu9UZ7QM8y7748g5V6kTh6sKb2wW3QK4pNJIc/KECApo9RxeSaXt7j335Im01io0qb9LiyYHNDKIFKWehaXGZ6Sr+03w/CnpxSt29PO3b47GT7V5ibGO+JVvIufiMPXp0TrVLbImYuP+t0yaPMiACE7ccK9M1kZuYUBECiTNb3vEWUzaa+HMXGDGrYagIxGGded2+DGRPhA/FpE1MD2s15Kn5bEDi8ejeX9XCni2Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(38070700021)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGJ3b0dwUUNWWnNFRGZSL241ZEd2UU52OVFIVVpoTnE5Y05PTS84algyWmo4?=
 =?utf-8?B?b2VGY2c1ZmpzYjNGbEVLeEpsOFhXQXZZM3FJQWFydFg3eDVxWE12amxVMXFO?=
 =?utf-8?B?bEFvenJTVy9pT2VveTY2bWg3RXV6cVdwNGdoa0h0ODY3WjRmQzV0SnR6MGZk?=
 =?utf-8?B?OVpUNDdEd29lSlJsMDJxL281SDVNZjQzbUoreW5GWVVreUxmMXU3TDg5T3pD?=
 =?utf-8?B?amJEWWZYTXd1U3dqaUg5TUlTVVlNNG5oUklPQ0xLeVNKR0FKVTk0Qm92Wk5x?=
 =?utf-8?B?aFU0eWFacW9LMU9CK256WU5qcjJHNEtWbTZJOTdvRDROR1ptSWdZM1dNSktD?=
 =?utf-8?B?OVoyeHB3TWtJbUErOTdJM3BuMCtZaFVUWDdpWDM0TFY3V1RZNCt5TzlWYTIr?=
 =?utf-8?B?SjVnbGVkdWVxeEI0N2lvVTJNN0FhMmhqMThmZjNGK3RORy9GdlhuOUkzMVNI?=
 =?utf-8?B?ZUswSWR2M3RyMHhsRVk0RGYrT0ZEODV0MzlwUmw2b1Q3NW5UT09meDJIVDdq?=
 =?utf-8?B?SGIza25FNjFRN2hKMjhicmJpTXorNTlMcm1qdXRjT2ZmbGRZaHJIeEs5dm05?=
 =?utf-8?B?YTlaeEVuVkFQK1JkeHRHWjNEai9DdXR4K0ZLd05KR2tpbURaZSthUTZ0VDYr?=
 =?utf-8?B?N3gzVVdOU1I3ZDVuYk8wNUxYeFFGVElaTzRnTW5KU3FmSzB0WUUxdnZnaUZ2?=
 =?utf-8?B?enBGcncxTW1HZW43cFZtdnFWa0VlcGhvOU1NUVdjRE1ZT3BXSjZYSUxENmNH?=
 =?utf-8?B?cEJtcms3U2phQzh4aG4wTVdjTFpPQlVhQXNvbkdJaytQdXlTUmlZaXowc25H?=
 =?utf-8?B?OCs5K09JcnFPdjdpZ3BUZDVoODdJOGJUNTBBcDNWQmd6dEpXR0Jzcmd2eWFs?=
 =?utf-8?B?RDVYb2JyUFd5RlFjakNLeFFpdjMreUtDOTRGL2hFTWhES0Y0dVBzQkNrTmdq?=
 =?utf-8?B?VjNTbWZCenlqdWlxaHFFU1FrbjY0ajY5UDIrMWIvQVZqODlZK3hJNndlZmpS?=
 =?utf-8?B?bVEvaGp3WEl5RFBKalluNlVEaTI4ZDcxV2NpWi9CTFRhUEZoYWRrU1lNV3hv?=
 =?utf-8?B?MkRiZlNmekZ1eUZyZ0w5OE1zamQwTVBweklxTUJMRzdZaDJ4NkdHMUFKeDcw?=
 =?utf-8?B?anNEV0w3dEZjK3M1UDBEWEVueXN1VC84MnQrMCtMSkF4T1VWZll4VThwWWJ1?=
 =?utf-8?B?VitTNm5WZ1B5bDd4N1JheVdUc1J5Y0pKLzN2SFV4a3JrZVhiUEtoUnBtMFhP?=
 =?utf-8?B?eVVvR0Z0S2wzdzVLRnZKT3MxSEN3WnlTNkl0aXVJY3U5K2lRVnEvdWdoWFBH?=
 =?utf-8?B?RVNsUkptYzRweU42encxa0tNWENQNHZRNWZiYUtjQlZVb1ZrTjVUeFMzSkRN?=
 =?utf-8?B?eEpXQ1IwTjJIU1lsY2JTemgwa1VyRzljd09UNHNvaDE2RnBXY1hYNC95bjgr?=
 =?utf-8?B?cUtUSnZBV1F0QndLTDBJdzlpZ1JhYlZyc2Z4SXdGd01Pa0l5U3ZUQ1lRd2dK?=
 =?utf-8?B?MHNuK3g3UmVLNnMxV3o5TXpGZnJoczEyb1hENlNTMDR4NDMwR0ZtOXlSTzB6?=
 =?utf-8?B?b0c4a3FHTFo1bW94SnhIZ1FDdjh4Vjg3RnVCUHdTN0ZNb1RtSlo1OFAwQWJk?=
 =?utf-8?B?b3VYbFRUTU9MeVJNUEU5N1ZYSjNTc1ZiNlRIVE9RRTFZVDhiTTJjUUNpN2k3?=
 =?utf-8?B?TGJDdXkrNEMwTml4bzhtTkxIM1VkdnprOXFvZHMrTEFjREwwbUw1RFAzQTFi?=
 =?utf-8?B?L3JkMEs0RnVDc092ZWJPYWZFL00yWHpvQzZzeHNZUHFObXo2TnAzZWllZG92?=
 =?utf-8?B?T0NVSFd2c1F4WUdkSnh5TjN1MTBVUWJzcEwzM1BzMTN3V1FtWHVrUkRmM205?=
 =?utf-8?B?U0hyYmRobkhFeWJVSjhNNG1pdzlrUURpWmxVQXlRWmhvVnRmSzVMUTh3dXdU?=
 =?utf-8?B?K1NWQ0hMdEdsa0ViWXVCdUxGZVhhNlpUY3NROVhDSVRaK2x3c1JveTFLbU5M?=
 =?utf-8?B?Ly9JQTRUVjFkYXlOQzY4SDQxalBWaGtXa2ZrWXY0WUVWY1FvQnkwWTU0MVBy?=
 =?utf-8?B?c1RpNkhXSExQUWJnenZHUXdNVG1JLzMzOGJQc0QvNVZKOGdUUUY5VjU2TGM0?=
 =?utf-8?B?czBDZWYzTnVvRTJmeTRuUExiNXZ1VnVIek8yRmpxc25zVHI3Ri9heTZESGRj?=
 =?utf-8?B?RjJZNjNlaWQxTjBEN2t4dm5zTzROalA5SVJwMUFybjh3eUQ4M2kzMkhIZDA4?=
 =?utf-8?B?WlUrKy9lNjdPTDAzYXZpWFFqU0g4MTFOanFaRG9XMDhXSjlidUpWZ2dJMUNL?=
 =?utf-8?B?QTZOMGd1NU5LaDdHQ3FEZmVjcmZBUHh4UUIxSkNURTZoaWlFQU1nYlZIN3Rn?=
 =?utf-8?Q?eqQnmdzPd2DkisRA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d3796cab-0e0e-432b-b866-08dede8feb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 14:31:24.3303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPlEUG/XOxu4hA5VD0MvUHThci5jLuCPCxbaqAqTI6UWdOBFosal8HvL0Ho0niL3x6qZsb2JikjrIFLBTSVfReMT5lVyD9iSPz7I2fUr4yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35059-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F62D73BC93

SGkgTWF4aW1lIFJpcGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA5IEp1bHkgMjAy
NiAxMjo1MQ0KPiBTdWJqZWN0OiBbUEFUQ0ggNTIvNjBdIGRybS9yei1kdTogQ29udmVydCB0byBh
dG9taWNfY3JlYXRlX3N0YXRlDQo+IA0KPiBUaGUgcGxhbmUgcmVzZXQgaW1wbGVtZW50YXRpb24g
Y3JlYXRlcyBhIGN1c3RvbSBzdGF0ZSBzdWJjbGFzcywgYnV0IG9ubHkgaW5pdGlhbGl6ZXMgYSBw
cmlzdGluZSBzdGF0ZQ0KPiB3aXRob3V0IHJlc2V0dGluZyBhbnkgaGFyZHdhcmUuIFRoaXMgaXMg
ZXF1aXZhbGVudCB0byB3aGF0IGF0b21pY19jcmVhdGVfc3RhdGUgZXhwZWN0cy4NCj4gQ29udmVy
dCB0byBpdC4NCj4gDQo+IFRoZSBjb252ZXJzaW9uIHdhcyBkb25lIHVzaW5nIHRoZSBmb2xsb3dp
bmcgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaDoNCj4gDQo+IEBADQo+IGlkZW50aWZpZXIgZnVu
Y3M7DQo+IHN5bWJvbCBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldDsNCj4gc3ltYm9sIGRy
bV9hdG9taWNfaGVscGVyX3BsYW5lX2NyZWF0ZV9zdGF0ZTsNCj4gQEANCj4gDQo+IHN0cnVjdCBk
cm1fcGxhbmVfZnVuY3MgZnVuY3MgPSB7DQo+ICAgLi4uLA0KPiAtIC5yZXNldCA9IGRybV9hdG9t
aWNfaGVscGVyX3BsYW5lX3Jlc2V0LA0KPiArIC5hdG9taWNfY3JlYXRlX3N0YXRlID0gZHJtX2F0
b21pY19oZWxwZXJfcGxhbmVfY3JlYXRlX3N0YXRlLA0KPiAgIC4uLiwNCj4gfTsNCj4gDQo+IEBt
YXRjaF9zdHJ1Y3RfcmVzZXRADQo+IGlkZW50aWZpZXIgZnVuY3MsIHJlc2V0X2Z1bmM7DQo+IEBA
DQo+IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgZnVuY3MgPSB7DQo+ICAgICAuLi4sDQo+ICAgICAu
cmVzZXQgPSByZXNldF9mdW5jLA0KPiAgICAgLi4uLA0KPiB9Ow0KPiANCj4gQHJlc2V0X3VzZXNf
aGVscGVycyBkZXBlbmRzIG9uIG1hdGNoX3N0cnVjdF9yZXNldEAgaWRlbnRpZmllciBtYXRjaF9z
dHJ1Y3RfcmVzZXQucmVzZXRfZnVuYzsgQEANCj4gDQo+ICB2b2lkIHJlc2V0X2Z1bmMoLi4uKQ0K
PiAgew0KPiAgCTwrLi4uDQo+ICgNCj4gIAlfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX3Jlc2V0
KC4uLik7DQo+IHwNCj4gCV9fZHJtX2dlbV9yZXNldF9zaGFkb3dfcGxhbmUoLi4uKTsNCj4gKQ0K
PiAgCS4uLis+DQo+ICB9DQo+IA0KPiBAbWF0Y2hfc3RydWN0X2Rlc3Ryb3lADQo+IGlkZW50aWZp
ZXIgZnVuY3MsIGRlc3Ryb3lfZnVuYzsNCj4gQEANCj4gc3RydWN0IGRybV9wbGFuZV9mdW5jcyBm
dW5jcyA9IHsNCj4gICAgIC4uLiwNCj4gICAgIC5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRlc3Ry
b3lfZnVuYywNCj4gICAgIC4uLiwNCj4gfTsNCj4gDQo+IEBzY3JpcHQ6cHl0aG9uIHJlbmFtZWRf
ZnVuY0ANCj4gb2xkX25hbWUgPDwgbWF0Y2hfc3RydWN0X3Jlc2V0LnJlc2V0X2Z1bmM7IG5ld19u
YW1lOyBAQCBpZiBvbGRfbmFtZS5lbmRzd2l0aCgiX3Jlc2V0Iik6DQo+ICAgICBjb2NjaW5lbGxl
Lm5ld19uYW1lID0gb2xkX25hbWUucmVwbGFjZSgiX3Jlc2V0IiwgIl9jcmVhdGVfc3RhdGUiKQ0K
PiBlbHNlOg0KPiAgICAgY29jY2luZWxsZS5uZXdfbmFtZSA9IG9sZF9uYW1lDQo+IA0KPiBAdXBk
YXRlX3N0cnVjdCBkZXBlbmRzIG9uIG1hdGNoX3N0cnVjdF9yZXNldCAmJiByZXNldF91c2VzX2hl
bHBlcnNAIGlkZW50aWZpZXIgbWF0Y2hfc3RydWN0X3Jlc2V0LmZ1bmNzLA0KPiBtYXRjaF9zdHJ1
Y3RfcmVzZXQucmVzZXRfZnVuYzsgaWRlbnRpZmllciByZW5hbWVkX2Z1bmMubmV3X25hbWU7IEBA
IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgZnVuY3MgPSB7DQo+ICAgICAuLi4sDQo+IC0gICAucmVz
ZXQgPSByZXNldF9mdW5jLA0KPiArICAgLmF0b21pY19jcmVhdGVfc3RhdGUgPSBuZXdfbmFtZSwN
Cj4gICAgIC4uLiwNCj4gfTsNCj4gDQo+IEBkcm9wX2Rlc3Ryb3kgZGVwZW5kcyBvbiB1cGRhdGVf
c3RydWN0ICYmIG1hdGNoX3N0cnVjdF9kZXN0cm95QCBpZGVudGlmaWVyIG1hdGNoX3N0cnVjdF9y
ZXNldC5yZXNldF9mdW5jOw0KPiBpZGVudGlmaWVyIG1hdGNoX3N0cnVjdF9kZXN0cm95LmRlc3Ry
b3lfZnVuYzsNCj4gaWRlbnRpZmllciBjb250YWluZXJfZnVuYzsNCj4gaWRlbnRpZmllciBQOw0K
PiBzeW1ib2wgZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZTsNCj4gc3ltYm9s
IF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZTsNCj4gQEANCj4gDQo+ICB2
b2lkIHJlc2V0X2Z1bmMoc3RydWN0IGRybV9wbGFuZSAqUCkNCj4gIHsNCj4gIAkuLi4NCj4gKA0K
PiAtCWlmIChQLT5zdGF0ZSkgew0KPiAtIAkJPCsuLi4NCj4gKA0KPiAtCQlkcm1fYXRvbWljX2hl
bHBlcl9wbGFuZV9kZXN0cm95X3N0YXRlKFAsIFAtPnN0YXRlKTsNCj4gfA0KPiAtCQlfX2RybV9h
dG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lfc3RhdGUoUC0+c3RhdGUpOw0KPiB8DQo+IC0JCVAt
PmZ1bmNzLT5hdG9taWNfZGVzdHJveV9zdGF0ZShQLCBQLT5zdGF0ZSk7DQo+IHwNCj4gLQkJZGVz
dHJveV9mdW5jKFAsIFAtPnN0YXRlKTsNCj4gKQ0KPiAtIAkJLi4uKz4NCj4gLSAJfQ0KPiB8DQo+
IC0JZHJtX1dBUk5fT05fT05DRShQLT5kZXYsIFAtPnN0YXRlKTsNCj4gfA0KPiAtCVdBUk5fT04o
UC0+c3RhdGUpOw0KPiApDQo+ICAJLi4uDQo+ICgNCj4gLQlrZnJlZShQLT5zdGF0ZSk7DQo+IHwN
Cj4gLQlrZnJlZShjb250YWluZXJfZnVuYyhQLT5zdGF0ZSkpOw0KPiB8DQo+ICAJLy8ga2ZyZWUg
aXMgb3B0aW9uYWwNCj4gKQ0KPiAoDQo+IC0JUC0+c3RhdGUgPSBOVUxMOw0KPiB8DQo+ICAJLy8g
cGxhbmUtPnN0YXRlIGNsZWFyaW5nIGlzIG9wdGlvbmFsDQo+ICkNCj4gIAkuLi4NCj4gIH0NCj4g
DQo+IEBkcm9wX2Rlc3Ryb3lfbXRrIGRlcGVuZHMgb24gdXBkYXRlX3N0cnVjdEAgaWRlbnRpZmll
ciBQOyBzeW1ib2wgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9kZXN0cm95X3N0YXRlOw0KPiBz
eW1ib2wgdG9fbXRrX3BsYW5lX3N0YXRlOw0KPiBAQA0KPiANCj4gIHZvaWQgbXRrX3BsYW5lX3Jl
c2V0KHN0cnVjdCBkcm1fcGxhbmUgKlApICB7DQo+ICAJLi4uDQo+IC0JaWYgKFAtPnN0YXRlKSB7
DQo+IC0JCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZShQLT5zdGF0ZSk7
DQo+IC0JCS4uLg0KPiAtCX0gZWxzZSB7DQo+ICAJCS4uLg0KPiAtCX0NCj4gIAkuLi4NCj4gIH0N
Cj4gDQo+IEB0cmFuc2Zvcm1fbnY1MF93bmR3IGRlcGVuZHMgb24gdXBkYXRlX3N0cnVjdEAgaWRl
bnRpZmllciBTOyBAQA0KPiANCj4gIHZvaWQgbnY1MF93bmR3X3Jlc2V0KC4uLikNCj4gIHsNCj4g
IAkuLi4NCj4gLQlpZiAoV0FSTl9PTighKFMgPSBremFsbG9jX29iaigqUykpKSkNCj4gKwlTID0g
a3phbGxvY19vYmooKlMpOw0KPiArCWlmIChXQVJOX09OKCFTKSkNCj4gIAkJcmV0dXJuOw0KPiAg
CS4uLg0KPiAgfQ0KPiANCj4gQHRyYW5zZm9ybV9remFsbG9jIGRlcGVuZHMgb24gdXBkYXRlX3N0
cnVjdEAgaWRlbnRpZmllciBtYXRjaF9zdHJ1Y3RfcmVzZXQucmVzZXRfZnVuYzsgaWRlbnRpZmll
ciBQLCBTOw0KPiBzdGF0ZW1lbnQgU1Q7IHN0YXRlbWVudCBsaXN0IFNUTDsgQEANCj4gDQo+ICB2
b2lkIHJlc2V0X2Z1bmMoc3RydWN0IGRybV9wbGFuZSAqUCkNCj4gIHsNCj4gIAk8Li4uDQo+ICAJ
UyA9IGt6YWxsb2Nfb2JqKCpTKTsNCj4gKA0KPiAtCWlmIChTKQ0KPiAtCXsNCj4gLQkJU1RMDQo+
IC0JfQ0KPiArCWlmICghUykgcmV0dXJuOw0KPiArDQo+ICsJU1RMDQo+IHwNCj4gLQlpZiAoUykg
U1QNCj4gKwlpZiAoIVMpIHJldHVybjsNCj4gKw0KPiArCVNUDQo+ICkNCj4gCS4uLj4NCj4gIH0N
Cj4gDQo+IEB0cmFuc2Zvcm1fYm9keSBkZXBlbmRzIG9uIHVwZGF0ZV9zdHJ1Y3RAIGlkZW50aWZp
ZXIgbWF0Y2hfc3RydWN0X3Jlc2V0LnJlc2V0X2Z1bmM7IGlkZW50aWZpZXINCj4gcmVuYW1lZF9m
dW5jLm5ld19uYW1lOyBpZGVudGlmaWVyIFMsIFA7IGV4cHJlc3Npb24gUFM7IEBADQo+IC0gdm9p
ZCByZXNldF9mdW5jKHN0cnVjdCBkcm1fcGxhbmUgKlApDQo+ICsgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqbmV3X25hbWUoc3RydWN0IGRybV9wbGFuZSAqUCkNCj4gew0KPiAJLi4uDQo+ICAJUyA9
IGt6YWxsb2Nfb2JqKCpTKTsNCj4gCS4uLg0KPiAoDQo+ICAJaWYgKCFTKSB7DQo+IAkJLi4uDQo+
IC0JCXJldHVybjsNCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICAJfQ0KPiB8DQo+
ICAJaWYgKFdBUk5fT04oIVMpKSB7DQo+IAkJLi4uDQo+IC0JCXJldHVybjsNCj4gKwkJcmV0dXJu
IEVSUl9QVFIoLUVOT01FTSk7DQo+ICAJfQ0KPiB8DQo+ICAJaWYgKFMgPT0gTlVMTCkgew0KPiAg
CQkuLi4NCj4gLQkJcmV0dXJuOw0KPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gIAl9
DQo+ICkNCj4gCS4uLg0KPiAoDQo+IC0JX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChQ
LCBQUyk7DQo+ICsJX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9zdGF0ZV9pbml0KFBTLCBQKTsN
Cj4gfA0KPiAtCV9fZHJtX2dlbV9yZXNldF9zaGFkb3dfcGxhbmUoUCwgUFMpOw0KPiArCV9fZHJt
X2dlbV9zaGFkb3dfcGxhbmVfc3RhdGVfaW5pdChQLCBQUyk7DQo+ICkNCj4gCS4uLg0KPiB9DQo+
IA0KPiBAdXBkYXRlX2Vhcmx5X3JldHVybiBkZXBlbmRzIG9uIHVwZGF0ZV9zdHJ1Y3RAIGlkZW50
aWZpZXIgbWF0Y2hfc3RydWN0X3Jlc2V0LnJlc2V0X2Z1bmM7IGlkZW50aWZpZXINCj4gcmVuYW1l
ZF9mdW5jLm5ld19uYW1lOyBpZGVudGlmaWVyIFA7IGV4cHJlc3Npb24gUFM7IEBAICBzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpuZXdfbmFtZShzdHJ1Y3QgZHJtX3BsYW5lDQo+ICpQKSB7DQo+IAk8
Ky4uLg0KPiAtCXJldHVybjsNCj4gKwlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gCS4uLis+
DQo+IH0NCj4gDQo+IEB1cGRhdGVfcmV0dXJuX3BsYW5lIGRlcGVuZHMgb24gdXBkYXRlX3N0cnVj
dEAgaWRlbnRpZmllciBtYXRjaF9zdHJ1Y3RfcmVzZXQucmVzZXRfZnVuYzsgaWRlbnRpZmllcg0K
PiByZW5hbWVkX2Z1bmMubmV3X25hbWU7IGlkZW50aWZpZXIgUDsgZXhwcmVzc2lvbiBQUzsgQEAg
IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19uYW1lKHN0cnVjdCBkcm1fcGxhbmUNCj4gKlAp
IHsNCj4gCS4uLg0KPiAgCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfc3RhdGVfaW5pdChQUywg
UCk7DQo+IAkuLi4NCj4gKw0KPiArCXJldHVybiBQUzsNCj4gfQ0KPiANCj4gQHVwZGF0ZV9yZXR1
cm5fc2hhZG93IGRlcGVuZHMgb24gdXBkYXRlX3N0cnVjdEAgaWRlbnRpZmllciByZW5hbWVkX2Z1
bmMubmV3X25hbWU7IGlkZW50aWZpZXIgUDsNCj4gZXhwcmVzc2lvbiBQUzsgQEAgIHN0cnVjdCBk
cm1fcGxhbmVfc3RhdGUgKm5ld19uYW1lKHN0cnVjdCBkcm1fcGxhbmUgKlApIHsNCj4gCS4uLg0K
PiAgCV9fZHJtX2dlbV9zaGFkb3dfcGxhbmVfc3RhdGVfaW5pdChQLCBQUyk7DQo+IAkuLi4NCj4g
Kw0KPiArCXJldHVybiAmUFMtPmJhc2U7DQo+IH0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCg0KVGVzdGVkIHRoZSBwYXRjaCBvbiBSWi9W
MkwgU01BUkMgRVZLLg0KDQpTbywNCg0KVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQoNCkNoZWVycywNCkJpanUNCg0KPiAtLS0NCj4gQ2M6IGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tDQo+IENjOiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5v
cmcNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3Au
YyB8IDE1ICsrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yei1kdS9yemcybF9kdV92c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1
L3J6ZzJsX2R1X3ZzcC5jDQo+IGluZGV4IDFlZmEwZjA0NTFmZS4uOTQ0YmM5YWM5NTg5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuYw0KPiBA
QCAtMjY0LDMwICsyNjQsMjcgQEAgc3RhdGljIHZvaWQgcnpnMmxfZHVfdnNwX3BsYW5lX2F0b21p
Y19kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCAgew0KPiAgCV9fZHJtX2F0
b21pY19oZWxwZXJfcGxhbmVfZGVzdHJveV9zdGF0ZShzdGF0ZSk7DQo+ICAJa2ZyZWUodG9fcnpn
MmxfdnNwX3BsYW5lX3N0YXRlKHN0YXRlKSk7DQo+ICB9DQo+IA0KPiAtc3RhdGljIHZvaWQgcnpn
MmxfZHVfdnNwX3BsYW5lX3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQ0KPiArc3RhdGlj
IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnJ6ZzJsX2R1X3ZzcF9wbGFuZV9jcmVhdGVfc3RhdGUo
c3RydWN0DQo+ICtkcm1fcGxhbmUgKnBsYW5lKQ0KPiAgew0KPiAgCXN0cnVjdCByemcybF9kdV92
c3BfcGxhbmVfc3RhdGUgKnN0YXRlOw0KPiANCj4gLQlpZiAocGxhbmUtPnN0YXRlKSB7DQo+IC0J
CXJ6ZzJsX2R1X3ZzcF9wbGFuZV9hdG9taWNfZGVzdHJveV9zdGF0ZShwbGFuZSwgcGxhbmUtPnN0
YXRlKTsNCj4gLQkJcGxhbmUtPnN0YXRlID0gTlVMTDsNCj4gLQl9DQo+IC0NCj4gIAlzdGF0ZSA9
IGt6YWxsb2Nfb2JqKCpzdGF0ZSk7DQo+ICAJaWYgKCFzdGF0ZSkNCj4gLQkJcmV0dXJuOw0KPiAr
CQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gDQo+IC0JX19kcm1fYXRvbWljX2hlbHBlcl9w
bGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5zdGF0ZSk7DQo+ICsJX19kcm1fYXRvbWljX2hlbHBl
cl9wbGFuZV9zdGF0ZV9pbml0KCZzdGF0ZS0+c3RhdGUsIHBsYW5lKTsNCj4gKw0KPiArCXJldHVy
biAmc3RhdGUtPnN0YXRlOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Bs
YW5lX2Z1bmNzIHJ6ZzJsX2R1X3ZzcF9wbGFuZV9mdW5jcyA9IHsNCj4gIAkudXBkYXRlX3BsYW5l
ID0gZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lLA0KPiAgCS5kaXNhYmxlX3BsYW5lID0g
ZHJtX2F0b21pY19oZWxwZXJfZGlzYWJsZV9wbGFuZSwNCj4gLQkucmVzZXQgPSByemcybF9kdV92
c3BfcGxhbmVfcmVzZXQsDQo+ICsJLmF0b21pY19jcmVhdGVfc3RhdGUgPSByemcybF9kdV92c3Bf
cGxhbmVfY3JlYXRlX3N0YXRlLA0KPiAgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gcnpnMmxf
ZHVfdnNwX3BsYW5lX2F0b21pY19kdXBsaWNhdGVfc3RhdGUsDQo+ICAJLmF0b21pY19kZXN0cm95
X3N0YXRlID0gcnpnMmxfZHVfdnNwX3BsYW5lX2F0b21pY19kZXN0cm95X3N0YXRlLA0KPiAgfTsN
Cj4gDQo+ICBzdGF0aWMgdm9pZCByemcybF9kdV92c3BfY2xlYW51cChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpyZXMpDQo+IA0KPiAtLQ0KPiAyLjU0LjANCg0K

