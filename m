Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461A845C847
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 16:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhKXPLt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 10:11:49 -0500
Received: from mail-tycjpn01on2090.outbound.protection.outlook.com ([40.107.114.90]:38666
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229865AbhKXPLo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:11:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oya3oNJtQLtlZr6dD5AvTeYktoV02YmKt46TqXQFpzEh1BOr+pI/+ZxF8rfXk2Ixdf92vv8bd9NoZCVXroLxeWtjLNAaj7QxHhgYG2mkZjZTqIuhC1H6oq0poQ9EvDhn6y/9pNf6mx24AsapFOQtVj6MmyxFunpcUVfeR9jHiJQFVi3UQM6ylYt2lHVGVuvILHUf5BMqVn4zabRSrznqBZOfGQq/yfy3zT3vgvc5bGJMQWmOu6Qmo3Cao2k1ptbbNiLXLaMuGHezvNxMzNo7OGrLrWAdnPu2JFpgS6wdoc9XnEeKDiJEcNplytHS/7MtL48Taz6DEamVCc70hL6TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h57LRwemVYeMZ4V9c0NdC4ep6+s9osSD4e4VTRlXC4=;
 b=RGBJWJSROVqEZmF62nmiBXOEz+RXbrAuFjDX7PBTtC4MIkqU6+QBZ8P36v8KWinKvasWtlGNehxeOvEFJwPu4hmPN1dqKSs7T24wUmlM7C1HpV2UjS+7cyC3voXgl75JVWzYY4rTxDyJeH1m/7cZYJzvN5BkIqdRixXZFh9owIeKwxWuqundqBlwW/v3lZgcyQEq7woM5vzZ0LsS4L2rhEJCV1kGBGvuOe9niAD7/QCsgZm/QiJ0pf8FO3aFuzcECGdfSEerwpManWaQfeI3RwTwQRhTOVgRCZJi5goycO51PG5Y+ttCR98+KJxYE7vaNt6msZ2pdoZGYkZW+P+o/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h57LRwemVYeMZ4V9c0NdC4ep6+s9osSD4e4VTRlXC4=;
 b=Ace3mkJrGgIdsrsfXnaLdjn6M56H87afFax1+ZMMirZdNgUcbsGs9abRZT6vVjQnyz57QnZ/W63MkzDZzd2EBtbooyV92+mQbwBQnyaaFNSSpybxCRD1/YnSVxtTGxof/zXclO9RHTB6MTB1UQi9ut80xjOdoH+2KVEKNVuUf2I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5877.jpnprd01.prod.outlook.com (2603:1096:604:c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 15:08:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 15:08:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/4] arm64: dts: renesas: r9a07g044: Add OPP table
Thread-Topic: [PATCH v2 4/4] arm64: dts: renesas: r9a07g044: Add OPP table
Thread-Index: AQHX15y9N2UGVy9eOEC/UkZC6xcR/qwS2WuAgAABSPA=
Date:   Wed, 24 Nov 2021 15:08:30 +0000
Message-ID: <OS0PR01MB5922767144BFBF8B0DA0843F86619@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
 <20211112081003.15453-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU5EfhoWRCrEa0qO4q6yAqwGu1SC-9En6xttM8i06g=8A@mail.gmail.com>
In-Reply-To: <CAMuHMdU5EfhoWRCrEa0qO4q6yAqwGu1SC-9En6xttM8i06g=8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 288fe6a8-9686-4368-f275-08d9af5c46ec
x-ms-traffictypediagnostic: OS3PR01MB5877:
x-microsoft-antispam-prvs: <OS3PR01MB58775EDE957D6E3C5B2F18B086619@OS3PR01MB5877.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fOqc7kENF/CvOwuwavK/8Xs0Ksbrtx8jc2hHNBZhto3b9OPgimc8TyWJcgcar9Ai7PFuclqwbh5QmZeVk703SW2vbxO3ppTrHh3fhnoZZesOERsH/n4GaEFdjDnPNqGa8dwpE4lMNWc+LNjkFJ6ho1xa0pJ2A3m7ITHEqW8iHMmSx5/pCPiEc4SpffQ6cE/j7+b24q/50ZAZpSOD0BuaVgWvUIY1/MsWBNjs1LHiTNN849LPXrOhq5Vx1cxRsqUhR+xVaEJi2Vw+pOsSbWLuxIAKP5skHNbblHNBAIIm53kHDjbEwrXydVTHj0EYdlJvSdFDwbugo/q+yMxesFD6F42ckp614Jhb9WKpDW1/j3PSkYKh0r8Y8rNFOnmpq4PnqAFbokZXqeTOBcb5CDlYbAww/FycoOStco50acrGGK2F9Nh0+ewdk1CLcnU0BD1YAGWoORrurfo/5eRTvrce2kZbk/uePShQmfGjnr6ulBcIUsZEDlkLW78X3/OFi3zYZPfiAW7wB25yVRBD1Y0qfCoI/YpTOQ+YvT1Ylx7KzLqh+wFlRR8U03DZEvK46Dl21xI6l44khEVaiPFvMqC0WSGhoJ8XuKXXt6kyD1PktUctYJGx6BjQm307ewXlwQN+fFchS58P+aMJqSpCz/k033DFsZ3gFjfaGXXZZNK3jRw448j/gpLzOoVAXnWWNsIH+Get8teg/LG8x3J6Vrz2UQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(7696005)(66446008)(186003)(64756008)(38100700002)(53546011)(2906002)(6916009)(316002)(107886003)(122000001)(8676002)(71200400001)(86362001)(4326008)(55016003)(33656002)(508600001)(52536014)(9686003)(83380400001)(66946007)(76116006)(66476007)(6506007)(8936002)(26005)(66556008)(5660300002)(54906003)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE9FcS9lNW1ZV3ZhbkRBaDZPN2VOR1ZTVXUrUEs4UHBaRTRZeE5jeTVGMjh1?=
 =?utf-8?B?VlFWZ0VTa0JXK3k4MDR6cGpyZEFUSnpsT2JjaTBJOFI1SDlDV2R6TUdoQ3R2?=
 =?utf-8?B?Wm84djhtQ0RVQ1J3NHEra1YrNWFCSmNxWk5pdWQ4V0JKazNPTHI1c1Z1WmRS?=
 =?utf-8?B?WHpmL0xXckhPS1RQU1I4MlpTMnVwT25SSEpudkJxY1hQVGp0RXl4bnVCVkFT?=
 =?utf-8?B?cXFsZnM3M3g0VUJ0VWh3NlZQZlQxRkY3c3VMbGxvU25XSExaOXloYldLSzg2?=
 =?utf-8?B?K3lLcmFyMSt5RXZHeE52YmFkYmFCRGFkUlAvN0d6R1RSeElWZmhmRlFOUEFn?=
 =?utf-8?B?dEJTeVZmOW53dmZCMGtjS2FUVzVnbENZRXhhSjFsd285MW5CQnNMbmMrQ0xX?=
 =?utf-8?B?OFZ2a01aYnFySFU3MWZURDZKeWI2T1V0am54SWtES1ZQcitETkMxQkd2S3cy?=
 =?utf-8?B?MUZpaHNoVkx5WW9ucFNTeTJvK2xXRFViMEYwb3dHR3dHMm1oS3pqajRQNkR2?=
 =?utf-8?B?VXhMWStRYm80c2dpVGg0QURFdzJmMU5IT1hSYWUyRER6SWg0QSsrWWVxMDJY?=
 =?utf-8?B?d2lUbzdrS0ZLak1MamdKYmZ4MmphQk1VbHUrZDZvK1RUR0tkTDQ3bFBGeDRK?=
 =?utf-8?B?ZXBDcld1ZkNDbHVRQ3FLeHVoRXhXOUdRUVdrQTN3azZRZENnREZEMHdQOHUr?=
 =?utf-8?B?a1FEODA4T0JBbjR0QUhHLzkvSEdKdkFTdVVhQ3E3allVUGQ2ZEd4U2pzQ3p2?=
 =?utf-8?B?VHFkcmdqTU9ySmVjbWRodmFyQVRjSG81ZC9VSnhrVmFiQmdmZzZJUzFiSkFR?=
 =?utf-8?B?YmFSNGVjRG9lbm1DZjZEWWZPK3JCeTFjdmlRVHdOWjhVeTc4T0VmUG1qNFEv?=
 =?utf-8?B?SHhqM3hBeC9yeVNySXllNmVJd2MyUnhKYzJuUWw1d2IyNDBiNElpemUxVDV3?=
 =?utf-8?B?WGFvMGNNR2drcHpFSEdlTUhOelpOQkhIVmJUa2M2c1lRUmN4TmZmMk1xaDBZ?=
 =?utf-8?B?bmxFMlBaMXZ2MTlBMnNVcjhqSmxiRVZZdTVaVFZaMWtFZzF6VFpuUkdFSDM1?=
 =?utf-8?B?dTFwV1hacGdLdGs3eUJJdFRYODR3M3owei93VmV1NFpRSE82Zjh5RnNoSlk3?=
 =?utf-8?B?UTY0dU9haThUaVkwbTRjZmRsMWhYOWRualpnWUQvdFQ2WGJKYXFNSGRXRVpr?=
 =?utf-8?B?RktYdXdzKzhpeGJxY045TDBJWGVUUndoWml6ekgrR1Z1UGt2a2doNGhRVUdV?=
 =?utf-8?B?aWdwNVRYRC8zQnJ4c1JUVDhvOWM0cVVQM25aZ2RYT2FjWW5jeW5xWjVVTmtT?=
 =?utf-8?B?elZHTGdsT1lXaW1hcWd4eWg2YjVlalFhQkh4SnVWalIyZUFaVmhBbWRERHVO?=
 =?utf-8?B?NWdMamx1anpVejBJU1o3UnYxdm1QRTBQcWQ0cmJ1Sml3MitXYVFqOGVZTnRu?=
 =?utf-8?B?LzNhUDdOMUt0QVpqeWljdlNTQVNCdjg4QW5WbGw4d2llWnc1OEFXN25zT3Bs?=
 =?utf-8?B?eFBPdFJCbHpnS2dPZnl0VmZTaStTVTc3aWdWem03N2lLbkxnTEJYZ2JWcWs1?=
 =?utf-8?B?MExneFpWNlRieU10aW9xaWpQdEVvWXNDc3J5bTh3REwySmJCOGQyMDdmNjVS?=
 =?utf-8?B?WlEvTlVneHZXK0VjL2ExR3RYWTNmR2VwMWpwTFM4R3VTR2NXTkZ5MGhxekll?=
 =?utf-8?B?TkZtUzczUEIyd2lWUDRBZFdzSEJmOWE2amUrSlk0R2p2aDUxTjhuM2dKRHp0?=
 =?utf-8?B?cWFid0dqcE8zaGsyRi9BaDQvQW1qK21McThqN0hOYVdmNnREU0RGREdpU1Q1?=
 =?utf-8?B?NHFGeXFiYUE0dndjOU5hSXBxQ3FFdWh1ODdOcnFqbGZ6dVkvM0N0SmdqWm5D?=
 =?utf-8?B?ZlRaa0FuSmJpSTBvWGFvKzJkdDFBYVgvR3VMSitnZHhmMVl1UDNjRHIxNzJ6?=
 =?utf-8?B?bzUvVjlPSE1QN21hWGpOcDdOOWFhQ1B4cUg0YXFCdzdra0sydXNESUJNbjJs?=
 =?utf-8?B?aDRBZkZ2OG16bjFmY1JxaWJ2Q2FZRGt2MEtpSFlPMElqV1V0U1dvRHlibTk0?=
 =?utf-8?B?SkFRenJqUHhPN0JrRCtGaTlIZkxkMWtxUWcxTHc0MTB6clhDbHVYKzEzVjNs?=
 =?utf-8?B?cW9DVVc2MDBWUUxoZDRYRldwNTRzNlVRaVZuNzZBNGpiUkt3T2NIMmp3bmtY?=
 =?utf-8?B?c1BBWXltVUpBRFlNdnhPTWNXTkZ4RTZaSGtZczRzQ2FxVkFyRmZzYU1oRnBx?=
 =?utf-8?B?MVRFUHhqZVY1ZnNZU1VzRW9qVUJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288fe6a8-9686-4368-f275-08d9af5c46ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 15:08:30.8564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqEMoW6KYol3EMAHM7qjaLcrcgiuYkBLg7kft4up3iEV3mUVMKI79VQ8pK+rzKoJo/ul3k2wACNGk6oirLdljLLQCCWx8/OU6aurouJY7I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5877
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEFkZCBPUFAgdGFi
bGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE5vdiAxMiwgMjAyMSBhdCA5OjEwIEFN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRk
IE9QUCB0YWJsZSBmb3IgUlovRzJMIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0t
LQ0KPiA+IFYxLT52MjoNCj4gPiAgKiBGaXhlZCB0eXBvIGNsdXN0ZXIxX29wcC0+Y2x1c3RlcjBf
b3BwDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDQuZHRzaQ0KPiA+IEBAIC00Miw2ICs0MiwzMiBAQA0K
PiA+ICAgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gICAgICAgICB9
Ow0KPiA+DQo+ID4gKyAgICAgICBjbHVzdGVyMF9vcHA6IG9wcF90YWJsZSB7DQo+IA0KPiAibWFr
ZSBkdGJzX2NoZWNrDQo+IERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvb3BwL29wcC12Mi55YW1sIg0KPiBkb2Vzbid0IGxpa2UgdGhlIG5vZGUgbmFtZS4N
Cg0KT0ssIFdpbGwgY2hlY2sgYW5kIHNlbmQgdGhlIGZpeCBhcyB2MyBmb3IgdGhpcyBwYXRjaC4N
Cg0KUmVnYXJkcywNCkJpanUNCg==
