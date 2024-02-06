Return-Path: <linux-renesas-soc+bounces-2403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AC84BC77
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 18:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B382891C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 17:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D849473;
	Tue,  6 Feb 2024 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vZC4Gm+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2054.outbound.protection.outlook.com [40.107.114.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF36D51C;
	Tue,  6 Feb 2024 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707241646; cv=fail; b=Cq2VBLVtj525FOnjgcjm67oQdG9ovhocCCYDvWD/jvPLp1Qyhmb4bOzekdupVveVH8XQc+RmHcycgT4XsC2HO/t6wAugkjCe4H15Ue2Aj/cFSHGIEqITlypQCaVqT4KS+bYk0LCGC8vW5YR7tWhcaMa6fViA5lyNT6vFKSpROy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707241646; c=relaxed/simple;
	bh=M+NkXxdmDCnxl2qsh5n4V3Chh3x6rELfx4DDoi0n4l4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eyqpHCu86iNqBtQBHhmNW1lutr+BU7nkOquHRnNiBheTQzO/Ze1OgixM5xEH7sp23MwFZqU2w7wsYs5b7HOOLf9f25N37i1tEiYaA85EpY1YmRzquPfpRuBauOhepYwXO6aqMYgLcNF/j3NoRor1DYg+MhqwzxJlH5RWcKqGR/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vZC4Gm+9; arc=fail smtp.client-ip=40.107.114.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc+lrdS3Hg0th2hB9W+gSjqmUofJLnwAlD7DEKvvdXk3H73rszIas3xXkLJCD3hyWjuU9TEa49DBbXw72hUgv7QzG3clqYSpxGWihtr9PuAHLQy3NxaBHobskodPQCMjfTPadxFcREcmk0AIcLgf20ABCDiwgWpxs942+BsGeHjgijMdmBBMlc2zKKeieGVJ0cFew5HLUMtBYMi2zYYu8TZwXi6NAfn5WQq1N005D4LI2cSfFpbwHv6qtAl1Z5Asu+a0khc6J1JFvEC9r9JHiuCgMwezr4GHcqt9LXrk6x/IRtZaZk/F+rgcm1j/6Pcp3w8GImHsGHl67w3q+djb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+NkXxdmDCnxl2qsh5n4V3Chh3x6rELfx4DDoi0n4l4=;
 b=AW5Qk0h0dzst83+84sgghBaG6KjjVeTS3sHVbb9+3ILSTCtIFL0quIb+B3L9VQPXXYZw02J/CKVUYiyKjWw7j+3ttnD2gQczjOLibN1Nmv8uE3m6nzXg4RhNfy1DE45sRqUx5sl19f9aehxr7HATRvQMJHitDVvl0if2VGL6fGkwTN8EbfsrC1h37P31AqWtbWUYzaHyZJ0xQxyKjhwrEJ0Ihs9i2lYxoSTwfQ2j9rBw4ousX8ApEue/RpGrZvs9pN8qHTd68FMHxXfc698Qrs7j3Bb6wqWiky2jeFvsUpgBCyW+PZytl4xBKm6iyu1dbbz/HPlcn0BrRohTQzJP9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+NkXxdmDCnxl2qsh5n4V3Chh3x6rELfx4DDoi0n4l4=;
 b=vZC4Gm+9JirCKoDYhDK31+xvlg9Vh828M7xvpsEbDUPhqqm7bo8JPJ8r6XqBRgFbg7RvvxzWY1m4/oGYrpc4fAKT01ZMN8VA1zmZRTgpL6iCeDpX17ek0RntbfHkobZsDCMOuMH+icilHmLOTMccI5Tu3k8C/AlGZseWYVB6uLU=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB6091.jpnprd01.prod.outlook.com
 (2603:1096:402:34::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 17:47:20 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 17:47:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 net-next 2/2] ravb: Add Tx checksum offload support for
 GbEth
Thread-Topic: [PATCH v4 net-next 2/2] ravb: Add Tx checksum offload support
 for GbEth
Thread-Index: AQHaVqz1FVZ3QVHOsUC+iyzbzWzf9LD8Ng2AgAFlWLA=
Date: Tue, 6 Feb 2024 17:47:20 +0000
Message-ID:
 <TYCPR01MB112697DC47B37005B92A8CAE486462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240203142559.130466-1-biju.das.jz@bp.renesas.com>
 <20240203142559.130466-3-biju.das.jz@bp.renesas.com>
 <76b13c41-9f0b-daf2-9aa8-7fdaf489fe0a@omp.ru>
In-Reply-To: <76b13c41-9f0b-daf2-9aa8-7fdaf489fe0a@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB6091:EE_
x-ms-office365-filtering-correlation-id: 33e46a21-27bd-42c8-d057-08dc273baac7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p7MbDDRNgiIsDR0Xp0GMAMmws4fDF1a26AJfjgJGBWVXZVXMm0GoN1PcNCJloPCfWnrpQXm29xP74/AlluNaAvbBag6mcrjhTBiBLKVGxqmQdqipkb1uMUMOBRmiw5+LtNzyUkIZYsDQQzsqEEDTg6lEW17caPYLlNIjxINv6RO6jdUNDlz7V4+JOXkovWa5S36KNO3+/4Tf6GtcG61gnM47jUIB5Q8F3cJWKearBKcxrjyU/mrBpQ+Y0wB5ho29FGsHqrkAGvmugDmUs0yuKYAm68Y9y28cZgg6FD3U9t0VtjolPoMQKAmgfe0OVxWVGVyf8KXk4zF70CPjsCmrAvUwGQvBZiVdUpiaPGJPzkVqRcyG9bxEw/MXJoLYdZN6FN5G7KunSBjX0V8e4FfyLBeddOuLjvM8T/LI6o+nPz8naqkoMFl2w90ZJd0WeSzwSWoN5UInbFA2xrf7T6kzhxrP/AEk4EmvAy+8WsulgTmHB6HMCIXKZ8I4TFxS3qRvvCpMKAIgqtnZEVuCsNJWDos+O4240spI830uIzOOYP36B8bUeIG6IzC/oaCpUeEPea/GYCuF8gt7xtx0a2AAXBkt312yA940deud14WdSxIaPoLqYcUIs418IEUbGvlH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(41300700001)(66476007)(66446008)(76116006)(54906003)(66946007)(64756008)(8676002)(8936002)(66556008)(38070700009)(53546011)(33656002)(9686003)(110136005)(6506007)(7696005)(71200400001)(478600001)(55236004)(316002)(4326008)(26005)(38100700002)(122000001)(86362001)(83380400001)(52536014)(7416002)(5660300002)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QURrYUxRYWxWNmd6ZFJMaXh4VTJaME04NW02bWV5eEt1Q3JPa05VakJ4OUtL?=
 =?utf-8?B?U0RKQlNvY2NTVm5MNWdud3Z1SVE5L1hNT3FOQnMrVmpiRzZvakw2Qko2bWtH?=
 =?utf-8?B?Tmorb1lTRmI3UmNJa1ZpUUVQTUZnUkplb1NTOTJmNjdjYWJqNWhrNHFJZ3o2?=
 =?utf-8?B?cFFnVHB1b3NnZE9WdnJpcndqU1NtR1VMeHVIQk51aGh6TzAxVDZEbTlUaThw?=
 =?utf-8?B?dHJrREIvMVEzZHN2SE1aMDZkc3RyRnRjbG5zbm5yNDVqNXh5bkFxQkU5ZHla?=
 =?utf-8?B?V20vY2J1aHg2RzZIRm1SY25NNis2RkRkUldzR3gwOVVheVRhTHVLNUx2V3Yy?=
 =?utf-8?B?VEFobGh0YWV1UGpVakxwRHlxUDI5ZjBsT05LWmJ0OEdmM2M2enM4cHBBdmdq?=
 =?utf-8?B?NFM2OGttRG1BVnNKYUN2TmN2ZXJsUjFudTIwVjJvaUdLdUx2bXJzc090RUEy?=
 =?utf-8?B?cHJGdmY1ZFJ3Mkx2ZCt3ZXBKdVVrNkFkRFd1NDVlTnV6MVhRSlNWYVpkeFNU?=
 =?utf-8?B?bEdZU1l3ZzRRdU1uK2Y4dkp6RkQyZzBlZWw5ZXZJZ0NqV2orc3NtOU95ZlRP?=
 =?utf-8?B?ZWdPdURJYi9QcDJTZGc1SEVxdnlVMUxqUXF4SU9RUWJrZWpRZnhWN3MyVmtB?=
 =?utf-8?B?NUtuRm56ejZRZHZqZnBlQzRCdGhjRnlUSytRSEg4MytFbmJrNFlsMjVrMGJD?=
 =?utf-8?B?c29PYUlEZGVEUkw1cXhuS2Foa0lNd1NaQXFpdlpjNHhVNzJMSS9pUE5lSHFU?=
 =?utf-8?B?b0Y3ZjZEQTFHV1lwL3BreXpLVnZmK0xSQjhIQ1JqTFQwWVo1NUVyWGd1dENY?=
 =?utf-8?B?WEJRK3I4a05IUjExK3d3YUtaNEJiU3ZxNUQzWkZBbkplczlldmhFL0Z3L0x4?=
 =?utf-8?B?MStBRmZOR292cGJpWVM0Mzlad1ZLbGJ4NW5ZUWFEVnNDZ0pHWUNDVGt2YUU5?=
 =?utf-8?B?TU9xL3dFdGtIdVhKTDNvdlFjYlNLZ2dXWHVraXhPOTBodiswQVpsbE9VMkpx?=
 =?utf-8?B?K3BET3NKUGFMK1BNdFJ0YldBNE1DNGVyeG5hN1ZEU0pXK0RibVJkeVdkcVJO?=
 =?utf-8?B?WDRBdmZCdmdFMUI1VUo1SUxreFZSMzRBR1pKR3AyLzdFNDMzWThLdVAySk1s?=
 =?utf-8?B?WEIxbFQ3cVJmbndjTWNGenNtNlF6anU3REE3V0cydVdta1NsNFg4K0J5VDZl?=
 =?utf-8?B?MC82U2lIN21jMkJINmZvNHFOc2tzbGl0YS9ndnRjT0RuMzJqa0dqMnRQVkti?=
 =?utf-8?B?Z2EvWVFZUi9ZdkwzQ3hVNEUrVmg3b1QwY20xa2R0eGdiNWVFMHZEOWQxZEpD?=
 =?utf-8?B?eS9yUTZ0ZlozNUZnOXpzSUJ2Z0N0b25yNHc5Vlo4TGRRMmJTOGd5aHByMDgx?=
 =?utf-8?B?RURORE8zS2FXZlhxa3JpQnpxbS9yM0JTZi9pZGtMZmM2TVBPVHZFalhtM2dL?=
 =?utf-8?B?ZVZUOHc1ZzFPUW5hcHV6WXZzQ0xzRTNuMnZ0czlrZFNKWUZQcE1VNmxqQThj?=
 =?utf-8?B?U0VHQ0NmNnNwRW9VWjFnYUFBMllsdE1mYVJsUy85Vlk3aFhFK0RmR3I1M0cz?=
 =?utf-8?B?N0IrV0ovRWw0Tm1KNWZUd3VVWFYzd295YVM0ZWZ6eDBpOFJEL0g4a05QRHkw?=
 =?utf-8?B?UE1FVityWVNvSGJTN0pXTjZOUkMzQTBXclFxZURCZ2JxdUVvazV4enFoT2hV?=
 =?utf-8?B?dnFrUlVpaCtqUTd4ZzN4dUpWQm9hL2NQVUhybTFUYXRWUmJkNEhaV2F6WTRp?=
 =?utf-8?B?dGx5ZC9DY1lLc2V6ZzU3WFVoT1lNcDB0VHV2dzBrQWIzbGF5dVhFVE52a0M1?=
 =?utf-8?B?OHMyMUJDb3p4dzI0WldtNnZ2R3NOeFU2MElOZERBK2VaMEFxeStUS3dscEFv?=
 =?utf-8?B?bTJWZUlwTTRCWllwZktiT2I2eC9VQXRZcDlDVk9MVFJFbnFGNXplZ3FDMG53?=
 =?utf-8?B?QlZLaE1Wc1BpTHJxRVMzSmZBT3JmcFkzRzQzc1VWcG9vQ3FRV0pLK2w5cVBw?=
 =?utf-8?B?UDBTY3lzdkJqRE5SUkgxaWhHTXV2TXN5bHpKMUhDaElDdGphZ3A2WjkxQWw1?=
 =?utf-8?B?OUV0WkQ5SWZlY0F3dG53TFZpSlY5bFFOd0wxRWxRN3hBYXZ2TkJOdFkvNE03?=
 =?utf-8?B?TWtyczZlaGtuRTB6UE1ZQXg5T0ZaNG5SZUxabHhxeHpyS2YrQ0haa0Q5WE4y?=
 =?utf-8?B?RVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e46a21-27bd-42c8-d057-08dc273baac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:47:20.0957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnY0FYcELxApwsOteNBs8iFd9Kw/CYItLnA9IeRHhT3KcoaWr7hf/0xGoXdoKbFDC4NtizkQl2NEF+FFXJtebdM26B3kbalCgZXAaU+w7zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6091

SGkgU2VyZ2V5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlcmdl
eSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkg
NSwgMjAyNCA4OjI3IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgbmV0LW5leHQgMi8yXSBy
YXZiOiBBZGQgVHggY2hlY2tzdW0gb2ZmbG9hZCBzdXBwb3J0DQo+IGZvciBHYkV0aA0KPiANCj4g
T24gMi8zLzI0IDU6MjUgUE0sIEJpanUgRGFzIHdyb3RlOg0KPiANCj4gPiBUT0UgaGFzIGhhcmR3
YXJlIHN1cHBvcnQgZm9yIGNhbGN1bGF0aW5nIElQIGhlYWRlciBhbmQgVENQL1VEUC9JQ01QDQo+
ID4gY2hlY2tzdW0gZm9yIGJvdGggSVB2NCBhbmQgSVB2Ni4NCj4gPg0KPiA+IEFkZCBUeCBjaGVj
a3N1bSBvZmZsb2FkIHN1cHBvcnRlZCBieSBUT0UgZm9yIElQdjQgYW5kIFRDUC9VRFAuDQo+ID4N
Cj4gPiBGb3IgVHgsIHRoZSByZXN1bHQgb2YgY2hlY2tzdW0gY2FsY3VsYXRpb24gaXMgc2V0IHRv
IHRoZSBjaGVja3N1bQ0KPiA+IGZpZWxkIG9mIGVhY2ggSVB2NCBIZWFkZXIvVENQL1VEUC9JQ01Q
IG9mIGV0aGVybmV0IGZyYW1lcy4gRm9yIHRoZQ0KPiA+IHVuc3VwcG9ydGVkIGZyYW1lcywgdGhv
c2UgZmllbGRzIGFyZSBub3QgY2hhbmdlZC4gSWYgYSB0cmFuc21pc3Npb24NCj4gPiBmcmFtZSBp
cyBhbiBVRFB2NCBmcmFtZSBhbmQgaXRzIGNoZWNrc3VtIHZhbHVlIGluIHRoZSBVRFAgaGVhZGVy
IGZpZWxkDQo+ID4gaXMgMHgwMDAwLCBUT0UgZG9lcyBub3QgY2FsY3VsYXRlIGNoZWNrc3VtIGZv
ciBVRFAgcGFydCBvZiB0aGlzIGZyYW1lDQo+ID4gYXMgaXQgaXMgb3B0aW9uYWwgZnVuY3Rpb24g
YXMgcGVyIHN0YW5kYXJkcy4NCj4gPg0KPiA+IFdlIGNhbiB0ZXN0IHRoaXMgZnVuY3Rpb25hbGl0
eSBieSB0aGUgYmVsb3cgY29tbWFuZHMNCj4gPg0KPiA+IGV0aHRvb2wgLUsgZXRoMCB0eCBvbiAt
LT4gdG8gdHVybiBvbiBUeCBjaGVja3N1bSBvZmZsb2FkIGV0aHRvb2wgLUsNCj4gPiBldGgwIHR4
IG9mZiAtLT4gdG8gdHVybiBvZmYgVHggY2hlY2tzdW0gb2ZmbG9hZA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBbLi4uXQ0K
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiLmgN
Cj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yi5oDQo+ID4gaW5kZXggNjRi
ZjI5ZDAxYWQwLi5kN2IxYzZkMTVhMTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5l
c2FzL3JhdmIuaA0KPiBbLi4uXQ0KPiA+IEBAIC05ODEsNiArOTgyLDIxIEBAIGVudW0gQ1NSMF9C
SVQgew0KPiA+ICAJQ1NSMF9SUEUJPSAweDAwMDAwMDIwLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK2Vu
dW0gQ1NSMV9CSVQgew0KPiA+ICsJQ1NSMV9USVA0CT0gMHgwMDAwMDAwMSwNCj4gPiArCUNTUjFf
VFRDUDQJPSAweDAwMDAwMDEwLA0KPiA+ICsJQ1NSMV9UVURQNAk9IDB4MDAwMDAwMjAsDQo+ID4g
KwlDU1IxX1RJQ01QNAk9IDB4MDAwMDAwNDAsDQo+ID4gKwlDU1IxX1RUQ1A2CT0gMHgwMDEwMDAw
MCwNCj4gPiArCUNTUjFfVFVEUDYJPSAweDAwMjAwMDAwLA0KPiA+ICsJQ1NSMV9USUNNUDYJPSAw
eDAwNDAwMDAwLA0KPiA+ICsJQ1NSMV9USE9QCT0gMHgwMTAwMDAwMCwNCj4gPiArCUNTUjFfVFJP
VVQJPSAweDAyMDAwMDAwLA0KPiA+ICsJQ1NSMV9UQUhECT0gMHgwNDAwMDAwMCwNCj4gPiArCUNT
UjFfVERIRAk9IDB4MDgwMDAwMDAsDQo+ID4gKwlDU1IxX0FMTAk9IDB4MEY3MDAwNzEsDQo+IA0K
PiAgICBJIGRvdWJ0IHdlIHJlYWxseSBuZWVkIENTUjFfQUxMLi4uDQpPSywgd2lsbCBkcm9wIGl0
Lg0KDQo+IA0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9y
ZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jh
dmJfbWFpbi5jDQo+ID4gaW5kZXggNGYzMTBiY2VlN2MwLi5mZWU3NzFmMTRmYzUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gWy4uLl0NCj4g
PiBAQCAtNTI0LDE2ICs1MjUsMjkgQEAgc3RhdGljIGludCByYXZiX3JpbmdfaW5pdChzdHJ1Y3Qg
bmV0X2RldmljZQ0KPiA+ICpuZGV2LCBpbnQgcSkNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCByYXZi
X2NzdW1faW5pdF9nYmV0aChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikgIHsNCj4gPiAtCWlmICgh
KG5kZXYtPmZlYXR1cmVzICYgTkVUSUZfRl9SWENTVU0pKQ0KPiA+ICsJYm9vbCB0eF9lbmFibGUg
PSBuZGV2LT5mZWF0dXJlcyAmIE5FVElGX0ZfSFdfQ1NVTTsNCj4gPiArCWJvb2wgcnhfZW5hYmxl
ID0gbmRldi0+ZmVhdHVyZXMgJiBORVRJRl9GX1JYQ1NVTTsNCj4gPiArDQo+ID4gKwlpZiAoISh0
eF9lbmFibGUgfHwgcnhfZW5hYmxlKSkNCj4gPiAgCQlnb3RvIGRvbmU7DQo+ID4NCj4gPiAgCXJh
dmJfd3JpdGUobmRldiwgMCwgQ1NSMCk7DQo+ID4gLQlpZiAocmF2Yl93YWl0KG5kZXYsIENTUjAs
IENTUjBfUlBFLCAwKSkgew0KPiA+ICsJaWYgKHJhdmJfd2FpdChuZGV2LCBDU1IwLCBDU1IwX1RQ
RSB8IENTUjBfUlBFLCAwKSkgew0KPiA+ICAJCW5ldGRldl9lcnIobmRldiwgIlRpbWVvdXQgZW5h
YmxpbmcgaGFyZHdhcmUgY2hlY2tzdW1cbiIpOw0KPiA+IC0JCW5kZXYtPmZlYXR1cmVzICY9IH5O
RVRJRl9GX1JYQ1NVTTsNCj4gPiArDQo+ID4gKwkJaWYgKHR4X2VuYWJsZSkNCj4gPiArCQkJbmRl
di0+ZmVhdHVyZXMgJj0gfk5FVElGX0ZfSFdfQ1NVTTsNCj4gPiArDQo+ID4gKwkJaWYgKHJ4X2Vu
YWJsZSkNCj4gPiArCQkJbmRldi0+ZmVhdHVyZXMgJj0gfk5FVElGX0ZfUlhDU1VNOw0KPiA+ICAJ
fSBlbHNlIHsNCj4gPiAtCQlyYXZiX3dyaXRlKG5kZXYsIENTUjJfQUxMICYgfihDU1IyX1JUQ1A2
IHwgQ1NSMl9SVURQNiB8DQo+ID4gLQkJCQkJICAgICAgQ1NSMl9SSUNNUDYpLCBDU1IyKTsNCj4g
PiArCQlpZiAodHhfZW5hYmxlKQ0KPiA+ICsJCQlyYXZiX3dyaXRlKG5kZXYsIENTUjFfQUxMICYg
fihDU1IxX1RJQ01QNCB8IENTUjFfVFRDUDYgfA0KPiA+ICsJCQkJCQkgICAgICBDU1IxX1RVRFA2
IHwgQ1NSMV9USUNNUDYpLA0KPiBDU1IxKTsNCj4gDQo+ICAgIFdpdGggdGhlIHY2IGJpdHMgMjAu
Li4yMiBiZWluZyAwLCB0aGUgYml0cyAyNC4uLjI3IGFyZSBpZ25vcmVkIGFueXdheSwNCj4gdGhl
IG1hbnVhbCBzYXlzLiBTbyBJIHRoaW5rIEknZCBwcmVmZXI6DQo+IA0KPiAJCQlyYXZiX3dyaXRl
KG5kZXYsIENTUjFfVElQNCB8IENTUjFfVFRDUDQgfCBDU1IxX1RVRFA0LA0KPiBDU1IxKTsgWy4u
Ll0NCg0KT0suDQoNCj4gPiBAQCAtMjQxOCw2ICsyNDY1LDE4IEBAIHN0YXRpYyBpbnQgcmF2Yl9z
ZXRfZmVhdHVyZXNfZ2JldGgoc3RydWN0DQo+IG5ldF9kZXZpY2UgKm5kZXYsDQo+ID4gIAkJCWdv
dG8gZG9uZTsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKGNoYW5nZWQgJiBORVRJRl9GX0hXX0NT
VU0pIHsNCj4gPiArCQlpZiAoZmVhdHVyZXMgJiBORVRJRl9GX0hXX0NTVU0pDQo+ID4gKwkJCXZh
bCA9IENTUjFfQUxMICYgfihDU1IxX1RJQ01QNCB8IENTUjFfVFRDUDYgfA0KPiA+ICsJCQkJCSAg
IENTUjFfVFVEUDYgfCBDU1IxX1RJQ01QNik7DQo+IA0KPiAgICBMaWtld2lzZSwgSSdkIHByZWZl
cjoNCj4gDQo+IAkJCXZhbCA9IENTUjFfVElQNCB8IENTUjFfVFRDUDQgfCBDUzEyX1RVRFA0Ow0K
DQpPSywgdmFsID0gQ1NSMV9USVA0IHwgQ1NSMV9UVENQNCB8IENTUjFfVFVEUDQ7DQoNCkNoZWVy
cywNCkJpanUNCg0KPiANCj4gWy4uLl0NCj4gDQo+IE1CUiwgU2VyZ2V5DQo=

