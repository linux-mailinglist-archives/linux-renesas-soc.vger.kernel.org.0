Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0582C758A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Nov 2020 23:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388002AbgK1VtR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Nov 2020 16:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731014AbgK1SAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Nov 2020 13:00:43 -0500
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (mail-os2jpn01on0710.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe9c::710])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7F9C0A3BE4;
        Sat, 28 Nov 2020 09:50:10 -0800 (PST)
Received: from OSBPR01MB5222.jpnprd01.prod.outlook.com (2603:1096:604:74::20)
 by OSBPR01MB4022.jpnprd01.prod.outlook.com (2603:1096:604:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Sat, 28 Nov
 2020 17:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYR28huwrJbGxxfetW8YFv32A89j3z8eak5PJHrYYXjH1CBIKnCb1/bKb6Xe9k/kK8DcuI3dB2PBjgyq+lK+qmWEB9/K0S+NMGLLBo+HUW/eOAzZXv4s938UwS4CToL48PfXP6hsWLBAxFaRcyDTJX2llsc/qeTpRVsZzCp18lWKSPeVDPINFXS40vR3+JwiOtwWaJMK2HtXI9XmEYImUuWEPCI5GVhBNAs1AOXDCDGk7s5BfuxfXSvjW40XqHyY6rKO+STEqDR0WQSLVcitseCafRNLTegD5cdjlDOc3A/FmRbMXUEIKTuLAPmrlsWZE91n81/WLmUwFuoykwy/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T//C8xxD2tPoM7CzyQz427R7dIkyp9HmRlQd8aaOdzY=;
 b=Pqs88Xey6vbdJ97E09vvWYhZFEvx41a//wrByihwBXEsbL/+tmuv6mHDZ4eWmC95fpnZcU7Dq2KEsPcNEPeFZAUIddKwmnFna4culYEgM5HOQxXzYxyTx1pWP5UIsY/jc90Q65TeNldlRhLgRkNttekUM6XaFPH7qaER6DpdDIeM8DnwxFG8A36Vo8eAevCTmvg9pL2VVqJgtyUgyZMr8bdMtCMqPPe/4eEKav/kQoqsAa4b0VEYuroeZrTSelzqiRH7dC+Y+WEP1IFFtGRkDpEreXuzQG6G+fnwerKRcpXR+5ZvcOrnn3SlVJsaB/bytExn7NcL+pSajayWrFL6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T//C8xxD2tPoM7CzyQz427R7dIkyp9HmRlQd8aaOdzY=;
 b=KNqAS870ZExe+a6YmgFuZm2i5HLlvE3EwCURP5WozsKZVyEX5iMXOhIb19DjHBRK+2ThDa+D+YCPEW+mT2TwSkcj0nM7iAxWlsO/dQ2xyymvJ7qTce1owddaccl6qhw1BjgNMj8XSBmRGroH1wSgg2RN+8k2D0VbnTr1t/5X5yk=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB5222.jpnprd01.prod.outlook.com (2603:1096:604:74::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Sat, 28 Nov
 2020 12:46:43 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3611.025; Sat, 28 Nov 2020
 12:46:42 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH v2 5/5] memory: renesas-rpc-if: Export symbols as GPL
Thread-Topic: [PATCH v2 5/5] memory: renesas-rpc-if: Export symbols as GPL
Thread-Index: AQHWxCgJ3hG0Usa46kugqE7m3fLXWqndbpWAgAAQn2A=
Date:   Sat, 28 Nov 2020 12:46:42 +0000
Message-ID: <OSBPR01MB5048DD433E56143A04961153AAF70@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126191146.8753-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201128114145.GE4761@kozik-lap>
In-Reply-To: <20201128114145.GE4761@kozik-lap>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66405cb8-ba06-4776-087a-08d8939ba878
x-ms-traffictypediagnostic: OSBPR01MB5222:|OSBPR01MB4022:
x-microsoft-antispam-prvs: <OSBPR01MB522213659C8C711B9135B729AAF70@OSBPR01MB5222.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 206ScRzUfXLbzH8Xe6bKLrCxtzlvR7IFG2+A+hsg3lT6MYstEKftzgmtOvDoLSUagaHKEzZM6ORvl155g/lpqDANN/40AA2Zd6gVhaivMVJJ/R0D29796ZMxAJzncLXSmxAnd9Bi7IQDc9d+oPwAaJVIMqEShm8ooGPDgW8sa4YsPubTYyvpKGCLs6ULLS5lcJPE/638VGYj/dwVA+PRkR5Lib/QhHPXF/tkpBGygMDkdFzCHGXsUBTzyMOwN06wdSCB4QNpQ3+zHgTK5oo2JTYHfoNQRQhmzT8s6QNg41bOI2S3MdskUt9LfyjPYkKG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(39850400004)(346002)(71200400001)(64756008)(33656002)(66556008)(83380400001)(66946007)(86362001)(52536014)(66476007)(66446008)(76116006)(5660300002)(316002)(186003)(4326008)(53546011)(2906002)(26005)(55016002)(6916009)(7416002)(9686003)(8676002)(478600001)(8936002)(6506007)(54906003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UkZJRS9laGpMa1lIZ1FOZ0JnVVJ5L0FrQUQ3bHVFdWU1bVo3R2svdFZCV1JI?=
 =?utf-8?B?bXpDdEdxZFdFSGc1K0NiMEptWW9pRjVSYkFSRFUxSnF0aWpwbnBGNitxYnZT?=
 =?utf-8?B?RnBEZWQyZHowMnJPOGVSUWZqaXJmbHFKdmlvVzdKeFhMS0h1QTMyODFJdVFZ?=
 =?utf-8?B?ZTI2bmlCMEFjejd0VGM3OWs2M2FzOS9nOW5xQ2RnSEJmOXVCeDFiVDR1OGt3?=
 =?utf-8?B?c3FYQkdaOHF4RjR4UE4ycnNUWldYTStMdUVDVU44dGNiVy91a0ZzZlB0SWQ2?=
 =?utf-8?B?MFZjbzlxTTRYdlUvcS9ySmJWS1hsTGRabi9IRTNYR25pMTlEYmU2YnVJSVV0?=
 =?utf-8?B?NlRJUG1sS2gzYW1lWm5aY3ZtMXg2aVBodERCYzhVcS9vdHNjWndVa2ZWbWs1?=
 =?utf-8?B?ZHBNdzdBVUFiTlpmdGdjU3U0NmxSd1dDVkJRcHJWYVNKM2c5RUo2b29MTnpk?=
 =?utf-8?B?ZVk0S2pEaEJUQzdobUhKRUl6UGhiSXZ0MW9zNldlM3lxdkIwSjh1RUpwQUFs?=
 =?utf-8?B?Z0xzZUo4Q0Ria2k1QittdEhCSFFOYzFqcEEvSjlHWVlZdjArbWs5TEU0akJm?=
 =?utf-8?B?M1ZhRlRNekZHTkxoQW00ZDdzVFNud1dPUG5aUmVlbHFGR0szanZOZWN6WHRQ?=
 =?utf-8?B?Wk9xT21RTExMOGdLRElWaDNabGRFWU9PVk00YmV2YXhUdU1vY2dTRWdLMDdk?=
 =?utf-8?B?Tmhoa3g3RWg0Z0wzc0puWnpaVm9TRGllUGJ1dlg4bllRUEpkeHZMWFRSdUNW?=
 =?utf-8?B?OUxCK0hTTFlDUVE2WVR3RW1DcEJlczB4TzVIZGhvWElNc3kwbUh5MVMzL2RN?=
 =?utf-8?B?bUZBdk03TWhmbi8wQ0dOdDlqb0I1cE5aYm9WclJRV05FYmRHa3RGakdFYVVF?=
 =?utf-8?B?Yk5DZkp3UWQ4VmdqdVpyeFRPRVlGZXBRTksvZWV1ZmlrK1JpM0tmaFc4cDVv?=
 =?utf-8?B?bHhYb3VsYVJOMlhsbUp3UENtK0lxU3FUR2JxNXZrWWxmQUZiWmlaRThCTm1n?=
 =?utf-8?B?cU9GbmZEdE9UU0JkT1pCN0V0bi9Jc0piaTRneTVQWVo1L3lNenlHempvOEdP?=
 =?utf-8?B?QXhmaDRjdzZXSmhrR2V4U21rejJqNEJxMVYrM0RqSjc2MFR0bFNRTW82cHVl?=
 =?utf-8?B?cnptZ3JHbXZKTFVOMEIwVVhkeGpnL25ITG9Cb2w1d1Q5eVZhWm5FWnlhd3E4?=
 =?utf-8?B?b2ZhVEV6SHhLMElFeEtvZVZxOTl5ZVBHUU9zRmFCV0UzSFpCVDc4MHRIejgw?=
 =?utf-8?B?bGhMUDZ6azI2TUVSSnRuOHJGQ29YVXErUDBLQ0RUNHVzaS9pT3ZtNFVPUktG?=
 =?utf-8?Q?QWxuQtV8BmeIM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66405cb8-ba06-4776-087a-08d8939ba878
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 12:46:42.6009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/BmengISyrWBOYXWly6o/7n7spJL530z7yXhg+Z+/UXyG9AFH16KT/Dink2cn/Zzx+8R3KK8U/QLW58ih0T4ydDZFdpPn+UJlppvLBgrlqgKmB93vP50JxdhEv7IJm7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5222
X-OriginatorOrg: bp.renesas.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPg0KPiBTZW50OiAyOCBOb3ZlbWJlciAyMDIwIDExOjQyDQo+IFRvOiBQcmFiaGFrYXIg
TWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
Q2M6IFNlcmdlaSBTaHR5bHlvdiA8c2VyZ2VpLnNodHlseW92QGdtYWlsLmNvbT47IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBKaXJpIEtvc2luYQ0KPiA8dHJpdmlhbEBr
ZXJuZWwub3JnPjsgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgbGludXgtcmVuZXNh
cy1zb2NAdmdlci5rZXJuZWwub3JnOyBQYXZlbCBNYWNoZWsNCj4gPHBhdmVsQGRlbnguZGU+OyBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgUHJhYmhha2FyDQo+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA1LzVdIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6
IEV4cG9ydCBzeW1ib2xzIGFzIEdQTA0KPiANCj4gT24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgMDc6
MTE6NDZQTSArMDAwMCwgTGFkIFByYWJoYWthciB3cm90ZToNCj4gPiBSZW5lc2FzIFJQQy1JRiBk
cml2ZXIgaXMgbGljZW5zZWQgdW5kZXIgR1BMMi4wLCB0byBiZSBpbiBzeW5jIGV4cG9ydCB0aGUN
Cj4gPiBzeW1ib2xzIGFzIEdQTC4NCj4gDQo+IEl0J3Mgbm90IGEgdmFsaWQgcmVhc29uIHRvIGV4
cG9ydCB0aGVtIGFzIEdQTC4gRW50aXJlIExpbnV4IHNvdXJjZSBjb2RlDQo+IGlzIGxpY2Vuc2Vk
IGFzIEdQTC0yLjAsIHNvIGFyZSB5b3UgZ29pbmcgdG8gY2hhbmdlIGFsbCBFWFBPUlRfU1lNQk9M
IHRvDQo+IEdQTD8NCj4gDQpBZ3JlZWQgbm90IGEgdmFsaWQgY2FzZS4gVGhhdCBjbGVhcnMgbXkg
dW5kZXJzdGFuZGluZyB3cnQgR1BMIGV4cG9ydHMg8J+YiiANCg0KPiBQbGVhc2UgZGVzY3JpYmUg
aXQgYmV0dGVyLiBVc3VhbGx5IHRoZSBzeW1ib2xzIGFyZSBleHBvcnRlZCBhcyBHUEwgaWYNCj4g
dGhleSBhcmUgY29uc2lkZXJlZCB0aWdodGx5IGNvdXBsZWQgd2l0aCB0aGUga2VybmVsIGNvZGUu
IFNvIHRpZ2h0bHkNCj4gdGhhdCBiYXNpY2FsbHkgaXQgaXMgbm90IGEgaW50ZXJmYWNlIGFueW1v
cmUgYnV0IHBhcnQgb2Yga2VybmVsDQo+IGludGVybmFscyBhbmQgdGhlcmVmb3JlIGFueSB1c2Fn
ZSBvZiBpdCBpcyBhIGRlcml2YXRpdmUgd29yayBvZiBMaW51eA0KPiBrZXJuZWwuIElmIHRoaXMg
aXMgdGhlIGNhc2UgaGVyZSwgcGxlYXNlIGRlc2NyaWJlIGluIGNvbW1pdCBtc2cgd2h5DQo+IHRo
ZXNlIG1hdGNoIHRoaXMgY3JpdGVyaWEuDQo+IA0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNh
dGlvbi4gVGhlIHN5bWJvbHMgY2FuIHJlbWFpbiBleHBvcnRlZCB3aXRob3V0IEdQTCBhcyB0aGlz
IGlzIG5vdCB0aWdodGx5IGNvdXBsZWQgdG8gdGhlIGtlcm5lbC4NCg0KQ2hlZXJzLA0KUHJhYmhh
a2FyDQo=
