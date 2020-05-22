Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BAD1DE601
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 13:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgEVL6v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 07:58:51 -0400
Received: from mail-eopbgr1320103.outbound.protection.outlook.com ([40.107.132.103]:60048
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729030AbgEVL6u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 07:58:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNZQDfPSFFFRIKNV0xHwKF4O5tcmHPDwlT8lAIVIvIERdufLZ85A7OTM37nARFS/cnzo+LMQnKI2Sy8UqEkuDa0pTivKuNAE8b37UJC+4wfy5wtbvP0KAg6bzROMxcpoBepoSbGiE9b7uojhZeGAPXL64YBB42qCBEMRxDZreJ4nxTQK7P0NQ8KxxbCRdgvo0cO3dpWdOHDBnvrV1jSZs2T91ThD8T5sc4OEy/28txB7J2IWR4l4r+dts7q45bo8sGd28Z0AxZU6JWWGC4eaT41GMWFJHPtiGDr3O/7662Dpfxy4VAPzAgFcxfAZtc7bmMG/FpvnTDo32sgNzVrD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtREhOlY39I8Vx5OrBsIiRKxdzPbAYsWYp74RE46QHM=;
 b=d90mnZNflwOJePveYF6jDSx9TMiMk6vxfwf0rmYmkCFWkPxe1b7jf5yMpSXY9c3NTl8Dg3nUTowSVztR3CITY0PtitHiq2K8sHSgGBfMamYrhPDadcwZtv9TLGf6sq7uZdU0lbojtFpfIWltcLMZbU4aD6E8dvTQmqA0S2LxYw9/pFlSzTFUzmwKlIZaI5EIUBQ2vDLS9+7fZPW5oNcdM/E71S/JG+OBnXKABMYB7HrHzB1x6cdXbc9MvLJ6/F+wUnC8CMhMlh3FDjl3npDg1qkKofxbH9FPFyCw40D5K94Q6IesDGj6BtvZto9jWehaU071J78vowKuhFWdKFglfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtREhOlY39I8Vx5OrBsIiRKxdzPbAYsWYp74RE46QHM=;
 b=QadVQJt10dDHW556aAVX/03elJ0MJgvK4L6zFbEuLOSTK4v6XGC6ZBpzHTTWoQ1u34xf06KykjYm7yIB4DUWAIVc4h/2HmjCXpwi8K+bRAO3XeGiiwXYIPmUCm8M/aSP100rJJTvLfTFGUM6S88k8ZVo/kJhZyos9WrfCHZDRGM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4746.jpnprd01.prod.outlook.com (2603:1096:404:116::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 11:58:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 11:58:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "Shashikant.Suguni@in.bosch.com" <Shashikant.Suguni@in.bosch.com>
Subject: RE: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Topic: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Index: AQHWLNCCMO5ceqzAh0qZ614nN0icbqith5GAgAYRLtCAAGB8kIAADDwQ
Date:   Fri, 22 May 2020 11:58:45 +0000
Message-ID: <TY2PR01MB3692A45D81920C73C38E0E2CD8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
 <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
 <OSAPR01MB36831809AD6F3D66F1F39670D8B40@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <TY2PR01MB36925ABE9432E3F15EA778E2D8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36925ABE9432E3F15EA778E2D8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5157fe26-703a-4eae-cb6d-08d7fe477b40
x-ms-traffictypediagnostic: TY2PR01MB4746:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TY2PR01MB474656593DB14DB289F5174BD8B40@TY2PR01MB4746.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tpmv0C7r1CvEYsm+kt0HPH6hjZC/pv5/Z2j4CS3C4MtKiFTFcwo9fEyk5SE+/LRcZoo17bVnueCR01E5+rFwJY/S53NmR0z/WJeW+C5uI6Pd9NDppngC7xMaHbGBia0jikVWrJ0+pqlLvb5xtTF5j7icul2Afu2ro8v4HkHH49ff9LrBkU5PuWunZr2hBmt0CHbyBcahLT9XQi87zt+kcKRUor7aPvBSXGFz1nAUICXjnj1BRS8/dwm4FJUT3iZaOBVdDe9mhgZahpveleC1YAgTM+H/fXJ3dz4wNusR96AIJKHtnPA/e9HXukaGz60Mh/tBsPAeqWJbSCLZksKL3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(4326008)(186003)(26005)(66556008)(64756008)(66446008)(66476007)(52536014)(66946007)(53546011)(55236004)(76116006)(86362001)(5660300002)(110136005)(6506007)(2906002)(316002)(7696005)(2940100002)(8936002)(8676002)(71200400001)(9686003)(55016002)(107886003)(478600001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: P2rXa5N/HrUkAco72O+xCwoyZIZEFUkp9lBfG6T1t/dTkz6M7tgf+9surHkTDar1qQPX2mdQ3EO+vIHVtjqhK20KD/BlF6373Lu+kXqg0pZae3RqzXm6/Tb5CSK1CqohSqUMcCKdipUDRN3P2fcsvA3JIoQ/u5HaMIzyxyAn3xZ7gntd+VfgUdLsSNkDq8JBQJuA6H5xcgDrlmJZrjz6i8etZi1qzj4T3/h9z2Tl/UZ/FT6f/Led2RK4t1GYjhT/bnTr062b+PvHGzKT178ZcBLzJDTZSEJRtNba6kPY9EZun2qhkwk7FNFPg+B5GxyOiLpvhUCA1qfrOoehPuaK2isg32Ha6L9pWpJ5Oli0DJMa0PIPjskw0+1AgarLX275yOgL3LZpxWcjvfWmGHkJbvlZd61aaX6SSvPKSizKxZct1aGK60e8jaFWmQxSWsqimI1FEbpUuQM//bH+yPt0Nqxb+Zjkarwc+3Q6XSam2oJWwN5xBx+n3OxlkwVMI+gj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5157fe26-703a-4eae-cb6d-08d7fe477b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 11:58:45.9122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jQQqTNzdfEYhljIDWfaWqnBXdM9BjR9jIJzOkCgXR+jWgFtgHnN/JKS7n/mylnkilesadKSco382hvHCAhXT+DsMH5TBdEYFREajvz/mx5BgC6EgpWI4nQq/YkxaSNF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4746
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgYWdhaW4gYW5kIGFnYWluLA0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBTZW50OiBG
cmlkYXksIE1heSAyMiwgMjAyMCA4OjE3IFBNDQo+IA0KPiBIaSBhZ2FpbiwNCj4gDQo+ID4gRnJv
bTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IEZyaWRheSwgTWF5IDIyLCAyMDIwIDI6NTggUE0N
Cj4gPg0KPiA+IEhlbGxvIFNlcmdlaS1zYW4sDQo+ID4NCj4gPiA+IEZyb206IFNlcmdlaSBTaHR5
bHlvdiwgU2VudDogTW9uZGF5LCBNYXkgMTgsIDIwMjAgNTo0NSBQTQ0KPiA+ID4NCj4gPiA+IE9u
IDE4LjA1LjIwMjAgNzo1NCwgRGlyayBCZWhtZSB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IEFuYWx5
emluZyBbMV0gaXQgc2VlbXMgdGhlcmUgaXMgYSByYWNlIGNvbmRpdGlvbiB3aGVyZSByYXZiX3N0
YXJ0X3htaXQoKQ0KPiA+ID4gID4gY2FuIGJlIGNhbGxlZCBmcm9tIGludGVycnVwdCB3aGlsZSB0
eCBza2J1ZmZzIGFyZSBiZWluZyB0b3JuIGRvd24gaW4NCj4gPiA+ICA+IHRoZSBzY2hlZHVsZWQg
dGltZW91dCBoYW5kbGluZy4gVGhlIGFjdHVhbCB0aW1lb3V0IHdvcmsgaXMgZG9uZSBpbg0KPiA+
ID4gID4gcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBkdXJpbmcgd2hpY2ggdGhlIHR4IHNrYnVmZnMg
YXJlIHRvcm4gZG93biB2aWENCj4gPiA+ICA+IGludm9jYXRpb25zIG9mIHJhdmJfcmluZ19mcmVl
KCkuIEJ1dCB0aGVyZSBzZWVtcyB0byBiZSBubyBmbGFnIHRvIHRlbGwNCj4gPiA+ICA+IHRoZSBk
cml2ZXIgaXQgaXMgc2h1dHRpbmcgZG93biBzbyBpdCBjb250aW51ZXMgdG8gdXNlIHRoZSByaW5n
IGJ1ZmZlcg0KPiA+ID4gID4gd2hlbiBpdCBzaG91bGQgbm90Lg0KPiA+ID4gID4NCj4gPiA+ICA+
IEZpeCB0aGlzIGJ5IGRpc2FibGluZyB0aGUgaW50ZXJydXB0cyBpbiB0aGUgdGltZW91dCBoYW5k
bGVyLg0KPiA+ID4NCj4gPiA+ICAgICBIbSwgZ2l2ZW4gdGhhdCB3ZSBzdG9wIGFsbCBUWCBxdWV1
ZXMgcHJpb3IgdG8gdGVhcmluZyBkb3duIHRoZSBidWZmZXJzLA0KPiA+ID4gaXQgaXMgc29tZXdo
YXQgc3RyYW5nZSB0aGF0IHlvdSBzZWUgdGhlIGRyaXZlcidzIHNlbmQgcGF0aCBjYWxsZWQuLi4N
Cj4gPiA+ICAgICBCdXQgZGlzYWJsaW5nIHRoZSBpbnRlcnJ1cHRzIHNlZW1zIHRoZSBSaWdodCBU
aGluZyBhbnl3YXlzLi4uDQo+ID4NCj4gPiBJIGRpZG4ndCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBh
bmQgSSBkaWRuJ3Qga25vdyB0aGUgcm9vdCBjYXVzZSB5ZXQuDQo+ID4gQnV0LCBJJ20gZmVlbGlu
ZyB0byBzdHJhbmdlLiBFc3BlY2lhbGx5LCAicmF2Yl9zdGFydF94bWl0KCkgY2FuIGJlIGNhbGxl
ZCBmcm9tIGludGVycnVwdCIuDQo+ID4gSSBkaWRuJ3QgZmluZCB3aGVyZSByYXZiX3N0YXJ0X3ht
aXQoKSBjYW4gYmUgY2FsbGVkIGZyb20gaW50ZXJydXB0IGZvciBub3cuDQo+ID4NCj4gPiBCeSB0
aGUgd2F5LCBJJ20gdGhpbmtpbmcgdGhlIGZvbGxvd2luZyBtZXNzYWdlIGlzIHJlbGF0ZWQgdG8g
dGhlIGlzc3VlLg0KPiA+ID4gPiByYXZiIGU2ODAwMDAwLmV0aGVybmV0IGV0aGVybmV0OiBmYWls
ZWQgdG8gc3dpdGNoIGRldmljZSB0byBjb25maWcgbW9kZQ0KPiA+DQo+ID4gVGhlIHJhdmJfY29u
ZmlnKCkgb3V0cHV0IHRoZSBtZXNzYWdlIGlmIGZhaWxlZC4gQW5kLCByYXZiX3R4X3RpbWVvdXRf
d29yaygpDQo+ID4gY2FsbHMgcmF2Yl9jb25maWcoKSB2aWEgcmF2Yl9zdG9wX2RtYSgpIGFuZCBy
YXZiX2RtYWNfaW5pdCgpLg0KPiA+IC0tLQ0KPiA+IHJhdmJfdHhfdGltZW91dF93b3JrKCkgew0K
PiA+IAlyYXZiX3N0b3BfZG1hKCkJCS8vIGNhbGwgcmF2Yl9jb25maWcoKQ0KPiA+DQo+ID4gCXJh
dmJfcmluZ19mcmVlKCkJLy8gKjENCj4gPiA8c25pcD4NCj4gPiAJcmF2Yl9kbWFjX2luaXQoKQkv
LyBjYWxsIHJhdmJfY29uZmlnKCkNCj4gPiA8c25pcD4NCj4gPiB9DQo+ID4NCj4gPiByYXZiX2Rt
YWNfaW5pdCgpDQo+ID4gew0KPiA+IDxzbmlwPg0KPiA+IAllcnJvciA9IHJhdmJfY29uZmlnKCkJ
Ly8gImZhaWxlZCB0byBzd2l0Y2ggZGV2aWNlIHRvIGNvbmZpZyBtb2RlcyIgaGVyZSBhbmQgLUVU
SU1FRE9VVA0KPiA+IAlpZiAoZXJyb3IpDQo+ID4gCQlyZXR1cm4gZXJyb3IJLy8gKjINCj4gPiAJ
cmF2Yl9yaW5nX2luaXQoKQkvLyAqMw0KPiA+IDxzbmlwPg0KPiA+IH0NCj4gPiAtLQ0KPiA+DQo+
ID4gSWYgcmF2Yl9jb25maWcoKSBmYWlsZWQgYXQgdGhlICoyLCBzaW5jZSByYXZiX3JpbmdfaW5p
dCgpIHdhcyBub3QgY2FsbGVkLA0KPiA+IGFueSBkZXNjcmlwdG9ycyB3ZXJlIG5vdCBhbGxvY2F0
ZWQgYW5kIHRoZW4gdGhlIGlzc3VlIHNob3VsZCBoYXBwZW4uDQo+ID4gTm90ZSB0aGF0IGFjY29y
ZGluZyB0byB0aGUgZGF0YXNoZWV0LCB0aGUgY29udHJvbGxlciBjYW5ub3QgY2hhbmdlIHRoZQ0K
PiA+IG1vZGUgZnJvbSAiT3BlcmF0aW9uIiB0byBDb25maWd1cmF0aW9uIiB3aGVuIHRoZSBjb250
cm9sbGVyIGlzIGRvaW5nDQo+ID4gVFggb3IgUlguDQo+IA0KPiBJJ20gYWZyYWlkIGJ1dCwgdGhp
cyBzY2VuYXJpbyBzZWVtcyB3cm9uZyBiZWNhdXNlIGlmIHRoZSBjb250cm9sbGVyDQo+IGVudGVy
cyAiQ29uZmlndXJhdGlvbiIgb25jZSwgdGhlIGRyaXZlciBuZWVkcyB0byBjaGFuZ2UgdGhlIG1v
ZGUgdG8NCj4gIk9wZXJhdGlvbiIgZm9yIHN0YXJ0aW5nIGFueSB0cmFuc2ZlciBhZ2Fpbi4NCg0K
SSByZWFsaXplZCB0aGF0IHJhdmJfc3RvcF9kbWEoKSBpcyBwb3NzaWJsZSB0byByZXR1cm4gd2l0
aG91dCByYXZiX3Jjdl9zbmRfZGlzYWJsZSgpIGFuZA0KcmF2Yl9jb25maWcoKSBjYWxsaW5nIGlm
IFRDQ1Igb3IgQ1NSIHJlZ2lzdGVyIGluZGljYXRlcyB0cmFuc21pdCBpcyBzdGFydGVkLg0KDQo+
ID4gSSBkb24ndCBrbm93IHdoeSB0aGUgZmlyc3QgcmF2Yl9jb25maWcoKSBkb2Vzbid0IGZhaWwg
Zm9yIG5vdy4NCj4gPiBCdXQsIG15IHNjZW5hcmlvIGlzIG9uZSBvZiBmdW5jdGlvbnMgYmVsb3cg
ZW5hYmxlcyB0aGUgVFggYW5kIFJYDQo+ID4gYnkgY2FsbGluZyByYXZiX3Jjdl9zbmRfZW5hYmxl
KCk6DQo+ID4gIC0gcmF2Yl9lbWFjX2ludGVycnVwdF91bmxvY2tlZCgpIC4uLiBpZiBFU0NSX0xD
SE5HICYmICFub19hdmJfbGluayAmJiBQU1JfTE1PTg0KPiA+ICAtIHJhdmJfYWRqdXN0X2xpbmso
KSAuLi4gaWYgbm9fYXZiX2xpbmsgJiYgcGh5ZGV2LT5saW5rDQo+ID4gIC0gcmF2Yl9zZXRfcnhf
Y3N1bSgpIC4uLiBpZiBlbmFibGluZyBORVRJRl9GX1JYQ1NVTQ0KDQpJbiBzdWNoIHRoZSBjYXNl
IChyYXZiX3N0b3BfZG1hKCkgcmV0dXJucyB3aXRob3V0IGFueSBtZXNzYWdlKSwNCkkgdGhpbmsg
bXkgc2NlbmFyaW8gaXMgc3RpbGwgYWxpdmUgd2l0aG91dCBhbnkgdGhlc2UgZnVuY3Rpb25zIGNh
bGxpbmcNCmJlY2F1c2UgcmF2Yl9yY3Zfc25kX2Rpc2FibGUoKSBpcyBub3QgY2FsbGVkLg0KDQpJ
J2xsIGNoZWNrIHRoZSBUQ0NSIGFuZCBDU1IgcmVnaXN0ZXJzIGluIG5leHQgd2Vlay4NCg0KQmVz
dCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
