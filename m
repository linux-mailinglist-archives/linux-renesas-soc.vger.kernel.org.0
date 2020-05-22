Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67871DE532
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 13:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgEVLQn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 07:16:43 -0400
Received: from mail-eopbgr1310138.outbound.protection.outlook.com ([40.107.131.138]:9574
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728371AbgEVLQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 07:16:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDViCg2AZ6nKgoOp/QJyJK3bIgOnVZi92bg7sjKy72E6OQB8WKte59we/IlnI18e3pk5cCd/W1/SnA0SeLD3K7VswrjdsNbNixTnlvEmOPKvMfRh6wP2/wFoua16JDQiULvq237tc5ZfYkWm0xes6EzP16+2UcAByrxklN8NWHWvzzh62Bt3cipyStLDshPsLWe8kWgz2dVWz7t4HojIJLqwM8BFWWFIpOimqegsjGP/sW/1U0xpKSIrHXcVE5tx0b7yG4fu5fATkIXwA9PGyM3WZ7CPrsrrNOjG6l6bASgxzju2PrwvYfLxWnDxTOB9cR7eqFoLtlMyQa2KbTcbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQq3Y3BeRalbR30EExUxbaKssXeMyemMWpdkXgue+uk=;
 b=bauiyeV7AK5uv15/R5TaAZeW7Yd0+E6nHuLKHJvUngzt4G27txhE256VPb/aOY7buzJr52JUiN7E+z3weT7H7n5mj8LuKOCHru5d3HY7nqCGm6NfxDNBP7NEbTdtJpodIwZEKjnEtfeVgvvmccFvKbFwUVcMVIbui5uAq0P2hJeWhtWYeMeofnwSv+o1u91LKq4yNbK/hv40s1cYKRxU0MocWyPi2h8ymwdWBElVM7toH0fr2uI8HJ08LibnOvtD1cTTa65bnVM/HF49Mnx0FdbP+Yje5a7j2HHE9gRKL+wFoL9bmONjGAtAHXbqVNiK6typcVhPTlshxDJmOBvS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQq3Y3BeRalbR30EExUxbaKssXeMyemMWpdkXgue+uk=;
 b=qYwmVV2na8UcSoleK9m4/6BO3jv866JI46SxaXVxPBo6xwbTzKOAk9A/3nENPlxeDvB2B+cKq2mSVSp5hzGKoFAfENJX172q09sAAWuTM7YF8CFX/r4d9gibXmeAXVXIw+Wia/RP3EAreh6BOjS/qIwIjzDSx0HCROe2tp0RE1c=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4444.jpnprd01.prod.outlook.com (2603:1096:404:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 11:16:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 11:16:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "Shashikant.Suguni@in.bosch.com" <Shashikant.Suguni@in.bosch.com>
Subject: RE: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Topic: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Index: AQHWLNCCMO5ceqzAh0qZ614nN0icbqith5GAgAYRLtCAAGB8kA==
Date:   Fri, 22 May 2020 11:16:34 +0000
Message-ID: <TY2PR01MB36925ABE9432E3F15EA778E2D8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
 <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
 <OSAPR01MB36831809AD6F3D66F1F39670D8B40@OSAPR01MB3683.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB36831809AD6F3D66F1F39670D8B40@OSAPR01MB3683.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d0d36178-8bfe-44a2-3d1c-08d7fe419699
x-ms-traffictypediagnostic: TY2PR01MB4444:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TY2PR01MB444438F1E426FE397A93410DD8B40@TY2PR01MB4444.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9B4DmuySc21gh3S+tD0okJBZOmCkMq4aa2MvJnfhTnudcNL3rZEMd8QseI5D22g3N7Iu3wGsd5eQ0BG/DVFzK30TWNHmr2Wf0shRFzGz9e+bOphkxggoqAcq+nxA3vwRkaI/AcEH1JEGwQkYZJw5s0FyX1fnwYoNNhTDo5jExbw/8pOoU4eqFA2PSTlATCSh1TrXw59ieCTA1xKxosGvPfjlHoFE4KWTqgZxnwXmGLxURXV5c1LKPJXZw8S7gvvtTE+pA+dStfkVPt5E1s05F05XQvJZiCBqCCjAlv2lQHpZadRDFNmQmR4NwXvahpmyU2gs+mCuq1UG2k6ko8sZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(64756008)(66446008)(107886003)(4326008)(86362001)(5660300002)(8676002)(8936002)(55016002)(9686003)(71200400001)(66476007)(6506007)(52536014)(53546011)(478600001)(26005)(7696005)(66556008)(2906002)(55236004)(33656002)(186003)(76116006)(110136005)(66946007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: rD8KJ+SNJT/Zx+L+yVPLf+mmEAe2hCO3fXJbUALN4RURGPR98/F4A1DSoIDox9yb0t2EuswpOjywvGaui1D9D7D4lBB+eNPyYwHKY2Vu5qRN+ruWiILuhkSGNlYMYWV+77IIWM3FB1d9v0KSoLo2NU/S3587XzE8Fc9yX8ECSQKXBu2G/8fdfC1ztTgYg/jiid3CanKmU2s1qeInMHUF1fmsOp9cg2Zu3cNQ26+N92MKhQ8ZCtGc+8i6DKQx95hrGQ+7ci5pO4qbNRpkSQrRLHxh/Q3wg5b7xgZ6UEJ0ccMy1DgPU3BJzv1bBLrYC2lf3jv6uRt7vlbMDR3iwU/XIJBU6rVHTPMNjbd4CTC6ovHuos7QLfwfAS3ZsD/WatYJKtWlCqHNKozZPAzjhn0f1dOprYli/pk/mef5feVdaiSD/vhB3uX9FAcPajDsdKcIDBS+wkW2vWAJNkZVHHHlA8rXY2CZ7MEk63uGC3YmvuTfo4MUNb3VqmHJfubPpxqq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d36178-8bfe-44a2-3d1c-08d7fe419699
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 11:16:34.7709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPu+Lg/AdOy3ko6FTRRMvRoqQAXPh9tFN5HAIlSfLXhfl0e5FWjxl+quiOTipEYWFzlTP2cE/GZhet9nqpkfAvztL4yjuK7/4Enb8vhbBW59xwQ5bv2s3IGhQMVbiIZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4444
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgYWdhaW4sDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IEZyaWRheSwgTWF5
IDIyLCAyMDIwIDI6NTggUE0NCj4gDQo+IEhlbGxvIFNlcmdlaS1zYW4sDQo+IA0KPiA+IEZyb206
IFNlcmdlaSBTaHR5bHlvdiwgU2VudDogTW9uZGF5LCBNYXkgMTgsIDIwMjAgNTo0NSBQTQ0KPiA+
DQo+ID4gT24gMTguMDUuMjAyMCA3OjU0LCBEaXJrIEJlaG1lIHdyb3RlOg0KPiA+DQo+ID4gPiBB
bmFseXppbmcgWzFdIGl0IHNlZW1zIHRoZXJlIGlzIGEgcmFjZSBjb25kaXRpb24gd2hlcmUgcmF2
Yl9zdGFydF94bWl0KCkNCj4gPiAgPiBjYW4gYmUgY2FsbGVkIGZyb20gaW50ZXJydXB0IHdoaWxl
IHR4IHNrYnVmZnMgYXJlIGJlaW5nIHRvcm4gZG93biBpbg0KPiA+ICA+IHRoZSBzY2hlZHVsZWQg
dGltZW91dCBoYW5kbGluZy4gVGhlIGFjdHVhbCB0aW1lb3V0IHdvcmsgaXMgZG9uZSBpbg0KPiA+
ICA+IHJhdmJfdHhfdGltZW91dF93b3JrKCkgZHVyaW5nIHdoaWNoIHRoZSB0eCBza2J1ZmZzIGFy
ZSB0b3JuIGRvd24gdmlhDQo+ID4gID4gaW52b2NhdGlvbnMgb2YgcmF2Yl9yaW5nX2ZyZWUoKS4g
QnV0IHRoZXJlIHNlZW1zIHRvIGJlIG5vIGZsYWcgdG8gdGVsbA0KPiA+ICA+IHRoZSBkcml2ZXIg
aXQgaXMgc2h1dHRpbmcgZG93biBzbyBpdCBjb250aW51ZXMgdG8gdXNlIHRoZSByaW5nIGJ1ZmZl
cg0KPiA+ICA+IHdoZW4gaXQgc2hvdWxkIG5vdC4NCj4gPiAgPg0KPiA+ICA+IEZpeCB0aGlzIGJ5
IGRpc2FibGluZyB0aGUgaW50ZXJydXB0cyBpbiB0aGUgdGltZW91dCBoYW5kbGVyLg0KPiA+DQo+
ID4gICAgIEhtLCBnaXZlbiB0aGF0IHdlIHN0b3AgYWxsIFRYIHF1ZXVlcyBwcmlvciB0byB0ZWFy
aW5nIGRvd24gdGhlIGJ1ZmZlcnMsDQo+ID4gaXQgaXMgc29tZXdoYXQgc3RyYW5nZSB0aGF0IHlv
dSBzZWUgdGhlIGRyaXZlcidzIHNlbmQgcGF0aCBjYWxsZWQuLi4NCj4gPiAgICAgQnV0IGRpc2Fi
bGluZyB0aGUgaW50ZXJydXB0cyBzZWVtcyB0aGUgUmlnaHQgVGhpbmcgYW55d2F5cy4uLg0KPiAN
Cj4gSSBkaWRuJ3QgcmVwcm9kdWNlIHRoaXMgaXNzdWUgYW5kIEkgZGlkbid0IGtub3cgdGhlIHJv
b3QgY2F1c2UgeWV0Lg0KPiBCdXQsIEknbSBmZWVsaW5nIHRvIHN0cmFuZ2UuIEVzcGVjaWFsbHks
ICJyYXZiX3N0YXJ0X3htaXQoKSBjYW4gYmUgY2FsbGVkIGZyb20gaW50ZXJydXB0Ii4NCj4gSSBk
aWRuJ3QgZmluZCB3aGVyZSByYXZiX3N0YXJ0X3htaXQoKSBjYW4gYmUgY2FsbGVkIGZyb20gaW50
ZXJydXB0IGZvciBub3cuDQo+IA0KPiBCeSB0aGUgd2F5LCBJJ20gdGhpbmtpbmcgdGhlIGZvbGxv
d2luZyBtZXNzYWdlIGlzIHJlbGF0ZWQgdG8gdGhlIGlzc3VlLg0KPiA+ID4gcmF2YiBlNjgwMDAw
MC5ldGhlcm5ldCBldGhlcm5ldDogZmFpbGVkIHRvIHN3aXRjaCBkZXZpY2UgdG8gY29uZmlnIG1v
ZGUNCj4gDQo+IFRoZSByYXZiX2NvbmZpZygpIG91dHB1dCB0aGUgbWVzc2FnZSBpZiBmYWlsZWQu
IEFuZCwgcmF2Yl90eF90aW1lb3V0X3dvcmsoKQ0KPiBjYWxscyByYXZiX2NvbmZpZygpIHZpYSBy
YXZiX3N0b3BfZG1hKCkgYW5kIHJhdmJfZG1hY19pbml0KCkuDQo+IC0tLQ0KPiByYXZiX3R4X3Rp
bWVvdXRfd29yaygpIHsNCj4gCXJhdmJfc3RvcF9kbWEoKQkJLy8gY2FsbCByYXZiX2NvbmZpZygp
DQo+IA0KPiAJcmF2Yl9yaW5nX2ZyZWUoKQkvLyAqMQ0KPiA8c25pcD4NCj4gCXJhdmJfZG1hY19p
bml0KCkJLy8gY2FsbCByYXZiX2NvbmZpZygpDQo+IDxzbmlwPg0KPiB9DQo+IA0KPiByYXZiX2Rt
YWNfaW5pdCgpDQo+IHsNCj4gPHNuaXA+DQo+IAllcnJvciA9IHJhdmJfY29uZmlnKCkJLy8gImZh
aWxlZCB0byBzd2l0Y2ggZGV2aWNlIHRvIGNvbmZpZyBtb2RlcyIgaGVyZSBhbmQgLUVUSU1FRE9V
VA0KPiAJaWYgKGVycm9yKQ0KPiAJCXJldHVybiBlcnJvcgkvLyAqMg0KPiAJcmF2Yl9yaW5nX2lu
aXQoKQkvLyAqMw0KPiA8c25pcD4NCj4gfQ0KPiAtLQ0KPiANCj4gSWYgcmF2Yl9jb25maWcoKSBm
YWlsZWQgYXQgdGhlICoyLCBzaW5jZSByYXZiX3JpbmdfaW5pdCgpIHdhcyBub3QgY2FsbGVkLA0K
PiBhbnkgZGVzY3JpcHRvcnMgd2VyZSBub3QgYWxsb2NhdGVkIGFuZCB0aGVuIHRoZSBpc3N1ZSBz
aG91bGQgaGFwcGVuLg0KPiBOb3RlIHRoYXQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQsIHRo
ZSBjb250cm9sbGVyIGNhbm5vdCBjaGFuZ2UgdGhlDQo+IG1vZGUgZnJvbSAiT3BlcmF0aW9uIiB0
byBDb25maWd1cmF0aW9uIiB3aGVuIHRoZSBjb250cm9sbGVyIGlzIGRvaW5nDQo+IFRYIG9yIFJY
Lg0KDQpJJ20gYWZyYWlkIGJ1dCwgdGhpcyBzY2VuYXJpbyBzZWVtcyB3cm9uZyBiZWNhdXNlIGlm
IHRoZSBjb250cm9sbGVyDQplbnRlcnMgIkNvbmZpZ3VyYXRpb24iIG9uY2UsIHRoZSBkcml2ZXIg
bmVlZHMgdG8gY2hhbmdlIHRoZSBtb2RlIHRvDQoiT3BlcmF0aW9uIiBmb3Igc3RhcnRpbmcgYW55
IHRyYW5zZmVyIGFnYWluLg0KDQo+IEkgZG9uJ3Qga25vdyB3aHkgdGhlIGZpcnN0IHJhdmJfY29u
ZmlnKCkgZG9lc24ndCBmYWlsIGZvciBub3cuDQo+IEJ1dCwgbXkgc2NlbmFyaW8gaXMgb25lIG9m
IGZ1bmN0aW9ucyBiZWxvdyBlbmFibGVzIHRoZSBUWCBhbmQgUlgNCj4gYnkgY2FsbGluZyByYXZi
X3Jjdl9zbmRfZW5hYmxlKCk6DQo+ICAtIHJhdmJfZW1hY19pbnRlcnJ1cHRfdW5sb2NrZWQoKSAu
Li4gaWYgRVNDUl9MQ0hORyAmJiAhbm9fYXZiX2xpbmsgJiYgUFNSX0xNT04NCj4gIC0gcmF2Yl9h
ZGp1c3RfbGluaygpIC4uLiBpZiBub19hdmJfbGluayAmJiBwaHlkZXYtPmxpbmsNCj4gIC0gcmF2
Yl9zZXRfcnhfY3N1bSgpIC4uLiBpZiBlbmFibGluZyBORVRJRl9GX1JYQ1NVTQ0KPiANCj4gcmF2
Yl90eF90aW1lb3V0X3dvcmsoKSBjYWxscyByYXZiX3N0b3BfZG1hKCkuIEFuZCwgcmF2Yl9zdG9w
X2RtYSgpIGNhbGxzDQo+IHJhdmJfcmN2X3NuZF9kaXNhYmxlKCkuIFNvLCB3ZSBhc3N1bWVkIHJh
dmJfdHhfdGltZW91dF93b3JrKCkgZGlkbid0IHRyYW5zZmVyDQo+IGFueW1vcmUuIEhvd2V2ZXIs
IGlmIG9uZSBvZiB0aGUgYWJvdmUgZnVuY3Rpb25zIHdhcyBjYWxsZWQsIHRoaXMgaXMgcG9zc2li
bGUNCj4gdG8gZW5hYmxlIFRYIGFuZCBSWC4NCj4gDQo+IElmIHRoaXMgc2NlbmFyaW8gaXMgdHJ1
ZSwgSSdtIHRoaW5raW5nIHdlIGNhbiBmaXggdGhlIGlzc3VlIGJ5IHVzaW5nDQo+IHNwaW5fe3Vu
fWxvY2tfaXJxe3Jlc3RvcmUsc2F2ZX0oKSBiZXR3ZWVuIHJhdmJfc3RvcF9kbWEoKSB0byByYXZi
X2RtYWNfaW5pdCgpLg0KDQpUaGlzIGlzIGFsc28gd3JvbmcgYmVjYXVzZSByYXZiX3JpbmdfaW5p
dCgpIGNhbGwga2NhbGxvYygpIHdpdGggR0ZQX0tFUk5FTC4NCg0KSSdsbCB0cnkgdG8gcmVwcm9k
dWNlIHRoaXMgaXNzdWUgYWdhaW4gaW4gbmV4dCB3ZWVrLi4uDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCj4gIyByYXZiX3B0cF9pbml0KCkgY2FsbHMgc3Bpbl9sb2NrIEFQ
SSBzbyB0aGF0IHdlIHNob3VsZCBub3Qgc3BpbiBsb2NrIHJhdmJfcHRwX3tpbml0LHN0b3B9KCku
DQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gDQo+IEknbGwgdHJ5IHRvIHJlcHJvZHVjZSB0
aGlzIGlzc3VlIG9uIG15IGVudmlyb25tZW50IGFnYWluLi4uDQo+ICMgSSdtIHRoaW5raW5nIHJh
dmJfYWRqdXN0X2xpbmsoKSBpcyBwb3NzaWJsZSB0byBjYXVzZSB0aGlzIGlzc3VlLg0KPiAjIEJ1
dCwgU2FsdmF0b3ItWCBkb2Vzbid0IGhhdmUgcmVuZXNhcyxuby1ldGhlci1saW5rIHNvIHRoYXQg
SSdsbCB0cnkgdG8gYWRkIGl0Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
