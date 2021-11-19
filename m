Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE0445680E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhKSC1K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:27:10 -0500
Received: from mail-tycjpn01on2138.outbound.protection.outlook.com ([40.107.114.138]:55071
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231526AbhKSC1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:27:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVqmisbM9BEThPyFPncyK07/7I4F6ygJJrEa0ftwlh6gwjGdp/7OJ4kjBzMEg6i9wiQeVDTrx8SQGuZnJjhZuUXY8MrtTjV8w9NB7Mn548q9vFB3oZhYTRdMqBR8J9SNN5o1hcHhmNwfzpdv0mGH+4+ILYdqFIYodaJyUP3mS52pEh3hRwqWwwYtcau/BuzBENqKGq7ggZA/FjxF7ehhU80VKf2fbkpBlDa7BsAkFb1YGsephyv4+rtrod4Hvw7bmHstJiYSk3ym57NIxeEJkhjaDEUJZ48ITIaiXZ9vOx8NiRPkX4+Bt+b3guoRZu+qOeuni9h0CoR9egTKtZ7QVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/ReMWFHxNQ5OG6ZPbODpT2A92oG6qaeyBSA/H/sB/4=;
 b=lQbkKojWKQZoUri5YNeyIvRJUyNJgOmI9HZufXS6jbZpCUbOdNgtRxZ2X4/O837vW+96I0xIXtRn5a+pFzavQuMO4S38oMMxtWRvwEbpAb1ODP2sMFClGiQxmMD3yOW86fvHN6lJYqrPUuSrCu9Xa7O34u5kB8CklR9ThNq/1iBi/CkNp43XDfPLVpTT99Yk0vMgeAY/0FtrvNOSnMVp8OCW5Ho26U1/gL3RZvFZNsQeKQiqSK25LjTP3V9xO/hrKG5rz1MJcFbVgisONWM3Hbp6NwCciISjHWa4H+SEJ38yQiGnAgWoIdRoXQfVm2DWH0REoBqzNTrvKB9N/g9FBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/ReMWFHxNQ5OG6ZPbODpT2A92oG6qaeyBSA/H/sB/4=;
 b=KWrTzVybnF8YaxvKCQU4JrriWsRi4dphLRXNcwr7Ye3vp9Fs8++CoxuD73nY7eznSD1YIOSzBfIeyFx9HSICM6Q4xPIIdRSY8TrqhSZrjdArffc/leabKpHmQQwIUGXkGJUoc5HVskdKGGzqvjbXns4kKyrQBEmDknC9bLaq4zU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5275.jpnprd01.prod.outlook.com (2603:1096:404:da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 02:24:06 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:24:06 +0000
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
Subject: RE: [PATCH 08/16] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
Thread-Topic: [PATCH 08/16] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
Thread-Index: AQHX2r2HLFr2P4XYm024DlGZmt4gKKwJpmYAgAB8vrA=
Date:   Fri, 19 Nov 2021 02:24:06 +0000
Message-ID: <TY2PR01MB3692F738849D3930DD10DE5FD89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-9-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWWDUWajpRaoQYRsihu1JOD+itzgn3Gc3tVzK7_4vhzFQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWWDUWajpRaoQYRsihu1JOD+itzgn3Gc3tVzK7_4vhzFQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7632610-7c44-47a4-2121-08d9ab03a994
x-ms-traffictypediagnostic: TY2PR01MB5275:
x-microsoft-antispam-prvs: <TY2PR01MB52758CFF58817363335D7E11D89C9@TY2PR01MB5275.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GpYj8phMueZT3WRFdO1PnlA4+gpIeBmcWkW6OdBVb3HgL45hkuzF8yS+l4OgcDaUPDuMQuKAdw6XGqyI4p8va7VjP5g+YQ9/XbDN9TXDJXHOpa9sgYjglvK+4WHTMNK/L8Btyp4n7ywepT3haBONH+CfMbtAyuMBm41N7GLKrwrLe3udphzikKx3xGnfUx8BRy29Vu7ouBabHVN95KFihrG/8xMvcgrMSPlt/9D97s28HQm6HUwA5TQwq15KSK3ePfxKdfRnT0fPc/CUsv4zG3FpchFs+p9kyVIS8pO6q54KMuQ0Ycq4wfeN0Lm453fZIbVl8t+75TZ21WtEUKWstVwoz+IiQjf3Js6WFJqksY9crDQffNc99XsHsmXCGhcJwOecNUNdHeKpGANKhMVKAluj85VfVBk9FuCdPJAjr32QUqhrwORb6A/Atr+KJPonLHxdsQmHja8E4mB3xRk0+sJg/Bh8FKlPOMB6GhtgrUR9VW4CwXLFlj+ImliRnpYiBhDKhHNEpVZgZjaa1HwKifc2C+g3c3VOex68C7b9bNW9MDHvXX+EVW8eLpJ2SMvKwOlkgUGtAmADHBI1DmBEI2XbxPagRNzt3oi+yWf6kgcjQxKvl9zW6QOqxVXxhMdTXlW4QDposbH/cievr5dyYyUm/Ygi8mcKXX4cSPLTKAkvAakeQ81GmQ6lTksFjf3ViJCpoahWODrbjJJrstEckw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8676002)(4326008)(508600001)(8936002)(186003)(26005)(9686003)(6506007)(71200400001)(6916009)(64756008)(53546011)(66446008)(66556008)(5660300002)(66946007)(55016002)(52536014)(66476007)(7696005)(4744005)(2906002)(76116006)(86362001)(316002)(38070700005)(38100700002)(33656002)(122000001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUFERUl6VFlENG1rMHRHNlRDV21kdU9qSTdUUExFQWpJbS9OQU5kVTRMWnY3?=
 =?utf-8?B?dUVpUXR5M1JxZEZ1Sk41ekppNTF2NG5ROHp5Tkt2Ti9MRDlybTVheGUvcXhZ?=
 =?utf-8?B?b2o1WnQzb1d3clhtT1RTbDJTSWZ1ZlFYcTRGZWJ2aXhZVEhER2dvQXg3MTls?=
 =?utf-8?B?MHRYTExCNHl3TEhUWGFQbHRrMGVEc2JCZVhYUnZDenMvRW9KMW8xL0FYZE1H?=
 =?utf-8?B?N281YzZNTkxRd0JVRGk1eG4yZmQzWFBvZFRvcyswNlkrdFVHUEhlaGdqckJJ?=
 =?utf-8?B?ZkJZVFhlU1Q1ajFsQi9kdlYzWGQ3ZTNReG5CK1NtSW9yU3Exek1wSWNZZjNW?=
 =?utf-8?B?NGgwZXJCZis5aUZoeXA3aGVSTTNMbys3eXVUR3VGNzVFV0dVZHpSZ2NGeDEr?=
 =?utf-8?B?N21STElHVFhzQ0lDM3hlRTBCSzVESDVGcTZybDA4SjRZVnIxazVKVytWVVBs?=
 =?utf-8?B?YS85SjFweElJTWJ3VVI3WnZGandOcnZLZWhnenN4SHd1WVVqTlZOTUF3azBT?=
 =?utf-8?B?VVVqT3YyMnFaWW96RkFoYXVOU284WWFCbE9zdklwRzByY241Sk1ESWdmZko2?=
 =?utf-8?B?VTZ1N0c5eXlMVUVlTkdXTVM0UDVadkYxUTdMazJtMEpXZ1lBcllUdUE1Y2Zk?=
 =?utf-8?B?TVAzZVpIYlV2VFAvUXJCR2lOcTlOdUNUQXVOR25KK2tGWGpLWTF3ZEJUelho?=
 =?utf-8?B?MFpyeHppNE1Bei9BbFpDNk41RFNMNVFKbXRTRVRnSnQ3c293Zy8zcVgzbFpO?=
 =?utf-8?B?bXZNdlZGZlkwVDhYU1lKZ09WV0pCcHY3WnFjZ0VUTEZjUVIzeWFVOWJPbHAr?=
 =?utf-8?B?bWl6ZjQwMGtORUM4dUZtNzFZZWF5S3RuTzdVdHMzQ2tTYitwQ3VTTE9zR1M4?=
 =?utf-8?B?QmVyYmpVMDZOb3RtMkZKY2g1SHJicERXNlhrU0FobGNmcjFFVExtamM3dVh6?=
 =?utf-8?B?REc1a0F2S2I3ckZpQi9iUWtGZVZIOW0xbU1pcjdqM0oxTU1nelY3MXlWcEd2?=
 =?utf-8?B?NFJVR3FURFc3eS9xWXlSSGRtSGdnS3lqRU4wekwxejdocE56Um5DRFZuWE5P?=
 =?utf-8?B?SDNHTnFDQTRZOXp6ZEFQYmVkR3ZMT3JqRGRYNjY3akMwcldaTEVlbVA1L2VU?=
 =?utf-8?B?RUlRbXlZN3BMUGFBSUd4S1NWMzZRS0NjY0hpMTNqcCtkaDAxOURqckx6ei93?=
 =?utf-8?B?SWlhclZzUXA4aTllekYweXhDZlRBOG5FVEpyNWJXeVVLQ1U3WGRqWThNVklq?=
 =?utf-8?B?WUhxa1JncmtEaUdFQXVsNnZ0d3hObzBocCszeUYwM1R0WjlraW9SWjZ4U2NT?=
 =?utf-8?B?UTZoNVBrZnZHWEZLazVZankzc2N3cXNoT01kQVc0NlZvRGxUMnVjWkxyaG5h?=
 =?utf-8?B?WjlWeWlHOW5FT0pUS0pFU3NpV2IzVVpJdDNKQ0lnRFUwckRiZEZKL3BOYTZF?=
 =?utf-8?B?ZlpwNXBsWWlYM3VqV0pzM1RoaGNNVDREZFJYbjg5OXNQQjdtSGhEUmR6c0N1?=
 =?utf-8?B?ZmUwbEY0RXNITmtoN2F1REEwVUx6SCt6RnZyejd5V3dvTkMwWXJQTWVtZmtG?=
 =?utf-8?B?M3dNVUxDR3UrNjZKaWNWSTNKcTZxZUVFY2t3Y3EvN3lQQW8xekd1ZWthUGxr?=
 =?utf-8?B?ckhBNzl1WS9reFdLaHpJdldMZDQ2R2dTWlh2Tm9VMXJmdExPdXpEdWxrbTdp?=
 =?utf-8?B?UG03NmpUSnBLb25ZZGlaUy9aSmJWS2dYcXQyeHdyb3pzeGFJdk10YURBV1hK?=
 =?utf-8?B?QVpmVkJSbjRVTEdnZ1JRVFZYYUlXRUF3aThKZ280K3VCQTU5UndlZnRyUy9R?=
 =?utf-8?B?U0ZRRm9zc1VaSjhtaVVEanoxNXJ6aTl6Mnlrd0ZCaTQ0VWNjblY5MU41ZUh2?=
 =?utf-8?B?UlpYaml0aUdWK0JJNHkyNi9CUXh2VldpVzFoQkx3TEt2MWM1a0ZCZW9UZklB?=
 =?utf-8?B?eTZnWHhSUlFsR3IrcVVoV2hDZmRDRCtib1dXd1lYRmIyckVNRlIzbnZNakta?=
 =?utf-8?B?RGErTHFBNUFJZkw5V1hQYzZXNkp0OWxxQVRFSXBncTNzcWMwd0xhRjUxMkln?=
 =?utf-8?B?eFdQK2k1ejBVdC9Ja3JvL0lEaHNMLzNxUS9SZG1maE5sWDdnTEhqdXpndm92?=
 =?utf-8?B?Szd4SzA0U2ZuQUdzb09tZUhUK3JLckovV1FmeGNxb1RRM0tQam0xMFBIbDNI?=
 =?utf-8?B?dVg4dnkycUhHcVIybHJtdzJ1SjUyR0srRm02bWpNZ3ArRVJJYlc0Sjg0enVT?=
 =?utf-8?B?TGxsU1Vta1oxaXNicW5pY2FwbEwvK1FSU1pWRjVwangxK3lWRUdMMEx4Z1Q3?=
 =?utf-8?Q?wdw6iPbXTRVfeh1xfX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7632610-7c44-47a4-2121-08d9ab03a994
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:24:06.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtWYnkhLXux3AsGFs6Sak/9TeW4NTTukUtVD5wiDZ0nTXZbs4/UzJ8c/Bd+TGebeUVwsmRlqvzXjvWV/MuCQEIyyt4NsAceb8iN/77fuMEBjKCKRXkOUJr4bIUD3TeXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5275
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSAzOjU2IEFN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDE2LCAyMDIxIGF0IDg6
NDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBSLUNhciBTNC04IChSOEE3NzlGMCkgU29DIGhhcyB0aGUgUi1DYXIg
R2VuNCBjb21wYXRpYmxlIFNDSUYgcG9ydHMsDQo+ID4gc28gZG9jdW1lbnQgdGhlIFNvQyBzcGVj
aWZpYyBiaW5kaW5ncy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2Rh
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NlcmlhbC9yZW5lc2FzLHNjaWYueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxzY2lmLnlhbWwNCjxzbmlwPg0KPiA+ICAgICAg
ICAtIGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+ICAgICAgICAgICAgICAgIC0g
cmVuZXNhcyxzY2lmLXI5YTA3ZzA0NCAgICAgICMgUlovRzJ7TCxMQ30NCj4gDQo+IFBsZWFzZSBh
ZGQgInJlbmVzYXMscmNhci1nZW40LXNjaWYiIHRvIHRoZSBibG9jayB0aGF0IHJlcXVpcmVzIHJl
c2V0cy4NCg0KT29wcy4gSSBnb3QgaXQuIEknbGwgYWRkIGl0IGluIHYyLg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
