Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30FC46957B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242945AbhLFMSb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:18:31 -0500
Received: from mail-os0jpn01on2105.outbound.protection.outlook.com ([40.107.113.105]:34884
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242106AbhLFMSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:18:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dlpt8CL7TgBpJMMThhBIH+KQFKHFsJsNK6Ps234C48wA2EiU/w+5bG9WAmATZU8cQ2JGI0LNU2fs3YPT/jza+htWSI5TT/d9Uj/VyM2j1Gdw6V/cqjg+xWbLuSMvvJoGxvs922mgcxHRD5Nm4TEhhU5mtJurYjmQ1SJozhclxcWqva+McStmoyYiNii+J0L+wzPhvySchrLD9bfxv/t2ka51xa0iJYSC09KoNNW0q23kowPtfNN5LcblByATW/uK/4+6jTnMjMvbqUvzQ4Y30d1VqEjHybInN9Uo0Vti9j30G0ep8C2Xm2K6z74zHYaAcqe+UDrjsrGA01D5IF1V8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmmNmUsmfPH4mpuni7ewcb+VSHzltCRpZA3ZbSIEb4M=;
 b=BQEJSnUj0rxB80+bB8ZPIUpo8qx7ll4zfsDGSvDeRAsD6dD44KXLp5idW7skwVrEUaotda7Gjm92ymhRXHYhqWxzkc5Nqdt0dkHkDBpJCgVyADQZpPBGOBv0fUwDul8CO3S5WfmRbclNZmNiZbO5eUGmAOgnBpA+M1HG9H34HA3Oolv4qOPztBKYDXPZxKiJ0/2XvHp9d8SyteDt7r9xbwzTzcPmU396x4FohLb/r5GH8lxty8Mdu7Zj0Kh1GoMgQTyzL2qq/DtO66tASTlTW2oUAFh+7FoepfvBFQHh408besPlI7vB8Gk+SHJRChx17PUil2pzPTV3QFjTBWGcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmmNmUsmfPH4mpuni7ewcb+VSHzltCRpZA3ZbSIEb4M=;
 b=crrr/uUDQrXR7GjCW0/DluuGorH9CHjWOCwLMAS6LatjBd8Zs58K72W7GZGXTWCiRwVGmAVj7y3u8z7yvJgqX0eynohW2lPyFHZ4qMQBhqOmx7ykszrTS4BTT9U1lwjEU0d/3WZMre9cOvimGgvZvpSoLjBp+dAmnxuzXzKKZkA=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB7005.jpnprd01.prod.outlook.com (2603:1096:400:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 12:15:00 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 12:14:59 +0000
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
Subject: RE: [PATCH v2 04/14] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
Thread-Topic: [PATCH v2 04/14] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
Thread-Index: AQHX5oW2Mj0jbIAYNkqvxUxqrJQve6wg91IAgARxEeA=
Date:   Mon, 6 Dec 2021 12:14:59 +0000
Message-ID: <TY2PR01MB36928B73E52DAF27AF90CF1FD86D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
 <20211201073308.1003945-5-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVHD05pLkdyBKfz-OCLqtPU+GKk6U68fscT8OMnXRzRPQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVHD05pLkdyBKfz-OCLqtPU+GKk6U68fscT8OMnXRzRPQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab3883ca-c3e5-4f98-8109-08d9b8b20657
x-ms-traffictypediagnostic: TYYPR01MB7005:EE_
x-microsoft-antispam-prvs: <TYYPR01MB7005B309BD025F29ECC9693CD86D9@TYYPR01MB7005.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WW6bkCNobLXKnPI89OIABz76IhyUX6iwzqgr+pTGd9YBTiZ7iqUb92uyHXQlryUOUKW2GoaUt2rmT31ZS+wa2Nem+dM7qQPe7rqy46gNdGuMAqtwlnCQIOzqll5gG3jE8753cK/+dK66SejLWmVhEbjSldtqZsmT/6pybhwLJiu1M5UyeRNqvcFdeZpqlzf+1ka505FyvIOBrhlUhEH9z6Vs6OAGAdCbYJ3vHVTjn1iwkUIAYYFf5Rpzd4hqChslLUjTXZ+dW19vtDaAaesod1fHBdBObjS5uKJNMt16+u+/eFAB20Pn05eRHn1axgJhfbttdTVvRsLWDYUu1reNpUdEoMuplOkVJpqCFJDBSDFgpcliHfILBaU/0kG4foWxFbQHMNIOdCuANWUO5KeZsUwlwwLnyKHOOYOde3BoZP43Jh4XNz2anrQuiGUlLzQhZav9+57KyNI4TS2rSJP+JoRWC2HbwAtFNrWAN+NCM68+mNyCC4mjHMgEsvqLUu4eKh9r4OWl+w/WaE3gSKWc4u+3zaxQ5E8jn57b53gkXiP/MPoeqhOGA+tsu1HdWt5urTdvPZYFGD+9NSlvcAG6+AWFdjVGQkpQF+n28iiAMBfrZcgwmE3USNBeWKXCpLorC5flW1YMKR1iNNA7pkNPgBiIZHZPe/8hHppbc3lRK3dqxDHs+TuZ/ns5rkT2AesrgbuxS4AixEeFWm/v1zF2hA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(86362001)(8676002)(38070700005)(66476007)(2906002)(316002)(52536014)(66556008)(6916009)(64756008)(66446008)(9686003)(55016003)(186003)(71200400001)(122000001)(508600001)(8936002)(7696005)(4744005)(33656002)(26005)(53546011)(6506007)(5660300002)(76116006)(38100700002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmVyT1NKd2xuU3lZWjQ3WUoyN0w0eFRUYTh2TU9PekxPcHVuMkVVYWdZSi9C?=
 =?utf-8?B?cTdESEV4V0lGRzF3Snl3c1ltZGh2UExzSG1TVTJuS0RzellWTm1TVUZvck8y?=
 =?utf-8?B?UFFWWUZ2RVV4MzhZcHJWcFJkSjhDS0pmeTZwRllpQlJLV0N2N2FhRTJHeXBY?=
 =?utf-8?B?ZlBMNEJEZnRVK1E1elNobHBMUExyTW01RVpOYW9BMTlDZnNNdnJGankxMUo3?=
 =?utf-8?B?cEJnN2h1VEZhYTEwTE5XRUhvV1lWaElWUEZkU2ZMeVRTRUpLN2hmVFNUYVlz?=
 =?utf-8?B?Ky9TaFN6SGxoZzd4aXQ5cHljK1hVQ3I5Q0V5VENISVZ5Q2NHY083Y2xvakU5?=
 =?utf-8?B?cmozOW4zNXdxQW5xNVhvdGh4VkxvSDlSMjJBbmQ1UlFYdFh2enA3RFF5aEd4?=
 =?utf-8?B?MmppZUUvRm05QXdhYkFESHhJL0kvMzVnWWtOejlLT2FSYW5xV1NMQUFTYk9U?=
 =?utf-8?B?dUF5UEtoV0VPbThQRlgwSFRlUEZMdWxxMUhmUmd3NkIvUXUrK3ZtNkcxNHQ4?=
 =?utf-8?B?bWI5RkFlVzQwT1g4TVFGUDdCbml6dERqUWlFV3lielNVUmwyNXlqMmNhODZ2?=
 =?utf-8?B?RGZGOWNiaS80dnR1WW9VZWkzYTZvMm5iRTUvNTZXTFQ4RFVYOU9Ud0NZSWQ3?=
 =?utf-8?B?YTJkUXhGODk4ODhZelVGTlRrdE1CakhFeGlRUCtSVXFYY1pGWkJBbzlOYlR0?=
 =?utf-8?B?dTF5YzZtWkNpV3VrQ2h6UTlLUTJJT3BDelRTSG01ZmIxV0NMYmx1NUMrdFJz?=
 =?utf-8?B?WWJ4K0JsU2VtOEU4dWZPQUduMnJ3MXRNNndsSVdMNjlXTzRCSGZ6YURrR295?=
 =?utf-8?B?d1Q3N3NnWUt1dmdKSmllU3ZNa2x3RWFKN3lXYnFRU2xQclZsODdYcDNDMTdy?=
 =?utf-8?B?ZS9KK3l5R1hWNXNTYmQ3QzQvc2VlSTBGYmltSnNjNWNlZHJoaFIxc05Ndm1L?=
 =?utf-8?B?UzkvejVGVHNKVmgrVlV5RFA1QVgzZHdjNTcvTzdKOGFvVk1yajA0OWZQNWVR?=
 =?utf-8?B?cmFxenArVWFQVGJkWnd5YURZaFFCWFB0VzZpZ0g4bjZUeTI3U2N2ZlFrZ1BO?=
 =?utf-8?B?QWRLNG1mbVpPU21NcFgzTnFISFRyRDZNT29CbmNmMUNzbmZEeGpFUit2cE95?=
 =?utf-8?B?UDBpOHVmd0p4S3lHaVVYMGI3K1dkMEJ2QVVRUnJtQ3lLVWs3YlNLOEtPSDE5?=
 =?utf-8?B?d3NYOU9PakZhNEFwdnRmUVV4eEZTdkh2Tjd0amhnaXZaakI0NWNlWVB2UlI1?=
 =?utf-8?B?eGZRV3dkc1M2Zjd4dE1lVklYVzRKSUV0RVRxamltS1FvdUptZ2RFc1JjV3hy?=
 =?utf-8?B?eTEzdG1hU3c5aWlJUzBKTGdUUmhxSU5IbWlQVWhTb1grNGdhUjZwTHgvSHRn?=
 =?utf-8?B?VHljZkNDaTNjYmVFQnhpRmNZa1ZOQzRYMlZUTGQrZnZlUGxOUmR6VmdCYlRE?=
 =?utf-8?B?aDRQbnRsZHlYT3VxNHIxSUJaVlBGenFmS0JEOVhLTzVxc2dYVjgxQ2owRUlt?=
 =?utf-8?B?cHNHR1FQNFJLU29LbC9oUG50SVRLVkJLZmNFVDZROGordTBPcnYySkl4bENh?=
 =?utf-8?B?YjdoUjFqOFR2bDZHYy9yanJGcnZCbkJsOCtQRVkwZVl0OFZ0TEc2Y3NYVGZp?=
 =?utf-8?B?bEN2c25IZi9tMFlWbFdkelNpc0o4WTRuUm8vK1p5ZVBpVE5xSGRzNzhSSFk4?=
 =?utf-8?B?c0lqWkZKNUlXbU9PT3YvZWExcEI4S2xVUzE0WHpNV01MSzZYTEZ5RDBnaWZy?=
 =?utf-8?B?ZTNTM2JGeUZNOVVVdGJ3NzVVMUh1Y0RQbEZWVVV6NEZJaXZBNHhqWUcwRjRO?=
 =?utf-8?B?bm96YkY0c0p4cDVsN3VOV1l6Skc5TkdlVjl5ZHdLK3NvSklwKzk0U3BhS3Nm?=
 =?utf-8?B?T1JXMThhSTBXczFnT1VtcGFWUVRKWTl5SVFTS3huQ2dCN081Z1JYb0ZWQ0lY?=
 =?utf-8?B?NC9EK2ZrbXVXREx4VTViNVBLU3J1THdqTi9aTXA4bG42Q3ZTcDF4KytFaEZM?=
 =?utf-8?B?cVVaSzBIaTZpMVdQcVA5TGdhRlJoOEh6OC9MZTErQitWbGZMU3o0TVl2RVZK?=
 =?utf-8?B?SjJIQTg2WG1wQ3BVa3BGcEcrdHlmUUxkMFN4MGJ1MGRDZStwL1pKK09DWGJQ?=
 =?utf-8?B?L2FNUDJQL3FkcTZRSGMydnhSZGhZT1lyRW90ZzcrNjhrbWc2SThmbDVxNmpj?=
 =?utf-8?B?ZzkzTTd0cnF5WXQrdEV4c2ZPRUkvcXRxTVE0dmxreXc3eWJNYnl1SnJ6bjFh?=
 =?utf-8?B?NEV4R01QaEJYMitYbEd4Q0JEZXhsSERFWERlbTdHQkZVN0F4djlET1NtVldY?=
 =?utf-8?B?dzNwZ1BlRURGUG1KTURWZStWazZENnZuYVJoUzJxbnJ3UEtkZGVYUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3883ca-c3e5-4f98-8109-08d9b8b20657
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 12:14:59.8723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nInkAE/2eqnERiY3OzqP7W+O15/1tcCLwtnt+DBNhIfrBy28hjUGYJq7xfA/yjPSuJat3bM0nb+rtrHl43D96SYlWaKLglCyC1nlrUPoWnAmMjZBgTP186SEJuVwBs9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7005
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogU2F0dXJk
YXksIERlY2VtYmVyIDQsIDIwMjEgMToyNCBBTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBXZWQsIERlYyAxLCAyMDIxIGF0IDg6MzMgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBSLUNhciBTNC04IChS
OEE3NzlGMCkgU29DIGhhcyB0aGUgUi1DYXIgR2VuNCBjb21wYXRpYmxlIFNDSUYgcG9ydHMsDQo+
ID4gc28gZG9jdW1lbnQgdGhlIFNvQyBzcGVjaWZpYyBiaW5kaW5ncy4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IE5vdGUgdGhh
dCB0aGlzIG5vIGxvbmdlciBhcHBsaWVzIGNsZWFubHkgdG8gdHR5L3R0eS1uZXh0LCBkdWUgdG8N
Cj4gY29tbWl0IDA4MzYxNTBjMjZjNDAyOGIgKCJkdC1iaW5kaW5nczogc2VyaWFsOiByZW5lc2Fz
LHNjaWY6IE1ha2UNCj4gcmVzZXRzIGFzIGEgcmVxdWlyZWQgcHJvcGVydHkiKS4NCg0KVGhhbmsg
eW91IGZvciB0aGUgaW5mb3JtYXRpb24hIEknbGwgcmViYXNlIHRoaXMgcGF0Y2ggb24gdGhlIHR0
eS90dHktbmV4dA0KdG9tb3Jyb3cuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2Rh
DQoNCg==
