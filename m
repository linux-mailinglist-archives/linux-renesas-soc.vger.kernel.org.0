Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3463B17EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 12:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFWKPV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 06:15:21 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:52718
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230083AbhFWKPU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 06:15:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgfP1ema1XFjROAEf0WTnitA1uLLtsjotGZ+6rmbM0ynzREADhjPXeBIAfWI9ixKgEXgz3EgclNFQLuW7oY10txGGbNTUOSSYJZ7mopfJksMDWmZYmOGwwTCkCH7kXAGn9Pgml77JqLJ642zCcU5qx8lf/u9tKqjIbYqkG0hK63paYe5ylFAtdVLSGaTUwGULnm5eMVJehC38qI6/TBkg4OSRsGqHihDbwBFca9sTu6W6dc8FqyErePY63BxqGZS674NJ6ro22GA0l+k1nGkN7ucjqSMsMZJYmhPI6tCtnPcol3W3iEwh24wXsLaM9ZbOEFq+utzjK4cSJ2PX9gutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zysszINRatVZBl11ZHNy9rkCnS39fyqLfCJpJJvlMxM=;
 b=Bp/dOFDD0/pAMj/lcnrnyWRJ2O0qSrLCyQfKISQv8w/g2F0oMo4KOQhQplxLXUff+sH8ZEP7mtfMR5xWProfcdttsvRzSr7ZM6I92l13K2fnGg50FaLvit1ehgeDsSxhV6jKflvs3QwLIP3RXNfG99cct0r8gavr0AyOR4avmLESkayArmgaARy6i/JMhuVAkzoYw0lyvLHW9WyPp00iW7vVjltXBLtTxgFQWq+eU97XtG2Zm5DW8gmFoHG4dy/M+VRux7DuA4INOC6bSFHgXib30/Ovlh/nFQXCMwVoCazg/6n8AZdUhxTcTNeOAPZs6z3TVZB6DZuprOV2Z6jBdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zysszINRatVZBl11ZHNy9rkCnS39fyqLfCJpJJvlMxM=;
 b=SS2mDuTUwqYgTxsDK7zCH3xsz6bf7c3IzNaTzMj24RaxkUzM/gOvhPHEl+HEXviuNiTc++tDAARLHm8/t1uAdrKFE28WfO/4C1fyaumGRJ3oxIyDk1q4mscAxRfeLjG7X0ntIFeQ7XcENDKR8r4+ZrRNL5JtS+1CyiYCYOU5rT0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6428.jpnprd01.prod.outlook.com (2603:1096:400:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 10:13:01 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 10:13:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 02/14] soc: renesas: Identify R-Car H3e-2G and M3e-2G
Thread-Topic: [PATCH 02/14] soc: renesas: Identify R-Car H3e-2G and M3e-2G
Thread-Index: AQHXXdxHY/5BVWcTrU2f8c4CAufO8qsT2yIAgA2Y+vA=
Date:   Wed, 23 Jun 2021 10:13:00 +0000
Message-ID: <TY2PR01MB3692544BAF8DA36DDB0F47D0D8089@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <8e5f14d720f6462fbbcd2caed26c57f1d81166bb.1623315732.git.geert+renesas@glider.be>
 <YMegZv0klDVDdsdN@pendragon.ideasonboard.com>
In-Reply-To: <YMegZv0klDVDdsdN@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a6574e7-5ea6-40e5-8cef-08d9362f7b5d
x-ms-traffictypediagnostic: TYAPR01MB6428:
x-microsoft-antispam-prvs: <TYAPR01MB6428B7EA5A1399B9616F3C9DD8089@TYAPR01MB6428.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIM/+aCILBmj9xKZY/iCwubGuWF4c0PZYbO5uJw4YkKPb/DPKnqIyIbonWvXABkCyH+aT74mSYn4DW64zbx8suje9ErP7bH/67rEuk3geAt5JLatn36ETfwJbS4kGlMNkCUHDogT+Y3+O9mz/IyZ5j9NRQNkVXJ8D+wuhhBAXShtulAzjQo1FaMI3z8LLP+vSpRnAP+fdIk6u8wvPrbE0AHfqqIBVeQy9tgFxaVydsAt2px7WEmWPWSjUcJfQHFveugukPTj0Unvyl/xXVVEuyTWBjtlKw277VLupcZCQr3TAh4Pdam1lwITntJdplVd2i23FBpJBcnk+Euk8sWnL3itZHil8wmRsUNQR1eE5xTQxxkOkPTdJyDn+ApZ2EVoEVYSyDJgl5jWj5pd03w/v0HYqI0VmYioLa/Q297bLkSVkroq3/SBsP/4S5Qxtug1EEUOc3k4j7MMPxdZERHqOOiisBvUvN/RQLiof5KDT4u5gVkYDQSF5HU4Rk8HuLhRRflmXsZ8oRYVNtQ8cwl41KypgtzFJuNMrMD2ST1VVO56vlIsoEMjSbXsAraZK/UOVbPATC3bJscn1SgQB6dKetPcni2hFCrQ+y49mShjnC6oDU84LM9SZIW5nAR9t9IQZKUoLM295LSMUXOBwFlXcQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(478600001)(9686003)(186003)(54906003)(33656002)(26005)(52536014)(316002)(8676002)(55016002)(110136005)(71200400001)(8936002)(5660300002)(66476007)(2906002)(86362001)(7696005)(64756008)(4326008)(38100700002)(66946007)(76116006)(66556008)(55236004)(6506007)(66446008)(83380400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUFWQVFSV1ZqdDJORXEzU20xR1FYeGhnSnBzZy9WQkFzVlY1b2VnZ3VBSEVo?=
 =?utf-8?B?RUY4VnZ5MGtCbzRObGNLM1ZsTVNvVTg3NTVHaDVKUjRVRVpNVU5qb1duU2Jn?=
 =?utf-8?B?K1YySG5mZWRoSEphbVUydy9VNndudFJ6N0FBaCsvcWhzUGJOcmZwM3RtMS96?=
 =?utf-8?B?NVhzQXpHa3QzMmYyQmRLT1o1dm9aWkZNWE42UzUzdVRveFovd0tMTlczb1Uv?=
 =?utf-8?B?bGVYWmZQU1N1QWJmb2ZaR2YwbmliS1ZSUFpHOFZicnFzUDVXclBmc3pNTlda?=
 =?utf-8?B?eHgvZEg3SU1jUURFaHNHZUdyUEFPd09IcXNJdDBOQ1NDVnVOMURBSFB3Ry9w?=
 =?utf-8?B?UGNlcVVxSlEyRlAyYkxSUnMrSnN1aHg1V3FLdDZCTElIY1J5d0xBcGs0RndZ?=
 =?utf-8?B?cFlhcTYxT1VucjNhQzFPNkMvbGxxQUpkTE9na1ZDakVlNU9PV0xjK0FhbFlI?=
 =?utf-8?B?Mi9YUTM4ZXUxWUptQjVVV1R5RTBwUmdseUxydy9RQmhCM0piYkpyOHF0UVpW?=
 =?utf-8?B?SFpVVmdodlowbUw2ei9rQjhLMUZGRkFXYUFSZldHcWlRN0FnYlpMdlFsVVlD?=
 =?utf-8?B?VDd1VmdVWllXTFdGZVpxd2pQY1J2MWV3Mjlxcm9OQUg4cm53QWFDTG5hZVdv?=
 =?utf-8?B?d2ovZThFV1hwU1liejBFNGpPYXBiVHpyQTlOYjhITlEvVmJQRi90UXd1RS9t?=
 =?utf-8?B?UkhOVU15YmRUR2VRN2dwYUhDQUtDSHF3M2RyZ28vV3RPdkk1SHdXcmF0ZUp2?=
 =?utf-8?B?bTFFNHozY0hWTEdpcGpGLytzYjlsU0M2SHNTOG1mY09FRUdJYTN1M1ZGN0ZD?=
 =?utf-8?B?clhBOXcrcHpTOUxhYndORWF3MGRSRm5SaFVvS0tzeDAweDFBRjNKSUpyT3U1?=
 =?utf-8?B?UDdDZC85UXlmQms3V3RaWkZ6N3YwS0pLSnpsK093aWdFMlJVYUhTKzI2d3F3?=
 =?utf-8?B?TVlZVUpRbHNTNXpTWnZ6Z0FpWGJvVVdiWTExTlB0dFFKNHNvckM2KzZHSXlt?=
 =?utf-8?B?MWFvdkp3NDhQR1g3SUZIK3YzS3kwWGJZUDd3L3d5QnhqN1NVUzR3eVpxRDVj?=
 =?utf-8?B?UFpoajBlaFVJNUhuN3prQ1REVVdxUlhrUjE5RzZXSk9oTXc1YzFVOE9QQ1M4?=
 =?utf-8?B?VUJKN2tzdFh4QlJ0K3hRK2FqZ0xVQnp4NWJRL0Y0MUJudnQxRkVYTnpiQ25n?=
 =?utf-8?B?TjRFRytDeEZCYW9Qb0hqbDRTcHRNZndkd3dqbnhUZTRNdGhMbmUxSExvOFJY?=
 =?utf-8?B?aEVWZlZJT1JjcjFnVjN5NzQ5REU1akZYeElDVUhabGxWeHZhVDBISkNpU3ZK?=
 =?utf-8?B?c3JSTThpRG56RXY3MGl2NkJsaWJZY3NOMyt5ZEk3Y3hGK0ppSlZMSTZadVh5?=
 =?utf-8?B?Nk5SRC9vMXRDdERNWHh4Z1g4Z3FRUm9sMTdsVFJBODVhMW1QWHBVcUJERzJD?=
 =?utf-8?B?N0FXZVpIV0ZHQ1U5YzN6RXZEN3VYOEtyc2M0ZEE3Q2tXMSszRlh6bS9Wc1Ju?=
 =?utf-8?B?Tk1IVU5WY0E2RG9sakZIZXRQWXVBS0Jwc3hxMmJTMTQ5VEo3bXM1ZFlFQmV4?=
 =?utf-8?B?ZUdqbU4zSGx5RVkwV29NWlhwbjhGRDFGR3VXTGhHMTgvK1Rsa1lGdlNFQ1Rp?=
 =?utf-8?B?bjNOT25SSVE4dmVHa2FseFRmWGVGWno3c0oycUo2V2dPWkRwTnJpUmtaUEs5?=
 =?utf-8?B?UVZRMnluY3Y0VXVrT0c2d2dsOTZZeEU1enJKS1BOTk1VU3ZFb1pDeEdrWkZu?=
 =?utf-8?Q?UggCMBhIIotn7pm8qMIBf5YRnOJaoZ4936hBtFS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6574e7-5ea6-40e5-8cef-08d9362f7b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 10:13:00.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ID+9sDbeaCehP4+RLplilb/JI+gp7VPEA1iHDSivlJonI5iKL9PdVLh2zfDAh1eNkfx813e9ir0IJUnRgEvbVgm+8pB9y4SGONgTm+DzUXLBM8dUEhpV5mLgCigp+CRL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6428
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCENCg0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0LCBTZW50OiBUdWVzZGF5LCBKdW5lIDE1LCAyMDIxIDM6MzEgQU0NCj4gDQo+
IEhpIEdlZXJ0LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUaHUs
IEp1biAxMCwgMjAyMSBhdCAxMTozNzoxNUFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGlkZW50aWZ5aW5nIHRoZSBSLUNhciBIM2UtMkcgKFI4
QTc3OU0xKSBhbmQgUi1DYXIgTTNlLTJHDQo+ID4gKFI4QTc3OU0zKSBTb0NzLg0KPiA+DQo+ID4g
QXMgdGhlc2UgYXJlIGRpZmZlcmVudCBncmFkaW5ncyBvZiB0aGUgYWxyZWFkeSBzdXBwb3J0ZWQg
Ui1DYXIgSDMgRVMzLjANCj4gPiAoUjhBNzc5NTEpIGFuZCBNMy1XKyAoUjhBNzc5NjEpIFNvQ3Ms
IHN1cHBvcnQgZm9yIHRoZW0gaXMgZW5hYmxlZA0KPiA+IHRocm91Z2ggdGhlIGV4aXN0aW5nIEFS
Q0hfUjhBNzc5NTEgYW5kIEFSQ0hfUjhBNzc5NjEgY29uZmlndXJhdGlvbg0KPiA+IHN5bWJvbHMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KPiA+IC0tLQ0KPiA+IFF1ZXN0aW9uOiBTaG91bGQgd2UgZHJvcCBmYW1f
cmNhcl9nZW4zZSBhbmQgc29jX3JjYXJfW2htXTNlLCBhbmQganVzdA0KPiA+IAkgIHVzZSB0aGUg
ZXhpc3Rpbmcgc29jX3JjYXJfaDMgYW5kIHNvY19yY2FyX20zX3c/DQo+IA0KPiBJJ2Qgdm90ZSBm
b3IgdGhhdCwgYXMgdGhlcmUncyBubyBmdW5jdGlvbmFsIGRpZmZlcmVuY2UgaW4gdGhlIGNvZGUg
YmVsb3cNCj4gYmV0d2VlbiBmYW1fcmNhcl9nZW4zZSBhbmQgZmFtX3JjYXJfZ2VuMy4NCg0KKzEN
Cg0KSWYgd2UgYWRkIGZhbV9yY2FyX2dlbjNlLCB3ZSBuZWVkIHVwZGF0ZSBzb21lIGRyaXZlcnMg
WzFdIHdoaWNoDQphcmUgdXNpbmcgLmZhbWlseS4NCg0KWzFdIGRyaXZlcnMvaW9tbXUvaXBtbXUt
dm1zYS5jIGFuZCBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktcGxhdGZvcm0uYy4NCg0KQmVzdCByZWdh
cmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
