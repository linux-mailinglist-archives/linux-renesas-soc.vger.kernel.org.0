Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47023456824
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhKSCfY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:35:24 -0500
Received: from mail-os0jpn01on2139.outbound.protection.outlook.com ([40.107.113.139]:19707
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230519AbhKSCfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:35:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL1rWTlSMsUNcN6uBxO5fwFzQNcGvNEZPgK+liYrttREQZAwmceT0SVQNQl5n1YMWlVksTML2x9Rt8P4XELr9/b12NOeDHrikEvoFImRANp3fRTM0ZcNbRqCRumiqn2CQzeva+luhH2l96fquqx0muqi1xKLHgH7c3VDyLuSlpi84Uc/gul7Ae7ZNwAZTVwiQbrphAwrGe7orKDofvPIQEekZJHfuzesv7yrKQIfTK5JPUuVXH5e1B+0AFps46f2mOfq1TRU+eNh2E7zHqQ1atuyHKbSe4s7SZgAognYHu+dMtzvCQGASyCb/Zj4dqcI6gxjKYaUXHzPYlDbR+0Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MswRS1rW/jdICQazI2epYF/W08lP8qDW9VZ9s3fUTEw=;
 b=J7zh6/fL3+1jp6OiyipccZGa8RbtpsrhN2cBrWY5ouFlL/XMDXniARZbrHV3QkjYS6FoZzESkfcY+dc+uruBOdc2b1AsVpT5j0ICm47o1566dihcNPp/suXu++RvdVMlkTsECQFVe72sUbUtAsWziEkcET/C1+azHmLjb/s+D/ByGiyjJURg+WskNBAVwBiYJix1drJVqEkI6EB2djEPIG+ZMk9RNJHZcsoLvEYVebRxych0WAormZPbesZeo4wgDGNTXoLGVP8dpeQsSmtdQMIv7GYWwJqVmwYD05qZcoWcsS9Mot2OI3C2bEFPHS6ITsP1Syu19dU6Bq0IOzGlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MswRS1rW/jdICQazI2epYF/W08lP8qDW9VZ9s3fUTEw=;
 b=XQIQfXzX8n+E2njGnZnj+xfceURVETf9671pBPVsNu4N7MXhlOb63QA8pt1B4TRnzKBxbZoEW1yS+Z5ohpK4tpriryM1v8DwVaVo0DnjuavhsXbVQPuMQn+lnOip5rn4bGIWkDLxGO+DRO+mao778A6HNyjOu668pDDCm9yXN/w=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6929.jpnprd01.prod.outlook.com (2603:1096:400:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 02:32:20 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:32:20 +0000
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
Subject: RE: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
Thread-Topic: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
Thread-Index: AQHX2r2IUwb3kVRJd0+iljhSKStbxawJqN2AgAB8tEA=
Date:   Fri, 19 Nov 2021 02:32:20 +0000
Message-ID: <TY2PR01MB369285B8A6CE2F7681ECC22FD89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVLRwzhhLg2dne8KgNsDW4uJWMhjD1Y9sBfSKVgdZBR8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVLRwzhhLg2dne8KgNsDW4uJWMhjD1Y9sBfSKVgdZBR8Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b177ba8d-d705-4b46-8bab-08d9ab04cfc9
x-ms-traffictypediagnostic: TYCPR01MB6929:
x-microsoft-antispam-prvs: <TYCPR01MB6929DB8F11D00DFE8D1E5A2BD89C9@TYCPR01MB6929.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ld3nL7KWCKvIc8Jar7Zdh9W9so+/ERc25l7fCKPAkT1S8yg+Mbj+9yj8tCaumtBpyzZ0QWEddVlOwQkldogOOhnB7lDFay2n/Levv17dvbNMN+O4xUDHFEmPC7z3AynMKPAfAPv8Oy7bnzv0ZragQePUchTvgWDsebCw3boMz66ARxeEPaPuTOjDZ/4Jz6OLNMTOsXys+79j7X8843NyFE/s+7++XoX73p9kPP4kUtK2U3WPsMmwauPT1prtUDmil8qtq8fhKkXGyynISdqC1eyekaegE9LLaadKPFokYn/rxFZy8ytZezVIfmjgU4CQsGjW8McyLvkzZcTKDfLvpEIK0r0ZlanNb2Z6VWr+xLSiSbxu7HMjLgPvlTx28cSa9dffrBKzH1UUOp5dY2lO+ZEGSpuavpZmOddEllJS/98Sh7NQFD9NTeUFlSadJMfOK3rxTIo0wnZbjE7jOJmj10GQQzpHRmyo850Bs7Tm8xHkr+/HZGrwtVa78MG/Eeq7RTakmxP7dbOUdwKkflvK9e5qVZbffaVseCdvZa1E8//lS5z6sV5yJf3Isj9IYEFSy8SSOj2UBmgvY/RUilcgAqEBzeFwT0yEmX2pqoYIwpYkjKu7dYdXnoz6IFzmRAZZYX4W6TIHUrX2yEDdZrg3Of0Wz+5YtXNoTkdGna7tl4E7+lEgD63YwKlZNV59XakAA168qaYcQ+GIfv0rtzUsew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(5660300002)(4326008)(26005)(71200400001)(6506007)(64756008)(66946007)(76116006)(52536014)(8676002)(66446008)(186003)(66556008)(66476007)(9686003)(8936002)(6916009)(55016002)(54906003)(53546011)(2906002)(316002)(86362001)(83380400001)(508600001)(38100700002)(122000001)(33656002)(38070700005)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU43RW12OUhBaUFRSlI1K2dhUlBjVnZZVDdNTWpoU2x6MjlKRDhud3BuVkVL?=
 =?utf-8?B?UHJNd0RaQXdBaXJwWmlUMkUxRWxobm04SG5PdzV1NzVqSGVlUW1SSmhBY28w?=
 =?utf-8?B?VGlYbC81a2lraFVGSGRQS0V5THhKcE44N0lwSTM5Y1QrblZYUWE0UGxIekMz?=
 =?utf-8?B?U0tLMHlYSkt1UFlsR05LeEZOYmRxN0VjOXZhZS9pNXIrQmtGK0hUNE1ORE9E?=
 =?utf-8?B?MU1FMmN6UXJSN1paaHhnL2lTVVp4RXZxUjl4MDVZOWZYWVZBMVVjM0ZNb3ZX?=
 =?utf-8?B?S3FVZDdsZjlEV2R0NHhQWG9tMFhwdVNYZkdRYW9GTFVPYUlQQnlLUzdhbVRx?=
 =?utf-8?B?cVJsdnVpaE5HRW53Q3o3MXMzYkJveEdlU1hTTk9mYWx4cXFPTEZMNWRsOEJF?=
 =?utf-8?B?aVZtMEsvVWVIQlIwdnBFMEwrWUFJY240Q3FyRVRxdjQ2SHNjNVBmT2pnU0pT?=
 =?utf-8?B?bjVWSVNOK09udmk5cTMxS0JjVkNaZUFUaUcrTVZMNHY5Y1B5eVdDUUNBNG9X?=
 =?utf-8?B?alphQmZHZVFKdVZLQWVVWTluaWFFWUgxNlhIelk0THg1YzU2d3duVjRPRW1k?=
 =?utf-8?B?UWh3dmxXNmJqZGk3Vjh0WGY2bEdrQ2pGQUNZTFdFYWZsNkFTa1MycGJJV3BV?=
 =?utf-8?B?UHViUEVCWXFnZU1ZUWY1NkVLN0NQR3M2YTA2K2hacTI0ckdhNjdvcGpncWhk?=
 =?utf-8?B?UXYwZDhYazFvcTN2bEkrWEx2Q1NsVTUxUEtNSzFTUWJkRGk4cXFDcEQvdXAw?=
 =?utf-8?B?dE5hVDF5ZHBkOVBvRkhRK0JHdGxxYXNBdkFIeU40eXREU3QxYURVRS9FbStZ?=
 =?utf-8?B?bFR4ZXNGeTdNQXFrMlZUeGw1emdneHZPK0Z3RXMwcVF4VEVMd3RpSTQ4d1h5?=
 =?utf-8?B?SFJPbFRUSlh0MndQTHVxamtPT1QzaEQwWW5hTjB0M3BGdU9URU95WmJCeDlV?=
 =?utf-8?B?MkorVlhaaDN0RDlxeDJrSTNsQ2ZlMjU5eUF1OTZrQURMSXZWeHRtMHVONEQv?=
 =?utf-8?B?Nk9xK2pWNy9sazhnRjltT3hGZStRZVFWOTkxV0NaQ0Y1d3J6RmxqZzBPVmVl?=
 =?utf-8?B?QjM2M3BkSFRZNFRtakozQkZzUnkva3dTRDhvVUtNZDRQV0grckhINWpsZnRS?=
 =?utf-8?B?d29pc2VHT2dvSVdNLy93OFNzSUxxS1NwcDVBdmZQcWI1eHVlMTVYb3hWZVFZ?=
 =?utf-8?B?Y2gyZThXbnluUzZsclV4THd3dU05ck02MEpDV0pXNVYvQmZqTWpWbkdzVmJZ?=
 =?utf-8?B?UEI2SU9RWkxmSTFXSVdwZENhNkRzRkhreWdTTTY4SU43MlZqeTFNazFvWVM3?=
 =?utf-8?B?RnVLY2toTXU2NkVkaXE4K2doQVZpTVlNNXg0TVAvN3p6UUdFQnhDNjJSQVRM?=
 =?utf-8?B?UEtoMkZyRlNRNXM3RkhlZ3BFaFdselNQaGRrcERNOVZNRFd4RTRZRDV5Zmsz?=
 =?utf-8?B?bmZZY01mdUgyU3Job0RMOXVBQTdUc3pnM0ovd3NQTE5UTzN6c1Rpby9YZHRD?=
 =?utf-8?B?VDVyNTdvMWF3UnF5QlZuK1BBZzl0VVhYcVZ4Y3BCWDNzTnlkY0JySWgwTlNG?=
 =?utf-8?B?eGNnU21QMk5oMHNYRWxHNTVRc1B0Q2I1TnZYVEo5WkdDcVFqK1FHT2FUaWM5?=
 =?utf-8?B?dG9tNWMzZWluekFnZmhCemJRWFJ5UHZqRTlVREN1NlhwaXhGaXZTQ3NTeUVK?=
 =?utf-8?B?bVhmVDc3enJHaXE5TXJMOFhua2kwcnlpdFRxWlNFYTZMYWpRdE9NMVdJT3hX?=
 =?utf-8?B?VzI0OWlBUEtGUXBiWm5ZdFBHblJ3ZkZJRGRHRGw5VEhncWRoTGJzQ1FxbmF0?=
 =?utf-8?B?VFdPRTRPZmZPdUI0U04xakFESlh3Z0gwaDNDRDBqK2g4V0wyZDJrbjViY3lt?=
 =?utf-8?B?QXZSR29HcEtHcE9KdnNidGF0Yk9MZGJmd0dLa1N0b2Q5dE5MaktXSVVpdlNG?=
 =?utf-8?B?SE1IQjdTNEp1bE5xMzFuM0QyRmlJWnNFTUtxREdhcERQUW1HdUlSRTZiR1Rw?=
 =?utf-8?B?dkgwRGNCZ1JkRlFsUnIwbEh5RnFCUkFtb295eDlKQlNlakhhbWZURlFEUVli?=
 =?utf-8?B?b0JDZDdIQ0plWGZhRGIvd3Fla0gzZkVTQzhrVlZBVytEUmllam1EeExaemdw?=
 =?utf-8?B?RVFJVFF4T2cyMTNOaHM0bWJUbGhzNEo0ZnI2cXIxLzNWbGs2SmFpUC9iS0th?=
 =?utf-8?B?UjlIS3hxV0NObFZyZjNNSTBRbGtHZ3B0UXVKOXhXMlkzNnpKUUpXajFHVUxo?=
 =?utf-8?B?blczdVlNcER6Tm14Wm5GUDVJczRnWDBUbVYrbUp3MzVKL0ZOL0RlQUVoY1hT?=
 =?utf-8?B?Z1pneXpWNXhrY2VGYW1rbWVsNVg3dytXTTUvMExlWDlKR0ZrOVo0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b177ba8d-d705-4b46-8bab-08d9ab04cfc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:32:20.2697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTjs/qKjI2b2kIYCidNBc1Eqo6qc3z2xWzmLFBjStviEUNqywBGycKepqh3aLd/uSvUieXyNtFFE2Ai1tVzUFF6pPpmPaQvo5hiOR1Yinyq6NYYbi9/ke9fBxLGwBiNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6929
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSA0OjA1IEFN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDE2LCAyMDIxIGF0IDg6
NDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgaWRlbnRpZnlpbmcgdGhlIFItQ2FyIFM0
LTggKFI4QTc3OUYwKSBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hp
bW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0K
PiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KPiA+IEBAIC0yNTYsNiArMjU2
LDEzIEBAIGNvbmZpZyBBUkNIX1I4QTc3OUEwDQo+ID4gICAgICAgICBoZWxwDQo+ID4gICAgICAg
ICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSLUNhciBWM1UgU29DLg0K
PiA+DQo+ID4gK2NvbmZpZyBBUkNIX1I4QTc3OUYwDQo+ID4gKyAgICAgICBib29sICJBUk02NCBQ
bGF0Zm9ybSBzdXBwb3J0IGZvciBSLUNhciBTNC04Ig0KPiA+ICsgICAgICAgc2VsZWN0IEFSQ0hf
UkNBUl9HRU4zDQo+ID4gKyAgICAgICBzZWxlY3QgU1lTQ19SOEE3NzlGMA0KPiANCj4gIlNZU0Nf
UjhBNzc5RjAiIGlzIG9ubHkgZGVmaW5lZCBpbiBbUEFUQ0ggMTAvMTZdLCBzbyB5b3UgbWF5IHdh
bnQgdG8NCj4gcmVvcmRlciB5b3VyIHNlcmllcy4gT3IgSSB3aWxsIHdoaWxlIGFwcGx5aW5nIGxh
dGVyIDstKQ0KDQpPb3BzLiBUaGFuayB5b3UgZm9yIHBvaW50ZWQgaXQgb3V0LiBJJ2xsIHJlb3Jk
ZXIgbXkgc2VyaWVzIG9uIHYyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo=
