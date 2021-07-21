Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7998A3D0A87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jul 2021 10:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbhGUHkW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jul 2021 03:40:22 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:37279
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236545AbhGUHgW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jul 2021 03:36:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnrpjQ3okacrjBZczhajewtjBoI4vKnAb5kDxyOTUludV9B1pomIJ12kZ1s7wsmoCXn4to2wt+0tweSs+f/9LpuSFKamBLpnXFcFCeUlkslBwCzClr/Fe+ztVzNvWDX3Y3Xu/CJl8YXG4m7VLA78ZTUKTZEF4xRECB8ESyput/I/EB3sLmx1RhdQ1ASlEEmer7ced1A6tn++LUaoGZjFe+bxRNooqUlvpqDKs/fy1hLkhLzCouf5K4dHuQK1jPxf/3kfsTLBs5d7PZUuipY1k3JL9LN3sesiB8TWEaQa6jExVmAMQjnuTMvaSpKXMoVDKDBeWaRYFT5s4i7VatEaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FtMWgR4C5joWH3FYhbw6vZtgipIrD2O9QWfS8Ndo1g=;
 b=F2/lJCvQDBE3bRnUwjxAhjKKp/O3LQ9645If1cV6TOSoMFeiHgz0cffJsUckkCBO4jHrOtWb4XNTcozxwYl3V39FrE9BxVAs31J7RhrQx2goglI5pyv808ru07CcWOSDmq1m8wzYo0dfAptw42LAcCv1uuFYrYvnBp/g7PZ2rDxN4hPfDeN/+mbSDrxXRwtbPj5haEgOdAhExL6zvk/6tZadzJfdkQ6Jxh+sOOyZ09Mu8ktDu1hdy6w8qOx6ez6c7gARCeMloEfPn3mNUnMqpfWdikhPPNQoVr6U/k/wEl572kqUq2QRLBbvcB0NEg6N2tGrvEZyL5mkPmraPCuL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FtMWgR4C5joWH3FYhbw6vZtgipIrD2O9QWfS8Ndo1g=;
 b=bCiiGVD1/SMSh9/EoSVVo5mWv827d/52Hy6T1YOL9oUKeSM1QiJN5PBs/6VrlZWGzfK+9T0I6hsl3bOURI+JkfAGUguPpcoS4bPQMPrekjvrdkRgdR4opkTdO0IXb+8JUZ9DcmMCogI4HnctkH1JIAspU64q3mYpCT6Dlsas8SU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6094.jpnprd01.prod.outlook.com (2603:1096:400:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 08:16:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:16:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77961: Add iommus to SDHI/MMC
 nodes
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77961: Add iommus to SDHI/MMC
 nodes
Thread-Index: AQHXeI/gUkCccICb1k2+mDDhF3qp+qtLo8xggAAQhYCAAWvNsA==
Date:   Wed, 21 Jul 2021 08:16:46 +0000
Message-ID: <TY2PR01MB369260CE8A2D4B3423302865D8E39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36927CAB91A6416E636CE77FD8E29@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdX-vGdEC-48DnRi-Ku1guF6P0DYmXvgq7xFa7EaDg1HCw@mail.gmail.com>
In-Reply-To: <CAMuHMdX-vGdEC-48DnRi-Ku1guF6P0DYmXvgq7xFa7EaDg1HCw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a7e6b6d-91bf-41a2-0fe7-08d94c1fe1b9
x-ms-traffictypediagnostic: TYCPR01MB6094:
x-microsoft-antispam-prvs: <TYCPR01MB6094DE4E7A086EB56E4B1C11D8E39@TYCPR01MB6094.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +KZEmWornY8eb5cWiL/UGwb/F/YaIRm6XQs4v7r7+vxHJ/OWHiMBrXzd9wnug+OHcOqHHndXaxPSygxRWXrJshVKEh4dvv/ZV20g4Lr/infDa/7H10cCSmIwckDhB6J3EBlN0nALkzGx43VJ3fbUNafct+xyPCi9Tt/vgKIFUxXOLc+JsCyqELSGtyFN+vaexNCfCHbI4W3ElhX/MdYkwuiRLoRo4EoJP+alh+mt8I35D1A0jme6fCeRa6lgybMuC6DETP9XETHD/h593DMgQMz2b1Mk7JbVdquCwRm8QcKFgza7fuiQ0vdW7pLumxefbjEJGpYK6XIVSDr/xytZZ8fHxWVKeOWqpobCJuVVLEknErImXo1NNJRCyclrRgOJCf+/BaN9aTFXX5cvzFdwdpjXWbfbaBt5NhUSdZnVffTBmMBd2KjhSwNG/Jqq01GdE7owCX4psnqYp7U7q9GTQ2n9p2626svptUINcKDG+Fvzh3AoQjKIJgpRlVBu1WjFSyat7yvYzpa0U/+/E8YEalkQrhc+rBOyW9aB4M/yCoTWkhuiqtjwPWOh69fX/wW1JM9HQNSkUkQpRWW+hlgPuIDJ1IuU7450ot5SZuiCyYAYc0GyH+cGZlxDv6pxDMNivnjBQVHZJsCHVbCvZk9ifBG/ffc30cQ85466lh7YpdMLdKk8EjMEiwdixq49r9LeXbpdVmJ2eCyy1zRQYF1HzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(52536014)(316002)(86362001)(6506007)(76116006)(54906003)(2906002)(66446008)(64756008)(66556008)(66476007)(83380400001)(186003)(4744005)(33656002)(8676002)(53546011)(55016002)(5660300002)(122000001)(478600001)(6916009)(9686003)(8936002)(71200400001)(4326008)(38100700002)(7696005)(66946007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUdqTUpDSmNDTjFNVTBYR3UrN1l2WUV3WnQyY1BUVTVLYXVENE90OGo4bFJD?=
 =?utf-8?B?aXBnaWttUVM1WVZ3dFpnYUU1SHdsOW4zeVRVU3VxKzUvUVFDVUNLUytlUDVv?=
 =?utf-8?B?QUxlUHVGMkowMXlWT0U0cG5UVUhzdGh3ckRCRUJLbGxpemFzOWpnQ1FaaHhz?=
 =?utf-8?B?ZXBYbWZaL1gwV0JnTE83YVJ6bHNFaWVVQUtqaU1nczc5a2ZKOU1DYzY2OCtK?=
 =?utf-8?B?NFdaWG5wb2FLaHpHc3FHelhWMnZmdDk5NGNlSkI0OWNBK3gzRkkxQlJIY2Fz?=
 =?utf-8?B?SmE2c2YvSHRyMkVFanF4aldzTGJJR3NYa1p6clJoakVjRWhWM3ZQd1U4c2o5?=
 =?utf-8?B?cWRJZExiM0ZSd3NDelFnSDdRL1g2S0pvTUNXSjUwRFNvenpjeW82UnpmcFpz?=
 =?utf-8?B?R2ZBUEFZZW8zdFh5TUlMTGFjZUZyUTM1cXRJdEg4Y3ZSemtpMUpnSkdYcHI0?=
 =?utf-8?B?aWM2aElkN0F1UkhYUDJ3Q2twcnI5aUVLaW1NZUNTQy9xYjBPclN1ZzQrNy9o?=
 =?utf-8?B?bTM0RXJOTlp5WndYUDRDUjAxRkZmT2J1dVJldEZHRUVhNDV1ZDBCQWE0L1Nw?=
 =?utf-8?B?Q1dVOFR6ZVZsQnlRREczbWdhaU1CTTF5b3hzeVFRb1p0dE91Mmtlb1piYUFD?=
 =?utf-8?B?eUUvazc4VlVibWN2bVRDcnNuV2lnaXkwWnZzRzJTN1o2dXFsaXY1Wmx4N2pR?=
 =?utf-8?B?d0JlbFdIclhOS0FUWEo5NjNWdmExQStCVENkSlZLUEdGZEhCRGdORFJkdWNx?=
 =?utf-8?B?K2xrTHYwczdvWk5pZElITmVNMFNwYUJQd2lOS0NmcUYyRnh1VU5LZDQvc3hV?=
 =?utf-8?B?U0VqT3NrZldFaXNZT3ZiWU9zRTRYVDlUMHRPZERuTjFWSERZT3BYTUR3L1pX?=
 =?utf-8?B?ZmRsVDhUTUtuOFJIUVlUalRpWTVGanh1UGZ0TWRZcVFHbXZ3UDZpWVE0NWh3?=
 =?utf-8?B?VWtRRENjNFNUOVU5b0pwMnpNZDlqak5oYUZIVGcyb2ZjM2M4RUNBQ1R2YjdB?=
 =?utf-8?B?dFVzQlBFM2dzejJUTklpM3RyNzdLb2p3VkowTW1RUktSSWN1ZE9VcGEzT1My?=
 =?utf-8?B?RHBFK1J6bUVrOEVaZkErVFl1NUVnNldQb1l4WG90WE9qVFFLTnJHTTRQVWFv?=
 =?utf-8?B?dVM2L3ZaQzM5clN4akV2akwySkNSR0pKVUF5ZzE5b041UW1CK1FGMytIU2Nm?=
 =?utf-8?B?dTU3K2ZOV0c0NFNsZGRJYnU0VjIvWlRnaVMxS0xZNmNOQmVTV0pnd3NLL2M3?=
 =?utf-8?B?ZGNOY21VMDk1L2JsdTZ1YWl0d1U4VThyYmZOMkZBNjVmTWNzZkdTbkV1bFF3?=
 =?utf-8?B?eS96Z0FsdERROTU3Zno5cTVweUt4UDJDTU5sSnYyR2hnL0s1M2E0UG0zYTFG?=
 =?utf-8?B?L0RKYktXTlNqN0U1WTJSdXJxVlNUR1d0b2gyNkhZTW90Q2tRZDUzQkM0UWRi?=
 =?utf-8?B?Ymh5LzVEZGVoK0xka1RFS0tvTlhtVlJpd2t1dGdMcGdMbkdKVkJ4Ni8vTmlN?=
 =?utf-8?B?UjZsT0UvbXcxNkEwYStMMGtDemhyMENmS2ZMWDB6bk54U2ltQ0gxZ01qZk9h?=
 =?utf-8?B?ZkVWd3dEc1pZTm8zbXI3cnB2KzJ3cEVwN2E4NmxBSzVzY3h6eG91NnlNSHlo?=
 =?utf-8?B?VzBaY1JYd1FDbEN6b2U3enVxYUgvM0JneGE3NmZGY3dzQnQ2enFDMnZqeVFj?=
 =?utf-8?B?VE5wRDRtTFU2SUVKRVM5bjlJTmVvcFdhQmVmVXAvOGFCZmIxOXdYdzVRL3hK?=
 =?utf-8?B?V0hmRCtjbm1FbjgxUlROcExWeVh1a3AySXJ3R2xZdjgxbjJGZUt2TkpyS20z?=
 =?utf-8?Q?sOIRZmeZxj1zMmGdaJo4XdC3W/8Tx0nIP5tnE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7e6b6d-91bf-41a2-0fe7-08d94c1fe1b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 08:16:46.3165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ8cGmH7cusAn5FbnS3UFhrL8iYulVuD1bS4qD9pG8aysCDNsnwPU5iu02LUO+nUwhvATa1eUkSKVdCtP/sp305pPNJaqlBB0AL7E9V2CBAgi6kSdeNXtTG++xhsvEWP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6094
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVseSAyMCwgMjAyMSA3OjM0IFBNDQo+IA0KPiBPbiBUdWUsIEp1bCAyMCwgMjAyMSBhdCAx
MjoyNyBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IFdlZG5l
c2RheSwgSnVseSAxNCwgMjAyMSA2OjA5IFBNDQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRjaCBhZGRz
IGlvbW11cyBwcm9wZXJ0aWVzIHRvIHRoZSByOGE3Nzk2MSBzZGhpIG5vZGVzLg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEkgcmVhbGl6ZWQgdGhhdCB0aGUgcjhhNzc5NjEuZHRz
aSBpcyBtaXNzaW5nIGlvbW11cyBwcm9wZXJ0aWVzIG9uIGRtYWNOIGFuZCBhdmIgbm9kZXMuDQo+
ID4gQ2FuIEkgbWFrZSBpbmNyZW1lbnRhbCBwYXRjaGVzPyBPciwgY2FuIEkgYWRkIHRoZXNlIHBy
b3BlcnRpZXMgaW50byB0aGlzIHBhdGNoIGFzIHYyPw0KPiANCj4gRmVlbCBmcmVlIHRvIHNlbmQg
YSB2MiAod2l0aCB1cGRhdGVkIHN1bW1hcnkvZGVzY3JpcHRpb24pLCBhcyBJIGhhdmVuJ3QNCj4g
cmV2aWV3ZWQgdGhpcyBwYXRjaCB5ZXQuDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseSEgSSBn
b3QgaXQuIEknbGwgc2VuZCBhIHYyIHBhdGNoIHdpdGggdXBkYXRlZCBzdW1tYXJ5L2Rlc2NyaXB0
aW9uIGxhdGVyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
