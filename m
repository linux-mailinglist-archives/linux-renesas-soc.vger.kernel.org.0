Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F3F7ED928
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 03:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjKPCQI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 21:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjKPCQH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 21:16:07 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA99B8E;
        Wed, 15 Nov 2023 18:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiIFhd5Hez1a68ENPAT0z/iAKCG0BPbxHnaEHUonMDleU6+NDbjc8m0P/zrn1o7bhqUs+J4nDKpwk+eHzqDPwmXHD2juiW0WtJo+Ow5lYeIQN6H9oGbgLquhGcZlAKiLBPtIIqEP4Tyvuw2RxcXS+Nm5O77gaP/oh1fjEDLnk7E/HgFTaK6NY0QvimSQMnEvEkBkBv8MPIeuAjau5rX0Q48E0aMeFGNiMxb/7ll6oq4kV7XJREogXkXUtMRbOZ+Gs23U6kmF3kAzyJa4eIHN7znLFsVD4mDCeFFELKDvJvGdbbOH6/yRvTFEFoViIPtmMDZfGGOOcWLjNpUVLHZBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFtFpZ3wN9MrCTIp4tILZOsPD33eXQjuxa4F+Sk5LDA=;
 b=d8rkQ4I8fuZt71w1l2sbHIex6wHEGnd0P3XVhCIgaNlg+7nwomkyb7CgApT4QDI4lFmHBGTEMLGANQKXqDfu2fRCTMgOHzeLjmEeQFRjupclIm2cOEGZQdv/143qV6i5d3MRdAPIWisGpRPv1xIhp8lSYEvLFiKIEXZ7oWZL7WsO8vgB+I5oMcXrAG1T3rYoX8dUaU3ciSI8GnqUU2rLmtJhcZQQplMP3Dwul3V+5zLDr3WTnmQfOcV/gJjLBVfHWLGCRU61VxrD5P8hHLklngTpwj0sJs3b057+PBDQq/u3PtX6vbPTsXDKGiXltIq7+KSF3+2TMSlfiSC3n+rg3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFtFpZ3wN9MrCTIp4tILZOsPD33eXQjuxa4F+Sk5LDA=;
 b=Ohj+fk+qdRX4uRGnHOgGat17e3myGRAV6keY3/oyXB5VUBzHsQ0nRJ1PFXFs29fekucNIv0orWUXDL2nLmIEZvFTPMPxWLhzf3iwIscDtZa9/yxdIFse130Hh+QpqVhWoAczQaxy8fA0BImHaO1QkcOs2OgdHewN36XTlffHtzc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB6043.jpnprd01.prod.outlook.com
 (2603:1096:402:35::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 02:15:57 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 02:15:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaAoALb6SIWPIxUEiZAXqbN+NjubBRDKoAgCm+z2CAARNdAIAAWXCQ
Date:   Thu, 16 Nov 2023 02:15:57 +0000
Message-ID: <TYBPR01MB5341A4AE46EA9261469C735DD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
 <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
 <TYBPR01MB5341061AB0A805D0AF71FBB5D8B1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <69392d22-8ade-81aa-72b1-6a4abce8a4a7@omp.ru>
In-Reply-To: <69392d22-8ade-81aa-72b1-6a4abce8a4a7@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYAPR01MB6043:EE_
x-ms-office365-filtering-correlation-id: dbf4a274-ddcc-4884-e279-08dbe649f876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0KujazxFkakR2wI1TPOCpGf0IWqblKRC92O2Zb9PVLDPOFjYJIX4LBycOu2OyizJG+mbeEG2HbnFTXBtJAjmEfnYz4Fl6w0YzVnFSZDSteYx2hfep2tFPcDlw+P0ZXr9k8S3KflOtaG5Iu2tsM4fpd6shgpv/1xJbYx26Fr7NDcn4NV4eLHTwPIWN51u+B3nU0PAdh3PsoA1aeaJHXdqUy0XhrGAM+pBdEAIXkolGSEqqF9BJrhYJlRbkDTjkkGaIMombS8lCaJKqDQ1uGWnXl33tJkmgBMNtCOqaOWPKUQjP9zDxC4rkhSh7RVns9hCfrMMHC2WrS/7jTIBFfb0Ym3/j2MLiNjnE/KzfDU0A/csyaCg09QV/rYDpzL7Ge4rE7kO+CFmyJA0fMG7OnpCPnFUswa9Uyv/bHp9y8PypmMPfCwsSFxZl+V2tt7Ee7GxaddoMSgXzz1l4wo74gVQQozzcyPAklT8q/CPVuQwi9Nw4qCA2lkwPLXMSY23ku8C8ZcoU7fy/vVHvLxWMQJvgbmL1y2Q+4mS6Phg5tP1WNToL15WpapHQW0DVS8NmM3vr5D69M/zhVdCTOK93tVbiQ8v8uDTjTdR0Utj/7ZrYp6dIx7w6pem5prN/MiQUii3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(71200400001)(7696005)(53546011)(83380400001)(8936002)(76116006)(9686003)(5660300002)(8676002)(52536014)(4326008)(2906002)(41300700001)(478600001)(110136005)(64756008)(66556008)(66446008)(316002)(66476007)(66946007)(54906003)(122000001)(38100700002)(6506007)(38070700009)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bThvS2VtZytlaDZiT2g4RlNON2RtV2xJWnQ1dmFOWjcwWTNWVWRHa3ppY2hX?=
 =?utf-8?B?eXovOXM3dVRYNktWWUFGSk9wN2hQRk5lZGp2NWlyVGRLTjlDdmptdFhyKzM3?=
 =?utf-8?B?OGNQcjhFRDhXK1pBR05YU2FDYmRpa0xDVHJ1VzdxR3dtVTYrTGRUMGtCWDZl?=
 =?utf-8?B?MmFkbFNMMHRjMzkvR283MmovVFRvdjlUUjRBQzZ0MldvcXRtcE5Ic3liQzJq?=
 =?utf-8?B?L1JMU05ENVBwaVlrYnV1SndUTVlUb2cwZE04VWh5V04rUGdSVUJLVjNqR0RZ?=
 =?utf-8?B?dk1GWnd0MTA4MjRYOUFxMFlYYnNuOEQ3OFhZcGhTV3hOMFp3eFluYUNKRU1X?=
 =?utf-8?B?UkFtdytaOEFMMkpobndvQjA3WlFxSC9VS3dYMkRVSzZ5RUpSRHhVbDAwRzVu?=
 =?utf-8?B?N0pzMDA5QnNQeWtYdGRKclY3elRjaW00NThSYmRrMDJSbS82NmJjektGQlB2?=
 =?utf-8?B?UnRWSU1sRTd2SkJjMURKWGhhbmtPRnczak1aUGliN3RndHcvWDQrdTdRUHN0?=
 =?utf-8?B?VlhSa0JEa2FnNTJqcFAwUWVsd0creFd3aDJOWVB0c3FuTDlaNXdQakdvbDd2?=
 =?utf-8?B?RkR4NHdIYU1tU1Z6M1dNc0I1QzVUZ3lac2g2dy9GbmFsNlp3NENKdkZGZTJj?=
 =?utf-8?B?YXhkOWY4eHpwR3VSNTB0dG84T0ZkQmFkYU82a1JFR3VTUE95RG56REk0VWlS?=
 =?utf-8?B?Y3pBM0s2MG81MURuMnpNd3J1eFUwLzQrb1JwbmtOYUU0L3R2NFhpWkV0TFdv?=
 =?utf-8?B?dG1YQ284diswbW1UOXJYV0NXaGtNK3cyTTFtRS85MkkyY0dKeGxVVEJGbXRG?=
 =?utf-8?B?VGlMYU10V0lYN3N1YTVEWTFDZkcwb3pPUzJ0S2RObUQwQVN5Q0pNalZOWXo1?=
 =?utf-8?B?L1JQV1k0TTB3SXNZem13ZXQ5bkxtYmZHeXJrRmNxZFRFSnJFNUFrNXFSVVk5?=
 =?utf-8?B?WU92S2ZzaGRoRXd6WFlRdUpnTmpDZnNkU1dld3c0bi9VSXdNSk9BNFZZenF4?=
 =?utf-8?B?cXJZbVU3QnBxMmpJU3R5RDZvMGl5T0p0S3hHcmQvTFFGRXBMZzV1K1M5THc5?=
 =?utf-8?B?anNWWUFGeU1qZERlNC80cFMxa25FYnRKNnAvVFBmTGZDdHRHSlA0NEZNcUhW?=
 =?utf-8?B?UGgyVXY1NmFvRXpib0lsRlYwNzdrbGJHcWVFbEpURmVoMHMxTkd0RGNrbW9h?=
 =?utf-8?B?VjRXY1hkcVZRMWtLaXdVOHV6ak5QTm16aDdpVm5UTSs0ZGUwQVFkQWVSVkIx?=
 =?utf-8?B?UTdOZzhDVndCRlNqK3NNZXJHczkrekFWOU1LbHU4SXF5V1pFNG9jRkMrNnVM?=
 =?utf-8?B?ek1HMng0OTh6NlhrTjBlTXFaeTF1TmVkTWNuNTZjMDBmNDhBN0FlQ3hyYmdr?=
 =?utf-8?B?d21sdDIweTkva2trVmZRdUN5SmpsQU8xdEdHUjRDSjhHR1l5SVRsQ0RlLzlK?=
 =?utf-8?B?QmhuUkNmdllxMExXRG1kVGNnSElXblJnOW5NcEtHWENoek5WODVmUnVLSkI2?=
 =?utf-8?B?SFk2ZUxmT3dubGRmTXQ3VVFkQ0pCMkRDaGY1NjVSNUtTZURPeXl1UVhwTFJB?=
 =?utf-8?B?SmttZWp3VGJqNHBhR1pva0t1ZDk3U3M0V3MzSitub2pqRmFzSmNoYjB6NjNZ?=
 =?utf-8?B?ZitLRUJ1Q1U0ZXIwenJJZWc3TmdMWU5HYlNCWHErYWVGZnlUWDgxUGJKUUdw?=
 =?utf-8?B?TWV0NVBNVUUvUFQxVnI3NkE3TU9YaTVCZktxTVAvc3J0RU0xb2dLd2dla2ls?=
 =?utf-8?B?RlNldjU4MkNhUjNDWUhTSXJQa1VoOUpFY2xVQ3FVWnRBYzZpZVoyS1czVnpz?=
 =?utf-8?B?Qnp6N0crTUo3MWZscjZxQytkZzdBOXBtamIzM2l5MmdnOWN1eEs5RWNsQTFm?=
 =?utf-8?B?ckNJdUJXOXVIRmNIV3FoK1hidWVFMlBtSjl6QW5YbDRGbFNHbVhHZ0FUZUV5?=
 =?utf-8?B?cmxvOTYvY3lEZ1BaWkFkWDYxTXI5ZjJpRkFzTHRJM1hXamU3SU91TFRqWFY1?=
 =?utf-8?B?ZEljdVdINlc4VVJXSkRGVFREUlZUMUptY09EVUVZM3N3VVRJYlhQUWFSblNp?=
 =?utf-8?B?R0NjZTVEUXFybElVVWRhYnFnbFZHWXVwL0xlSkMvVGs5eitNaWtMenlDSjk1?=
 =?utf-8?B?YXRhQW5pck1veFY3NG1sMHZGdUx6NGhjcnk3ME9WN2tDejNzSlVVemphMHEx?=
 =?utf-8?B?Wnc1K2xXNkNwMmI3WEQ0dHRyU3BNdWRKK2JjYXVhdkdMNGlkSFV6S3NuOVJS?=
 =?utf-8?B?ZEErQ0NVY3VoaG44MkdYUjdvaU5RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf4a274-ddcc-4884-e279-08dbe649f876
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 02:15:57.8142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/rvkvNnUmfv5+MwwuH08qJteGjv5apADFbn76KfJl3/EZvWQ5egx6khDExFhm2qFbk0VMakUQrXDWZgmVxFfBjm1aGb1XqoAU8l6neRyoSUcFedYCSXvXn8ey/IMeEu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6043
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8sDQoNCj4gRnJvbTogU2VyZ2V5IFNodHlseW92LCBTZW50OiBUaHVyc2RheSwgTm92ZW1i
ZXIgMTYsIDIwMjMgMzozMSBBTQ0KPiANCj4gT24gMTEvMTUvMjMgNTowOSBBTSwgWW9zaGloaXJv
IFNoaW1vZGEgd3JvdGU6DQo+IFsuLi5dDQo+IA0KPiA+Pj4gRml4IHJhY2VzIGJldHdlZW4gcmF2
Yl90eF90aW1lb3V0X3dvcmsoKSBhbmQgZnVuY3Rpb25zIG9mIG5ldF9kZXZpY2Vfb3BzDQo+ID4+
PiBhbmQgZXRodG9vbF9vcHMgYnkgdXNpbmcgcnRubF90cnlsb2NrKCkgYW5kIHJ0bmxfdW5sb2Nr
KCkuIE5vdGUgdGhhdA0KPiA+Pj4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBydG5s
IGxvY2sgYW5kIGNhbGxzIGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPj4+IHJhdmJfdHhfdGltZW91
dF93b3JrKCkgc2hvdWxkIGNhbGxzIHJ0bmxfdHJ5bG9jaygpLiBPdGhlcndpc2UsIGEgZGVhZGxv
Y2sNCj4gPj4+IG1heSBoYXBwZW4gaW4gcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBsaWtlIGJlbG93
Og0KPiA+Pj4NCj4gPj4+IENQVTAJCQlDUFUxDQo+ID4+PiAJCQlyYXZiX3R4X3RpbWVvdXQoKQ0K
PiA+Pj4gCQkJc2NoZWR1bGVfd29yaygpDQo+ID4+PiAuLi4NCj4gPj4+IF9fZGV2X2Nsb3NlX21h
bnkoKQ0KPiA+Pj4gLy8gVW5kZXIgcnRubCBsb2NrDQo+ID4+PiByYXZiX2Nsb3NlKCkNCj4gPj4+
IGNhbmNlbF93b3JrX3N5bmMoKQ0KPiA+Pj4gLy8gV2FpdGluZw0KPiA+Pj4gCQkJcmF2Yl90eF90
aW1lb3V0X3dvcmsoKQ0KPiA+Pj4gCQkJcnRubF9sb2NrKCkNCj4gPj4+IAkJCS8vIFRoaXMgaXMg
cG9zc2libGUgdG8gY2F1c2UgYSBkZWFkbG9jaw0KPiA+Pj4NCj4gPj4+IEZpeGVzOiBjMTU2NjMz
ZjEzNTMgKCJSZW5lc2FzIEV0aGVybmV0IEFWQiBkcml2ZXIgcHJvcGVyIikNCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlv
dkBvbXAucnU+DQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYw0KPiA+Pj4gaW5kZXggMGVmMGI4OGI3MTQ1Li4zMDBjMTg4NWUxZTEg
MTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFp
bi5jDQo+ID4+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5j
DQo+ID4+PiBAQCAtMTg3NCw2ICsxODc0LDkgQEAgc3RhdGljIHZvaWQgcmF2Yl90eF90aW1lb3V0
X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+Pj4gIAlzdHJ1Y3QgbmV0X2Rldmlj
ZSAqbmRldiA9IHByaXYtPm5kZXY7DQo+ID4+PiAgCWludCBlcnJvcjsNCj4gPj4+DQo+ID4+PiAr
CWlmICghcnRubF90cnlsb2NrKCkpDQo+ID4+PiArCQlyZXR1cm47DQo+ID4+DQo+ID4+ICAgIEkg
d29uZGVyIGlmIHdlIHNob3VsZCByZXNjaGVkdWxlIHRoZSB3b3JrIGhlcmUuLi4NCj4gPg0KPiA+
IEkgdGhpbmsgc28uIEJ1dCwgaXQgc2hvdWxkIHJlc2NoZWR1bGUgdGhlIHdvcmsgaWYgdGhlIG5l
dGlmIGlzIHN0aWxsIHJ1bm5pbmcgYmVjYXVzZQ0KPiA+IFVzZS1hZnRlci1mcmVlIGlzc3VlIGhh
cHBlbnMgYWdhaW4gd2hlbiBjYW5jZWxfd29ya19zeW5jKCkgaXMgY2FsbGluZy4gQWxzbywgSSBh
bHNvIHRoaW5rDQo+ID4gd2Ugc2hvdWxkIHVzZSBzY2hlZHVsZV9kZWxheWVkX3dvcmsoKSBpbnN0
ZWFkLiBTbywgSSdsbCBzdWJtaXQgc3VjaCBhIHBhdGNoIGFzIHYzLg0KPiANCj4gICAgSSdtIG5v
dCByZWFsbHkgc3VyZSBhYm91dCB0aGF0IG9uZS4gTm90ZSB0aGF0IGNhbmNlbF93b3JrX3N5bmMo
KSBzaG91bGQNCj4gd29yayB3aXRoIHRoZSB3b3JrcyByZXF1ZXVlaW5nIHRoZW1zZWx2ZXMsIHRo
ZSBjb21tZW50cyBzYXkuLi4NCg0KSSdtIHNvcnJ5LCBJIGNvbXBsZXRlbHkgbWlzdG9vayB0byBl
eHBsYWluIHRoaXMuLi4gSSBzaG91bGQgaGF2ZSBzYWlkOg0KSXQgc2hvdWxkIG5vdCByZXNjaGVk
dWxlIHRoZSB3b3JrIGlmIHRoZSBuZXRpZiBpcyBub3QgcnVubmluZyBiZWNhdXNlDQogICAgICAg
ICAgfn5+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fg0KdXNlLWFmdGVy
LWZyZWUgaXNzdWUgaGFwcGVucyBhZ2FpbiB3aGVuIGNhbmNlbF93b3JrX3N5bmMoKSBpcyBjYWxs
ZWQgZnJvbSByYXZiX3JlbW92ZSgpLg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQoN
CkFsc28sIEkgY29tcGxldGVseSBtaXN1bmRlcnN0b29kIHRoZSBiZWhhdmlvciBvZiBjYW5jZWxf
e3NjaGVkdWxlX313b3JrX3N5bmMoKS4NCkluIHRoZSBmdW5jdGlvbihzKSwgc2luY2UgV09SS19T
VFJVQ1RfUEVORElOR19CSVQgaXMgc2V0LCBzY2hlZHVsZV97ZGVsYXllZF99d29yaygpDQp3aWxs
IG5vdCBzY2hlZHVsZSB0aGUgd29yayBhbnltb3JlLiBTbywgSSdsbCBkcm9wIGEgY29uZGl0aW9u
IG5ldGlmX3J1bm5pbmcoKQ0KZnJvbSB0aGUgcmF2Yl90eF90aW1lb3V0X3dvcmsoKS4NCg0KQmVz
dCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+
IFlvc2hpaGlybyBTaGltb2RhDQo+IA0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==
