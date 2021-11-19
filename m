Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF2645682D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 03:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhKSCiW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 21:38:22 -0500
Received: from mail-os0jpn01on2107.outbound.protection.outlook.com ([40.107.113.107]:18201
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229805AbhKSCiV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 21:38:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bikWn8vpWXeyYrpGaq2utEDEgv6HAlVJHgVoqePI1kCj3Y81U+CejGrM7sGRABPH+cQ5Pjio9uN+7loZinfskBxo63izYRRlNvnfrTlKE7ok85WV/uLPI1W39MVjkAHS3cXSobmHlUZTr/XhfMP5mrBFQ8m4f/YDHv1s8rK8O66J6NFVDdu8y7svxvFqGYYlyieBoEZMJx6OmWc7PCj+1SpQU979M+vvcfW7W0PtMgaZXwrswR/b1f260aKPAW6M4RBaSbAHboDAWg7a/9L0okhdmuEdsUv6H87LhAeQmFrOlqSAPxwfGEOu/aBPrug/Y+2dEqrEA2AXZqOul+59+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQCzyFTr7pOLkd6hGknlEIVNCjd46ttW8ayY1JLh070=;
 b=Jwt+j7ywaNmPYAr2QsKqaKYYHTtD+/HA9cu5WTSnDwhNNiUM+SfDsPFu7Xfjx9HLfBoFR0ONGS/IKybZhrEQYBq65/atxX8dPzXoVbRDoM4N+iPFCQxt0rN1ZzGkG8fcntYz8/y7Xj1rXWSrNKKU4s7LtsMTZS9VGjTVOw7FYcX7kEZGZUtgEV8mZTxvCEXOURy3qjvQq6WbyqTvxXcpTJSZCxdYUcdPOAJrq1AZAP8Y7Lx72G1FMNPjcDprsySFp7Faf7hSj5AorGZ7Ma8yLnDd8vz6XuGS3jYr02vyhZzPdDx3k0eMXba1rthhYuBVoAuZZyIFWxxz6+q2mvZZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQCzyFTr7pOLkd6hGknlEIVNCjd46ttW8ayY1JLh070=;
 b=Ls0AWbUxTGTTqmdETlg1V2pHHpygf1b0+nFiAUCaARN1SIA7acfNgXeIcfYXh5kQTsojlSEiSkiM+TkGQ7+Jux30BpqxfZmf6LoPOFfFA6mJrEcNsquSOLtGO1idwQsSlFlINEPAQ3K7BcWmQvSkg0HIlEizrs0bJ0Cfqqu6/0o=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4672.jpnprd01.prod.outlook.com (2603:1096:404:12c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 02:35:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 02:35:16 +0000
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
Subject: RE: [PATCH 11/16] soc: renesas: rcar-rst: Add support for R-Car S4-8
Thread-Topic: [PATCH 11/16] soc: renesas: rcar-rst: Add support for R-Car S4-8
Thread-Index: AQHX2r2IG8tzK0Wd0U+oAMzssSpuTKwJqoYAgAB7dtA=
Date:   Fri, 19 Nov 2021 02:35:16 +0000
Message-ID: <TY2PR01MB3692602A0027C4C5D06B9A0ED89C9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-12-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXydcjKwum+afn-Lx4T7TGz5EDcddRBQrzcNngB=REY+w@mail.gmail.com>
In-Reply-To: <CAMuHMdXydcjKwum+afn-Lx4T7TGz5EDcddRBQrzcNngB=REY+w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05864708-feb5-4d0f-0f47-08d9ab0538be
x-ms-traffictypediagnostic: TYAPR01MB4672:
x-microsoft-antispam-prvs: <TYAPR01MB4672024ACC63FD46243A2ED7D89C9@TYAPR01MB4672.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMVSUB3vLLAbUFl5vAi1ThWQ1d/I+lV+QPdUNXWiespPKCnqzWASXA/7MNIwK8Z++HppiuhHEFltjr7cE9WTCyKmCu0ryWtbXsx7kxhpRviNeqfi/KvwXySHoMXe5yB8qHczzL/C63lrUZdZZE+lnVB/aYLve01IJEz4DhfsoSVss4LfORH/Wr17iMjrUt/yaX975emhNTU2PKA7u+nQwzKkn2RnFIoOK6QviPz5zFj4EZTvLT6AFZ0pIxw+wZyo2JDMtn2CK/FyGb6ddIjSiCq07UYtoTHYYrX6xNkhtdN0HsrlADt3pdXdzmyLCVtCpT+ntp6JLMIa7/qF48RchWDuEfbHnhiZUqKOr/0rH/l/tsnHaux0BTk60GD545//gntW1fIo8xosFRR0WWCIOoVL916wTIcMHYgtL1aaisKEa7ToqhS5nQU0MQ8TOrGbrBHmlFXqeLVFiMIN254EULZ63EA/KW1Hhe7oQXQbmakyaq2+yj2wkiMRdFVin3Fzs21LD1g/vc2sMkCRwwNKPZ8ukqHSZqbFkDCmacIrocUoQiyhkSxr9NpX77FWi3ypdZF1t1in585ade9zGCQNROMYQcJI5SI9AxxzVzwquiugrg8PYC+0hBTWEWAKkQAgh00pDkE8fZZUWSKYj24f26YYFJOuU80fbYjlz/F6va4ihiKLsVKvFWAKOv6EVYIjiLP5GPl7ltP4eM3SodRarg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(64756008)(6506007)(53546011)(2906002)(9686003)(66476007)(6916009)(66446008)(38070700005)(8936002)(52536014)(7696005)(186003)(316002)(38100700002)(26005)(54906003)(8676002)(122000001)(66946007)(71200400001)(86362001)(4326008)(76116006)(5660300002)(55016002)(33656002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkRvWmZmY3JvK1J6a2IyNmxQVVEvZStRVU1mUTRYVm0zWlhOWk81N2JIYWlh?=
 =?utf-8?B?U1RwbE9ySFhhQlE0THFLVGNFZ044Y1BqVUhjK2liVThlTjltVnpMTDdsY0Jo?=
 =?utf-8?B?VWlvdnBGYThYQ3IwNVpNbGV2UVJjbnQrbHNpVHY5VnpFNjQ0MjhUUDJyWnBY?=
 =?utf-8?B?T05YRzRpbDlxQkJwZlM0VUJIZkVVMzMwNWU0cUlKbzVPSldxaFc1cFRLd0hY?=
 =?utf-8?B?TXRjVjVYc25xWTRPUWlwU3luKzdFSGVRdHc1VndJK0loL05NRXNYRkNJNXZL?=
 =?utf-8?B?cUlXOHRQbWVUb0w4eXM1T2hKd3kvcUNNQTJYT0tWT25MbDJlVW4yekloaU9p?=
 =?utf-8?B?TytRRTM2MFhjZ2U4ckljTXY0SG1LMzEyUkgrUHZsYkNEd0tZU2x0NkdMcitN?=
 =?utf-8?B?djNjWUJyTDdSQUZsRVJaa0lVdXoxMElGdzB1NVJJQWZjcFpnQTVvNDFaU21W?=
 =?utf-8?B?TnhpQmllMHZzaXlKUkoyUTNZNzlWVndON3l5azJ5NHkrYUNSak9RV2NCbWw0?=
 =?utf-8?B?MXZvWmttcEdXVDViTFdQK3I4c0JjSUxQWUw2TTVWbkI4MzZJL1V3MW9Oa1lZ?=
 =?utf-8?B?UFdLVTlGWWxFRS9PemhSL3psZTZqVEZWUkxvWmpaWWU0VUdja0tLM3g4a1Iv?=
 =?utf-8?B?ZTJzRk1GRXJtNHIyVXNEQmc2YU9XTnQ0N25mOFJyOHM3NDJTQm8rU09LZjBx?=
 =?utf-8?B?TnF6UjdIWjhhdm1nNGc3YkFVYVhtaHFCdUZKQWttbUtnR3cxU0VhbXVlRnhY?=
 =?utf-8?B?bVZ0VmxlQzg4VDBvZlp0WFllOXgreTlLS0Z6bVc4a1M5M2F2ZmRBbmlQdTdY?=
 =?utf-8?B?b2tWbzlCK0NFNGM5MFB1bUwyamdpYUNNUThJeHVHS1pPY005TnJzTFh2RFBV?=
 =?utf-8?B?a2s5NUFkUGdaY3hSOG9vdTFQWXB4b0x0Z3p1TXNYci9nZ2RVdlFHNUJMVjl0?=
 =?utf-8?B?Qm5sMms4dEV0THh1NURtREp3ait6aGFFYVU1Vkw2cW9zbU1SbzcxNDBkbFZP?=
 =?utf-8?B?Q3o3YTlUZklkZDJKN2pIdy9MWks4WVJ5K1RFUVlHc29sazJaSzhrQm5DQmZM?=
 =?utf-8?B?UldoR0FvWHlXdjh2Qm42QXZRVVFpcTQ4a1pJZmtkR0pkTFF4cllFRFpTMENJ?=
 =?utf-8?B?VHpLeHVyRXJQNmFHdE00a0lLVWYyTCs0dGJmY2VBUXJvWHg1SmxhK2o0cEpi?=
 =?utf-8?B?eHU4anVTL09SS2l6QXhZY3pyRkVxbEl0WDcwRnBWWCtQVTNjUk5hV0FRenU5?=
 =?utf-8?B?OVpPb0w5bm5OSG9VVkJHN3hua3NmYy9iOTFSNVozeDZrY1JGNmEvS0czN1lB?=
 =?utf-8?B?dEFXSCtQTGlaVG02TUd1NlBBYWVYTTc5eEdMS0hCSHJqblhoYlNKUEtvZEdW?=
 =?utf-8?B?andwSVNucTlPZHNDQmwxVE5HOW95N3NGc1E4ZktzTGc0Q2JPS3IwVEtRUEVs?=
 =?utf-8?B?K2hidU5uVkNaQXZFUjlvOXN0Vzl3R3ViZW95VUZtek1QRldYbCs0T09OTzhG?=
 =?utf-8?B?VkVIblFEbmVuSll3dXhzY1JRQkQwN05LNW5YM1pMTUQ0TTN4c3pBRG1FbG9O?=
 =?utf-8?B?eG9XTVFsamlxZDUzTEdRZVJuL0FUc0Q1bzZhVjh5OERVanF4SmViTU5qNWRK?=
 =?utf-8?B?dFp1OE93eW8zWnI2SzVrV2Y5SUJObXh2MVh5RWYvYm9ueUMzUyt2V2FuOTZE?=
 =?utf-8?B?TVBHNTJtakd2KzQwK2g2alFQTU5MUS9MemNxdjVCNFFKTXJvcVF2VVFDTGlY?=
 =?utf-8?B?anl2bHptRE9ETitpYTU2S0licnFRbk9zVXlTdTZ1NHB1SEgzZFVUTjRpN3dz?=
 =?utf-8?B?YW1zNHdkRWNGUXdqSk4vckNPeStjZjBjYXBPbjBSdUxoa1lPZm5WVWEyb0NH?=
 =?utf-8?B?WE13ZCtaZTdxME9mb08yUzc0aS9nTGpNb3U5OXRRazFUY2pOcW5BcmdMdWM3?=
 =?utf-8?B?K1l5U2hzMDFldUxrdWFHV25EbThjRFJVZ2RSSnNEK0lwdTVYZlJGcW85ZHF4?=
 =?utf-8?B?cGg4V1RNMktybFhlM0pvTEVpWCt0ZDdpUjB3Q1Bkam50bGFWTi9HRlJtZm14?=
 =?utf-8?B?ZTBYQ3JodXNNcU1BbkZFV0MxdUFpMHJQTWNGL3d3eWtZNXQ4S2NndzU2SW04?=
 =?utf-8?B?UHRQK0pBV2hRMk9JbkpIaE15STNzTjFYamtnWW4wakRPYVVudkl0OVk3ckQ3?=
 =?utf-8?B?ZnlabTRZcU5QU0tUMjR3eDBtZ3Ywa2ZnTHJxUTZ0eDFTQXFpb0pGNzdpdDJ2?=
 =?utf-8?B?bmtscU9raUhMM0tOcDFVOUxuNUNzRjV1UVJadXJ5WS9udlZQOU1RWXZXemNk?=
 =?utf-8?B?aXQ3bnBuYzFHVW16MXpseTZqc2U1NlYzSlRkaFBkcjMwTWtjOVQ5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05864708-feb5-4d0f-0f47-08d9ab0538be
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 02:35:16.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEiSKZcejlu8xzqh3jXEQIbIo0tNGtg5JdD5jNfyfZtixfPJI0HtUfuq/dQxw3NUQX5D2P5r/FkM1wfSqf+AQs7zVeGzYKvRGpUQ0+aKNZkVSdrXoOSLQSusz/4T5Wuf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4672
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSA0OjExIEFN
DQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIFR1ZSwgTm92IDE2LCAyMDIxIGF0IDg6
NDIgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgUi1DYXIgUzQtOCAoUjhBNzc5RjApIHRv
IHRoZSBSLUNhciBSU1QgZHJpdmVyLg0KPiA+IFRoZSByZWdpc3RlciBtYXAgb2YgUi1DYXIgUzQt
OCBpcyB0aGUgc2FtZSBhcyBSLUNhciBWM1Ugc28gdGhhdA0KPiA+IHJlbmFtZXMgIlYzVSIgYW5k
ICJyOGE3NzlhMCIgd2l0aCAiR2VuNCIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcmNh
ci1yc3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcmNhci1yc3QuYw0KPiA+IEBA
IC0xMiw3ICsxMiw3IEBADQo+ID4NCj4gPiAgI2RlZmluZSBXRFRSU1RDUl9SRVNFVCAgICAgICAg
IDB4QTU1QTAwMDINCj4gPiAgI2RlZmluZSBXRFRSU1RDUiAgICAgICAgICAgICAgIDB4MDA1NA0K
PiA+IC0jZGVmaW5lIFYzVV9XRFRSU1RDUiAgICAgICAgICAgMHgwMDEwDQo+ID4gKyNkZWZpbmUg
R0VONF9XRFRSU1RDUiAgICAgICAgICAweDAwMTANCj4gDQo+IFYzVV9XRFRSU1RDUiBoYW5kbGlu
ZyBpcyBub3QgcHJlc2VudCB1cHN0cmVhbSwgYXMgaXQgc2hvdWxkIGJlDQo+IGhhbmRsZWQgYnkg
dGhlIGJvb3QgbG9hZGVyIChBVEY/KSwgbGlrZSBvbiBvdGhlciBSLUNhciBHZW4zIFNvQ3MuDQo+
IExpa2V3aXNlLCBHRU40X1dEVFJTVENSIHNob3VsZCBub3QgYmVjb21lIHByZXNlbnQgdXBzdHJl
YW0uDQoNCkknbSBzb3JyeS4gSSBtYWRlIHRoaXMgcGF0Y2ggb24gcmVuZXNhcy1kcml2ZXIgYW5k
IEkgZGlkbid0IHJlYWxpemVkDQp0aGlzIFYzVV9XRFRSU1RDUiBoYW5kbGluZyBpcyBub3QgcHJl
c2VudCB1cHN0cmVhbS4NCg0KPiBTbyBwbGVhc2Ugc3BsaXQgdGhpcyBpbiB0d28gcGF0Y2hlczoN
Cj4gICAxLiBBIHBhdGNoIGFnYWluc3QgdXBzdHJlYW0sIGp1c3QgYWRkaW5nIGJhc2ljIFItQ2Fy
IFM0LTggc3VwcG9ydCwNCj4gICAyLiBBbiBvcHRpb25hbCBzZWNvbmQgcGF0Y2ggdG8gZW5hYmxl
IEdFTjRfV0RUUlNUQ1IgaW4NCj4gICAgICByZW5lc2FzLWRyaXZlcnMsIHRvIHNlcnZlIGFzIGFu
IGludGVyaW0gc29sdXRpb24gdW50aWwgdGhlDQo+ICAgICAgYm9vdGxvYWRlciBpcyBmaXhlZC4N
Cg0KSSBnb3QgaXQuIEknbGwgbWFrZSB0aGUgMS4gcGF0Y2ggaW4gdjIgYXQgdGhpcyB0aW1lLg0K
DQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
