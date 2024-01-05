Return-Path: <linux-renesas-soc+bounces-1299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAC824D19
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 03:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8FD8B243BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 02:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B4B20EB;
	Fri,  5 Jan 2024 02:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="In49C9ZS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA420F7;
	Fri,  5 Jan 2024 02:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC+WTA1dDrEjiuTpjdjat1XwXZoVBH5520tpMgeT6Aq6j0wBX8enpLSckl3+v/QAB04wXyjeGyi3t9MP4SUDiHNKD3P46haq4YFkOrQCMoSiEkz1EcH97woszo4/mNpW8fzqfphGKgYBqlY7A0UARYM/6wDq8w0vV4u0/2YEkj2uO9/wzHWpoTz4l34q0Mhd20mPmg6n4bFX4XrxFEs8rOY50R17IARRax3E7yXpCB/YeO8o4W59B2z0eV+qcqbZM1to9Gcxp7f8OpMvfnlgLoQTdGiDPd7J832GvWgIX5MMD3Nh850ITXHVvAgwLCv5QuWBzVOVi1Vcb6vYEqHbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6wASEq59F6oKrGqLEOr1G/m0hWsFW2BcHUe5TK/Ys4=;
 b=OWI+qcOYeo65onjAn3PCFpVyZSHbrCIe7tHeut1N22EQcYJ+ZWmZ4rJuXPjgNHQffWANpI3vagVOJER7q+xDEnIacP0aay0ELsPStSMyv623hCCwQonoDiw0rEmCfMl0L5ReWLEbQV3RmChXQvpRbHU8//nsjsveC0F5NyarSCXaMTSU6OlTPG8W7/7YQse8vCj3zfSmdZJuGvX6ZjId4iMArQfDkky9mL5zEIKuq1uDPh88vtqIJjSQYkJRYx2/aGUUx1Jx7/68bCWp89lTSP6UQB9O+WjTXwPVZHhCz9w5Bdp1+f0D9yFMFdiHwnPF32V83W8jY7tSDnI/220W5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6wASEq59F6oKrGqLEOr1G/m0hWsFW2BcHUe5TK/Ys4=;
 b=In49C9ZST1YBzhpcl0wycWkplZRtq5P27Jy+OooHLr3eavVbPmT6O4evXzJyz0fukfuEs8Qr1GMrHsYfq95c1UhB5UUFLjWQ2nDbM5lM6lgITqLByFwfUJuLYYcbj9Ai5YWNRvhwxumGyt6MtqoDeez1R3PK8DFwQ64nejAPAAc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB6293.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9; Fri, 5 Jan
 2024 02:42:54 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870%3]) with mapi id 15.20.7181.009; Fri, 5 Jan 2024
 02:42:54 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Simon Horman <horms@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Topic: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Index: AQHaPodboC5tS5xn9EWuxouQJIKuZbDImn8AgAGG2ICAAF99IA==
Date: Fri, 5 Jan 2024 02:42:54 +0000
Message-ID:
 <TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103212822.GA48301@kernel.org>
 <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
In-Reply-To: <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB6293:EE_
x-ms-office365-filtering-correlation-id: 2bc4abd3-6426-41f6-1bbf-08dc0d980478
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6HE1AgWG2+hNX9hGke8VTrhWuyizi/9hZeMgqxV/WQudfYdc4xF5OMRg3pZKqYpXEIkl6IH6KvqhMSo3D+nG19XD/hQhZXwmbbJfUfuvkHMd/MJjIFFXGiH/jhqkC4wT9lj8A74nosDdLmB9dH8NhVR6F0vxl8co/frbwEguiXXlZkEfmCul++OtR0W5XpiD+g4c5h7u9ZInEOIhRn09sdfW9SRjRteRKp6OPnNDU+JSWsJzW1S281JgNljx9yF5R7eN05H0cL6to1hfr/TWd5Np47IJfd2UB0hxnOwC48dZoBEP8Bw+I6/A5PXz8nAUrajT0QbFODzMnKqWpcJ7AthDLmiaVgjEOevte79jUqP0pFlloGVnmM5N7SOHY9Qjm8SPED5hacoWtxkWuBjhQQIjIlF179lMleD7YXV0YBirrd4tX+NZF9JFBaeoHgc4d4D8wu63UmKZ9BAqPsnGuarDDC6OLuQWtF5LlPQ0CqpBULBWA7aClS0D9+1VPNK0MUnKyo6HDpqrH90aTDEhnYQ5ffpXktIUsGUtK6nhptommwUNszkw4WqBgJD2GEP8pxIfwKNapHryvWgX9R7YbfCOY16UTOkxVKT8zD1xaqGwDPhviJmH11KtHz5n1o3y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(33656002)(86362001)(26005)(53546011)(122000001)(9686003)(71200400001)(7696005)(6506007)(110136005)(38100700002)(83380400001)(478600001)(54906003)(316002)(8676002)(8936002)(66556008)(66476007)(64756008)(76116006)(66446008)(66946007)(55016003)(41300700001)(2906002)(52536014)(5660300002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2lpNkdRaks1eklQRm1IVTFreDRPT1VRVkJ5b3NJYmdTYkFRVGJwUVExL1lu?=
 =?utf-8?B?NG9FVVQwV0dIV0Q2eXBMZkJhVEhiODlYcGRIcThuckRIdGFuN3NNSitlOXhy?=
 =?utf-8?B?aTIvZXB4elY1Z2dvb1lZNTR3RXlVZE1ldmZ4V1hEZ2VDQ3lITzh0ZXN2ZGdI?=
 =?utf-8?B?cUo4YjF4QldJQ1BKTlJFRFJURzE0OTdhMGR3ODd4U2QzYSsxQzNRSGVCV2hV?=
 =?utf-8?B?WTRnTXhlMnBmclJsSFQwOGtyTVN1NngxMFhiNlJiN1c5bWVybTM1SnRKMEpB?=
 =?utf-8?B?U1ZSNkRJR21nU2xOZDNJekZNOWxhRm1MWEI3V0NSTU56aUlpdzZIc1JmQmt0?=
 =?utf-8?B?bG5TSXNqdklRdE1kaWdUa0hleTlySXVVQlVYbXVnSjZobk1UZXlhZldCQW1G?=
 =?utf-8?B?VktJOXRoOTJYWFJyYWVBbHVWRm9jZkZLczR4aC8wZEJCOFovNlAzbDUyaTAy?=
 =?utf-8?B?eTdBL3AzdW9MWFFLNHVLNTBBVDNjajU0RjdRRkhqdFM3MkhXVnlaSUNHelpa?=
 =?utf-8?B?T0VJQmFMSWdDL2lMMUx2cXVISUJVRXVzZHBGd05WRE5nV0RzZ2Mza3h4dCs5?=
 =?utf-8?B?cjl4OWNGdDRMOVhRR0pzS1JDR3gvVVY5ZS9TMlFOMGM3K2t3MXE4SitzN0JV?=
 =?utf-8?B?dU14c3FDZTJBWTMvdTJRaldXdFU3TkIzWnowMmNoRWI4M2RlZVhiUlQvM3dS?=
 =?utf-8?B?K1ljbGdxYlBmYWFYZEVIclJsWFpKQXBYUWx6cXpSN3FFOVIzK3JHUmNJTHBR?=
 =?utf-8?B?cWlqM2hMdHNDWDFIUkFVeWtNUnVpbXQzbkYzbytCTGYxdjdsVHdEelBicllt?=
 =?utf-8?B?T1F5bE1DZHg5aTFaNUlLQnlTSk5WcFo3ODhycDNrQkhJVzIzMjltbC9qU0cx?=
 =?utf-8?B?V1ZQTDk1VC8rSlBIVXF4ZUlNYm0rd2hGOUZ6M1pNMjFsWmxabUp4WWlMN3VJ?=
 =?utf-8?B?cHdnWmJJQnIzQXBhR0kwdmVSR0JqY2MvdWdobnA2UkV2SXNyZG9vM3poZUhO?=
 =?utf-8?B?SjJuU0RYUkYvbHpVenAwVkh6N2dJQThCcXpaVTZMelpTZnBnRGVHcFU2QWo3?=
 =?utf-8?B?cmJBckZxNndwNXJkSzIvNEpUb3ZEaVhrMVlLOGFDOU5GYU9FU1pGWDIvMGhL?=
 =?utf-8?B?czE5Y0NKS05OYXhwNUtocVNNWlpDT2o5enVTWDhSMEZxYXd0TlJSQ0VPaUFt?=
 =?utf-8?B?aUxLa3lxQ1JZKzVnMkMzZDh6MXBLV1JpVEZTK1pBamFiRzBHZ3oyaUlUUW9L?=
 =?utf-8?B?dFFIM2x5aExub3dCT1l6bzJHSHMzZXg1MkFYM1BDM2hOVWFLSnVwQStEWndK?=
 =?utf-8?B?ZmdPNmlHanFoWDRWWUtKWWtwQWN1c2trWmt3aFJJYmlWRk5FOGYyMzA3SUVP?=
 =?utf-8?B?dks2WmJYaTBuK1ViUWU1Tmg1c0hhTWxmR1JFU2hmTEUyZGFCQ0lHaWhLemtJ?=
 =?utf-8?B?c0JhMko4b2FicnBSdlpVRW5uNmZKWjJDUzZNakUwSjVLMjdIKyt0dWNSWU1H?=
 =?utf-8?B?OWNYQkdnK2FmY0xKQzVTcjVvRk42QVdLa0QycS9xeGJMZTQvSUNNU2hHRFFv?=
 =?utf-8?B?VFdSaGxrVjRMYTljUm5BNzZYR3FBSUhPdlFhd3diTHQ5TjRNaDV3aXhDWnNR?=
 =?utf-8?B?ak5YQ0hPVjBkN2xtaUhLc3hWNGM5dzJsNHBZbXlncURnZEdRRndLbnhoUDVB?=
 =?utf-8?B?UU9mWFpJNzRwaTRVZnJ3b1NOOE5tOENTMnh5OTdTMkpSWEVNNURZOENlcit5?=
 =?utf-8?B?bUFZdG9VZThiMy96VFNjeHVSNmp1WGtHS04zUmVWdnZxUENqbk5WdGEvdGV6?=
 =?utf-8?B?bjFTTTc3RHEwOXpCR3Q0NElleGg4aGtUT2pUaFhTakxtZ3BFOXR4NmFQaytN?=
 =?utf-8?B?am10SGNtWTV3YzNBNkwwemdJbVU4eVA4cFdYSjNBY2dTUnJ4Y0huWFBxZWtF?=
 =?utf-8?B?Lzh6eFAvSENEQzZNeW1pekpBOVdPeFpTbElyNVVRUCtpd1pwSmxpOEpqR0py?=
 =?utf-8?B?cGs3enBXTFRPbExlOHZsWGhhYjVwVG1Ebk1PTjVqa3BCQUFGZHk5eDVVbjJB?=
 =?utf-8?B?WUozTHloTDJtbVM2T2Z2Z2oyTjVwa2h1UjdsU0sxOWNhTGx4TFZBV3hkWVVE?=
 =?utf-8?B?dU8xRHdCbVR6ZFllY2ZoZmgwMUtTWWM4OXJQZG9kSVdDRjhUNHFzN2I4dzBT?=
 =?utf-8?B?Ymc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc4abd3-6426-41f6-1bbf-08dc0d980478
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 02:42:54.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JsNFgo4DbuGoGstwk8pXAFRDQSxKFURRJ3xtLbiXJBb5VL/qqayR98ZrhEa31t2Mb8ocXCvak+y/aNLQ35OQgFMLWy/6U1Z9xWCNYooKxmjlIhjzgwHpkSrlLCpkUyVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6293

SGVsbG8sDQoNClRoYW5rIHlvdSBmb3IgYWRkaW5nIENDIHRvIG1lLg0KDQo+IEZyb206IFNlcmdl
eSBTaHR5bHlvdiwgU2VudDogRnJpZGF5LCBKYW51YXJ5IDUsIDIwMjQgNTo0NyBBTQ0KPiANCj4g
T24gMS80LzI0IDEyOjI4IEFNLCBTaW1vbiBIb3JtYW4gd3JvdGU6DQo+IFsuLi5dDQo+ID4+IEkg
ZG9uJ3Qga25vdyB0aGlzIGhhcmR3YXJlLCBJIGRvbid0IGhhdmUgdGhlIG1hbnVhbHMgZm9yIGl0
LCBzbyBJIGNhbid0DQo+ID4+IHByb3ZpZGUgYSBnb29kIHJldmlldy4gIExldCdzIGV4Y2x1ZGUg
dGhlIEV0aGVybmV0IFN3aXRjaCByZWxhdGVkIGZpbGVzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5b3ZAb21wLnJ1Pg0KPiA+DQo+ID4gSGkgU2Vy
Z2V5LA0KPiANCj4gICBIaSBTaW1vbiwgbG9uZyB0aW1lLCBubyBzZWUuLi4gOi0pDQo+IA0KPiA+
IEkgZG9uJ3Qga25vdyB0aGUgYmFjayBzdG9yeSB0byB0aGlzLCBpZiB0aGVyZSBpcyBvbmUuDQo+
IA0KPiAgICBOb3QgbXVjaCBvZiBhIGhpc3Rvcnk6IEkgZ290IGEgbG90IG9mIHRoZSByc3dpdGNo
IHBhdGNoZXMgaW4gbXkNCj4gaW5ib3ggYW5kIEkgbW9zdGx5IGlnbm9yZWQgdGhlbS4uLiBidXQg
a2VwdCBkZWZlcnJpbmcgdGhpcyBwYXRjaCBkdWUNCj4gdG8gYSBoaWdoIGxvYWQgd2l0aCBmaXhp
bmcgU3ZhY2UncyByZXBvcnRzIGF0IHdvcmsuLi4NCj4gDQo+ID4gQnV0IGNvdWxkIEkgc3VnZ2Vz
dCB0aGF0Og0KPiA+DQo+ID4gMS4gVGhlIHBhdGNoIGFsc28gdXBkYXRlcyB0aGUgdGl0bGUgTUFJ
TlRBSU5FUlMgc2VjdGlvbiB0byBjb3ZlciB0aGUNCj4gPiAgICByZW1haW5pbmcgdHdvIGRyaXZl
cnMuDQo+ID4NCj4gPiAgICBlLmcuOiBSRU5FU0FTIEVUSEVSTkVUIERSSVZFUlMgLT4NCj4gPiAg
ICAgICAgICBSRU5FU0FTIEVUSEVSTkVUIEFWQiBBTkQgU1VQRVJIIEVUSEVSTkVUIERSSVZFUlMN
Cj4gPg0KPiA+ICAgIE9yIGFsdGVybmF0aXZlbHksIGNyZWF0ZSBzZXBhcmF0ZSBzZWN0aW9ucyBm
b3IgZWFjaCBkcml2ZXIuDQo+IA0KPiAgICBZZWFoLCB0aGlzIDJuZCBvcHRpb24gc2VlbXMgY2xl
YW5lci4gU3RpbGwgbm90IHN1cmUgYWJvdXQgS2NvbmZpZy8NCj4gTWFrZWZpbGUgdGhvdWdoLi4u
DQoNCkhvdyBhYm91dCBhZGRpbmcgIkNPTU1PTiBQQVJUUyIgc2VjdGlvbj8NCg0KLSBSRU5FU0FT
IEVUSEVSTkVUIEFWQiBBTkQgU1VQRVJIIEVUSEVSTkVUIERSSVZFUlMgOiBGb3IgcmF2YiBhbmQg
c2hfZXRoDQotIFJFTkVTQVMgRVRIRVJORVQgRFJJVkVSUyAoQ09NTU9OIFBBUlRTKSA6IEZvciBL
Y29uZmlnL01ha2VmaWxlIGluIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMNCi0gUkVORVNB
UyBFVEhFUk5FVCBTV0lUQ0ggRFJJVkVSIDogRm9yIHJzd2l0Y2gNCg0KPiA+ICAgIG4uYi46IFRo
aXMgbWF5IGludm9sdmUgbW92aW5nIHNlY3Rpb25zIHRvIG1haW50YWluIGFscGhhYmV0aWNhbCBv
cmRlcg0KPiA+ICAgICAgICAgIGJ5IHNlY3Rpb24gdGl0bGUNCj4gPg0KPiA+IDIuIFJlYWNoaW5n
IG91dCB0byBTaGltb2RhLXNhbiAoQ0NlZCkgb3Igb3RoZXIgcmVsZXZhbnQgcGFydGllcw0KPiA+
ICAgIHRvIHNlZSBpZiBhbiBhcHByb3ByaWF0ZSBtYWludGFpbmVyIG9yIG1haW50YWluZXJzIGZv
ciB0aGUNCj4gPiAgICBSZW5lc2FzIEV0aGVybmV0IFN3aXRjaCBkcml2ZXIgY2FuIGJlIGZvdW5k
Lg0KDQpJJ20gaGFwcHkgaWYgSSdtIGEgbWFpbnRhaW5lciBmb3IgUmVuZXNhcyBFdGhlcm5ldCBT
d2l0Y2ggZHJpdmVyLg0KU28sIGlmIG15IGlkZWEgYWJvdmUgaXMgYWNjZXB0YWJsZSwgcGVyaGFw
cyB0aGUgbWFpbnRhaW5lcnMgY2FuIGJlOg0KDQotIFJFTkVTQVMgRVRIRVJORVQgQVZCIEFORCBT
VVBFUkggRVRIRVJORVQgRFJJVkVSUyA6IFNlcmdleQ0KLSBSRU5FU0FTIEVUSEVSTkVUIERSSVZF
UlMgKENPTU1PTiBQQVJUUykgOiBTZXJnZXkgYW5kIFNoaW1vZGENCi0gUkVORVNBUyBFVEhFUk5F
VCBTV0lUQ0ggRFJJVkVSIDogU2hpbW9kYQ0KDQo+ID4gICAgbi5iLjogSXQgbWF5IHN0aWxsIGJl
IGEgaG9saWRheSBwZXJpb2QgaW4gSmFwYW4gZm9yIHRoZSByZXN0IG9mIHRoZSB3ZWVrLg0KPiAN
Cj4gICAgSXQncyBhIGhvbGlkYXkgcGVyaW9kIGhlcmUgaW4gUnVzc2lhIGFzIHdlbGwsIHRpbGwg
dGhlIDh0aCBvZiBKYXVuYXJ5LiA6LSkNCg0KSSdtIGJhY2sgZnJvbSB0b2RheSwgYnV0IG5leHQg
TW9uZGF5ICg4dGgpIGlzIGEgaG9saWRheSBpbiBKYXBhbiA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpZ
b3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gMy4gUmVwaHJhc2UgdGhlIHN1YmplY3QgYW5kIHBhdGNo
IGRlc2NyaXB0aW9uIGFzIHNwbGl0dGluZyBvdXQgbWFpbnRlbmFuY2Ugb2YNCj4gPiAgICB0aGUg
UmVuZXNhcyBFdGhlcm5ldCBTd2l0Y2ggZHJpdmVyIC4NCj4gDQo+IFsuLi5dDQo+IA0KPiBNQlIs
IFNlcmdleQ0K

