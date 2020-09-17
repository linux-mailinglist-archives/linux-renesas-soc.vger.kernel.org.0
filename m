Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AECB26D57A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 10:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgIQIAL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 04:00:11 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:59530
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726328AbgIQIAK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:00:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COBdek8WM6mku8GOzRY23QEemBSAnoTnbq08Fn1yCe4a3AHBlwsTUEbk5dqvVQ0TkjnH4iQU487wuu9IBjgUyfKP1+iLgQPKSoMtmF1jkhbh2VLXHHErTZYelIxXXGOHgvZFFJ7+q0wlvEf91dhY2bEK6kYVUiAG2dRvUGu6NjiGKeEv7XNqgdko9RfmN2NNEL1LpkkWAW8NPiLETeQxPhqgGIrtU7X6J+3Qig0hN6v1OTsS6V3Hk4mwn4z1gJnmdCI0rq997xsPrp3/9dNGjl+8n/nY2edtF7uCHNurHudZyotic5/DUl7OTIBHCFOPgtV3YZrAz+6QTjyKsn/jnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAk4zKrCGv6TH6eQ8Y21qoSFmZpI1Z8c9MMtjMNK55E=;
 b=X8WJAJ+Do29ib4uSjLWf5da6Su6d+STH1oLpWmz2LVo3gsi1i6GO5wKPz1lCJOWZ2g+bnZL3wtAZylCL3lixLm/fy9wGcuiBt9Gi6qQjja/xeFVezgtdVrniRo96xGhXL+zKUy4VNThUdq8DgKT8KFMqEap/g8/2V29G05Fs8YFIroHYBnyabZfttPM8Ofk7nXop0jzuhXjcxZaN9vaxygvv7Sbf+VWHcFKZJjXfwtqJ8sbM4jWfT7HSluGcueb6Vh9i2pwAyWnmTHnpmzYv9cRwwQKUNDmaeV+lGGOsMOs52zF79QXnMIAbX4RSKPJlvmqpJkXvyLVFzMEM2nxhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAk4zKrCGv6TH6eQ8Y21qoSFmZpI1Z8c9MMtjMNK55E=;
 b=XHXxLaiKt2Qcika+EemAwQj0UNOjwkDu8UHmsvzg3Mf3ehSeZpyY/id0woA64FpovQDoFBZpFPfEsPVkRnDwqnxS6d/RsfOI3dwh10TIDw/24wnTWkin5SS+HTdf+KpJeZl7ntu7MOfCOSJLLavR5wGDyzGLKZS8/HP7jAUwvqc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2957.jpnprd01.prod.outlook.com (2603:1096:404:81::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19; Thu, 17 Sep
 2020 08:00:05 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3391.013; Thu, 17 Sep 2020
 08:00:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Jens Axboe <axboe@kernel.dk>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
Thread-Topic: [PATCH RFC] ata: sata-rcar: Fix .dma_boundary for WRITE DMA EXT
 timeout issue
Thread-Index: AQHWjBsY8CmjBbqlJ0aD8ZySDbq7OKlrJhoAgAFSIVA=
Date:   Thu, 17 Sep 2020 08:00:01 +0000
Message-ID: <TY2PR01MB36924032D54CCB7718F950EFD83E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1600255098-21411-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com>
In-Reply-To: <CAMuHMdXo6nRhR0hUB0iNvdZSsg1BCb9gDH7u+Z5+SNvmEfdtJg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:60c8:88aa:cbfc:e299]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ac9340f9-eae2-431c-60dc-08d85adfb056
x-ms-traffictypediagnostic: TYAPR01MB2957:
x-microsoft-antispam-prvs: <TYAPR01MB29578E144852466053E6D248D83E0@TYAPR01MB2957.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nAb84DnV/k5L7eL4dZ2OKDAMkhdgxjx2ZZHAoO7VVGyeDXF+Ia/Y8bsXmqzIQIEudTVk12JkQ1ADPnpiWFnrxFgdfYrufpnopje6UR0vh/C2aH6QDW5JSqUXdvHgW2XWILniDxmc8Qz1bx8g+n2AVGN+7rCyYAe4+E/3ZucZzWst+q5Lvmar1a6/YCN7zkeUUk8oARxBHPUoBTl8loMVhRUQL6+35DNfl7c+D/6gwBhN1c+wYn1nyrly90oWXgk8XqMFD8FEJrwKc39UR23KsmNGGvOTkZ0wY3fysEDKEdoEOg/BnGBzQjS6u5bDsfT+vVzFZvZESJW61Ys7eFHBJDpwTz1mDj6rmFM4HHmb+fbHFVUbaoTYLReR+g+7frizhM+GNJAsVUujiIeQmBxb5d5XcPfd/RhkG9K+3xu5oOzllN69GfGPOmFkUNoUOv3BtlXLJth6TbHs/MTxvrbwgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(186003)(83380400001)(6506007)(2906002)(52536014)(7696005)(76116006)(66446008)(66476007)(66946007)(316002)(66556008)(5660300002)(478600001)(6666004)(64756008)(6916009)(71200400001)(8936002)(4326008)(53546011)(8676002)(55016002)(86362001)(9686003)(54906003)(33656002)(142923001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: KmiEJpG1OzxMlkK4zEwJIO4rgD+lmnFEyxgMo3/nvStx2W3SKIqNfWQ2HihHZ5rn6BpIhoyG5ligcxtA6eos/OiL1igkNooaE86P26UgjKBqTKVhLVl22VIopvOcciyDqbWS2mkSIdzyGd75HrGkYkRNhj4IA0YWDOX4CHQjc5rG7e+L40I+E7RWYmMV0SbJKLQAoyxZtSn4QdnYMhbczQG8WK+4ymsDQIJe2qeGWGwIHgnOD4wD+kxEdZZS7PW7gI7bjdMYTTm/+eU+/VTQxf8HfX41kX34ZEaz7gi/LdjMjvqIfOt18OHAexR9dZDkfZ1xHm7DARRofI9yABKH0rYc0M7+ii0CaLykbzAn6mTS34ViA2RqjJvroNbtxK6uxCMfnwW1O+Xw3ogeXMOdYvJp9m11RZmBv5tGfh6lPX+acLVYwrgyixX1BN7JWc2lkFb1d4LvF7h2e8nE7h2RUjCvaypf/i/4sKL6fM+9TxblQJ4otCJrgu6gNSNOJwDTDnkYqr1RdhxXfQe3qZ/2M+Y/OusvJcMBSUelyH+MmtdhmbplcASnA/JJqiJqk978CQ6QuQZB4/KyB8DHva3eUqXJQ6Gv/JBlZfpzPbIj057nCBK+ULMlLw6Vq2hjheWP8fnp2ZNiJA0cJvYassWg5ca90j72Z4+KvfgAD/mHLA0PqnAZ13iNBXrk3DfRuy0l1K3rB8u1MfdpX4fuCg77ow==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9340f9-eae2-431c-60dc-08d85adfb056
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 08:00:05.0895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuH+m0Sjl+4nHT+G61NlwhbLBxHKVAd0nGrt/HSR/uT5WQy8dKVe3N6Dmt8IggiCgoVHI9q1EcgmLSt021oG7uZ/QgQg+ds1PxUL7OQA+IQ5zhfgYwq8qiJwKbzn/61y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2957
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjAgODo0OCBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+
IA0KPiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCAxOjI3IFBNIFlvc2hpaGlybyBTaGltb2RhDQo+
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gV2hlbiB3ZSB3
cm90ZSBkYXRhIHRvIGFuIFNBVEEgSERELCB0aGUgZm9sbG93aW5nIHRpbWVvdXQgaXNzdWUNCj4g
PiBoYXBwZW5lZCBhZnRlciB0aGUgY29tbWl0IDQyOTEyMGYzZGYyZCAoImJsb2NrOiBmaXggc3Bs
aXR0aW5nDQo+ID4gc2VnbWVudHMgb24gYm91bmRhcnkgbWFza3MiKSB3YXMgYXBwbGllZDoNCj4g
Pg0KPiA+ICAgICAjIGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vbW50L2RlMS9maWxlMS0xMDI0TSBi
cz0xTSBjb3VudD0xMDI0DQo+ID4gICAgIGF0YTEuMDA6IGV4Y2VwdGlvbiBFbWFzayAweDAgU0Fj
dCAweDAgU0VyciAweDAgYWN0aW9uIDB4NiBmcm96ZW4NCj4gPiAgICAgYXRhMS4wMDogZmFpbGVk
IGNvbW1hbmQ6IFdSSVRFIERNQSBFWFQNCj4gPiAgICAgYXRhMS4wMDogY21kIDM1LzAwOjAwOjAw
OmU2OjBjLzAwOjBhOjAwOjAwOjAwL2UwIHRhZyAwIGRtYSAxMzEwNzIwIG91dA0KPiA+ICAgICBy
ZXMgNDAvMDA6MDE6MDA6MDA6MDAvMDA6MDA6MDA6MDA6MDAvMDAgRW1hc2sgMHg0ICh0aW1lb3V0
KQ0KPiA+ICAgICBhdGExLjAwOiBzdGF0dXM6IHsgRFJEWSB9DQo+ID4NCj4gPiBTaW5jZSB0aGUg
Y29tbWl0IGNoYW5nZWQgZ2V0X21heF9zZWdtZW50X3NpemUoKSdzIGJlaGF2aW9yLA0KPiA+IHVu
ZXhwZWN0ZWQgYmVoYXZpb3IgaGFwcGVucyBpZiAuZG1hX2JvdW5kYXJ5IG9mIHRoaXMgc2F0YS1y
Y2FyIGRyaXZlcg0KPiA+IGlzIDB4MWZmZmZmZmUgaW4gc29tZXdoZXJlIChteSBndWVzcykuDQo+
ID4NCj4gPiBCeSB0aGUgd2F5LCB0aGUgY29tbWl0IDhiZmJlZWQ1ODY2NSAoInNhdGFfcmNhcjog
Y29ycmVjdA0KPiA+ICdzYXRhX3JjYXJfc2h0JyIpIGNoYW5nZWQgdGhlIC5kbWFfYm91bmRhcnkg
YXMgMHgxZmZmZmZmZSwgYnV0IHRoaXMNCj4gPiBudW1iZXIgaXMgcmVsYXRlZCB0byBBVEFQSV9E
TUFfVFJBTlNfQ05UIHJlZ2lzdGVyLiBTbywgd2Ugc2hvdWxkIHNldA0KPiA+IHRoZSAuZG1hX2Jv
dW5kYXJ5IGFzIEFUQV9ETUFfQk9VTkRBUlkgKDB4ZmZmZiksIGFuZCBzZXQNCj4gPiAubWF4X3Nl
Z21lbnRfc2l6ZSB0byBtaW4oMHgxZmZmZmZmZSwgZG1hX21heF9tYXBwaW5nX3NpemUoKSkuDQo+
ID4NCj4gPiBBZnRlciBhcHBsaWVkIHRoaXMsIHRoZSB0aW1lb3V0IGlzc3VlIGRpc2FwcGVhcmVk
Lg0KPiA+DQo+ID4gRml4ZXM6IDhiZmJlZWQ1ODY2NSAoInNhdGFfcmNhcjogY29ycmVjdCAnc2F0
YV9yY2FyX3NodCciKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+ID4gLS0tDQo+ID4gIEFzIEkgd3JvdGUgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiwg
SSBjb3VsZG4ndCBmaW5kIHdoeSB0aGUgaXNzdWUNCj4gPiB3YXMgcmVsYXRlZCB0byB0aGUgLmRt
YV9ib3VuZGFyeS4gU28sIEkgbWFya2VkIFJGQyBvbiB0aGlzIHBhdGNoLg0KPiA+IEkgd291bGQg
YXBwcmVjaWF0ZSBpdCBpZiB5b3Ugd291bGQgZ2l2ZSBtZSBzb21lIGFkdmljZS4NCj4gDQo+IFRo
ZXJlJ3MgYWxzbyAiW1BBVENIIHYyXSBhdGE6IHNhdGFfcmNhcjogRml4IERNQSBib3VuZGFyeSBt
YXNrIg0KPiAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaWRlLzIwMjAwODExMDgxNzEy
LjQ5ODEtMS1nZWVydCtyZW5lc2FzQGdsaWRlci5iZS8pDQo+IA0KPiBJcyB0aGlzIHJlbGF0ZWQ/
DQo+IERvZXMgbXkgcGF0Y2ggZml4IHlvdXIgaXNzdWUsIHRvbz8NCg0KVGhhbmsgeW91IGZvciB0
aGUgaW5mb3JtYXRpb24hDQpZb3VyIHBhdGNoIGZpeGVkIG15IGlzc3VlIHRvby4gU28sIEkgdGhp
bmsgbXkgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGly
byBTaGltb2RhDQoNCg==
