Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3CA28FE16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 08:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393981AbgJPGNr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 02:13:47 -0400
Received: from mail-eopbgr1300119.outbound.protection.outlook.com ([40.107.130.119]:20025
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388285AbgJPGNr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 02:13:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNQho0FMoqFsJLsbBKhbJeqve4FovNVsew+vX+3zVYgmtJCz5vCokYMYsgXu2dWNiPnHO0chke3XFqPGR7fj1b+5MNCaf/ka0IZCzcLJqioFsnXRKFwECv88zWR2fQ3eipJHxOu0dLlyUBFpwxsMh+HWR2LQNEnzxCnlmKrGDr+xh1rcQvWbJ+sd9qg+RtDH7Vdx6FM2LYcdSbeStQTV4hu1onjV3Pp1dxZeK+FyGVvSZlVf82ve18y1nh3TRqvumCMksrFQZcx+0YoIXEXYDyZ2KWFKw/nODJWJGxn/ARTaZuKngaOiQORbPMM8QMBar89HRp7qYbmKh17Jrjqq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pvD9yn06JekjL9lDFIqeQwxYBDpil/6m1dwT61dGtA=;
 b=HKeE5HRmcOOFlBPYPsAbsSqKBka0YMVMCtpwIYo05tBkGK0IrpXhg6nQS62wY5kBcjDJa9gkmlpKx9/wv/HjFQbXGG5FywoLPb08PKj9L6gPaLeEHQjuh0CpAILdo5pysf250scU7JizGoa96y3dGpsdLrCTonk7Ff4noPhKnMVKaFz/XXSL3B9RgF6fj0WRxgZ8ASrUpf23lVNPtKSzSo+/hF3UCKfwMZpHh+tQoFQQAtYSRnmWSKHgQVzjRx/whXR0zyKWgF5ltF9NNf8onggUwOHsRJqtUSfyA72lSG/9Y20PYBq3lA6fsatKvrGF5qd6XW7ZiHUte0nPSkjQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pvD9yn06JekjL9lDFIqeQwxYBDpil/6m1dwT61dGtA=;
 b=md1QpRpm5UrMngA1e8iQryYIihfagHIAL+VnOu1OmSXieOgvg5WXsayTZLRStzjn5fGlCb2J5Ew2rMBeKuyAfnViWi7rE66sT/Rl2N6Omg9KJawi5Gw0pNMc2aE3ZhKtUtt1beYnHAVva1BYIePmHf+hnEcBehGTgDx7BaRmCJo=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB2123.jpnprd01.prod.outlook.com
 (2603:1096:404:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 06:13:40 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3477.022; Fri, 16 Oct 2020
 06:13:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps from
 ethernet-phy node
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps from
 ethernet-phy node
Thread-Index: AQHWovZxReTKNfwj3EGQ/5nMjKsLEKmYq1EAgABXd8A=
Date:   Fri, 16 Oct 2020 06:13:39 +0000
Message-ID: <TYBPR01MB5309036B8D9960CDE8B0A9BE86030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
 <20201015132350.8360-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXu3AKFAY3b6SfWgpQL9VBJBC9HL4ZK5EFu=7FZ2zJoXA@mail.gmail.com>
In-Reply-To: <CAMuHMdXu3AKFAY3b6SfWgpQL9VBJBC9HL4ZK5EFu=7FZ2zJoXA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [81.131.167.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c0a58eb-0058-480c-52a4-08d8719aa047
x-ms-traffictypediagnostic: TY2PR01MB2123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB212302DC5E78CC2D166C69EE86030@TY2PR01MB2123.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rpWKbOd4AATfGJUL74dOCcvqOJrtdgwrpRTkJO5p+4PhnFVjW4tet7q2T6UTbmvKFY+nc9Ghk34adqM47i9dvnz/ZYzz5KbPOaeOsp30hRXaRlA2YeXIWtMHxPy9DSbrq9gzdirnkUbHz7fn7NHyD8YbBdSp+I8pqUqj2EHMmps/bJZA2k68GxwPJGkBTbEKuGqMmLmFOM9QCNN7UnpGQmeq/wqu1a4aEU8nAehI6JmUJQwopmPDDSzn1lEOe6/qi43G3LAr/E1AkXJki8NKPEjIybTmKWKX4QYrs5RjyjdC4mQnBJtEDA2PE+9HFpytbXk2R28prQW82xQpWnlluG8zmwNBg1l6DYOyYfGQsNvs7Q1x4LXJwuzAeY9/jR+Ri8Pa+J6CVtQQQ30+TGsrhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(9686003)(86362001)(71200400001)(107886003)(54906003)(33656002)(4326008)(478600001)(316002)(83380400001)(6506007)(66556008)(64756008)(52536014)(8676002)(26005)(8936002)(66946007)(66476007)(76116006)(66446008)(2906002)(7696005)(55016002)(186003)(5660300002)(6916009)(53546011)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Za8ADEsj1m/KXR1BI37pWeJpU6HqGZ3+UUctQ3RTQlg+1FAiStcia3vg/11SiwF3aDxg7k1oLGFB+l+QAIVLFn7+GnC2gNtux1E53cwJfaPaIsFazvWLrZrBs9wUntl0JiBTA3nK4Q98M5VLp5hvbZs7Fp4XMDALlQ3pYqrbNXIvm/sj67abukrZs4blESISSny+oAOIOT8CgejtiKhMYPDIjGue1ry2pwtAJwYYMKDMknZsnLkTHeu0bgGyApJ2GQ4CU39qV/FstPzlnGfbmNCxRJyfcTMUYoRsAj0GWDcLEOzrD5Ib3WX9WsilRz6Uo0APeumiNgsLBJhnJ9jnR1Slbe7iIRHbXrNjltPaCI8nLTNEL0HrKDd8xhw2AlWrbiMGWlvCf90oL2YVMKRK2L0nIUNk3CjTq0j35Aw/MZ7mfOX7vYXnW7Jc03zajtKBv2GdhdWj+qolFXKHjKCliCyVYfHHHD21/aweMAxg/4EsaPK9AnL6v+BEh+eC2WAgyxUZ/yw+bsGmoq2lpwBZW1Fv8AlG7vUr1f4rSd5wmmnnqLJJCd6e3Skk/ZiEabIUV0/j+U0juRD02nOWQMP+H/wUl447BxP7aT+ginP4bFbnOAhPniFcgtJrzR2vsJw+qXTCWn5p0F93iiwWQmOmDg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0a58eb-0058-480c-52a4-08d8719aa047
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 06:13:39.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVh3Y/HVLWK6PwiejmNzwxfThwCzgbGkucTpfG/WTzXi8uNnPI/5x5eXCgBxbjw4dVMam/+fAYk9WsCOfnpKIxweydVSwXcx+SjOIhJo/iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2123
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSBhcm02NDogZHRzOiByZW5lc2FzOiBjYXQ4NzU6IFJlbW92ZSByeGMtc2tldy1w
cw0KPiBmcm9tIGV0aGVybmV0LXBoeSBub2RlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1
LCBPY3QgMTUsIDIwMjAgYXQgMzoyNCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBDQVQ4NzUgc3ViIGJvYXJkIGZyb20gU2lsaWNvbiBM
aW51eCB1c2VzIFJlYWx0ZWsgcGh5IGFuZCB0aGUNCj4gPiBkcml2ZXIgZG9lcyBub3Qgc3VwcG9y
dCByeGMtc2tldy1wcyBwcm9wZXJ0eS4NCj4gPg0KPiA+IEZpeGVzOiA2YjE3MGNkM2VkMDI5NDlm
ICgiYXJtNjQ6IGR0czogcmVuZXNhczogY2F0ODc1OiBBZGQgZXRoZXJuZXQNCj4gPiBzdXBwb3J0
IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LQ0K
PiBsYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9jYXQ4NzUuZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9jYXQ4NzUuZHRzaQ0KPiA+IEBAIC0y
MSw3ICsyMSw2IEBADQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4NCj4gPiAgICAg
ICAgIHBoeTA6IGV0aGVybmV0LXBoeUAwIHsNCj4gPiAtICAgICAgICAgICAgICAgcnhjLXNrZXct
cHMgPSA8MTUwMD47DQo+ID4gICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzI+Ow0KPiA+ICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPDIxIElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0KPiBTaG91bGQgInJ4
LWludGVybmFsLWRlbGF5LXBzID0gPDE4MDA+IiBiZSBhZGRlZCB0byB0aGUgYXZiIG5vZGUgaW5z
dGVhZA0KPiAoYWZ0ZXIgWzFdIGhhcyBlbnRlcmVkIHY1LjEwLXJjMSwgYW5kIHRoZSBEVFMgcGFy
dCBvZiBbMl0gaGFzIGJlZW4gIGFwcGxpZWQgdG8NCj4gcmVuZXNhcy1kZXZlbCk/DQoNCkxvb2tp
bmcgYXQgdGhlIHNjaGVtYXRpYywgaXQgaXMgbm90IG5lZWRlZCwgc2luY2UgaXQgaGFzICIybnMi
IGludGVybmFsIGRlbGF5ICAoNC43SyBPaG0gbGF0Y2hlZCB0byAyLjUgVikgb24gdGhlIFJ4IHNp
ZGUuDQoNCkNoZWVycywNCkJpanUNCg0KPiBbMV0gW1BBVENIIG5ldC1uZXh0IHY0IHJlc2VuZCA1
LzVdIHJhdmI6IEFkZCBzdXBwb3J0IGZvciBleHBsaWNpdCBpbnRlcm5hbA0KPiBjbG9jayBkZWxh
eSBjb25maWd1cmF0aW9uDQo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5l
c2FzLXNvYy8yMDIwMTAwMTEwMTAwOC4xNDM2NS02LQ0KPiBnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZS8NCj4gWzJdIFtQQVRDSCB2MyAwLzddIG5ldC9yYXZiOiBBZGQgc3VwcG9ydCBmb3IgZXhwbGlj
aXQgaW50ZXJuYWwgY2xvY2sgZGVsYXkNCj4gY29uZmlndXJhdGlvbg0KPiAgICAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvMjAyMDA4MTkxMzQzNDQuMjc4MTMtMS0N
Cj4gZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcw0K
