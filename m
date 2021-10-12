Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC4942ABD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 20:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhJLS0W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 14:26:22 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:6072
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232281AbhJLS0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 14:26:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRR02SfALY3UmOGytETexd5rF/whJFGFy22J9nJP/RAJSGlFmyR94pVR4RyljNzywBcBJKVxZiFXHOfM8+xHHYC1CBO5NEydGhLoUYHNZPblRrWGuw8sEDJuyZPzLnIC5ugv52XRnNrvpxmu8Ce8KTykR8jzMS0gxxaQaYhb9uv5+NOniwRiEw1yP1UVCfE7+yihBoLo6U7K7K63tU5LNdDhUNV9KvS8LfsekCb60qM8/6aizXuLOADiPML3yJHFROxmHYqh3VLwDL0tmzJB1iIL1+TD2piV/44KgUe3PFlljJjkIVaKJQdSgw6yzLDTXgjs/8TR2pPoF7al/0+rFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llYmBrIAWSilj4ykia/JI3+8X+ze9phjOb8zVTS/aBQ=;
 b=BGF9KSClKp5wQDbvAuh7AhQaoiF2jUMSly44sJ1zXPWkRHc5y94xiZ0Ss8LG4MXDShJdBlJgQWaASdAyL5aIg4Nsu0MS+j8JNoPhC36Oq9/zpcmFg7OGClE68YOpC2xjr3Q4ay2ob/Vwabj3AEM1FmtJ6J+O+AtkXtxlP1Ama/9BYv2NeSSo58E1cgj6zasYOkKdg/h3nLT5QSoVjFoXpuA/q4o/B5BWa36cniwlOxwVwjOahjjHdO2zJzob40nak6RVNYIjaH5oZ/6Gnt8NMUzoMOTXTAhZ2Iz/X0Cegp2FUGXMrIcA7SbyB7C5DsLQG73TTvYNyg3Qe0cWCaLT9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llYmBrIAWSilj4ykia/JI3+8X+ze9phjOb8zVTS/aBQ=;
 b=cfZ+nywzjLj6LZuFqCGBwiZHKTyOx9kvdxHBhkpN0qqQE53uy+t8UvxYUIyaLkR1Pag0iEZsmGqYjmlrDuiEtmbN7g2tVjhUTQULnmnrYYA2E08EXq7/LiicvL49TmlYT/RcGekjvQvWMdclCz4uLJNCnO2OT51e94of1i1FoRg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1700.jpnprd01.prod.outlook.com (2603:1096:603:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 18:24:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 18:24:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add GbEthernet nodes
Thread-Index: AQHXv4l2B2qMWEZAG02ycvsbXJKvUqvPqMSAgAAEvOA=
Date:   Tue, 12 Oct 2021 18:24:17 +0000
Message-ID: <OS0PR01MB5922A6EA74DC696B8564DABE86B69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211012165144.30350-1-biju.das.jz@bp.renesas.com>
 <20211012165144.30350-2-biju.das.jz@bp.renesas.com>
 <f37fb863-92bc-79b1-26e4-1336874041d1@gmail.com>
In-Reply-To: <f37fb863-92bc-79b1-26e4-1336874041d1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a11bb137-7b3d-41b3-f4db-08d98dad8065
x-ms-traffictypediagnostic: OSAPR01MB1700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB170087197BF01477347B5D1B86B69@OSAPR01MB1700.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDa5p8UXBVSgJI+5HEmOF+O/x/5P9YHJjQmdzrcJormCxCj/3iqnGyjiSgqFu5LJI9M3G5IlHKxLfAJ7p9PCL+w3yRWogGvuOyB2iJ5+C13RXf6kTZTEKHiPV8kjT+Wo2IG2h+qngWMhG3jN9Fzv1pJW1brY4dQSsPBH1BimwTl0ClYH0eYVSMzRTHdHYbFjazpP+WLTne7KpHwMv57/gpSRLFVCkroMxktjSgIzmhqrjfb+NAQFUKjNAI61Uvhcbiw3JvpIKQvRUNkuMwqUlELNDyRCp5LP3zQvlRtf2DmjJ1lppsZLVTe2D+LhqcqnSlRrC2DSEaSwBMuG83QaOq8gWi9fe/4fda1eCFsqOYK93qMDqsdBWyP3DUSP84LORHoCv411l3h4IvNuqEk/xOYH2QfTXQ/LeF08I54f80c4E4pHlA7oFqt4AxiLI2dyqguBoUR8Ej663zTHCXe1YNnhtto0iauNYZP7opE95IiLZFL5QHTYGMj49IMHlGtBtziF0B1Rbdstl7dRKszQBLN7v/i+afGVa9WG6X9XFstpsRyYlJdVTiXBKBqTSoq4T5rIiLXLAPgYacckolToZtKhq1QU420L7Nm/kR0c741ZRZzgy6/SjJ+q+49nGEOecfb+L7u6s5bEyRrkJII/5QmwbKm9SVvS2NcUWw5OcQTkd3HxcZdCDzM61jD3pBxPM8UJafkgLPG7wPGWA2tTGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(8936002)(86362001)(26005)(66946007)(83380400001)(38070700005)(53546011)(107886003)(76116006)(5660300002)(8676002)(6506007)(186003)(122000001)(38100700002)(52536014)(7696005)(4744005)(33656002)(55016002)(64756008)(66556008)(66446008)(9686003)(54906003)(2906002)(110136005)(508600001)(66476007)(71200400001)(4326008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVhCVUR6TFRpNTQ2Ykd6K1ZkZHZVWkpNdEdYN3VSSjRuZVJLNmNPY05jLzAy?=
 =?utf-8?B?TFdaWXJjQVlqeXQvdmZSejVFRjRNeVFQVVE1OHRhalIvaGFrVmsySlFweVMz?=
 =?utf-8?B?emVXV0JIcUppdm5vTnZlNTUwTzRjTGpydng0VHRHYjljUkw0MFVHZHFBUkt6?=
 =?utf-8?B?SDQxT2dMZXhsY044MmNGZVZ3eW5mQ1RDL0Z6aUwyM1NLTkIzK0l2alpjSlB2?=
 =?utf-8?B?K0RnZnByRU1lc2dUUkgwd2diTUpZSmZuMEJnOVovaitkbXdVaTBhMmVhOVp4?=
 =?utf-8?B?Z0pZK0s1MjZuOHoyQzdiT1JFVVJpZTJYWG9HZ2xWTkRsY0lkTk1mbVkwcVM3?=
 =?utf-8?B?VEEzMk54bVVYVTFqU24vLzZySVJ3MUFXZ3lXdmlNMlVuVjlqSzdjbGtvTzAx?=
 =?utf-8?B?ZWpyWDN1cmc0ZHRPK3pQTTk4UUFiQ1J5NmExZFNDdi9LMFd6UzJ3NXJkWTFC?=
 =?utf-8?B?UWNlRVd5SjBjWjNUV0Q2V1c4Y1pqaXFkeWdRUE1CU1gzczlEcUhNYU5UV0FI?=
 =?utf-8?B?WXVENmtPOHkvd2NLbnVFZkpsNmNtQkozd0Z6bzJKQWhqZkNsZGdhSGEyMDhv?=
 =?utf-8?B?VHBDOW83b1BvMVZPdEF6TDZ2R0RFdnRkL3ZyVEtWRTMyWFd5SjA1VUJDUUhC?=
 =?utf-8?B?TUJ6Uit0cEFocW5aMlEvOFlFT3VFTlQ0MDRpK0w2amJMZW51cUtyTDFBUUht?=
 =?utf-8?B?UUxjMGZLbElNM0o4MWNRMmlTN2VOcU1obHd2RzUxRzJMeEt2ZmFva29FVU5r?=
 =?utf-8?B?UFRPcGZvL0RIZS9iYW5mNkFRb2Zhei9odU1vM2pJNlEvT0lMNVJFUGhkdUNI?=
 =?utf-8?B?WlBrRy9hZjhwVnB5TDdkN0Z4Tkp3QlNEWlduUDhZMytBLzFUSlVPaWRzUDJC?=
 =?utf-8?B?OFFpdS9DdU1BTE45Kzd2RFYramVWWjl2NVRYenl6RzR5MU9iR2RYVE45VjA5?=
 =?utf-8?B?R2U5R1hVUGJYaEtJN2xiMERuL09qcTZwU3R6MHhZOGY5YUw0RVlhd24wTE12?=
 =?utf-8?B?RWtzd2loM3RVc0xlK2RFNVFJQTdtMFFHWFMzVEcvNmdzcVVtSW9ETzRzcDR5?=
 =?utf-8?B?a2Y0TUtsNEFDWnFwRldjeUlNQmNKcUl6RTJnNGo0VGVRSkdQa3AxU0dNbWFZ?=
 =?utf-8?B?NkZjTE9ZaXBDTHNOaVlmblVsNnlWeU5ReUE3TUNyc3dqUUQwMDZuVG9BZURr?=
 =?utf-8?B?UFBsTDZmaGlxM1R5K2E1MEgzdUtGcDJVVXpUNEphdWdITlducDh5WFUwYmJY?=
 =?utf-8?B?NG5UcGxsTDZLMmRob2crOE5xMzFFRGdFNEpTSXIwdVkvUWlCaENOY2dqeHBO?=
 =?utf-8?B?cGJBbHJ4dmtUY2V5aExFNm1YUUJmcHNTZTF4NlJFeU9SM0xTeWJRODR3YTE5?=
 =?utf-8?B?VVJaSDNzK1lCTEo4SGtUV001MTBiRURJbG5pZll3V3hVODAvdk9VOXMyZy91?=
 =?utf-8?B?bmFVd0FFbFg3TUpudEVNaGZlcVdTRmo2YmErOGFJL242d1dUbWJQbkVWYXEw?=
 =?utf-8?B?djZiWnJVMDBMSWRINk9lNFkvOUVCV29odE0xYWtrN3ZsKy8ybHpyMUU1OXU3?=
 =?utf-8?B?bnlVS0o1WERwNDg2VXFERjZ1SUh2VEFDeVhpaUgvRml4OXpLbFB0ZEw2K2ZL?=
 =?utf-8?B?NGhPcDc3V2doVVpyOUhxVE16RWEwOElRM1JoazNGM2VWbmNGWTBsM3c1RjVE?=
 =?utf-8?B?cHJjcDJBRkVGb2VoNXJrdHNjQm8wTEMrUmZadllJUkJkbnpuaHFlSkt2cFRK?=
 =?utf-8?Q?3+ViiEGw6AVWCLqWxc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11bb137-7b3d-41b3-f4db-08d98dad8065
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 18:24:17.1126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XXr1vry7cAeLBBqYJt/HTThUYBJDbDftrgl9yPHg2JbBCqHUYNbf4hPfvoPsyB2RxkXsbajo3B/Nv27H0ZLyqwJ4Qr9+tiKHcGfX7MwgRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1700
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2V5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBhcm02NDogZHRzOiByZW5l
c2FzOiByOWEwN2cwNDQ6IEFkZCBHYkV0aGVybmV0DQo+IG5vZGVzDQo+IA0KPiBPbiAxMC8xMi8y
MSA3OjUxIFBNLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+ID4gQWRkIEdpZ2FiaXQgRXRoZXJuZXR7
MCwxfSBub2RlcyB0byBTb0MgRFRTSS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NC5kdHNpIHwgNDAgKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+IGluZGV4IDBiMDM3
MmEwMjUxNS4uOTNlMWVjMjcxZmYxIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+IEBAIC00ODgsNiArNDg4LDQ2IEBADQo+ID4gIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gIAkJfTsNCj4gPg0KPiA+ICsJCWV0aDA6IGV0aGVy
bmV0QDExYzIwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0NC1n
YmV0aCIsDQo+ID4gKwkJCQkgICAgICJyZW5lc2FzLHJ6ZzJsLWdiZXRoIjsNCj4gPiArCQkJcmVn
ID0gPDAgMHgxMWMyMDAwMCAwIDB4MTAwMDA+Ow0KPiA+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgODQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCQkgICAgIDxHSUNfU1BJIDg1IElS
UV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsJCQkJICAgICA8R0lDX1NQSSA4NiBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsNCj4gPiArCQkJaW50ZXJydXB0LW5hbWVzID0gIm11eCIsICJmaWwiLCAgImFy
cF9ucyI7DQo+IA0KPiAgICBXaHkgMiBzcGFjZXMgYmVmb3JlICJhcnBfbnMiPw0KDQpPaywgd2ls
bCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+IFsu
Li5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K
