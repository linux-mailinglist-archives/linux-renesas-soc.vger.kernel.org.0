Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC7F4567EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhKSCTR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:19:17 -0500
Received: from mail-os0jpn01on2129.outbound.protection.outlook.com ([40.107.113.129]:37888
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229830AbhKSCTQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:19:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGVSChSRocTBhSyDHN0hYQpikmZJXL015S69pPMXShi3VqEKeUlxvebqtSU8JJQW4MUBFiQhdXVMKIggsZX517Tg6rh2+AYry6dV27/M9gUb5G5YIbOirdZWR0rR6R9xOCBD9W/aorkEU7QsK+HvQDxOCff8jx04Dj6WHoOMzk/0lCTXLwmSoj2DnSjtGtSRJ4bZklMaoCw5gR5131s/akuX9w4U885DBeePDgfAGLophcIB5p7wEjKuvcPhJ7qhxuEl8UwyobmLqBqFRF+nPeO6lOYvNMza2l0bwEnabGQR7AyQ/6DU89IQoT6kmWJmMX3wD715j+GmOs3QlLP1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV6dC3thk6prdt6iEAn6wl4AbxsgNF5Ru9Ss6UcXKqg=;
 b=VXxJjhyun5Be5PzTzA22uLPP1VhRF8PTyQocQTufs6j2GDTNGJjoC3R4UoodgcJZRqx+dgPT5IJDy5g2cTHjCny8pzJR0WO76vFd7UAK9+FZkIqYwhPnfNdu47n+8xuyp5/fZn9SYtflcj71zN6zTgWvVk55XluYKTi+kYHhujH9nDbdHgEzsj/lNhENx+iUp5h+NDv3pFv483SmDfOnVd/XLY5Y8w7B/uy1CKGQM651GJZZOcZHct+YLBnDpFlwAbiyF0btQvAAEZCklSgpBvB3uziPY2O2SWdHDUlw4IgPiu714eMYw87q1EqS1OTfgnpSG3mnAh/C7jN5YHkq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV6dC3thk6prdt6iEAn6wl4AbxsgNF5Ru9Ss6UcXKqg=;
 b=QpQcL3GyfOQzihsiWvPh3YlU2SWomwg1ZtvR3Om7GD26b6dgLvs/0jwsLSi42tR/jLf3p5JBvih4p/f5mOWRw2qlOvOSDZbCMbBIWqZmGQL6KfoyZs9th85Z8pIItVCnktjB3GQu+R4jLSB6rhYcbOqtVtBfv8VZCI6dPrRts1U=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB7087.jpnprd01.prod.outlook.com (2603:1096:400:df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 02:16:14 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:16:14 +0000
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
Subject: RE: [PATCH 05/16] dt-bindings: power: Add r8a779f0 SYSC power domain
 definitions
Thread-Topic: [PATCH 05/16] dt-bindings: power: Add r8a779f0 SYSC power domain
 definitions
Thread-Index: AQHX2r2IxmtRsau7Wk2X83gqS0x5L6wJopAAgAB+huA=
Date:   Fri, 19 Nov 2021 02:16:14 +0000
Message-ID: <TY2PR01MB3692F173881939B66B5B4418D89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-6-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWa=pc0TTNo4894VPqt7K+7V1Kdxxm_cOee22v=w_5c4w@mail.gmail.com>
In-Reply-To: <CAMuHMdWa=pc0TTNo4894VPqt7K+7V1Kdxxm_cOee22v=w_5c4w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 229d4546-e8fa-4e38-34b4-08d9ab028ffc
x-ms-traffictypediagnostic: TYYPR01MB7087:
x-microsoft-antispam-prvs: <TYYPR01MB70878D115F56691F9E091E97D89C9@TYYPR01MB7087.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfOTHymXP0q8f7Rk6y6586c+b3plZ4AxoL9Z8mTHRPkAvdSHB0iVN3rU68OyrQkaSIsG1zGj7NPn5A1MKjjiCtwzetEvazy7sqJJx4JJoxiACnIEqUWMxts+7CK5G4Ej+UkF5N09EvJb4IzcoM/+66xB/zxKDBZ9n7rKcwi1AYixGlxTktnES0Kz/44Q8NKYEoI/5p3rZBa3Zy+dwbbRjCpC0BwQ8d+fceB6+33H6P6nnDsZb7EvBdUyekhbVUY9Z9atMz1nPhuwfSq0GoeGehE/othKA/niDa3x9nH+zMAcz097S/npRPqQ5Wx6zF1szBwcyrKiRp9PjyrCQRiYR5myo4sKoxLY3svdUME2RU3qJwXpao1Xe2TB469WJL+7h+bJlg2g9XDbNG30SwXApYwRKwSH9Sk0zHS9qpgMaxhU62maMwWtEWI5CDs1b4MZZyrXMgNQfRtJ10ZebQHH6xFDbsBqAho3P7RKiehqDlzRTcDgyWC7uUHKUATHyxVPDZU2atIqyeaZCuGtK3UyERSPUY+PRJ5d4L8uJcphPWxVhx1VJCwS3YThJNjUyhf3zcY5fPEN8DtrrjQ8wvZ2mNhfbBa+ms9w28zI8kbnQcQs4+wTbckFk9z6xOQITPmXxNgr6klKouIq4hRkx2bJiMbn4DSlly70uy8cHGZB+JoplRKZDwlEg1Ixvbk2fxneuVS31CqI3r+GjemTkAa9Yw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(66476007)(64756008)(55016002)(66946007)(66556008)(66446008)(5660300002)(8676002)(4744005)(38070700005)(86362001)(52536014)(33656002)(8936002)(6506007)(186003)(9686003)(26005)(508600001)(53546011)(2906002)(4326008)(122000001)(316002)(6916009)(54906003)(83380400001)(76116006)(38100700002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkE0WDMyVk4rRXNzSGtaaVR4MjNhUTI0SlFjWkQyL09FWCtyZUhKN1QvUkFy?=
 =?utf-8?B?YlZqQzRxZXBWNlVzWG9FN2xHT0ZLUjB3Y2NPdlo4OXd4UmtYQ0NJQ0M0ajRm?=
 =?utf-8?B?d2MwcFFIamZ5NFRTdEZjRFJPcUo5NXBvc0k2VHF4SnRDL0t2VnFlblEyZGhv?=
 =?utf-8?B?VUlNTXZiSDhxVjdaL1ZnN3p1cTFyajRza3FFakE2UE0yeWdkQ1EyWTN2eS8y?=
 =?utf-8?B?NmpzcnBMdWpiL0thT2RVR2hNRjhKMW1QekwvaXh1RGltbS9rNlJGUXRISEhL?=
 =?utf-8?B?Q08wNm9XaXJoQ2JlOHpnNGg0alc3VVQrV0pmVmVlbHBSdER5L0pkbVlaYmVq?=
 =?utf-8?B?R1BtRnFRQ3FmWG40bEZ2WTNqajN5WFJQWDMyUkMzbTdybDdGMVJLVW1KQjU1?=
 =?utf-8?B?SlljS25qSzNYU0FnYTJ5OXEyeEd2Y3FDN3JIbWlrSEhMb3lNa0xxd1N2RXZj?=
 =?utf-8?B?MytiSmdaNC9renpNckpKUVpCRGh6R3grcXE4T3k5K2ZDSitXVmlMSTczTEd1?=
 =?utf-8?B?TTVsWXZLelpTaEJoajJZNjNhdks1ckJPRXJsRzh6eDRGTzdDU3k0QnpWck1H?=
 =?utf-8?B?MGI0QXJHYmxlYmt3VUZYeWtsVHBtUnhCVFZRbWd0VkIxNXJvUjV6VFRGSHVa?=
 =?utf-8?B?YVZlQzFjUzlwc0lOcnhLSzVkQmFJU1JzQVNaWFVRZEVCNy9JOVIweTQ4RlRt?=
 =?utf-8?B?QU9PbFNFZGt5dHkyRFhVM1hMOEd1d0x3akFMNHh5MHlBS3lJTXlEQ05KRlpq?=
 =?utf-8?B?dm9OWFNZK1dVeEdzU1FWSGVscUI4ak9RMUNFNm9SMm9sTmh5VzZ1NzRFaDFy?=
 =?utf-8?B?Uyt6NjFwdytLN01VOFByWS9tTFIrVFZpZHE5emMyU1d1MHhDc1JYMlZYQ0dz?=
 =?utf-8?B?RWEzbmZ6ZEpmWTFUN3MycmhNcHM4b2IrWDN4S2V5YUNnL3NVL25vRWtSUlYy?=
 =?utf-8?B?b2xCRHFtWk1aRnBPU0lGK3dWNVlQODAxZDJyVUtrZ01sRXlweElmaDZ4eElE?=
 =?utf-8?B?dGZIQzc2RmUvMzhzaXV5S2lFRWpsUElLdjR2VTREd2d6SWMwQjlOdk1uZWlh?=
 =?utf-8?B?WVpsQUxFc2VHR3ZmVGxta3dqM3l0VVhBeTc2Um8xMnRSVWlXWFpVZkk1SUdz?=
 =?utf-8?B?WThDVm9XdHZHVDhlaDBaZmpJVzF0S24xL3dCUXA1R3Z5bDBLM1A4Wk0rdnNt?=
 =?utf-8?B?N3o5dDFETkVoOHVkcmlVRndnVHVYNVQxOTFBZlNtaWdqenJObDZtU042K2NT?=
 =?utf-8?B?QmY5b0hLOWNqM2JzZGYxNklnZ3l6djR0VlVkZ1V6ZlRoTWNGM0lZeWwzUGJu?=
 =?utf-8?B?ZzFWK0dkejZBL3pRR3JjMThBMzRTVW9KWkw5TUJTdXh0NWVOblhpejQ0RUtJ?=
 =?utf-8?B?aEp5ci9QTmkvTUZ1ZEdQN1gxOENRMEFRcW96R2dieGJWa1dONWhQbVFXVUZW?=
 =?utf-8?B?ZXlZcFRPR0NZTkZkNG11amdyaW44bDQxc0xYQWZXNEhjeUsxK0l5UzVlbDZz?=
 =?utf-8?B?YTRUQ3ZQU21nQm93RmY0U0V6N0gwVWgyN1NjV00xZG02emdWSm50UTdia1pR?=
 =?utf-8?B?YkFQUDhVS3JMMHFub01jS2xXbGl3Z0IzMjlSSDBSS2wrYVFaUTJ6N2NRZ2NP?=
 =?utf-8?B?ZW5jOWQvSnRXdWZvWE1VdlhDaGM2OUw4bm1iTlIvZTByZGJwNmFwMjlDeEdj?=
 =?utf-8?B?TUNMaWJYUTRGNFIzVDlvUFlnd2JzSkFjd3AvYmtVMURFeHF5UVdXQkpQKzdF?=
 =?utf-8?B?QkVVSENOUHZ0WWxLRjZuRGFnL3lZQVF4VTJzMGppc2dyc2hCWXFmRURiUXhB?=
 =?utf-8?B?MjJJbEp0VXZ4TVpZdUhUUUF1TUxVTkdSKzBwa09zeldJWTBmZUowa3hYekZO?=
 =?utf-8?B?YWpsRk1xaUREWUZqc0lKd3VSbGRXYlRxTlF1QkJLQ0J2TE9UMnU4ZlVkTW44?=
 =?utf-8?B?WlA5ZmUyZ2c2MnVaQUdkL29pcU14b2FxY0dZTVJBazluZnZVa0s3bmVLamtS?=
 =?utf-8?B?L2tEM1o1OVJmNFFVa1hGOE9vbWo3ak82aWJlUnZRdEMzZkw1bFhiM28rL1BG?=
 =?utf-8?B?bW9xSlMyOVBPdlRmNWhpL2pLU3dETWErT0FpYlBKbERKRldTZzBYc3gzRSs1?=
 =?utf-8?B?K2J6N3FuSHlUNXFiZDh2Z2VYZHllcFB6NnRLN0lTNkp6M2RtMHYyU0dJYksx?=
 =?utf-8?B?cUIzMVpJcmJPNGtHNGU4cUd5OVBiUllVdXluU3ZtMXZ1MWpsZXVnWUtpRmcr?=
 =?utf-8?B?eUxGVlErQzBUZU9UUGEwN3dRd2ZOTzZNWmxmWVR5NkUwMW9VT0cvZk1Da0Ri?=
 =?utf-8?Q?tDHDozEt0hBCRTsx6/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229d4546-e8fa-4e38-34b4-08d9ab028ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:16:14.2191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yIg+/Ai4SWpodzljnF234hzhWwNu7D+rs/cb/yZGJQZ6HrmLbPIg9g9WiklIUuoCgtB6QXUBVQxxRlDMI3sI1GWCvtL05i6c9LI6+PoUslGdvEVUVrlYRVNYaXMplBq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7087
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSAzOjQyIEFN
DQo+IA0KPiBPbiBUdWUsIE5vdiAxNiwgMjAyMSBhdCA4OjQyIEFNIFlvc2hpaGlybyBTaGltb2Rh
DQo+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIHBv
d2VyIGRvbWFpbiBpbmRpY2VzIGZvciBSLUNhciBTNC04IChyOGE3NzlmMCkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3I4YTc3OWYwLXN5c2Mu
aA0KPiA+IEBAIC0wLDAgKzEsMzAgQEANCjxzbmlwPg0KPiA+ICsNCj4gPiArLyogQWx3YXlzLW9u
IHBvd2VyIGFyZWEgKi8NCj4gPiArI2RlZmluZSBSOEE3NzlGMF9QRF9BTFdBWVNfT04gICAgICAg
ICAgMjINCj4gDQo+IFRoaXMgc2hvdWxkIGJlIDY0IChpLmUuIGJleW9uZCB0aGUgcmFuZ2Ugc3Vw
cG9ydGVkIGJ5IHRoZSBoYXJkd2FyZQ0KPiBibG9jaykuDQoNCkkgZ290IGl0LiBJJ2xsIGZpeCBp
dCBpbiB2Mi4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
