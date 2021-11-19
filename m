Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4754456807
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbhKSCYj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:24:39 -0500
Received: from mail-os0jpn01on2103.outbound.protection.outlook.com ([40.107.113.103]:17847
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229851AbhKSCYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:24:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XluWxa+6GpQZW0QhT0owajVueNOWjDuqGdZ4XFZMnAPYyeGTJPi0gxyWcoWh2OQS3KYNYjtoy3d8lbwgZCdAoUVDJK9+CkHtqtMIahIT6kzCilkbN7yUeamofe8dwk/nuBMw7q6cCwVfjZXMiFYOYnE0QqVWcuPVVnt50uWyBumgrcVFFsNegwxwC394jc+DqEiN+8jWL20Vm/MmaXiLf34N+dYj5MaccSqoye7YRuyuJsFf60rgUZFzwz3MIZbJAjeLIrxE0+RHKbUEhTJt/Rgv1IhxP1yhFXP3n1AEbKJyz20422F6nu0+x2LufwVQV8Zgdm9K6e8hJWJYojV1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/8TmkfzGVLQ5yn4+5DZw2nxv8Bhq00ahbolD9q7zkU=;
 b=Akry+zBGt1XspCa0Czq71jdwPG4CYCrYwTgsTD5WhVH5I/SvZP+sZ/k9fi7wLLxECLT+jwpunbt+m1ABjTPv/urQsYJwexLd3RIusfRA7al9o4ZH2HC2lGYxtBYJ6xwBsac5pstfyjb+Fz/Pf2SZLpgVDhTyPynaauprL9oQkkWJ5EpID16wUVWJFsXhcA+YV81pTLKhdAGe/1Smhxsd2ec/TGlvjKJWQjzenggl4W8Tl5UkFrF/pUNAr8Hy7SF+qRg3wwWLq+TOgyC/bqoptHil1Mi7JcQ07Aq89CzemHwI53gHdYl3YrHGtPNgoAhGw8GzDpqDvEoh5AMTcFvr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/8TmkfzGVLQ5yn4+5DZw2nxv8Bhq00ahbolD9q7zkU=;
 b=ovUCXPER78nmhZhI/uipBZA6exLJNGM+I0ywUXEr1Md7QVfOZbLy8ES3hZQuA1FktzNC9cf/JGMbQHDPpT3rQl9JCUIJM0+P870gCyYLzP0kkE2a6dAve4uSB7Qe97h3MSf2VSgrcQyYeZDSanranS9YOn+F1YYC5UwpKqoP3wU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5275.jpnprd01.prod.outlook.com (2603:1096:404:da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 02:21:36 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:21:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 07/16] dt-bindings: clock: Add r8a779f0 CPG Core Clock
 Definitions
Thread-Topic: [PATCH 07/16] dt-bindings: clock: Add r8a779f0 CPG Core Clock
 Definitions
Thread-Index: AQHX2r2IF1gCvUvFlEeozUUysUAcKKwJpYqAgAB8/0A=
Date:   Fri, 19 Nov 2021 02:21:36 +0000
Message-ID: <TY2PR01MB36922D43BF03E82A1D3E5C27D89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-8-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWyfRj6XnYYGRQ5g3dM4W7=o13WwmU5xn2WS+SdJY6Knw@mail.gmail.com>
In-Reply-To: <CAMuHMdWyfRj6XnYYGRQ5g3dM4W7=o13WwmU5xn2WS+SdJY6Knw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9b5e065-11dd-4939-9179-08d9ab034fd5
x-ms-traffictypediagnostic: TY2PR01MB5275:
x-microsoft-antispam-prvs: <TY2PR01MB5275523CB39BCC56EAA66D18D89C9@TY2PR01MB5275.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VEEUQq2nY/GQmABOEr8qTRjrH7iBrPSbGldW/5V+zpmzV6libRdxbgfjq8RzwUyVunDu5BA1JFxvHuRal/le6gcgnm9AQWK19l2WhWtS+WnzU6DN4r/ZjbaeS1QhhbpfX3MKFJpJuY1J36/GtQ4DNQ+sTwB8HOGKr53b4aHMivmKHLPOig/gJ2V/NSO3KTGNrH9B5ofTe605vY2/IV7tYH+ecpPXJ4cFV2nrMgBEdtkjOwM8axWp3fOJDvYsXqzYQC/pXDqpndJ18eHWDgvukGEB3EkraiwnPki2rjs7oayBlS4tlPg+OzMN79oAsfRAPym3AVhxI0Vnb8lSMQHzj4D6KUsRDkJRfAl20LR40xKuvI+QOQZymtbNDpDHz7a5PBoSoOlvlGg+5tPWKwYyEs632yu2mRpWUdBLwxnFsV7YZGB0ieH+fqLWAHmG/MjYbQlHUHtywHeqUOIu+b5tjU8dzqrJ+l8xMgp6b8WC8o+Ot6HNUmQTqVQyykLzviD986rDLwW5eiisuZgdWq+cjfytYjz+n1rYoOIgZW9ZFruVXWLOFW2pU3ZZKlqe3N6FLZnrxm7fdDRw3FjEEVrqBU5Cw6tnE47PSXrN8avhBCNktcCTvO6LtDQ3EVVCvzELf4+lUcj9dL2a5I+MHUOUBC0sQNJcqODtdMH5tlEqBjPnwS6plt4nXzLAukfnvUu0aGWURE0ZmfffCBAeorZX6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(4326008)(508600001)(8936002)(186003)(26005)(9686003)(6506007)(71200400001)(6916009)(64756008)(53546011)(66446008)(66556008)(5660300002)(66946007)(55016002)(52536014)(66476007)(7696005)(4744005)(2906002)(76116006)(86362001)(316002)(38070700005)(38100700002)(33656002)(122000001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0tuZmVLbWVCTVVqcUVJcUdQYWl0QzR4UDFoWlhtSHJ4V24zdnk4NzlFZGRx?=
 =?utf-8?B?N2NIUDlnakd6d0dUWHM5ODd3NFU1NXNLMURRTXhxWFk5THNTZHlXQVBhNkl6?=
 =?utf-8?B?c0R4cTNyWDZIbmd1ZHdPVTgrQUhvdGdUL3hhRFY1VWV3Q1p0ZitiaEpmRWow?=
 =?utf-8?B?TXNzL0s4bmVLelJSWWdVSXplUGVrb3E2RnhNbm5oVW94Qlg3NG9PWGpuQk13?=
 =?utf-8?B?VjQyQlJ4TmFFandQaGoxMlpRVkt1aWlNWm5lb3ZGSVh3Y0xqU0NSSzgzQjBQ?=
 =?utf-8?B?NDlJSjVOb0tYd0Q3THRSRVpUNytRaHZKL3RQYWRwbks1bVpGUXVDK2F3eDBx?=
 =?utf-8?B?VFB6S2lOK3N6T3c5QlhTRVhhWFFPYUltNEFSQVZEWlFMcHVZVlZZYnR1RytG?=
 =?utf-8?B?dG42RThjMDFPeHBudE9FUE1MSldyQk13dUplMHlqODV0aHNHZnE3WHpZR3ZX?=
 =?utf-8?B?eEVNWk1qaFhweEpXN1MrUVhkVll6bkdtOEtKRkFyb2pPckYzNWNqZ1lWVTRn?=
 =?utf-8?B?UTlYaXNvODFIcHhIcTNBSmJ1aURoUTdXL1FNRk54U1JVUlpma092bWJQTzg5?=
 =?utf-8?B?SUU5UnI5YzU3cXhwVTRtL0szc08yMDlVMTVnMTRMOGMyQmZUb1Q2STVLSVVU?=
 =?utf-8?B?SUFIQXpKK0xoaVlUSGdLVDRWUGxNV1dVdWtLZHdMZW5YbEwzR3p4cWprd0Jk?=
 =?utf-8?B?VndhMVAzeGE0Nm8xdEVwaUpBWGJ5YVlVanFDakJMUjdTOVZ3YUljZGtvRmMw?=
 =?utf-8?B?N3pBTWFSZHo5SlVJcnFlUEFoV2RPNlpDakVMQTMrakEvMzVKTC9XdXBleEp0?=
 =?utf-8?B?dEw2ZFlMcEZnRFJXTGpqQndHWHZVd0ZoVjVmTngvamlPRW5kY2dad3VFbGgr?=
 =?utf-8?B?d3l4b0txeFNPWVJsNFVBZVpRS29RU1hwVFk4ZVBjZjJNcVArNzhlSWxBTDBM?=
 =?utf-8?B?U2dLakl1c3lVSmd0dUxBVjBNSll1aGRac0M5OFpObithaUwxVlNKdGNjYktu?=
 =?utf-8?B?WjlyUXJma3NKVlZwc2tlbG9zYXdsaUU1WU1RV1JrL2c5WG9keGNUY3E3VGJ3?=
 =?utf-8?B?Tlozd1JXVDRlY2dKZ0JOZ1FFVThpajFqbjJYdmJ1Sk8wdTZINWFIV2EvNVVu?=
 =?utf-8?B?SHcxeWU5MTFUZWMvRnBxbUtmdno2bWtFaktLVkxDMkViY1dLb2hkdGwrNXd4?=
 =?utf-8?B?YVdRSTVYY2o1ZVkxUFF1ZnlqQWVKTWIzeHRBaElocEpjc2d3Y0dDU3hDdVMx?=
 =?utf-8?B?Q1JZNmdyaVRURmhmOUpIdGM0VnVaQzFzeWJiTmtpYTVCWEhCL3crNmhDOUdP?=
 =?utf-8?B?ZG91VS9JR3l6dXdpS1pmTzNXRVN4ZTF4a3VPWEEveDY2Rjc0VkdpNTVwSUN3?=
 =?utf-8?B?cXVmczVBa0FCK29QNFd2MUNSMGV5QUhzWnBTcXA3YmRZT1ZYWWE4UlFpbWpr?=
 =?utf-8?B?Yk1lbXJpaXZEeExHTCsvNjdFUXZsQlV5VHhSQkJZMGd0c2c5ZEFpZjNsMzFn?=
 =?utf-8?B?RkgvelAzMDNuL3lNemk5SnJBR3VvOTJqdlcxbUVPeDJTVGppa3ZaZlNIdmo1?=
 =?utf-8?B?NE05a3BBUklQMXFoVzBFUzU3cExsZ2ZCQTY0ZE5BdVlPbC9vR2JYU2dseW1q?=
 =?utf-8?B?VGpJOHZ4ZjRBa1BzNERXbUdlaHNkK0VZZ21waUtERUJWbFBJc2p1THVwT0ps?=
 =?utf-8?B?MHp5TkNFcEcxMWgvcXV2QkIrbjFPRndrZmYwUU5acHA3K2Y4M2xjamVYeDkv?=
 =?utf-8?B?aGFWeE0rT3FTblZTS0ovWk9OdllmMW9SVkt2OWgwcHFFMVBxeE50K3RQRDli?=
 =?utf-8?B?Y05icjZ5cUQ0NTVoNlFJQVM0TldCdEtxbnNXUkVUekZFSnlGRU1yWllkVnh5?=
 =?utf-8?B?UHRHZXJhWHIyblNBTzcyelgvU2FrMWZqeFlvTWZsTlNDU0doOUdzV1M1TjJX?=
 =?utf-8?B?WjlKU0xETTlvZUYxV1BFWG9saG9IeHBtcTZ6TEdQTS85MXZIemZvYk5YekQ5?=
 =?utf-8?B?eWJxOW1kOFYySlN6T2pyVnAxYXdqVFZETVpSd0JDd0M1U296T3c4c1k5QWxY?=
 =?utf-8?B?dEJyS2hiWkFPcFRsblFFalY3c1V0RzhUdndUU296YmlCcWdsNUZOZEdSckgx?=
 =?utf-8?B?eEdLdUdOcjY0WHBqV2lrTkIybXorOTdNdmtIYkk5eXFNK0xoRGhUYkFZZ28z?=
 =?utf-8?B?MG1jUzVuYjg2YnYzNXJ4NnEwUzBUdEFlRFV1YUF0S2ZOM2xHWUxadm5rVVpO?=
 =?utf-8?B?R2JHUjZYNjZCVjhzNk5ranlDYXYxVzdrZDEvS0ZweGwrSG1mMjl2U2xHWkMx?=
 =?utf-8?Q?opDtnbs/XlrYpBS2Ir?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b5e065-11dd-4939-9179-08d9ab034fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:21:36.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GlEZvAAOEF2ooc+SYbLyw356O+zd/oC33VwN37wcmduOLstNSLUEyq6s8TcwelNv8app/MV1y8CtJi1FigktllzXWGtKjb/6mk/8A5x900FKK+Q3cA9rGNZjLFInN0x3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5275
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSAzOjUzIEFN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDE2LCAyMDIxIGF0IDg6
NDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgYWxsIENsb2NrIFB1bHNlIEdlbmVyYXRvciBDb3JlIENsb2Nr
IE91dHB1dHMgZm9yIHRoZSBSZW5lc2FzDQo+ID4gUi1DYXIgUzQtOCAoUjhBNzc5RjApIFNvQy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcjhh
Nzc5ZjAtY3BnLW1zc3IuaA0KPiA+IEBAIC0wLDAgKzEsNjUgQEANCjxzbmlwPg0KPiA+ICsjZGVm
aW5lIFI4QTc3OUYwX0NMS19TRFNSQyAgICAgICAgICAgICAzNQ0KPiANCj4gSSB0aGluayB3ZSBj
YW4gbGVhdmUgb3V0IFNEU1JDLCBsaWtlIG9uIHRoZSBvdGhlciBTb0NzLCBhcyBpdCdzIGFuDQo+
IGludGVybmFsIGNsb2NrLg0KDQpJIGdvdCBpdC4gSSdsbCBmaXggaXQgaW4gdjIuDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
