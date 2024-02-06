Return-Path: <linux-renesas-soc+bounces-2401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C284BB9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 18:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F331F23A74
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 17:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB55015D1;
	Tue,  6 Feb 2024 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SJamM0JF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2050.outbound.protection.outlook.com [40.107.114.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6119BA37;
	Tue,  6 Feb 2024 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707239245; cv=fail; b=u/ORWN/iJyL2L9naGUPOrn1E8cx2J91KJQjpW3va4xMqxon4kcVckTv2+JsPUV1wCEcaqd1RBGPHerUBIpNCZ2rjhQRn+ukBEi97dIXbhZGImOou2cd3gPOWi9dVpBI6W/quZDxOdJQItMvIzPOpepMYP3p/aopoWPobO86FIW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707239245; c=relaxed/simple;
	bh=+vapRDRoeS0f0WMIp2aLaWjo/6R95RHrUvcSYK6dgxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQie5GEOtDLw9YUpp5hQK4zbNfmBXYgR9Nl1Bkqf3pmcAzyUzMu/z9H+78yBsa4GPKXHeZMSuDJRKyAebFTEsgXFm+riXX8sbeOKqAE3XDotVdsxR4tZoLDDebKmlh57j4sI7Lupz2UHi+WBM7WTgxYcJvQl5HxONUDgsecrPsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SJamM0JF; arc=fail smtp.client-ip=40.107.114.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEExEsAdjZi3jULMpQ168D89qlJilbP4/qHqcEglwQxZYMXRqx8tubO9C6sUxFQKCliRjqghF1HMUJUWVO7LyR4kQw/ogg0DYF/eTr7GSg8ooXZlB2RfpUZ+1rMhNFy0xaNKBV78gJ4kafJ+P5ZO1m+/eIbmeMRoHpOlGHvoGxPZmek85FdBSnxyRNKRp8D9BGfiyxjddLS13dxmuhNI7f0ZK2fDEIv7x0EZncLPjE+pXfxRjogCGUawUFvjCyc/EUPXnDXKynAyJ8N492oieeHFxHwcoJLQRasjjLO5EPIcqqQ1EtlYX4wsv1G4ykO03hMhAn/pC64UimDhNx/8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vapRDRoeS0f0WMIp2aLaWjo/6R95RHrUvcSYK6dgxs=;
 b=kfIMW+8rRdOc232qR+WZglse2YPaBWdPrWaYJozOx8mvMqK+JNzwNsGRn28JhZ2Y0YJhPSPDLxjMkdO3qZte4+dozGRZvMabORaS81db1r5LfQ2ZgZIUp9tfslERajwAC7EK1ky6T5E+QRgHWVuwrTHmum26U9lYKvrQStHtBz1/pN0TbNIeDI2C70ktJLgJbVdVA0U4oNwT1ntnlbVoAifYuJvOyWlsi4C6sU8JsHCRFTJ4VckLbkc0II9s/QPyxsuoNEMlA11XUx2dYmcuYPDGeU2FkpzY5xWxp6ZLDg8d35ZeAapzBabxDIICasNE9qdtcxBC7qJczmwmoUPP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vapRDRoeS0f0WMIp2aLaWjo/6R95RHrUvcSYK6dgxs=;
 b=SJamM0JFAJ/DedJFsmBJYq446FdWskCWhrVwtQMOnuDUJJlXqck6peIkeMfYUszT5sBD/M0NudGA8yFF2+LvbE1yAubbkqvxWbbGH+xj2vsTBfqceWQ/Qzq6dAXuaado2enFx40E0dsqBPOogwkNOi7EG055ik88IbIiVbqz6Tk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8378.jpnprd01.prod.outlook.com
 (2603:1096:400:161::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 17:07:18 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 17:07:18 +0000
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
Subject: RE: [PATCH v4 net-next 1/2] ravb: Add Rx checksum offload support for
 GbEth
Thread-Topic: [PATCH v4 net-next 1/2] ravb: Add Rx checksum offload support
 for GbEth
Thread-Index: AQHaVqzxEZQREFlEiUyiwBuTaceNRbD8Hg+AgAFxjGA=
Date: Tue, 6 Feb 2024 17:07:18 +0000
Message-ID:
 <TYCPR01MB1126998DEC9DC91F64993EDAF86462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240203142559.130466-1-biju.das.jz@bp.renesas.com>
 <20240203142559.130466-2-biju.das.jz@bp.renesas.com>
 <dd3ffb2d-23f4-49a6-e427-2b6afb96ddfd@omp.ru>
In-Reply-To: <dd3ffb2d-23f4-49a6-e427-2b6afb96ddfd@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8378:EE_
x-ms-office365-filtering-correlation-id: 36852d3f-423b-4e10-0f2f-08dc27361351
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CnMI+PxMNmn03OJK4uWv/tJ3MIN1xUGRwSkrOENkTD3bXA89QD4QhR36Dke9elxRfUDsDBrJKVObiBaXXxDvEu5E9mfACxQPV45t9tJMROSsCdR1SIYBszoTrOe39vJEa2f3VkDUgvU9p4FApH3vi+zmyrnPhp6BxnTC0GvtViYOwP+QKvMpxRybH8onKER8weimvvT803deM5K1DbKbilcYPIkVjgskBfqOlzitjrMcBC5t0Gd7gVE/CgDYV9uS7wNP4WXd7g3hW+kkYIylYSG4Vy0W03ujHlKTcI9GA82plkjO71hDvTvT3KuW0+83TWQukvxe7anL/Ctg7Kpz5Ur7LlHsYmvSlN0wtHAtzzWp8W0CAPsxVxfFU9yjpE98lOKuXVyHXuvitUfUcswWm35clqk+SXmjUTvueb7FLhGf4arHZQMo6c1HfgNHWVlmGzxJRlGR7wm521poZkO4Ds77jFijKJYyN0YvHkViTLYoemw3m6gHFymbwn1hRflSR32w4NBKH3aBXCMNTSoQArvRsKx1FASMTnJdy83GiGgZx2ON73esoEgLQ6PdZGKCYapX4pcOM/MdkKXjWYkb7lTwRfVuKM34XmQdTSCC5s1UfRq8JLEGJUN2v1yznbjk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(26005)(86362001)(9686003)(5660300002)(7416002)(478600001)(2906002)(38070700009)(110136005)(66476007)(64756008)(76116006)(54906003)(66946007)(66446008)(66556008)(4326008)(8936002)(52536014)(8676002)(71200400001)(53546011)(7696005)(6506007)(55236004)(33656002)(316002)(38100700002)(55016003)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFhiMDF2djR0Tm1QWmxsNUtZeGNGL2lacmNNOWorOVEwYmVhVXhOTnc1Mk90?=
 =?utf-8?B?MXhCb3lCVnk0aXJleS9vaUZWRUVDdFVZamdrdmxDYWZuS1VIZ1hzRHBrVEZX?=
 =?utf-8?B?VktSdTFuZjcwekNTeU1qbG42T2NRUXJ3QjhNeVViNWxGbFJnMGd2TGRrMzV2?=
 =?utf-8?B?WFc4OUJGMHZ6MnB6bkVIc2JJaWlybXg1Rkgzemc4VUhPMXR5OWNqbWtUK0tJ?=
 =?utf-8?B?ZU9ZN3hiQjRRdUkxTVU5cysxMExyVllzTkRQbVcwR0JmcmRSbmhyeGF5eVl6?=
 =?utf-8?B?ZndFQlJCcjdSUkxqNnd4MjhTZHBWU2c0K2dRdmo5RWNxVEVIdG1TRktCVktt?=
 =?utf-8?B?UldyNmRsMWxGTHlvL1MvY01ZQ0FHcWM4SnFDS04ydTBBQW1ON082V2ZLQjZU?=
 =?utf-8?B?VG9XUEVTSm0rdDJmSHo0eG9zU3F1NElyL2dMb3VQMVgxeSsvdk50RDNmSWZQ?=
 =?utf-8?B?ZkZIanhHUTJzWE5CdDl4amlURXlHcFlMRkxxQ0l5WVdaYTZrRWcwaDBjclgr?=
 =?utf-8?B?Rm5pb1R4ZDdlbmpJTUgzSlpsSTU5N09Md1hwdXlYaDVWM20xSG80WndlS1p3?=
 =?utf-8?B?dlBMV0YyZmM4TlNUOXJaMmFnSnhLVlNYUE45NUxFdE5PanhkTFAwNExjOEo1?=
 =?utf-8?B?M0JvditBMnhCTDE1d0ZxMC9BT09uWkpIa1EyS2tjdUlkTE0wa0F5QzZ6bmdj?=
 =?utf-8?B?SGJMenNvOFFMZnduVFVDVWxROWVqN2k5REZUUDNyTjk2WHBJS3cyMU1sM3F0?=
 =?utf-8?B?THdxN0VWZU1uRVBuV3ZTaVdMQzU1ZWlxWkNBZzZCMk1FS1BtQ2UyTjFVZXFs?=
 =?utf-8?B?NjA5bE1JR3B6cE5rWEJUYm5UV25iNGx4WWgyOGQ3R3k5YXdqWTVyYThNcW5a?=
 =?utf-8?B?bEFYcGZMY0tzZW5VNkxwTk1QWnhsSTN0QkNNNXZ3cmxvckhxUmI1VllndUgr?=
 =?utf-8?B?ZXl6ZWt0YTZCVmNRbldJOGJiTW9pZW1jcFpoRysxSFlOYStvS24rMXFFTzBB?=
 =?utf-8?B?TnA0L2ROajd2eWlKdU9RdkREU0kvMUhrWmxSYzlJYWR4WVlMNEFQU1BVa0Vi?=
 =?utf-8?B?Y2JSUkY1Y25nUlJSVlpQWU9jeWlpMEdDSThpMTl3MEZOT21nak5yUEZDTHFL?=
 =?utf-8?B?NUNoUUc1NkJzbjJzY2lPVjBQL2tyeEJic0twRmhQVlRqS1dzQUZ4VW8wSW5j?=
 =?utf-8?B?WFdKVTlBUzV3a29kQ3NmTnBVZUNadzlWbGhFbVF1TjYwQzBOM2hQbVF4bDFw?=
 =?utf-8?B?bGdQQ0RzOVlzUVFQU2xiUzNkTDc3empoL1ZLSXhySHJCMmJycDcxUmxSaW9o?=
 =?utf-8?B?eUMwTk03SzdzN3hPSUoxL0FmSFVnSnY1bGdOVnpDYmVpTmNFWCtEQjlPT0U1?=
 =?utf-8?B?T3dNc0ZrQTl2bWVDbE9vcDdGVWxObnBGWXBYbjVBMHV1YXl3RlVtT0lRbGRI?=
 =?utf-8?B?WndRRitDd3FCSUFlby9EbnFIRHpBenNEdm5VT01Vbmh1S09VN0o3WUFhd0hs?=
 =?utf-8?B?OEoxajhIeU9DUGhZckFQaWRXc0JlcnlJbFA1cHRVUXRxV1BXSHpLS0ljTEJ2?=
 =?utf-8?B?T281VmhZRm9QcXhKSTVESm16SUFjTkd0RmlhUTlCVEozSWdCcWZBV3VYYVA2?=
 =?utf-8?B?aEZtUXg1SUt2T2VxajJMZzRpZDFYdTBvVXltRkxJQTdUWGdWcFE4Ym5WWXVT?=
 =?utf-8?B?VEU4SVdrQy9TS0VNMlRSSUlZNnRSczJ3Q1pVUC8rN0dsdEJmQ0tQaUU3RG5v?=
 =?utf-8?B?cXZ2MVlkeDFYVUpFWS93WnVXU1ZhUHJ3VDhRODFocDFJZWF2NHRiK1BUTmNu?=
 =?utf-8?B?YnExNGpvSnNzUlpNS2ZwaDVhVVZ4b2pCNlhnY3FZRkdwYzZLcXpHL3VpWHRa?=
 =?utf-8?B?SXlhbkxvdzZKcHhlMU10RUpxbHo2R0Vldk1LRzY1UENSL05BcUVFa2NsS2d2?=
 =?utf-8?B?TG1ra05BK0VOZUlodnM4WWJIcVhrT0pIbXA0VndwM2F5aEZrZkYrU1BrTElr?=
 =?utf-8?B?UkxUL25ZQ3FiZlRJS2pKbkFaUHBzc1RpNWtCYVl0cmpYMnZDd0NmR1VtWExU?=
 =?utf-8?B?Sm5iMDdOWHR1OGxLVncyaFRVKzUzUnlTb0JXU0lSNUJSaE1GQ1hYUE1BWHN4?=
 =?utf-8?B?Y25QbkszMjJoU3E4a2E5Rm5VM3JRV1V1MjNaMkUrQUdIeHV0VzRBQmpYWXlI?=
 =?utf-8?B?a2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36852d3f-423b-4e10-0f2f-08dc27361351
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:07:18.5305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gebLUQgj433Mm6nKYlC3uY7GnJNFp1sMelLZhNdSfjEtfzQVVVJ0JqNneve6A43ezqDH+u5MyVRp1uA8zUv6rAd7MO7Qv99kK4G+YpvkXTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8378

SGkgU2VyZ2V5IFNodHlseW92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDUsIDIwMjQgNzowMSBQTQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY0IG5ldC1uZXh0IDEvMl0gcmF2YjogQWRkIFJ4IGNoZWNrc3Vt
IG9mZmxvYWQgc3VwcG9ydA0KPiBmb3IgR2JFdGgNCj4gDQo+IE9uIDIvMy8yNCA1OjI1IFBNLCBC
aWp1IERhcyB3cm90ZToNCj4gDQo+ID4gVE9FIGhhcyBoYXJkd2FyZSBzdXBwb3J0IGZvciBjYWxj
dWxhdGluZyBJUCBoZWFkZXIgYW5kIFRDUC9VRFAvSUNNUA0KPiA+IGNoZWNrc3VtIGZvciBib3Ro
IElQdjQgYW5kIElQdjYuDQo+ID4NCj4gPiBBZGQgUnggY2hlY2tzdW0gb2ZmbG9hZCBzdXBwb3J0
ZWQgYnkgVE9FIGZvciBJUHY0IGFuZCBUQ1AvVURQIHByb3RvY29scy4NCj4gPg0KPiA+IEZvciBS
eCwgdGhlIDQtYnl0ZSByZXN1bHQgb2YgY2hlY2tzdW0gY2FsY3VsYXRpb24gaXMgYXR0YWNoZWQg
dG8gdGhlDQo+ID4gRXRoZXJuZXQgZnJhbWVzLkZpcnN0IDItYnl0ZXMgaXMgcmVzdWx0IG9mIElQ
djQgaGVhZGVyIGNoZWNrc3VtIGFuZA0KPiA+IG5leHQgMi1ieXRlcyBpcyBUQ1AvVURQL0lDTVAg
Y2hlY2tzdW0uDQo+ID4NCj4gPiBJZiBhIGZyYW1lIGRvZXMgbm90IGhhdmUgY2hlY2tzdW0gZXJy
b3IsIDB4MDAwMCBpcyBhdHRhY2hlZCBhcw0KPiA+IGNoZWNrc3VtIGNhbGN1bGF0aW9uIHJlc3Vs
dC4gRm9yIHVuc3VwcG9ydGVkIGZyYW1lcyAweEZGRkYgaXMgYXR0YWNoZWQNCj4gPiBhcyBjaGVj
a3N1bSBjYWxjdWxhdGlvbiByZXN1bHQuIEluIGNhc2Ugb2YgYW4gSVB2NiBwYWNrZXQsIElQdjQN
Cj4gPiBjaGVja3N1bSBpcyBhbHdheXMgc2V0IHRvIDB4RkZGRi4NCj4gPg0KPiA+IFdlIGNhbiB0
ZXN0IHRoaXMgZnVuY3Rpb25hbGl0eSBieSB0aGUgYmVsb3cgY29tbWFuZHMNCj4gPg0KPiA+IGV0
aHRvb2wgLUsgZXRoMCByeCBvbiAtLT4gdG8gdHVybiBvbiBSeCBjaGVja3N1bSBvZmZsb2FkIGV0
aHRvb2wgLUsNCj4gPiBldGgwIHJ4IG9mZiAtLT4gdG8gdHVybiBvZmYgUnggY2hlY2tzdW0gb2Zm
bG9hZA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiBbLi4uXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
cmF2Yi5oDQo+ID4gaW5kZXggZTBmODI3NmNmZmVkLi42NGJmMjlkMDFhZDAgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4gPiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+IEBAIC0yMDUsNyArMjA1LDEwIEBA
IGVudW0gcmF2Yl9yZWcgew0KPiA+ICAJVExGUkNSCT0gMHgwNzU4LA0KPiA+ICAJUkZDUgk9IDB4
MDc2MCwNCj4gPiAgCU1BRkNSCT0gMHgwNzc4LA0KPiA+IC0JQ1NSMCAgICA9IDB4MDgwMCwJLyog
UlovRzJMIG9ubHkgKi8NCj4gPiArDQo+ID4gKwkvKiBSWi9HMkwgVE9FIHJlZ2lzdGVycyAqLw0K
PiANCj4gICAgVGhhbmtzLiBUaG91Z2ggSSB0aGluayBJJ2QgcHJlZmVyIC8qIFRPRSByZWdpc3Rl
cnMgKFJaL0cyTCBvbmx5KSAqLy4uLg0KDQpPSy4NCg0KPiANCj4gWy4uLl0NCj4gPiBAQCAtOTc4
LDYgKzk4MSwyMSBAQCBlbnVtIENTUjBfQklUIHsNCj4gPiAgCUNTUjBfUlBFCT0gMHgwMDAwMDAy
MCwNCj4gPiAgfTsNCj4gPg0KPiA+ICtlbnVtIENTUjJfQklUIHsNCj4gPiArCUNTUjJfUklQNAk9
IDB4MDAwMDAwMDEsDQo+ID4gKwlDU1IyX1JUQ1A0CT0gMHgwMDAwMDAxMCwNCj4gPiArCUNTUjJf
UlVEUDQJPSAweDAwMDAwMDIwLA0KPiA+ICsJQ1NSMl9SSUNNUDQJPSAweDAwMDAwMDQwLA0KPiA+
ICsJQ1NSMl9SVENQNgk9IDB4MDAxMDAwMDAsDQo+ID4gKwlDU1IyX1JVRFA2CT0gMHgwMDIwMDAw
MCwNCj4gPiArCUNTUjJfUklDTVA2CT0gMHgwMDQwMDAwMCwNCj4gPiArCUNTUjJfUkhPUAk9IDB4
MDEwMDAwMDAsDQo+ID4gKwlDU1IyX1JST1VUCT0gMHgwMjAwMDAwMCwNCj4gPiArCUNTUjJfUkFI
RAk9IDB4MDQwMDAwMDAsDQo+ID4gKwlDU1IyX1JESEQJPSAweDA4MDAwMDAwLA0KPiA+ICsJQ1NS
Ml9BTEwJPSAweDBGNzAwMDcxLA0KPiANCj4gICBJIGRvdWJ0IHdlIHJlYWxseSBuZWVkIENTUjJf
QUxMLi4uDQoNCldpbGwgcmVtb3ZlIGl0Lg0KPiANCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IGluZGV4IDBlMzczMWY1MGZjMi4u
NGYzMTBiY2VlN2MwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvcmF2Yl9tYWluLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jh
dmJfbWFpbi5jDQo+ID4gQEAgLTUyMiw2ICs1MjIsMjQgQEAgc3RhdGljIGludCByYXZiX3Jpbmdf
aW5pdChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiwNCj4gaW50IHEpDQo+ID4gIAlyZXR1cm4gLUVO
T01FTTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHJhdmJfY3N1bV9pbml0X2diZXRo
KHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KSB7DQo+ID4gKwlpZiAoIShuZGV2LT5mZWF0dXJlcyAm
IE5FVElGX0ZfUlhDU1VNKSkNCj4gPiArCQlnb3RvIGRvbmU7DQo+ID4gKw0KPiA+ICsJcmF2Yl93
cml0ZShuZGV2LCAwLCBDU1IwKTsNCj4gPiArCWlmIChyYXZiX3dhaXQobmRldiwgQ1NSMCwgQ1NS
MF9SUEUsIDApKSB7DQo+ID4gKwkJbmV0ZGV2X2VycihuZGV2LCAiVGltZW91dCBlbmFibGluZyBo
YXJkd2FyZSBjaGVja3N1bVxuIik7DQo+ID4gKwkJbmRldi0+ZmVhdHVyZXMgJj0gfk5FVElGX0Zf
UlhDU1VNOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlyYXZiX3dyaXRlKG5kZXYsIENTUjJfQUxM
ICYgfihDU1IyX1JUQ1A2IHwgQ1NSMl9SVURQNiB8DQo+ID4gKwkJCQkJICAgICAgQ1NSMl9SSUNN
UDYpLCBDU1IyKTsNCj4gDQo+ICAgIFdpdGggdGhlc2UgMyBiaXRzIGJlaW5nIDAsIHRoZSBiaXRz
IDI0Li4uMjcgYXJlIGlnbm9yZWQgYW55d2F5LCB0aGUNCj4gbWFudWFsIHNheXMuIFNvIEkgdGhp
bmsgSSdkIHByZWZlcjoNCj4gDQo+IAkJcmF2Yl93cml0ZShuZGV2LCBDU1IyX1JJUDQgfCBDU1Iy
X1JUQ1A0IHwgQ1NSMl9SVURQNCB8DQo+IENTUjJfUklDTVA0LA0KPiAJCQkgICBDU1IyKTsNCg0K
T0suDQoNCj4gDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICtkb25lOg0KPiA+ICsJcmF2Yl93cml0ZShu
ZGV2LCBDU1IwX1RQRSB8IENTUjBfUlBFLCBDU1IwKTsNCj4gDQo+ICAgIEkgdGhpbmsgd2Ugc2hv
dWxkbid0IHNldCBDU1IwLlRQRSB5ZXQgYXQgdGhpcyBwb2ludCwgYXMgd2Ugbid0IHNldHVwDQo+
IENTUjEgeWV0Li4uDQoNClRoaXMgd2lsbCBjYXVzZSByZWdyZXNzaW9uLiBBcyBib2FyZCB3b24n
dCBib290IGFzIHR4IGZhaWxzLiBTbyBDU1IwLntUUEUsUlBFfQ0KaXMgbXVzdC4NCg0KPiANCj4g
Wy4uLl0NCj4gPiBAQCAtMjMzNCwxMSArMjM4MSw0OCBAQCBzdGF0aWMgdm9pZCByYXZiX3NldF9y
eF9jc3VtKHN0cnVjdCBuZXRfZGV2aWNlDQo+ID4gKm5kZXYsIGJvb2wgZW5hYmxlKQ0KPiBbLi4u
XQ0KPiA+ICBzdGF0aWMgaW50IHJhdmJfc2V0X2ZlYXR1cmVzX2diZXRoKHN0cnVjdCBuZXRfZGV2
aWNlICpuZGV2LA0KPiA+ICAJCQkJICAgbmV0ZGV2X2ZlYXR1cmVzX3QgZmVhdHVyZXMpDQo+ID4g
IHsNCj4gPiAtCS8qIFBsYWNlIGhvbGRlciAqLw0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gKwluZXRk
ZXZfZmVhdHVyZXNfdCBjaGFuZ2VkID0gbmRldi0+ZmVhdHVyZXMgXiBmZWF0dXJlczsNCj4gPiAr
CXN0cnVjdCByYXZiX3ByaXZhdGUgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gPiArCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiArCXUzMiB2YWw7DQo+
ID4gKw0KPiA+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJnByaXYtPmxvY2ssIGZsYWdzKTsNCj4gPiAr
CWlmIChjaGFuZ2VkICYgTkVUSUZfRl9SWENTVU0pIHsNCj4gPiArCQlpZiAoZmVhdHVyZXMgJiBO
RVRJRl9GX1JYQ1NVTSkNCj4gPiArCQkJdmFsID0gQ1NSMl9BTEwgJiB+KENTUjJfUlRDUDYgfCBD
U1IyX1JVRFA2IHwNCj4gQ1NSMl9SSUNNUDYpOw0KPiANCj4gICAgTGlrZXdpc2UsIEknZCBwcmVm
ZXI6DQo+IA0KPiAJCQl2YWwgPSBDU1IyX1JJUDQgfCBDU1IyX1JUQ1A0IHwgQ1NSMl9SVURQNCB8
IENTUjJfUklDTVA0Ow0KDQpPay4NCg0KPiANCj4gPiArCQllbHNlDQo+ID4gKwkJCXZhbCA9IDA7
DQo+ID4gKw0KPiA+ICsJCXJldCA9IHJhdmJfZW5kaXNhYmxlX2NzdW1fZ2JldGgobmRldiwgQ1NS
MiwgdmFsLCBDU1IwX1JQRSk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJZ290byBkb25lOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCW5kZXYtPmZlYXR1cmVzID0gZmVhdHVyZXM7DQo+ID4gK2Rv
bmU6DQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgcmF2
Yl9zZXRfZmVhdHVyZXNfcmNhcihzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiwNCj4gWy4uLl0NCj4g
DQo+ICAgIE90aGVyd2lzZSBMR1RNLiBXZSdyZSBjbG9zZSEgOi0pDQoNCkkgd2lsbCBzZW5kIHY1
LCBiYXNlZCBvbiBhYm92ZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

