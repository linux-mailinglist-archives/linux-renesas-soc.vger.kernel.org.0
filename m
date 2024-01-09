Return-Path: <linux-renesas-soc+bounces-1380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B6827CA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 02:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CBE71C23115
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 01:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C8B17F4;
	Tue,  9 Jan 2024 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lb2onRVJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2A17D3;
	Tue,  9 Jan 2024 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rqgch0kA9jHIeUlAtVMCID1+R3nSEDN8OBJqXuDyLSOQCO5NUmvYF03j9saZOCzLPba8WQk4kq16APguCkt+BW3RyWVRsEg/NhhgJGzOeU0f8wH/ZXnVAOeYfW8DXaz+2dBbH6LivmHVpUE3zuQ5FdsHeMZwLfy1gEFmkzlCbRoc+qBsxGWpJhIF6SbTGAQ2iEnIHw+mMgZVrM6QDbrNdgV8imLTahgLsaAswTED65SiESBIuhKQ00FwflC5INxa0h7XzcuxIeh6+kKd8PRcq4RL+04rZXRnskpsARdDrDgpYp/zgED+/wKcRvW2oZ7B3awWaiEMfvzpu5AKX9l63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUIsXxP9Ss05f1CajIOilVhfBbaFgG8QL+QsD+JLftI=;
 b=KEPCxFo2QqndLiybdtw8aghBNQzA+CA6sSGGUgt+Z7UcGCgCcArOXXQf+Cxn47KI3rFDNIUN1EYHroRCyc7C6k02ZH++GXJN5ssS7Oj2BGAVVwv+JpjWxeALAtHlFMGgfSoHEyRqMN/apDjHh/1Zffs+T1LWIDBLMh1m6nbVVkQdsQ9chVP5rTq58i5RfAgFzzbkuoF6ELFi70Ep99us4FlJIHSlaI95kkcdveq63+52dp6skpXxWE0KF+8Fa1YG/Cqx+VcagmPMUpOouU67qkmu1tIYMBqVCLk0fF1X9zoeMMCbo9clNtwsCCsBqDZjvsu9gq55+rkjWbl2AAhDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUIsXxP9Ss05f1CajIOilVhfBbaFgG8QL+QsD+JLftI=;
 b=lb2onRVJL0p+0cAHOprFQ1PcxCs6juHgyepv/QW14uOtsw6jguoT3gy+Agp0pA/+DXKFq+zUrjDp/jBuS6eHZ0AZMxp+ykxXJGOzFTZ0gUx1NoaSeYCrVq6HOklqiQuUZi/aDcfjPNk81pKZbt6Ong6xcIggbLkLYNh4YQ6tpDM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB7800.jpnprd01.prod.outlook.com
 (2603:1096:400:182::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.15; Tue, 9 Jan
 2024 01:50:58 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::43bc:a2d0:a5a:9870%3]) with mapi id 15.20.7181.009; Tue, 9 Jan 2024
 01:50:58 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Simon Horman <horms@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Topic: [PATCH net] MAINTAINERS: I don't want to review Renesas Ethernet
 Switch driver
Thread-Index: AQHaPodboC5tS5xn9EWuxouQJIKuZbDImn8AgAGG2ICAAF99IIAAiwEAgAWxcqA=
Date: Tue, 9 Jan 2024 01:50:58 +0000
Message-ID:
 <TYBPR01MB53418EA8CA70CC7B54D399EED86A2@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <6498e2dd-7960-daeb-acce-a8d2207f3404@omp.ru>
 <20240103212822.GA48301@kernel.org>
 <8f9b5376-647a-7b59-886c-142990b8c9e4@omp.ru>
 <TYBPR01MB5341F4C4340200CABBFF5C05D8662@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
In-Reply-To: <ef96eb69-636c-a91c-e7b7-46b02241ad0d@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB7800:EE_
x-ms-office365-filtering-correlation-id: 7aabba6f-cfc1-494d-dce8-08dc10b56d14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JPmOMrEiGuHyNvJNpVs01TeU10VRWppGRcfOl2Zys4Vj2zgylsgz7ueLILJoBqMExQ9zQBhaHZ9UFXJ8e2UWEmFlimH8BMgNMhU7Vf9gyBohQLWfkZ4mIzIC1nMh/wYGlF6+2ZUv+3I21zTtN8jDb01Of5Q2o8tED+YAt+b4b1SceGNj51lAYYTB64eAIOYH99MVZtb64+xWBczX8EPjg+Dlt0B/W1/twKQgFXzoEwr6WuBq5qezVRhv9j+dqofO2THDQ9R2RAvzUybjXtJN0v5AYG/nafo27yvcFWJwEBiwLWBZ8yY23W+2lPJ8mLc1/TyxczQuj5oJAWZGO54+SW3g4CgZ7jTjwh2mxS+kpFuMbTREybQd6BMa2znI3kzKGH0Z34LKZzMKJKaKAgxVlhjm6v/pxQTF5oM2DC1KFo3ZTqu/kDRdfBzs11zpLQgqPSk+Aw1jGZ5iWKahPxgF3871xlhIvozl3sCtQaisitb61MMu+A+oCGMgEYqBLFqwRlGpX7EqsDwmKuUxA+C56NDeDhhg26HDUIRK/OSuLplkqdsJuzfRtzGM5BKGu11hn2rUeYwlJwP60eoPfcTKsYVwHMb0nalVWqiVFLz9NHrm7Eb0X9/6m7wyxyj8TmCc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(9686003)(5660300002)(83380400001)(76116006)(55016003)(110136005)(54906003)(316002)(478600001)(26005)(53546011)(71200400001)(6506007)(7696005)(66446008)(66556008)(64756008)(66476007)(66946007)(52536014)(4326008)(38070700009)(2906002)(41300700001)(38100700002)(33656002)(86362001)(122000001)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1VHbnMrVTU5UjRkSzRZYm9nQkJNUnlpUWlHL05oaGRZYlVnRlNTNXhXSmtF?=
 =?utf-8?B?QmNQZW5vcHdYWDBWa3ZlM1ZqNFJhVWRtakpRNW9QT0FQTENuRGJSenljUDhV?=
 =?utf-8?B?b1lib2NyWEQwdDBvU2VrT2xzaVBmU1pZR3k5N1laYmdzZmJDNmx3VmtJbEly?=
 =?utf-8?B?VmY2Vng4WlNKczZ2c29KVE5Ec1ZRdjJSa2tJSTk5Y2g0OE5GcjZxMTM0RjVH?=
 =?utf-8?B?TTdkNXozRVFZNDdLYWdRRHNsa1pWYXlIS1dVa1JQUDFDNlhkQi9FVEVZRXJt?=
 =?utf-8?B?U3RRN1JGVklzcnFjWE82WHgyVEJSWkNpTUpYRjNrV0QzYkdXV0tHY05zbDh3?=
 =?utf-8?B?ZFdXVVdYTmpVdUloeGdhTnNzT1I4TzhZSlBBSGRHSVk1LzhyM3pzN3FrTzVi?=
 =?utf-8?B?a2RtYUNhSnRUTU50ejlZaGdyWXZlUi96Q2hJbGZiSWRtdEM0Zk1iQmlmYk9M?=
 =?utf-8?B?RFBzSjZsWWVvMUVwTVZrRjBSSGtmU3U0aG5IemVrbFZtQ0xBaG1ra0RjcDJO?=
 =?utf-8?B?Rzd3elpTRjZvWGVES1JjUDlWTnRXMnYvaHA3Q3NkM05lQ09oSzVKaW9aV2l1?=
 =?utf-8?B?SkhGVXlIM2xZNXUxUDJJK0QxTFVaK0lTZk1QbXZXa1V5VzBveVkwOVU2cklP?=
 =?utf-8?B?QXZRTlNCSW5UVzduN2ZRWUs1bFBMRWxsS2Ryek5OMjBMRHNFSkNWVDliTExC?=
 =?utf-8?B?M3U1WENGNm0zUWpFbFh1czEvNmwyUFRyR2JrUStqdi9rZUxxK2JoRmQ0K2la?=
 =?utf-8?B?QllySGZYR2ZBOE5rOFV2MnV6TDFiZXRwcmpZNWoxNTNSNkhqL2toYUNlb2dQ?=
 =?utf-8?B?ZEVTZU00RnpmTGxKS0tsZEJVTllXMDlMaFU5NHJMQzgvNmFHTjJOa2U2eXJB?=
 =?utf-8?B?U2VILzBjWk5OdVRXaVRzRk1TdVRwankwMmtrL2Z4MTBEVVd5T0lBb3hmVXZD?=
 =?utf-8?B?RmZOK2d2ZWkraGVWdTRXRFFlSDZ1OTRtbEQ1MytiamI1RlRrbjV0NE9pTDBt?=
 =?utf-8?B?WW9aY2g5Mm8xeVhPYi9YazZXd2laTWhYdDRpcUQzeVpBYkFxVTZxclAwaHJQ?=
 =?utf-8?B?MGF1V3dYdVVodHJuTzFJY2hocHFEVVljVTBJdFZDZlRmN2FLWlRwVUtJMTVR?=
 =?utf-8?B?REM3MEJWVzduZ1pWRTc0a3Y4dEJwWHc0M21NUUp2Vi8zVkFieHFkZ1Zrbmlu?=
 =?utf-8?B?ZDBXOVMzVGtLWjNHenVBRWl3ODVSb0d3YVN1bkZpajV2dkFiTW1ObFpKR2ZT?=
 =?utf-8?B?MGRONnFiOGZBNUdsZnJKUDhUU1pzcDlGSUQvT2VNWU9UNk9FanVrRWR0WW9x?=
 =?utf-8?B?KzhKam10aThMT2k5MmVpbVhQdGc0SE1QalNkWFlGMGhlUW4zWmd5cHZ3K3Zj?=
 =?utf-8?B?b0ZYM2UxT1E0cENjS1FiaHJIbGJRdW1BeFlaUzJuZnNpVHIySUgwT0VZY0Vz?=
 =?utf-8?B?dlJaZHE2ZkxWdkFnNlQ3RDN0d0lYQnlHdWR3Tklqa3c2SkVvWjZYY1dDdHNL?=
 =?utf-8?B?N0JXWEl3SDBPbDJTemdnaFVGSUdqWm9nelFPK1VaRVgzazF2MW44aTdCdGJv?=
 =?utf-8?B?ckdYaCt5WCtXMjRhenBCeHgyRzQyVmUyV1dxTVpOWlZjZ3VaZnU5QVp2WDFu?=
 =?utf-8?B?NGtUZlNsUGk4dGdmR2ZaQktCUmh6M2xnVWdGT0JmZTgwK2pseUpNcTdPMU8r?=
 =?utf-8?B?aUpjRGJwR014UTBPd1gvWWkxalQxOVF3NVVBOEplR3VlVTdrMmt2VCtndFpD?=
 =?utf-8?B?L2Vaei9HblMxU0ZicFRVb1FQYjNrTER1bUJBRi9qS1Znc3p6VTBqR09ialhR?=
 =?utf-8?B?TDRCdnlYcVk0ZTlJM2RFTnc3Nnk2dG1TOVJZNVY1d1BJVUllclR1Q2NCUU9l?=
 =?utf-8?B?WWorZ2s1a0d4aEhNMzVYWWhsekFoVEt1dXRFVTY0WnpEVU9SYnE3Q2xMVzdV?=
 =?utf-8?B?RlVSRXBUYnRUN1BSTUZpb0RJWHYzb2Q3cU9zU0V5bHBXRDlKcUk1dGNCUVVp?=
 =?utf-8?B?dXFIZ2dDaTVlRjlMdTh5V2gwT1VVM1dUNVRhODJ5cHJxUjFFTGFRNEFQNm0r?=
 =?utf-8?B?VTU3N0llTFZOcG0rcjE0Ly91MVhXZFEzZ1VkQTFiTVNGM1BieWc5R3d0UE5U?=
 =?utf-8?B?a1RDVFZFbWN4MWZEUEE2czA3UktNTC8wOFRQMnlHR2xZRmhxM0R5bmQySmgz?=
 =?utf-8?B?eEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aabba6f-cfc1-494d-dce8-08dc10b56d14
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 01:50:58.4720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fRClDa2oYs4RExbs4GSFmJeZx49bibsoEQW2y7tAIrJeNR0tKFOqf5KkOOZ1uDFCLNCboyYucW0maotrnfEfEGQUQEaEBHHnZ+0y2yz3NTkD7FSwTKOtwnQbwux2iKdl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7800

SGkgU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogRnJpZGF5LCBKYW51
YXJ5IDUsIDIwMjQgNzo0NyBQTQ0KPiANCj4gT24gMS81LzI0IDU6NDIgQU0sIFlvc2hpaGlybyBT
aGltb2RhIHdyb3RlOg0KPiBbLi4uXQ0KPiANCj4gPj4+PiBJIGRvbid0IGtub3cgdGhpcyBoYXJk
d2FyZSwgSSBkb24ndCBoYXZlIHRoZSBtYW51YWxzIGZvciBpdCwgc28gSSBjYW4ndA0KPiA+Pj4+
IHByb3ZpZGUgYSBnb29kIHJldmlldy4gIExldCdzIGV4Y2x1ZGUgdGhlIEV0aGVybmV0IFN3aXRj
aCByZWxhdGVkIGZpbGVzLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNo
dHlseW92IDxzLnNodHlseW92QG9tcC5ydT4NCj4gPj4+DQo+ID4+PiBIaSBTZXJnZXksDQo+ID4+
DQo+ID4+ICAgSGkgU2ltb24sIGxvbmcgdGltZSwgbm8gc2VlLi4uIDotKQ0KPiA+Pg0KPiA+Pj4g
SSBkb24ndCBrbm93IHRoZSBiYWNrIHN0b3J5IHRvIHRoaXMsIGlmIHRoZXJlIGlzIG9uZS4NCj4g
Pj4NCj4gPj4gICAgTm90IG11Y2ggb2YgYSBoaXN0b3J5OiBJIGdvdCBhIGxvdCBvZiB0aGUgcnN3
aXRjaCBwYXRjaGVzIGluIG15DQo+ID4+IGluYm94IGFuZCBJIG1vc3RseSBpZ25vcmVkIHRoZW0u
Li4gYnV0IGtlcHQgZGVmZXJyaW5nIHRoaXMgcGF0Y2ggZHVlDQo+ID4+IHRvIGEgaGlnaCBsb2Fk
IHdpdGggZml4aW5nIFN2YWNlJ3MgcmVwb3J0cyBhdCB3b3JrLi4uDQo+ID4+DQo+ID4+PiBCdXQg
Y291bGQgSSBzdWdnZXN0IHRoYXQ6DQo+ID4+Pg0KPiA+Pj4gMS4gVGhlIHBhdGNoIGFsc28gdXBk
YXRlcyB0aGUgdGl0bGUgTUFJTlRBSU5FUlMgc2VjdGlvbiB0byBjb3ZlciB0aGUNCj4gPj4+ICAg
IHJlbWFpbmluZyB0d28gZHJpdmVycy4NCj4gPj4+DQo+ID4+PiAgICBlLmcuOiBSRU5FU0FTIEVU
SEVSTkVUIERSSVZFUlMgLT4NCj4gPj4+ICAgICAgICAgIFJFTkVTQVMgRVRIRVJORVQgQVZCIEFO
RCBTVVBFUkggRVRIRVJORVQgRFJJVkVSUw0KPiA+Pj4NCj4gPj4+ICAgIE9yIGFsdGVybmF0aXZl
bHksIGNyZWF0ZSBzZXBhcmF0ZSBzZWN0aW9ucyBmb3IgZWFjaCBkcml2ZXIuDQo+ID4+DQo+ID4+
ICAgIFllYWgsIHRoaXMgMm5kIG9wdGlvbiBzZWVtcyBjbGVhbmVyLiBTdGlsbCBub3Qgc3VyZSBh
Ym91dCBLY29uZmlnLw0KPiA+PiBNYWtlZmlsZSB0aG91Z2guLi4NCj4gPg0KPiA+IEhvdyBhYm91
dCBhZGRpbmcgIkNPTU1PTiBQQVJUUyIgc2VjdGlvbj8NCj4gPg0KPiA+IC0gUkVORVNBUyBFVEhF
Uk5FVCBBVkIgQU5EIFNVUEVSSCBFVEhFUk5FVCBEUklWRVJTIDogRm9yIHJhdmIgYW5kIHNoX2V0
aA0KPiA+IC0gUkVORVNBUyBFVEhFUk5FVCBEUklWRVJTIChDT01NT04gUEFSVFMpIDogRm9yIEtj
b25maWcvTWFrZWZpbGUgaW4gZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcw0KPiA+IC0gUkVO
RVNBUyBFVEhFUk5FVCBTV0lUQ0ggRFJJVkVSIDogRm9yIHJzd2l0Y2gNCj4gDQo+ICAgIE5vLCB0
aGlzIHNlZW1zIHRvbyBtdWNoIGZvciB0aGVzZSBwb29yIGxpdHRsZSBjb3VwbGUgZmlsZXMuIDot
KQ0KPiBMaXN0aW5nIHRoZW0gaW4gZWFjaCBuZXcgTUFJTlRBSU5FUlMgZW50cnkgc2hvdWxkIGFj
aGlldmUgdGhlIHNhbWUgZ29hbA0KPiBhbmQgc2VlbXMgYSBiaXV0IGNsZWFuZXIuLi4NCg0KQXMg
SSByZXBsaWVkIG9uIG90aGVyIHRocmVhZCwgSSB0aGluayBKYWt1YidzIGlkZWEgaXMgZ29vZC4N
Cg0KPiA+Pj4gICAgbi5iLjogVGhpcyBtYXkgaW52b2x2ZSBtb3Zpbmcgc2VjdGlvbnMgdG8gbWFp
bnRhaW4gYWxwaGFiZXRpY2FsIG9yZGVyDQo+ID4+PiAgICAgICAgICBieSBzZWN0aW9uIHRpdGxl
DQo+ID4+Pg0KPiA+Pj4gMi4gUmVhY2hpbmcgb3V0IHRvIFNoaW1vZGEtc2FuIChDQ2VkKSBvciBv
dGhlciByZWxldmFudCBwYXJ0aWVzDQo+ID4+PiAgICB0byBzZWUgaWYgYW4gYXBwcm9wcmlhdGUg
bWFpbnRhaW5lciBvciBtYWludGFpbmVycyBmb3IgdGhlDQo+ID4+PiAgICBSZW5lc2FzIEV0aGVy
bmV0IFN3aXRjaCBkcml2ZXIgY2FuIGJlIGZvdW5kLg0KPiA+DQo+ID4gSSdtIGhhcHB5IGlmIEkn
bSBhIG1haW50YWluZXIgZm9yIFJlbmVzYXMgRXRoZXJuZXQgU3dpdGNoIGRyaXZlci4NCj4gDQo+
ICAgIERvIHlvdSB3YW50IHRvIGJlIGEgbWFpbnRhaW5lciBvciBqdXN0IGEgcmV2aWV3ZXIgKGxp
a2UgbWUpPw0KDQpJIHdhbnQganVzdCBhIHJldmlld2VyLg0KDQo+ID4gU28sIGlmIG15IGlkZWEg
YWJvdmUgaXMgYWNjZXB0YWJsZSwgcGVyaGFwcyB0aGUgbWFpbnRhaW5lcnMgY2FuIGJlOg0KPiA+
DQo+ID4gLSBSRU5FU0FTIEVUSEVSTkVUIEFWQiBBTkQgU1VQRVJIIEVUSEVSTkVUIERSSVZFUlMg
OiBTZXJnZXkNCj4gDQo+ICAgIFRoZXJlIHdpbGwgYmUgc2VwYXJhdGUgZW50cmllcyBmb3IgdGhv
c2UuLi4NCj4gDQo+ID4gLSBSRU5FU0FTIEVUSEVSTkVUIERSSVZFUlMgKENPTU1PTiBQQVJUUykg
OiBTZXJnZXkgYW5kIFNoaW1vZGENCj4gDQo+ICAgIEknZCBsaWtlIHRvIGF2b2lkIHRoYXQuLi4g
Oi0pDQo+IA0KPiA+IC0gUkVORVNBUyBFVEhFUk5FVCBTV0lUQ0ggRFJJVkVSIDogU2hpbW9kYQ0K
PiANCj4gPj4+ICAgIG4uYi46IEl0IG1heSBzdGlsbCBiZSBhIGhvbGlkYXkgcGVyaW9kIGluIEph
cGFuIGZvciB0aGUgcmVzdCBvZiB0aGUgd2Vlay4NCj4gPj4NCj4gPj4gICAgSXQncyBhIGhvbGlk
YXkgcGVyaW9kIGhlcmUgaW4gUnVzc2lhIGFzIHdlbGwsIHRpbGwgdGhlIDh0aCBvZiBKYXVuYXJ5
LiA6LSkNCj4gPg0KPiA+IEknbSBiYWNrIGZyb20gdG9kYXksIGJ1dCBuZXh0IE1vbmRheSAoOHRo
KSBpcyBhIGhvbGlkYXkgaW4gSmFwYW4gOikNCj4gDQo+ICAgIFlvdSdyZSBiYWNrIGZvciAxIGRh
eT8gOi0pDQoNClllcyA6KQ0KDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IFlvc2hpaGlybyBTaGlt
b2RhDQo+ID4NCj4gPj4+IDMuIFJlcGhyYXNlIHRoZSBzdWJqZWN0IGFuZCBwYXRjaCBkZXNjcmlw
dGlvbiBhcyBzcGxpdHRpbmcgb3V0IG1haW50ZW5hbmNlIG9mDQo+ID4+PiAgICB0aGUgUmVuZXNh
cyBFdGhlcm5ldCBTd2l0Y2ggZHJpdmVyIC4NCj4gDQo+ICAgIFRoZSBxdWVzdGlvbiB0aGF0IHJl
bWFpbnMgc3RpbGwgdW5hZGRyZXNzZWQ6IHNob3VsZCBJIGRvIHRoZSBNQUlOVEFJTkVSUw0KPiAi
ZGlyZWN0b3J5IHNwbGl0IiB3aXRoIGEgc2luZ2xlIHBhdGNoPw0KDQpBcyBTaW1vbi1zYW4gbWVu
dGlvbmVkLCBhIHNpbmdsZSBwYXRjaCBpcyBlYXN5LCBJIHRoaW5rLg0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K

